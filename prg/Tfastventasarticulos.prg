#include "FiveWin.ch"  
#include "Factu.ch" 
#include "Report.ch"
#include "MesDbf.ch"

// #include "FastRepH.ch"

//---------------------------------------------------------------------------//

CLASS TFastVentasArticulos FROM TFastReportInfGen

   DATA  cType                            INIT "Articulos"

   DATA  lUnidadesNegativo                INIT .f.

   DATA  oProCab
   DATA  oProLin
   DATA  oProMat
   DATA  oHisMov
   DATA  oArtPrv
   DATA  oArtAlm

   DATA  oStock

   METHOD lResource( cFld )

   METHOD Create()
   METHOD lValidRegister()

   METHOD OpenFiles()
   METHOD CloseFiles()

   METHOD DataReport()

   METHOD StartDialog()

   METHOD BuildTree()
   METHOD BuildReportCorrespondences()

   METHOD AddSATClientes()
   METHOD AddPresupuestoClientes()
   METHOD AddPedidoClientes()
   METHOD AddAlbaranCliente()
   METHOD AddFacturaCliente()
   METHOD AddFacturaRectificativa()
   METHOD AddTicket()

   METHOD AddArticulo()
      METHOD appendStockArticulo()
      METHOD appendBlankAlmacenes()
      METHOD appendBlankArticulo()   
      METHOD existeArticuloInforme()
      METHOD fillFromArticulo()
   
   METHOD listadoArticulo()

   METHOD AddParteProduccion()

   METHOD AddPedidoProveedor()
   METHOD AddAlbaranProveedor()
   METHOD AddFacturaProveedor()
   METHOD AddRectificativaProveedor()

   METHOD cIdeDocumento()                 INLINE ( ::oDbf:cClsDoc + ::oDbf:cSerDoc + ::oDbf:cNumDoc + ::oDbf:cSufDoc ) 
            
   METHOD StockArticulo()                 INLINE ( ::oStock:nStockAlmacen( ::oDbf:cCodArt, ::oDbf:cCodAlm, ::oDbf:cValPr1, ::oDbf:cValPr2, ::oDbf:cLote ) )

   METHOD nTotalStockArticulo()           INLINE ( ::oStock:nStockArticulo( ::oDbf:cCodArt ) )

   METHOD nCostoMedio()                   INLINE ( ::oStock:nCostoMedio( ::oDbf:cCodArt, ::oDbf:cCodAlm ) )
   METHOD nCostoMedioPropiedades()        INLINE ( ::oStock:nCostoMedio( ::oStock:oDbfStock:cCodigo, ::oStock:oDbfStock:cAlmacen, ::oStock:oDbfStock:cCodPrp1, ::oStock:oDbfStock:cCodPrp2, ::oStock:oDbfStock:cValPrp1, ::oStock:oDbfStock:cValPrp2, ::oStock:oDbfStock:cLote ) )

   METHOD aStockArticulo()                INLINE ( ::oStock:aStockArticulo( ::oDbf:cCodArt ) )

   METHOD SetUnidadesNegativo( lValue )   INLINE ( ::lUnidadesNegativo := lValue )

   METHOD AddVariableStock() 

END CLASS

//----------------------------------------------------------------------------//

METHOD lResource( cFld ) CLASS TFastVentasArticulos

   ::lNewInforme     := .t.
   ::lDefCondiciones := .f.

   ::cSubTitle       := "Informe de art�culos"

   if !::NewResource()
      return .f.
   end if

   /*
   Carga controles-------------------------------------------------------------
   */

   if !::lGrupoArticulo( .t. )
      return .f.
   end if

   if !::lGrupoFamilia( .t. )
      return .f.
   end if

   if !::lGrupoIva( .t. )
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

   if !::lGrupoFabricante( .t. )
      return .f.
   end if

   if !::lGrupoCliente( .t. )
      return .f.
   end if

   if !::lGrupoGrupoCliente( .t. )
      return .f.
   end if

   if !::lGrupoProveedor( .t. )
      return .f.
   end if

   if !::lGrupoAlmacen( .t. )
      return .f.
   end if

   if !::lGrupoFpago( .t. )
      return .f.
   end if

   if !::lGrupoRuta( .t. )
      return .f.
   end if

   if !::lGrupoAgente( .t. )
      return .f.
   end if

   if !::lGrupoTransportista( .t. )
      return .f.
   end if

   if !::lGrupoUsuario( .t. )
      return .f.
   end if

   if !::lGrupoSerie( .t. )
      return .f.
   end if

   if !::lGrupoNumero( .t. )
      return .f.
   end if

   if !::lGrupoSufijo( .t. )
      return .f.
   end if

   ::oFilter      := TFilterCreator():Init()
   if !Empty( ::oFilter )
      ::oFilter:SetDatabase( ::oDbf )
      ::oFilter:SetFilterType( ART_TBL )
   end if 

RETURN .t.

//---------------------------------------------------------------------------//

METHOD OpenFiles() CLASS TFastVentasArticulos

   local lOpen    := .t.
   local oError
   local oBlock   

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DATABASE NEW ::oArtImg  PATH ( cPatArt() ) CLASS "ArtImg"      FILE "ArtImg.Dbf"  VIA ( cDriver() ) SHARED INDEX "ArtImg.Cdx"

      DATABASE NEW ::oArtKit  PATH ( cPatArt() ) CLASS "ArtKit"      FILE "ArtKit.Dbf"  VIA ( cDriver() ) SHARED INDEX "ArtKit.Cdx"

      DATABASE NEW ::oArtCod  PATH ( cPatArt() ) CLASS "ArtCodebar"  FILE "ArtCodebar.Dbf"  VIA ( cDriver() ) SHARED INDEX "ArtCodebar.Cdx"

      ::oSatCliT  := TDataCenter():oSatCliT()

      DATABASE NEW ::oSatCliL PATH ( cPatEmp() ) CLASS "SatCliL"     FILE "SatCliL.Dbf" VIA ( cDriver() ) SHARED INDEX "SatCliL.Cdx"

      ::oPreCliT  := TDataCenter():oPreCliT()

      DATABASE NEW ::oPreCliL PATH ( cPatEmp() ) CLASS "PreCliL"     FILE "PreCliL.Dbf" VIA ( cDriver() ) SHARED INDEX "PreCliL.Cdx"

      ::oPedCliT := TDataCenter():oPedCliT()

      DATABASE NEW ::oPedCliL PATH ( cPatEmp() ) CLASS "PedCliL"     FILE "PedCliL.Dbf" VIA ( cDriver() ) SHARED INDEX "PedCliL.Cdx"

      ::oAlbCliT := TDataCenter():oAlbCliT()

      DATABASE NEW ::oAlbCliL PATH ( cPatEmp() ) CLASS "ALBCLIL"     FILE "ALBCLIL.Dbf" VIA ( cDriver() ) SHARED INDEX "ALBCLIL.Cdx"

      ::oFacCliT  := TDataCenter():oFacCliT()  

      DATABASE NEW ::oFacCliL PATH ( cPatEmp() ) CLASS "FACCLIL"     FILE "FACCLIL.Dbf"   VIA ( cDriver() ) SHARED INDEX "FACCLIL.Cdx"

      DATABASE NEW ::oFacRecT PATH ( cPatEmp() ) CLASS "FACRECT"     FILE "FACRECT.Dbf"   VIA ( cDriver() ) SHARED INDEX "FACRECT.Cdx"

      DATABASE NEW ::oFacRecL PATH ( cPatEmp() ) CLASS "FACRECL"     FILE "FACRECL.Dbf"   VIA ( cDriver() ) SHARED INDEX "FACRECL.Cdx"

      DATABASE NEW ::oTikCliT PATH ( cPatEmp() ) CLASS "TIKET"       FILE "TIKET.Dbf"     VIA ( cDriver() ) SHARED INDEX "TIKET.Cdx"

      DATABASE NEW ::oTikCliL PATH ( cPatEmp() ) CLASS "TIKEL"       FILE "TIKEL.Dbf"     VIA ( cDriver() ) SHARED INDEX "TIKEL.Cdx"

      DATABASE NEW ::oPedPrvT PATH ( cPatEmp() ) CLASS "PedPrvT"     FILE "PedProvT.Dbf"  VIA ( cDriver() ) SHARED INDEX "PedProvT.Cdx"

      DATABASE NEW ::oPedPrvL PATH ( cPatEmp() ) CLASS "PedPrvL"     FILE "PedProvL.Dbf"  VIA ( cDriver() ) SHARED INDEX "PedProvL.Cdx"

      DATABASE NEW ::oAlbPrvT PATH ( cPatEmp() ) CLASS "AlbPrvT"     FILE "AlbProvT.Dbf"  VIA ( cDriver() ) SHARED INDEX "AlbProvT.Cdx"

      DATABASE NEW ::oAlbPrvL PATH ( cPatEmp() ) CLASS "AlbPrvL"     FILE "AlbProvL.Dbf"  VIA ( cDriver() ) SHARED INDEX "AlbProvL.Cdx"

      DATABASE NEW ::oFacPrvT PATH ( CPATEMP() ) CLASS "FacPrvT"     FILE "FacPrvT.Dbf"   VIA ( cDriver() ) SHARED INDEX "FacPrvT.Cdx"

      DATABASE NEW ::oFacPrvL PATH ( cPatEmp() ) CLASS "FacPrvL"     FILE "FacPrvL.Dbf"   VIA ( cDriver() ) SHARED INDEX "FacPrvL.Cdx"

      DATABASE NEW ::oRctPrvT PATH ( cPatEmp() ) CLASS "RctPrvT"     FILE "RctPrvT.Dbf"   VIA ( cDriver() ) SHARED INDEX "RctPrvT.Cdx"

      DATABASE NEW ::oRctPrvL PATH ( cPatEmp() ) CLASS "RctPrvL"     FILE "RctPrvL.Dbf"   VIA ( cDriver() ) SHARED INDEX "RctPrvL.Cdx"

      DATABASE NEW ::oProMat  PATH ( cPatEmp() ) CLASS "ProMat"      FILE "ProMat.Dbf"    VIA ( cDriver() ) SHARED INDEX "ProMat.Cdx"

      DATABASE NEW ::oHisMov  PATH ( cPatEmp() ) CLASS "HisMov"      FILE "HisMov.Dbf"    VIA ( cDriver() ) SHARED INDEX "HisMov.Cdx"

      DATABASE NEW ::oArtPrv  PATH ( cPatEmp() ) CLASS "ArtPrv"      FILE "ProvArt.Dbf"   VIA ( cDriver() ) SHARED INDEX "ProvArt.Cdx"

      DATABASE NEW ::oArtAlm  PATH ( cPatEmp() ) CLASS "ArtAlm"      FILE "ArtAlm.Dbf"   VIA ( cDriver() ) SHARED INDEX "ArtAlm.Cdx"

      ::oProCab   := TDataCenter():oProCab()

      ::oProLin   := TDataCenter():oProLin()

      ::oCnfFlt   := TDataCenter():oCnfFlt()

      /*
      Stocks de articulos------------------------------------------------------
      */

      ::oStock    := TStock():Create( cPatGrp() )
      if !::oStock:lOpenFiles()
         
         lOpen    := .f.

      else 

         ::oStock:CreateTemporalFiles()

      end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir las bases de datos de art�culos" )

      ::CloseFiles()

      lOpen       := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseFiles() CLASS TFastVentasArticulos

   local oBlock   

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      if !Empty( ::oArtImg ) .and. ( ::oArtImg:Used() )
         ::oArtImg:end()
      end if

      if !Empty( ::oArtKit ) .and. ( ::oArtKit:Used() )
         ::oArtKit:end()
      end if

      if !Empty( ::oArtCod ) .and. ( ::oArtCod:Used() )
         ::oArtCod:end()
      end if

      if !Empty( ::oSatCliT ) .and. ( ::oSatCliT:Used() )
         ::oSatCliT:end()
      end if

      if !Empty( ::oSatCliL ) .and. ( ::oSatCliL:Used() )
         ::oSatCliL:end()
      end if

      if !Empty( ::oPreCliL ) .and. ( ::oPreCliL:Used() )
         ::oPreCliL:end()
      end if

      if !Empty( ::oPreCliT ) .and. ( ::oPreCliT:Used() )
         ::oPreCliT:end()
      end if

      if !Empty( ::oPedCliL ) .and. ( ::oPedCliL:Used() )
         ::oPedCliL:end()
      end if

      if !Empty( ::oPedCliT ) .and. ( ::oPedCliT:Used() )
         ::oPedCliT:end()
      end if

      if !Empty( ::oAlbCliL ) .and. ( ::oAlbCliL:Used() )
         ::oAlbCliL:end()
      end if

      if !Empty( ::oAlbCliT ) .and. ( ::oAlbCliT:Used() )
         ::oAlbCliT:end()
      end if

      if !Empty( ::oFacCliL ) .and. ( ::oFacCliL:Used() )
         ::oFacCliL:end()
      end if

      if !Empty( ::oFacCliT ) .and. ( ::oFacCliT:Used() )
         ::oFacCliT:end()
      end if

      if !Empty( ::oFacRecL ) .and. ( ::oFacRecL:Used() )
         ::oFacRecL:end()
      end if

      if !Empty( ::oFacRecT ) .and. ( ::oFacRecT:Used() )
         ::oFacRecT:end()
      end if

      if !Empty( ::oTikCliT ) .and. ( ::oTikCliT:Used() )
         ::oTikCliT:End()
      end if

      if !Empty( ::oTikCliL ) .and. ( ::oTikCliL:Used() )
         ::oTikCliL:End()
      end if

      if !Empty( ::oPedPrvL ) .and. ( ::oPedPrvL:Used() )
         ::oPedPrvL:end()
      end if

      if !Empty( ::oPedPrvT ) .and. ( ::oPedPrvT:Used() )
         ::oPedPrvT:end()
      end if

      if !Empty( ::oAlbPrvL ) .and. ( ::oAlbPrvL:Used() )
         ::oAlbPrvL:end()
      end if

      if !Empty( ::oAlbPrvT ) .and. ( ::oAlbPrvT:Used() )
         ::oAlbPrvT:end()
      end if

      if !Empty( ::oFacPrvL ) .and. ( ::oFacPrvL:Used() )
         ::oFacPrvL:end()
      end if

      if !Empty( ::oFacPrvT ) .and. ( ::oFacPrvT:Used() )
         ::oFacPrvT:end()
      end if

      if !Empty( ::oRctPrvL ) .and. ( ::oRctPrvL:Used() )
         ::oRctPrvL:end()
      end if

      if !Empty( ::oRctPrvT ) .and. ( ::oRctPrvT:Used() )
         ::oRctPrvT:end()
      end if

      if !Empty( ::oProLin ) .and. ( ::oProLin:Used() )
         ::oProLin:end()
      end if

      if !Empty( ::oProMat ) .and. ( ::oProMat:Used() )
         ::oProMat:end()
      end if

      if !Empty( ::oHisMov ) .and. ( ::oHisMov:Used() )
         ::oHisMov:end()
      end if

      if !Empty( ::oArtPrv ) .and. ( ::oArtPrv:Used() )
         ::oArtPrv:end()
      end if

      if !Empty( ::oArtAlm ) .and. ( ::oArtAlm:Used() )
         ::oArtAlm:end()
      end if

      if !Empty( ::oProCab ) .and. ( ::oProCab:Used() )
         ::oProCab:end()
      end if 

      if !Empty( ::oCnfFlt ) .and. ( ::oCnfFlt:Used() )
         ::oCnfFlt:end()
      end if

      if !Empty( ::oStock )
         ::oStock:DeleteTemporalFiles()
         ::oStock:End()
      end if

   RECOVER

      msgStop( "Imposible cerrar todas las bases de datos" )

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN .t.

//---------------------------------------------------------------------------//

METHOD Create( uParam ) CLASS TFastVentasArticulos

   ::uParam    := uParam

   ::AddField( "cCodArt",     "C", 18, 0, {|| "@!" }, "C�digo art�culo"                         )
   ::AddField( "cNomArt",     "C",100, 0, {|| ""   }, "Nombre art�culo"                         )

   ::AddField( "cCodFam",     "C", 16, 0, {|| "@!" }, "C�digo familia"                          )
   ::AddField( "TipoIva",     "C",  1, 0, {|| "@!" }, "C�digo del tipo de " + cImp()            )
   ::AddField( "cCodTip",     "C", 18, 0, {|| "@!" }, "C�digo del tipo de art�culo"             )
   ::AddField( "cCodCate",    "C",  3, 0, {|| "@!" }, "C�digo categor�a"                        )
   ::AddField( "cCodTemp",    "C",  3, 0, {|| "@!" }, "C�digo temporada"                        )
   ::AddField( "cCodFab",     "C",  3, 0, {|| "@!" }, "C�digo fabricante"                       )
   ::AddField( "cCodGrp",     "C", 12, 0, {|| "@!" }, "C�digo grupo de cliente"                 )
   ::AddField( "cCodAlm",     "C", 16, 0, {|| "@!" }, "C�digo del almac�n"                      )
   ::AddField( "cCodPago",    "C",  2, 0, {|| "@!" }, "C�digo de la forma de pago"              )
   ::AddField( "cCodRut",     "C", 12, 0, {|| "@!" }, "C�digo de la ruta"                       )
   ::AddField( "cCodAge",     "C", 12, 0, {|| "@!" }, "C�digo del agente"                       )
   ::AddField( "cCodTrn",     "C", 12, 0, {|| "@!" }, "C�digo del transportista"                )
   ::AddField( "cCodUsr",     "C",  3, 0, {|| "@!" }, "C�digo usuario"                          )

   ::AddField( "cCodCli",     "C", 12, 0, {|| "@!" }, "C�digo cliente/proveedor"                )
   ::AddField( "cNomCli",     "C", 80, 0, {|| "@!" }, "Nombre cliente/proveedor"                )
   ::AddField( "cPobCli",     "C", 35, 0, {|| "@!" }, "Poblaci�n cliente/proveedor"             )
   ::AddField( "cPrvCli",     "C", 20, 0, {|| "@!" }, "Provincia cliente/proveedor"             )
   ::AddField( "cPosCli",     "C", 15, 0, {|| "@!" }, "C�digo postal cliente/proveedor"         )

   ::AddField( "nUniArt",     "N", 16, 6, {|| "" },   "Unidades art�culo"                       )
   ::AddField( "nPreArt",     "N", 16, 6, {|| "" },   "Precio unitario art�culo"                ) 

   ::AddField( "nPdtRec",     "N", 16, 6, {|| "" },   "Unidades pendientes de recibir"          )
   ::AddField( "nPdtEnt",     "N", 16, 6, {|| "" },   "Unidades pendientes de entregar"         )

   ::AddField( "nDtoArt",     "N",  6, 2, {|| "" },   "Descuento porcentual art�culo"           ) 
   ::AddField( "nLinArt",     "N", 16, 6, {|| "" },   "Descuento lineal art�culo"               ) 
   ::AddField( "nPrmArt",     "N",  6, 2, {|| "" },   "Descuento promocional art�culo"          )

   ::AddField( "nTotDto",     "N", 16, 6, {|| "" },   "Total descuento porcentual art�culo"     ) 
   ::AddField( "nTotPrm",     "N", 16, 6, {|| "" },   "Total descuento promocional art�culo"    )

   ::AddField( "nTrnArt",     "N", 16, 6, {|| "" },   "Total transporte art�culo"               ) 
   ::AddField( "nPntArt",     "N", 16, 6, {|| "" },   "Total punto verde art�culo"              ) 
   
   ::AddField( "nBrtArt",     "N", 16, 6, {|| "" },   "Total importe bruto art�culo"            )
   ::AddField( "nImpArt",     "N", 16, 6, {|| "" },   "Total importe art�culo"                  )
   ::AddField( "nIvaArt",     "N", 16, 6, {|| "" },   "Total " + cImp() + " art�culo"           )
   ::AddField( "nTotArt",     "N", 16, 6, {|| "" },   "Total importe art�culo " + cImp() + " incluido" )
   ::AddField( "nCosArt",     "N", 16, 6, {|| "" },   "Total costo art�culo"                    )

   ::AddField( "cCodPr1",     "C", 20, 0, {|| "" },   "C�digo de la primera propiedad"          )
   ::AddField( "cCodPr2",     "C", 20, 0, {|| "" },   "C�digo de la segunda propiedad"          )
   ::AddField( "cValPr1",     "C", 40, 0, {|| "" },   "Valor de la primera propiedad"           )
   ::AddField( "cValPr2",     "C", 40, 0, {|| "" },   "Valor de la segunda propiedad"           )

   ::AddField( "cLote",       "C", 12, 0, {|| "" },   "N�mero de lote"                          )
   ::AddField( "dFecCad",     "D",  8, 0, {|| "" },   "Fecha de caducidad"                      )

   ::AddField( "cNumSer",     "C", 30, 0, {|| "" },   "N�mero de serie"                         )


   ::AddField( "cClsDoc",     "C",  2, 0, {|| "" },   "Clase de documento"                      )
   ::AddField( "cTipDoc",     "C", 30, 0, {|| "" },   "Tipo de documento"                       )
   ::AddField( "cIdeDoc",     "C", 27, 0, {|| "" },   "Identificador del documento"             )
   ::AddField( "cSerDoc",     "C",  1, 0, {|| "" },   "Serie del documento"                     )
   ::AddField( "cNumDoc",     "C", 10, 0, {|| "" },   "N�mero del documento"                    )
   ::AddField( "cSufDoc",     "C",  2, 0, {|| "" },   "Delegaci�n del documento"                )

   ::AddField( "nAnoDoc",     "N",  4, 0, {|| "" },   "A�o del documento"                       )
   ::AddField( "nMesDoc",     "N",  2, 0, {|| "" },   "Mes del documento"                       )
   ::AddField( "dFecDoc",     "D",  8, 0, {|| "" },   "Fecha del documento"                     )
   ::AddField( "cHorDoc",     "C",  2, 0, {|| "" },   "Hora del documento"                      )
   ::AddField( "cMinDoc",     "C",  2, 0, {|| "" },   "Minutos del documento"                   )

   ::AddField( "cCodPrv",     "C", 12, 0, {|| "@!" }, "C�digo proveedor lineas"                 )
   ::AddField( "cNomPrv",     "C", 80, 0, {|| "@!" }, "Nombre proveedor lineas"                 )

   ::AddField( "nBultos",     "N", 16, 0, {|| "" },   "Numero de bultos en l�neas"              )
   ::AddField( "cFormato",    "C",100, 0, {|| "" },   "Formato de compra/venta en l�neas"       )
   ::AddField( "nCajas",      "N", 16, 6, {|| "" },   "Cajas en l�neas"                         )

   ::AddField( "lKitArt",     "L",  1, 0, {|| "" },   "L�nea con escandallos"                   )
   ::AddField( "lKitChl",     "L",  1, 0, {|| "" },   "L�nea perteneciente a escandallo"        )

   ::AddField( "cPrvHab",     "C", 12, 0, {|| "" },   "Proveedor habitual"                      )

   ::AddTmpIndex( "cCodArt", "cCodArt" )
   ::AddTmpIndex( "cCodPrvArt", "cCodPrv + cCodArt" )
   ::AddTmpIndex( "cPrvHab", "cPrvHab")
   ::AddTmpIndex( "cCodAlm", "cCodArt + cCodAlm" )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD BuildReportCorrespondences()
   
   ::hReport   := {  "Listado" =>                     {  "Generate" =>  {||   ::listadoArticulo() } ,;
                                                         "Variable" =>  {||   nil },;
                                                         "Data" =>      {||   nil } },;
                     "SAT de clientes" =>             {  "Generate" =>  {||   ::AddSATClientes() },;
                                                         "Variable" =>  {||   ::AddVariableLineasSATCliente() },;
                                                         "Data" =>      {||   ::FastReportSATCliente() } },;
                     "Presupuestos de clientes" =>    {  "Generate" =>  {||   ::AddPresupuestoClientes() },;
                                                         "Variable" =>  {||   ::AddVariableLineasPresupuestoCliente() },;
                                                         "Data" =>      {||   ::FastReportPresupuestoCliente() } },;
                     "Pedidos de clientes" =>         {  "Generate" =>  {||   ::AddPedidoClientes() },;
                                                         "Variable" =>  {||   ::AddVariableLineasPedidoCliente() },;
                                                         "Data" =>      {||   ::FastReportPedidoCliente() } },;
                     "Albaranes de clientes" =>       {  "Generate" =>  {||   ::AddAlbaranCliente() },;
                                                         "Variable" =>  {||   ::AddVariableLineasAlbaranCliente() },;
                                                         "Data" =>      {||   ::FastReportAlbaranCliente() } },;
                     "Facturas de clientes" =>        {  "Generate" =>  {||   ::AddFacturaCliente(),;
                                                                              ::AddFacturaRectificativa() },;
                                                         "Variable" =>  {||   ::AddVariableFacturaCliente() },;
                                                         "Data" =>      {||   ::FastReportFacturaCliente(),;
                                                                              ::FastReportFacturaRectificativa() } },;
                     "Rectificativas de clientes" =>  {  "Generate" =>  {||   ::AddFacturaRectificativa( .t. ) },;
                                                         "Variable" =>  {||   ::AddVariableLineasRectificativaCliente() },;
                                                         "Data" =>      {||   ::FastReportFacturaRectificativa() } },;
                     "Tickets de clientes" =>         {  "Generate" =>  {||   ::AddTicket( .t. ) },;
                                                         "Variable" =>  {||   ::AddVariableLineasTicketCliente() },;
                                                         "Data" =>      {||   ::FastReportTicket( .t. ) } },;
                     "Ventas" =>                      {  "Generate" =>  {||   ::AddAlbaranCliente( .t. ),;
                                                                              ::AddFacturaCliente(),;
                                                                              ::AddFacturaRectificativa(),;
                                                                              ::AddTicket() },;
                                                         "Variable" =>  {||   ::AddVariableLineasAlbaranCliente(),;
                                                                              ::AddVariableLineasFacturaCliente(),;
                                                                              ::AddVariableLineasRectificativaCliente(),;
                                                                              ::AddVariableLineasTicketCliente() },;
                                                         "Data" =>      {||   ::FastReportAlbaranCliente(),;
                                                                              ::FastReportFacturaCliente(),;
                                                                              ::FastReportFacturaRectificativa(),;
                                                                              ::FastReportTicket( .t. ) } },;
                     "Partes de producci�n" =>        {  "Generate" =>  {||   ::AddParteProduccion() },;
                                                         "Variable" =>  {||   ::AddVariableLineasParteProduccion() },;
                                                         "Data" =>      {||   ::FastReportParteProduccion() } },;
                     "Pedidos de proveedores" =>      {  "Generate" =>  {||   ::AddPedidoProveedor() },;
                                                         "Variable" =>  {||   ::AddVariableLineasPedidoProveedor() },;
                                                         "Data" =>      {||   ::FastReportPedidoProveedor() } },;
                     "Albaranes de proveedores" =>    {  "Generate" =>  {||   ::AddAlbaranProveedor() },;
                                                         "Variable" =>  {||   ::AddVariableLineasAlbaranProveedor() },;
                                                         "Data" =>      {||   ::FastReportAlbaranProveedor() } },;
                     "Facturas de proveedores" =>     {  "Generate" =>  {||   ::AddFacturaProveedor() },;
                                                         "Variable" =>  {||   ::AddVariableLineasFacturaProveedor(),;
                                                                              ::AddVariableLineasRectificativaProveedor() },;
                                                         "Data" =>      {||   ::FastReportFacturaProveedor() } },;
                     "Rectificativas de proveedores"=>{  "Generate" =>  {||   ::AddRectificativaProveedor() },;
                                                         "Variable" =>  {||   ::AddVariableLineasRectificativaProveedor() },;
                                                         "Data" =>      {||   ::FastReportRectificativaProveedor() } },;
                     "Compras" =>                     {  "Generate" =>  {||   ::AddAlbaranProveedor( .t. ),;
                                                                              ::AddFacturaProveedor(),;
                                                                              ::AddRectificativaProveedor() },;
                                                         "Variable" =>  {||   ::AddVariableLineasAlbaranProveedor(),;
                                                                              ::AddVariableLineasFacturaProveedor(),;
                                                                              ::AddVariableLineasRectificativaProveedor() },;
                                                         "Data" =>      {||   ::FastReportPedidoProveedor(),;
                                                                              ::FastReportAlbaranProveedor(),;
                                                                              ::FastReportFacturaProveedor(),;
                                                                              ::FastReportRectificativaProveedor() } },;
                     "Compras y ventas" =>            {  "Generate" =>  {||   ::SetUnidadesNegativo( .t. ),;
                                                                              ::AddAlbaranCliente( .t. ),;
                                                                              ::AddFacturaCliente(),;
                                                                              ::AddFacturaRectificativa(),;
                                                                              ::AddTicket(),;
                                                                              ::AddAlbaranProveedor( .t. ),;
                                                                              ::AddFacturaProveedor(),;
                                                                              ::AddRectificativaProveedor(),;
                                                                              ::SetUnidadesNegativo( .f. ) },;
                                                         "Variable" =>  {||   ::AddVariableLineasAlbaranCliente(),;
                                                                              ::AddVariableFacturaCliente(),;
                                                                              ::AddVariableLineasRectificativaCliente(),;
                                                                              ::AddVariableLineasTicketCliente(),;
                                                                              ::AddVariableLineasAlbaranProveedor(),;
                                                                              ::AddVariableLineasFacturaProveedor(),;
                                                                              ::AddVariableLineasRectificativaProveedor(),;
                                                                              ::AddVariableStock() },;
                                                         "Data" =>      {||   ::FastReportAlbaranCliente(),;
                                                                              ::FastReportFacturaCliente(),;
                                                                              ::FastReportFacturaRectificativa(),;
                                                                              ::FastReportTicket( .t. ),;
                                                                              ::FastReportPedidoProveedor(),;
                                                                              ::FastReportAlbaranProveedor(),;
                                                                              ::FastReportFacturaProveedor(),;
                                                                              ::FastReportRectificativaProveedor() } },;
                     "Stocks" =>                      {  "Generate" =>  {||   ::AddArticulo() },;
                                                         "Variable" =>  {||   ::AddVariableStock() },;
                                                         "Data" =>      {||   nil } } }

Return ( Self )

//---------------------------------------------------------------------------//

Method lValidRegister() CLASS TFastVentasArticulos

   if ( ::oDbf:cCodArt     >= ::oGrupoArticulo:Cargo:getDesde()      .and. ::oDbf:cCodArt   <= ::oGrupoArticulo:Cargo:getHasta() )      .and.;
      ( ::oDbf:cCodFam     >= ::oGrupoFamilia:Cargo:getDesde()       .and. ::oDbf:cCodFam   <= ::oGrupoFamilia:Cargo:getHasta() )       .and.;
      ( ::oDbf:cCodTip     >= ::oGrupoTArticulo:Cargo:getDesde()     .and. ::oDbf:cCodTip   <= ::oGrupoTArticulo:Cargo:getHasta() )     .and.;
      ( ::oDbf:TipoIva     >= ::oGrupoIva:Cargo:getDesde()           .and. ::oDbf:TipoIva   <= ::oGrupoIva:Cargo:getHasta() )           .and.;
      ( ::oDbf:cCodCate    >= ::oGrupoCategoria:Cargo:getDesde()     .and. ::oDbf:cCodCate  <= ::oGrupoCategoria:Cargo:getHasta() )     .and.;
      ( ::oDbf:cCodTemp    >= ::oGrupoTemporada:Cargo:getDesde()     .and. ::oDbf:cCodTemp  <= ::oGrupoTemporada:Cargo:getHasta() )     .and.;
      ( ::oDbf:cCodFab     >= ::oGrupoFabricante:Cargo:getDesde()    .and. ::oDbf:cCodFab   <= ::oGrupoFabricante:Cargo:getHasta() )    .and.;
      ( ::oDbf:cCodCli     >= ::oGrupoCliente:Cargo:getDesde()       .and. ::oDbf:cCodCli   <= ::oGrupoCliente:Cargo:getHasta() )       .and.;
      ( ::oDbf:cCodGrp     >= ::oGrupoGCliente:Cargo:getDesde()      .and. ::oDbf:cCodGrp   <= ::oGrupoGCliente:Cargo:getHasta() )      .and.;
      ( ::oDbf:cCodPago    >= ::oGrupoFpago:Cargo:getDesde()         .and. ::oDbf:cCodPago  <= ::oGrupoFpago:Cargo:getHasta() )         .and.;
      ( ::oDbf:cCodRut     >= ::oGrupoRuta:Cargo:getDesde()          .and. ::oDbf:cCodRut   <= ::oGrupoRuta:Cargo:getHasta() )          .and.;
      ( ::oDbf:cCodAge     >= ::oGrupoAgente:Cargo:getDesde()        .and. ::oDbf:cCodAge   <= ::oGrupoAgente:Cargo:getHasta() )        .and.;
      ( ::oDbf:cCodTrn     >= ::oGrupoTransportista:Cargo:getDesde() .and. ::oDbf:cCodTrn   <= ::oGrupoTransportista:Cargo:getHasta() ) .and.;
      ( ::oDbf:cCodUsr     >= ::oGrupoUsuario:Cargo:getDesde()       .and. ::oDbf:cCodUsr   <= ::oGrupoUsuario:Cargo:getHasta() )       .and.;
      ( ::oDbf:cPrvHab     >= ::oGrupoProveedor:Cargo:getDesde()     .and. ::oDbf:cPrvHab   <= ::oGrupoProveedor:Cargo:getHasta() )     .and.;
      ( ::oDbf:cCodAlm     >= ::oGrupoAlmacen:Cargo:getDesde()       .and. ::oDbf:cCodAlm   <= ::oGrupoAlmacen:Cargo:getHasta() ) 

      Return .t.

   end if

RETURN ( .f. )

//---------------------------------------------------------------------------//

METHOD BuildTree( oTree, lLoadFile ) CLASS TFastVentasArticulos

   local aReports

   DEFAULT oTree           := ::oTreeReporting
   DEFAULT lLoadFile       := .t. 

   aReports := {  {  "Title" => "Listado",                        "Image" => 0,  "Type" => "Listado",                      "Directory" => "Articulos\Listado",                            "File" => "Listado.fr3"  },;
                  {  "Title" => "Ventas",                         "Image" => 11, "Subnode" =>;
                  { ;
                     { "Title" => "SAT de clientes",              "Image" =>20, "Type" => "SAT de clientes",               "Directory" => "Articulos\Ventas\SAT de clientes",             "File" => "SAT de clientes.fr3" },;
                     { "Title" => "Presupuestos de clientes",     "Image" => 5, "Type" => "Presupuestos de clientes",      "Directory" => "Articulos\Ventas\Presupuestos de clientes",    "File" => "Presupuestos de clientes.fr3" },;
                     { "Title" => "Pedidos de clientes",          "Image" => 6, "Type" => "Pedidos de clientes",           "Directory" => "Articulos\Ventas\Pedidos de clientes",         "File" => "Pedidos de clientes.fr3" },;
                     { "Title" => "Albaranes de clientes",        "Image" => 7, "Type" => "Albaranes de clientes",         "Directory" => "Articulos\Ventas\Albaranes de clientes",       "File" => "Albaranes de clientes.fr3" },;
                     { "Title" => "Facturas de clientes",         "Image" => 8, "Type" => "Facturas de clientes",          "Directory" => "Articulos\Ventas\Facturas de clientes",        "File" => "Facturas de clientes.fr3" },;
                     { "Title" => "Rectificativas de clientes",   "Image" => 9, "Type" => "Rectificativas de clientes",    "Directory" => "Articulos\Ventas\Rectificativas de clientes",  "File" => "Rectificativas de clientes.fr3" },;
                     { "Title" => "Tickets de clientes",          "Image" =>10, "Type" => "Tickets de clientes",           "Directory" => "Articulos\Ventas\Tickets de clientes",         "File" => "Tickets de clientes.fr3" },;
                     { "Title" => "Ventas",                       "Image" =>11, "Type" => "Ventas",                        "Directory" => "Articulos\Ventas\Ventas",                      "File" => "Ventas.fr3" },;
                  } ;
                  },;
                  {  "Title" => "Producci�n",                     "Image" => 14, "Subnode" =>;
                  { ;
                     { "Title" => "Partes de producci�n",         "Image" => 14, "Type" => "Partes de producci�n",         "Directory" => "Articulos\Producci�n\Partes de producci�n",    "File" => "Partes de producci�n.fr3" },;
                  } ;
                  },; 
                  {  "Title" => "Compras",                        "Image" => 12, "Subnode" =>;
                  { ;
                     { "Title" => "Pedidos de proveedores",       "Image" => 2, "Type" => "Pedidos de proveedores",        "Directory" => "Articulos\Compras\Pedidos de proveedores",        "File" => "Pedidos de proveedores.fr3" },;
                     { "Title" => "Albaranes de proveedores",     "Image" => 3, "Type" => "Albaranes de proveedores",      "Directory" => "Articulos\Compras\Albaranes de proveedores",      "File" => "Albaranes de proveedores.fr3" },;
                     { "Title" => "Facturas de proveedores",      "Image" => 4, "Type" => "Facturas de proveedores",       "Directory" => "Articulos\Compras\Facturas de proveedores",       "File" => "Facturas de proveedores.fr3" },;
                     { "Title" => "Rectificativas de proveedores","Image" =>15, "Type" => "Rectificativas de proveedores", "Directory" => "Articulos\Compras\Rectificativas de proveedores", "File" => "Rectificativas de proveedores.fr3" },;
                     { "Title" => "Compras",                      "Image" =>12, "Type" => "Compras",                       "Directory" => "Articulos\Compras\Compras",                       "File" => "Compras.fr3" },;
                  } ;
                  },; 
                  {  "Title" => "Compras/Ventas",                 "Image" => 12, "Subnode" =>;
                  { ;
                     { "Title" => "Compras y ventas",             "Image" => 2, "Type" => "Compras y ventas",              "Directory" => "Articulos\ComprasVentas",                         "File" => "Compras y ventas.fr3" },;
                  } ;
                  },; 
                  {  "Title" => "Existencias",                    "Image" => 16, "Subnode" =>;
                  { ;
                     { "Title" => "Stocks",                       "Image" => 16, "Type" => "Stocks",                       "Directory" => "Articulos\Existencias\Stocks",                "File" => "Existencias por stock.fr3" },;
                  } ;
                  } }

   do case 
      case ( ::uParam == ALB_CLI )
      
         aReports := { { "Title" => "Albaranes de clientes",        "Image" => 7, "Type" => "Albaranes de clientes",       "Directory" => "Articulos\Ventas\Albaranes de clientes",          "File" => "Albaranes de clientes.fr3" } }

   end case

   ::BuildNode( aReports, oTree, lLoadFile )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD DataReport() CLASS TFastVentasArticulos

   ::oFastReport:ClearDataSets()

   /*
   Zona de detalle-------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Informe",                    ::oDbf:nArea )
   ::oFastReport:SetFieldAliases(   "Informe",                    cObjectsToReport( ::oDbf ) )

   /*
   Zona de datos---------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Empresa",                    ::oDbfEmp:nArea )
   ::oFastReport:SetFieldAliases(   "Empresa",                    cItemsToReport( aItmEmp() ) )

   ::oFastReport:SetWorkArea(       "Art�culos.Informe",          ::oDbfArt:nArea )
   ::oFastReport:SetFieldAliases(   "Art�culos.Informe",          cItemsToReport( aItmArt() ) )

   ::oFastReport:SetWorkArea(       "Art�culos.Escandallos",      ::oDbfArt:nArea )
   ::oFastReport:SetFieldAliases(   "Art�culos.Escandallos",      cItemsToReport( aItmArt() ) )

   ::oFastReport:SetWorkArea(       "Imagenes",                   ::oArtImg:nArea )
   ::oFastReport:SetFieldAliases(   "Imagenes",                   cItemsToReport( aItmImg() ) )

   ::oFastReport:SetWorkArea(       "C�digos de barras",          ::oArtCod:nArea )
   ::oFastReport:SetFieldAliases(   "C�digos de barras",          cItemsToReport( aItmBar() ) )

   ::oFastReport:SetWorkArea(       "Escandallos",                ::oArtKit:nArea )
   ::oFastReport:SetFieldAliases(   "Escandallos",                cItemsToReport( aItmKit() ) )

   ::oFastReport:SetWorkArea(       "Familias",                   ::oDbfFam:nArea )
   ::oFastReport:SetFieldAliases(   "Familias",                   cItemsToReport( aItmFam() ) )

   ::oFastReport:SetWorkArea(       "Tipo art�culos",             ::oTipArt:Select() )
   ::oFastReport:SetFieldAliases(   "Tipo art�culos",             cObjectsToReport( ::oTipArt:oDbf ) )

   ::oFastReport:SetWorkArea(       "Categorias",                 ::oDbfCat:nArea )
   ::oFastReport:SetFieldAliases(   "Categorias",                 cItemsToReport( aItmCategoria() ) )

   ::oFastReport:SetWorkArea(       "Temporadas",                 ::oDbfTmp:nArea )
   ::oFastReport:SetFieldAliases(   "Temporadas",                 cItemsToReport( aItmTemporada() ) )

   ::oFastReport:SetWorkArea(       "Fabricantes",                ::oDbfFab:Select() )
   ::oFastReport:SetFieldAliases(   "Fabricantes",                cObjectsToReport( ::oDbfFab:oDbf ) )

   ::oFastReport:SetWorkArea(       "Tipos de " + cImp(),         ::oDbfIva:nArea )
   ::oFastReport:SetFieldAliases(   "Tipos de " + cImp(),         cItemsToReport( aItmTIva() ) )

   ::oFastReport:SetWorkArea(       "Clientes",                   ::oDbfCli:nArea )
   ::oFastReport:SetFieldAliases(   "Clientes",                   cItemsToReport( aItmCli() ) )

   ::oFastReport:SetWorkArea(       "Proveedores",                ::oDbfPrv:nArea )
   ::oFastReport:SetFieldAliases(   "Proveedores",                cItemsToReport( aItmPrv() ) )

   ::oFastReport:SetWorkArea(       "Almacenes",                  ::oDbfAlm:nArea )
   ::oFastReport:SetFieldAliases(   "Almacenes",                  cItemsToReport( aItmAlm() ) )

   ::oFastReport:SetWorkArea(       "Usuarios",                   ::oDbfUsr:nArea ) 
   ::oFastReport:SetFieldAliases(   "Usuarios",                   cItemsToReport( aItmUsuario() ) )

   ::oFastReport:SetWorkArea(       "Stock por almac�n",          ::oArtAlm:nArea )
   ::oFastReport:SetFieldAliases(   "Stock por almac�n",          cItemsToReport( aItmStockaAlmacenes() ) )

   /*
   Relaciones entre tablas-----------------------------------------------------
   */

   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Familias",                {|| ::oDbfArt:Familia } )
   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Tipo art�culos",          {|| ::oDbfArt:cCodTip } )
   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Categorias",              {|| ::oDbfArt:cCodCate } )
   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Temporadas",              {|| ::oDbfArt:cCodTemp } )
   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Fabricantes",             {|| ::oDbfArt:cCodFab } )
   ::oFastReport:SetMasterDetail(   "Art�culos.Informe", "Tipos de " + cImp(),      {|| ::oDbfArt:TipoIva } )

   ::oFastReport:SetMasterDetail(   "Escandallos", "Art�culos.Escandallos",         {|| ::oArtKit:cRefKit } )

   ::oFastReport:SetMasterDetail(   "Informe", "Empresa",                           {|| cCodEmp() } )
   ::oFastReport:SetMasterDetail(   "Informe", "Clientes",                          {|| ::oDbf:cCodCli } )
   ::oFastReport:SetMasterDetail(   "Informe", "Proveedores",                       {|| ::oDbf:cCodCli } )
   ::oFastReport:SetMasterDetail(   "Informe", "Usuarios",                          {|| ::oDbf:cCodUsr } )
   ::oFastReport:SetMasterDetail(   "Informe", "Almacenes",                         {|| ::oDbf:cCodAlm } )

   ::oFastReport:SetMasterDetail(   "Informe", "Art�culos.Informe",  {|| ::oDbf:cCodArt } )  
   ::oFastReport:SetMasterDetail(   "Informe", "Imagenes",           {|| ::oDbf:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Informe", "Escandallos",        {|| ::oDbf:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Informe", "C�digos de barras",  {|| ::oDbf:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Informe", "Stock por almac�n",  {|| ::oDbf:cCodArt + ::oDbf:cCodAlm } )  

   /*
   Resincronizar con los movimientos-------------------------------------------
   */

   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Familias" )
   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Tipo art�culos" )
   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Categorias" )
   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Temporadas" )
   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Fabricantes" )
   ::oFastReport:SetResyncPair(     "Art�culos.Informe", "Tipos de " + cImp() )
   
   ::oFastReport:SetResyncPair(     "Escandallos", "Art�culos.Escandallos" )

   ::oFastReport:SetResyncPair(     "Informe", "Clientes" )
   ::oFastReport:SetResyncPair(     "Informe", "Proveedores" )
   ::oFastReport:SetResyncPair(     "Informe", "Empresa" )
   ::oFastReport:SetResyncPair(     "Informe", "Usuarios" )
   ::oFastReport:SetResyncPair(     "Informe", "Almacenes" )

   ::oFastReport:SetResyncPair(     "Informe", "Art�culos.Informe" )
   ::oFastReport:SetResyncPair(     "Informe", "Imagenes" )
   ::oFastReport:SetResyncPair(     "Informe", "Escandallos" )
   ::oFastReport:SetResyncPair(     "Informe", "C�digos de barras" )
   ::oFastReport:SetResyncPair(     "Informe", "Stock por almac�n" )  

   ::SetDataReport()

Return ( Self )

//---------------------------------------------------------------------------//

METHOD AddSATClientes() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oSatCliT:OrdSetFocus( "dFecSat" )
   ::oSatCliL:OrdSetFocus( "nNumSat" )

   cExpHead          := 'dFecSat >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecSat <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCodCli <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerSat >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerSat <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumSat >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )   + '" ) .and. nNumSat <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufSat >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufSat <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oSatCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oSatCliT:cFile ), ::oSatCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando SAT"
   ::oMtrInf:SetTotal( ::oSatCliT:OrdKeyCount() )

   /*
   Lineas de Satidos-----------------------------------------------------------
   */

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oSatCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oSatCliL:cFile ), ::oSatCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oSatCliT:GoTop()
   while !::lBreak .and. !::oSatCliT:Eof()

      if lChkSer( ::oSatCliT:cSerSat, ::aSer )

         if ::oSatCliL:Seek( ::oSatCliT:cSerSat + Str( ::oSatCliT:nNumSat ) + ::oSatCliT:cSufSat )

            while !::lBreak .and. ( ::oSatCliT:cSerSat + Str( ::oSatCliT:nNumSat ) + ::oSatCliT:cSufSat == ::oSatCliL:cSerSat + Str( ::oSatCliL:nNumSat ) + ::oSatCliL:cSufSat )

               if !( ::lExcCero  .and. nTotNSATCli( ::oSatCliL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLSATCli( ::oSatCliT:cAlias, ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  /*
                  Añadimos un nuevo registro-----------------------------------
                  */

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oSatCliL:cRef
                  ::oDbf:cNomArt    := ::oSatCliL:cDetalle

                  ::oDbf:cCodPr1    := ::oSatCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oSatCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oSatCliL:cValPr1
                  ::oDbf:cValPr2    := ::oSatCliL:cValPr2

                  ::oDbf:cCodPrv    := ::oSatCliL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oSatCliL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oSatCliL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oSatCliL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oSatCliL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oSatCliL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oSatCliL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oSatCliL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  
                  ::oDbf:cCodAlm    := ::oSatCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oSatCliT:cCodPgo
                  ::oDbf:cCodRut    := ::oSatCliT:cCodRut
                  ::oDbf:cCodAge    := ::oSatCliT:cCodAge
                  ::oDbf:cCodTrn    := ::oSatCliT:cCodTrn
                  ::oDbf:cCodUsr    := ::oSatCliT:cCodUsr

                  ::oDbf:cCodCli    := ::oSatCliT:cCodCli
                  ::oDbf:cNomCli    := ::oSatCliT:cNomCli
                  ::oDbf:cPobCli    := ::oSatCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oSatCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oSatCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oSatCliT:cCodCli, ::oDbfCli )

                  ::oDbf:nTotDto    := nDtoLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nUniArt    := nTotNSATCli( ::oSatCliL:cAlias )

                  ::oDbf:nDtoArt    := ::oSatCliL:nDto
                  ::oDbf:nLinArt    := ::oSatCliL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oSatCliL:nDtoPrm

                  ::oDbf:nPreArt    := nImpUSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLSATCli( ::oSatCliT:cAlias, ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLSATCli( ::oSatCliT:cAlias, ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nTotCSATCli( ::oSatCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * pCosto( ::oDbfArt:cAlias )
                  end if 

                  ::oDbf:cClsDoc    := SAT_CLI
                  ::oDbf:cTipDoc    := "SAT cliente"
                  ::oDbf:cSerDoc    := ::oSatCliT:cSerSat
                  ::oDbf:cNumDoc    := Str( ::oSatCliT:nNumSat )
                  ::oDbf:cSufDoc    := ::oSatCliT:cSufSat

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oSatCliT:dFecSat )
                  ::oDbf:nMesDoc    := Month( ::oSatCliT:dFecSat )
                  ::oDbf:dFecDoc    := ::oSatCliT:dFecSat
                  ::oDbf:cHorDoc    := SubStr( ::oSatCliT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oSatCliT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oSatCliL:nBultos
                  ::oDbf:cFormato   := ::osatCliL:cFormato
                  ::oDbf:nCajas     := ::oSatCliL:nCanSat

                  ::oDbf:lKitArt    := ::oSatCliL:lKitArt
                  ::oDbf:lKitChl    := ::oSatCliL:lKitChl

                  /*
                  Añadimos un nuevo registro-----------------------------------
                  */

                  if ::lValidRegister()
                     ::oDbf:Insert()
                  else
                     ::oDbf:Cancel()
                  end if

               end if

               ::oSatCliL:Skip()

            end while

         end if

      end if

      ::oSatCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oSatCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oSatCliT:cFile ) )
   ::oSatCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oSatCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddPresupuestoClientes() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oPreCliT:OrdSetFocus( "dFecPre" )
   ::oPreCliL:OrdSetFocus( "nNumPre" )

   cExpHead          := 'dFecPre >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPre <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCodCli <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerPre >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerPre <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumPre >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )   + '" ) .and. nNumPre <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufPre >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufPre <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oPreCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPreCliT:cFile ), ::oPreCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando presupuestos"
   ::oMtrInf:SetTotal( ::oPreCliT:OrdKeyCount() )

   /*
   Lineas de Preidos-----------------------------------------------------------
   */

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oPreCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPreCliL:cFile ), ::oPreCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oPreCliT:GoTop()
   while !::lBreak .and. !::oPreCliT:Eof()

      if lChkSer( ::oPreCliT:cSerPre, ::aSer )

         if ::oPreCliL:Seek( ::oPreCliT:cSerPre + Str( ::oPreCliT:nNumPre ) + ::oPreCliT:cSufPre )

            while !::lBreak .and. ( ::oPreCliT:cSerPre + Str( ::oPreCliT:nNumPre ) + ::oPreCliT:cSufPre == ::oPreCliL:cSerPre + Str( ::oPreCliL:nNumPre ) + ::oPreCliL:cSufPre )

               if !( ::lExcCero  .and. nTotNPreCli( ::oPreCliL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  /*
                  Añadimos un nuevo registro-----------------------------------
                  */

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oPreCliL:cRef
                  ::oDbf:cNomArt    := ::oPreCliL:cDetalle

                  ::oDbf:cCodPr1    := ::oPreCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oPreCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oPreCliL:cValPr1
                  ::oDbf:cValPr2    := ::oPreCliL:cValPr2

                  ::oDbf:cCodPrv    := ::oPreCliL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oPreCliL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oPreCliL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oPreCliL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oPreCliL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oPreCliL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oPreCliL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oPreCliL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oPreCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oPreCliT:cCodPgo
                  ::oDbf:cCodRut    := ::oPreCliT:cCodRut
                  ::oDbf:cCodAge    := ::oPreCliT:cCodAge
                  ::oDbf:cCodTrn    := ::oPreCliT:cCodTrn
                  ::oDbf:cCodUsr    := ::oPreCliT:cCodUsr

                  ::oDbf:cCodCli    := ::oPreCliT:cCodCli
                  ::oDbf:cNomCli    := ::oPreCliT:cNomCli
                  ::oDbf:cPobCli    := ::oPreCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oPreCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oPreCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oPreCliT:cCodCli, ::oDbfCli )

                  ::oDbf:nTotDto    := nDtoLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nUniArt    := nTotNPreCli( ::oPreCliL:cAlias )

                  ::oDbf:nDtoArt    := ::oPrecliL:nDto
                  ::oDbf:nLinArt    := ::oPrecliL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oPrecliL:nDtoPrm

                  ::oDbf:nPreArt    := nImpUPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nTotCPreCli( ::oPreCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cClsDoc    := PRE_CLI
                  ::oDbf:cTipDoc    := "Presupuesto cliente"
                  ::oDbf:cSerDoc    := ::oPreCliT:cSerPre
                  ::oDbf:cNumDoc    := Str( ::oPreCliT:nNumPre )
                  ::oDbf:cSufDoc    := ::oPreCliT:cSufPre

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oPreCliT:dFecPre )
                  ::oDbf:nMesDoc    := Month( ::oPreCliT:dFecPre )
                  ::oDbf:dFecDoc    := ::oPreCliT:dFecPre
                  ::oDbf:cHorDoc    := SubStr( ::oPreCliT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oPreCliT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oPreCliL:nBultos
                  ::oDbf:cFormato   := ::oPreCliL:cFormato
                  ::oDbf:nCajas     := ::oPreCliL:nCanPre

                  ::oDbf:lKitArt    := ::oPreCliL:lKitArt
                  ::oDbf:lKitChl    := ::oPreCliL:lKitChl

                  ::InsertIfValid()

               end if

               ::oPreCliL:Skip()

            end while

         end if

      end if

      ::oPreCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oPreCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPreCliT:cFile ) )
   ::oPreCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPreCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddPedidoClientes() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oPedCliT:OrdSetFocus( "dFecPed" )
   ::oPedCliL:OrdSetFocus( "nNumPed" )

   cExpHead          := 'dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCodCli <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerPed >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerPed <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumPed >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() ) + '" ) .and. nNumPed <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufPed >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufPed <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oPedCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedCliT:cFile ), ::oPedCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando pedidos"
   ::oMtrInf:SetTotal( ::oPedCliT:OrdKeyCount() )

   /*
   Lineas de pedidos-----------------------------------------------------------
   */

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oPedCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedCliL:cFile ), ::oPedCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oPedCliT:GoTop()
   while !::lBreak .and. !::oPedCliT:Eof()

      if lChkSer( ::oPedCliT:cSerPed, ::aSer )

         if ::oPedCliL:Seek( ::oPedCliT:cSerPed + Str( ::oPedCliT:nNumPed ) + ::oPedCliT:cSufPed )

            while !::lBreak .and. ( ::oPedCliT:cSerPed + Str( ::oPedCliT:nNumPed ) + ::oPedCliT:cSufPed == ::oPedCliL:cSerPed + Str( ::oPedCliL:nNumPed ) + ::oPedCliL:cSufPed )

               if !( ::lExcCero  .and. nTotNPedCli( ::oPedCliL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  /*
                  Añadimos un nuevo registro
                  */

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oPedCliL:cRef
                  ::oDbf:cNomArt    := ::oPedCliL:cDetalle

                  ::oDbf:cCodPrv    := ::oPedCliL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oPedCliL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oPedCliL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oPedCliL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oPedCliL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oPedCliL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oPedCliL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oPedCliL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oPedCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oPedCliT:cCodPgo
                  ::oDbf:cCodRut    := ::oPedCliT:cCodRut
                  ::oDbf:cCodAge    := ::oPedCliT:cCodAge
                  ::oDbf:cCodTrn    := ::oPedCliT:cCodTrn
                  ::oDbf:cCodUsr    := ::oPedCliT:cCodUsr

                  ::oDbf:cCodCli    := ::oPedCliT:cCodCli
                  ::oDbf:cNomCli    := ::oPedCliT:cNomCli
                  ::oDbf:cPobCli    := ::oPedCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oPedCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oPedCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oPedCliT:cCodCli, ::oDbfCli )

                  ::oDbf:nUniArt    := nTotNPedCli( ::oPedCliL:cAlias )

                  ::oDbf:nDtoArt    := ::oPedcliL:nDto
                  ::oDbf:nLinArt    := ::oPedcliL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oPedcliL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nPreArt    := nImpUPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nTotCPedCli( ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cCodPr1    := ::oPedCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oPedCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oPedCliL:cValPr1
                  ::oDbf:cValPr2    := ::oPedCliL:cValPr2

                  ::oDbf:cClsDoc    := PED_CLI
                  ::oDbf:cTipDoc    := "Pedido cliente"
                  ::oDbf:cSerDoc    := ::oPedCliT:cSerPed
                  ::oDbf:cNumDoc    := Str( ::oPedCliT:nNumPed )
                  ::oDbf:cSufDoc    := ::oPedCliT:cSufPed

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oPedCliT:dFecPed )
                  ::oDbf:nMesDoc    := Month( ::oPedCliT:dFecPed )
                  ::oDbf:dFecDoc    := ::oPedCliT:dFecPed
                  ::oDbf:cHorDoc    := SubStr( ::oPedCliT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oPedCliT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oPedCliL:nBultos
                  ::oDbf:cFormato   := ::oPedCliL:cFormato
                  ::oDbf:nCajas     := ::oPedCliL:nCanPed

                  ::oDbf:lKitArt    := ::oPedCliL:lKitArt
                  ::oDbf:lKitChl    := ::oPedCliL:lKitChl

                  ::InsertIfValid()

               end if

               ::oPedCliL:Skip()

            end while

         end if

      end if

      ::oPedCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oPedCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedCliT:cFile ) )
   ::oPedCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddAlbaranCliente( lFacturados ) CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   DEFAULT lFacturados  := .f.

   ::InitAlbaranesClientes()

   ::oAlbCliT:OrdSetFocus( "dFecAlb" )
   ::oAlbCliL:OrdSetFocus( "nNumAlb" )

   if lFacturados
      cExpHead          := 'nFacturado < 3 .and. dFecAlb >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecAlb <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   else
      cExpHead          := 'dFecAlb >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecAlb <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   end if

   cExpHead             += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCodCli <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead             += ' .and. cSerAlb >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerAlb <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead             += ' .and. nNumAlb >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() ) + '" ) .and. nNumAlb <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead             += ' .and. cSufAlb >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufAlb <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oAlbCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbCliT:cFile ), ::oAlbCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText      := "Procesando albaranes"
   ::oMtrInf:SetTotal( ::oAlbCliT:OrdKeyCount() )

   /*
   Lineas de albaranes---------------------------------------------------------
   */

   cExpLine             := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine          += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oAlbCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbCliL:cFile ), ::oAlbCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oAlbCliT:GoTop()

   while !::lBreak .and. !::oAlbCliT:Eof()

      if lChkSer( ::oAlbCliT:cSerAlb, ::aSer )

         if ::oAlbCliL:Seek( ::oAlbCliT:cSerAlb + Str( ::oAlbCliT:nNumAlb ) + ::oAlbCliT:cSufAlb )

            while !::lBreak .and. ( ::oAlbCliT:cSerAlb + Str( ::oAlbCliT:nNumAlb ) + ::oAlbCliT:cSufAlb == ::oAlbCliL:cSerAlb + Str( ::oAlbCliL:nNumAlb ) + ::oAlbCliL:cSufAlb )

               if !( ::lExcCero  .and. nTotNAlbCli( ::oAlbCliL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oAlbCliL:cRef
                  ::oDbf:cNomArt    := ::oAlbCliL:cDetalle

                  ::oDbf:cCodPrv    := ::oAlbCliL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oAlbCliL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oAlbCliL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oAlbCliL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oAlbCliL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oAlbCliL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oAlbCliL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oAlbCliL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oAlbCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oAlbCliT:cCodPago
                  ::oDbf:cCodRut    := ::oAlbCliT:cCodRut
                  ::oDbf:cCodAge    := ::oAlbCliT:cCodAge
                  ::oDbf:cCodTrn    := ::oAlbCliT:cCodTrn
                  ::oDbf:cCodUsr    := ::oAlbCliT:cCodUsr

                  ::oDbf:cCodCli    := ::oAlbCliT:cCodCli
                  ::oDbf:cNomCli    := ::oAlbCliT:cNomCli
                  ::oDbf:cPobCli    := ::oAlbCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oAlbCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oAlbCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oAlbCliT:cCodCli, ::oDbfCli )

                  ::oDbf:nUniArt    := nTotNAlbCli( ::oAlbCliL:cAlias ) * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:nDtoArt    := ::oAlbcliL:nDto
                  ::oDbf:nLinArt    := ::oAlbcliL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oAlbcliL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nPreArt    := nImpUAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nCosLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cCodPr1    := ::oAlbCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oAlbCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oAlbCliL:cValPr1
                  ::oDbf:cValPr2    := ::oAlbCliL:cValPr2

                  ::oDbf:cLote      := ::oAlbCliL:cLote
                  ::oDbf:dFecCad    := ::oAlbCliL:dFecCad

                  ::oDbf:cClsDoc    := ALB_CLI
                  ::oDbf:cTipDoc    := "Albar�n cliente"
                  ::oDbf:cSerDoc    := ::oAlbCliT:cSerAlb
                  ::oDbf:cNumDoc    := Str( ::oAlbCliT:nNumAlb )
                  ::oDbf:cSufDoc    := ::oAlbCliT:cSufAlb

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oAlbCliT:dFecAlb )
                  ::oDbf:nMesDoc    := Month( ::oAlbCliT:dFecAlb )
                  ::oDbf:dFecDoc    := ::oAlbCliT:dFecAlb
                  ::oDbf:cHorDoc    := SubStr( ::oAlbCliT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oAlbCliT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oAlbCliL:nBultos * if( ::lUnidadesNegativo, -1, 1 )
                  ::oDbf:cFormato   := ::oAlbCliL:cFormato
                  ::oDbf:nCajas     := ::oAlbCliL:nCanEnt * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:lKitArt    := ::oAlbCliL:lKitArt
                  ::oDbf:lKitChl    := ::oAlbCliL:lKitChl

                  ::InsertIfValid()

               end if

               ::oAlbCliL:Skip()

            end while

         end if

      end if

      ::addAlbaranesClientes()

      ::oAlbCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oAlbCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbCliT:cFile ) )
   ::oAlbCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddFacturaCliente() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::InitFacturasClientes()

   ::oFacCliT:OrdSetFocus( "dFecFac" )
   ::oFacCliL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() )   + '" .and. cCodCli <= "'   + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerie >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )      + '" .and. cSerie <= "'    + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumFac >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )    + '" ) .and. nNumFac <= Val( "'    + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufFac >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )    + '" .and. cSufFac <= "'    + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oFacCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacCliT:cFile ), ::oFacCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando facturas"
   ::oMtrInf:SetTotal( ::oFacCliT:OrdKeyCount() )

   /*
   Lineas de facturas----------------------------------------------------------
   */

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oFacCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacCliL:cFile ), ::oFacCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oFacCliT:GoTop()

   while !::lBreak .and. !::oFacCliT:Eof()

      if lChkSer( ::oFacCliT:cSerie, ::aSer )

         if ::oFacCliL:Seek( ::oFacCliT:cSerie + Str( ::oFacCliT:nNumFac ) + ::oFacCliT:cSufFac )

            while !::lBreak .and. ( ::oFacCliT:cSerie + Str( ::oFacCliT:nNumFac ) + ::oFacCliT:cSufFac == ::oFacCliL:cSerie + Str( ::oFacCliL:nNumFac ) + ::oFacCliL:cSufFac )

               if !( ::lExcCero  .and. nTotNFacCli( ::oFacCliL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()
                  ::oDbf:cCodArt    := ::oFacCliL:cRef
                  ::oDbf:cNomArt    := ::oFacCliL:cDetalle

                  ::oDbf:cCodPrv    := ::oFacCliL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oFacCliL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oFacCliL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oFacCliL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oFacCliL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oFacCliL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oFacCliL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oFacCliL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oFacCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oFacCliT:cCodPago
                  ::oDbf:cCodRut    := ::oFacCliT:cCodRut
                  ::oDbf:cCodAge    := ::oFacCliT:cCodAge
                  ::oDbf:cCodTrn    := ::oFacCliT:cCodTrn
                  ::oDbf:cCodUsr    := ::oFacCliT:cCodUsr

                  ::oDbf:cCodCli    := ::oFacCliT:cCodCli
                  ::oDbf:cNomCli    := ::oFacCliT:cNomCli
                  ::oDbf:cPobCli    := ::oFacCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oFacCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oFacCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oFacCliT:cCodCli, ::oDbfCli )

                  ::oDbf:nUniArt    := nTotNFacCli( ::oFacCliL:cAlias ) * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:nDtoArt    := ::oFaccliL:nDto
                  ::oDbf:nLinArt    := ::oFaccliL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oFaccliL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nPreArt    := nImpUFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nCosLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 
                  
                  ::oDbf:cCodPr1    := ::oFacCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oFacCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oFacCliL:cValPr1
                  ::oDbf:cValPr2    := ::oFacCliL:cValPr2

                  ::oDbf:cLote      := ::oFacCliL:cLote
                  ::oDbf:dFecCad    := ::oFacCliL:dFecCad

                  ::oDbf:cClsDoc    := FAC_CLI
                  ::oDbf:cTipDoc    := "Factura cliente"
                  ::oDbf:cSerDoc    := ::oFacCliT:cSerie
                  ::oDbf:cNumDoc    := Str( ::oFacCliT:nNumFac )
                  ::oDbf:cSufDoc    := ::oFacCliT:cSufFac

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oFacCliT:dFecFac )
                  ::oDbf:nMesDoc    := Month( ::oFacCliT:dFecFac )
                  ::oDbf:dFecDoc    := ::oFacCliT:dFecFac
                  ::oDbf:cHorDoc    := SubStr( ::oFacCliT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oFacCliT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oFacCliL:nBultos * if( ::lUnidadesNegativo, -1, 1 )
                  ::oDbf:cFormato   := ::oFacCliL:cFormato
                  ::oDBf:nCajas     := ::oFacCliL:nCanEnt * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:lKitArt    := ::oFacCliL:lKitArt
                  ::oDbf:lKitChl    := ::oFacCliL:lKitChl

                  ::InsertIfValid()

               end if

               ::oFacCliL:Skip()

            end while

         end if

      end if

      ::addFacturasClientes()

      ::oFacCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oFacCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacCliT:cFile ) )
   ::oFacCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddFacturaRectificativa() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oFacRecT:OrdSetFocus( "dFecFac" )
   ::oFacRecL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodCli >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCodCli <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerie >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerie <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumFac >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() ) + '" ) .and. nNumFac <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufFac >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufFac <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oFacRecT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacRecT:cFile ), ::oFacRecT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando facturas rectificativas"
   ::oMtrInf:SetTotal( ::oFacRecT:OrdKeyCount() )

   // Lineas de facturas rectificativas----------------------------------------

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oFacRecL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacRecL:cFile ), ::oFacRecL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oFacRecT:GoTop()

   while !::lBreak .and. !::oFacRecT:Eof()

      if lChkSer( ::oFacRecT:cSerie, ::aSer )

         if ::oFacRecL:Seek( ::oFacRecT:cSerie + Str( ::oFacRecT:nNumFac ) + ::oFacRecT:cSufFac )

            while !::lBreak .and. ( ::oFacRecT:cSerie + Str( ::oFacRecT:nNumFac ) + ::oFacRecT:cSufFac == ::oFacRecL:cSerie + Str( ::oFacRecL:nNumFac ) + ::oFacRecL:cSufFac )

               if !( ::lExcCero  .and. nTotNFacRec ( ::oFacRecL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLFacRec ( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oFacRecL:cRef
                  ::oDbf:cNomArt    := ::oFacRecL:cDetalle

                  ::oDbf:cCodPrv    := ::oFacRecL:cCodPrv
                  ::oDbf:cNomPrv    := RetFld( ::oFacRecL:cCodPrv, ::oDbfPrv:cAlias )

                  ::oDbf:cCodFam    := ::oFacRecL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oFacRecL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oFacRecL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oFacRecL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oFacRecL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oFacRecL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oFacRecL:cAlmLin
                  ::oDbf:cCodPago   := ::oFacRecT:cCodPago
                  ::oDbf:cCodRut    := ::oFacRecT:cCodRut
                  ::oDbf:cCodAge    := ::oFacRecT:cCodAge
                  ::oDbf:cCodTrn    := ::oFacRecT:cCodTrn
                  ::oDbf:cCodUsr    := ::oFacRecT:cCodUsr

                  ::oDbf:cCodCli    := ::oFacRecT:cCodCli
                  ::oDbf:cNomCli    := ::oFacRecT:cNomCli
                  ::oDbf:cPobCli    := ::oFacRecT:cPobCli
                  ::oDbf:cPrvCli    := ::oFacRecT:cPrvCli
                  ::oDbf:cPosCli    := ::oFacRecT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oFacRecT:cCodCli, ::oDbfCli )

                  ::oDbf:nUniArt    := nTotNFacRec( ::oFacRecL:cAlias ) * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:nDtoArt    := ::oFacRecL:nDto
                  ::oDbf:nLinArt    := ::oFacRecL:nDtoDiv
                  ::oDbf:nPrmArt    := ::oFacRecL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nPreArt    := nImpUFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nTrnArt    := nTrnUFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                  ::oDbf:nPntArt    := nPntLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nCosArt    := nCosLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cCodPr1    := ::oFacRecL:cCodPr1
                  ::oDbf:cCodPr2    := ::oFacRecL:cCodPr2
                  ::oDbf:cValPr1    := ::oFacRecL:cValPr1
                  ::oDbf:cValPr2    := ::oFacRecL:cValPr2

                  ::oDbf:cLote      := ::oFacRecL:cLote
                  ::oDbf:dFecCad    := ::oFacRecL:dFecCad

                  ::oDbf:cClsDoc    := FAC_REC
                  ::oDbf:cTipDoc    := "Rectificativa cliente"
                  ::oDbf:cSerDoc    := ::oFacRecT:cSerie
                  ::oDbf:cNumDoc    := Str( ::oFacRecT:nNumFac )
                  ::oDbf:cSufDoc    := ::oFacRecT:cSufFac

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oFacRecT:dFecFac )
                  ::oDbf:nMesDoc    := Month( ::oFacRecT:dFecFac )
                  ::oDbf:dFecDoc    := ::oFacRecT:dFecFac
                  ::oDbf:cHorDoc    := SubStr( ::oFacRecT:cTimCre, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oFacRecT:cTimCre, 4, 2 )

                  ::oDbf:nBultos    := ::oFacRecL:nBultos * if( ::lUnidadesNegativo, -1, 1)
                  ::oDbf:cFormato   := ::oFacRecL:cFormato
                  ::oDbf:nCajas     := ::oFacRecL:nCanEnt * if( ::lUnidadesNegativo, -1, 1 )

                  ::oDbf:lKitArt    := ::oFacRecL:lKitArt
                  ::oDbf:lKitChl    := ::oFacRecL:lKitChl

                  ::InsertIfValid()

               end if

               ::oFacRecL:Skip()

            end while

         end if

      end if

      ::oFacRecT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oFacRecT:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacRecT:cFile ) )
   ::oFacRecL:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacRecL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddTicket() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine 

   ::oTikCliT:OrdSetFocus( "dFecTik" )
   ::oTikCliL:OrdSetFocus( "cNumTil" )

   cExpHead       := 'dFecTik >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecTik <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead       += ' .and. ( cTipTik == "1" .or. cTipTik == "4" )'
   cExpHead       += ' .and. cCliTik >= "' + Rtrim( ::oGrupoCliente:Cargo:getDesde() ) + '" .and. cCliTik <= "' + Rtrim( ::oGrupoCliente:Cargo:getHasta() ) + '"'
   cExpHead       += ' .and. cSerTik >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )   + '" .and. cSerTik <= "' + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead       += ' .and. cNumTik >= "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )   + '" .and. cNumTik <= "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '"'
   cExpHead       += ' .and. cSufTik >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )   + '" .and. cSufTik <= "' + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oTikCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oTikCliT:cFile ), ::oTikCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText := "Procesando tikets"

   ::oMtrInf:SetTotal( ::oTikCliT:OrdKeyCount() )

   // Lineas de tickets -------------------------------------------------------

   cExpLine       := '( ( cCbaTil >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cCbaTil <= "' + ::oGrupoArticulo:Cargo:getHasta() + '") .or. '
   cExpLine       += '( cComTil >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cComTil <= "' + ::oGrupoArticulo:Cargo:getHasta() + '" ) )'

   ::oTikCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oTikCliL:cFile ), ::oTikCliL:OrdKey(), ( cExpLine ), , , , , , , , .t. )

   // Proceso -----------------------------------------------------------------

   ::oTikCliT:GoTop()

   while !::lBreak .and. !::oTikCliT:Eof()

      if lChkSer( ::oTikCliT:cSerTik, ::aSer ) .and. ::oTikCliL:Seek( ::oTikCliT:cSerTik + ::oTikCliT:cNumTik + ::oTikCliT:cSufTik )

         while ::oTikCliT:cSerTik + ::oTikCliT:cNumTik + ::oTikCliT:cSufTik == ::oTikCliL:cSerTil + ::oTikCliL:cNumTil + ::oTikCliL:cSufTil .and. !::oTikCliL:Eof()

            if !( ::oTikCliL:lControl ) .and. !( ::oTikCliL:lDelTil )

               ::oDbf:Blank()
               
                  ::oDbf:cCodArt    := ::oTikCliL:cCbaTil
                  ::oDbf:cNomArt    := ::oTikCliL:cNomTil
                  ::oDbf:cCodCli    := ::oTikCliT:cCliTik
                  ::oDbf:cNomCli    := ::oTikCliT:cNomTik
                  ::oDbf:cPobCli    := ::oTikCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oTikCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oTikCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oTikCliT:cCliTik, ::oDbfCli )

                  ::oDbf:cCodFam    := ::oTikCliL:cCodFam
                  ::oDbf:cCodTip    := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oTikCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oTikCliT:cFpgTik
                  ::oDbf:cCodRut    := ::oTikCliT:cCodRut
                  ::oDbf:cCodAge    := ::oTikCliT:cCodAge
                  ::oDbf:cCodTrn    := ""
                  ::oDbf:cCodUsr    := ::oTikCliT:cCcjTik

                  if ::oTikCliT:cTipTik == "4"
                     ::oDbf:nUniArt := - ::oTikCliL:nUntTil * if( ::lUnidadesNegativo, -1, 1 )
                  else
                     ::oDbf:nUniArt := ::oTikCliL:nUntTil   * if( ::lUnidadesNegativo, -1, 1 )
                  end if

                  ::oDbf:nPreArt    := nImpUTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nValDiv, nil, 1 )

                  ::oDbf:nBrtArt    := nBrtLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nValDiv, nil, 1 )
                  ::oDbf:nImpArt    := nImpLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, nil, 1 )

                  ::oDbf:nDtoArt    := ::oTikCliL:nDtoLin
                  ::oDbf:nLinArt    := ::oTikCliL:nDtoDiv
                //::oDbf:nPrmArt    := ::oTikCliL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLTpv( ::oTikCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := 0

                  ::oDbf:nIvaArt    := nIvaLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 1 )
                  ::oDbf:nTotArt    := nImpLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, nil, 1 )
                  ::oDbf:nTotArt    += nIvaLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 1 )
                  
                  ::oDbf:nCosArt    := nCosLTpv( ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 1 )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oDbf:cCodArt, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cCodPr1    := ::oTikCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oTikCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oTikCliL:cValPr1
                  ::oDbf:cValPr2    := ::oTikCliL:cValPr2

                  ::oDbf:cLote      := ::oTikCliL:cLote

                  ::oDbf:cClsDoc    := TIK_CLI
                  ::oDbf:cTipDoc    := "Ticket"
                  ::oDbf:cSerDoc    := ::oTikCliT:cSerTik
                  ::oDbf:cNumDoc    := ::oTikCliT:cNumTik
                  ::oDbf:cSufDoc    := ::oTikCliT:cSufTik

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oTikCliT:dFecTik )
                  ::oDbf:nMesDoc    := Month( ::oTikCliT:dFecTik )
                  ::oDbf:dFecDoc    := ::oTikCliT:dFecTik
                  ::oDbf:cHorDoc    := SubStr( ::oTikCliT:cHorTik, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oTikCliT:cHorTik, 4, 2 )

                  ::oDbf:lKitArt    := ::oTikCliL:lKitArt
                  ::oDbf:lKitChl    := ::oTikCliL:lKitChl

               // A�adimos un nuevo registro-----------------------------------

               ::InsertIfValid()

            end if

            if !Empty( ::oTikCliL:cComTil ) .and. !( ::oTikCliL:lControl ) .and. !( ::oTikCliL:lDelTil )

               ::oDbf:Blank()
               
                  ::oDbf:cCodArt    := ::oTikCliL:cComTil
                  ::oDbf:cNomArt    := ::oTikCliL:cNcmTil

                  ::oDbf:cCodCli    := ::oTikCliT:cCliTik
                  ::oDbf:cNomCli    := ::oTikCliT:cNomTik
                  ::oDbf:cPobCli    := ::oTikCliT:cPobCli
                  ::oDbf:cPrvCli    := ::oTikCliT:cPrvCli
                  ::oDbf:cPosCli    := ::oTikCliT:cPosCli
                  ::oDbf:cCodGrp    := cGruCli( ::oTikCliT:cCliTik, ::oDbfCli )

                  ::oDbf:cCodFam    := ::oTikCliL:cCodFam
                  ::oDbf:cCodTip    := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oTikCliL:cCbaTil, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodAlm    := ::oTikCliL:cAlmLin
                  ::oDbf:cCodPago   := ::oTikCliT:cFpgTik
                  ::oDbf:cCodRut    := ::oTikCliT:cCodRut
                  ::oDbf:cCodAge    := ::oTikCliT:cCodAge
                  ::oDbf:cCodTrn    := ""
                  ::oDbf:cCodUsr    := ::oTikCliT:cCcjTik

                  if ::oTikCliT:cTipTik == "4"
                     ::oDbf:nUniArt := - ::oTikCliL:nUntTil * if( ::lUnidadesNegativo, -1, 1 )
                  else
                     ::oDbf:nUniArt := ::oTikCliL:nUntTil   * if( ::lUnidadesNegativo, -1, 1 )
                  end if

                  ::oDbf:nPreArt    := nImpUTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nValDiv, nil, 2 )

                  ::oDbf:nBrtArt    := nBrtLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nValDiv, nil, 2 )
                  ::oDbf:nImpArt    := nImpLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, nil, 2 )
                  ::oDbf:nIvaArt    := nIvaLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 2 )
                  ::oDbf:nTotArt    := nImpLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, nil, 2 )
                  ::oDbf:nTotArt    += nIvaLTpv( ::oTikCliT, ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 2 )

                  ::oDbf:nCosArt    := nCosLTpv( ::oTikCliL, ::nDecOut, ::nDerOut, ::nValDiv, 2 )
                  if Empty( ::oDbf:nCosArt )
                     ::oDbf:nCosArt := ::oDbf:nUniArt * nCosto( ::oTikCliL:cComTil, ::oDbfArt:cAlias, ::oArtKit:cAlias )
                  end if 

                  ::oDbf:cCodPr1    := ::oTikCliL:cCodPr1
                  ::oDbf:cCodPr2    := ::oTikCliL:cCodPr2
                  ::oDbf:cValPr1    := ::oTikCliL:cValPr1
                  ::oDbf:cValPr2    := ::oTikCliL:cValPr2

                  ::oDbf:cClsDoc    := TIK_CLI
                  ::oDbf:cTipDoc    := "Ticket"
                  ::oDbf:cSerDoc    := ::oTikCliT:cSerTik
                  ::oDbf:cNumDoc    := ::oTikCliT:cNumTik
                  ::oDbf:cSufDoc    := ::oTikCliT:cSufTik

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oTikCliT:dFecTik )
                  ::oDbf:nMesDoc    := Month( ::oTikCliT:dFecTik )
                  ::oDbf:dFecDoc    := ::oTikCliT:dFecTik
                  ::oDbf:cHorDoc    := SubStr( ::oTikCliT:cHorTik, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oTikCliT:cHorTik, 4, 2 )

               ::InsertIfValid()

            end if

            ::oTikCliL:Skip()

         end while

      end if

      ::oTikCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oMtrInf:Set( ::oTikCliT:OrdKeyCount() )

   ::oTikCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oTikCliT:cFile ) )
   ::oTikCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oTikCliL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD listadoArticulo() CLASS TFastVentasArticulos

   local aStockArticulo

   ::oDbfArt:OrdClearScope()   

   ::oMtrInf:SetTotal( ::oDbfArt:OrdKeyCount() )
   ::oMtrInf:AutoInc( ::oDbfArt:OrdKeyCount() )

   ::oMtrInf:cText         := "Procesando art�culos"

   /*
   Recorremos art�culos--------------------------------------------------------
   */

   ::oDbfArt:goTop() 
   while !::oDbfArt:eof() .and. !::lBreak

      ::oDbf:Blank()

      ::oDbf:cCodArt  := ::oDbfArt:cCodArt
      ::oDbf:cCodCli  := ::oDbfArt:cPrvHab
      ::oDbf:cPrvHab  := ::oDbfArt:cPrvHab
      ::oDbf:cNomArt  := ::oDbfArt:Nombre
      ::oDbf:cCodFam  := ::oDbfArt:Familia
      ::oDbf:TipoIva  := ::oDbfArt:TipoIva
      ::oDbf:cCodTip  := ::oDbfArt:cCodTip
      ::oDbf:cCodCate := ::oDbfArt:cCodCate
      ::oDbf:cCodTemp := ::oDbfArt:cCodTemp
      ::oDbf:cCodFab  := ::oDbfArt:cCodFab
      ::oDbf:nCosArt  := nCosto( nil, ::oDbfArt:cAlias, ::oArtKit:cAlias )

      ::InsertIfValid()

      ::oDbfArt:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oMtrInf:AutoInc( ::oDbfArt:OrdKeyCount() )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddArticulo() CLASS TFastVentasArticulos

   local aStockArticulo

   ::oDbf:Zap()
   ::oDbfArt:OrdClearScope()   

   ::oMtrInf:SetTotal(  ::oDbfArt:OrdKeyCount() )
   ::oMtrInf:AutoInc(   ::oDbfArt:OrdKeyCount() )

   ::oMtrInf:cText      := "Procesando art�culos"

   /*
   Recorremos art�culos--------------------------------------------------------
   */

   ::oDbfArt:goTop() 
   while !::oDbfArt:eof() .and. !::lBreak

      aStockArticulo    := ::oStock:aStockArticulo( ::oDbfArt:Codigo, , , , , , ::dFinInf )

      if !empty( aStockArticulo )
         ::appendStockArticulo( aStockArticulo )
      end if 

      ::appendBlankAlmacenes( ::oDbfArt:Codigo )

      ::oDbfArt:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oMtrInf:AutoInc( ::oDbfArt:OrdKeyCount() )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD appendStockArticulo( aStockArticulo )
   
   local sStock

   for each sStock in aStockArticulo

      ::oDbf:Blank()

      ::oDbf:cCodArt    := sStock:cCodigo
      ::oDbf:cSufDoc    := sStock:cDelegacion
      ::oDbf:dFecDoc    := sStock:dFechaDocumento
      ::oDbf:cCodAlm    := sStock:cCodigoAlmacen
      ::oDbf:cCodPr1    := sStock:cCodigoPropiedad1     
      ::oDbf:cCodPr2    := sStock:cCodigoPropiedad2     
      ::oDbf:cValPr1    := sStock:cValorPropiedad1      
      ::oDbf:cValPr2    := sStock:cValorPropiedad1      
      ::oDbf:cLote      := sStock:cLote                 
      ::oDbf:dFecCad    := sStock:dFechaCaducidad       
      ::oDbf:cNumSer    := sStock:cNumeroSerie  
      ::oDbf:nUniArt    := sStock:nUnidades             
      ::oDbf:nPdtRec    := sStock:nPendientesRecibir    
      ::oDbf:nPdtEnt    := sStock:nPendientesEntregar   
      ::oDbf:cNumDoc    := sStock:cNumeroDocumento      
      ::oDbf:cTipDoc    := sStock:cTipoDocumento

      ::fillFromArticulo()

      ::InsertIfValid()

   next 

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD appendBlankAlmacenes( cCodigoArticulo )

   if ::oDbfAlm:Seek( ::oGrupoAlmacen:Cargo:getDesde() )
      while ::oDbfAlm:cCodAlm <= ::oGrupoAlmacen:Cargo:getHasta() .and. !::oDbfAlm:eof()

         if !::existeArticuloInforme( cCodigoArticulo, ::oDbfAlm:cCodAlm )
            ::appendBlankArticulo( cCodigoArticulo, ::oDbfAlm:cCodAlm )
         end if 

         ::oDbfAlm:skip()

      end while
   end if 

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD existeArticuloInforme( cCodigoArticulo, cCodigoAlmacen )

RETURN ( ::oDbf:SeekInOrdBack( cCodigoArticulo + cCodigoAlmacen, "cCodAlm" ) )

//---------------------------------------------------------------------------//

METHOD appendBlankArticulo( cCodigoArticulo, cCodigoAlmacen ) CLASS TFastVentasArticulos

   ::oDbf:Blank()

   ::oDbf:cCodArt  := cCodigoArticulo
   ::oDbf:cCodAlm  := cCodigoAlmacen

   ::fillFromArticulo()

   ::InsertIfValid()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD fillFromArticulo() CLASS TFastVentasArticulos

   ::oDbf:cCodCli    := ::oDbfArt:cPrvHab
   ::oDbf:cNomArt    := ::oDbfArt:Nombre
   ::oDbf:cCodFam    := ::oDbfArt:Familia
   ::oDbf:TipoIva    := ::oDbfArt:TipoIva
   ::oDbf:cCodTip    := ::oDbfArt:cCodTip
   ::oDbf:cCodCate   := ::oDbfArt:cCodCate
   ::oDbf:cCodTemp   := ::oDbfArt:cCodTemp
   ::oDbf:cCodFab    := ::oDbfArt:cCodFab
   ::oDbf:nCosArt    := nCosto( nil, ::oDbfArt:cAlias, ::oArtKit:cAlias )
   ::oDbf:cPrvHab    := ::oDbfArt:cPrvHab

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddParteProduccion() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oProCab:OrdSetFocus( "dFecOrd" )

   cExpHead          := 'dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cSerOrd >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )        + '" .and. cSerOrd <= "'   + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumOrd >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )  + '" ) .and. nNumOrd <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufOrd >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )       + '" .and. cSufOrd <= "'   + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oProCab:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oProCab:cFile ), ::oProCab:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando partes de producci�n"
   
   ::oMtrInf:SetTotal( ::oProCab:OrdKeyCount() )

   /*
   Lineas de produccion----------------------------------------------------------
   */

   cExpLine          := '!lControl'

   if !::lAllArt
      cExpLine       += ' .and. cCodArt >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cCodArt <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oProLin:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oProLin:cFile ), ::oProLin:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oProCab:GoTop()
   while !::lBreak .and. !::oProCab:Eof()

      if lChkSer( ::oProCab:cSerOrd, ::aSer )

         if ::oProLin:Seek( ::oProCab:cSerOrd + Str( ::oProCab:nNumOrd, 9 ) + ::oProCab:cSufOrd )

            while !::lBreak .and. ( ::oProLin:cSerOrd + Str( ::oProLin:nNumOrd, 9 ) + ::oProLin:cSufOrd == ::oProCab:cSerOrd + Str( ::oProCab:nNumOrd, 9 ) + ::oProCab:cSufOrd ) .and. !::oProLin:Eof()

               if !( ::lExcCero  .and. ::oProLin:Unidades() == 0 )  .and.;
                  !( ::lExcImp   .and. ::oProLin:TotalImporte() == 0 )

                     ::oDbf:Blank()

                     ::oDbf:cCodArt    := ::oProLin:cCodArt
                     ::oDbf:cNomArt    := ::oProLin:cNomArt

                     ::oDbf:cCodFam    := ::oProLin:cCodFam
                     ::oDbf:cCodGrp    := ::oProLin:cGrpFam
                     ::oDbf:cCodTip    := ::oProLin:cCodTip
                     ::oDbf:cCodCate   := ::oProLin:cCodCat
                     ::oDbf:cCodTemp   := ::oProLin:cCodTmp
                     ::oDbf:cCodFab    := ::oProLin:cCodFab
                     ::oDbf:cCodAlm    := ::oProLin:cAlmOrd

                     ::oDbf:nUniArt    := ::oProLin:Unidades()
                     ::oDbf:nPreArt    := ::oProLin:nImpOrd

                     ::oDbf:nBrtArt    := ::oProLin:TotalImporte()
                     ::oDbf:nTotArt    := ::oProLin:TotalImporte()

                     ::oDbf:cCodPr1    := ::oProLin:cCodPr1
                     ::oDbf:cCodPr2    := ::oProLin:cCodPr2
                     ::oDbf:cValPr1    := ::oProLin:cValPr1
                     ::oDbf:cValPr2    := ::oProLin:cValPr2

                     ::oDbf:cClsDoc    := PAR_PRO
                     ::oDbf:cTipDoc    := "Parte producci�n"

                     ::oDbf:cSerDoc    := ::oProCab:cSerOrd
                     ::oDbf:cNumDoc    := Str( ::oProCab:nNumOrd )
                     ::oDbf:cSufDoc    := ::oProCab:cSufOrd

                     ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                     ::oDbf:nAnoDoc    := Year( ::oProCab:dFecOrd )
                     ::oDbf:nMesDoc    := Month( ::oProCab:dFecOrd )
                     ::oDbf:dFecDoc    := ::oProCab:dFecOrd

                  ::InsertIfValid()

               end if

               ::oPedPrvL:Skip()

            end while

         end if

      end if

      ::oProCab:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oProCab:IdxDelete( cCurUsr(), GetFileNoExt( ::oProCab:cFile ) )
   ::oProLin:IdxDelete( cCurUsr(), GetFileNoExt( ::oProLin:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddPedidoProveedor() CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oPedPrvT:OrdSetFocus( "dFecPed" )
   ::oPedPrvL:OrdSetFocus( "nNumPed" )

   cExpHead          := 'dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodPrv >= "' + Rtrim( ::oGrupoProveedor:Cargo:getDesde() )    + '" .and. cCodPrv <= "'   + Rtrim( ::oGrupoProveedor:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerPed >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )        + '" .and. cSerPed <= "'   + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumPed >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )  + '" ) .and. nNumPed <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufPed >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )       + '" .and. cSufPed <= "'   + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oPedPrvT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedPrvT:cFile ), ::oPedPrvT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando pedidos a proveedor"
   ::oMtrInf:SetTotal( ::oPedPrvT:OrdKeyCount() )

   /*
   Lineas de Pedturas----------------------------------------------------------
   */

   cExpLine          := '!lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oPedPrvL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedPrvL:cFile ), ::oPedPrvL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oPedPrvT:GoTop()

   while !::lBreak .and. !::oPedPrvT:Eof()

      if lChkSer( ::oPedPrvT:cSerPed, ::aSer )

         if ::oPedPrvL:Seek( ::oPedPrvT:cSerPed + Str( ::oPedPrvT:nNumPed ) + ::oPedPrvT:cSufPed )

            while !::lBreak .and. ( ::oPedPrvT:cSerPed + Str( ::oPedPrvT:nNumPed ) + ::oPedPrvT:cSufPed == ::oPedPrvL:cSerPed + Str( ::oPedPrvL:nNumPed ) + ::oPedPrvL:cSufPed ) .and. !::oPedPrvL:Eof()

               if !( ::lExcCero  .and. nTotNPedPrv( ::oPedPrvL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLPedPrv( ::oPedPrvT:cAlias, ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                     ::oDbf:Blank()

                     ::oDbf:cCodArt    := ::oPedPrvL:cRef
                     ::oDbf:cNomArt    := ::oPedPrvL:cDetalle

                     ::oDbf:cCodFam    := ::oPedPrvL:cCodFam
                     ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oPedPrvL:nIva )
                     ::oDbf:cCodTip    := RetFld( ::oPedPrvL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                     ::oDbf:cCodCate   := RetFld( ::oPedPrvL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                     ::oDbf:cCodTemp   := RetFld( ::oPedPrvL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                     ::oDbf:cCodFab    := RetFld( ::oPedPrvL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                     ::oDbf:cCodGrp    := RetFld( ::oPedPrvL:cRef, ::oDbfArt:cAlias, "GrpVent", "Codigo" )
                     ::oDbf:cCodCli    := ::oPedPrvT:cCodPrv
                     ::oDbf:cNomCli    := ::oPedPrvT:cNomPrv
                     ::oDbf:cPobCli    := ::oPedPrvT:cPobPrv
                     ::oDbf:cPrvCli    := ::oPedPrvT:cProPrv
                     ::oDbf:cPosCli    := ::oPedPrvT:cPosPrv
                     ::oDbf:cCodAlm    := ::oPedPrvL:cAlmLin
                     ::oDbf:cCodPago   := ::oPedPrvT:cCodPgo
                     ::oDbf:cCodRut    := ""
                     ::oDbf:cCodAge    := ""
                     ::oDbf:cCodTrn    := ""
                     ::oDbf:cCodUsr    := ::oPedPrvT:cCodUsr

                     ::oDbf:nUniArt    := nTotNPedPrv( ::oPedPrvL:cAlias )
                     ::oDbf:nPreArt    := nImpUPedPrv( ::oPedPrvT:cAlias, ::oPedPrvL:cAlias, ::nDerOut, ::nValDiv )

                     ::oDbf:nDtoArt    := ::oPedPrvL:nDtoLin                     
                     ::oDbf:nPrmArt    := ::oPedPrvL:nDtoPrm

                     ::oDbf:nTotDto    := nDtoLPedPrv( ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                     ::oDbf:nTotPrm    := nPrmLPedPrv( ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                     ::oDbf:nBrtArt    := nBrtLPedPrv( ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                     ::oDbf:nImpArt    := nImpLPedPrv( ::oPedPrvT:cAlias, ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                     ::oDbf:nIvaArt    := nIvaLPedPrv(::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                     ::oDbf:nTotArt    := nImpLPedPrv( ::oPedPrvT:cAlias, ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                     ::oDbf:nTotArt    += nIvaLPedPrv(::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                     ::oDbf:nCosArt    := 0

                     ::oDbf:cCodPr1    := ::oPedPrvL:cCodPr1
                     ::oDbf:cCodPr2    := ::oPedPrvL:cCodPr2
                     ::oDbf:cValPr1    := ::oPedPrvL:cValPr1
                     ::oDbf:cValPr2    := ::oPedPrvL:cValPr2

                     ::oDbf:cClsDoc    := PED_PRV
                     ::oDbf:cTipDoc    := "Pedido proveedor"
                     ::oDbf:cSerDoc    := ::oPedPrvT:cSerPed
                     ::oDbf:cNumDoc    := Str( ::oPedPrvT:nNumPed )
                     ::oDbf:cSufDoc    := ::oPedPrvT:cSufPed

                     ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                     ::oDbf:nAnoDoc    := Year( ::oPedPrvT:dFecPed )
                     ::oDbf:nMesDoc    := Month( ::oPedPrvT:dFecPed )
                     ::oDbf:dFecDoc    := ::oPedPrvT:dFecPed
                     ::oDbf:cHorDoc    := SubStr( ::oPedPrvT:cTimChg, 1, 2 )
                     ::oDbf:cMinDoc    := SubStr( ::oPedPrvT:cTimChg, 4, 2 )

                     ::oDbf:nBultos    := ::oPedPrvL:nBultos   
                     ::oDbf:cFormtao   := ::oPedPrvL:cFormato
                     ::oDbf:nCajas     := ::oPedPrvL:nCanPed

                  ::InsertIfValid()

               end if

               ::oPedPrvL:Skip()

            end while

         end if

      end if

      ::oPedPrvT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oPedPrvT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedPrvT:cFile ) )
   ::oPedPrvL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedPrvL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddAlbaranProveedor( lFacturados ) CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   DEFAULT lFacturados  := .f.

   ::oAlbPrvT:OrdSetFocus( "dFecAlb" )
   ::oAlbPrvL:OrdSetFocus( "nNumAlb" )

   if lFacturados
      cExpHead          := '!lFacturado .and. dFecAlb >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecAlb <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   else
      cExpHead          := 'dFecAlb >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecAlb <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   end if

   cExpHead             += ' .and. cCodPrv >= "' + Rtrim( ::oGrupoProveedor:Cargo:getDesde() )    + '" .and. cCodPrv <= "'   + Rtrim( ::oGrupoProveedor:Cargo:getHasta() ) + '"'
   cExpHead             += ' .and. cSerAlb >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )        + '" .and. cSerAlb <= "'   + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead             += ' .and. nNumAlb >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )  + '" ) .and. nNumAlb <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead             += ' .and. cSufAlb >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )       + '" .and. cSufAlb <= "'   + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oAlbPrvT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbPrvT:cFile ), ::oAlbPrvT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText      := "Procesando albaranes a proveedor"
   ::oMtrInf:SetTotal( ::oAlbPrvT:OrdKeyCount() )

   /*
   Lineas de Albturas----------------------------------------------------------
   */

   cExpLine             := '!lControl'

   if !::lAllArt
      cExpLine          += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oAlbPrvL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbPrvL:cFile ), ::oAlbPrvL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oAlbPrvT:GoTop()

   while !::lBreak .and. !::oAlbPrvT:Eof()

      if lChkSer( ::oAlbPrvT:cSerAlb, ::aSer )

         if ::oAlbPrvL:Seek( ::oAlbPrvT:cSerAlb + Str( ::oAlbPrvT:nNumAlb ) + ::oAlbPrvT:cSufAlb )

            while !::lBreak .and. ( ::oAlbPrvT:cSerAlb + Str( ::oAlbPrvT:nNumAlb ) + ::oAlbPrvT:cSufAlb == ::oAlbPrvL:cSerAlb + Str( ::oAlbPrvL:nNumAlb ) + ::oAlbPrvL:cSufAlb ) .and. !::oAlbPrvL:Eof()

               if !( ::lExcCero  .and. nTotNAlbPrv( ::oAlbPrvL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLAlbPrv( ::oAlbPrvT:cAlias, ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oAlbPrvL:cRef
                  ::oDbf:cNomArt    := ::oAlbPrvL:cDetalle

                  ::oDbf:cCodFam    := ::oAlbPrvL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oAlbPrvL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oAlbPrvL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oAlbPrvL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oAlbPrvL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oAlbPrvL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodGrp    := RetFld( ::oAlbPrvL:cRef, ::oDbfArt:cAlias, "GrpVent", "Codigo" )
                  ::oDbf:cCodCli    := ::oAlbPrvT:cCodPrv
                  ::oDbf:cNomCli    := ::oAlbPrvT:cNomPrv
                  ::oDbf:cPobCli    := ::oAlbPrvT:cPobPrv
                  ::oDbf:cPrvCli    := ::oAlbPrvT:cProPrv
                  ::oDbf:cPosCli    := ::oAlbPrvT:cPosPrv
                  ::oDbf:cCodAlm    := ::oAlbPrvL:cAlmLin
                  ::oDbf:cCodPago   := ::oAlbPrvT:cCodPgo
                  ::oDbf:cCodRut    := ""
                  ::oDbf:cCodAge    := ""
                  ::oDbf:cCodTrn    := ""
                  ::oDbf:cCodUsr    := ::oAlbPrvT:cCodUsr

                  
                  ::oDbf:nPreArt    := nImpUAlbPrv( ::oAlbPrvT:cAlias, ::oAlbPrvL:cAlias, ::nDerOut, ::nValDiv )
                  ::oDbf:nUniArt    := nTotNAlbPrv( ::oAlbPrvL:cAlias )
                  ::oDbf:nBrtArt    := nBrtLAlbPrv( ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nDtoArt    := ::oAlbPrvL:nDtoLin                     
                  ::oDbf:nPrmArt    := ::oAlbPrvL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLAlbPrv( ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLAlbPrv( ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nImpArt    := nImpLAlbPrv( ::oAlbPrvT:cAlias, ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLAlbPrv( ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLAlbPrv( ::oAlbPrvT:cAlias, ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLAlbPrv( ::oAlbPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nCosArt    := 0

                  ::oDbf:cCodPr1    := ::oAlbPrvL:cCodPr1
                  ::oDbf:cCodPr2    := ::oAlbPrvL:cCodPr2
                  ::oDbf:cValPr1    := ::oAlbPrvL:cValPr1
                  ::oDbf:cValPr2    := ::oAlbPrvL:cValPr2

                  ::oDbf:cLote      := ::oAlbPrvL:cLote
                  ::oDbf:dFecCad    := ::oAlbPrvL:dFecCad

                  ::oDbf:cClsDoc    := ALB_PRV
                  ::oDbf:cTipDoc    := "Albar�n proveedor"
                  ::oDbf:cSerDoc    := ::oAlbPrvT:cSerAlb
                  ::oDbf:cNumDoc    := Str( ::oAlbPrvT:nNumAlb )
                  ::oDbf:cSufDoc    := ::oAlbPrvT:cSufAlb 

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oAlbPrvT:dFecAlb )
                  ::oDbf:nMesDoc    := Month( ::oAlbPrvT:dFecAlb )
                  ::oDbf:dFecDoc    := ::oAlbPrvT:dFecAlb
                  ::oDbf:cHorDoc    := SubStr( ::oAlbPrvT:cTimChg, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oAlbPrvT:cTimChg, 4, 2 )

                  ::oDbf:nBultos    := ::oAlbPrvL:nBultos
                  ::oDbf:cFOrmato   := ::oAlbPrvL:cFOrmato
                  ::oDBf:nCajas      := ::oAlbPrvL:nCanEnt

                  ::InsertIfValid()
                  
               end if

               ::oAlbPrvL:Skip()

            end while

         end if

      end if

      ::oAlbPrvT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oAlbPrvT:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbPrvT:cFile ) )
   ::oAlbPrvL:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbPrvL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddFacturaProveedor( cCodigoArticulo ) CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oFacPrvT:OrdSetFocus( "dFecFac" )
   ::oFacPrvL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodPrv >= "' + Rtrim( ::oGrupoProveedor:Cargo:getDesde() )    + '" .and. cCodPrv <= "'   + Rtrim( ::oGrupoProveedor:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerFac >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )        + '" .and. cSerFac <= "'   + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumFac >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() )  + '" ) .and. nNumFac <= Val( "'   + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufFac >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )       + '" .and. cSufFac <= "'   + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oFacPrvT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacPrvT:cFile ), ::oFacPrvT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando facturas proveedor"
   ::oMtrInf:SetTotal( ::oFacPrvT:OrdKeyCount() )

   /*
   Lineas de facturas----------------------------------------------------------
   */

   cExpLine          := '!lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oFacPrvL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacPrvL:cFile ), ::oFacPrvL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oFacPrvT:GoTop()

   while !::lBreak .and. !::oFacPrvT:Eof()

      if lChkSer( ::oFacPrvT:cSerFac, ::aSer )

         if ::oFacPrvL:Seek( ::oFacPrvT:cSerFac + Str( ::oFacPrvT:nNumFac ) + ::oFacPrvT:cSufFac )

            while !::lBreak .and. ( ::oFacPrvT:cSerFac + Str( ::oFacPrvT:nNumFac ) + ::oFacPrvT:cSufFac == ::oFacPrvL:cSerFac + Str( ::oFacPrvL:nNumFac ) + ::oFacPrvL:cSufFac )

               if !( ::lExcCero  .and. nTotNFacPrv( ::oFacPrvL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLFacPrv( ::oFacPrvT:cAlias, ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oFacPrvL:cRef
                  ::oDbf:cNomArt    := ::oFacPrvL:cDetalle

                  ::oDbf:cCodFam    := ::oFacPrvL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oFacPrvL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oFacPrvL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oFacPrvL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oFacPrvL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oFacPrvL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodGrp    := RetFld( ::oFacPrvL:cRef, ::oDbfArt:cAlias, "GrpVent", "Codigo" )
                  ::oDbf:cCodCli    := ::oFacPrvT:cCodPrv
                  ::oDbf:cNomCli    := ::oFacPrvT:cNomPrv
                  ::oDbf:cPobCli    := ::oFacPrvT:cPobPrv
                  ::oDbf:cPrvCli    := ::oFacPrvT:cProvProv
                  ::oDbf:cPosCli    := ::oFacPrvT:cPosPrv
                  ::oDbf:cCodAlm    := ::oFacPrvL:cAlmLin
                  ::oDbf:cCodPago   := ::oFacPrvT:cCodPago
                  ::oDbf:cCodRut    := ""
                  ::oDbf:cCodAge    := ::oFacPrvT:cCodAge
                  ::oDbf:cCodTrn    := ""
                  ::oDbf:cCodUsr    := ::oFacPrvT:cCodUsr

                  ::oDbf:nPreArt    := nImpUFacPrv( ::oFacPrvT:cAlias, ::oFacPrvL:cAlias, ::nDerOut, ::nValDiv )
                  ::oDbf:nUniArt    := nTotNFacPrv( ::oFacPrvL:cAlias )

                  ::oDbf:nDtoArt    := ::oFacPrvL:nDtoLin                     
                  ::oDbf:nPrmArt    := ::oFacPrvL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLFacPrv( ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLFacPrv( ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )


                  ::oDbf:nBrtArt    := nBrtLFacPrv( ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLFacPrv( ::oFacPrvT:cAlias, ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLFacPrv( ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLFacPrv( ::oFacPrvT:cAlias, ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLFacPrv( ::oFacPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nCosArt    := 0

                  ::oDbf:cCodPr1    := ::oFacPrvL:cCodPr1
                  ::oDbf:cCodPr2    := ::oFacPrvL:cCodPr2
                  ::oDbf:cValPr1    := ::oFacPrvL:cValPr1
                  ::oDbf:cValPr2    := ::oFacPrvL:cValPr2

                  ::oDbf:cLote      := ::oFacPrvL:cLote
                  ::oDbf:dFecCad    := ::oFacPrvL:dFecCad

                  ::oDbf:cClsDoc    := FAC_PRV
                  ::oDbf:cTipDoc    := "Factura proveedor"
                  ::oDbf:cSerDoc    := ::oFacPrvT:cSerFac
                  ::oDbf:cNumDoc    := Str( ::oFacPrvT:nNumFac )
                  ::oDbf:cSufDoc    := ::oFacPrvT:cSufFac

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oFacPrvT:dFecFac )
                  ::oDbf:nMesDoc    := Month( ::oFacPrvT:dFecFac )
                  ::oDbf:dFecDoc    := ::oFacPrvT:dFecFac
                  ::oDbf:cHorDoc    := SubStr( ::oFacPrvT:cTimChg, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oFacPrvT:cTimChg, 4, 2 )

                  ::oDbf:nBultos    := ::oFacPrvL:nBultos
                  ::oDbf:cFormato   := ::oFacPrvL:cFormato
                  ::oDbf:nCajas     := ::oFacPrvL:nCanEnt

                  ::InsertIfValid()

               end if

               ::oFacPrvL:Skip()

            end while

         end if

      end if

      ::oFacPrvT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oFacPrvT:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacPrvT:cFile ) )
   ::oFacPrvL:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacPrvL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddRectificativaProveedor( cCodigoArticulo ) CLASS TFastVentasArticulos

   local cExpHead
   local cExpLine

   ::oRctPrvT:OrdSetFocus( "dFecFac" )
   ::oRctPrvL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   cExpHead          += ' .and. cCodPrv >= "' + Rtrim( ::oGrupoProveedor:Cargo:getDesde() ) + '" .and. cCodPrv <= "'   + Rtrim( ::oGrupoProveedor:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. cSerFac >= "' + Rtrim( ::oGrupoSerie:Cargo:getDesde() )     + '" .and. cSerFac <= "'   + Rtrim( ::oGrupoSerie:Cargo:getHasta() ) + '"'
   cExpHead          += ' .and. nNumFac >= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getDesde() ) + '" ) .and. nNumFac <= Val( "' + Rtrim( ::oGrupoNumero:Cargo:getHasta() ) + '" )'
   cExpHead          += ' .and. cSufFac >= "' + Rtrim( ::oGrupoSufijo:Cargo:getDesde() )    + '" .and. cSufFac <= "'   + Rtrim( ::oGrupoSufijo:Cargo:getHasta() ) + '"'

   ::oRctPrvT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oRctPrvT:cFile ), ::oRctPrvT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando rectificativas"
   ::oMtrInf:SetTotal( ::oRctPrvT:OrdKeyCount() )

   /*
   Lineas de facturas----------------------------------------------------------
   */

   cExpLine          := '!lControl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::oGrupoArticulo:Cargo:getDesde() + '" .and. cRef <= "' + ::oGrupoArticulo:Cargo:getHasta() + '"'
   end if

   ::oRctPrvL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oRctPrvL:cFile ), ::oRctPrvL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oRctPrvT:GoTop()

   while !::lBreak .and. !::oRctPrvT:Eof()

      if lChkSer( ::oRctPrvT:cSerFac, ::aSer )

         if ::oRctPrvL:Seek( ::oRctPrvT:cSerFac + Str( ::oRctPrvT:nNumFac ) + ::oRctPrvT:cSufFac )

            while !::lBreak .and. ( ::oRctPrvT:cSerFac + Str( ::oRctPrvT:nNumFac ) + ::oRctPrvT:cSufFac == ::oRctPrvL:cSerFac + Str( ::oRctPrvL:nNumFac ) + ::oRctPrvL:cSufFac )

               if !( ::lExcCero  .and. nTotNRctPrv( ::oRctPrvL:cAlias ) == 0 )  .and.;
                  !( ::lExcImp   .and. nImpLRctPrv( ::oRctPrvT:cAlias, ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::oDbf:Blank()

                  ::oDbf:cCodArt    := ::oRctPrvL:cRef
                  ::oDbf:cNomArt    := ::oRctPrvL:cDetalle

                  ::oDbf:cCodFam    := ::oRctPrvL:cCodFam
                  ::oDbf:TipoIva    := cCodigoIva( ::oDbfIva:cAlias, ::oRctPrvL:nIva )
                  ::oDbf:cCodTip    := RetFld( ::oRctPrvL:cRef, ::oDbfArt:cAlias, "cCodTip", "Codigo" )
                  ::oDbf:cCodCate   := RetFld( ::oRctPrvL:cRef, ::oDbfArt:cAlias, "cCodCate", "Codigo" )
                  ::oDbf:cCodTemp   := RetFld( ::oRctPrvL:cRef, ::oDbfArt:cAlias, "cCodTemp", "Codigo" )
                  ::oDbf:cCodFab    := RetFld( ::oRctPrvL:cRef, ::oDbfArt:cAlias, "cCodFab", "Codigo" )
                  ::oDbf:cCodGrp    := RetFld( ::oRctPrvL:cRef, ::oDbfArt:cAlias, "GrpVent", "Codigo" )
                  ::oDbf:cCodCli    := ::oRctPrvT:cCodPrv
                  ::oDbf:cNomCli    := ::oRctPrvT:cNomPrv
                  ::oDbf:cPobCli    := ::oRctPrvT:cPobPrv
                  ::oDbf:cPrvCli    := ::oRctPrvT:cProvProv
                  ::oDbf:cPosCli    := ::oRctPrvT:cPosPrv
                  ::oDbf:cCodAlm    := ::oRctPrvL:cAlmLin
                  ::oDbf:cCodPago   := ::oRctPrvT:cCodPago
                  ::oDbf:cCodRut    := ""
                  ::oDbf:cCodAge    := ::oRctPrvT:cCodAge
                  ::oDbf:cCodTrn    := ""
                  ::oDbf:cCodUsr    := ::oRctPrvT:cCodUsr

                  ::oDbf:nPreArt    := nImpURctPrv( ::oRctPrvT:cAlias, ::oRctPrvL:cAlias, ::nDerOut, ::nValDiv )
                  ::oDbf:nUniArt    := nTotNRctPrv( ::oRctPrvL:cAlias )

                  ::oDbf:nDtoArt    := ::oRctPrvL:nDtoLin                     
                  ::oDbf:nPrmArt    := ::oRctPrvL:nDtoPrm

                  ::oDbf:nTotDto    := nDtoLRctPrv( ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotPrm    := nPrmLRctPrv( ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                  ::oDbf:nBrtArt    := nBrtLRctPrv( ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nImpArt    := nImpLRctPrv( ::oRctPrvT:cAlias, ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t. )
                  ::oDbf:nIvaArt    := nIvaLRctPrv( ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nTotArt    := nImpLRctPrv( ::oRctPrvT:cAlias, ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                  ::oDbf:nTotArt    += nIvaLRctPrv( ::oRctPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                  ::oDbf:nCosArt    := 0

                  ::oDbf:cCodPr1    := ::oRctPrvL:cCodPr1
                  ::oDbf:cCodPr2    := ::oRctPrvL:cCodPr2
                  ::oDbf:cValPr1    := ::oRctPrvL:cValPr1
                  ::oDbf:cValPr2    := ::oRctPrvL:cValPr2

                  ::oDbf:cLote      := ::oRctPrvL:cLote
                  ::oDbf:dFecCad    := ::oRctPrvL:dFecCad

                  ::oDbf:cClsDoc    := RCT_PRV
                  ::oDbf:cTipDoc    := "Rectificativa proveedor"
                  ::oDbf:cSerDoc    := ::oRctPrvT:cSerFac
                  ::oDbf:cNumDoc    := Str( ::oRctPrvT:nNumFac )
                  ::oDbf:cSufDoc    := ::oRctPrvT:cSufFac

                  ::oDbf:cIdeDoc    :=  ::cIdeDocumento()

                  ::oDbf:nAnoDoc    := Year( ::oRctPrvT:dFecFac )
                  ::oDbf:nMesDoc    := Month( ::oRctPrvT:dFecFac )
                  ::oDbf:dFecDoc    := ::oRctPrvT:dFecFac
                  ::oDbf:cHorDoc    := SubStr( ::oRctPrvT:cTimChg, 1, 2 )
                  ::oDbf:cMinDoc    := SubStr( ::oRctPrvT:cTimChg, 4, 2 )

                  ::oDbf:nBultos    := ::oRctPrvL:nBultos
                  ::oDbf:cFormato   := ::oRctPrvL:cFormato
                  ::oDbf:nCajas     := ::oRctPrvL:nCanEnt

                  ::InsertIfValid()

               end if

               ::oRctPrvL:Skip()

            end while

         end if

      end if

      ::oRctPrvT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oRctPrvT:IdxDelete( cCurUsr(), GetFileNoExt( ::oRctPrvT:cFile ) )
   ::oRctPrvL:IdxDelete( cCurUsr(), GetFileNoExt( ::oRctPrvL:cFile ) )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD StartDialog() CLASS TFastVentasArticulos

   /*
   Imagenes--------------------------------------------------------------------
   */

   ::CreateTreeImageList()

   ::BuildTree()

   ::BuildReportCorrespondences()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD AddVariableStock()
   
   ::oFastReport:AddVariable( "Stock", "Costo medio",             "CallHbFunc( 'oTInfGen', ['nCostoMedio', ''])" )
   ::oFastReport:AddVariable( "Stock", "Costo medio propiedades", "CallHbFunc( 'oTInfGen', ['nCostoMedioPropiedades', ''])" )
   ::oFastReport:AddVariable( "Stock", "Total stock",             "CallHbFunc( 'oTInfGen', ['nTotalStockArticulo', ''])" )

RETURN ( Self )

//---------------------------------------------------------------------------//