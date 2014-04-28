#include "FiveWin.Ch"
#include "Factu.ch" 
#include "Report.ch"
#include "MesDbf.ch"
// #include "FastRepH.ch"

//---------------------------------------------------------------------------//

CLASS TFastProduccion FROM TFastReportInfGen
   
   DATA cType                             INIT "PRODUCCION"

   DATA oParteProduccion   
   DATA oMaterialProducido   
   DATA oMateriasPrimas
   DATA oPersonal   
   DATA oHorasPersonal
   DATA oMaquinasCostes   
   DATA oMaquinasParte   
   DATA oArticulos
   DATA oFamArt   
   DATA oAlmacen 
   
 

   METHOD lResource( cFld )

   METHOD Create()
   METHOD lGenerate()
   METHOD lValidRegister()

   METHOD OpenFiles()
   METHOD CloseFiles()

   METHOD DataReport( oFr )
   METHOD AddVariable()

   METHOD StartDialog()
   METHOD BuildTree()

   METHOD AddParteProducccion()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD lResource( cFld ) CLASS TFastProduccion

   ::lNewInforme     := .t.
   ::lDefCondiciones := .f.

   ::cSubTitle       := "Informe de producci�n"

   if !::NewResource()
      return .f.
   end if

   /*
   Carga controles-------------------------------------------------------------
   */

   if !::lGrupoOperacion( .t. )
      return .f.
   end if
   
   if !::lGrupoTOperacion( .t. )
      return .f.
   end if

   if !::lGrupoSeccion( .t. )
      return .f.
   end if

   if !::lGrupoAlmacen( .t. )
      return .f.
   end if

   if !::lGrupoArticulo( .t. )
      return .f.
   end if

   if !::lGrupoFamilia( .t. )
      return .f.
   end if

   if !::lGrupoGFamilia( .t. )
      return .f.
   end if
   
   if !::lGrupoTipoArticulo( .t. )
      return .f.
   end if

   if !::lGrupoCategoria( .t. )
      return .f.
   end if

   if !::lGrupoTemporada( .t. )
      return .f.
   end if

   if !::lGrupoOperario( .t. )
      return .t.
   end if

   if !::lGrupoMaquina( .t. )
      return .f.
   end if

   if !::lGrupoSerie( .t. )
      return .f.
   end if

   ::oFilter      := TFilterCreator():Init()
   if !Empty( ::oFilter )
      ::oFilter:SetDatabase( ::oDbf )
      ::oFilter:SetFilterType( FST_PRO )
   end if 

RETURN .t.

//---------------------------------------------------------------------------//

METHOD OpenFiles() CLASS TFastProduccion

   local lOpen    := .t.
   local oBlock
   local oError

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DATABASE NEW ::oParteProduccion     PATH ( cPatEmp() ) CLASS "PROCAB"      FILE "PROCAB.DBF"    VIA ( cDriver() ) SHARED INDEX "PROCAB.CDX"
      DATABASE NEW ::oMaterialProducido   PATH ( cPatEmp() ) CLASS "PROLIN"      FILE "PROLIN.DBF"    VIA ( cDriver() ) SHARED INDEX "PROLIN.CDX"
      DATABASE NEW ::oMateriasPrimas      PATH ( cPatEmp() ) CLASS "PROMAT"      FILE "PROMAT.DBF"    VIA ( cDriver() ) SHARED INDEX "PROMAT.CDX"
      DATABASE NEW ::oPersonal            PATH ( cPatEmp() ) CLASS "PROPER"      FILE "PROPER.DBF"    VIA ( cDriver() ) SHARED INDEX "PROPER.CDX"
      DATABASE NEW ::oHorasPersonal       PATH ( cPatEmp() ) CLASS "HORASPERS"   FILE "PROHPER.DBF"   VIA ( cDriver() ) SHARED INDEX "PROHPER.CDX"
      DATABASE NEW ::oMaquinasCostes      PATH ( cPatEmp() ) CLASS "MAQCOSL"     FILE "MAQCOSL.DBF"   VIA ( cDriver() ) SHARED INDEX "MAQCOSL.CDX"
      DATABASE NEW ::oMaquinasParte       PATH ( cPatEmp() ) CLASS "PROMAQ"      FILE "PROMAQ.DBF"    VIA ( cDriver() ) SHARED INDEX "PROMAQ.CDX"
      DATABASE NEW ::oArticulos           PATH ( cPatEmp() ) CLASS "ARTICULOS"   FILE "ARTICULO.DBF"  VIA ( cDriver() ) SHARED INDEX "ARTICULO.CDX"
      DATABASE NEW ::oFamArt              PATH ( cPatEmp() ) CLASS "FAMART"      FILE "FAMILIAS.DBF"  VIA ( cDriver() ) SHARED INDEX "FAMILIAS.CDX"
      DATABASE NEW ::oAlmacen             PATH ( cPatEmp() ) CLASS "ALMACEN"     FILE "ALMACEN.DBF"   VIA ( cDriver() ) SHARED INDEX "ALMACEN.CDX"

      ::oCnfFlt   := TDataCenter():oCnfFlt()

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir las bases de datos de producci�n" )

      ::CloseFiles()

      lOpen       := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseFiles() CLASS TFastProduccion

   if !Empty( ::oParteProduccion ) .and. ( ::oParteProduccion:Used() )
      ::oParteProduccion:end()
   end if

   if !Empty( ::oMaterialProducido ) .and. ( ::oMaterialProducido:Used() )
      ::oMaterialProducido:end()
   end if

   if !Empty( ::oMateriasPrimas ) .and. ( ::oMateriasPrimas:Used() )
      ::oMateriasPrimas:end()
   end if

   if !Empty( ::oPersonal ) .and. ( ::oPersonal:Used() )
      ::oPersonal:end()
   end if

   if !Empty( ::oHorasPersonal ) .and. ( ::oHorasPersonal:Used() )
      ::oHorasPersonal:end()
   end if

   if !Empty( ::oMaquinasCostes ) .and. ( ::oMaquinasCostes:Used() )
      ::oMaquinasCostes:end()
   end if

   if !Empty( ::oMaquinasParte ) .and. ( ::oMaquinasParte:Used() )
      ::oMaquinasParte:end()
   end if

   if !Empty( ::oArticulos ) .and. ( ::oArticulos:Used() )
      ::oArticulos:end()
   end if

   if !Empty( ::oFamArt ) .and. ( ::oFamArt:Used() )
      ::oFamArt:end()
   end if

   if !Empty( ::oAlmacen ) .and. ( ::oAlmacen:Used() )
      ::oAlmacen:end()
   end if

   if !Empty( ::oCnfFlt ) .and. ( ::oCnfFlt:Used() )
      ::oCnfFlt:end()
   end if

RETURN .t.

//---------------------------------------------------------------------------//

METHOD Create( uParam ) CLASS TFastProduccion

   ::AddField( "cSerDoc",     "C",  1, 0, {|| "" },   "Serie del documento"                     )
   ::AddField( "cNumDoc",     "C",  9, 0, {|| "" },   "N�mero del documento"                    )
   ::AddField( "cSufDoc",     "C",  2, 0, {|| "" },   "Delegaci�n del documento"                )
   ::AddField( "cIdeDoc",     "C", 27, 0, {|| "" },   "Identificador del documento"             )

   ::AddField( "nAnoDoc",     "N",  4, 0, {|| "" },   "A�o del documento"                       )
   ::AddField( "nMesDoc",     "N",  2, 0, {|| "" },   "Mes del documento"                       )
   ::AddField( "dFecDoc",     "D",  8, 0, {|| "" },   "Fecha del documento"                     )

   ::AddField( "cCodOpe",     "C",  3, 0, {|| "" },   "Operaci�n"                               )
   ::AddField( "cCodSec",     "C",  3, 0, {|| "" },   "Secci�n"                                 )

   ::AddField( "nTotDoc",     "N", 16, 6, {|| "" },   "Total documento"                         )
   ::AddField( "nTotPrd",     "N", 16, 6, {|| "" },   "Total producido"                         )
   ::AddField( "nTotMat",     "N", 16, 6, {|| "" },   "Total materias primas"                   )
   ::AddField( "nTotPer",     "N", 16, 6, {|| "" },   "Total horas personal"                    )
   ::AddField( "nTotMaq",     "N", 16, 6, {|| "" },   "Total maquinaria"                        )

   ::AddTmpIndex( "cNumDoc", "cSerDoc + cNumDoc + cSufDoc" )

RETURN ( self )

//---------------------------------------------------------------------------//

Method lValidRegister( cCodigoProveedor ) CLASS TFastProduccion

   if ( ::oDbf:cCodOpe >= ::oGrupoOperacion:Cargo:Desde     .and. ::oDbf:cCodOpe <= ::oGrupoOperacion:Cargo:Hasta )  .and.;
      ( ::oDbf:cCodSec >= ::oGrupoSeccion:Cargo:Desde       .and. ::oDbf:cCodSec <= ::oGrupoSeccion:Cargo:Hasta )

      Return .t.

   end if

/*
lGrupoOperacion
lGrupoTOperacion
lGrupoSeccion
lGrupoAlmacen
lGrupoArticulo
lGrupoFamilia
lGrupoGFamilia
lGrupoTipoArticulo
lGrupoCategoria
lGrupoTemporada
lGrupoOperario
lGrupoMaquina
*/

RETURN ( .f. )


//---------------------------------------------------------------------------//

METHOD AddParteProducccion() CLASS TFastProduccion
   local sTot
   local oError
   local oBlock
   local cExpHead
   
   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::oParteProduccion:OrdSetFocus( "dFecOrd" )

      cExpHead          := 'dFecOrd >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecOrd <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      cExpHead          += ' .and. cSerOrd >= "' + Rtrim( ::oGrupoSerie:Cargo:Desde ) + '" .and. cSerOrd <= "'    + Rtrim( ::oGrupoSerie:Cargo:Hasta ) + '"'

      ::oParteProduccion:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oParteProduccion:cFile ), ::oParteProduccion:OrdKey(), ( cExpHead ), , , , , , , , .t. )

      ::oMtrInf:cText   := "Procesando partes de producci�n"
      ::oMtrInf:SetTotal( ::oParteProduccion:OrdKeyCount() )

      ::oParteProduccion:GoTop()
      while !::lBreak .and. !::oParteProduccion:Eof()

         ::oDbf:Blank()

         ::oDbf:cSerDoc    := ::oParteProduccion:cSerOrd
         ::oDbf:cNumDoc    := Str( ::oParteProduccion:nNumOrd )
         ::oDbf:cSufDoc    := ::oParteProduccion:cSufOrd

         ::oDbf:nAnoDoc    := Year( ::oParteProduccion:dFecOrd )
         ::oDbf:nMesDoc    := Month( ::oParteProduccion:dFecOrd )
         ::oDbf:dFecDoc    := ::oParteProduccion:dFecOrd

         ::oDbf:cCodOpe    := ::oParteProduccion:cCodOpe
         ::oDbf:cCodSec    := ::oParteProduccion:cCodSec

         ::oDbf:nTotPrd    := nTotProd( ::oParteProduccion:cSerOrd + Str(::oParteProduccion:nNumOrd ) + ::oParteProduccion:cSufOrd, ::oMaterialProducido:cAlias )
         ::oDbf:nTotMat    := nTotMat( ::oParteProduccion:cSerOrd + Str(::oParteProduccion:nNumOrd ) + ::oParteProduccion:cSufOrd, ::oMateriasPrimas:cAlias )
         ::oDbf:nTotPer    := nTotPer( ::oParteProduccion:cSerOrd + Str(::oParteProduccion:nNumOrd ) + ::oParteProduccion:cSufOrd, ::oHorasPersonal:cAlias )
         ::oDbf:nTotMaq    := nTotMaq( ::oParteProduccion:cSerOrd + Str(::oParteProduccion:nNumOrd ) + ::oParteProduccion:cSufOrd, ::oMaquinasParte:cAlias )
         ::oDbf:nTotDoc    := nTotParte( ::oParteProduccion:cSerOrd + Str(::oParteProduccion:nNumOrd ) + ::oParteProduccion:cSufOrd, ::oMaterialProducido:cAlias, ::oMateriasPrimas:cAlias, ::oHorasPersonal:cAlias, ::oMaquinasParte:cAlias )

         /*
         A�adimos un nuevo registro--------------------------------------------
         */

         if ::lValidRegister()
            ::oDbf:Insert()
         else
            ::oDbf:Cancel()
         end if

         ::oParteProduccion:Skip()

         ::oMtrInf:AutoInc()

      end while

      ::oParteProduccion:IdxDelete( cCurUsr(), GetFileNoExt( ::oParteProduccion:cFile ) )
   
   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible a�adir partes de producci�n" )

   END SEQUENCE

   ErrorBlock( oBlock )

   ::oMtrInf:SetTotal( ::oDbf:OrdKeyCount() )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD StartDialog() CLASS TFastProduccion

   ::CreateTreeImageList()

   ::BuildTree()

 RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD BuildTree( oTree, lLoadFile ) CLASS TFastProduccion

   local aReports

   DEFAULT oTree     := ::oTreeReporting
   DEFAULT lLoadFile := .t.

   aReports          := {  {  "Title" => "Partes de produccion", "Image" => 14, "Type" => "Partes de produccion", "Directory" => "Produccion", "File" => "Partes de produccion.fr3"  } }

   ::BuildNode( aReports, oTree, lLoadFile )

   //oTree:ExpandAll()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD DataReport( oFr ) CLASS TFastProduccion

   /*
   Zona de detalle-------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Informe", ::oDbf:nArea )
   ::oFastReport:SetFieldAliases(   "Informe", cObjectsToReport( ::oDbf ) )

   /*
   Zona de datos---------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Empresa",                       ::oDbfEmp:nArea )
   ::oFastReport:SetFieldAliases(   "Empresa",                       cItemsToReport( aItmEmp() ) )

   ::oFastReport:SetWorkArea(       "Lineas de material producido",  ::oMaterialProducido:nArea )
   ::oFastReport:SetFieldAliases(   "Lineas de material producido",  cObjectsToReport( TDetProduccion():DefineFiles()  ) )

   ::oFastReport:SetWorkArea(       "Lineas de materias primas",     ::oMateriasPrimas:nArea )
   ::oFastReport:SetFieldAliases(   "Lineas de materias primas",     cObjectsToReport( TDetMaterial():DefineFiles()  ) )

   ::oFastReport:SetWorkArea(       "Lineas de personal",            ::oPersonal:nArea )
   ::oFastReport:SetFieldAliases(   "Lineas de personal",            cObjectsToReport( TDetPersonal():DefineFiles() ) )

   ::oFastReport:SetWorkArea(       "Lineas de horas de personal",   ::oHorasPersonal:nArea )
   ::oFastReport:SetFieldAliases(   "Lineas de horas de personal",   cObjectsToReport( TDetHorasPersonal():DefineFiles()  ) )

   ::oFastReport:SetWorkArea(       "Lineas de maquinaria",          ::oMaquinasParte:nArea )
   ::oFastReport:SetFieldAliases(   "Lineas de maquinaria",          cObjectsToReport( TDetMaquina():DefineFiles()  ) )

   ::oFastReport:SetWorkArea(       "Operarios",                     ::oOperario:oDbf:nArea )
   ::oFastReport:SetFieldAliases(   "Operarios",                     cObjectsToReport( TOperarios():DefineFiles() ) )

   ::oFastReport:SetWorkArea(       "Articulos.Material producido",  ::oArticulos:nArea )
   ::oFastReport:SetFieldAliases(   "Articulos.Material producido",  cItemsToReport( aItmArt() ) )

   ::oFastReport:SetWorkArea(       "Articulos.Materias primas",     ::oArticulos:nArea )
   ::oFastReport:SetFieldAliases(   "Articulos.Materias primas",     cItemsToReport( aItmArt() ) )

   ::oFastReport:SetWorkArea(       "Maquinaria",                    ::oMaquina:nArea )
   ::oFastReport:SetFieldAliases(   "Maquinaria",                    cObjectsToReport( TMaquina():DefineFiles()  )  )

   /*
   Relaciones------------------------------------------------------------------
   */

   ::oFastReport:SetMasterDetail(   "Informe", "Empresa",                                             {|| cCodEmp() } )
   ::oFastReport:SetMasterDetail(   "Informe", "Lineas de material producido",                        {|| ::oDbf:cSerDoc + ::oDbf:cNumDoc + ::oDbf:cSufDoc } )
   ::oFastReport:SetMasterDetail(   "Informe", "Lineas de materias primas",                           {|| ::oDbf:cSerDoc + ::oDbf:cNumDoc + ::oDbf:cSufDoc } )
   ::oFastReport:SetMasterDetail(   "Informe", "Lineas de personal",                                  {|| ::oDbf:cSerDoc + ::oDbf:cNumDoc + ::oDbf:cSufDoc } )
   ::oFastReport:SetMasterDetail(   "Informe", "Lineas de costo de maquinaria",                       {|| ::oDbf:cSerDoc + ::oDbf:cNumDoc + ::oDbf:cSufDoc } )

   ::oFastReport:SetMasterDetail(   "Lineas de personal", "Operarios",                                {|| ::oPersonal:cCodTra } )
   ::oFastReport:SetMasterDetail(   "Lineas de personal", "Lineas de horas de personal",              {|| ::oPersonal:cSerOrd + Str( ::oPersonal:nNumOrd) + ::oPersonal:cSuford + ::oPersonal:cCodTra } )
   
   ::oFastReport:SetMasterDetail(   "Lineas de horas de personal", "Operarios",                       {|| ::oHorasPersonal:cCodTra } )


   ::oFastReport:SetMasterDetail(   "Lineas de material producido", "Articulos.Material producido",   {|| ::oMaterialProducido:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Lineas de materias primas", "Articulos.Materias primas",         {|| ::oMateriasPrimas:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Lineas de maquinaria", "Maquinaria",                             {|| ::oMaquinasParte:cCodMaq } )

   ::oFastReport:SetResyncPair(     "Informe", "Empresa" )
   ::oFastReport:SetResyncPair(     "Informe", "Lineas de material producido" )
   ::oFastReport:SetResyncPair(     "Informe", "Lineas de materias primas" )
   ::oFastReport:SetResyncPair(     "Informe", "Lineas de personal" )
   ::oFastReport:SetResyncPair(     "Informe", "Lineas de costo de maquinaria" )

   ::oFastReport:SetResyncPair(     "Lineas de personal", "Lineas de horas de personal" )
   ::oFastReport:SetResyncPair(     "Lineas de personal", "Operarios" )
   ::oFastReport:SetResyncPair(     "Lineas de material producido", "Articulos.Material producido" )
   ::oFastReport:SetResyncPair(     "Lineas de materias primas", "Articulos.Materias primas" )
   ::oFastReport:SetResyncPair(     "Lineas de maquinaria", "Maquinaria" )

   //----------------------------------------------------------

   ::AddVariable()

Return ( Self )

//---------------------------------------------------------------------------//

METHOD AddVariable() CLASS TFastProduccion 

   /*
   Tablas en funcion del tipo de informe---------------------------------------
   */
   // al tener solo un tipo de de informe no necesitamos el case
   
   ::AddVariableLineasParteProduccion()

Return ( Super:AddVariable() )

//---------------------------------------------------------------------------//

METHOD lGenerate() CLASS TFastProduccion

   ::oDbf:Zap()

   /*
   Recorremos los partes de produccion------------------------------------------------------
   */

   ::AddParteProducccion()

   ::oDbf:SetFilter( ::oFilter:cExpresionFilter )

   ::oDbf:GoTop()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//
