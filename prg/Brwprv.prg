#include "FiveWin.Ch"
#include "Folder.ch"
#include "Report.ch"
#include "Label.ch"
#include "Factu.ch"
#include "MesDbf.ch"
#include "TGraph.ch"

static dbfPedPrvT
static dbfPedPrvL
static dbfAlbPrvT
static dbfAlbPrvL
static dbfFacPrvT
static dbfFacPrvL
static dbfRctPrvT
static dbfRctPrvL
static dbfFacPrvP
static dbfFPago
static oDbfTmp

static oBtnFiltro
static oFilter    := nil

static oMenu
static oTreeImageList
static oTreeDocument
static oTreePedidos
static aCom
static aTotCom
static oCom
static oTotCom
static oBrwTmp
static nComFac    := 0
static nCobFac    := 0
static oTotFac
static oTotCob
static oTotal
static oGraph

static cPouDiv
static cPinDiv
static cPirDiv
static cPorDiv
static nDouDiv
static nDorDiv
static nDinDiv
static nDirDiv
static cPicUnd
static nVdvDiv

//---------------------------------------------------------------------------//

Static Function OpenFiles()

   local lOpen       := .f.
   local oError
   local oBlock

   CursorWait()

   oTotCom           := Array( 3 )
   oCom              := Array( 12, 3 )
   aTotCom           := Afill( Array( 3 ), 0 )
   aCom              := Array( 12, 3 )

   aEval( aCom, {|a| Afill( a, 0 ) } )

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      /*
      Documentos relacionados de compras
      */

      USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @dbfPedPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE
      SET TAG TO "cCodPrv"

      USE ( cPatEmp() + "PEDPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVL", @dbfPedPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBPROVT.CDX" ) ADDITIVE
      SET TAG TO "cCodPrv"

      USE ( cPatEmp() + "ALBPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBPROVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "FACPRVT.CDX" ) ADDITIVE
      SET TAG TO "cCodPrv"

      USE ( cPatEmp() + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "FACPRVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvT", @dbfRctPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE
      SET TAG TO "cCodPrv"

      USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FacPrvP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvP", @dbfFacPrvP ) )
      SET ADSINDEX TO ( cPatEmp() + "FacPrvP.CDX" ) ADDITIVE
      SET TAG TO "cCodPrv"

      USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
      SET ADSINDEX TO ( cPatGrp() + "FPAGO.CDX" ) ADDITIVE

      oDbfTmp        := DefineTemporal()
      oDbfTmp:Activate( .f., .f. )

      lOpen          := .t.

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir las bases de datos" )
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

   CursorWE()

Return ( lOpen )

//---------------------------------------------------------------------------//

Static Function CloseFiles()

   ( dbfPedPrvT )->( dbCloseArea() )
   ( dbfPedPrvL )->( dbCloseArea() )
   ( dbfAlbPrvT )->( dbCloseArea() )
   ( dbfAlbPrvL )->( dbCloseArea() )
   ( dbfFacPrvT )->( dbCloseArea() )
   ( dbfFacPrvL )->( dbCloseArea() )
   ( dbfFacPrvP )->( dbCloseArea() )
   ( dbfFPago   )->( dbCloseArea() )
   ( dbfRctPrvT )->( dbCloseArea() )
   ( dbfRctPrvL )->( dbCloseArea() )

   oDbfTmp:Close()

   dbfErase( oDbfTmp:cPath + oDbfTmp:cName )

Return ( .t. )

//---------------------------------------------------------------------------//

function BrwComPrv( cCodPrv, cNomPrv, dbfDiv, dbfIva )

   local oDlg
   local oFld
   local oTree
   local oBrwCom
   local aDbfBmp
   local oCmbAnio
   local cCmbAnio          := "Todos" //Str( Year( GetSysDate() ) )
   local oBmpGeneral
   local oBmpDocumentos
   local oBmpGraficos

   if !OpenFiles()
      Return nil
   end if

   oFilter                 := TDlgFlt():Create( oDbfTmp, , .f. )
   oFilter:bOnAplyFilter   := {|| oDbfTmp:SetFilter( oFilter:cExpFilter ), oBrwTmp:Refresh() }
   oFilter:bOnKillFilter   := {|| oDbfTmp:SetFilter(), oBrwTmp:Refresh() }

   aDbfBmp           := {  LoadBitmap( GetResources(), "bRed"   ),;
                           LoadBitmap( GetResources(), "bYelow" ),;
                           LoadBitmap( GetResources(), "bGreen" ),;
                           LoadBitmap( GetResources(), "bmpLock"),;
                           LoadBitmap( GetResources(), "Clipboard_empty_businessman_16" ),;
                           LoadBitmap( GetResources(), "Document_plain_businessman_16" ),;
                           LoadBitmap( GetResources(), "Document_businessman_16" ),;
                           LoadBitmap( GetResources(), "MovAlm" ),;
                           LoadBitmap( GetResources(), "PreCli" ),;
                           LoadBitmap( GetResources(), "PedCli" ),;
                           LoadBitmap( GetResources(), "AlbCli" ),;
                           LoadBitmap( GetResources(), "FacCli" ),;
                           LoadBitmap( GetResources(), "TikCli" ),;
                           LoadBitmap( GetResources(), "Document_navigate_cross_16" ) }

   cPicUnd           := MasUnd()
   cPouDiv           := cPouDiv( cDivEmp(), dbfDiv )
   cPinDiv           := cPinDiv( cDivEmp(), dbfDiv )
   cPirDiv           := cPirDiv( cDivEmp(), dbfDiv )
   cPorDiv           := cPorDiv( cDivEmp(), dbfDiv )
   nDouDiv           := nDouDiv( cDivEmp(), dbfDiv )
   nDorDiv           := nRouDiv( cDivEmp(), dbfDiv )
   nDinDiv           := nDinDiv( cDivEmp(), dbfDiv ) // Decimales sin redondeo
   nDirDiv           := nRinDiv( cDivEmp(), dbfDiv ) // Decimales con redondeo
   nVdvDiv           := nChgDiv( cDivEmp(), dbfDiv )

   CursorWait()

   oDbfTmp:Cargo     := cCodPrv

   /*
   Montamos el dialogo
   */

   DEFINE DIALOG oDlg RESOURCE "ARTINFO" TITLE "Informaci�n del proveedor : " + Rtrim( cNomPrv )

   REDEFINE FOLDER oFld ;
			ID 		300 ;
			OF 		oDlg ;
         PROMPT   "E&stadisticas"      ,;
                  "Documentos"         ,;
                  "Gr�fico"            ;
         DIALOGS  "PROVEE_9"           ,;
                  "INFO_1"             ,;
                  "INFO_2"

   REDEFINE BITMAP oBmpGeneral ID 500 RESOURCE "User_Alpha_48" TRANSPARENT OF oFld:aDialogs[ 1 ]

   oBrwCom                       := IXBrowse():New( oFld:aDialogs[ 1 ] )

   oBrwCom:bClrSel               := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
   oBrwCom:bClrSelFocus          := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

   oBrwCom:SetArray( aCom, , , .f. )

   oBrwCom:lFooter            := .t.
   oBrwCom:lVScroll           := .f.
   oBrwCom:lHScroll           := .f.
   oBrwCom:nMarqueeStyle      := 5
   oBrwCom:cName              := "Compras en informe de articulos"
   oBrwCom:CreateFromResource( 400 )

   with object ( oBrwCom:AddCol() )
      :cHeader                   := "Mes"
      :nWidth                    := 420
      :bStrData                  := {|| cNombreMes( oBrwCom:nArrayAt ) }
      :bFooter                   := {|| "Totales" }
   end with

   with object ( oBrwCom:AddCol() )
      :cHeader                   := cNombreCajas()
      :nWidth                    := 135
      :bEditValue                := {|| aCom[ oBrwCom:nArrayAt, 1] }
      :cEditPicture              := cPicUnd
      :bFooter                   := {|| aTotCom[1] }
      :nDataStrAlign             := 1
      :nHeadStrAlign             := 1
      :nFootStrAlign             := 1
   end with

   with object ( oBrwCom:AddCol() )
      :cHeader                   := cNombreUnidades()
      :nWidth                    := 135
      :bEditValue                := {|| aCom[ oBrwCom:nArrayAt, 2] }
      :cEditPicture              := cPicUnd
      :bFooter                   := {|| aTotCom[2] }
      :nDataStrAlign             := 1
      :nHeadStrAlign             := 1
      :nFootStrAlign             := 1
   end with

   with object ( oBrwCom:AddCol() )
      :cHeader                   := "Total " + cNombreUnidades()
      :nWidth                    := 135
      :bEditValue                := {|| NotCero( aCom[ oBrwCom:nArrayAt, 1] ) + NotCero( aCom[ oBrwCom:nArrayAt, 2] ) }
      :cEditPicture              := cPicUnd
      :bFooter                   := {|| aTotCom[2] }
      :nDataStrAlign             := 1
      :nHeadStrAlign             := 1
      :nFootStrAlign             := 1
      :lHide                     := .t.
   end with

   with object ( oBrwCom:AddCol() )
      :cHeader                   := "Importe"
      :nWidth                    := 155
      :bEditValue                := {|| aCom[ oBrwCom:nArrayAt, 3] }
      :cEditPicture              := cPirDiv
      :bFooter                   := {|| aTotCom[3] }
      :nDataStrAlign             := 1
      :nHeadStrAlign             := 1
      :nFootStrAlign             := 1
   end with

   /*
   Estado de cuentas-----------------------------------------------------------
   */

   REDEFINE SAY oTotFac PROMPT nComFac             ID 170 PICTURE cPirDiv OF oFld:aDialogs[1]
   REDEFINE SAY oTotCob PROMPT nCobFac             ID 171 PICTURE cPirDiv OF oFld:aDialogs[1]
   REDEFINE SAY oTotal  PROMPT nComFac - nCobFac   ID 172 PICTURE cPirDiv OF oFld:aDialogs[1]

   /*
   Documentos------------------------------------------------------------------
   */

   REDEFINE BITMAP oBmpDocumentos ID 500 RESOURCE "Document_Text_Alpha_48" TRANSPARENT OF oFld:aDialogs[ 2 ]

   oTree             := TTreeView():Redefine( 310, oFld:aDialogs[2]  )
   oTree:bChanged    := {|| TreeChanged( oTree, oBrwTmp ) }

   /*
   Barra de botones y datos----------------------------------------------------
   */

   REDEFINE BUTTON ;
      ID       301 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( EditDocument( oBrwTmp ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

   REDEFINE BUTTON ;
      ID       302 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( ZoomDocument( oBrwTmp ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

   REDEFINE BUTTON ;
      ID       303 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( DeleteDocument( oBrwTmp ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

   REDEFINE BUTTON ;
      ID       304 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( VisualizaDocument( oBrwTmp ) )

   REDEFINE BUTTON ;
      ID       305 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( PrintDocument( oBrwTmp ) )

  REDEFINE BUTTON oBtnFiltro ;
      ID       600 ;
      OF       oFld:aDialogs[2] ;
      ACTION   ( Filtro(), oBrwTmp:Refresh() )

   /*
   Browse temporarl------------------------------------------------------------
   */

   oBrwTmp                       := IXBrowse():New( oFld:aDialogs[ 2 ] )

   oBrwTmp:bClrSel               := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
   oBrwTmp:bClrSelFocus          := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }
   oBrwTmp:bLDblClick            := {|| ZoomDocument( oBrwTmp ) }

   oBrwTmp:nMarqueeStyle         := 5
   oBrwTmp:lFooter               := .t.
   oBrwTmp:cName                 := "Documentos en informe de proveedor"

   oBrwTmp:CreateFromResource( 300 )

   oDbfTmp:SetBrowse( oBrwTmp )

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Dc. Documento"
      :bStrData      := {|| cTextoDocument() }
      :bBmpData      := {|| nImagenDocument() }
      :nWidth        := 20
      :AddResource( "Clipboard_empty_businessman_16" )
      :AddResource( "Document_plain_businessman_16" )
      :AddResource( "Document_businessman_16" )
      :AddResource( "Document_navigate_cross_16" )
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Estado"
      :bEditValue    := {|| oDbfTmp:cEstado }
      :nWidth        := 70
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "N�mero"
      :bEditValue    := {|| cMaskNumDoc( oDbfTmp ) }
      :nWidth        := 80
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Fecha"
      :bEditValue    := {|| Dtoc( oDbfTmp:dFecDoc ) }
      :nWidth        := 70
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Entrada"
      :bEditValue    := {|| Dtoc( oDbfTmp:dFecEnt ) }
      :nWidth        := 75
      :lHide         := .t.
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "C�digo"
      :bEditValue    := {|| oDbfTmp:cCodPrv }
      :nWidth        := 50
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Nombre"
      :bEditValue    := {|| oDbfTmp:cNomPrv }
      :nWidth        := 310
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Almac�n"
      :bEditValue    := {|| oDbfTmp:cAlmDoc }
      :nWidth        := 30
      :lHide         := .t.
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Total"
      :bEditValue    := {|| oDbfTmp:nImpDoc }
      :bFooter       := {|| nTotImp( oDbfTmp ) }
      :cEditPicture  := cPorDiv
      :nWidth        := 80
      :nDataStrAlign := 1
      :nHeadStrAlign := 1
      :nFootStrAlign := 1
   end with

   with object ( oBrwTmp:addCol() )
      :cHeader       := "Cliente"
      :bEditValue    := {|| oDbfTmp:cClient }
      :nWidth        := 80
      :lHide         := .t.
   end with

   /*
   Graph start setting---------------------------------------------------------
   */

   REDEFINE BITMAP oBmpGraficos ID 500 RESOURCE "Chart_area_48_alpha" TRANSPARENT OF oFld:aDialogs[ 3 ]

   REDEFINE BTNBMP ;
      ID       101 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "ColumnChart16" ;
      NOBORDER ;
      TOOLTIP  "Gr�fico de barras" ;
      ACTION   ( oGraph:SetType( GRAPH_TYPE_BAR ) )

   REDEFINE BTNBMP ;
      ID       102 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "LineChart16" ;
      NOBORDER ;
      TOOLTIP  "Gr�fico de lineas" ;
      ACTION   ( oGraph:SetType( GRAPH_TYPE_LINE ) )

   REDEFINE BTNBMP ;
      ID       103 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "DotChart16" ;
      NOBORDER ;
      TOOLTIP  "Gr�fico de puntos" ;
      ACTION   ( oGraph:SetType( GRAPH_TYPE_POINT ) )

   REDEFINE BTNBMP ;
      ID       104 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "PieChart16" ;
      NOBORDER ;
      TOOLTIP  "Gr�fico combinado" ;
      ACTION   ( oGraph:SetType( GRAPH_TYPE_PIE ) )

   REDEFINE BTNBMP ;
      ID       105 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "Chart16" ;
      NOBORDER ;
      TOOLTIP  "Gr�fico combinado" ;
      ACTION   ( oGraph:SetType( GRAPH_TYPE_ALL ) )

   REDEFINE BTNBMP ;
      ID       106 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "Text3d16" ;
      NOBORDER ;
      TOOLTIP  "Gr�ficos en tres dimensiones" ;
      ACTION   ( oGraph:l3D :=!oGraph:l3D, oGraph:Refresh() )

   REDEFINE BTNBMP ;
      ID       107 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "Copy16" ;
      NOBORDER ;
      TOOLTIP  "Copiar el gr�fico en el portapapeles" ;
      ACTION   ( oGraph:Copy2ClipBoard() )

   REDEFINE BTNBMP ;
      ID       108 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "Imp16" ;
      NOBORDER ;
      TOOLTIP  "Imprimir el gr�fico" ;
      ACTION   ( GetPrtCoors( oGraph ) )

   REDEFINE BTNBMP ;
      ID       109 ;
      OF       oFld:aDialogs[ 3 ] ;
      RESOURCE "Preferences16" ;
      NOBORDER ;
      TOOLTIP  "Propiedades del gr�fico" ;
      ACTION   ( GraphPropierties( oGraph ) )

   oGraph                  := TGraph():ReDefine( 300, oFld:aDialogs[3] )

   /*Anno del ejecicio, por defecto lleva el anno actual*/

   REDEFINE COMBOBOX oCmbAnio VAR cCmbAnio ;
      ITEMS    { "Todos", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020" } ;
      ID       310 ;
      COLOR    CLR_GET ;
      ON CHANGE( LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh(), oGraph:Refresh() ) ;
      OF       oDlg

   /*
   Botones comunes a la caja de dialogo----------------------------------------
   */

   REDEFINE BUTTON ;
      ID       306 ;
      OF       oDlg ;
      ACTION   ( LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

   REDEFINE BUTTON ;
      ID       501 ;
      OF       oDlg ;
      ACTION   ( oDlg:end( IDOK ) )

   REDEFINE BUTTON ;
      ID       500 ;
      OF       oDlg ;
      ACTION   ( TInfLPrv():New( "Informe detallado de documentos de proveedores", , , , , , { oDbfTmp, cCmbAnio } ):Play() )


   oFld:aDialogs[2]:AddFastKey( VK_F3, {|| EditDocument(), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() } )
   oFld:aDialogs[2]:AddFastKey( VK_F4, {|| DeleteDocument(), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() } )

   oDlg:bStart                      := {|| LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, cCmbAnio, oBrwCom ), oGraph:Refresh() }

   ACTIVATE DIALOG oDlg CENTER ;
         ON INIT  ( InitBrwPrv( cCodPrv, dbfDiv, dbfIva, oTree, oDlg, oGraph, cCmbAnio, oBrwCom ), SysRefresh() ) ;
         VALID    ( CloseFiles() )

   aEval( aDbfBmp, { | hBmp | DeleteObject( hBmp ) } )

   if !Empty( oBmpGeneral )
      oBmpGeneral:End()
   end if

   if !Empty( oBmpDocumentos )
      oBmpDocumentos:End()
   end if

   if !Empty( oBmpGraficos )
      oBmpGraficos:End()
   end if

   oMenu:End()

return nil

//---------------------------------------------------------------------------//

Static Function InitBrwPrv( cCodPrv, dbfDiv, dbfIva, oTree, oDlg, oGraph, nYear, oBrwCom )

   oBrwTmp:Load()

   oTreeImageList := TImageList():New( 16, 16 )

   oTreeImageList:AddMasked( TBitmap():Define( "Businessman_16" ),                  Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Clipboard_empty_businessman_16" ),  Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Document_plain_businessman_16" ),   Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Document_businessman_16" ),         Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Bullet_Square_Red_16" ),            Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Bullet_Square_Yellow_16" ),         Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Bullet_Square_Green_16" ),          Rgb( 255, 0, 255 ) )
   oTreeImageList:AddMasked( TBitmap():Define( "Document_navigate_cross_16" ),      Rgb( 255, 0, 255 ) )

   oTree:SetImageList( oTreeImageList )

   oTreeDocument  := oTree:Add( "Todos los documentos", 0 )
   oTreePedidos   := oTreeDocument:Add( cTextoDocument( PED_PRV ), 1 )
   oTreePedidos:Add( "Pendientes", 4 )
   oTreePedidos:Add( "Parcialmente", 5 )
   oTreePedidos:Add( "Recibidos", 6 )
   oTreeDocument:Add( cTextoDocument( ALB_PRV ), 2 )
   oTreeDocument:Add( cTextoDocument( FAC_PRV ), 3 )
   oTreeDocument:Add( cTextoDocument( RCT_PRV ), 7 )

   oTreeDocument:Expand()

   MENU oMenu

      MENUITEM    "&1. Rotor"

         MENU

            MENUITEM "&1. A�adir pedido a proveedor";
            MESSAGE  "A�ade un pedido a proveedor" ;
            RESOURCE "Clipboard_empty_businessman_16";
            ACTION   ( AppPedPrv( cCodPrv, "", .f. ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, nYear, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

            MENUITEM "&2. A�adir albar�n de proveedor";
            MESSAGE  "A�ade un albar�n de proveedor" ;
            RESOURCE "Document_plain_businessman_16";
            ACTION   ( AppAlbPrv( cCodPrv, "", .f. ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, nYear, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

            MENUITEM "&3. A�adir factura de proveedor";
            MESSAGE  "A�ade una factura de proveedor" ;
            RESOURCE "Document_businessman_16";
            ACTION   ( AppFacPrv( cCodPrv, "", .f. ), LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, nYear, oBrwCom ), oBrwTmp:Refresh(), oGraph:Refresh() )

         ENDMENU

   ENDMENU

   oDlg:SetMenu( oMenu )

Return nil

//---------------------------------------------------------------------------//

Static Function LoadDatos( cCodPrv, dbfDiv, dbfIva, oDlg, nYear, oBrwCom )

   local n

   oDlg:Disable()

   CursorWait()

   oMsgProgress()
   oMsgProgress():SetRange( 0, 6 )

   /*
   Calculos de compras---------------------------------------------------------
   */

   oMsgText( "Calculando compras mensuales" )

   aTotCom[1]     := 0
   aTotCom[2]     := 0
   aTotCom[3]     := 0

   for n := 1 to 12

      aCom[n,1]      := nTotCajCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, if( nYear == "Todos", nil, Val( nYear ) ) )
      aCom[n,2]      := nTotUndCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, n, if( nYear == "Todos", nil, Val( nYear ) ) )
      aCom[n,3]      := nTotImpCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, n, if( nYear == "Todos", nil, Val( nYear ) ) )

      aTotCom[1]     += aCom[n,1]
      aTotCom[2]     += aCom[n,2]
      aTotCom[3]     += aCom[n,3]

      oMsgProgress():Deltapos(1)

   next

   oMsgText( "Calculando de totales" )

   nComFac           := nTotComFac( cCodPrv, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, if( nYear == "Todos", nil, Val( nYear ) ) )
   nCobFac           := nTotCobFac( cCodPrv, dbfFacPrvT, dbfFacPrvP, dbfIva, dbfDiv, if( nYear == "Todos", nil, Val( nYear ) ) )

   oTotFac:SetText( nComFac )
   oTotCob:SetText( nCobFac )
   oTotal:SetText( nComFac - nCobFac )

   oMsgProgress():Deltapos(1)

   /*
   Cargamos los datos----------------------------------------------------------
   */

   oDbfTmp:Zap()

   oMsgText( "Cargando los documentos" )

   LoadPedidoProveedor( cCodPrv, dbfIva, dbfDiv, dbfFPago, if( nYear == "Todos", nil, Val( nYear ) ) )
   oMsgProgress():Deltapos(1)

   LoadAlbaranProveedor( cCodPrv, dbfIva, dbfDiv, if( nYear == "Todos", nil, Val( nYear ) ) )
   oMsgProgress():Deltapos(1)

   LoadFacturaProveedor( cCodPrv, dbfIva, dbfDiv, if( nYear == "Todos", nil, Val( nYear ) ) )
   oMsgProgress():Deltapos(1)

   LoadRectificativaProveedor( cCodPrv, dbfIva, dbfDiv, if( nYear == "Todos", nil, Val( nYear ) ) )
   oMsgProgress():Deltapos(1)

   oDbfTmp:GoTop()

   oBrwTmp:Refresh( .t. )

   oBrwCom:Refresh()
   oBrwCom:RefreshFooters()

   /*
   Generamos el grafico--------------------------------------------------------
   */

   oMsgText( "Calculando de gr�ficos" )

   oGraph:aSeries    := {}
   oGraph:aData      := {}
   oGraph:aSTemp     := {}
   oGraph:aDTemp     := {}

   oGraph:AddSerie( { aCom[ 1, 3 ], aCom[ 2, 3 ], aCom[ 3, 3 ], aCom[ 4, 3 ], aCom[ 5, 3 ], aCom[ 6, 3 ], aCom[ 7, 3 ], aCom[ 8, 3 ], aCom[ 9, 3 ], aCom[ 10, 3 ], aCom[ 11, 3 ], aCom[ 12, 3 ] }, "Compras", Rgb( 253, 186,  40 ) )
   oGraph:SetYVals( { "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" } )

   oGraph:cTitle           := "Evoluci�n anual de compras"
   oGraph:lcTitle          := .f.
   oGraph:nClrT            := Rgb( 55, 55, 55)
   oGraph:nClrX            := CLR_BLUE
   oGraph:nClrY            := CLR_RED
   oGraph:cPicture         := cPirDiv

   oMsgProgress():Deltapos( 1 )

   oMsgText()
   EndProgress()

   CursorWE()

   oDlg:Enable()

return nil

//---------------------------------------------------------------------------//

Static Function TreeChanged( oTree )

   local cText    := oTree:GetSelText()

   do case

      case cText == cTextoDocument( PED_PRV )
         oDbfTmp:OrdSetFocus( "cTypDoc" )
         oDbfTmp:OrdScope( PED_PRV )

      case cText == "Pendientes"
         oDbfTmp:OrdSetFocus( "cTypPed" )
         oDbfTmp:OrdScope( PED_PRV + Padr( "Pendiente", 20 ) )

      case cText == "Parcialmente"
         oDbfTmp:OrdSetFocus( "cTypPed" )
         oDbfTmp:OrdScope( PED_PRV + Padr( "Parcialmente", 20 ) )

      case cText == "Recibidos"
         oDbfTmp:OrdSetFocus( "cTypPed" )
         oDbfTmp:OrdScope( PED_PRV + Padr( "Recibido", 20 ) )

      case cText == cTextoDocument( ALB_PRV )
         oDbfTmp:OrdSetFocus( "cTypDoc" )
         oDbfTmp:OrdScope( ALB_PRV )

      case cText == cTextoDocument( FAC_PRV )
         oDbfTmp:OrdSetFocus( "cTypDoc" )
         oDbfTmp:OrdScope( FAC_PRV )

      case cText == cTextoDocument( RCT_PRV )
         oDbfTmp:OrdSetFocus( "cTypDoc" )
         oDbfTmp:OrdScope( RCT_PRV )

      otherwise
         oDbfTmp:OrdSetFocus( "cAllDoc" )
         oDbfTmp:OrdClearScope()

   end case

   oBrwTmp:Refresh(.t.)

Return nil

//---------------------------------------------------------------------------//

Static Function nImagenDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         Return ( 1 )

      case oDbfTmp:nTypDoc == ALB_PRV
         Return ( 2 )

      case oDbfTmp:nTypDoc == FAC_PRV
         Return ( 3 )

      case oDbfTmp:nTypDoc == RCT_PRV
         Return ( 4 )

   end case

Return ( 1 )

//---------------------------------------------------------------------------//

Static Function EditDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         EdtPedPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == ALB_PRV
         EdtAlbPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == FAC_PRV
         EdtFacPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == RCT_PRV
         EdtRctPrv( oDbfTmp:cNumDoc )

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function ZoomDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         ZooPedPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == ALB_PRV
         ZooAlbPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == FAC_PRV
         ZooFacPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == RCT_PRV
         ZooRctPrv( oDbfTmp:cNumDoc )

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function DeleteDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         DelPedPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == ALB_PRV
         DelAlbPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == FAC_PRV
         DelFacPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == RCT_PRV
         DelRctPrv( oDbfTmp:cNumDoc )

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function VisualizaDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         VisPedPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == ALB_PRV
         VisAlbPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == FAC_PRV
         VisFacPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == RCT_PRV
         VisRctPrv( oDbfTmp:cNumDoc )

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function PrintDocument()

   do case
      case oDbfTmp:nTypDoc == PED_PRV
         PrnPedPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == ALB_PRV
         PrnAlbPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == FAC_PRV
         PrnFacPrv( oDbfTmp:cNumDoc )

      case oDbfTmp:nTypDoc == RCT_PRV
         PrnRctPrv( oDbfTmp:cNumDoc )

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function DefineTemporal( cPath, lUniqueName, cFileName )

   local oDbf

   DEFAULT cPath        := cPatTmp()
   DEFAULT lUniqueName  := .t.
   DEFAULT cFileName    := "InfPrv"

   if lUniqueName
      cFileName         := cGetNewFileName( cFileName, , , cPatTmp() )
   end if

   DEFINE TABLE oDbf FILE ( cFileName ) CLASS "InfPrv" ALIAS ( cFileName ) PATH ( cPath ) VIA ( cLocalDriver() )

      FIELD NAME "nTypDoc" TYPE "C" LEN  2 DEC 0 COMMENT "Tipo de documento"        OF oDbf
      FIELD NAME "cEstado" TYPE "C" LEN 20 DEC 0 COMMENT "Estado del documento"     OF oDbf
      FIELD NAME "dFecDoc" TYPE "D" LEN  8 DEC 0 COMMENT "Fecha del documento"      OF oDbf
      FIELD NAME "cNumDoc" TYPE "C" LEN 13 DEC 0 COMMENT "N�mero del documento"     OF oDbf
      FIELD NAME "cCodPrv" TYPE "C" LEN 12 DEC 0 COMMENT "C�digo del proveedor"     OF oDbf
      FIELD NAME "cNomPrv" TYPE "C" LEN 50 DEC 0 COMMENT "Nombre del proveedor"     OF oDbf
      FIELD NAME "cAlmDoc" TYPE "C" LEN  3 DEC 0 COMMENT "Almac�n"                  OF oDbf
      FIELD NAME "nImpDoc" TYPE "N" LEN 16 DEC 6 COMMENT "Importe del documento"    OF oDbf
      FIELD NAME "cDivisa" TYPE "C" LEN  3 DEC 0 COMMENT "Divisa del documento"     OF oDbf
      FIELD NAME "dFecEnt" TYPE "D" LEN  8 DEC 0 COMMENT "Fecha de entrada"         OF oDbf
      FIELD NAME "cSituac" TYPE "C" LEN 20 DEC 0 COMMENT "Situaci�n del documento"  OF oDbf
      FIELD NAME "cClient" TYPE "C" LEN 50 DEC 0 COMMENT "Cliente del que procede"  OF oDbf

      INDEX TO ( cFileName ) TAG "cAllDoc" ON "Dtos( dFecDoc )"                     OF oDbf
      INDEX TO ( cFileName ) TAG "cTypPed" ON "nTypDoc + cEstado + Dtos( dFecDoc )" OF oDbf
      INDEX TO ( cFileName ) TAG "cTypDoc" ON "nTypDoc + Dtos( dFecDoc )"           OF oDbf

   END DATABASE oDbf

Return ( oDbf )

//---------------------------------------------------------------------------//

Function cTextoDocument( nTypDoc )

   local cTextDocument  := ""

   DEFAULT nTypDoc      := oDbfTmp:nTypDoc

   do case
      case nTypDoc == PED_PRV
         cTextDocument  := "Pedidos"
      case nTypDoc == ALB_PRV
         cTextDocument  := "Albaranes"
      case nTypDoc == FAC_PRV
         cTextDocument  := "Facturas"
      case nTypDoc == RCT_PRV
         cTextDocument  := "Rectificativas"

   end case

Return ( cTextDocument )

//---------------------------------------------------------------------------//

Static Function LoadPedidoProveedor( cCodPrv, dbfDiv, dbfIva, dbfFPago, nYear )

   if ( dbfPedPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfPedPrvT )->cCodPrv == cCodPrv .and. !( dbfPedPrvT )->( eof() )

         if Empty( nYear ) .or. nYear == Year( ( dbfPedPrvT )->dFecPed )

            oDbfTmp:Append()
            oDbfTmp:nTypDoc   := PED_PRV
            do case
               case ( dbfPedPrvT )->nEstado == 1
                  oDbfTmp:cEstado   := "Pendiente"
               case ( dbfPedPrvT )->nEstado == 2
                  oDbfTmp:cEstado   := "Parcialmente"
               case ( dbfPedPrvT )->nEstado == 3
                  oDbfTmp:cEstado   := "Recibido"
            end case
            oDbfTmp:dFecDoc   := ( dbfPedPrvT )->dFecPed
            oDbfTmp:cNumDoc   := ( dbfPedPrvT )->cSerPed + Str( ( dbfPedPrvT )->nNumPed ) + ( dbfPedPrvT )->cSufPed
            oDbfTmp:cCodPrv   := ( dbfPedPrvT )->cCodPrv
            oDbfTmp:cNomPrv   := ( dbfPedPrvT )->cNomPrv
            oDbfTmp:cAlmDoc   := ( dbfPedPrvT )->cCodAlm
            oDbfTmp:nImpDoc   := nTotPedPrv( ( dbfPedPrvT )->cSerPed + Str( ( dbfPedPrvT )->nNumPed ) + ( dbfPedPrvT )->cSufPed, dbfPedPrvT, dbfPedPrvL, dbfIva, dbfDiv, nil, nil, .f. )
            oDbfTmp:cDivisa   := ( dbfPedPrvT )->cDivPed
            oDbfTmp:dFecEnt   := ( dbfPedPrvT )->dFecEnt
            oDbfTmp:cSituac   := ( dbfPedPrvT )->cSituac
            oDbfTmp:cClient   := if( !Empty( ( dbfPedPrvT )->cNumPedCli ), AllTrim( GetCodCli( ( dbfPedPrvT )->cNumPedCli ) ) + " - " + AllTrim( GetNomCli( ( dbfPedPrvT )->cNumPedCli ) ), Space(95) )

            oDbfTmp:Save()

         end if

         ( dbfPedPrvT )->( dbSkip() )

      end while

   end if

Return nil

//---------------------------------------------------------------------------//

Static Function LoadAlbaranProveedor( cCodPrv, dbfIva, dbfDiv, nYear )

   if ( dbfAlbPrvT )->( dbSeek( cCodPrv ) )
      while ( dbfAlbPrvT )->cCodPrv == cCodPrv .and. !( dbfAlbPrvT )->( eof() )

         if nYear == nil .or. nYear == Year( ( dbfAlbPrvT )->dFecAlb )

            oDbfTmp:Append()
            oDbfTmp:nTypDoc   := ALB_PRV
            if( dbfAlbPrvT )->lFacturado
               oDbfTmp:cEstado   := "Facturado"
            else
               oDbfTmp:cEstado   := "No facturado"
            end if
            oDbfTmp:dFecDoc   := ( dbfAlbPrvT )->dFecAlb
            oDbfTmp:cNumDoc   := ( dbfAlbPrvT )->cSerAlb + Str( ( dbfAlbPrvT )->nNumAlb ) + ( dbfAlbPrvT )->cSufAlb
            oDbfTmp:cCodPrv   := ( dbfAlbPrvT )->cCodPrv
            oDbfTmp:cNomPrv   := ( dbfAlbPrvT )->cNomPrv
            oDbfTmp:cAlmDoc   := ( dbfAlbPrvT )->cCodAlm
            oDbfTmp:nImpDoc   := nTotAlbPrv( ( dbfAlbPrvT )->cSerAlb + Str( ( dbfAlbPrvT )->nNumAlb ) + ( dbfAlbPrvT )->cSufAlb, dbfAlbPrvT, dbfAlbPrvL, dbfIva, dbfDiv, nil, nil, .f. )
            oDbfTmp:cDivisa   := ( dbfAlbPrvT )->cDivAlb
            oDbfTmp:dFecEnt   := ctod("")
            oDbfTmp:cSituac   := Space(20)
            oDbfTmp:cClient   := Space(95)
            oDbfTmp:Save()

         end if

         ( dbfAlbPrvT )->( dbSkip() )

      end while
   end if

Return nil

//---------------------------------------------------------------------------//

Static Function LoadFacturaProveedor( cCodPrv, dbfIva, dbfDiv, nYear )

   if ( dbfFacPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfFacPrvT )->cCodPrv == cCodPrv .and. !( dbfFacPrvT )->( eof() )

         if nYear == nil .or. nYear == Year( ( dbfFacPrvT )->dFecFac )

            oDbfTmp:Append()
            oDbfTmp:nTypDoc      := FAC_PRV
            if( dbfFacPrvT )->lLiquidada
               oDbfTmp:cEstado   := "Pagada"
            else
               oDbfTmp:cEstado   := "Pendiente"
            end if
            oDbfTmp:dFecDoc      := ( dbfFacPrvT )->dFecFac
            oDbfTmp:cNumDoc      := ( dbfFacPrvT )->cSerFac + Str( ( dbfFacPrvT )->nNumFac ) + ( dbfFacPrvT )->cSufFac
            oDbfTmp:cCodPrv      := ( dbfFacPrvT )->cCodPrv
            oDbfTmp:cNomPrv      := ( dbfFacPrvT )->cNomPrv
            oDbfTmp:cAlmDoc      := ( dbfFacPrvT )->cCodAlm
            oDbfTmp:nImpDoc      := nTotFacPrv( ( dbfFacPrvT )->cSerFac + Str( ( dbfFacPrvT )->nNumFac ) + ( dbfFacPrvT )->cSufFac, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, dbfFacPrvP, nil, nil, .f. )
            oDbfTmp:cDivisa      := ( dbfFacPrvT )-> cDivFac
            oDbfTmp:dFecEnt      := Ctod("")
            oDbfTmp:cSituac      := Space(20)
            oDbfTmp:cClient      := Space(95)
            oDbfTmp:Save()

         end if

         ( dbfFacPrvT )->( dbSkip() )

      end while

   end if

Return nil

//---------------------------------------------------------------------------//
Static Function LoadRectificativaProveedor( cCodPrv, dbfIva, dbfDiv, nYear )

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv == cCodPrv .and. !( dbfRctPrvT )->( eof() )

         if nYear == nil .or. nYear == Year( ( dbfRctPrvT )->dFecFac )

            oDbfTmp:Append()
            oDbfTmp:nTypDoc      := RCT_PRV
            if( dbfRctPrvT )->lLiquidada
               oDbfTmp:cEstado   := "Pagada"
            else
               oDbfTmp:cEstado   := "Pendiente"
            end if
            oDbfTmp:dFecDoc      := ( dbfRctPrvT )->dFecFac
            oDbfTmp:cNumDoc      := ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac
            oDbfTmp:cCodPrv      := ( dbfRctPrvT )->cCodPrv
            oDbfTmp:cNomPrv      := ( dbfRctPrvT )->cNomPrv
            oDbfTmp:cAlmDoc      := ( dbfRctPrvT )->cCodAlm
            oDbfTmp:nImpDoc      := nTotRctPrv( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfFacPrvP, nil, nil, .f. )
            oDbfTmp:cDivisa      := ( dbfRctPrvT )-> cDivFac
            oDbfTmp:dFecEnt      := Ctod("")
            oDbfTmp:cSituac      := Space(20)
            oDbfTmp:cClient      := Space(95)
            oDbfTmp:Save()

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

Return nil

//---------------------------------------------------------------------------//
/*Para calcular los totales del browse*/

Static Function nTotImp( oDbfTmp )

   local nRec     := oDbfTmp:Recno()
   local nTotImp  := 0

   oDbfTmp:GoTop()
   while !oDbfTmp:Eof()
      nTotImp     += oDbfTmp:nImpDoc
      oDbfTmp:Skip()
   end while

   oDbfTmp:GoTo( nRec )

Return ( nTotImp )

//---------------------------------------------------------------------------//

Static Function Filtro()

   if oFilter != nil

      oFilter:Resource()

      if oFilter:cExpFilter != nil
         SetWindowText( oBtnFiltro:hWnd, "Filtro activo" )
      else
         SetWindowText( oBtnFiltro:hWnd, "Filtrar" )
      end if

   end if

Return( .t. )

//---------------------------------------------------------------------------//

static function nTotCajCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, nMes, nYear )

   local cCodEmp
   local dbfAlbEmpT
   local dbfAlbEmpL
   local dbfFacEmpT
   local dbfFacEmpL
   local dbfRctEmpT
   local dbfRctEmpL
   local nTotCajCom  := 0

   if Len( aEmpGrp() ) != 0

      for each cCodEmp in aEmpGrp()

         if cCodEmp == cCodEmp()

            nTotCajCom           += nCajComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, nYear )
            nTotCajCom           += nCajComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, nYear )
            nTotCajCom           += nCajComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, nYear )

         else

            USE ( cPatStk( cCodEmp ) + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "ALBPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvL.CDX" ) ADDITIVE

            nTotCajCom           += nCajComAlb( cCodPrv, nMes, dbfAlbEmpT, dbfAlbEmpL, nYear )
            nTotCajCom           += nCajComFac( cCodPrv, nMes, dbfFacEmpT, dbfFacEmpL, nYear )
            nTotCajCom           += nCajComRct( cCodPrv, nMes, dbfRctEmpT, dbfRctEmpL, nYear )

            CLOSE( dbfAlbEmpT )
            CLOSE( dbfAlbEmpL )
            CLOSE( dbfFacEmpT )
            CLOSE( dbfFacEmpL )
            CLOSE( dbfRctEmpT )
            CLOSE( dbfRctEmpL )

         end if

      next

   end if

return nTotCajCom

//---------------------------------------------------------------------------//

static function nTotUndCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, nMes, nYear )

   local cCodEmp
   local dbfAlbEmpT
   local dbfAlbEmpL
   local dbfFacEmpT
   local dbfFacEmpL
   local dbfRctEmpT
   local dbfRctEmpL
   local nTotUndCom  := 0

   if Len( aEmpGrp() ) != 0

      for each cCodEmp in aEmpGrp()

         if cCodEmp == cCodEmp()

            nTotUndCom           += nUndComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, nYear )
            nTotUndCom           += nUndComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, nYear )
            nTotUndCom           += nUndComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, nYear )

         else

            USE ( cPatStk( cCodEmp ) + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "ALBPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvL.CDX" ) ADDITIVE

            nTotUndCom           += nUndComAlb( cCodPrv, nMes, dbfAlbEmpT, dbfAlbEmpL, nYear )
            nTotUndCom           += nUndComFac( cCodPrv, nMes, dbfFacEmpT, dbfFacEmpL, nYear )
            nTotUndCom           += nUndComRct( cCodPrv, nMes, dbfRctEmpT, dbfRctEmpL, nYear )

            CLOSE( dbfAlbEmpT )
            CLOSE( dbfAlbEmpL )
            CLOSE( dbfFacEmpT )
            CLOSE( dbfFacEmpL )
            CLOSE( dbfRctEmpT )
            CLOSE( dbfRctEmpL )

         end if

      next

   end if

return nTotUndCom

//---------------------------------------------------------------------------//

static function nTotImpCom( cCodPrv, dbfAlbPrvT, dbfAlbPrvL, dbfFacPrvT, dbfFacPrvL, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nMes, nYear )

   local cCodEmp
   local dbfAlbEmpT
   local dbfAlbEmpL
   local dbfFacEmpT
   local dbfFacEmpL
   local dbfRctEmpT
   local dbfRctEmpL
   local nTotImpCom  := 0

   if Len( aEmpGrp() ) != 0

      for each cCodEmp in aEmpGrp()

         if cCodEmp == cCodEmp()

            nTotImpCom           += nImpComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, dbfIva, dbfDiv, nYear )
            nTotImpCom           += nImpComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, nYear )
            nTotImpCom           += nImpComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nYear )

         else

            USE ( cPatStk( cCodEmp ) + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "ALBPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "ALBPROVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVL.CDX" ) ADDITIVE

            USE ( cPatStk( cCodEmp ) + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "RctPrvL.CDX" ) ADDITIVE

            nTotImpCom           += nImpComAlb( cCodPrv, nMes, dbfAlbEmpT, dbfAlbEmpL, dbfIva, dbfDiv, nYear )
            nTotImpCom           += nImpComFac( cCodPrv, nMes, dbfFacEmpT, dbfFacEmpL, dbfIva, dbfDiv, nYear )
            nTotImpCom           += nImpComRct( cCodPrv, nMes, dbfRctEmpT, dbfRctEmpL, dbfIva, dbfDiv, nYear )

            CLOSE( dbfAlbEmpT )
            CLOSE( dbfAlbEmpL )
            CLOSE( dbfFacEmpT )
            CLOSE( dbfFacEmpL )
            CLOSE( dbfRctEmpT )
            CLOSE( dbfRctEmpL )

         end if

      next

   end if

return nTotImpCom

//---------------------------------------------------------------------------//

static function nImpComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, dbfIva, dbfDiv, nYear )

   local nImp     := 0
   local nRec     := ( dbfAlbPrvT )->( Recno() )

   if ( dbfAlbPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfAlbPrvT )->cCodPrv == cCodPrv .and. !( dbfAlbPrvT )->( Eof() )

         if !( dbfAlbPrvT )->lFacturado         .and.;
            ( nYear == nil .or. Year( ( dbfAlbPrvT )->dFecAlb ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfAlbPrvT )->dFecAlb ) == nMes )

            nImp  += nTotAlbPrv( ( dbfAlbPrvT )->CSERALB + Str( (dbfAlbPrvT)->NNUMALB ) + (dbfAlbPrvT)->CSUFALB, dbfAlbPrvT, dbfAlbPrvL, dbfIva, dbfDiv, nil, cDivEmp(), .f. )

         end if

         ( dbfAlbPrvT )->( dbSkip() )

      end while

   end if

   ( dbfAlbPrvT )->( dbGoTo( nRec ) )

return nImp

//---------------------------------------------------------------------------//

static function nImpComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, nYear )

   local nCon     := 0
   local nRec     := ( dbfFacPrvT )->( Recno() )

   if ( dbfFacPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfFacPrvT )->cCodPrv == cCodPrv .and. !( dbfFacPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfFacPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfFacPrvT )->dFecFac ) == nMes )

            nCon     += nTotFacPrv( ( dbfFacPrvT )->cSerFac + Str( (dbfFacPrvT)->nNumFac ) + (dbfFacPrvT)->cSufFac, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, nil, nil, cDivEmp(), .f. )

         end if

         ( dbfFacPrvT )->( dbSkip() )

      end while

   end if

   ( dbfFacPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//---------------------------------------------------------------------------//

static function nCajComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, nYear )

   local nCon     := 0
   local nRec     := ( dbfAlbPrvT )->( Recno() )

   if ( dbfAlbPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfAlbPrvT )->cCodPrv == cCodPrv .and. !( dbfAlbPrvT )->( Eof() )

         if !( dbfAlbPrvT )->lFacturado      .and.;
            ( nYear == nil .or. Year( ( dbfAlbPrvT )->dFecAlb ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfAlbPrvT )->dFecAlb ) == nMes )

            if ( dbfAlbPrvL )->( dbSeek( ( dbfAlbPrvT )->CSERALB + Str( (dbfAlbPrvT)->NNUMALB ) + (dbfAlbPrvT)->CSUFALB ) )

               while ( dbfAlbPrvT )->CSERALB + Str( (dbfAlbPrvT)->NNUMALB ) + (dbfAlbPrvT)->CSUFALB == ( dbfAlbPrvL )->CSERALB + Str( ( dbfAlbPrvL )->NNUMALB ) + ( dbfAlbPrvL )->CSUFALB .and. !( dbfAlbPrvL )->( Eof() )

                  nCon  += ( dbfAlbPrvL )->nCanEnt

                  (dbfAlbPrvL)->( dbSkip() )

               end while

            end if

         end if

         ( dbfAlbPrvT )->( dbSkip() )

      end while

   end if

   ( dbfAlbPrvT )->( dbGoTo( nRec ) )

return nCon

//---------------------------------------------------------------------------//

static function nCajComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, nYear )

   local nCon     := 0
   local nRec     := 0

   if Empty( dbfFacPrvT )
      return ( nCon )
   end if

   nRec           := ( dbfFacPrvT )->( Recno() )

   if ( dbfFacPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfFacPrvT )->cCodPrv == cCodPrv .and. !( dbfFacPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfFacPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfFacPrvT )->dFecFac ) == nMes )

            if ( dbfFacPrvL )->( dbSeek( ( dbfFacPrvT )->cSerFac + Str( (dbfFacPrvT)->nNumFac ) + (dbfFacPrvT)->cSufFac ) )

               while ( dbfFacPrvT )->cSerFac + Str( (dbfFacPrvT)->NNUMFac ) + (dbfFacPrvT)->CSUFFac == ( dbfFacPrvL )->cSerFac + Str( ( dbfFacPrvL )->NNUMFac ) + ( dbfFacPrvL )->CSUFFac .and. !( dbfFacPrvL )->( Eof() )

                  nCon  += ( dbfFacPrvL )->nCanEnt

                  (dbfFacPrvL)->( dbSkip() )

               end while

            end if

         end if

         ( dbfFacPrvT )->( dbSkip() )

      end while

   end if

   ( dbfFacPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//--------------------------------------------------------------------------//

static function nUndComAlb( cCodPrv, nMes, dbfAlbPrvT, dbfAlbPrvL, nYear )

   local nCon     := 0
   local nRec     := ( dbfAlbPrvT )->( Recno() )

   if ( dbfAlbPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfAlbPrvT )->cCodPrv == cCodPrv .and. !( dbfAlbPrvT )->( Eof() )

         if !( dbfAlbPrvT )->lFacturado      .and.;
            ( nYear == nil .or. Year( ( dbfAlbPrvT )->dFecAlb ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfAlbPrvT )->dFecAlb ) == nMes )

            if ( dbfAlbPrvL )->( dbSeek( ( dbfAlbPrvT )->CSERALB + Str( (dbfAlbPrvT)->NNUMALB ) + (dbfAlbPrvT)->CSUFALB ) )

               while ( dbfAlbPrvT )->CSERALB + Str( (dbfAlbPrvT)->NNUMALB ) + (dbfAlbPrvT)->CSUFALB == ( dbfAlbPrvL )->CSERALB + Str( ( dbfAlbPrvL )->NNUMALB ) + ( dbfAlbPrvL )->CSUFALB .and. !( dbfAlbPrvL )->( Eof() )

                  nCon  += nTotNAlbPrv( dbfAlbPrvL )

                  (dbfAlbPrvL)->( dbSkip() )

               end while

            end if

         end if

         ( dbfAlbPrvT )->( dbSkip() )

      end while

   end if

   ( dbfAlbPrvT )->( dbGoTo( nRec ) )

return nCon

//---------------------------------------------------------------------------//

static function nUndComFac( cCodPrv, nMes, dbfFacPrvT, dbfFacPrvL, nYear )

   local nCon     := 0
   local nRec     := ( dbfFacPrvT )->( Recno() )

   if ( dbfFacPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfFacPrvT )->cCodPrv == cCodPrv .and. !( dbfFacPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfFacPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfFacPrvT )->dFecFac ) == nMes )

            if ( dbfFacPrvL )->( dbSeek( ( dbfFacPrvT )->cSerFac + Str( (dbfFacPrvT)->nNumFac ) + (dbfFacPrvT)->cSufFac ) )

               while ( dbfFacPrvT )->cSerFac + Str( (dbfFacPrvT)->NNUMFac ) + (dbfFacPrvT)->CSUFFac == ( dbfFacPrvL )->cSerFac + Str( ( dbfFacPrvL )->NNUMFac ) + ( dbfFacPrvL )->CSUFFac .and. !( dbfFacPrvL )->( Eof() )

                  nCon  += nTotNFacPrv( dbfFacPrvL )

                  (dbfFacPrvL)->( dbSkip() )

               end while

            end if

         end if

         ( dbfFacPrvT )->( dbSkip() )

      end while

   end if

   ( dbfFacPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//---------------------------------------------------------------------------//

static function nTotComFac( cCodPrv, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, nYear )

   local cCodEmp
   local dbfFacEmpT
   local dbfFacEmpL
   local nTotComFac  := 0

   if Len( aEmpGrp() ) != 0

      for each cCodEmp in aEmpGrp()

         if cCodEmp == cCodEmp()

            nTotComFac           += nVtaFacPrv( cCodPrv, nil, nil, dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv, nYear )

         else

            USE ( cPatStk( cCodEmp ) + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacEmpL ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVL.CDX" ) ADDITIVE

            nTotComFac           += nVtaFacPrv( cCodPrv, nil, nil, dbfFacEmpT, dbfFacEmpL, dbfIva, dbfDiv, nYear )

            CLOSE( dbfFacEmpT )
            CLOSE( dbfFacEmpL )

         end if

      next

   end if

return nTotComFac

//---------------------------------------------------------------------------//

static function nTotCobFac( cCodPrv, dbfFacPrvT, dbfFacPrvP, dbfIva, dbfDiv, nYear )

   local cCodEmp
   local dbfFacEmpT
   local dbfFacEmpP
   local nTotCobFac  := 0

   if Len( aEmpGrp() ) != 0

      for each cCodEmp in aEmpGrp()

         if cCodEmp == cCodEmp()

            nTotCobFac           += nCobFacPrv( cCodPrv, nil, nil, dbfFacPrvT, dbfFacPrvP, dbfIva, dbfDiv, .t., nYear )

         else

            USE ( cPatStk( cCodEmp ) + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacEmpT ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FACPRVT.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            USE ( cPatStk( cCodEmp ) + "FacPrvP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvP", @dbfFacEmpP ) )
            SET ADSINDEX TO ( cPatStk( cCodEmp ) + "FacPrvP.CDX" ) ADDITIVE
            SET TAG TO "cCodPrv"

            nTotCobFac           += nCobFacPrv( cCodPrv, nil, nil, dbfFacEmpT, dbfFacEmpP, dbfIva, dbfDiv, .t., nYear )

            CLOSE( dbfFacEmpT )
            CLOSE( dbfFacEmpP )

         end if

      next

   end if

return nTotCobFac

//---------------------------------------------------------------------------//

static function nUndComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, nYear )

   local nCon     := 0
   local nRec     := ( dbfRctPrvT )->( Recno() )

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv == cCodPrv .and. !( dbfRctPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfRctPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfRctPrvT )->dFecFac ) == nMes )

            if ( dbfRctPrvL )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )

               while ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac == ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac .and. !( dbfRctPrvL )->( Eof() )

                  nCon  += nTotNRctPrv( dbfRctPrvL )

                  ( dbfRctPrvL )->( dbSkip() )

               end while

            end if

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//---------------------------------------------------------------------------//

static function nCajComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, nYear )

   local nCon     := 0
   local nRec     := ( dbfRctPrvT )->( Recno() )

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv == cCodPrv .and. !( dbfRctPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfRctPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfRctPrvT )->dFecFac ) == nMes )

            if ( dbfRctPrvL )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )

               while ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac == ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac .and. !( dbfRctPrvL )->( Eof() )

                  nCon  += ( dbfRctPrvL )->nCanEnt

                  ( dbfRctPrvL )->( dbSkip() )

               end while

            end if

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//--------------------------------------------------------------------------//

static function nImpComRct( cCodPrv, nMes, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nYear )

   local nCon     := 0
   local nRec     := ( dbfRctPrvT )->( Recno() )

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv == cCodPrv .and. !( dbfRctPrvT )->( Eof() )

         if ( nYear == nil .or. Year( ( dbfRctPrvT )->dFecFac ) == nYear ) .and.;
            ( nMes == 0 .or. Month( ( dbfRctPrvT )->dFecFac ) == nMes )

            nCon     += nTotRctPrv( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nil, nil, cDivEmp(), .f. )

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( dbGoTo( nRec ) )

return ( nCon )

//---------------------------------------------------------------------------//