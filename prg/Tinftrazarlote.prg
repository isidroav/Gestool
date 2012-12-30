#include "FiveWin.Ch"
#include "Font.ch"
#include "Factu.ch"
#include "MesDbf.ch"

//---------------------------------------------------------------------------//

CLASS TInfTrazLot FROM TInfGen

   DATA  oDbfTmp  AS OBJECT
   DATA  cLote    AS CHARACTER

   METHOD Create()

   METHod lResource( cFld )

   METHOD OpenFiles()

   METHOD CloseFiles()

   METHOD lGenerate()

END CLASS

//---------------------------------------------------------------------------//

METHOD OpenFiles() CLASS TInfTrazLot
RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD CloseFiles() CLASS TInfTrazLot
RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Create()

   ::AddField( "cTipDoc",  "C",27, 0, {|| "@!" },     "Tip. Doc.",    .f., "Tipo de documento",     25, .f.  )
   ::AddField( "cNumDoc",  "C",12, 0, {|| "@!" },     "Num. Doc.",    .t., "N�mero del documento",  15, .f.  )
   ::AddField( "dFecDoc",  "D", 8, 0, {|| "@!" },     "Fecha",        .t., "Fecha del documento",   12, .f.  )
   ::AddField( "cCodCli",  "C",12, 0, {|| "@!" },     "Cod. Cli/Prv", .t., "C�digo del Cli/Prv",    15, .f.  )
   ::AddField( "cCliPrv",  "C",50, 0, {|| "@!" },     "Nom. Cli/Prv", .t., "Nombre del Cli/Prv",    50, .f.  )
   ::AddField( "cCodObr",  "C",10, 0, {|| "@!" },     "Obra",         .f., "Obra",                  10, .f.  )
   ::AddField( "cCodArt",  "C",18, 0, {|| "@!" },     "Cod. Art.",    .t., "C�digo del art�culo",   18, .f.  )
   ::AddField( "cNomArt",  "C",100, 0, {|| "@!" },    "Nom. Art.",    .t., "Nombre del art�culo",   20, .f.  )
   ::AddField( "nUnidades","N",16, 6, {|| MasUnd() }, "Und.",         .t., "Unidades de art�culo",  10, .t.  )

   ::AddTmpIndex ( "cTipDoc", "cTipDoc + Dtos( dFecDoc )" )

   ::AddGroup( {|| ::oDbf:cTipDoc }, {|| "Documento : " + Rtrim( ::oDbf:cTipDoc ) }, {||"Total grupo..."} )

   ::lDefSerInf := .f.

   ::oDbfTmp   := ::xOthers[ 1 ]
   ::cLote     := ::xOthers[ 2 ]

RETURN ( Self )

//---------------------------------------------------------------------------//

METHod lResource( cFld )

   if !::StdResource( "INF_TRAZALOTE" )
      return .f.
   end if

   ::oBtnFilter:Disable()

   ::oMtrInf:SetTotal( ::oDbfTmp:Lastrec() )

RETURN .t.

//---------------------------------------------------------------------------//
/*
Esta funcion crea la base de datos para generar posteriormente el informe
*/

METHOD lGenerate()

   ::oDlg:Disable()
   ::oDbf:Zap()

   ::oDbfTmp:GoTop()

   ::aHeader      := {  {|| "Fecha  : " + Dtoc( Date() )     },;
                        {|| "Lote   : " + AllTrim( ::cLote ) } }

   while !::oDbfTmp:Eof()

      if ::oDbfTmp:dFecDoc >= ::dIniInf     .AND.;
         ::oDbfTmp:dFecDoc <= ::dFinInf

         ::oDbf:Append()

         ::oDbf:cTipDoc     := AllTrim( ::oDbfTmp:cTipDoc )
         ::oDbf:cNumDoc     := ::oDbfTmp:cNumDoc
         ::oDbf:cCodArt     := ::oDbfTmp:cCodArt
         ::oDbf:cNomArt     := AllTrim( ::oDbfTmp:cNomArt )

         do case
            case ( AllTrim( ::oDbfTmp:cTipDoc )  == "Pedido a proveedor"              .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Albar�n de proveedor"               .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Factura de proveedor"               .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Movimiento de almac�n"              .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Material producido" )

                 ::oDbf:nUnidades   := ::oDbfTmp:nUnidades

            case ( AllTrim( ::oDbfTmp:cTipDoc ) == "Presupuesto de cliente"           .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Pedido de cliente"                  .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Albar�n de cliente"                 .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Factura de cliente"                 .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Factura rectificativa de cliente"   .or.;
                 AllTrim( ::oDbfTmp:cTipDoc ) == "Material consumido" )

                 ::oDbf:nUnidades   := -( ::oDbfTmp:nUnidades )

         end case

         ::oDbf:dFecDoc     := ::oDbfTmp:dFecDoc
         ::oDbf:cCodCli     := ::oDbfTmp:cCodCli
         ::oDbf:cCliPrv     := ::oDbfTmp:cCliPrv
         ::oDbf:cCodObr     := ::oDbfTmp:cCodObr

         ::oDbf:Save()

      end if

      ::oDbfTmp:Skip()

      ::oMtrInf:AutoInc( ::oDbfTmp:OrdKeyNo() )

   end do

   ::oMtrInf:AutoInc( ::oDbfTmp:LastRec() )

   ::oDlg:Enable()

   ::oBtnFilter:Disable()

   ::oDbfTmp:GoTop()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//