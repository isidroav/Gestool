#include "FiveWin.Ch"
#include "Folder.ch"
#include "Factu.ch" 
#include "Report.ch"
#include "Menu.ch"
#include "Xbrowse.ch"

#define _MENUITEM_                "01046"

/*
Definici�n de la base de datos de pedidos a proveedores
*/

#define _CSERPED                   1      //   C      1     0
#define _NNUMPED                   2      //   C      9     0
#define _CSUFPED                   3      //   C      2     0
#define _CTURPED                   4      //   C      6     0
#define _DFECPED                   5      //   D      8     0
#define _CCODPRV                   6      //   C      7     0
#define _CCODALM                   7      //   C      4     0
#define _CCODCAJ                   8      //   C      4     0
#define _CNOMPRV                   9      //   C     35     0
#define _CDIRPRV                  10      //   C     35     0
#define _CPOBPRV                  11      //   C     25     0
#define _CPROPRV                  12      //   C     20     0
#define _CPOSPRV                  13      //   C      5     0
#define _CDNIPRV                  14      //   C     15     0
#define _DFECENT                  15      //   D      8     0
#define _NESTADO                  16      //   N      1     0
#define _CSUPED                   17      //   C     10     0
#define _CCODPGO                  18      //   C      2     0
#define _NBULTOS                  19      //   N      3     0
#define _NPORTES                  20      //   N      6     0
#define _CDTOESP                  21      //   N      4     1
#define _NDTOESP                  22      //   N      4     1
#define _CDPP                     23      //   N      4     1
#define _NDPP                     24      //   N      4     1
#define _LRECARGO                 25      //   L      1     0
#define _CCONDENT                 26      //   C     20     0
#define _CEXPED                   27      //   C     20     0
#define _COBSERV                  28      //   M     10     0
#define _CDIVPED                  29      //   C      3     0
#define _NVDVPED                  30      //   C     10     4
#define _LSNDDOC                  31      //   L      1     0
#define _CDTOUNO                  32      //   N      4     1
#define _NDTOUNO                  33      //   N      4     1
#define _CDTODOS                  34      //   N      4     1
#define _NDTODOS                  35      //   N      4     1
#define _LCLOPED                  36      //   L      1     0
#define _CCODUSR                  37      //   C      3     0
#define _CNUMPEDCLI               38      //   C     12     0
#define _LIMPRIMIDO               39      //   L      1     0
#define _DFECIMP                  40      //   D      8     0
#define _CHORIMP                  41      //   C      5     0
#define _DFECCHG                  42
#define _CTIMCHG                  43
#define _CCODDLG                  44
#define _CSITUAC                  45
#define _NREGIVA                  46
#define _NTOTNET                  47
#define _NTOTIVA                  48
#define _NTOTREQ                  49
#define _NTOTPED                  50
#define _CNUMALB                  51
#define _LRECC                    52

/* Definici�n de la base de datos de lineas de detalle */

#define _CREF                      4      //   C     18     0
#define _CREFPRV                   5      //   C     20     0
#define _CDETALLE                  6      //   C     50     0
#define _NIVA                      7      //   N      6     2
#define _NCANPED                   8      //   N     13     3
#define _NUNICAJA                  9      //   N     13     3
#define _NPREDIV                  10      //   N     13     3
#define _NCANENT                  11      //   N     13     3
#define _NUNIENT                  12      //   N     13     3
#define _CUNIDAD                  13      //   C      2     0
#define _MLNGDES                  14      //   M     10     0
#define _NDTOLIN                  15      //   N      5     2
#define _NDTOPRM                  16
#define _NDTORAP                  17
#define _CCODPR1                  18      //   C      5     0
#define _CCODPR2                  19      //   C      5     0
#define _CVALPR1                  20      //   C      5     0
#define _CVALPR2                  21      //   C      5     0
#define _NFACCNV                  22      //   N     13     4
#define _NCTLSTK                  23
#define _CALMLIN                  24      //   C     3      0
#define _LLOTE                    25      //   N     4      0
#define _NLOTE                    26      //   N     4      0
#define _CLOTE                    27      //   N     4      0
#define _NNUMLIN                  28
#define _NUNDKIT                  29
#define _LKITART                  30
#define _LKITCHL                  31
#define _LKITPRC                  32      //   L     4      0
#define _LIMPLIN                  33      //   L     4      0
#define _LCONTROL                 34
#define _MNUMSER                  35
#define _LANULADO                 36
#define _DANULADO                 37
#define _MANULADO                 38
#define _CCODFAM                  39      //   C     8      0
#define _CGRPFAM                  40      //   C     3      0
#define _NREQ                     41      //   C    16      6
#define _MOBSLIN                  42      //   M    10      0
#define _CPEDCLI                  43      //   C    12      0
#define _NPVPREC                  44
#define _NNUMMED                  45
#define _NMEDUNO                  46
#define _NMEDDOS                  47
#define _NMEDTRE                  48
#define _NSTKACT                  49  
#define _NSTKMIN                  50  
#define _NPDTREC                  51   
#define _NCONREA                  52  
#define _NCONSEM                  53  
#define _NCONQUI                  54  
#define _NCONMES                  55  
#define _aNESTADO                 56  
#define _LFROMIMP                 57  

/*
Definici�n de Array para impuestos
*/

#define _NBRTIVA1                aTotIva[ 1, 1 ]
#define _NBASIVA1                aTotIva[ 1, 2 ]
#define _NPCTIVA1                aTotIva[ 1, 3 ]
#define _NPCTREQ1                aTotIva[ 1, 4 ]
#define _NIMPIVA1                aTotIva[ 1, 5 ]
#define _NIMPREQ1                aTotIva[ 1, 6 ]
#define _NBRTIVA2                aTotIva[ 2, 1 ]
#define _NBASIVA2                aTotIva[ 2, 2 ]
#define _NPCTIVA2                aTotIva[ 2, 3 ]
#define _NPCTREQ2                aTotIva[ 2, 4 ]
#define _NIMPIVA2                aTotIva[ 2, 5 ]
#define _NIMPREQ2                aTotIva[ 2, 6 ]
#define _NBRTIVA3                aTotIva[ 3, 1 ]
#define _NBASIVA3                aTotIva[ 3, 2 ]
#define _NPCTIVA3                aTotIva[ 3, 3 ]
#define _NPCTREQ3                aTotIva[ 3, 4 ]
#define _NIMPIVA3                aTotIva[ 3, 5 ]
#define _NIMPREQ3                aTotIva[ 3, 6 ]

memvar cDbf
memvar cDbfCol
memvar cDbfPrv
memvar cDbfPgo
memvar cDbfIva
memvar cDbfAlm
memvar cDbfDiv
memvar cDbfArt
memvar cDbfKit
memvar cDbfPro
memvar cDbfUsr
memvar cDbfTblPro
memvar aTotIva
memvar aIvaUno
memvar aIvaDos
memvar aIvaTre
memvar nTotBrt
memvar nTotDto
memvar nTotDpp
memvar nTotNet
memvar nTotIva
memvar nTotReq
memvar nTotPed
memvar nTotImp
memvar nTotUno
memvar nTotDos


memvar cPicUndPed
memvar cPinDivPed
memvar cPirDivPed
memvar nDinDivPed
memvar nDirDivPed
memvar nVdvDivPed
memvar nPagina
memvar lEnd

static oWndBrw
static oBrwIva
static dbfPedPrvT
static dbfPedPrvL
static dbfPedPrvI
static dbfPedPrvD
static dbfPedPrvS
static dbfAlbPrvT
static dbfPedCliT
static dbfPrv
static dbfIva
static dbfTmp
static dbfDiv
static oBandera
static dbfArticulo
static dbfTmpInc
static dbfTmpDoc
static dbfTmpArt
static dbfTmpLin
static dbfTmpSer
static cTmpArt
static cTmpSer
static cTmpPed
static cTmpInc
static cTmpDoc
static dbfFamilia
static dbfArtPrv

static dbfClient
static oStock
static oGetNet
static oGetIva
static oGetReq
static oGetTotal
static oUsr
static cUsr
static cPirDiv
static cPinDiv
static cPicUnd
static nDinDiv
static nDirDiv
static cNewFile
static nGetNeto         := 0
static nGetIva          := 0
static nGetReq          := 0
static nVdvDiv          := 1
static oFont
static oMenu
static cOldCodCli       := ""
static cOldCodArt       := ""
static cOldPrpArt       := ""
static cOldUndMed       := ""
static lOpenFiles       := .f.
static lExternal        := .f.
static cFiltroUsuario   := ""
static bEdtRec          := { |aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode | EdtRec( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode ) }
static bEdtDet          := { |aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aPedPrv | EdtDet( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aPedPrv ) }
static bEdtInc          := { |aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin | EdtInc( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin ) }
static bEdtDoc          := { |aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin | EdtDoc( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin ) }

static nView

//----------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles( lExt )

   local oBlock
   local oError

   if lOpenFiles
      MsgStop( 'Ficheros de pedidos a proveedores abiertos previamente' )
      Return ( .f. )
   end if

   DEFAULT lExt         := .f.

   lExternal            := lExt

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DisableAcceso()

      lOpenFiles        := .t.

      nView             := TDataView():CreateView()

      TDataView():PedidosProveedores( nView )

      TDataView():Proveedores( nView )

      TDataView():GruposProveedores( nView )

      TDataView():Clientes( nView )

      TDataView():PedidosProveedoresLineas( nView )

      TDataView():PedidosProveedoresIncidencias( nView )

      TDataView():PedidosProveedoresDocumentos( nView )

      TDataView():AlbaranesProveedores( nView )

      TDataView():AlbaranesProveedoresLineas( nView )

      TDataView():TiposIva( nView )

      TDataView():FormasPago( nView )

      TDataView():Divisas( nView )

      TDataView():ProveedorArticulo( nView )
      ( TDataView():ProveedorArticulo( nView ) )->( ordSetFocus( "cCodPrv" ) )

      TDataView():ArticuloPrecioPropiedades( nView )

      TDataView():Articulos( nView )

      TDataView():CodigoBarrasArticulo( nView )

      TDataView():Familias( nView )

      TDataView():Almacen( nView )

      TDataView():Kit( nView )

      TDataView():Documentos( nView )
      ( TDataView():Documentos( nView ) )->( ordSetFocus( "cTipo" ) )

      TDataView():Cajas( nView )

      TDataView():Usuarios( nView )

      TDataView():TipoIncidencia( nView )

      TDataView():PedidosClientesReservas( nView )

      TDataView():Propiedades( nView )

      TDataView():PropiedadesLineas( nView )

      TDataView():Delegaciones( nView )

      TDataView():Contadores( nView )

      TDataView():Empresa( nView )

      // Unidades de medicion

      TDataView():GetObject( "UnidadMedicion", nView )

      oStock            := TStock():Create( cPatGrp() )
      if !oStock:lOpenFiles()
         lOpenFiles     := .f.
      end if

      oBandera          := TBandera():New()

      /*
      Recursos y fuente--------------------------------------------------------
      */

      oFont             := TFont():New( "Arial", 8, 26, .F., .T. )

      /*
      Definimos las p�blicas---------------------------------------------------
      */

      public nTotPed    := 0
      public nTotBrt    := 0
      public nTotDto    := 0
      public nTotDPP    := 0
      public nTotNet    := 0
      public nTotIva    := 0
      public nTotReq    := 0
      public nTotImp    := 0
      public aTotIva    := { { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 } }
      public aIvaUno    := aTotIva[ 1 ]
      public aIvaDos    := aTotIva[ 2 ]
      public aIvaTre    := aTotIva[ 3 ]

   RECOVER USING oError

      lOpenFiles        := .f.

      MsgStop( ErrorMessage( oError ), "Imposible abrir ficheros de pedidos a proveedores" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpenFiles
      CloseFiles()
   end if

   EnableAcceso()

RETURN ( lOpenFiles )

//----------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles()

   DisableAcceso()

   DestroyFastFilter( TDataView():PedidosProveedores( nView ), .t., .t. )

   if !Empty( oFont )
      oFont:end()
   end if

   if oStock != nil
      oStock:end()
   end if

   TDataView():DeleteView( nView )

   oStock      := nil
   oBandera    := nil

   lOpenFiles  := .f.

   oWndBrw     := nil

   EnableAcceso()

RETURN .t.

//----------------------------------------------------------------------------//

FUNCTION PedPrv( oMenuItem, oWnd, cCodPrv, cCodArt )

   local oPrv
   local oImp
   local oSnd
   local oDel
   local oRpl
   local oPdf
   local oMail
   local oRotor
   local oBtnEur
   local nLevel
   local lEuro          := .f.

   DEFAULT oMenuItem    := _MENUITEM_
   DEFAULT oWnd         := oWnd()
   DEFAULT cCodPrv      := ""
   DEFAULT cCodArt      := ""

   /*
   Obtenemos el nivel de acceso------------------------------------------------
   */

   nLevel               := nLevelUsr( oMenuItem )
   if nAnd( nLevel, 1 ) != 0
      msgStop( "Acceso no permitido." )
      return .f.
   end if

   /*
   Cerramos todas las ventanas-------------------------------------------------
   */

   if oWnd != nil
      SysRefresh(); oWnd:CloseAll(); SysRefresh()
   end if

   if !OpenFiles()
      return .f.
   end if

   DisableAcceso()

   DEFINE SHELL oWndBrw FROM 0, 0 TO 22, 80 ;
      XBROWSE ;
      TITLE    "Pedidos a proveedores" ;
      PROMPT   "N�mero",;
               "Fecha",;
               "Entrada",;
               "C�digo",;
               "Nombre proveedor";
      MRU      "Clipboard_empty_businessman_16";
      BITMAP   Rgb( 0, 114, 198 ) ;
      ALIAS    ( TDataView():PedidosProveedores( nView ) );
      APPEND   ( WinAppRec( oWndBrw:oBrw, bEdtRec, TDataView():PedidosProveedores( nView ), cCodPrv, cCodArt ) );
      DUPLICAT ( WinDupRec( oWndBrw:oBrw, bEdtRec, TDataView():PedidosProveedores( nView ), cCodPrv, cCodArt ) );
      EDIT     ( WinEdtRec( oWndBrw:oBrw, bEdtRec, TDataView():PedidosProveedores( nView ), cCodPrv, cCodArt ) );
      ZOOM     ( WinZooRec( oWndBrw:oBrw, bEdtRec, TDataView():PedidosProveedores( nView ) ) );
      DELETE   ( WinDelRec( oWndBrw:oBrw, TDataView():PedidosProveedores( nView ), {|| QuiPedPrv() } ) ) ;
      LEVEL    nLevel ;
      OF       oWnd

	oWndBrw:lFechado     := .t.
      oWndBrw:bChgIndex    := {|| if( oUser():lFiltroVentas(), CreateFastFilter( cFiltroUsuario, TDataView():PedidosProveedores( nView ), .f., , cFiltroUsuario ), CreateFastFilter( "", TDataView():PedidosProveedores( nView ), .f. ) ) }
	oWndBrw:SetYearComboBoxChange( {|| YearComboBoxChange() } )

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n cerrada"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->lCloPed }
         :nWidth           := 20
         :lHide            := .t.
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Zoom16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Envio"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->lSndDoc }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Lbl16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Estado"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| Max( ( TDataView():PedidosProveedores( nView ) )->nEstado, 1 ) }
         :nWidth           := 20
         :AddResource( "Bullet_Square_Red_16" )
         :AddResource( "Bullet_Square_Yellow_16" )
         :AddResource( "Bullet_Square_Green_16" )
         :AddResource( "trafficlight_on_16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Incidencia"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| nEstadoIncidencia( ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed ) }
         :nWidth           := 20
         :lHide            := .t.
         :AddResource( "Bullet_Square_Red_16" )
         :AddResource( "Bullet_Square_Yellow_16" )
         :AddResource( "Bullet_Square_Green_16" )
         :AddResource( "Informacion_16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Impreso"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->lImprimido }
         :nWidth           := 20
         :lHide            := .t.
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "IMP16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "N�mero"
         :cSortOrder       := "nNumPed"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cSerPed + "/" + Alltrim( Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Delegaci�n"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cSufPed }
         :nWidth           := 60
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n"
         :bEditValue       := {|| Trans( ( TDataView():PedidosProveedores( nView ) )->cTurPed, "######" ) }
         :nWidth           := 60
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Fecha"
         :cSortOrder       := "dFecPed"
         :bEditValue       := {|| Dtoc( ( TDataView():PedidosProveedores( nView ) )->dFecPed ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Caja"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cCodCaj }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Usuario"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cCodUsr }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Entrada"
         :cSortOrder       := "dFecEnt"
         :bEditValue       := {|| Dtoc( ( TDataView():PedidosProveedores( nView ) )->dFecEnt ) }
         :nWidth           := 80
         :lHide            := .t.
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Situaci�n"
         :cSortOrder       := "cSituac"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cSituac }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodPrv"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cCodPrv }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Nombre proveedor"
         :cSortOrder       := "cNomPrv"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->cNomPrv }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Base"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->nTotNet }
         :cEditPicture     := cPirDiv()
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := cImp()
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->nTotIva }
         :cEditPicture     := cPirDiv()
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "R.E."
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->nTotReq }
         :cEditPicture     := cPirDiv()
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Total"
         :bEditValue       := {|| ( TDataView():PedidosProveedores( nView ) )->nTotPed }
         :cEditPicture     := cPirDiv()
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( if( lEuro, cDivChg(), ( TDataView():PedidosProveedores( nView ) )->cDivPed ), TDataView():Divisas( nView ) ) }
         :nWidth           := 30
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Cliente"
         :bEditValue       := {|| if( !Empty( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli ), AllTrim( GetCodCli( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli ) ) + " - " + AllTrim( GetNomCli( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli ) ), "" ) }
         :nWidth           := 280
         :lHide            := .t.
      end with

      oWndBrw:cHtmlHelp    := "Pedido a proveedor"

      oWndBrw:CreateXFromCode()

   DEFINE BTNSHELL RESOURCE "BUS" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:SearchSetFocus() ) ;
      TOOLTIP  "(B)uscar";
      HOTKEY   "B"

   oWndBrw:AddSeaBar()

   DEFINE BTNSHELL RESOURCE "NEW" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecAdd() );
      ON DROP  ( oWndBrw:RecDup() );
      TOOLTIP  "(A)�adir";
      BEGIN GROUP;
      HOTKEY   "A";
      LEVEL    ACC_APPD

   DEFINE BTNSHELL RESOURCE "DUP" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecDup() );
      TOOLTIP  "(D)uplicar";
      HOTKEY   "D";
      LEVEL    ACC_APPD

   DEFINE BTNSHELL RESOURCE "EDIT" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecEdit() );
      TOOLTIP  "(M)odificar";
      HOTKEY   "M";
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "ZOOM" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecZoom() );
      TOOLTIP  "(Z)oom";
      HOTKEY   "Z";
      LEVEL    ACC_ZOOM

   DEFINE BTNSHELL oDel RESOURCE "DEL" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecDel() );
      MENU     This:Toggle() ;
      TOOLTIP  "(E)liminar";
      HOTKEY   "E";
      LEVEL    ACC_DELE

   DEFINE BTNSHELL oPrv RESOURCE "IMP" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( GenPedPrv( IS_PRINTER ) ) ;
      MENU     This:Toggle() ;
      TOOLTIP  "(I)mprimir";
      HOTKEY   "I";
      LEVEL    ACC_IMPR

      lGenPed( oWndBrw:oBrw, oPrv, IS_PRINTER ) ;

   DEFINE BTNSHELL RESOURCE "SERIE1" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( ImprimirSeriesPedidosProveedores() ) ;
      TOOLTIP  "Imp(r)imir series";
      HOTKEY   "R";
      LEVEL    ACC_IMPR

   DEFINE BTNSHELL oImp RESOURCE "PREV1" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( GenPedPrv( IS_SCREEN ), oWndBrw:Refresh() ) ;
      MENU     This:Toggle() ;
      TOOLTIP  "(P)revisualizar";
      HOTKEY   "P";
      LEVEL    ACC_IMPR

      lGenPed( oWndBrw:oBrw, oImp, IS_SCREEN ) ;

   DEFINE BTNSHELL oPdf RESOURCE "DOCLOCK" OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( GenPedPrv( IS_PDF ) ) ;
      TOOLTIP  "Pd(f)";
      HOTKEY   "F";
      LEVEL    ACC_IMPR

      lGenPed( oWndBrw:oBrw, oPdf, IS_PDF ) ;

   DEFINE BTNSHELL oMail RESOURCE "Mail" OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( GenPedPrv( IS_MAIL ) ) ;
      TOOLTIP  "Correo electr�nico";
      LEVEL    ACC_IMPR

      lGenPed( oWndBrw:oBrw, oMail, IS_MAIL ) ;

   if oUser():lAdministrador()

      DEFINE BTNSHELL RESOURCE "ChgState" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( ChgState( oWndBrw:oBrw ) ) ;
         TOOLTIP  "Cambiar Es(t)ado" ;
         HOTKEY   "T";
         LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL oSnd RESOURCE "Lbl" GROUP OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      TOOLTIP  "En(v)iar" ;
      MESSAGE  "Seleccionar pedidos para ser enviados" ;
      ACTION   lSnd( oWndBrw, TDataView():PedidosProveedores( nView ) ) ;
      HOTKEY   "V";
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL oBtnEur RESOURCE "BAL_EURO" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( lEuro := !lEuro, oWndBrw:Refresh() ) ;
      TOOLTIP  "M(o)neda";
      HOTKEY   "O";

   if oUser():lAdministrador()

      DEFINE BTNSHELL oRpl RESOURCE "BMPCHG" GROUP OF oWndBrw ;
         NOBORDER ;
         MENU     This:Toggle() ;
         ACTION   ( ReplaceCreator( oWndBrw, TDataView():PedidosProveedores( nView ), aItmPedPrv() ) ) ;
         TOOLTIP  "Cambiar campos" ;
         LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "BMPCHG" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( ReplaceCreator( oWndBrw, TDataView():PedidosProveedoresLineas( nView ), aColPedPrv() ) ) ;
            TOOLTIP  "Lineas" ;
            FROM     oRpl ;
            CLOSED ;
            LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL RESOURCE "SHOPPINGCART" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( Generador( oWndBrw:oBrw ) ) ;
      TOOLTIP  "(G)enerar" ;
      HOTKEY   "G";

   DEFINE BTNSHELL RESOURCE "INFO" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( TTrazaDocumento():Activate( PED_PRV, ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed ) ) ;
      TOOLTIP  "I(n)forme documento" ;
      HOTKEY   "N" ;
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL oRotor RESOURCE "ROTOR" GROUP OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( oRotor:Expand() ) ;
      TOOLTIP  "Rotor" ;
      LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "BUSINESSMAN_" OF oWndBrw ;
         ALLOW    EXIT ;
         ACTION   ( EdtPrv( ( TDataView():PedidosProveedores( nView ) )->cCodPrv ) );
         TOOLTIP  "Modificar proveedor" ;
         FROM     oRotor ;
         CLOSED ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "INFO" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( InfProveedor( ( TDataView():PedidosProveedores( nView ) )->cCodPrv ) );
         TOOLTIP  "Informe proveedor" ;
         FROM     oRotor ;
         CLOSED ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "DOCUMENT_PLAIN_BUSINESSMAN_" OF oWndBrw ;
         ALLOW    EXIT ;
         ACTION   ( if( ( TDataView():PedidosProveedores( nView ) )->nEstado == 3, MsgStop( "Pedido recibido" ), AlbPrv( nil, oWnd, nil, nil, ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed ) ) );
         TOOLTIP  "Generar albar�n" ;
         FROM     oRotor ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "DOCUMENT_PLAIN_BUSINESSMAN_" OF oWndBrw ;
         ACTION   ( Ped2Alb( ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed ) );
         TOOLTIP  "Modificar albar�n" ;
         FROM     oRotor ;
         LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:End() ) ;
      TOOLTIP  "(S)alir";
      HOTKEY   "S"

   if !oUser():lFiltroVentas()
      oWndBrw:oActiveFilter:SetFields( aItmPedPrv() )
      oWndBrw:oActiveFilter:SetFilterType( PED_PRV )
   end if

   ACTIVATE WINDOW oWndBrw VALID ( CloseFiles() )

   EnableAcceso()

   if !Empty( cCodPrv ) .or. !Empty( cCodArt )

      if !Empty( oWndBrw )
         oWndBrw:RecAdd()
      end if

      cCodPrv  := nil
      cCodArt  := nil

   end if

Return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION EdtRec( aTmp, aGet, dbf, oBrw, cCodPrv, cCodArt, nMode )

   local oDlg
   local oFld
   local oBrwLin
   local oBrwInc
   local oBrwDoc
   local oSay                 := Array( 5 )
   local cSay                 := Array( 5 )
   local oSayLabels           := Array( 7 )
   local oBtnAtp
   local oBmpDiv
   local oBmpEmp
   local cEstPed
   local oGetMasDiv
   local cGetMasDiv           := ""
   local cTlfPrv
   local oTlfPrv
   local oPedCli
   local oCodCli
   local oNomCli
   local cCodCli              := GetCodCli( aTmp[ _CNUMPEDCLI ] )
   local cNomCli              := GetNomCli( aTmp[ _CNUMPEDCLI ] )
   local oBmpGeneral
   local oBmpDatos
   local oBmpIncidencias
   local oBmpDocumentos

   /*
   Este valor los guaradamos para detectar los posibles cambios
   */

   cOldCodCli                 := aTmp[ _CCODPRV ]
   cPicUnd                    := MasUnd()                               // Picture de las unidades

   do case
   case nMode == APPD_MODE

      if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lAdministrador()
         msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
         Return .f.
      end if

      aTmp[ _CSERPED ]        := cNewSer( "nPedPrv" )
      aTmp[ _CTURPED ]        := cCurSesion()
      aTmp[ _CCODCAJ ]        := oUser():cCaja()
      aTmp[ _CCODALM ]        := oUser():cAlmacen()
      aTmp[ _CDIVPED ]        := cDivEmp()
      aTmp[ _NVDVPED ]        := nChgDiv( aTmp[ _CDIVPED ], TDataView():Divisas( nView ) )
      aTmp[ _CSUFPED ]        := RetSufEmp()
      aTmp[ _LSNDDOC ]        := .t.
      aTmp[ _NESTADO ]        := 1
      aTmp[ _CCODUSR ]        := cCurUsr()
      aTmp[ _CCODDLG ]        := oUser():cDelegacion()
      if !Empty( cCodPrv )
         aTmp[ _CCODPRV ]     := cCodPrv
      end if

   case nMode == DUPL_MODE
      if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lAdministrador()
         msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
         Return .f.
      end if

      aTmp[ _CTURPED ]        := cCurSesion()
      aTmp[ _CCODCAJ ]        := oUser():cCaja()
      aTmp[ _LSNDDOC ]        := .t.
      aTmp[ _LCLOPED ]        := .f.
      aTmp[ _NESTADO ]        := 1

   case nMode == EDIT_MODE

      if aTmp[ _NESTADO ] == 3
         msgStop( "El pedido ya fue recibido." )
         Return .f.
      end if

      if aTmp[ _LCLOPED ] .AND. !oUser():lAdministrador()
         msgStop( "Solo puede modificar los pedidos cerrados los administradores." )
         Return .f.
      end if

   end case

   /*
   Comineza la transaccion-----------------------------------------------------
   */

   if BeginTrans( aTmp, nMode )
      Return .f.
   end if

   if aTmp[ _NESTADO ] == 0
      aTmp[ _NESTADO ]  := 1
   end if

   do case
   case  aTmp[ _NESTADO ] == 1
      cEstPed           := "Pendiente"
   case  aTmp[ _NESTADO ] == 2
      cEstPed           := "Parcial"
   case  aTmp[ _NESTADO ] == 3
      cEstPed           := "Recibido"
   end case

   if Empty( aTmp[ _CDTOESP ] )
      aTmp[ _CDTOESP ]  := Padr( "General", 50 )
   end if

   if Empty( aTmp[ _CDPP ] ) 
      aTmp[ _CDPP ]     := Padr( "Pronto pago", 50 )
   end if

   /*
   Etiquetas-------------------------------------------------------------------
   */

   cSay[ 1 ]            := RetFld( aTmp[ _CCODALM ], TDataView():Almacen( nView ) )
   cSay[ 2 ]            := RetFld( aTmp[ _CCODPGO ], TDataView():FormasPago( nView ) )
   cSay[ 3 ]            := RetFld( aTmp[ _CCODCAJ ], TDataView():Cajas( nView ) )
   cSay[ 4 ]            := RetFld( aTmp[ _CCODPRV ], TDataView():Proveedores( nView ) )
   cTlfPrv              := RetFld( aTmp[ _CCODPRV ], TDataView():Proveedores( nView ), "Telefono" )
   cUsr                 := RetFld( aTmp[ _CCODUSR ], TDataView():Usuarios( nView ), "cNbrUse" )
   cSay[ 5 ]            := RetFld( cCodEmp() + aTmp[ _CCODDLG ], TDataView():Delegaciones( nView ), "cNomDlg" )

   DEFINE DIALOG oDlg RESOURCE "PEDPRV" TITLE LblTitle( nMode ) + "pedidos a proveedores"

	REDEFINE FOLDER oFld ;
         ID       400 ; 
         OF       oDlg ;
         PROMPT   "&Pedido",  "Da&tos",   "I&ncidencias",   "D&ocumentos" ;
         DIALOGS  "PEDPRV_1", "PEDPRV_2", "PEDCLI_3",       "PEDCLI_4"

      // cuadro del usuario

      REDEFINE GET aGet[ _CCODUSR ] VAR aTmp[ _CCODUSR ];
         ID       215 ;
         WHEN     ( .f. ) ;
         VALID    ( SetUsuario( aGet[ _CCODUSR ], oUsr, nil, TDataView():Usuarios( nView ) ) );
         OF       oFld:aDialogs[2]

      REDEFINE GET oUsr VAR cUsr ;
         ID       216 ;
         WHEN     ( .f. ) ; 
         OF       oFld:aDialogs[2] 

      // Datos del proveedor_________________________________________________

      REDEFINE BITMAP oBmpGeneral ;
            ID          990 ;
            RESOURCE    "Pedidos_proveedores_48_alpha" ;
            TRANSPARENT ;
            OF          oFld:aDialogs[1]

      REDEFINE BITMAP oBmpDatos ;
        ID       990 ;
        RESOURCE "folder2_red_alpha_48" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[2]

      REDEFINE BITMAP oBmpIncidencias ;
        ID       990 ;
        RESOURCE "information_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[3]

      REDEFINE BITMAP oBmpDocumentos ;
        ID       990 ;
        RESOURCE "address_book2_alpha_48" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[4]

      REDEFINE GET aGet[_CCODPRV] VAR aTmp[_CCODPRV] ;
            ID 		140 ;
            PICTURE	( RetPicCodPrvEmp() ) ;
		WHEN 		( nMode != ZOOM_MODE ) ;
            VALID       ( LoaPrv( aGet, aTmp, TDataView():Proveedores( nView ), nMode, oSay[ 4 ], oTlfPrv ) ) ;
            ON HELP     ( BrwProvee( aGet[_CCODPRV], oSay[ 4 ] ) ) ;
            BITMAP      "LUPA" ;
            OF          oFld:aDialogs[1]

      REDEFINE GET aGet[ _CNOMPRV ] VAR aTmp[ _CNOMPRV ];
		ID 		141 ;
            WHEN        ( nMode != ZOOM_MODE ) ;
            OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_CDNIPRV] VAR aTmp[_CDNIPRV] ;
         ID       145 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oTlfPrv VAR cTlfPrv ;
         ID       146 ;
         WHEN     ( .f. );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDIRPRV ] VAR aTmp[ _CDIRPRV ] ;
         ID       142 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         BITMAP   "Environnment_View_16" ;
         ON HELP  GoogleMaps( aTmp[ _CDIRPRV ], Rtrim( aTmp[ _CPOBPRV ] ) + Space( 1 ) + Rtrim( aTmp[ _CPROPRV ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPOSPRV ] VAR aTmp[ _CPOSPRV ] ;
         ID       143 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPOBPRV ] VAR aTmp[ _CPOBPRV ] ;
         ID       144 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPROPRV ] VAR aTmp[ _CPROPRV ] ;
         ID       147 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aGet[_CCODALM] VAR aTmp[_CCODALM]	;
			ID 		150 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cAlmacen( aGet[_CCODALM], TDataView():Almacen( nView ), oSay[ 1 ] ) ) ;
         ON HELP  ( BrwAlmacen( aGet[_CCODALM], oSay[ 1 ] ) ) ;
         BITMAP   "LUPA" ;
         COLOR    CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSay[ 1 ] VAR cSay[ 1 ] ;
         WHEN     .f. ;
			ID 		151 ;
			OF 		oFld:aDialogs[1] ;

      REDEFINE GET aGet[_CCODPGO] VAR aTmp[_CCODPGO];
			ID 		160 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    cFPago( aGet[_CCODPGO], TDataView():FormasPago( nView ), oSay[ 2 ] ) ;
         ON HELP  BrwFPago( aGet[_CCODPGO ], oSay[ 2 ]) ;
         BITMAP   "LUPA" ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oSay[ 2 ] VAR cSay[ 2 ];
			ID 		161 ;
         WHEN     .f. ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      /*
		Cajas____________________________________________________________________
		*/

      REDEFINE GET aGet[ _CCODCAJ ] VAR aTmp[ _CCODCAJ ];
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    cCajas( aGet[ _CCODCAJ ], TDataView():Cajas( nView ), oSay[ 3 ] ) ;
         ID       165 ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwCajas( aGet[ _CCODCAJ ], oSay[ 3 ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oSay[ 3 ] VAR cSay[ 3 ] ;
         ID       166 ;
         WHEN     .f. ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

		/*
		Moneda__________________________________________________________________
		*/

		REDEFINE GET aGet[ _CDIVPED ] VAR aTmp[ _CDIVPED ];
         WHEN     ( nMode == APPD_MODE .AND. ( dbfTmpLin )->( LastRec() ) == 0 ) ;
         VALID    ( cDivIn( aGet[ _CDIVPED ], oBmpDiv, aGet[ _NVDVPED ], @cPinDiv, @nDinDiv, @cPirDiv, @nDirDiv, oGetMasDiv, TDataView():Divisas( nView ), oBandera ) );
			PICTURE	"@!";
			ID 		170 ;
			COLOR 	CLR_GET ;
         ON HELP  BrwDiv( aGet[ _CDIVPED ], oBmpDiv, aGet[ _NVDVPED ], TDataView():Divisas( nView ), oBandera ) ;
         BITMAP   "LUPA" ;
         OF       oFld:aDialogs[1]

		REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
			ID 		171;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[ _NVDVPED ] VAR aTmp[ _NVDVPED ];
			WHEN 		( .F. ) ;
			ID 		180 ;
			PICTURE	"@E 999,999.9999" ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

		/*
		Bitmap________________________________________________________________
		*/

      REDEFINE BITMAP oBmpEmp ;
         FILE     "Bmp\ImgPedPrv.bmp" ;
         ID       500 ;
         OF       oDlg ;

      /*
      Precios de compra por propiedades----------------------------------------
      */

      oBrwLin                 := IXBrowse():New( oFld:aDialogs[1] )

      oBrwLin:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwLin:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwLin:cAlias          := dbfTmpLin

      oBrwLin:nMarqueeStyle   := 6
      oBrwLin:lFooter         := .t.
      oBrwLin:cName           := "Lineas de pedidos a proveedor"

         with object ( oBrwLin:AddCol() )
            :cHeader          := "N�mero"
            :cSortOrder       := "nNumLin"
            :bEditValue       := {|| if( ( dbfTmpLin )->lKitChl, "", Trans( ( dbfTmpLin )->nNumLin, "9999" ) ) }
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | if( !empty( oCol ), oCol:SetOrder(), ) }
            :nWidth           := 65
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Es. Estado"
            :bStrData         := {|| "" }
            :bBmpData         := {|| nTotRecibido( dbfTmpLin, TDataView():AlbaranesProveedoresLineas( nView ) ) }
            :nWidth           := 20
            :AddResource( "Bullet_Square_Red_16" )
            :AddResource( "Bullet_Square_Yellow_16" )
            :AddResource( "Bullet_Square_Green_16" )
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C�digo"
            :cSortOrder       := "cRef"
            :bEditValue       := {|| ( dbfTmpLin )->cRef }
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | if( !empty( oCol ), oCol:SetOrder(), ) }         
            :nWidth           := 80
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C. Barras"
            :bEditValue       := {|| cCodigoBarrasDefecto( ( dbfTmpLin )->cRef, TDataView():CodigoBarrasArticulo( nView ) ) }
            :nWidth           := 100
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C�digo proveedor"
            :bEditValue       := {|| ( dbfTmpLin )->cRefPrv }
            :nWidth           := 80
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Descripci�n"
            :cSortOrder       := "cDetalle"
            :bEditValue       := {|| if( Empty( ( dbfTmpLin )->cRef ), ( dbfTmpLin )->mLngDes, ( dbfTmpLin )->cDetalle ) }
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | if( !empty( oCol ), oCol:SetOrder(), ) }         
            :nWidth           := 280
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Prop. 1"
            :bEditValue       := {|| ( dbfTmpLin )->cValPr1 }
            :nWidth           := 60
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Prop. 2"
            :bEditValue       := {|| ( dbfTmpLin )->cValPr2 }
            :nWidth           := 60
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Lote"
            :bEditValue       := {|| ( dbfTmpLin )->cLote }
            :nWidth           := 80
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader             := cNombreUnidades()
            :cSortOrder          := "nUniCaja"
            :bEditValue          := {|| ( dbfTmpLin )->nUniCaja }
            :cEditPicture        := cPicUnd
            :nWidth              := 60
            :nDataStrAlign       := 1
            :nHeadStrAlign       := 1
            :lHide               := .t.
            :nEditType           := 1
            :nFooterType         := AGGR_SUM
            :bOnPostEdit         := {|o,x,n| ChangeUnidades( o, x, n, aTmp ) }
            :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | if( !empty( oCol ), oCol:SetOrder(), ) }         
         end with
   
         with object ( oBrwLin:AddCol() )
            :cHeader             := "Sumar unidades"
            :bStrData            := {|| "" }
            :bOnPostEdit         := {|| .t. }
            :bEditBlock          := {|| SumaUnidadLinea( aTmp ) }
            :nEditType           := 5
            :nWidth              := 20
            :nHeadBmpNo          := 1
            :nBtnBmp             := 1
            :nHeadBmpAlign       := 1
            :AddResource( "Navigate_Plus_16" )
            :lHide               := .t.
         end with
   
         with object ( oBrwLin:AddCol() )
            :cHeader             := "Restar unidades"
            :bStrData            := {|| "" }
            :bOnPostEdit         := {|| .t. }
            :bEditBlock          := {|| RestaUnidadLinea( aTmp ) }
            :nEditType           := 5
            :nWidth              := 20
            :nHeadBmpNo          := 1
            :nBtnBmp             := 1
            :nHeadBmpAlign       := 1
            :AddResource( "Navigate_Minus_16" )
            :lHide               := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Total " + cNombreUnidades()
            :bEditValue       := {|| nTotNPedPrv( dbfTmpLin ) }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
            :nFooterType      := AGGR_SUM
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "UM. Unidad de medici�n"
            :bEditValue       := {|| ( dbfTmpLin )->cUnidad }
            :nWidth           := 25
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Almacen"
            :bEditValue       := {|| ( dbfTmpLin )->cAlmLin }
            :nWidth           := 60
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Importe"
            :bEditValue       := {|| nTotUPedPrv( dbfTmpLin, nDinDiv ) }
            :cEditPicture     := cPinDiv
            :nWidth           := 90
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "% Dto."
            :bEditValue       := {|| ( dbfTmpLin )->nDtoLin }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 50
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "% Prm."
            :bEditValue       := {|| ( dbfTmpLin )->nDtoPrm }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 40
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Stock actual"
            :bEditValue       := {|| ( dbfTmpLin )->nStkAct }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Pendiente recibir"
            :bEditValue       := {|| ( dbfTmpLin )->nPdtRec }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Stock m�nimo"
            :bEditValue       := {|| ( dbfTmpLin )->nStkMin }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Consumo"
            :bEditValue       := {|| ( dbfTmpLin )->nConRea }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "7 dias"
            :bEditValue       := {|| ( dbfTmpLin )->nConSem }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "15 dias"
            :bEditValue       := {|| ( dbfTmpLin )->nConQui }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "30 dias"
            :bEditValue       := {|| ( dbfTmpLin )->nConMes }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with


         with object ( oBrwLin:AddCol() )
            :cHeader          := "% " + cImp()
            :bEditValue       := {|| ( dbfTmpLin )->nIva }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 50
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Total"
            :bEditValue       := {|| nTotLPedPrv( dbfTmpLin, nDinDiv, nDirDiv ) }
            :cEditPicture     := cPirDiv
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
            :nFooterType      := AGGR_SUM
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Comentario"
            :bEditValue       := {|| Padr( RetFld( ( dbfTmpLin )->cRef, TDataView():Articulos( nView ), "mComent" ), 100 ) }
            :nWidth           := 180
            :lHide            := .t.
            :nEditType        := 1
            :cEditPicture     := "@S180"
            :bOnPostEdit      := {|o,x,n| ChangeComentario( o, x, n, aTmp ) }
         end with

         if nMode != ZOOM_MODE
            oBrwLin:bLDblClick   := {|| EdtDeta( oBrwLin, bEdtDet, aTmp ) }
         end if

         oBrwLin:CreateFromResource( 190 )

            REDEFINE BUTTON ;
                  ID          500 ;
                  OF          oFld:aDialogs[1] ;
                  WHEN        ( nMode != ZOOM_MODE ) ;
                  ACTION      ( AppDeta( oBrwLin, bEdtDet, aTmp ) )

		REDEFINE BUTTON ;
                  ID          501 ;
                  OF          oFld:aDialogs[1] ;
                  WHEN 	      ( nMode != ZOOM_MODE ) ;
                  ACTION      ( EdtDeta( oBrwLin, bEdtDet, aTmp ) )

            REDEFINE BUTTON ;
                  ID          502 ;
                  OF          oFld:aDialogs[1] ;
                  WHEN        ( nMode != ZOOM_MODE ) ;
                  ACTION      ( WinDelRec( oBrwLin, dbfTmpLin, {|| delDeta() }, {|| RecalculaTotal( aTmp ) } ) )

		REDEFINE BUTTON ;
			ID 		503 ;
			OF 		oFld:aDialogs[1] ;
                  ACTION      ( EdtZoom( oBrwLin, bEdtDet, aTmp ) )

      REDEFINE BUTTON ;
	   ID 	524 ;
	   OF 	oFld:aDialogs[1] ;
	   WHEN 	( nMode != ZOOM_MODE ) ;
         ACTION   ( LineUp( dbfTmpLin, oBrwLin ) )

	REDEFINE BUTTON ;
	   ID 	525 ;
	   OF 	oFld:aDialogs[1] ;
	   WHEN 	( nMode != ZOOM_MODE ) ;
         ACTION   ( LineDown( dbfTmpLin, oBrwLin ) )

      REDEFINE BUTTON oBtnAtp;
         ID       526 ;
         OF       oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ImportaComprasProveedor( aTmp, oBrwLin, oDlg ) )

      /*
	Descuentos______________________________________________________________
	*/

      REDEFINE GET aGet[ _CDTOESP ] VAR aTmp[ _CDTOESP ] ;
            ID          199 ;
            WHEN        ( nMode != ZOOM_MODE ) ;
            ON CHANGE   ( RecalculaTotal( aTmp ) );
            OF 		oFld:aDialogs[1]

	REDEFINE GET aGet[ _NDTOESP ] VAR aTmp[ _NDTOESP ] ;
		ID 		200 ;
		WHEN 		( nMode != ZOOM_MODE ) ;
            PICTURE     "@E 999.99" ;
            SPINNER ;
            ON CHANGE   ( RecalculaTotal( aTmp ) );
		OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDPP ] VAR aTmp[ _CDPP ] ;
            ID          209 ;
            WHEN 		( nMode != ZOOM_MODE ) ;
            ON CHANGE   ( RecalculaTotal( aTmp ) );
		OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[ _NDPP ] VAR aTmp[ _NDPP ];
			ID 		210 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         PICTURE  "@E 999.99" ;
         SPINNER ;
			COLOR 	CLR_GET ;
         ON CHANGE( RecalculaTotal( aTmp ) );
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDTOUNO ] VAR aTmp[ _CDTOUNO ] ;
			ID 		240 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _NDTOUNO ] VAR aTmp[ _NDTOUNO ];
			ID 		250 ;
			PICTURE 	"@E 99.99" ;
         SPINNER ;
			COLOR 	CLR_GET ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDTODOS ] VAR aTmp[ _CDTODOS ] ;
         ID       260 ;
			PICTURE 	"@!" ;
         COLOR    CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _NDTODOS ] VAR aTmp[ _NDTODOS ];
         ID       270 ;
			PICTURE 	"@E 99.99" ;
         SPINNER ;
         COLOR    CLR_GET ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[1]

      /*
      Desglose del impuestos---------------------------------------------------------
      */

      oBrwIva                        := IXBrowse():New( oFld:aDialogs[ 1 ] )

      oBrwIva:bClrSel                := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwIva:bClrSelFocus           := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwIva:SetArray( aTotIva )

      oBrwIva:lHScroll               := .f.
      oBrwIva:lVScroll               := .f.
      oBrwIva:nMarqueeStyle          := 5
      oBrwIva:lRecordSelector        := .f.

      oBrwIva:CreateFromResource( 490 )

      with object ( oBrwIva:aCols[ 1 ] )
         :cHeader       := "Bruto"
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 1 ] ), Trans( aTotIva[ oBrwIva:nArrayAt, 2 ], cPirDiv ), "" ) }
         :nWidth        := 106
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 2 ] )
         :cHeader       := "Base"
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 2 ] ), Trans( aTotIva[ oBrwIva:nArrayAt, 2 ], cPirDiv ), "" ) }
         :nWidth        := 106
         :cEditPicture  := cPirDiv
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 3 ] )
         :cHeader       := "%" + cImp()
         :bStrData      := {|| if( !IsNil( aTotIva[ oBrwIva:nArrayAt, 3 ] ), aTotIva[ oBrwIva:nArrayAt, 3 ], "" ) }
         :bEditValue    := {|| aTotIva[ oBrwIva:nArrayAt, 3 ] }
         :nWidth        := 55
         :cEditPicture  := "@E 999.99"
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
         :nEditType     := 1
         :bEditWhen     := {|| !IsNil( aTotIva[ oBrwIva:nArrayAt, 3 ] ) }
         :bOnPostEdit   := {|o,x| EdtIva( o, x, aTotIva[ oBrwIva:nArrayAt, 3 ], dbfTmp, TDataView():TiposIva( nView ), oBrwLin ), RecalculaTotal( aTmp ) }
      end with

      with object ( oBrwIva:aCols[ 4 ] )
         :cHeader       := "%R.E."
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 4 ] ) .and. aTmp[ _LRECARGO ], Trans( aTotIva[ oBrwIva:nArrayAt, 4 ], "@E 99.9" ), "" ) }
         :nWidth        := 55
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 5 ] )
         :cHeader       := cImp()
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 5 ] ), Trans( aTotIva[ oBrwIva:nArrayAt, 5 ], cPirDiv ), "" ) }
         :nWidth        := 80
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 6 ] )
         :cHeader       := "R.E."
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 6 ] ) .and. aTmp[ _LRECARGO ], Trans( aTotIva[ oBrwIva:nArrayAt, 6 ], cPirDiv ), "" ) }
         :nWidth        := 80
         :cEditPicture  := cPirDiv
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
      end with

		/*
		Cajas de Totales
		------------------------------------------------------------------------
		*/

		REDEFINE SAY oGetNet VAR nGetNeto ;
			ID 		370 ;
			OF 		oFld:aDialogs[1]

		REDEFINE SAY oGetIva VAR nGetIva ;
			ID 		380 ;
			OF 		oFld:aDialogs[1]

		REDEFINE SAY oGetReq VAR nGetReq ;
			ID 		390 ;
			OF 		oFld:aDialogs[1]

      REDEFINE CHECKBOX aGet[ _LRECARGO ] VAR aTmp[ _LRECARGO ] ;
			ID 		400 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON CHANGE( RecalculaTotal( aTmp ) );
			OF 		oFld:aDialogs[1]

      REDEFINE SAY oGetTotal VAR nTotPed ;
			ID 		410 ;
			FONT 		oFont ;
			OF 		oFld:aDialogs[1]

      REDEFINE SAY oGetMasDiv VAR cGetMasDiv;
         ID       420 ;
			FONT 		oFont ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CSERPED ] VAR aTmp[ _CSERPED ] ;
         ID       690 ;
         PICTURE  "@!" ;
         SPINNER ;
         ON UP    ( UpSerie( aGet[_CSERPED] ) );
         ON DOWN  ( DwSerie( aGet[_CSERPED] ) );
         COLOR    CLR_GET ;
         WHEN     ( nMode == APPD_MODE .OR. nMode == DUPL_MODE );
         VALID    ( aTmp[_CSERPED] >= "A" .AND. aTmp[_CSERPED] <= "Z"  );
         OF       oFld:aDialogs[1]

		REDEFINE GET aGet[_NNUMPED] VAR aTmp[_NNUMPED];
			ID 		100 ;
			PICTURE 	"999999999" ;
			WHEN 		.F. ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_CSUFPED] VAR aTmp[_CSUFPED];
			ID 		105 ;
			WHEN 		.F. ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_DFECPED] VAR aTmp[_DFECPED];
			ID 		110 ;
			SPINNER;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NESTADO] VAR cEstPed;
         WHEN     .f. ;
         ID       120 ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_DFECENT] VAR aTmp[_DFECENT] ;
         ID       125 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         SPINNER ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE COMBOBOX aGet[ _CSITUAC ] VAR aTmp[ _CSITUAC ] ;
         ID       218 ;
         WHEN     ( nMode != ZOOM_MODE );
         ITEMS    ( TSituaciones():GetInstance():GetSituaciones() ) ;
         OF       oFld:aDialogs[1]

      REDEFINE RADIO aGet[ _NREGIVA ] VAR aTmp[ _NREGIVA ] ;
         ID       270, 271, 272, 273 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[_NBULTOS] VAR aTmp[_NBULTOS] ;
         ID       130 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         SPINNER ;
         PICTURE  "@E 999,999" ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[2]

      //Segunda caja de dialogo

      REDEFINE GET aGet[ _CCODDLG ] VAR aTmp[ _CCODDLG ] ;
         ID       300 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET oSay[ 5 ] VAR cSay[ 5 ] ;
         ID       301 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[_CSUPED] VAR aTmp[_CSUPED] ;
         ID       235 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[2]

      REDEFINE GROUP oSayLabels[ 1 ] ID 700 OF oFld:aDialogs[ 1 ] TRANSPARENT
      REDEFINE SAY   oSayLabels[ 2 ] ID 701 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 3 ] ID 702 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 4 ] ID 703 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 5 ] ID 704 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 6 ] ID 705 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 7 ] ID 706 OF oFld:aDialogs[ 1 ]

      /*
      Datos del envio----------------------------------------------------------
      */

      REDEFINE GET aGet[_CEXPED] VAR aTmp[_CEXPED];
         ID       180 ;
			COLOR 	CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[2]

      /*
      Observaciones------------------------------------------------------------
      */

      REDEFINE GET aGet[_COBSERV] VAR aTmp[_COBSERV];
			ID 		200 ;
         MEMO ;
			COLOR 	CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[2]

      REDEFINE GET oPedCli VAR aTmp[_CNUMPEDCLI] ;
         ID       230 ;
         WHEN     ( .f. ) ;
         PICTURE  "@R #/#########/##" ;
         OF       oFld:aDialogs[2]

      REDEFINE GET oCodCli VAR cCodCli ;
         ID       210 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET oNomCli VAR cNomCli ;
         ID       220 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      /*Impresi�n ( informa de si est� impreimido o no y de cuando se imprimi� )*/

      REDEFINE CHECKBOX aGet[ _LIMPRIMIDO ] VAR aTmp[ _LIMPRIMIDO ] ;
         ID       120 ;
         WHEN     ( nMode != ZOOM_MODE .and. lUsrMaster() ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _DFECIMP ] VAR aTmp[ _DFECIMP ] ;
         ID       121 ;
         WHEN     ( nMode != ZOOM_MODE .and. lUsrMaster() ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _CHORIMP ] VAR aTmp[ _CHORIMP ] ;
         ID       122 ;
         WHEN     ( nMode != ZOOM_MODE .and. lUsrMaster() ) ;
         OF       oFld:aDialogs[2]

      /*
      Caja de di�logos de incidencias------------------------------------------
      */

      oBrwInc                 := IXBrowse():New( oFld:aDialogs[ 3 ] )

      oBrwInc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwInc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwInc:cAlias          := dbfTmpInc

      oBrwInc:nMarqueeStyle   := 5
      oBrwInc:cName           := "Incidencias de pedidos a proveedor"

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Resuelta"
            :bStrData         := {|| "" }
            :bEditValue       := {|| ( dbfTmpInc )->lListo }
            :nWidth           := 65
            :SetCheck( { "Sel16", "Cnt16" } )
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "C�digo"
            :bEditValue       := {|| ( dbfTmpInc )->cCodTip }
            :nWidth           := 80
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Incidencia"
            :bEditValue       := {|| cNomInci( ( dbfTmpInc )->cCodTip, TDataView():TipoIncidencia( nView ) ) }
            :nWidth           := 250
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( ( dbfTmpInc )->dFecInc ) }
            :nWidth           := 90
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| ( dbfTmpInc )->mDesInc }
            :nWidth           := 390
         end with

         if nMode != ZOOM_MODE
            oBrwInc:bLDblClick   := {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) }
         end if

         oBrwInc:CreateFromResource( 210 )

      /*
      REDEFINE IBROWSE oBrwInc ;
			FIELDS ;
                  If( !(dbfTmpInc)->lListo, aDbfBmp[ 7 ], aDbfBmp[ 6 ] ),;
                  ( dbfTmpInc )->cCodTip ,;
                  cNomInci( ( dbfTmpInc )->cCodTip, TDataView():TipoIncidencia( nView ) ) ,;
                  Dtoc( ( dbfTmpInc )->dFecInc ),;
                  ( dbfTmpInc )->mDesInc ;
			FIELDSIZES ;
                  20,;
                  55,;
                  100,;
                  80,;
                  400;
         HEAD ;
                  "R",;
                  "Cod. tipo" ,;
                  "Tipo de incidencia" ,;
                  "Fecha" ,;
                  "Incidencia";
         JUSTIFY  .t., .t., .t., .t., .t. ;
         ALIAS    ( dbfTmpInc );
			ID 		210 ;
         OF       oFld:aDialogs[ 3 ]

        if nMode != ZOOM_MODE
            oBrwInc:bDel         := {|| DelDeta( oBrwInc, aTmp ) }
         end if

         oBrwInc:cWndName        := "Pedido a proveedor.Incidencia"

         oBrwInc:LoadData()
      */

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oFld:aDialogs[ 3 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinAppRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) )

      REDEFINE BUTTON ;
         ID       501 ;
         OF       oFld:aDialogs[ 3 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) )

		REDEFINE BUTTON ;
			ID 		502 ;
         OF       oFld:aDialogs[ 3 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( DbDelRec( oBrwInc, dbfTmpInc, nil, nil, .t. ) )

		REDEFINE BUTTON ;
			ID 		503 ;
         OF       oFld:aDialogs[ 3 ] ;
         ACTION   ( WinZooRec( oBrwInc, bEdtInc, dbfTmpInc ) )

      oBrwDoc                 := IXBrowse():New( oFld:aDialogs[ 4 ] )

      oBrwDoc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwDoc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwDoc:cAlias          := dbfTmpDoc

      oBrwDoc:nMarqueeStyle   := 5
      oBrwDoc:nRowHeight      := 40
      oBrwDoc:nDataLines      := 2

         with object ( oBrwDoc:AddCol() )
            :cHeader          := "Documento"
            :bEditValue       := {|| Rtrim( ( dbfTmpDoc )->cNombre ) + CRLF + Space( 5 ) + Rtrim( ( dbfTmpDoc )->cRuta ) }
            :nWidth           := 885
         end with

         if nMode != ZOOM_MODE
            oBrwDoc:bLDblClick   := {|| ShellExecute( oDlg:hWnd, "open", Rtrim( ( dbfTmpDoc )->cRuta ) ) }
         end if

         oBrwDoc:CreateFromResource( 210 )

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oFld:aDialogs[ 4 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinAppRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) )

      REDEFINE BUTTON ;
         ID       501 ;
         OF       oFld:aDialogs[ 4 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinEdtRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) )

		REDEFINE BUTTON ;
			ID 		502 ;
         OF       oFld:aDialogs[ 4 ] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( DbDelRec( oBrwDoc, dbfTmpDoc, nil, nil, .f. ) )

		REDEFINE BUTTON ;
			ID 		503 ;
         OF       oFld:aDialogs[ 4 ] ;
         ACTION   ( WinZooRec( oBrwDoc, bEdtDoc, dbfTmpDoc ) )

      REDEFINE BUTTON ;
         ID       504 ;
         OF       oFld:aDialogs[ 4 ] ;
         ACTION   ( ShellExecute( oDlg:hWnd, "open", Rtrim( ( dbfTmpDoc )->cRuta ) ) )

		/*
      Botones comunes a la caja de dialogo_____________________________________
		*/

     REDEFINE BUTTON ;
         ID       4 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( RecalculaPedidoProveedores( aTmp, oDlg ), ( oBrwLin:Refresh() ), RecalculaTotal( aTmp ) )

     REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( EndTrans( aGet, aTmp, oBrw, nMode, oDlg ) )

      REDEFINE BUTTON ;
         ID       3 ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( if( EndTrans( aGet, aTmp, oBrw, nMode, oDlg ), GenPedPrv( IS_PRINTER ), ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( If( ExitNoSave( nMode, dbfTmpLin ), ( oDlg:end() ), ) )

      if nMode != ZOOM_MODE
         oFld:aDialogs[1]:AddFastKey( VK_F2, {|| AppDeta( oBrwLin, bEdtDet, aTmp ) } )
         oFld:aDialogs[1]:AddFastKey( VK_F3, {|| EdtDeta( oBrwLin, bEdtDet, aTmp ) } )
         oFld:aDialogs[1]:AddFastKey( VK_F4, {|| WinDelRec( oBrwLin, dbfTmpLin, {|| DelDeta() }, {|| RecalculaTotal( aTmp ) } ) } )

         oFld:aDialogs[3]:AddFastKey( VK_F2, {|| WinAppRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
         oFld:aDialogs[3]:AddFastKey( VK_F3, {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
         oFld:aDialogs[3]:AddFastKey( VK_F4, {|| DbDelRec( oBrwInc, dbfTmpInc, nil, nil, .t. ) } )

         oFld:aDialogs[4]:AddFastKey( VK_F2, {|| WinAppRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
         oFld:aDialogs[4]:AddFastKey( VK_F3, {|| WinEdtRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
         oFld:aDialogs[4]:AddFastKey( VK_F4, {|| DbDelRec( oBrwDoc, dbfTmpDoc, nil, nil, .f. ) } )

         oDlg:AddFastKey( VK_F5, {|| EndTrans( aGet, aTmp, oBrw, nMode, oDlg ) } )
         oDlg:AddFastKey( VK_F6, {|| if( EndTrans( aGet, aTmp, oBrw, nMode, oDlg ), GenPedPrv( IS_PRINTER ), ) } )
         oDlg:AddFastKey( 65,    {|| if( GetKeyState( VK_CONTROL ), CreateInfoArticulo(), ) } )
      end if

      oDlg:AddFastKey ( VK_F1, {|| GoHelp() } )

   do case
      case nMode == APPD_MODE .and. lRecogerUsuario() .and. Empty( cCodArt )
         oDlg:bStart := {|| if( lGetUsuario( aGet[ _CCODUSR ], TDataView():Usuarios( nView ) ), , oDlg:end() ) }

      case nMode == APPD_MODE .and. lRecogerUsuario() .and. !Empty( cCodArt )
         oDlg:bStart := {|| if( lGetUsuario( aGet[ _CCODUSR ], TDataView():Usuarios( nView ) ), AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt ), oDlg:end() ) }

      case nMode == APPD_MODE .and. !lRecogerUsuario() .and. !Empty( cCodArt )
         oDlg:bStart := {|| AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt ) }

   end case

	ACTIVATE DIALOG oDlg	;
         ON INIT  (  EdtRecMenu( aGet, aTmp, oBrw, oBrwLin, nMode, oDlg ),;
                     ShowKitCom( TDataView():PedidosProveedores( nView ), dbfTmpLin, oBrwLin, cCodPrv, dbfTmpInc, aGet ),;
                     oBrwLin:Load(),;
                     oBrwInc:Load() ) ;
         ON PAINT (  RecalculaTotal( aTmp ) );
			CENTER

   KillTrans( oBrwLin )

   EndEdtRecMenu()

   oBmpDiv:end()
   oBmpEmp:end()
   oBmpGeneral:end()
   oBmpIncidencias:end()
   oBmpDatos:end()
   oBmpDocumentos:end()

   /*
   Guardamos los datos del browse----------------------------------------------
   */

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

Static Function EdtRecMenu( aGet, aTmp, oBrw, oBrwLin, nMode, oDlg )

   MENU oMenu

      MENUITEM    "&1. Rotor"

         MENU

            if !lExternal

            MENUITEM    "&1. Modificar proveedor";
               MESSAGE  "Modificar la ficha del proveedor" ;
               RESOURCE "Businessman_16";
               ACTION   ( EdtPrv( aTmp[ _CCODPRV ] ) )

            MENUITEM    "&2. Informe de proveedor";
               MESSAGE  "Abrir el informe del proveedor" ;
               RESOURCE "Info16";
               ACTION   ( InfProveedor( aTmp[ _CCODPRV ] ) );

            SEPARATOR

            end if

            MENUITEM    "&3. Informe del documento";
               MESSAGE  "Abrir el informe del documento" ;
               RESOURCE "Info16";
               ACTION   ( TTrazaDocumento():Activate( PED_PRV, aTmp[ _CSERPED ] + Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ] ) )

         ENDMENU

   ENDMENU

   oDlg:SetMenu( oMenu )

Return ( oMenu )

//----------------------------------------------------------------------------//

Static Function EndEdtRecMenu()

Return ( if( oMenu != nil, oMenu:End(), ) )

//---------------------------------------------------------------------------//

Static Function RecalculaPedidoProveedores( aTmp, oDlg )

   local nRecNum
   local nPreCom

   if !ApoloMsgNoYes( "�Atenci�n!,"                                      + CRLF + ;
                  "todos los precios se recalcular�n en funci�n de"  + CRLF + ;
                  "los valores en las bases de datos.",;
                  "� Desea proceder ?" )
      return nil
   end if

   oDlg:Disable()

   ( TDataView():Articulos( nView ) )->( ordSetFocus( "Codigo" ) )

   nRecNum                          := ( dbfTmpLin )->( RecNo() )

   ( dbfTmpLin )->( dbGotop() )
   while !( dbfTmpLin )->( eof() )

      /*
      Ahora buscamos por el codigo interno
      */

      nPreCom                       := nComPro( ( dbfTmpLin )->cRef, ( dbfTmpLin )->cCodPr1, ( dbfTmpLin )->cValPr1, ( dbfTmpLin )->cCodPr2, ( dbfTmpLin )->cValPr2, TDataView():ArticuloPrecioPropiedades( nView ) )

      if nPrecom  != 0

         ( dbfTmpLin )->nPreDiv     := nPreCom

      else

         if uFieldEmpresa( "lCosPrv", .f. )
            nPreCom                 := nPrecioReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )
         end if

         if nPreCom != 0
            ( dbfTmpLin )->nPreDiv  := nPreCom
         else
            ( dbfTmpLin )->nPreDiv  := nCosto( ( dbfTmpLin )->cRef, TDataView():Articulos( nView ), TDataView():Kit( nView ), .f., aTmp[ _CDIVPED ], TDataView():Divisas( nView ) )
         end if

         /*
         Descuento de articulo----------------------------------------------
         */

         if uFieldEmpresa( "lCosPrv", .f. )

            nPreCom                    := nDescuentoReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )

            if nPreCom != 0
               ( dbfTmpLin )->nDtoLin  := nPreCom
            end if

         /*
         Descuento de promocional----------------------------------------------
         */

            nPreCom                    := nPromocionReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )

            if nPreCom != 0
               ( dbfTmpLin )->nDtoPrm  := nPreCom
            end if

         end if

      end if

      ( dbfTmpLin )->( dbSkip() )

   end while

   ( dbfTmpLin )->( dbGoTo( nRecNum ) )

   oDlg:Enable()

Return nil

//---------------------------------------------------------------------------//

Static Function EdtDoc( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin )

   local oDlg
   local oRuta
   local oNombre
   local oObservacion

   DEFINE DIALOG oDlg RESOURCE "DOCUMENTOS" TITLE LblTitle( nMode ) + "documento de pedido a proveedor"

      REDEFINE GET oNombre VAR aTmp[ ( dbfTmpDoc )->( FieldPos( "cNombre" ) ) ] ;
         ID       120 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET oRuta VAR aTmp[ ( dbfTmpDoc )->( FieldPos( "cRuta" ) ) ] ;
         ID       100 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "FOLDER" ;
         ON HELP  ( oRuta:cText( cGetFile( 'Doc ( *.* ) | ' + '*.*', 'Seleccione el nombre del fichero' ) ) ) ;
         OF       oDlg

      REDEFINE GET oObservacion VAR aTmp[ ( dbfTmpDoc )->( FieldPos( "mObsDoc" ) ) ] ;
         MEMO ;
         ID       110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( WinGather( aTmp, nil, dbfTmpDoc, oBrw, nMode ), oDlg:end( IDOK ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| WinGather( aTmp, nil, dbfTmpDoc, oBrw, nMode ), oDlg:end( IDOK ) } )
   end if

   ACTIVATE DIALOG oDlg CENTER

Return ( oDlg:nResult == IDOK )

//----------------------------------------------------------------------------//

Static Function EdtInc( aTmp, aGet, dbf, oBrw, bWhen, bValid, nMode, aTmpLin )

   local oDlg
   local oNomInci
   local cNomInci

   if !Empty( aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ] )
      cNomInci          := cNomInci( aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], TDataView():TipoIncidencia( nView ) )
   end if

   if nMode == APPD_MODE
      aTmp[ _CSERPED  ] := aTmpLin[ _CSERPED ]
      aTmp[ _NNUMPED  ] := aTmpLin[ _NNUMPED ]
      aTmp[ _CSUFPED  ] := aTmpLin[ _CSUFPED ]
      if IsMuebles()
         aTmp[ ( dbfTmpInc )->( FieldPos( "lAviso" ) ) ]  := .t.
      end if
   end if

   DEFINE DIALOG oDlg RESOURCE "INCIDENCIA" TITLE LblTitle( nMode ) + "incidencias de pedido a proveedor"

      REDEFINE GET aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         VAR      aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         ID       120 ;
         WHEN     ( nMode != ZOOM_MODE );
         VALID    ( cTipInci( aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], TDataView():TipoIncidencia( nView ), oNomInci ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwIncidencia( TDataView():TipoIncidencia( nView ), aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], oNomInci ) ) ;
         OF       oDlg

      REDEFINE GET oNomInci VAR cNomInci;
         WHEN     .f. ;
         ID       130 ;
         OF       oDlg

      REDEFINE GET aTmp[ ( dbfTmpInc )->( FieldPos( "dFecInc" ) ) ] ;
         ID       100 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aTmp[ ( dbfTmpInc )->( FieldPos( "mDesInc" ) ) ] ;
         MEMO ;
         ID       110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE CHECKBOX aTmp[ ( dbfTmpInc )->( FieldPos( "lListo" ) ) ] ;
         ID       140 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE CHECKBOX aTmp[ ( dbfTmpInc )->( FieldPos( "lAviso" ) ) ] ;
         ID       150 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( WinGather( aTmp, nil, dbfTmpInc, oBrw, nMode ), oDlg:end( IDOK ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| WinGather( aTmp, nil, dbfTmpInc, oBrw, nMode ), oDlg:end( IDOK ) } )
   end if

   ACTIVATE DIALOG oDlg CENTER

Return ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

/*
Funcion Auxiliar para A�adir lineas de detalle a un pedido
*/

STATIC FUNCTION AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt )

   WinAppRec( oBrwLin, bEdtDet, dbfTmpLin, aTmp, cCodArt )

Return ( RecalculaTotal( aTmp ) )

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para la Edici�n de Lineas de Detalle en un pedido
*/
STATIC FUNCTION EdtDeta( oBrwLin, bEdtDet, aTmp )

   WinEdtRec( oBrwLin, bEdtDet, dbfTmpLin, aTmp )

Return ( RecalculaTotal( aTmp ) )

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para borrar las Lineas de Detalle en un pedido
*/

STATIC FUNCTION DelDeta()

   if ( dbfTmpLin )->lKitArt
      dbDelKit( , dbfTmpLin, ( dbfTmpLin )->nNumLin )
   end if

Return ( .t. )

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para la Visualizaci�n de Lineas de Detalle en una Abono
*/

STATIC FUNCTION EdtZoom( oBrwLin, bEdtDet, aTmp )

   WinZooRec( oBrwLin, bEdtDet, dbfTmpLin, aTmp )

RETURN NIL

//--------------------------------------------------------------------------//

/*
Edita las lineas de Detalle
*/

STATIC FUNCTION EdtDet( aTmp, aGet, dbf, oBrw, aTmpPed, cCodArt, nMode )

   local oDlg
   local oFld
   local oBmp
   local oBtn
   local oSay2
   local cSay2
   local oSayPr1
   local oSayPr2
   local cSayPr1        := ""
   local cSayPr2        := ""
   local oSayVp1
   local oSayVp2
   local cSayVp1        := ""
   local cSayVp2        := ""
   local oTotal
   local nTotal         := 0
   local oGet1
   local oGetStk
   local nGetStk        := 0
   local oGetIra
   local cGetIra        := Space( 50 )
   local oSayLote
   local nTotRes
   local oTotUni
   local oTotEnt
   local oTotPdt
   local oBrwAlb
   local nOrdAnt
   local oBrwPrp
   local cNumPed        := aTmp[ _CSERPED ] + Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ]

   cOldCodArt           := aTmp[ _CREF ]
   cOldUndMed           := aTmp[ _CUNIDAD ]

   if nMode == APPD_MODE

      aTmp[_NUNICAJA]   := 1
      aTmp[_CALMLIN ]   := aTmpPed[ _CCODALM ]

      if !Empty( cCodArt )
         aTmp[ _CREF ]  := cCodArt
      end if

   else

      nGetStk           := oStock:nPutStockActual( aTmp[ _CREFPRV ], aTmp[ _CALMLIN ], , , , aTmp[ _LKITART ], aTmp[ _NCTLSTK ] )

   end if

   nTotRes              := nUnidadesRecibidasPedPrv( aTmp[ _CSERPED ] + Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ], aTmp[ _CREF ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CREFPRV ], aTmp[ _CDETALLE ], TDataView():AlbaranesProveedoresLineas( nView ) )

   if nTotRes > nTotNPedPrv( aTmp )
      nTotRes           := nTotNPedPrv( aTmp )
   end if

   nOrdAnt              := ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdSetFocus( "cPedPrvRef" ) )

   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdScope( 0, aTmp[ _CSERPED ] + Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ] + aTmp[ _CREF ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ] + aTmp[ _CLOTE ] ) )
   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdScope( 1, aTmp[ _CSERPED ] + Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ] + aTmp[ _CREF ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ] + aTmp[ _CLOTE ] ) )
   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( dbGoTop() )

   DEFINE DIALOG  oDlg ;
      RESOURCE    "LPEDPRV" ;
      TITLE       LblTitle( nMode ) + "l�neas a pedidos de proveedores"

	REDEFINE FOLDER oFld ID 400 OF oDlg ;
         PROMPT   "&General"  , "Da&tos",    "&Anular",     "&Observaciones" ;
         DIALOGS  "LPEDPRV_1" , "LPEDPRV_2", "LFACPRV_4",   "LFACPRV_6"

      REDEFINE GET aGet[ _CREF ] VAR aTmp[ _CREF ];
	   ID       110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( LoaArt( aGet, aTmp, nMode, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oDlg, oBmp, oGetStk ) );
         ON HELP  ( BrwArticulo( aGet[ _CREF ], aGet[ _CDETALLE ] ) ) ;
         BITMAP   "LUPA" ;
         OF       oFld:aDialogs[1]

      /*
      Lotes
      ------------------------------------------------------
      */

      REDEFINE SAY oSayLote;
         ID       111 ;
	   OF 	oFld:aDialogs[1]

      REDEFINE GET aGet[ _CLOTE ] VAR aTmp[ _CLOTE ];
         ID       112 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
	   OF 	oFld:aDialogs[1]

      REDEFINE GET aGet[_CDETALLE] VAR aTmp[_CDETALLE] ;
	     ID 		120 ;
         WHEN     ( ( lModDes() .or. Empty( aTmp[ _CDETALLE ] ) ) .AND. nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_MLNGDES] VAR aTmp[_MLNGDES] ;
			MEMO ;
			ID 		121 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      /*
      Propiedades
      -------------------------------------------------------------------------
      */

      REDEFINE GET aGet[ _CVALPR1 ] VAR aTmp[ _CVALPR1 ];
         ID       220 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         VALID    ( if( lPrpAct( aGet[ _CVALPR1 ], oSayVp1, aTmp[ _CCODPR1 ], TDataView():PropiedadesLineas( nView ) ),;
                        LoaArt( aGet, aTmp, nMode, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oDlg, oBmp, oGetStk ),;
                        .f. ) ) ;
         ON HELP  ( brwPrpAct( aGet[ _CVALPR1 ], oSayVp1, aTmp[_CCODPR1 ] ) ) ;
	   OF 		oFld:aDialogs[1]

         aGet[ _CVALPR1 ]:bChange   := {|| aGet[ _CVALPR1 ]:Assign(), oStock:nPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oGetStk ) }

      REDEFINE SAY oSayPr1 VAR cSayPr1;
         ID       221 ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSayVp1 VAR cSayVp1;
         ID       222 ;
         WHEN     .f. ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CVALPR2 ] VAR aTmp[ _CVALPR2 ];
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         VALID    ( if( lPrpAct( aGet[ _CVALPR2 ], oSayVp2, aTmp[ _CCODPR2 ], TDataView():PropiedadesLineas( nView ) ),;
                        LoaArt( aGet, aTmp, nMode, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oDlg, oBmp, oGetStk ),;
                        .f. ) ) ;
         ON HELP  ( brwPrpAct( aGet[ _CVALPR2 ], oSayVp2, aTmp[ _CCODPR2 ] ) ) ;
			OF 		oFld:aDialogs[1]

         aGet[ _CVALPR2 ]:bChange   := {|| aGet[ _CVALPR2 ]:Assign(), oStock:nPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oGetStk ) }

      REDEFINE SAY oSayPr2 VAR cSayPr2;
         ID       231 ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSayVp2 VAR cSayVp2;
         ID       232 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CALMLIN ] VAR aTmp[ _CALMLIN ]  ;
         ID       240 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    (  cAlmacen( aGet[ _CALMLIN ], TDataView():Almacen( nView ), oSay2 ),;
                     oStock:lPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oGetStk ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( Self, oSay2 ) ) ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET oSay2 VAR cSay2 ;
			WHEN 		.F. ;
         ID       241 ;
			OF 		oFld:aDialogs[1]

      REDEFINE LISTBOX oBrwPrp ;
         FIELDS   "" ;
         HEAD     "" ;
         ID       100 ;
         OF       oFld:aDialogs[1]

      /*
      oBrwPrp                       := IXBrowse():New( oFld:aDialogs[1] )

      oBrwPrp:nDataType             := DATATYPE_ARRAY

      oBrwPrp:bClrSel               := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwPrp:bClrSelFocus          := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwPrp:lHScroll              := .t.
      oBrwPrp:lVScroll              := .t.

      oBrwPrp:nMarqueeStyle         := 3
      oBrwPrp:lRecordSelector       := .f.
      oBrwPrp:lFastEdit             := .t.
      oBrwPrp:nFreeze               := 1
      oBrwPrp:lFooter               := .t.

      oBrwPrp:SetArray( {}, , , .f. )

      oBrwPrp:MakeTotals()

      oBrwPrp:CreateFromResource( 100 )
      */
      /*
      fin de propiedades
      -------------------------------------------------------------------------
      */

      REDEFINE GET aGet[ _NIVA ] VAR aTmp[ _NIVA ] ;
			ID 		130 ;
         WHEN     ( lModIva() .AND. nMode != ZOOM_MODE ) ;
			PICTURE 	"@E 99.99" ;
         ON CHANGE( lCalcDeta( aTmp, oTotal ) );
         VALID    ( lTiva( TDataView():TiposIva( nView ), aTmp[ _NIVA ], @aTmp[ _NREQ ] ) );
         ON HELP  ( BrwIva( aGet[ _NIVA ], TDataView():TiposIva( nView ), , .t. ) ) ;
         BITMAP   "LUPA" ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _NCANPED ] VAR aTmp[ _NCANPED ];
			ID 		140 ;
			SPINNER ;
         WHEN     ( lUseCaj() .AND. nMode != ZOOM_MODE ) ;
			ON CHANGE( lCalcDeta( aTmp, oTotal ) );
			PICTURE 	cPicUnd ;
         OF       oFld:aDialogs[1] ;
         IDSAY    141

      // Campos de las descripciones de la unidad de medici�n------------------

      REDEFINE GET aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ] ;
         VAR      aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ] ;
         ID       300 ;
         IDSAY    301 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:oSay:SetColor( CLR_BLUE )

      REDEFINE GET aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ] ;
         VAR      aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ] ;
         ID       310 ;
         IDSAY    311 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:oSay:SetColor( CLR_BLUE )

      REDEFINE GET aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ] ;
         VAR      aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ] ;
         ID       320 ;
         IDSAY    321 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:oSay:SetColor( CLR_BLUE )

		REDEFINE GET aGet[_NUNICAJA] VAR aTmp[_NUNICAJA];
			ID 		150 ;
			SPINNER ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ON CHANGE( lCalcDeta( aTmp, oTotal ) );
			COLOR 	CLR_GET ;
			PICTURE 	cPicUnd ;
         OF       oFld:aDialogs[1] ;
         IDSAY    151

      REDEFINE GET aGet[ _NPREDIV ] VAR aTmp[ _NPREDIV ] ;
			ID 		160 ;
			SPINNER ;
			PICTURE	cPinDiv ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ON CHANGE( lCalcDeta( aTmp, oTotal ) );
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_CUNIDAD] VAR aTmp[_CUNIDAD] ;
         ID       170 ;
         IDTEXT   171 ;
         BITMAP   "LUPA" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( TDataView():GetObject( "UnidadMedicion", nView ):Existe( aGet[ _CUNIDAD ], aGet[ _CUNIDAD ]:oHelpText, "cNombre" ), ValidaMedicion( aTmp, aGet) );
         ON HELP  ( TDataView():GetObject( "UnidadMedicion", nView ):Buscar( aGet[ _CUNIDAD ] ), ValidaMedicion( aTmp, aGet ) ) ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aGet[_NDTOLIN] VAR aTmp[_NDTOLIN] ;
			ID 		180 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ON CHANGE( lCalcDeta( aTmp, oTotal ) );
			SPINNER ;
         PICTURE  "@E 999.99" ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NDTOPRM] VAR aTmp[_NDTOPRM] ;
         ID       250 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ON CHANGE( lCalcDeta( aTmp, oTotal ) );
			SPINNER ;
			PICTURE	"@E 99.99" ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NDTORAP] VAR aTmp[_NDTORAP] ;
         ID       260 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			SPINNER ;
			PICTURE	"@E 99.99" ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oGetStk VAR nGetStk ;
         ID       190 ;
         WHEN     .f. ;
			PICTURE 	cPicUnd ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CREFPRV ] VAR aTmp[ _CREFPRV ];
         ID       400 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oGetIra VAR cGetIra;
         ID       410 ;
         IDSAY    411 ;
         BITMAP   "Lupa" ;
         ON HELP  ( SearchProperty( oGetIra, oBrwPrp ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

		REDEFINE GET oTotal VAR nTotal ;
			ID 		210 ;
         PICTURE  cPirDiv ;
			WHEN 		.F. ;
			OF 		oFld:aDialogs[1]

      REDEFINE BITMAP oBmp ;
         ID       100 ;
         OF       oDlg

      oBmp:SetColor( , GetSysColor( 15 ) )

      /*
      Segunda Caja de di�logo--------------------------------------------------
      */

      REDEFINE SAY oTotUni PROMPT nTotNPedPrv( aTmp ) ;
         ID       150 ;
         COLOR    "B/W*" ;
         PICTURE  cPicUnd ;
         OF       oFld:aDialogs[2]

      REDEFINE SAY oTotEnt PROMPT nTotRes ;
         ID       160 ;
         COLOR    "G/W*" ;
         PICTURE  cPicUnd ;
         OF       oFld:aDialogs[2]

      REDEFINE SAY oTotPdt PROMPT nTotNPedPrv( aTmp ) - nTotRes ;
         ID       170 ;
         COLOR    "R/W*" ;
         PICTURE  cPicUnd ;
         OF       oFld:aDialogs[2]

      /*
      Browse de albaranes------------------------------------------------------
      */

      oBrwAlb                 := IXBrowse():New( oFld:aDialogs[ 2 ] )

      oBrwAlb:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwAlb:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwAlb:cAlias          := TDataView():AlbaranesProveedoresLineas( nView )

      oBrwAlb:lFooter         := .f.
      oBrwAlb:nMarqueeStyle   := 5

      oBrwAlb:CreateFromResource( 180 )

         with object ( oBrwAlb:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( dFecAlbPrv( ( TDataView():AlbaranesProveedoresLineas( nView ) )->cSerAlb + Str( ( TDataView():AlbaranesProveedoresLineas( nView ) )->nNumAlb ) + ( TDataView():AlbaranesProveedoresLineas( nView ) )->cSufAlb, TDataView():AlbaranesProveedores( nView ) ) ) }
            :nWidth           := 80
         end with

         with object ( oBrwAlb:AddCol() )
            :cHeader          := "Albar�n"
            :bEditValue       := {|| AllTrim( ( TDataView():AlbaranesProveedoresLineas( nView ) )->cSerAlb ) + "/" + AllTrim( Str( ( TDataView():AlbaranesProveedoresLineas( nView ) )->nNumAlb ) ) + "/" + AllTrim( ( TDataView():AlbaranesProveedoresLineas( nView ) )->cSufAlb ) }
            :nWidth           := 80
         end with

         with object ( oBrwAlb:AddCol() )
            :cHeader          := "Proveedor"
            :bEditValue       := {|| AllTrim( aTmpPed[ _CCODPRV ] ) + " - " + AllTrim( aTmpPed[ _CNOMPRV ] ) }
            :nWidth           := 240
         end with

         with object ( oBrwAlb:AddCol() )
            :cHeader          := "Total unidades"
            :bEditValue       := {|| nTotNAlbPrv( TDataView():AlbaranesProveedoresLineas( nView ) ) }
            :bFooter          := {|| nTotRes }
            :cEditPicture     := cPicUnd
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

      REDEFINE BUTTON oBtn;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( SaveDeta( aTmp, aGet, oBrwPrp, oGetIra, oFld, oDlg, oBrw, nMode, oTotal, oGet1, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetStk, oSayLote, oBtn ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

      REDEFINE BUTTON ;
         ID       9 ;
			OF 		oDlg ;
         ACTION   ( GoHelp() )

      REDEFINE CHECKBOX aGet[_LANULADO] VAR aTmp[_LANULADO] ;
			ID 		400 ;
         ON CHANGE( CambiaAnulado( aGet, aTmp ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[3]

      REDEFINE GET aGet[_DANULADO] VAR aTmp[_DANULADO] ;
         ID       410 ;
         SPINNER ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[3]

      REDEFINE GET aGet[ _MANULADO ] VAR aTmp[_MANULADO] ;
			MEMO ;
         ID       420 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[3]

      REDEFINE GET aGet[_MOBSLIN] VAR aTmp[_MOBSLIN] ;
         MEMO ;
         ID       100 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[4]

   if nMode != ZOOM_MODE
      oDlg:AddFastKey(  VK_F5, {|| SaveDeta( aTmp, aGet, oBrwPrp, oGetIra, oFld, oDlg, oBrw, nMode, oTotal, oGet1, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetStk, oSayLote, oBtn ) } )
   end if

   oDlg:AddFastKey(     VK_F1, {|| GoHelp() } )

   oDlg:bStart    := {||   SetDlgMode( aGet, aTmp, aTmpPed, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oFld, oDlg, oTotal, oGetStk ),;
                           if( !Empty( cCodArt ), aGet[ _CREF ]:lValid(), ),;
                           lCalcDeta( aTmp, oTotal ),;
                           aGet[ _CUNIDAD ]:lValid(),;
                           oBrwAlb:GoTop(), oBrwAlb:Refresh() }

   ACTIVATE DIALOG oDlg ;
         ON INIT  ( EdtDetMenu( aGet[ _CREF ], oDlg ) );
         CENTER

   EndDetMenu()

   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdScope( 0, nil ) )
   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdScope( 1, nil ) )
   ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdSetFocus( nOrdAnt ) )

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

STATIC FUNCTION SetDlgMode( aGet, aTmp, aTmpPed, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oFld, oDlg, oTotal )

   local cCodArt        := aGet[ _CREF ]:VarGet()

   if !lUseCaj()
      aGet[ _NCANPED ]:Hide()
   else
      aGet[ _NCANPED ]:SetText( cNombreCajas() )
   end if

   aGet[ _NUNICAJA ]:SetText( cNombreUnidades() )

   if Empty( aTmp[_CALMLIN ] )
      aTmp[ _CALMLIN ]  := aTmpPed[ _CCODALM ]
   end if

   oBrwPrp:Hide()

   oGetIra:Hide()

   oSayPr1:SetText( "" )
   oSayVp1:SetText( "" )

   oSayPr2:SetText( "" )
   oSayVp2:SetText( "" )

   do case
   case nMode == APPD_MODE

      aGet[ _CREF    ]:show()
      aGet[ _CDETALLE]:show()
      aGet[ _MLNGDES ]:hide()
      aGet[ _CLOTE   ]:hide()
      aGet[ _NUNICAJA]:cText( 1 )
      aGet[ _NCANPED ]:cText( 1 )
      aGet[ _CALMLIN ]:cText( aTmpPed[ _CCODALM ] )
      aGet[ _DANULADO]:cText( Ctod( "" ) )
      aGet[ _LANULADO]:Click( .f. )
      aGet[ _NIVA    ]:cText( nIva( TDataView():TiposIva( nView ), cDefIva() ) )

      aTmp[ _NREQ    ]  := nReq( TDataView():TiposIva( nView ), cDefIva() )

      aTmp[ _NNUMLIN ]  := nLastNum( dbfTmpLin )

      oSayLote:hide()

   case nMode != APPD_MODE .AND. empty( cCodArt )

      aGet[_CREF    ]:hide()
		aGet[_CDETALLE]:hide()
		aGet[_MLNGDES ]:show()
      aGet[_CLOTE   ]:hide()

      oSayLote:hide()

   case nMode != APPD_MODE .AND. !empty( cCodArt )

      aGet[_CREF    ]:show()
		aGet[_CDETALLE]:show()
		aGet[_MLNGDES ]:hide()

      if aTmp[_LLOTE]
         aGet[_CLOTE   ]:Show()
         oSayLote:Show()
      else
         aGet[_CLOTE   ]:Hide()
         oSayLote:Hide()
      end if

   end case

   if !Empty( aTmp[ _CCODPR1 ] )
      aGet[ _CVALPR1 ]:Show()
      aGet[ _CVALPR1 ]:lValid()
      oSayPr1:SetText( retProp( aTmp[ _CCODPR1 ], TDataView():Propiedades( nView ) ) )
      oSayPr1:Show()
      oSayVp1:Show()
   else
      aGet[ _CVALPR1 ]:Hide()
      oSayPr1:Hide()
      oSayVp1:Hide()
   end if

   if !Empty( aTmp[ _CCODPR2 ] )
      aGet[ _CVALPR2 ]:Show()
      aGet[ _CVALPR2 ]:lValid()
      oSayPr2:SetText( retProp( aTmp[ _CCODPR2 ], TDataView():Propiedades( nView ) ) )
      oSayPr2:Show()
      oSayVp2:Show()
   else
      aGet[ _CVALPR2 ]:hide()
      oSayPr2:Hide()
      oSayVp2:Hide()
   end if

   //Ocultamos las tres unidades de medicion

   aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:Hide()
   aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:Hide()
   aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:Hide()

   if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:Seek(  aTmp[ _CUNIDAD ] )

      if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 1 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim1 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim1 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:Show()
      end if

      if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 2 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim2 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim2 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:Show()
      end if

      if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 3 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim3 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim3 )
         aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:Show()
      end if

   end if

   // Prepramos la caja

   oFld:SetOption( 1 )

   aGet[ _CALMLIN ]:lValid()
   aGet[ _CREF    ]:SetFocus()

   oTotal:cText( 0 )

RETURN .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION LoaArt( aGet, aTmp, nMode, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oDlg, oBmp, oGetStk )

   local nOrdAnt
   local cCodFam
   local cCodPrv
   local cPrpArt
   local cCodArt
   local nUnidad
   local nPreCom
   local lChgCodArt
   local lSeek       := .f.

   nPreCom           := 0
   cCodPrv           := aTmpPed[ _CCODPRV ]
   cCodArt           := aGet[ _CREF ]:varGet()
   cPrpArt           := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]
   lChgCodArt        := ( Rtrim( cOldCodArt ) != Rtrim( cCodArt ) .or. Rtrim( cOldPrpArt ) != Rtrim( cPrpArt ) )

   if Empty( cCodArt )

      if lRetCodArt()
         MsgStop( "No se pueden a�adir lineas sin codificar" )
         return .f.
      end if

      aGet[ _NIVA     ]:bWhen := {|| .t. }
      aGet[ _CDETALLE ]:Hide()
      aGet[ _CLOTE    ]:Hide()

      oSayLote:Hide()

      aGet[ _MLNGDES  ]:Show()
      aGet[ _MLNGDES  ]:SetFocus()

      if !Empty( oBrwPrp )
         oBrwPrp:Hide()
      end if

   else

      if lModIva()
         aGet[ _NIVA  ]:bWhen := {|| .t. }
      else
         aGet[ _NIVA  ]:bWhen := {|| .f. }
      end if

      aGet[ _CREF     ]:Show()
      aGet[ _CDETALLE ]:Show()
      aGet[ _MLNGDES  ]:Hide()

      if lIntelliArtciculoSearch( cCodArt, cCodPrv, TDataView():Articulos( nView ), TDataView():ProveedorArticulo( nView ), TDataView():CodigoBarrasArticulo( nView ) )

         if ( lChgCodArt )

            if ( TDataView():Articulos( nView ) )->lObs
               MsgStop( "Art�culo catalogado como obsoleto" )
               return .f.
            end if

            aGet[ _CREF     ]:cText( ( TDataView():Articulos( nView ) )->Codigo )
            aGet[ _CDETALLE ]:cText( ( TDataView():Articulos( nView ) )->Nombre )

            if ( TDataView():Articulos( nView ) )->lMosCom .and. !Empty( ( TDataView():Articulos( nView ) )->mComent )
               MsgStop( Trim( ( TDataView():Articulos( nView ) )->mComent ) )
            end if

            /*
            Preguntamos si el regimen de " + cImp() + " es distinto de Exento-------------
            */

            if aTmpPed[ _NREGIVA ] <= 1
                  aGet[ _NIVA ]:cText( nIva( TDataView():TiposIva( nView ), ( TDataView():Articulos( nView ) )->TipoIva ) )
                  aTmp[ _NREQ ]     := nReq( TDataView():TiposIva( nView ), ( TDataView():Articulos( nView ) )->TipoIva )
            end if

            if ( TDataView():Articulos( nView ) )->nCajEnt != 0
               aGet[ _NCANPED ]:cText( ( TDataView():Articulos( nView ) )->nCajEnt )
            end if

            if ( TDataView():Articulos( nView ) )->nUniCaja != 0
               aGet[ _NUNICAJA ]:cText( ( TDataView():Articulos( nView ) )->nUniCaja )
            end if

            /*
            Lotes
            ---------------------------------------------------------------------
            */

            aTmp[ _LLOTE ]    := ( TDataView():Articulos( nView ) )->lLote

            if ( TDataView():Articulos( nView ) )->lLote
               oSayLote:Show()
               aGet[ _CLOTE ]:Show()
               aGet[ _CLOTE ]:cText( ( TDataView():Articulos( nView ) )->cLote )
            else
               oSayLote:Hide()
               aGet[ _CLOTE ]:Hide()
            end if

            /*
            Referencia de proveedor-----------------------------------------------
            */

            nOrdAnt                 := ( TDataView():ProveedorArticulo( nView ) )->( OrdSetFocus( "cCodPrv" ) )

            if ( TDataView():ProveedorArticulo( nView ) )->( dbSeek( cCodPrv + cCodArt ) )

               if !Empty( aGet[ _CREFPRV ] )
                  aGet[ _CREFPRV ]:cText( ( TDataView():ProveedorArticulo( nView ) )->cRefPrv )
               end if

            else

               if !Empty( aGet[ _CREFPRV ] )
                  aGet[ _CREFPRV ]:cText( Space( 20 ) )
               end if

            end if

            ( TDataView():ProveedorArticulo( nView ) )->( ordSetFocus( nOrdAnt ) )

            /*
            Control de stocks--------------------------------------------------
            */

            aTmp[ _NCTLSTK ]     := ( TDataView():Articulos( nView ) )->nCtlStock

            /*
            Tratamientos kits-----------------------------------------------------
            */

            if ( TDataView():Articulos( nView ) )->lKitArt
               aTmp[ _LKITART ]     := ( TDataView():Articulos( nView ) )->lKitArt                        // Marcamos como padre del kit
               aTmp[ _LIMPLIN ]     := lImprimirCompuesto( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) ) // 1 Todos, 2 Compuesto
               aTmp[ _LKITPRC ]     := lPreciosCompuestos( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) ) // 1 Todos, 2 Compuesto
               if lStockCompuestos( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) )
                  aTmp[ _NCTLSTK ]  := ( TDataView():Articulos( nView ) )->nCtlStock
               else
                  aTmp[ _NCTLSTK ]  := STOCK_NO_CONTROLAR // No controlar Stock
               end if
            else
               aTmp[ _LIMPLIN ]     := .f.
               aTmp[ _NCTLSTK ]     := ( TDataView():Articulos( nView ) )->nCtlStock
            end if

            /*
            Buscamos la familia del articulo y anotamos las propiedades--------
            */

            aTmp[ _CCODPR1 ]        := ( TDataView():Articulos( nView ) )->cCodPrp1
            aTmp[ _CCODPR2 ]        := ( TDataView():Articulos( nView ) )->cCodPrp2

            if ( !Empty( aTmp[ _CCODPR1 ] ) .or. !Empty( aTmp[ _CCODPR2 ] ) ) .and. ;
               ( uFieldEmpresa( "lUseTbl" ) .and. ( nMode == APPD_MODE ) )

               nPreCom              := nCosto( nil, TDataView():Articulos( nView ), TDataView():Kit( nView ), .f., aTmpPed[ _CDIVPED ], TDataView():Divisas( nView ) )

               LoadPropertiesTable( cCodArt, nPreCom, aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], TDataView():Propiedades( nView ), TDataView():PropiedadesLineas( nView ), TDataView():ArticuloPrecioPropiedades( nView ), oBrwPrp, aGet[ _NUNICAJA ], aGet[ _NPREDIV ] )

               oGetIra:Show()

            else

               oBrwPrp:Hide()

               oGetIra:Hide()

               if !Empty( aTmp[ _CCODPR1 ] ) // .and. !uFieldEmpresa( "lUseTbl" ) .or. ( nMode == APPD_MODE )

                  if aGet[ _CVALPR1 ] != nil
                     aGet[ _CVALPR1 ]:Show()
                     aGet[ _CVALPR1 ]:SetFocus()
                  end if

                  if oSayPr1 != nil
                     oSayPr1:SetText( retProp( ( TDataView():Articulos( nView ) )->cCodPrp1, TDataView():Propiedades( nView ) ) )
                     oSayPr1:Show()
                  end if

                  if oSayVp1 != nil
                     oSayVp1:Show()
                  end if

               else

                  if aGet[ _CVALPR1 ] !=  nil
                     aGet[ _CVALPR1 ]:Hide()
                  end if

                  if oSayPr1 != nil
                     oSayPr1:Hide()
                  end if

                  if oSayVp1 != nil
                     oSayVp1:Hide()
                  end if

               end if

               if !Empty( aTmp[_CCODPR2 ] ) // .and. !uFieldEmpresa( "lUseTbl" )

                  if aGet[ _CVALPR2 ] != nil
                     aGet[ _CVALPR2 ]:show()
                  end if

                  if oSayPr2 != nil
                     oSayPr2:SetText( retProp( ( TDataView():Articulos( nView ) )->cCodPrp2, TDataView():Propiedades( nView ) ) )
                     oSayPr2:Show()
                  end if

                  if oSayVp2 != nil
                     oSayVp2:Show()
                  end if

               else

                  if aGet[ _CVALPR2 ] != nil
                     aGet[ _CVALPR2 ]:Hide()
                  end if

                  if oSayPr2 != nil
                     oSayPr2:Hide()
                  end if

                  if oSayVp2 != nil
                     oSayVp2:Hide()
                  end if

               end if

               /*
               Precios de compra--------------------------------------------------
               */

               nPreCom           := nComPro( aTmp[ _CREF ], aTmp[ _CCODPR1 ], aTmp[ _CVALPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR2 ], TDataView():ArticuloPrecioPropiedades( nView ) )
               if nPrecom  != 0

                  aGet[ _NPREDIV ]:cText( nPreCom )

               else

                  if uFieldEmpresa( "lCosPrv", .f. )
                     nPreCom     := nPrecioReferenciaProveedor( cCodPrv, cCodArt, TDataView():ProveedorArticulo( nView ) )
                  end if

                  if nPreCom != 0
                     aGet[ _NPREDIV ]:cText( nPreCom )
                  else
                     aGet[ _NPREDIV ]:cText( nCosto( nil, TDataView():Articulos( nView ), TDataView():Kit( nView ), .f., aTmpPed[ _CDIVPED ], TDataView():Divisas( nView ) ) )
                  end if

                  /*
                  Descuento de articulo----------------------------------------------
                  */

                  if uFieldEmpresa( "lCosPrv", .f. )

                     nPreCom     := nDescuentoReferenciaProveedor( cCodPrv, cCodArt, TDataView():ProveedorArticulo( nView ) )
                     if nPreCom != 0
                        aGet[ _NDTOLIN ]:cText( nPreCom )
                     end if

                  /*
                  Descuento de promocional----------------------------------------------
                  */

                     nPreCom     := nPromocionReferenciaProveedor( cCodPrv, cCodArt, TDataView():ProveedorArticulo( nView ) )
                     if nPreCom != 0
                        aGet[ _NDTOPRM ]:cText( nPreCom )
                     end if

                  end if

               end if

            end if

            /*
            Recogemos las familias y los grupos de familias--------------------
            */

            cCodFam              := ( TDataView():Articulos( nView ) )->Familia
            if !Empty( cCodFam )
               aTmp[ _CCODFAM ]  := cCodFam
               aTmp[ _CGRPFAM ]  := cGruFam( cCodFam, TDataView():Familias( nView ) )
            end if

            /*
            Ponemos el precio de venta recomendado-----------------------------
            */

            aTmp[ _NPVPREC  ]    := ( TDataView():Articulos( nView ) )->PvpRec

            /*
            Ponemos el stock---------------------------------------------------
            */

            if oGetStk != nil .and. aTmp[ _NCTLSTK ] <= 1
               oStock:nPutStockActual( cCodArt, aTmp[ _CALMLIN ], , , , aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oGetStk )
            end if

            if !Empty( aGet[ _CUNIDAD ] )
                aGet[ _CUNIDAD ]:cText( ( TDataView():Articulos( nView ) )->cUnidad )
                aGet[ _CUNIDAD ]:lValid()
            else
                aTmp[ _CUNIDAD ]    := ( TDataView():Articulos( nView ) )->cUnidad
            end if

            ValidaMedicion( aTmp, aGet )

         end if

      else

         msgStop( "Art�culo no encontrado" )

         Return .f.

      end if

   end if

   cOldCodArt        := cCodArt
   cOldPrpArt        := cPrpArt

Return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION GetArtPrv( cRefPrv, cCodPrv, aGet )

	local nOrdAnt

   if Empty( cRefPrv )

      Return .t.

   else

      nOrdAnt  := ( TDataView():ProveedorArticulo( nView ) )->( ordSetFocus( "cRefPrv" ) )

      if ( TDataView():ProveedorArticulo( nView ) )->( dbSeek( cCodPrv + cRefPrv ) )

         aGet[ _CREF ]:cText( ( TDataView():ProveedorArticulo( nView ) )->cCodArt )
			aGet[ _CREF ]:lValid()

      else

         msgStop( "Referencia de proveedor no encontrada" )

      end if

		( TDataView():ProveedorArticulo( nView ) )->( ordSetFocus( nOrdAnt ) )

   end if

Return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION SaveDeta( aTmp, aGet, oBrwPrp, oGetIra, oFld, oDlg, oBrw, nMode, oTotal, oGet, aTmpPed, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetStk, oSayLote, oBtn )

   local n, i

   if !lMoreIva( aTmp[_NIVA] )
      Return nil
   end if

   if Empty( aTmp[ _CALMLIN ] ) .and. !Empty( aTmp[ _CREF ] )
      msgStop( "C�digo de almac�n no puede estar vac�o", "Atenci�n" )
      Return nil
   end if

   if !cAlmacen( aGet[ _CALMLIN ], TDataView():Almacen( nView ) )
      Return nil
   end if

   /*
   Escribir en fichero definitivo----------------------------------------------
   */

   if nMode == APPD_MODE

      if aTmp[ _LLOTE ]
         GraLotArt( aTmp[ _CREF ], TDataView():Articulos( nView ), aTmp[ _CLOTE ] )
      end if

      if !Empty( oBrwPrp:Cargo )

         for n := 1 to len( oBrwPrp:Cargo )

            for i := 1 to len( oBrwPrp:Cargo[ n ] )

               if oBrwPrp:Cargo[ n, i ]:Value != nil .and. oBrwPrp:Cargo[ n, i ]:Value != 0

                  aTmp[ _NUNICAJA]  := oBrwPrp:Cargo[ n, i ]:Value
                  aTmp[ _CCODPR1 ]  := oBrwPrp:Cargo[ n, i ]:cCodigoPropiedad1
                  aTmp[ _CVALPR1 ]  := oBrwPrp:Cargo[ n, i ]:cValorPropiedad1
                  aTmp[ _CCODPR2 ]  := oBrwPrp:Cargo[ n, i ]:cCodigoPropiedad2
                  aTmp[ _CVALPR2 ]  := oBrwPrp:Cargo[ n, i ]:cValorPropiedad2
                  aTmp[ _NPREDIV ]  := oBrwPrp:Cargo[ n, i ]:nPrecioCompra

                  WinGather( aTmp, aGet, dbfTmpLin, oBrw, nMode, nil, .f. )

               end if

            next

         next

         aCopy( dbBlankRec( dbfTmpLin ), aTmp )

         aEval( aGet, {| o, i | if( "GET" $ o:ClassName(), o:cText( aTmp[ i ] ), ) } )

      else

         WinGather( aTmp, aGet, dbfTmpLin, oBrw, nMode )

      end if

      if lEntCon()

         SetDlgMode( aGet, aTmp, aTmpPed, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oSayLote, oBrwPrp, oGetIra, oFld, oDlg, oTotal, oGetStk )

         nTotPedPrv( nil, TDataView():PedidosProveedores( nView ), dbfTmpLin, TDataView():TiposIva( nView ), TDataView():Divisas( nView ), aTmpPed )

      else

         oDlg:end( IDOK )

      end if

   else

      WinGather( aTmp, aGet, dbfTmpLin, oBrw, nMode )

      oDlg:end( IDOK )

   end if

   aTmp[ _MNUMSER ]                 := ""
   cOldCodArt                       := ""
   cOldUndMed                       := ""

   if !Empty( aGet[ _CUNIDAD ] )
      aGet[ _CUNIDAD ]:lValid()
   end if

   if !Empty( oBrwPrp )
      oBrwPrp:Cargo                 := nil
   end if

   if oGet != nil
      oGet:cText( Space( 14 ) )
      oGet:SetFocus()
   end if

   if oGetStk != nil
      oGetStk:cText( 0 )
   end if

Return nil

//--------------------------------------------------------------------------//

STATIC FUNCTION lMoreIva( nCodIva )

	/*
	Si no esta dentro de los porcentajes anteriores
	*/

	IF _NPCTIVA1 == NIL .OR. _NPCTIVA2 == NIL .OR. _NPCTIVA3 == NIL
		RETURN .T.
	END IF

	IF _NPCTIVA1 == nCodIva .OR. _NPCTIVA2 == nCodIva .OR. _NPCTIVA3 == nCodIva
		RETURN .T.
	END IF

   MsgStop( "Pedido con mas de 3 tipos de " + cImp(), "Imposible a�adir" )

Return .f.

//---------------------------------------------------------------------------//

STATIC FUNCTION PrnSerie( oBrw )

   local oDlg
   local oFmtDoc
   local cFmtDoc     := cFormatoDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) )
   local oSayFmt
   local cSayFmt
   local oSerIni
   local oSerFin   
   local cSerIni     := ( TDataView():PedidosProveedores( nView ) )->cSerPed
   local cSerFin     := ( TDataView():PedidosProveedores( nView ) )->cSerPed
   local nDocIni     := ( TDataView():PedidosProveedores( nView ) )->nNumPed
   local nDocFin     := ( TDataView():PedidosProveedores( nView ) )->nNumPed
   local cSufIni     := ( TDataView():PedidosProveedores( nView ) )->cSufPed
   local cSufFin     := ( TDataView():PedidosProveedores( nView ) )->cSufPed
   local oPrinter
   local cPrinter    := PrnGetName()
   local lCopiasPre  := .t.
   local lInvOrden   := .f.
   local oNumCop
   local nNumCop     := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )
   local oRango
   local nRango      := 1
   local dFecDesde   := CtoD( "01/01/" + Str( Year( Date() ) ) )
   local dFecHasta   := Date()

   if Empty( cFmtDoc )
      cFmtDoc        := cSelPrimerDoc( "PP" )
   end if

   cSayFmt           := cNombreDoc( cFmtDoc )

   DEFINE DIALOG oDlg RESOURCE "IMPSERIES" TITLE "Imprimir series de pedidos"

   REDEFINE RADIO oRango VAR nRango ;
      ID       201, 202 ;
      OF       oDlg

   REDEFINE GET oSerIni VAR cSerIni ;
      ID       100 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerIni ) );
      ON DOWN  ( DwSerie( oSerIni ) );
      VALID    ( cSerIni >= "A" .AND. cSerIni <= "Z"  );
      WHEN     ( nRango == 1 ); 
      OF       oDlg

   REDEFINE GET oSerFin VAR cSerFin ;
      ID       110 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerFin ) );
      ON DOWN  ( DwSerie( oSerFin ) );
      VALID    ( cSerFin >= "A" .AND. cSerFin <= "Z"  );
      WHEN     ( nRango == 1 ); 
      OF       oDlg

   REDEFINE GET nDocIni;
      ID       120 ;
	PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( nRango == 1 ); 
	OF 		oDlg

   REDEFINE GET nDocFin;
      ID       130 ;
	PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( nRango == 1 ); 
	OF 		oDlg

   REDEFINE GET cSufIni ;
      ID       140 ;
      PICTURE  "##" ;
      WHEN     ( nRango == 1 ); 
	OF 		oDlg

   REDEFINE GET cSufFin ;
      ID       150 ;
      PICTURE  "##" ;
      WHEN     ( nRango == 1 ); 
	OF 		oDlg

   REDEFINE GET dFecDesde ;
      ID       210 ;
      WHEN     ( nRango == 2 ) ;
      SPINNER ;
      OF       oDlg

   REDEFINE GET dFecHasta ;
      ID       220 ;
      WHEN     ( nRango == 2 ) ;
      SPINNER ;
      OF       oDlg   

   REDEFINE CHECKBOX lInvOrden ;
      ID       500 ;
      OF       oDlg

   REDEFINE CHECKBOX lCopiasPre ;
      ID       170 ;
      OF       oDlg

   REDEFINE GET oNumCop VAR nNumCop;
      ID       180 ;
      WHEN     !lCopiasPre ;
      VALID    nNumCop > 0 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      MIN      1 ;
      MAX      99999 ;
      OF       oDlg

   REDEFINE GET oFmtDoc VAR cFmtDoc ;
      ID       90 ;
      COLOR    CLR_GET ;
      VALID    ( cDocumento( oFmtDoc, oSayFmt, TDataView():Documentos( nView ) ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( BrwDocumento( oFmtDoc, oSayFmt, "PP" ) ) ;
      OF       oDlg

   REDEFINE GET oSayFmt VAR cSayFmt ;
      ID       91 ;
      WHEN     ( .f. );
      COLOR    CLR_GET ;
      OF       oDlg

   TBtnBmp():ReDefine( 92, "Printer_pencil_16",,,,,{|| EdtDocumento( cFmtDoc ) }, oDlg, .f., , .f.,  )

   REDEFINE GET oPrinter VAR cPrinter;
         WHEN     ( .f. ) ;
         ID       160 ;
         OF       oDlg

   TBtnBmp():ReDefine( 161, "Printer_preferences_16",,,,,{|| PrinterPreferences( oPrinter ) }, oDlg, .f., , .f.,  )

   REDEFINE BUTTON ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   (  StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden, nRango, dFecDesde, dFecHasta ),;
                  oDlg:end( IDOK ) )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
		OF 		oDlg ;
		ACTION 	( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden, nRango, dFecDesde, dFecHasta ), oDlg:end( IDOK ) } )

   oDlg:bStart := { || oSerIni:SetFocus() }

   ACTIVATE DIALOG oDlg CENTER

   oBrw:refresh()

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION StartPrint( cFmtDoc, cDocIni, cDocFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden, nRango, dFecDesde, dFecHasta )

   local nCopyProvee
   local nRecno
   local nOrdAnt

   oDlg:disable()

   if nRango == 1

      nRecno            := ( TDataView():PedidosProveedores( nView ) )->( Recno() )
      nOrdAnt           := ( TDataView():PedidosProveedores( nView ) )->( OrdSetFocus( "NNUMPED" ) )

      if !lInvOrden

            ( TDataView():PedidosProveedores( nView ) )->( dbSeek( cDocIni, .t. ) )

            while ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed >= cDocIni .AND. ;
                  ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed <= cDocFin

                  lChgImpDoc( TDataView():PedidosProveedores( nView ) )

            if lCopiasPre

                  nCopyProvee := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )

                  GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nCopyProvee )

            else

                  GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nNumCop )

            end if

            ( TDataView():PedidosProveedores( nView ) )->( dbSkip() )

            end while

      else

      ( TDataView():PedidosProveedores( nView ) )->( dbSeek( cDocFin ) )

         while ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed >= cDocIni .and.;
               ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed <= cDocFin .and.;
               !( TDataView():PedidosProveedores( nView ) )->( Bof() )

               lChgImpDoc( TDataView():PedidosProveedores( nView ) )

         if lCopiasPre

               nCopyProvee := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )

               GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nCopyProvee )

         else

               GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nNumCop )

         end if

         ( TDataView():PedidosProveedores( nView ) )->( dbSkip( -1 ) )

         end while

      end if

   else

      nRecno            := ( TDataView():PedidosProveedores( nView ) )->( Recno() )
      nOrdAnt           := ( TDataView():PedidosProveedores( nView ) )->( OrdSetFocus( "DFECPED" ) )

      if !lInvOrden

            ( TDataView():PedidosProveedores( nView ) )->( dbGoTop() )

            while !( TDataView():PedidosProveedores( nView ) )->( Eof() )

               if ( TDataView():PedidosProveedores( nView ) )->dFecPed >= dFecDesde .and. ( TDataView():PedidosProveedores( nView ) )->dFecPed <= dFecHasta

                  lChgImpDoc( TDataView():PedidosProveedores( nView ) )

                  if lCopiasPre

                        nCopyProvee := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )

                        GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nCopyProvee )

                  else

                        GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nNumCop )

                  end if

               end if   

            ( TDataView():PedidosProveedores( nView ) )->( dbSkip() )

            end while

      else

         ( TDataView():PedidosProveedores( nView ) )->( dbGoBottom() )

         while !( TDataView():PedidosProveedores( nView ) )->( Bof() )

            if ( TDataView():PedidosProveedores( nView ) )->dFecPed >= dFecDesde .and. ( TDataView():PedidosProveedores( nView ) )->dFecPed <= dFecHasta

               lChgImpDoc( TDataView():PedidosProveedores( nView ) )

               if lCopiasPre

                  nCopyProvee := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )

                  GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nCopyProvee )

               else

                  GenPedPrv( IS_PRINTER, "Imprimiendo documento : " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + (TDataView():PedidosProveedores( nView ))->cSufPed, cFmtDoc, cPrinter, nNumCop )

               end if

            end if   

         ( TDataView():PedidosProveedores( nView ) )->( dbSkip( -1 ) )

         end while

      end if
   
   end if   

   ( TDataView():PedidosProveedores( nView ) )->( ordSetFocus( nOrdAnt ) )
   ( TDataView():PedidosProveedores( nView ) )->( dbGoTo( nRecNo ) )

   oDlg:enable()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION GenPedPrv( nDevice, cCaption, cCodDoc, cPrinter, nCopies )

   local oInf
   local oDevice
   local nPedido

   if ( TDataView():PedidosProveedores( nView ) )->( Lastrec() ) == 0
      return nil
   end if

   nPedido              := ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed

   DEFAULT nDevice      := IS_PRINTER
   DEFAULT cCaption     := "Imprimiendo pedido"
   DEFAULT cCodDoc      := cFormatoDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) )
   DEFAULT nCopies      := if( nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) == 0, Max( Retfld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "nCopiasF" ), 1 ), nCopiasDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) ) )

   if Empty( cCodDoc )
      cCodDoc           := cFirstDoc( "PP", TDataView():Documentos( nView ) )
   end if

   if !lExisteDocumento( cCodDoc, TDataView():Documentos( nView ) )
      return nil
   end if

   /*
   Si el documento es de tipo visual-------------------------------------------
   */

   if lVisualDocumento( cCodDoc, TDataView():Documentos( nView ) )

      PrintReportPedPrv( nDevice, nCopies, cPrinter, TDataView():Documentos( nView ) )

   else

      /*
      Posicionamos en las areas
      */

      ( TDataView():PedidosProveedoresLineas( nView ))->( dbSeek( nPedido ) )
      ( TDataView():Proveedores( nView )    )->( dbSeek( ( TDataView():PedidosProveedores( nView ) )->cCodPrv ) )
      ( TDataView():Divisas( nView )    )->( dbSeek( ( TDataView():PedidosProveedores( nView ) )->cDivPed ) )
      ( TDataView():FormasPago( nView )  )->( dbSeek( ( TDataView():PedidosProveedores( nView ) )->cCodPgo ) )
      ( TDataView():Almacen( nView )    )->( dbSeek( ( TDataView():PedidosProveedores( nView ) )->cCodAlm ) )
      ( TDataView():Usuarios( nView )    )->( dbSeek( ( TDataView():PedidosProveedores( nView ) )->cCodUsr ) )

      private cDbf         := TDataView():PedidosProveedores( nView )
      private cDbfCol      := TDataView():PedidosProveedoresLineas( nView )
      private cDbfPrv      := TDataView():Proveedores( nView )
      private cDbfPgo      := TDataView():FormasPago( nView )
      private cDbfIva      := TDataView():TiposIva( nView )
      private cDbfAlm      := TDataView():Almacen( nView )
      private cDbfDiv      := TDataView():Divisas( nView )
      private cDbfArt      := TDataView():Articulos( nView )
      private cDbfKit      := TDataView():Kit( nView )
      private cDbfUsr      := TDataView():Usuarios( nView )
      private cDbfPro      := TDataView():Propiedades( nView )
      private cDbfTblPro   := TDataView():PropiedadesLineas( nView )
      private cPicUndPed   := cPicUnd
      private cPinDivPed   := cPinDiv
      private cPirDivPed   := cPirDiv
      private nDinDivPed   := nDinDiv
      private nDirDivPed   := nDirDiv
      private nVdvDivPed   := ( TDataView():PedidosProveedores( nView ) )->nVdvPed

      /*
      Creamos el informe con la impresora seleccionada para ese informe-----------
      */

      if !Empty( cPrinter )
         oDevice           := TPrinter():New( cCaption, .f., .t., cPrinter )
         REPORT oInf CAPTION cCaption TO DEVICE oDevice
      else
         REPORT oInf CAPTION cCaption PREVIEW
      end if

      if !Empty( oInf ) .and. oInf:lCreated
         oInf:lAutoland    := .f.
         oInf:lFinish      := .f.
         oInf:lNoCancel    := .t.
         oInf:bSkip        := {|| ( TDataView():PedidosProveedoresLineas( nView ) )->( dbSkip() ) }

         oInf:oDevice:lPrvModal  := .t.

         do case
            case nDevice == IS_PRINTER
               oInf:bPreview  := {| oDevice | PrintPreview( oDevice ) }

            case nDevice == IS_PDF
               oInf:bPreview  := {| oDevice | PrintPdf( oDevice ) }

         end case

         SetMargin(  cCodDoc, oInf )
         PrintColum( cCodDoc, oInf )
      end if

      END REPORT

      if !Empty( oInf )

         ACTIVATE REPORT oInf ;
            WHILE       ( ( TDataView():PedidosProveedoresLineas( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedoresLineas( nView ) )->nNumPed ) + ( TDataView():PedidosProveedoresLineas( nView ) )->cSufPed == nPedido .and. !( TDataView():PedidosProveedoresLineas( nView ) )->( eof() ) );
            FOR         ( !( TDataView():PedidosProveedoresLineas( nView ) )->lImpLin ) ;
            ON ENDPAGE  ePage( oInf, cCodDoc )

         if nDevice == IS_PRINTER
            oInf:oDevice:end()
         end if

      end if

      oInf                 := nil

      /*
      Marca de documento impreso-----------------------------------------------
      */

   end if

   lChgImpDoc( TDataView():PedidosProveedores( nView ) )

RETURN NIL

//---------------------------------------------------------------------------//

STATIC FUNCTION EPage( oInf, cCodDoc )

   private nPagina      := oInf:nPage
	private lEnd			:= oInf:lFinish

   PrintItems( cCodDoc, oInf )

RETURN NIL

//--------------------------------------------------------------------------//

Static Function RecalculaTotal( aTmp )

   nTotPedPrv( nil, TDataView():PedidosProveedores( nView ), dbfTmpLin, TDataView():TiposIva( nView ), TDataView():Divisas( nView ), aTmp )

   oBrwIva:Refresh()

   oGetNet:SetText( Trans( nTotNet, cPirDiv ) )

   oGetIva:SetText( Trans( nTotIva, cPirDiv ) )

   oGetReq:SetText( Trans( nTotReq, cPirDiv ) )

   oGetTotal:SetText( Trans( nTotPed, cPirDiv ) )

Return .t.

//--------------------------------------------------------------------------//

/*
Carga los datos del proveedor
*/

STATIC FUNCTION LoaPrv( aGet, aTmp, dbf, nMode, oSay, oTlfPrv )

   local lValid      := .f.
   local cNewCodCli  := aGet[ _CCODPRV ]:VarGet()
   local lChgCodCli  := ( Empty( cOldCodCli ) .or. cOldCodCli != cNewCodCli )

   if Empty( cNewCodCli )
      Return .t.
   elseif At( ".", cNewCodCli ) != 0
      cNewCodCli     := PntReplace( aGet[ _CCODPRV ], "0", RetNumCodPrvEmp() )
   else
      cNewCodCli     := Rjust( cNewCodCli, "0", RetNumCodPrvEmp() )
   end if

   if ( TDataView():Proveedores( nView ) )->( dbSeek( cNewCodCli ) )

      if ( TDataView():Proveedores( nView ) )->lBlqPrv
         msgStop( "Proveedor bloqueado, no se pueden realizar operaciones de compra" )
         return .f.
      end if

      aGet[ _CCODPRV ]:cText( ( TDataView():Proveedores( nView ) )->Cod )

      if Empty( aGet[ _CNOMPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CNOMPRV ]:cText( ( TDataView():Proveedores( nView ) )->Titulo )
      end if

      if oTlfPrv != nil
         oTlfPrv:SetText( ( TDataView():Proveedores( nView ) )->Telefono )
      end if

      if Empty( aGet[ _CDIRPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CDIRPRV ]:cText( ( TDataView():Proveedores( nView ) )->Domicilio )
      endif

      if Empty( aGet[ _CPOBPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CPOBPRV ]:cText( ( TDataView():Proveedores( nView ) )->Poblacion )
      endif

      if Empty( aGet[ _CPROPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CPROPRV ]:cText( ( TDataView():Proveedores( nView ) )->Provincia )
      endif

      if Empty( aGet[ _CPOSPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CPOSPRV ]:cText( ( TDataView():Proveedores( nView ) )->CodPostal )
      endif

      if Empty( aGet[ _CDNIPRV ]:varGet() ) .or. lChgCodCli
         aGet[ _CDNIPRV ]:cText( ( TDataView():Proveedores( nView ) )->Nif )
      endif

      /*
      Descuentos
      */

      if lChgCodCli
         aGet[ _CDTOESP ]:cText( ( TDataView():Proveedores( nView ) )->cDtoEsp )
         aGet[ _NDTOESP ]:cText( ( TDataView():Proveedores( nView ) )->nDtoEsp )
         aGet[ _CDPP    ]:cText( ( TDataView():Proveedores( nView ) )->cDtoPp  )
         aGet[ _NDPP    ]:cText( ( TDataView():Proveedores( nView ) )->DtoPp   )
      end if

      if Empty( aGet[_CCODPGO]:VarGet() )
         aGet[ _CCODPGO ]:cText( ( TDataView():Proveedores( nView ) )->fPago )
         aGet[ _CCODPGO ]:lValid()
      end if

      /*
      Fecha de entrada
      */

      if lChgCodCli
         if ( TDataView():Proveedores( nView ) )->nPlzEnt != 0
            aGet[ _DFECENT ]:cText( GetSysDate() + ( TDataView():Proveedores( nView ) )->nPlzEnt )
         else
            aGet[ _DFECENT ]:cText( Ctod( "" ) )
         end if
      end if

      if nMode == APPD_MODE

         aGet[ _NREGIVA ]:nOption( Max( ( TDataView():Proveedores( nView ) )->nRegIva, 1 ) )
         aGet[ _NREGIVA ]:Refresh()

         if Empty( aTmp[ _CSERPED ] )

            if !Empty( ( TDataView():Proveedores( nView ) )->Serie )
               aGet[ _CSERPED ]:cText( ( TDataView():Proveedores( nView ) )->Serie )
            end if

         else

            if !Empty( ( TDataView():Proveedores( nView ) )->Serie ) .and. aTmp[ _CSERPED ] != ( TDataView():Proveedores( nView ) )->Serie .and. ApoloMsgNoYes( "La serie del proveedor seleccionado es distinta a la anterior.", "�Desea cambiar la serie?" )
               aGet[ _CSERPED ]:cText( ( TDataView():Proveedores( nView ) )->Serie )
            end if

         end if

      end if

      if lChgCodCli
         aTmp[ _LRECARGO ] := ( TDataView():Proveedores( nView ) )->lReq
         aGet[ _LRECARGO ]:Refresh()
      end if

      if ( TDataView():Proveedores( nView ) )->lMosCom .and. !Empty( ( TDataView():Proveedores( nView ) )->mComent ) .and. lChgCodCli
         MsgStop( AllTrim( ( TDataView():Proveedores( nView ) )->mComent ) )
      end if

      cOldCodCli     := ( TDataView():Proveedores( nView ) )->Cod

      lValid         := .t.

   else

		msgStop( "Proveedor no encontrado" )

   end if

RETURN lValid

//--------------------------------------------------------------------------//

/*
Calcula totales en las lineas de Detalle
*/

STATIC FUNCTION lCalcDeta( aTmp, oTotal )

   local nCalculo := nTotUPedPrv( aTmp, nDinDiv )

   IF lCalCaj()
      nCalculo    *= If( aTmp[ _NCANPED ] != 0, aTmp[ _NCANPED ], 1 )
	END IF

	IF aTmp[ _NDTOLIN ] != 0
      nCalculo    -= nCalculo * aTmp[ _NDTOLIN ] / 100
	END IF

   IF aTmp[ _NDTOPRM ] != 0
		nCalculo 	-= nCalculo * aTmp[ _NDTOPRM ] / 100
	END IF

   nCalculo       *= nTotNPedPrv( aTmp )

   nCalculo       := Round( nCalculo, nDinDiv )

	oTotal:cText( nCalculo )

RETURN .T.

//---------------------------------------------------------------------------//

STATIC FUNCTION BeginTrans( aTmp, nMode )

   local lErrors     := .f.
   local cDbf        := "PProL"
   local cDbfInc     := "PProI"
   local cDbfDoc     := "PProD"
   local nPedido     := aTmp[ _CSERPED ] +  Str( aTmp[ _NNUMPED ] ) + aTmp[ _CSUFPED ]
   local oError
   local oBlock      := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

      cNewFile       := cGetNewFileName( cPatTmp() + cDbf )
      cTmpInc        := cGetNewFileName( cPatTmp() + cDbfInc )
      cTmpDoc        := cGetNewFileName( cPatTmp() + cDbfDoc )

      /*
      Primero Crear la base de datos local----------------------------------------
      */

      dbCreate( cNewFile, aSqlStruct( aColPedPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFile, cCheckArea( cDbf, @dbfTmpLin ), .f. )

      if !( dbfTmpLin )->( neterr() )

         ( dbfTmpLin )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpLin )->( OrdCreate( cNewFile, "nNumLin", "Str( nNumLin, 4 )", {|| Str( Field->nNumLin, 4 ) } ) )

         ( dbfTmpLin )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpLin )->( OrdCreate( cNewFile, "cRef", "cRef", {|| Field->cRef } ) )

         ( dbfTmpLin )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpLin )->( OrdCreate( cNewFile, "cDetalle", "Left( cDetalle, 100 )", {|| Left( Field->cDetalle, 100 ) } ) )

         ( dbfTmpLin )->( OrdCondSet( "!Deleted()", {|| !Deleted() } ) )
         ( dbfTmpLin )->( OrdCreate( cNewFile, "nUniCaja", "nUniCaja", {|| Field->nUniCaja } ) )

         ( dbfTmpLin )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpLin )->( OrdCreate( cNewFile, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )

      end if

      /*
      Creamos el fichero de incidencias-------------------------------------------
      */

      dbCreate( cTmpInc, aSqlStruct( aIncPedPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpInc, cCheckArea( cDbfInc, @dbfTmpInc ), .f. )

      if !( dbfTmpInc )->( neterr() )
         ( dbfTmpInc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpInc )->( ordCreate( cTmpInc, "Recno", "Recno()", {|| Recno() } ) )
      end if

      /*
      Creamos el fichero de Documentos--------------------------------------------
      */

      dbCreate( cTmpDoc, aSqlStruct( aPedPrvDoc() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpDoc, cCheckArea( cDbfDoc, @dbfTmpDoc ), .f. )
      if !( dbfTmpDoc )->( neterr() )
         ( dbfTmpDoc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpDoc )->( ordCreate( cTmpDoc, "Recno", "Recno()", {|| Recno() } ) )
      end if

      /*
      A�adimos desde el fichero de lineas-----------------------------------------
      */

      if ( TDataView():PedidosProveedoresLineas( nView ) )->( dbSeek( nPedido ) )

         while ( ( TDataView():PedidosProveedoresLineas( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedoresLineas( nView ) )->nNumPed ) + ( TDataView():PedidosProveedoresLineas( nView ) )->cSufPed == nPedido .and. ( TDataView():PedidosProveedoresLineas( nView ) )->( !eof() ) )

            dbPass( TDataView():PedidosProveedoresLineas( nView ), dbfTmpLin, .t. )

            ( TDataView():PedidosProveedoresLineas( nView ) )->( dbSkip() )

         end while

      end if

      ( dbfTmpLin )->( dbGoTop() )

      /*
      A�adimos desde el fichero de incidencias------------------------------------
      */

      if ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSeek( nPedido ) )

         while ( ( TDataView():PedidosProveedoresIncidencias( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedoresIncidencias( nView ) )->nNumPed ) + ( TDataView():PedidosProveedoresIncidencias( nView ) )->cSufPed == nPedido ) .AND. ( TDataView():PedidosProveedoresIncidencias( nView ) )->( !eof() )

            dbPass( TDataView():PedidosProveedoresIncidencias( nView ), dbfTmpInc, .t. )
            ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSkip() )

         end while

      end if

      ( dbfTmpInc )->( dbGoTop() )

      /*
      A�adimos desde el fichero de Documentos-------------------------------------
      */

      if ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbSeek( nPedido ) )

         while ( ( TDataView():PedidosProveedoresDocumentos( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedoresDocumentos( nView ) )->nNumPed ) + ( TDataView():PedidosProveedoresDocumentos( nView ) )->cSufPed == nPedido ) .AND. ( TDataView():PedidosProveedoresDocumentos( nView ) )->( !eof() )

            dbPass( TDataView():PedidosProveedoresDocumentos( nView ), dbfTmpDoc, .t. )
            ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbSkip() )

         end while

      end if

      ( dbfTmpDoc )->( dbGoTop() )


   RECOVER USING oError

      msgStop( "Imposible crear tablas temporales." + CRLF + ErrorMessage( oError ) )

      KillTrans()

      lErrors     := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lErrors )

//---------------------------------------------------------------------------//

STATIC FUNCTION EndTrans( aGet, aTmp, oBrw, nMode, oDlg )

   local oError
   local oBlock
   local aTabla
   local cSerie
   local nPedido
   local cSufPed
   local nNumLin
   local cNumPedCli

   if Empty( aTmp[ _CSERPED ] )
      aTmp[ _CSERPED ]  := "A"
   end if

   nNumLin              := 1
   cSerie               := aTmp[ _CSERPED ]
   nPedido              := aTmp[ _NNUMPED ]
   cSufPed              := aTmp[ _CSUFPED ]
   cNumPedCli           := aTmp[ _CNUMPEDCLI ]

   /*
   Comprobamos la fecha del documento
   */

   if !lValidaOperacion( aTmp[ _DFECPED ] )
      Return .f.
   end if

   /*
   Estos campos no pueden estar vacios
   */

   if Empty( aTmp[ _CCODPRV ] )
      msgStop( "Proveedor no puede estar vac�o." )
      aGet[ _CCODPRV ]:SetFocus()
      return .f.
   end if

   if Empty( aTmp[ _CCODALM ] )
      msgStop( "Almacen no puede estar vac�o." )
      aGet[ _CCODALM ]:SetFocus()
      return .f.
   end if

   if Empty( aTmp[ _CCODCAJ ] )
      msgStop( "Caja no puede estar vac�a." )
      aGet[ _CCODCAJ ]:SetFocus()
      return .f.
   end if

   if ( dbfTmpLin )->( eof() )
      MsgStop( "No puede almacenar un documento sin l�neas." )
      return .f.
   end if

   oDlg:Disable()

   oMsgText( "Archivando" )

   aTmp[ _DFECCHG ]     := GetSysDate()
   aTmp[ _CTIMCHG ]     := Time()

   do case
   case nMode == APPD_MODE .or. nMode == DUPL_MODE

      nPedido           := nNewDoc( cSerie, TDataView():PedidosProveedores( nView ), "NPEDPRV", , TDataView():Contadores( nView ) )
      aTmp[ _NNUMPED ]  := nPedido

   case nMode == EDIT_MODE

      if nPedido != 0

         while ( TDataView():PedidosProveedoresLineas( nView ) )->( dbSeek( cSerie + str( nPedido ) + cSufPed ) )
            if dbLock( TDataView():PedidosProveedoresLineas( nView ) )
               ( TDataView():PedidosProveedoresLineas( nView ) )->( dbDelete() )
               ( TDataView():PedidosProveedoresLineas( nView ) )->( dbUnLock() )
            end if
         end while

         while ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSeek( cSerie + str( nPedido ) + cSufPed ) )
            if dbLock( TDataView():PedidosProveedoresIncidencias( nView ) )
               ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbDelete() )
               ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbUnLock() )
            end if
         end while

         while ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbSeek( cSerie + str( nPedido ) + cSufPed ) )
            if dbLock( TDataView():PedidosProveedoresDocumentos( nView ) )
               ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbDelete() )
               ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbUnLock() )
            end if
         end while

      end if

   end case

   /*
   Guardamos los totales-------------------------------------------------------
   */

   aTmp[ _NTOTNET ]     := nTotNet
   aTmp[ _NTOTIVA ]     := nTotIva
   aTmp[ _NTOTREQ ]     := nTotReq
   aTmp[ _NTOTPED ]     := nTotPed

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   BeginTransaction()

   /*
   Quitamos los filtros--------------------------------------------------------
   */

   ( dbfTmpLin )->( dbClearFilter() )

   oMsgProgress()
   oMsgProgress():SetRange( 0, ( dbfTmpLin )->( LastRec() ) )

   /*
   Ahora escribimos en el fichero definitivo-----------------------------------
   */

   /*( dbfTmpLin )->( dbGoTop() )
   while !( dbfTmpLin )->( eof() )
      dbPass( dbfTmpLin, TDataView():PedidosProveedoresLineas( nView ), .t., cSerie, nPedido, cSufPed )
      ( dbfTmpLin )->( dbSkip() )
      oMsgProgress():Deltapos(1)
   end while*/

   ( dbfTmpLin )->( dbGoTop() )
   while !( dbfTmpLin )->( eof() )

      if !( ( dbfTmpLin )->nUniCaja == 0 .and. ( dbfTmpLin )->lFromImp )

         dbPass( dbfTmpLin, TDataView():PedidosProveedoresLineas( nView ), .t., cSerie, nPedido, cSufPed )

      end if   

      ( dbfTmpLin )->( dbSkip() )

      oMsgProgress():Deltapos(1)

   end while

   /*
   Ahora escribimos en el fichero definitivo de incidencias
	*/

   ( dbfTmpInc )->( dbGoTop() )
   while ( dbfTmpInc )->( !eof() )
      dbPass( dbfTmpInc, TDataView():PedidosProveedoresIncidencias( nView ), .t., cSerie, nPedido, cSufPed )
      ( dbfTmpInc )->( dbSkip() )
   end while

   /*
   Ahora escribimos en el fichero definitivo de documentos
	*/

   ( dbfTmpDoc )->( dbGoTop() )
   while ( dbfTmpDoc )->( !eof() )
      dbPass( dbfTmpDoc, TDataView():PedidosProveedoresDocumentos( nView ), .t., cSerie, nPedido, cSufPed )
      ( dbfTmpDoc )->( dbSkip() )
   end while

   /*
   Salvamos el registro del pedido
   */

   WinGather( aTmp, , TDataView():PedidosProveedores( nView ), oBrw, nMode )

   /*
   Ponemos el pedido en su estado
   */

   oStock:SetPedPrv( cSerie + str( nPedido ) + cSufPed )

   dbCommitAll()

   CommitTransaction()

   RECOVER USING oError

      RollBackTransaction()
      msgStop( "Imposible almacenar pedido" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE
   ErrorBlock( oBlock )

   oMsgText()
   EndProgress()

   oDlg:Enable()
   oDlg:End( IDOK )

Return .t.

//---------------------------------------------------------------------------//

STATIC FUNCTION KillTrans( oBrwLin )

	/*
   Borramos los ficheros-------------------------------------------------------
	*/

   if !Empty( dbfTmpLin ) .and. ( dbfTmpLin )->( Used() )
      ( dbfTmpLin )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpInc ) .and. ( dbfTmpInc )->( Used() )
      ( dbfTmpInc )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpDoc ) .and. ( dbfTmpDoc )->( Used() )
      ( dbfTmpDoc )->( dbCloseArea() )
   end if


   dbfErase( cNewFile )
   dbfErase( cTmpInc )
   dbfErase( cTmpDoc )

   /*
   Guardamos los posibles cambios en el browse---------------------------------
   */

   if oBrwLin != nil
      oBrwLin:CloseData()
   end if


RETURN .T.

//---------------------------------------------------------------------------//

STATIC FUNCTION CreateFiles( cPath )

   if !lExistTable( cPath + "PedProvT.DBF" )
      dbCreate( cPath + "PedProvT.DBF", aSqlStruct( aItmPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedProvL.DBF" )
      dbCreate( cPath + "PedProvL.DBF", aSqlStruct( aColPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedPrvI.Dbf" )
      dbCreate( cPath + "PedPrvI.Dbf", aSqlStruct( aIncPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedPrvD.Dbf" )
      dbCreate( cPath + "PedPrvD.Dbf", aSqlStruct( aPedPrvDoc() ), cDriver() )
   end if

RETURN NIL

//--------------------------------------------------------------------------//
/*
Cambia el estado de un pedido
*/

STATIC FUNCTION ChgState( oBrw )

   local nRec
   local nRecAlb
   local nOrdAlb
   local cNumPed
   local lQuit

   CursorWait()
   SysRefresh()

   if ApoloMsgNoYes( "Al cambiar el estado perder� la referencia a cualquier documento que est� asociado.", "�Desea cambiarlo?" )

      /*
      Cambia el estado del pedido----------------------------------------------
      */

      /*if dbLock( TDataView():PedidosProveedores( nView ) )

         if ( TDataView():PedidosProveedores( nView ) )->nEstado == 1
            ( TDataView():PedidosProveedores( nView ) )->nEstado := 3
         else
            ( TDataView():PedidosProveedores( nView ) )->nEstado := 1
         end if

         ( TDataView():PedidosProveedores( nView ) )->( dbUnlock() )

      end if*/

      for each nRec in ( oBrw:aSelected )

         ( TDataView():PedidosProveedores( nView ) )->( dbGoTo( nRec ) )

         lQuit                         := .f.

         cNumPed                       := ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView )  )->cSufPed

         /*
         Cambiamos el estado---------------------------------------------------
         */

         if dbLock( TDataView():PedidosProveedores( nView ) )

            if ( TDataView():PedidosProveedores( nView ) )->nEstado == 1
               ( TDataView():PedidosProveedores( nView ) )->nEstado := 3
            else
               lQuit                   := .t.
               ( TDataView():PedidosProveedores( nView ) )->nEstado := 1
               ( TDataView():PedidosProveedores( nView ) )->cNumAlb := ""
            end if

            ( TDataView():PedidosProveedores( nView ) )->( dbRUnlock() )

         end if

         if lQuit

            /*
            Borramos la referencia a cualquier cabecera de albar�n asociado-------
            */

            nRecAlb  := ( TDataView():AlbaranesProveedores( nView ) )->( RecNo() )
            nOrdAlb  := ( TDataView():AlbaranesProveedores( nView ) )->( OrdSetFocus( "CNUMPED" ) )


            if ( TDataView():AlbaranesProveedores( nView ) )->( dbSeek( cNumPed ) )

               while ( TDataView():AlbaranesProveedores( nView ) )->cNumPed == cNumPed  .and. !( TDataView():AlbaranesProveedores( nView ) )->( Eof() )

                  if dbLock( TDataView():AlbaranesProveedores( nView ) )
                     ( TDataView():AlbaranesProveedores( nView ) )->cNumPed    := ""
                     ( TDataView():AlbaranesProveedores( nView ) )->( dbUnLock() )
                  end if

                  ( TDataView():AlbaranesProveedores( nView ) )->( dbSkip() )

               end if

            end if

            ( TDataView():AlbaranesProveedores( nView ) )->( OrdSetFocus( nOrdAlb ) )
            ( TDataView():AlbaranesProveedores( nView ) )->( dbGoTo( nRecAlb ) )

            /*
            Borramos la referencia a cualquier linea de albar�n asociado-------
            */

            nRecAlb  := ( TDataView():AlbaranesProveedoresLineas( nView ) )->( RecNo() )
            nOrdAlb  := ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdSetFocus( "cCodPed" ) )

            if ( TDataView():AlbaranesProveedoresLineas( nView ) )->( dbSeek( cNumPed ) )

               while ( TDataView():AlbaranesProveedoresLineas( nView ) )->cCodPed == cNumPed  .and. !( TDataView():AlbaranesProveedoresLineas( nView ) )->( Eof() )

                  if dbLock( TDataView():AlbaranesProveedoresLineas( nView ) )
                     ( TDataView():AlbaranesProveedoresLineas( nView ) )->cCodPed    := ""
                     ( TDataView():AlbaranesProveedoresLineas( nView ) )->( dbUnLock() )
                  end if

                  ( TDataView():AlbaranesProveedoresLineas( nView ) )->( dbSkip() )

               end if

            end if

            ( TDataView():AlbaranesProveedoresLineas( nView ) )->( OrdSetFocus( nOrdAlb ) )
            ( TDataView():AlbaranesProveedoresLineas( nView ) )->( dbGoTo( nRecAlb ) )

         end if

      next

    end if

    oBrw:Refresh()
    oBrw:SetFocus()

   CursorArrow()
   SysRefresh()

RETURN NIL

//-------------------------------------------------------------------------//

Static Function lNotOpen()

   if NetErr()
      msgStop( "Imposible abrir ficheros." )
      CloseFiles()
      return .t.
   end if

return .f.

//---------------------------------------------------------------------------//

static function lGenPed( oBrw, oBtn, nDevice )

   local bAction

   DEFAULT nDevice   := IS_PRINTER

   if Empty( oBtn )
      return nil
   end if

   if !( TDataView():Documentos( nView ) )->( dbSeek( "PP" ) )

      DEFINE BTNSHELL RESOURCE "DOCUMENT" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( msgStop( "No hay pedidos de proveedores predefinidos" ) );
         TOOLTIP  "No hay documentos" ;
         HOTKEY   "N";
         FROM     oBtn ;
         CLOSED ;
         LEVEL    ACC_EDIT

   else

      while ( TDataView():Documentos( nView ) )->cTipo == "PP" .and. !( TDataView():Documentos( nView ) )->( eof() )

         bAction  := bGenPed( nDevice, "Imprimiendo pedidos de proveedores", ( TDataView():Documentos( nView ) )->CODIGO )

         oWndBrw:NewAt( "Document", , , bAction, Rtrim( ( TDataView():Documentos( nView ) )->cDescrip ) , , , , , oBtn )

         ( TDataView():Documentos( nView ) )->( dbSkip() )

      end do

   end if

   SysRefresh()

return nil

//---------------------------------------------------------------------------//

static function bGenPed( nDevice, cTitle, cCodDoc )

   local bGen
   local nDev  := by( nDevice )
   local cTit  := by( cTitle    )
   local cCod  := by( cCodDoc   )

   if nDev == IS_PRINTER
      bGen     := {|| GenPedPrv( nDevice, cTit, cCod ) }
   else
      bGen     := {|| GenPedPrv( nDevice, cTit, cCod ) }
   end if

return bGen

//---------------------------------------------------------------------------//

STATIC FUNCTION QuiPedPrv( lDetail )

   local cPedido

   DEFAULT lDetail   := .t.

   if ( TDataView():PedidosProveedores( nView ) )->lCloPed .and. !oUser():lAdministrador()
      msgStop( "Solo puede eliminar los pedidos cerrados los administradores." )
      Return .f.
   end if

   CursorWait()

   cPedido           := ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed

   if lDetail
      DelDetalle( cPedido )
   end if

   /*
   Actualizamos el estado del campo generado-----------------------------------
   */

   if !Empty( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli )
      oStock:SetGeneradoPedCli( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli )
   end if

   CursorWe()

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function DelDetalle( cPedido )

   local nOrdAnt

   DEFAULT cPedido  := ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed

   CursorWait()

   nOrdAnt           := ( TDataView():PedidosProveedoresLineas( nView ) )->( OrdSetFocus( "nNumPed" ) )

   while ( TDataView():PedidosProveedoresLineas( nView ) )->( dbSeek( cPedido ) ) .and. !( TDataView():PedidosProveedoresLineas( nView ) )->( eof() )
      if dbDialogLock( TDataView():PedidosProveedoresLineas( nView ) )
         ( TDataView():PedidosProveedoresLineas( nView ) )->( dbDelete() )
         ( TDataView():PedidosProveedoresLineas( nView ) )->( dbUnLock() )
      end if
   end do

   ( TDataView():PedidosProveedoresLineas( nView ) )->( OrdSetFocus( nOrdAnt ) )

   while ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSeek( cPedido ) .and. !( TDataView():PedidosProveedoresIncidencias( nView ) )->( eof() ) )
      if dbLock( TDataView():PedidosProveedoresIncidencias( nView ) )
         ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbDelete() )
         ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbUnLock() )
      end if
   end while

   while ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbSeek( cPedido ) .and. !( TDataView():PedidosProveedoresDocumentos( nView ) )->( eof() ) )
      if dbLock( TDataView():PedidosProveedoresDocumentos( nView ) )
         ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbDelete() )
         ( TDataView():PedidosProveedoresDocumentos( nView ) )->( dbUnLock() )
      end if
   end while

   CursorWe()

RETURN NIL

//---------------------------------------------------------------------------//

Static Function mSer2Mem( aNumSer, nTotUnd )

   local n
   local mNumSer     := ""

   for n := 1 to nTotUnd
      mNumSer        += AllTrim( aNumSer[ n ] ) + ","
   next

Return ( mNumSer )

//---------------------------------------------------------------------------//

static function CambiaAnulado( aGet, aTmp )

   if aTmp[_LANULADO]

      aGet[_DANULADO]:cText( GetSysDate() )
      aTmp[_MANULADO]   := ""

   else

      aGet[_DANULADO]:cText( Ctod( "" ) )
      aTmp[_MANULADO]   := ""

   end if

return .t.

//---------------------------------------------------------------------------//

Static Function TrazaPedidoProveedor( cNumDoc )

   local oDlg
   local oTree

   DEFINE DIALOG oDlg RESOURCE "TrazaDocumentos"

      oTree          := TTreeView():Redefine( 100, oDlg  )

      REDEFINE BUTTON ;
         ID       560 ;
			OF 		oDlg ;
         ACTION   ( oDlg:end() )

		REDEFINE BUTTON ;
         ID       561 ;
			OF 		oDlg ;
			ACTION	( oDlg:end() )

   ACTIVATE DIALOG oDlg ;
         ON INIT  ( InitTrazaPedidoProveedor( cNumDoc, oTree ) );
         CENTER

Return nil

//---------------------------------------------------------------------------//

Static Function InitTrazaPedidoProveedor( cNumDoc, oTree )

   local n
   local aDocumentsPedidoProveedor  := aDocumentsPedidoProveedor( cNumDoc )

   for n := 1 to len( aDocumentsPedidoProveedor )
      oTree:Add(  aDocumentsPedidoProveedor[ n, 1 ] + " / " + ;
                  aDocumentsPedidoProveedor[ n, 2 ] + " / " + ;
                  aDocumentsPedidoProveedor[ n, 3 ] + " / " + ;
                  aDocumentsPedidoProveedor[ n, 4 ] + " / " + ;
                  aDocumentsPedidoProveedor[ n, 5 ] )
   next

Return ( aDocumentsPedidoProveedor )

//---------------------------------------------------------------------------//

Static Function nEstadoIncidencia( cNumPed )

   local nEstado  := 0

   if ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSeek( cNumPed ) )

      while ( TDataView():PedidosProveedoresIncidencias( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedoresIncidencias( nView ) )->nNumPed ) + ( TDataView():PedidosProveedoresIncidencias( nView ) )->cSufPed == cNumPed .and. !( TDataView():PedidosProveedoresIncidencias( nView ) )->( Eof() )

         if ( TDataView():PedidosProveedoresIncidencias( nView ) )->lListo
            do case
               case nEstado == 0 .or. nEstado == 3
                    nEstado := 3
               case nEstado == 1
                    nEstado := 2
            end case
         else
            do case
               case nEstado == 0
                    nEstado := 1
               case nEstado == 3
                    nEstado := 2
            end case
         end if

         ( TDataView():PedidosProveedoresIncidencias( nView ) )->( dbSkip() )

      end while

   end if

Return ( nEstado )

//---------------------------------------------------------------------------//

/*
Bot�n anterior
*/

Static Function BtnAnt( oPag, oBtnNxt, oBtnAnt )

   if oPag:nOption == 2

      /*
      Vacia la temporal para a�adirle nuevos registros-------------------------
      */

      ( dbfTmpArt )->( __dbZap() )
      oPag:GoPrev()
      SetWindowText( oBtnNxt:hWnd, "Siguien&te >" )

      oBtnAnt:Hide()

   end if

RETURN ( .t. )

//---------------------------------------------------------------------------//
/*
Bot�n siguiente
*/

static function BtnNxt( oPag, oBtnNxt, oBtnAnt, oDlg, oProvee, cProvee, cArtOrg, cArtDes, nStockDis, nStockFin, oMtr, oBrw, cCodAlm )

   do case
      case oPag:nOption == 1

         /*
         Comprueba que eliga un proveedor
         */

         if Empty( cProvee )
            MsgStop( "Tiene que seleccionar un proveedor para generar el pedido" )
            oProvee:SetFocus()
            Return .f.
         end if

         /*
         Llena la temporal con los art�culos que cumplen las condiciones deseadas
         */

         LlenaTemporal( cProvee, cArtOrg, cArtDes, nStockDis, nStockFin, oMtr )

         oBrw:Refresh()

         oPag:GoNext()

         oBtnAnt:Show()

         SetWindowText( oBtnNxt:hWnd, "&Terminar" )

      case oPag:nOption == 2

         /*
         Crea el pedido a proveedor
         */

         CreaPedido( cProvee, cCodAlm )

         /*
         Elimina las temporales
         */

         KillTemporal()

         oDlg:end( IDOK )

   end case

RETURN ( .t. )

//---------------------------------------------------------------------------//
/*
Crea las bases de datos temporales que usaremos
*/

Static Function CreaTemporal()

   local cDbfArt  := "PArt"
   local cDbfPed  := "PPed"

   cTmpArt        := cGetNewFileName( cPatTmp() + cDbfArt )
   cTmpPed        := cGetNewFileName( cPatTmp() + cDbfPed )

   dbCreate( cTmpArt, aSqlStruct( aColTmpArt() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpArt, cCheckArea( cDbfArt, @dbfTmpArt ), .f. )
   if !( dbfTmpArt )->( neterr() )
      ( dbfTmpArt )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTmpArt )->( ordCreate( cTmpArt, "cRef", "cRef", {|| Field->cRef } ) )
   end if

   dbCreate( cTmpPed, aSqlStruct( aColPedPrv() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpPed, cCheckArea( cDbfPed, @dbfTmpLin ), .f. )
   if !( dbfTmpLin )->( neterr() )
      ( dbfTmpLin )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTmpLin )->( ordCreate( cTmpPed, "cRef", "cRef", {|| Field->cRef } ) )
   end if

Return nil

//---------------------------------------------------------------------------//
/*
Llena la temporal con los art�culos que cumplen las condiciones deseadas
*/

Static Function LlenaTemporal( cProvee, cArtOrg, cArtDes, nStockDis, nStockFin, oMtr )

   local nStkFisico
   local nStkDisponible

   ( TDataView():Articulos( nView ) )->( dbGoTop() )

   while !( TDataView():Articulos( nView ) )->( Eof() )

         nStkFisico                    := oStock:nTotStockAct( ( TDataView():Articulos( nView ) )->Codigo, , , , , ( TDataView():Articulos( nView ) )->lKitArt, ( TDataView():Articulos( nView ) )->nKitStk )
         nStkDisponible                := nStkFisico - nReservado( ( TDataView():Articulos( nView ) )->Codigo )

      if ( TDataView():Articulos( nView ) )->cPrvHab == cProvee .and.;
         ( TDataView():Articulos( nView ) )->Codigo >= cArtOrg  .and.;
         ( TDataView():Articulos( nView ) )->Codigo <= cArtDes

         do case
            case nStockDis == 1 .and. nStkDisponible < 0
               AppTemporal( nStockFin, nStkFisico, nStkDisponible )
            case nStockDis == 2 .and. nStkDisponible <= 0
               AppTemporal( nStockFin, nStkFisico, nStkDisponible )
            case nStockDis == 3 .and. nStkDisponible < ( TDataView():Articulos( nView ) )->nMinimo
               AppTemporal( nStockFin, nStkFisico, nStkDisponible )
            otherwise
               AppTemporal( nStockFin, nStkFisico, nStkDisponible )
         end case

      end if

      ( TDataView():Articulos( nView ) )->( dbSkip() )

      oMtr:Set( ( TDataView():Articulos( nView ) )->( OrdKeyNo() ) )

   end while

   oMtr:Set( 0 )

   ( dbfTmpArt )->( dbGoTop() )

Return nil

//---------------------------------------------------------------------------//
/*
Hace el append a la temporal
*/

static function AppTemporal( nStockFin, nStkFisico, nStkDisponible )

   ( dbfTmpArt )->( dbAppend() )

   ( dbfTmpArt )->cRef        := ( TDataView():Articulos( nView ) )->Codigo
   ( dbfTmpArt )->cDetalle    := ( TDataView():Articulos( nView ) )->Nombre
   ( dbfTmpArt )->nStkFis     := nStkFisico
   ( dbfTmpArt )->nStkDis     := nStkDisponible

   do case
      case nStockFin == 1
         if ( TDataView():Articulos( nView ) )->nMinimo   != 0
            ( dbfTmpArt )->nObjUni     := ( TDataView():Articulos( nView ) )->nMinimo
            ( dbfTmpArt )->nNumUni     := nCalculaUnidades( ( TDataView():Articulos( nView ) )->nMinimo )
            if nCalculaUnidades( ( TDataView():Articulos( nView ) )->nMinimo ) == 0
               ( dbfTmpArt )->lSelArt  := .f.
            else
               ( dbfTmpArt )->lSelArt  := .t.
            end if
         else
            ( dbfTmpArt )->nObjUni     := 1
            ( dbfTmpArt )->nNumUni     := nCalculaUnidades( 1 )
            if nCalculaUnidades( 1 ) == 0
               ( dbfTmpArt )->lSelArt  := .f.
            else
               ( dbfTmpArt )->lSelArt  := .t.
            end if
         end if
      
      case nStockFin == 2
         if ( TDataView():Articulos( nView ) )->nMaximo   != 0
            ( dbfTmpArt )->nObjUni     := ( TDataView():Articulos( nView ) )->nMaximo
            ( dbfTmpArt )->nNumUni     := nCalculaUnidades( ( TDataView():Articulos( nView ) )->nMaximo )
            if nCalculaUnidades( ( TDataView():Articulos( nView ) )->nMaximo ) == 0
               ( dbfTmpArt )->lSelArt  := .f.
            else
               ( dbfTmpArt )->lSelArt  := .t.
            end if
         else
            ( dbfTmpArt )->nObjUni     := 1
            ( dbfTmpArt )->nNumUni     := nCalculaUnidades( 1 )
            if nCalculaUnidades( 1 ) == 0
               ( dbfTmpArt )->lSelArt  := .f.
            else
               ( dbfTmpArt )->lSelArt  := .t.
            end if
         end if
   end case

return ( nil )

//---------------------------------------------------------------------------//
/*
Destruye las bases de datos temporales
*/

Static Function KillTemporal()

   if !Empty( dbfTmpArt ) .and. ( dbfTmpArt )->( Used() )
      ( dbfTmpArt )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpLin ) .and. ( dbfTmpLin )->( Used() )
      ( dbfTmpLin )->( dbCloseArea() )
   end if

   dbfErase( cTmpArt )
   dbfErase( cTmpPed )

Return nil

//---------------------------------------------------------------------------//
/*Campos que tiene que tener la temporal de art�culos*/

Static Function aColTmpArt()

   local aColTmpArt  := {}

      aAdd( aColTmpArt, { "CREF",    "C",   18,  0, "Referencia del art�culo",         "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "CDETALLE","C",  250,  0, "Nombre del art�culo",             "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "LSELART", "L",    1,  0, "L�gico de selecci�n de art�culo", "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "NNUMUNI", "N",   16,  6, "Unidades pedidas",                "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "NOBJUNI", "N",   16,  6, "Objetivo a llegar",               "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "NSTKFIS", "N",   16,  6, "Stock fisico",                    "",  "", "( cDbfCol )" } )
      aAdd( aColTmpArt, { "NSTKDIS", "N",   16,  6, "Stock disponible",                "",  "", "( cDbfCol )" } )

return ( aColTmpArt )

//---------------------------------------------------------------------------//
/*
Selecciona o deselecciona el art�culo que tengamos marcado en el browse
*/

Static Function SelArt( dbfTmpArt, oBrw )

   ( dbfTmpArt )->lSelArt := !( dbfTmpArt )->lSelArt

   oBrw:Refresh()

return nil

//---------------------------------------------------------------------------//
/*Selecciona o deselecciona todos los art�culos de browse*/

static function SelAllArt( dbfTmpArt, oBrw, lSel )

   local nRec  := ( dbfTmpArt )->( Recno() )

   ( dbfTmpArt )->( dbGoTop() )
   while !( dbfTmpArt )->( eof() )

      ( dbfTmpArt )->lSelArt := lSel

      ( dbfTmpArt )->( dbSkip() )

   end while

   ( dbfTmpArt )->( dbGoTo( nRec ) )

   oBrw:Refresh()

return nil

//---------------------------------------------------------------------------//
/*Devuelve el total de unidades reservadas del art�culo*/

Static Function nReservado( cCodArt )

   local nTotal := 0

   ( TDataView():PedidosClientesReservas( nView ) )->( dbGoTop() )

   ( TDataView():PedidosClientesReservas( nView ) )->( OrdSetFocus( "cRef" ) )

   if ( TDataView():PedidosClientesReservas( nView ) )->( dbSeek( cCodArt ) )

      while ( TDataView():PedidosClientesReservas( nView ) )->cRef == cCodArt .and. !( TDataView():PedidosClientesReservas( nView ) )->( Eof() )

         nTotal += nTotRPedCli( ( TDataView():PedidosClientesReservas( nView ) )->cSerPed + Str( ( TDataView():PedidosClientesReservas( nView ) )->nNumPed ) + ( TDataView():PedidosClientesReservas( nView ) )->cSufPed, ( TDataView():PedidosClientesReservas( nView ) )->cRef, ( TDataView():PedidosClientesReservas( nView ) )->cValPr1, ( TDataView():PedidosClientesReservas( nView ) )->cValPr2, TDataView():PedidosClientesReservas( nView ) )

      ( TDataView():PedidosClientesReservas( nView ) )->( dbSkip() )

      end while

   end if

return ( nTotal )

//---------------------------------------------------------------------------//
/*Creamos el pedido*/

Static Function CreaPedido( cCodPrv, cCodAlm )

   local cSeriePedido
   local nNumeroPedido
   local cSufijoPedido

   /*Metemos las lineas en una temporal
     para controlar que no cree un pedido
     sin l�neas o con unidades 0 */

   AppTemPedL( cCodAlm )

   if !( dbfTmpLin )->( Eof() )

      //--creo la cabecera del pedido--//

      ( TDataView():Proveedores( nView ) )->( dbSeek( cCodPrv ) )

      //--recogo la serie, n�mero, y sufijo del documento--//

      cSeriePedido               := cNewSer( "NPEDPRV" )
      nNumeroPedido              := nNewDoc( cSeriePedido, TDataView():PedidosProveedores( nView ), "NPEDPRV" )
      cSufijoPedido              := RetSufEmp()

      ( TDataView():PedidosProveedores( nView ) )->( dbAppend())
      ( TDataView():PedidosProveedores( nView ) )->cSerPed    := cSeriePedido
      ( TDataView():PedidosProveedores( nView ) )->nNumPed    := nNumeroPedido
      ( TDataView():PedidosProveedores( nView ) )->cSufPed    := cSufijoPedido
      ( TDataView():PedidosProveedores( nView ) )->cTurPed    := cCurSesion()
      ( TDataView():PedidosProveedores( nView ) )->dFecPed    := GetSysDate()
      ( TDataView():PedidosProveedores( nView ) )->cCodPrv    := cCodPrv
      if !Empty( cCodAlm )
         ( TDataView():PedidosProveedores( nView ) )->cCodAlm := cCodAlm
      else
         ( TDataView():PedidosProveedores( nView ) )->cCodAlm := cDefAlm()
      end if
      ( TDataView():PedidosProveedores( nView ) )->cCodCaj    := oUser():cCaja()
      ( TDataView():PedidosProveedores( nView ) )->cNomPrv    := ( TDataView():Proveedores( nView ) )->Titulo
      ( TDataView():PedidosProveedores( nView ) )->cDirPrv    := ( TDataView():Proveedores( nView ) )->Domicilio
      ( TDataView():PedidosProveedores( nView ) )->cPobPrv    := ( TDataView():Proveedores( nView ) )->Poblacion
      ( TDataView():PedidosProveedores( nView ) )->cProPrv    := ( TDataView():Proveedores( nView ) )->Provincia
      ( TDataView():PedidosProveedores( nView ) )->cPosPrv    := ( TDataView():Proveedores( nView ) )->CodPostal
      ( TDataView():PedidosProveedores( nView ) )->cDniPrv    := ( TDataView():Proveedores( nView ) )->Nif
      ( TDataView():PedidosProveedores( nView ) )->dFecEnt    := GetSysDate() + ( TDataView():Proveedores( nView ) )->nPlzEnt
      ( TDataView():PedidosProveedores( nView ) )->nEstado    := 1
      ( TDataView():PedidosProveedores( nView ) )->cDivPed    := cDivEmp()
      ( TDataView():PedidosProveedores( nView ) )->nVdvPed    := nChgDiv( cDivEmp(), TDataView():Divisas( nView ) )
      ( TDataView():PedidosProveedores( nView ) )->lSndDoc    := .t.
      ( TDataView():PedidosProveedores( nView ) )->cCodUsr    := cCurUsr()
      ( TDataView():PedidosProveedores( nView ) )->( dbRUnLock() )

      /*
      A�ado las lineas del pedido----------------------------------------------
      */

      while !( dbfTmpLin )->( Eof() )

         ( TDataView():PedidosProveedoresLineas( nView ) )->( dbAppend() )

         ( TDataView():PedidosProveedoresLineas( nView ) )->cSerPed          := cSeriePedido
         ( TDataView():PedidosProveedoresLineas( nView ) )->nNumPed          := nNumeroPedido
         ( TDataView():PedidosProveedoresLineas( nView ) )->cSufPed          := cSufijoPedido
         ( TDataView():PedidosProveedoresLineas( nView ) )->cRef             := ( dbfTmpLin )->cRef
         ( TDataView():PedidosProveedoresLineas( nView ) )->cDetalle         := ( dbfTmpLin )->cDetalle
         ( TDataView():PedidosProveedoresLineas( nView ) )->nIva             := ( dbfTmpLin )->nIva
         ( TDataView():PedidosProveedoresLineas( nView ) )->nReq             := ( dbfTmpLin )->nReq
         ( TDataView():PedidosProveedoresLineas( nView ) )->nCanPed          := ( dbfTmpLin )->nCanPed
         ( TDataView():PedidosProveedoresLineas( nView ) )->nUniCaja         := ( dbfTmpLin )->nUniCaja
         ( TDataView():PedidosProveedoresLineas( nView ) )->cUniDad          := ( dbfTmpLin )->cUniDad
         ( TDataView():PedidosProveedoresLineas( nView ) )->nPreDiv          := ( dbfTmpLin )->nPreDiv
         ( TDataView():PedidosProveedoresLineas( nView ) )->lLote            := ( dbfTmpLin )->lLote
         ( TDataView():PedidosProveedoresLineas( nView ) )->nLote            := ( dbfTmpLin )->nLote
         ( TDataView():PedidosProveedoresLineas( nView ) )->cLote            := ( dbfTmpLin )->cLote
         ( TDataView():PedidosProveedoresLineas( nView ) )->cAlmLin          := ( dbfTmpLin )->cAlmLin

         ( TDataView():PedidosProveedoresLineas( nView ) )->( dbRUnLock() )

      ( dbfTmpLin )->( dbSkip() )

      end while

      MsgInfo( "El pedido a proveedores " + AllTrim( cSeriePedido ) + "/" + AllTrim( Str( nNumeroPedido ) ) + "/" + AllTrim( cSufijoPedido ) + " se ha creado satisfactoriamente", "Informaci�n" )

   else

      MsgInfo( "No hay l�neas para crear su pedido", "Informaci�n" )

   end if

return nil

//---------------------------------------------------------------------------//
/*Calcula las unidades a pedir*/

Static function nCalculaUnidades( nObjetivo )

   local nUnidades := 0

   do case
      case ( dbfTmpArt )->nStkFis <= 0
         nUnidades   := Abs( ( dbfTmpArt )->nStkFis ) + nObjetivo
      case ( dbfTmpArt )->nStkFis > 0 .and. ( dbfTmpArt )->nStkFis < nObjetivo
         nUnidades   := nObjetivo - ( dbfTmpArt )->nStkFis
      case ( dbfTmpArt )->nStkFis > 0 .and. ( dbfTmpArt )->nStkFis > nObjetivo
         nUnidades   := 0
   end case

Return ( nUnidades )

//---------------------------------------------------------------------------//
/*A�ade en la temporal de lineas de pedidos*/

Static Function AppTemPedL( cCodAlm )

   ( dbfTmpArt )->( dbGoTop() )

   while !( dbfTmpArt )->( Eof() )

      ( TDataView():Articulos( nView ) )->( dbGotop() )
      ( TDataView():Articulos( nView ) )->( dbSeek( ( dbfTmpArt )->cRef ) )
      ( TDataView():TiposIva( nView ) )->( dbSeek( ( TDataView():Articulos( nView ) )->TipoIva ) )

      if ( dbfTmpArt )->lSelArt .and. ( dbfTmpArt )->nNumUni != 0

         ( dbfTmpLin )->( dbAppend() )
         ( dbfTmpLin )->cRef             := ( dbfTmpArt )->cRef
         ( dbfTmpLin )->cDetalle         := ( dbfTmpArt )->cDetalle
         ( dbfTmpLin )->nIva             := ( TDataView():TiposIva( nView ) )->TPIva
         ( dbfTmpLin )->nReq             := ( TDataView():TiposIva( nView ) )->nRecEq
         ( dbfTmpLin )->nCanPed          := 1
         ( dbfTmpLin )->nUniCaja         := ( dbfTmpArt )->nNumUni
         ( dbfTmpLin )->cUniDad          := ( TDataView():Articulos( nView ) )->cUniDad
         ( dbfTmpLin )->nPreDiv          := ( TDataView():Articulos( nView ) )->pCosto
         ( dbfTmpLin )->lLote            := ( TDataView():Articulos( nView ) )->lLote
         ( dbfTmpLin )->nLote            := ( TDataView():Articulos( nView ) )->nLote
         ( dbfTmpLin )->cLote            := ( TDataView():Articulos( nView ) )->cLote

         if !Empty( cCodAlm )
            ( dbfTmpLin )->cAlmLin       := cCodAlm
         else
            ( dbfTmpLin )->cAlmLin       := cDefAlm()
         end if

         ( dbfTmpLin )->( dbRUnLock() )

      end if

   ( dbfTmpArt )->( dbSkip() )

   end while

   ( dbfTmpLin )->( dbGoTop() )

Return ( .t. )

//---------------------------------------------------------------------------//

STATIC FUNCTION ValidaMedicion( aTmp, aGet )

   local cNewUndMed  := aGet[ _CUNIDAD ]:VarGet

   /*
   Cargamos el codigo de las unidades---------------------------------
   */

   if ( Empty( cOldUndMed ) .or. cOldUndMed != cNewUndMed )

      if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:Seek( aTmp[ _CUNIDAD ] )

         if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 1 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim1 )
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim1 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:cText( ( TDataView():Articulos( nView ) )->nLngArt )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:Show()
            else
               aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]  := ( TDataView():Articulos( nView ) )->nLngArt
            end if
         else
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:Hide()
            else
               aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]  := 0
            end if
         end if

         if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 2 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim2 )
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim2 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:cText( ( TDataView():Articulos( nView ) )->nAltArt )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:Show()
            else
               aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]  := ( TDataView():Articulos( nView ) )->nAltArt
            end if

         else
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:Hide()
            else
                 aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]  := 0
            end if
         end if

         if TDataView():GetObject( "UnidadMedicion", nView ):oDbf:nDimension >= 3 .and. !Empty( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim3 )
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:oSay:SetText( TDataView():GetObject( "UnidadMedicion", nView ):oDbf:cTextoDim3 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:cText( ( TDataView():Articulos( nView ) ) ->nAncArt )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:Show()
            else
               aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]  := ( TDataView():Articulos( nView ) )->nAncArt
            end if
         else
            if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ] )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
               aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:Hide()
            else
               aTmp[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]  := 0
            end if
         end if

      else

         if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ] )
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:Hide()
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
         end if

         if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ] )
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:Hide()
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
         end if

         if !Empty( aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ] )
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:Hide()
            aGet[ ( TDataView():PedidosProveedoresLineas( nView ) )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
         end if

      end if

      cOldUndMed := cNewUndMed

   end if

RETURN .t.
//---------------------------------------------------------------------------//

Static Function nTotRecibido( dbfLin, dbf )

   local nTotRec
   local nTotUni
   local nEstado     := 1

   nTotRec           := nUnidadesRecibidasPedPrv( ( dbfLin )->cSerPed + Str( ( dbfLin )->nNumPed ) + ( dbfLin )->cSufPed, ( dbfLin )->cRef, ( dbfLin )->cValPr1, ( dbfLin )->cValPr2, ( dbfLin )->cRefPrv, ( dbfLin )->cDetalle, TDataView():AlbaranesProveedoresLineas( nView ) )
   nTotUni           := nTotNPedPrv( dbfLin )

   do case
      case nTotRec == 0
         nEstado     := 1
      case nTotRec < nTotUni
         nEstado     := 2
      case nTotRec >= nTotUni
         nEstado     := 3
   end case

RETURN ( nEstado )

//---------------------------------------------------------------------------//

#include "FastRepH.ch"

Static Function DataReport( oFr )

   /*
   Zona de datos------------------------------------------------------------
   */

   oFr:ClearDataSets()

   oFr:SetWorkArea(     "Pedidos", ( TDataView():PedidosProveedores( nView ) )->( Select() ), .f., { FR_RB_CURRENT, FR_RB_CURRENT, 0 } )
   oFr:SetFieldAliases( "Pedidos", cItemsToReport( aItmPedPrv() ) )

   oFr:SetWorkArea(     "Lineas de pedidos", ( TDataView():PedidosProveedoresLineas( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Lineas de pedidos", cItemsToReport( aColPedPrv() ) )

   oFr:SetWorkArea(     "Incidencias de pedidos", ( TDataView():PedidosProveedoresIncidencias( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Incidencias de pedidos", cItemsToReport( aIncPedPrv() ) )

   oFr:SetWorkArea(     "Documentos de pedidos", ( TDataView():PedidosProveedoresDocumentos( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Documentos de pedidos", cItemsToReport( aPedPrvDoc() ) )

   oFr:SetWorkArea(     "Empresa", ( TDataView():Empresa( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Empresa", cItemsToReport( aItmEmp() ) )

   oFr:SetWorkArea(     "Proveedor", ( TDataView():Proveedores( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Proveedor", cItemsToReport( aItmPrv() ) )

   oFr:SetWorkArea(     "Almacenes", ( TDataView():Almacen( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Almacenes", cItemsToReport( aItmAlm() ) )

   oFr:SetWorkArea(     "Formas de pago", ( TDataView():FormasPago( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Formas de pago", cItemsToReport( aItmFPago() ) )

   oFr:SetWorkArea(     "Usuarios", ( TDataView():Usuarios( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Usuarios", cItemsToReport( aItmUsuario() ) )

   oFr:SetWorkArea(     "Art�culos", ( TDataView():Articulos( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Art�culos", cItemsToReport( aItmArt() ) )

   oFr:SetWorkArea(     "C�digo de proveedores", ( TDataView():ProveedorArticulo( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "C�digo de proveedores", cItemsToReport( aItmArtPrv() ) )

   oFr:SetWorkArea(     "Unidades de medici�n",  TDataView():GetObject( "UnidadMedicion", nView ):Select() )
   oFr:SetFieldAliases( "Unidades de medici�n",  cObjectsToReport( TDataView():GetObject( "UnidadMedicion", nView ):oDbf ) )

   oFr:SetWorkArea(     "Clientes", ( TDataView():Clientes( nView ) )->( Select() ) )
   oFr:SetFieldAliases( "Clientes", cItemsToReport( aItmCli() ) )

   oFr:SetMasterDetail( "Pedidos", "Lineas de pedidos",        {|| ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed } )
   oFr:SetMasterDetail( "Pedidos", "Incidencias de pedidos",   {|| ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed } )
   oFr:SetMasterDetail( "Pedidos", "Documentos de pedidos",    {|| ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed } )
   oFr:SetMasterDetail( "Pedidos", "Proveedor",                {|| ( TDataView():PedidosProveedores( nView ) )->cCodPrv } )
   oFr:SetMasterDetail( "Pedidos", "Almacenes",                {|| ( TDataView():PedidosProveedores( nView ) )->cCodAlm } )
   oFr:SetMasterDetail( "Pedidos", "Formas de pago",           {|| ( TDataView():PedidosProveedores( nView ) )->cCodPgo } )
   oFr:SetMasterDetail( "Pedidos", "Usuarios",                 {|| ( TDataView():PedidosProveedores( nView ) )->cCodUsr } )
   oFr:SetMasterDetail( "Pedidos", "Empresa",                  {|| cCodigoEmpresaEnUso() } )
   oFr:SetMasterDetail( "Pedidos", "Clientes",                 {|| GetCodCli( ( TDataView():PedidosProveedores( nView ) )->cNumPedCli ) } )

   oFr:SetMasterDetail( "Lineas de pedidos", "Art�culos",               {|| ( TDataView():PedidosProveedoresLineas( nView ) )->cRef } )
   oFr:SetMasterDetail( "Lineas de pedidos", "C�digo de proveedores",   {|| ( TDataView():PedidosProveedores( nView ) )->cCodPrv + ( TDataView():PedidosProveedoresLineas( nView ) )->cRef } )
   oFr:SetMasterDetail( "Lineas de pedidos", "Unidades de medici�n",    {|| ( TDataView():PedidosProveedoresLineas( nView ) )->cUnidad } )

   oFr:SetResyncPair(   "Pedidos", "Lineas de pedidos" )
   oFr:SetResyncPair(   "Pedidos", "Incidencias de pedidos" )
   oFr:SetResyncPair(   "Pedidos", "Documentos de pedidos" )
   oFr:SetResyncPair(   "Pedidos", "Empresa" )
   oFr:SetResyncPair(   "Pedidos", "Proveedor" )
   oFr:SetResyncPair(   "Pedidos", "Almacenes" )
   oFr:SetResyncPair(   "Pedidos", "Formas de pago" )
   oFr:SetResyncPair(   "Pedidos", "Usuarios" )
   oFr:SetResyncPair(   "Pedidos", "Clientes" )

   oFr:SetResyncPair(   "Lineas de pedidos", "Art�culos" )
   oFr:SetResyncPair(   "Lineas de pedidos", "C�digo de proveedores" )
   oFr:SetResyncPair(   "Lineas de pedidos", "Unidades de medici�n" )

Return nil

//---------------------------------------------------------------------------//

Static Function VariableReport( oFr )

   oFr:DeleteCategory(  "Pedidos" )
   oFr:DeleteCategory(  "Lineas de pedidos" )

   /*
   Creaci�n de variables----------------------------------------------------
   */

   oFr:AddVariable(     "Pedidos",             "Total pedido",                        "GetHbVar('nTotPed')" )
   oFr:AddVariable(     "Pedidos",             "Total bruto",                         "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento pronto pago",         "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Pedidos",             "Total bruto",                         "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento",                     "GetHbVar('nTotDto')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento pronto pago",         "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Pedidos",             "Total neto",                          "GetHbVar('nTotNet')" )
   oFr:AddVariable(     "Pedidos",             "Total primer descuento definible",    "GetHbVar('nTotUno')" )
   oFr:AddVariable(     "Pedidos",             "Total segundo descuento definible",   "GetHbVar('nTotDos')" )
   oFr:AddVariable(     "Pedidos",             "Total " + cImp(),                     "GetHbVar('nTotIva')" )
   oFr:AddVariable(     "Pedidos",             "Total RE",                            "GetHbVar('nTotReq')" )
   oFr:AddVariable(     "Pedidos",             "Total retenci�n",                     "GetHbVar('nTotRet')" )
   oFr:AddVariable(     "Pedidos",             "Bruto primer tipo de " + cImp(),      "GetHbArrayVar('aIvaUno',1)" )
   oFr:AddVariable(     "Pedidos",             "Bruto segundo tipo de " + cImp(),     "GetHbArrayVar('aIvaDos',1)" )
   oFr:AddVariable(     "Pedidos",             "Bruto tercer tipo de " + cImp(),      "GetHbArrayVar('aIvaTre',1)" )
   oFr:AddVariable(     "Pedidos",             "Base primer tipo de " + cImp(),       "GetHbArrayVar('aIvaUno',2)" )
   oFr:AddVariable(     "Pedidos",             "Base segundo tipo de " + cImp(),      "GetHbArrayVar('aIvaDos',2)" )
   oFr:AddVariable(     "Pedidos",             "Base tercer tipo de " + cImp(),       "GetHbArrayVar('aIvaTre',2)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje primer tipo " + cImp(),    "GetHbArrayVar('aIvaUno',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje segundo tipo " + cImp(),   "GetHbArrayVar('aIvaDos',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje tercer tipo " + cImp(),    "GetHbArrayVar('aIvaTre',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje primer tipo RE",           "GetHbArrayVar('aIvaUno',4)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje segundo tipo RE",          "GetHbArrayVar('aIvaDos',4)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje tercer tipo RE",           "GetHbArrayVar('aIvaTre',4)" )
   oFr:AddVariable(     "Pedidos",             "Importe primer tipo " + cImp(),       "GetHbArrayVar('aIvaUno',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe segundo tipo " + cImp(),      "GetHbArrayVar('aIvaDos',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe tercer tipo " + cImp(),       "GetHbArrayVar('aIvaTre',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe primer RE",                   "GetHbArrayVar('aIvaUno',6)" )
   oFr:AddVariable(     "Pedidos",             "Importe segundo RE",                  "GetHbArrayVar('aIvaDos',6)" )
   oFr:AddVariable(     "Pedidos",             "Importe tercer RE",                   "GetHbArrayVar('aIvaTre',6)" )

   oFr:AddVariable(     "Lineas de pedidos",   "Detalle del art�culo",                "CallHbFunc('cDesPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Total unidades art�culo",             "CallHbFunc('nTotNPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Precio unitario del art�culo",        "CallHbFunc('nTotUPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Total l�nea de pedido",               "CallHbFunc('nTotLPedPrv')" )

Return nil

//---------------------------------------------------------------------------//

Static Function MailingReport( oFr )

   /*
   Creaci�n de variables----------------------------------------------------
   */

   oFr:AddVariable(     "Pedidos",             "Total pedido",                        "GetHbVar('nTotPed')" )
   oFr:AddVariable(     "Pedidos",             "Total bruto",                         "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento pronto pago",         "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Pedidos",             "Total bruto",                         "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento",                     "GetHbVar('nTotDto')" )
   oFr:AddVariable(     "Pedidos",             "Total descuento pronto pago",         "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Pedidos",             "Total neto",                          "GetHbVar('nTotNet')" )
   oFr:AddVariable(     "Pedidos",             "Total primer descuento definible",    "GetHbVar('nTotUno')" )
   oFr:AddVariable(     "Pedidos",             "Total segundo descuento definible",   "GetHbVar('nTotDos')" )
   oFr:AddVariable(     "Pedidos",             "Total " + cImp(),                           "GetHbVar('nTotIva')" )
   oFr:AddVariable(     "Pedidos",             "Total RE",                            "GetHbVar('nTotReq')" )
   oFr:AddVariable(     "Pedidos",             "Total retenci�n",                     "GetHbVar('nTotRet')" )
   oFr:AddVariable(     "Pedidos",             "Bruto primer tipo de " + cImp(),            "GetHbArrayVar('aIvaUno',1)" )
   oFr:AddVariable(     "Pedidos",             "Bruto segundo tipo de " + cImp(),           "GetHbArrayVar('aIvaDos',1)" )
   oFr:AddVariable(     "Pedidos",             "Bruto tercer tipo de " + cImp(),            "GetHbArrayVar('aIvaTre',1)" )
   oFr:AddVariable(     "Pedidos",             "Base primer tipo de " + cImp(),             "GetHbArrayVar('aIvaUno',2)" )
   oFr:AddVariable(     "Pedidos",             "Base segundo tipo de " + cImp(),            "GetHbArrayVar('aIvaDos',2)" )
   oFr:AddVariable(     "Pedidos",             "Base tercer tipo de " + cImp(),             "GetHbArrayVar('aIvaTre',2)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje primer tipo " + cImp(),          "GetHbArrayVar('aIvaUno',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje segundo tipo " + cImp(),         "GetHbArrayVar('aIvaDos',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje tercer tipo " + cImp(),          "GetHbArrayVar('aIvaTre',3)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje primer tipo RE",           "GetHbArrayVar('aIvaUno',4)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje segundo tipo RE",          "GetHbArrayVar('aIvaDos',4)" )
   oFr:AddVariable(     "Pedidos",             "Porcentaje tercer tipo RE",           "GetHbArrayVar('aIvaTre',4)" )
   oFr:AddVariable(     "Pedidos",             "Importe primer tipo " + cImp(),             "GetHbArrayVar('aIvaUno',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe segundo tipo " + cImp(),            "GetHbArrayVar('aIvaDos',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe tercer tipo " + cImp(),             "GetHbArrayVar('aIvaTre',5)" )
   oFr:AddVariable(     "Pedidos",             "Importe primer RE",                   "GetHbArrayVar('aIvaUno',6)" )
   oFr:AddVariable(     "Pedidos",             "Importe segundo RE",                  "GetHbArrayVar('aIvaDos',6)" )
   oFr:AddVariable(     "Pedidos",             "Importe tercer RE",                   "GetHbArrayVar('aIvaTre',6)" )

   oFr:AddVariable(     "Lineas de pedidos",   "Detalle del art�culo",                "CallHbFunc('cDesPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Total unidades art�culo",             "CallHbFunc('nTotNPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Precio unitario del art�culo",        "CallHbFunc('nTotUPedPrv')" )
   oFr:AddVariable(     "Lineas de pedidos",   "Total l�nea de pedido",               "CallHbFunc('nTotLPedPrv')" )

Return nil

//---------------------------------------------------------------------------//

Static Function YearComboBoxChange()

	if oWndBrw:oWndBar:lAllYearComboBox()
            DestroyFastFilter( TDataView():PedidosProveedores( nView ) )
            CreateUserFilter( "", TDataView():PedidosProveedores( nView ), .f., , , "all" )
	else
		DestroyFastFilter( TDataView():PedidosProveedores( nView ) )
            CreateUserFilter( "Year( Field->dFecPed ) == " + oWndBrw:oWndBar:cYearComboBox(), TDataView():PedidosProveedores( nView ), .f., , , "Year( Field->dFecPed ) == " + oWndBrw:oWndBar:cYearComboBox() )
	end if

	( TDataView():PedidosProveedores( nView ) )->( dbGoTop() )

	oWndBrw:Refresh()

Return nil

//---------------------------------------------------------------------------//

Static Function CargaComprasProveedor( aTmp, oImportaComprasProveedor, oDlg )

      local nOrd
      local nPreCom
      local nConsumo    := 0
      local nConsumoDia := 0
      local dFecIni     := oImportaComprasProveedor:oFechaInicio:Value()
      local dFecFin     := oImportaComprasProveedor:oFechaFin:Value() 
      local nPorcentaje := oImportaComprasProveedor:oPorcentaje:Value()
      local nDias       := dFecFin - dFecIni

      oDlg:Disable()

      if empty( aTmp[ _CCODPRV ] )
            msgStop( "C�digo del proveedor no puede esta vacio.")
            return .f.
      end if

      AutoMeterDialog( oDlg )

      SetTotalAutoMeterDialog( ( TDataView():Articulos( nView ) )->( LastRec() ) )

      CursorWait()

      nOrd        := ( TDataView():Articulos( nView ) )->( ordSetFocus( "cPrvHab" ) )

      if ( TDataView():Articulos( nView ) )->( dbSeek( aTmp[ _CCODPRV ] ) )

            while ( TDataView():Articulos( nView ) )->cPrvHab == aTmp[ _CCODPRV ] .and. !( TDataView():Articulos( nView ) )->( eof() )

            if !dbSeekInOrd( ( TDataView():Articulos( nView ) )->Codigo, "cRef", dbfTmpLin ) .and. !( TDataView():Articulos( nView ) )->lObs 
                  
                  ( dbfTmpLin )->( dbAppend() )

                  ( dbfTmpLin )->nNumLin        := nLastNum( dbfTmpLin )                  
                  ( dbfTmpLin )->cRef           := ( TDataView():Articulos( nView ) )->Codigo
                  ( dbfTmpLin )->cDetalle       := ( TDataView():Articulos( nView ) )->Nombre      
                  ( dbfTmpLin )->nIva           := nIva( TDataView():TiposIva( nView ), ( TDataView():Articulos( nView ) )->TipoIva )
                  ( dbfTmpLin )->nReq           := nReq( TDataView():TiposIva( nView ), ( TDataView():Articulos( nView ) )->TipoIva )
                  ( dbfTmpLin )->cAlmLin        := aTmp[ _CCODALM ]
                  ( dbfTmpLin )->lFromImp       := .t.

                  if ( TDataView():Articulos( nView ) )->nCajEnt != 0
                        ( dbfTmpLin )->nCanPed  := ( TDataView():Articulos( nView ) )->nCajEnt 
                  end if

                  if ( TDataView():Articulos( nView ) )->nUniCaja != 0
                        ( dbfTmpLin )->nUniCaja := ( TDataView():Articulos( nView ) )->nUniCaja 
                  end if

                  if ( TDataView():Articulos( nView ) )->lLote  
                        ( dbfTmpLin )->cLote    := ( TDataView():Articulos( nView ) )->lLote
                  end if 

                  /*
                  Tratamientos kits-----------------------------------------------------
                  */

                  ( dbfTmpLin )->nCtlStk  := ( TDataView():Articulos( nView ) )->nCtlStock

                  if ( TDataView():Articulos( nView ) )->lKitArt
                  
                        ( dbfTmpLin )->lKitArt  := ( TDataView():Articulos( nView ) )->lKitArt                        // Marcamos como padre del kit
                        ( dbfTmpLin )->lImpLin  := lImprimirCompuesto( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) ) // 1 Todos, 2 Compuesto
                        ( dbfTmpLin )->lKitPrc  := lPreciosCompuestos( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) ) // 1 Todos, 2 Compuesto

                        if lStockCompuestos( ( TDataView():Articulos( nView ) )->Codigo, TDataView():Articulos( nView ) )
                              ( dbfTmpLin )->nCtlStk  := ( TDataView():Articulos( nView ) )->nCtlStock
                        else
                              ( dbfTmpLin )->nCtlStk  := STOCK_NO_CONTROLAR // No controlar Stock
                        end if

                  end if 

                  /*
                  Buscamos la familia del articulo y anotamos las propiedades--------
                  */

                  ( dbfTmpLin )->cCodPr1        := ( TDataView():Articulos( nView ) )->cCodPrp1
                  ( dbfTmpLin )->cCodPr2        := ( TDataView():Articulos( nView ) )->cCodPrp2

                  /*
                  Precios de compra--------------------------------------------------
                  */

                  nPreCom                       := nComPro( ( dbfTmpLin )->cRef, ( dbfTmpLin )->cCodPr1, ( dbfTmpLin )->cValPr1, ( dbfTmpLin )->cCodPr2, ( dbfTmpLin )->cValPr2, TDataView():ArticuloPrecioPropiedades( nView ) )
                  if nPrecom  != 0
                        ( dbfTmpLin )->nPreDiv  := nPreCom
                  end if

                  if uFieldEmpresa( "lCosPrv", .f. )
                        nPreCom                 := nPrecioReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )
                  end if

                  if nPreCom != 0
                        ( dbfTmpLin )->nPreDiv  := nPreCom
                  else
                        ( dbfTmpLin )->nPreDiv  := nCosto( nil, TDataView():Articulos( nView ), TDataView():Kit( nView ), .f., aTmp[ _CDIVPED ], TDataView():Divisas( nView ) )
                  end if

                  /*
                  Descuento de articulo----------------------------------------------
                  */

                  if uFieldEmpresa( "lCosPrv", .f. )

                        nPreCom     := nDescuentoReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )
                        if nPreCom != 0
                              ( dbfTmpLin )->nDtoLin  := nPreCom 
                        end if

                        /*
                        Descuento de promocional-------------------------------
                        */

                        nPreCom     := nPromocionReferenciaProveedor( aTmp[ _CCODPRV ], ( dbfTmpLin )->cRef, TDataView():ProveedorArticulo( nView ) )
                        if nPreCom != 0
                              ( dbfTmpLin )->nDtoPrm  := nPreCom
                        end if

                  end if

                  /*
                  Recogemos las familias y los grupos de familias--------------------
                  */
      
                  ( dbfTmpLin )->cCodFam        := ( TDataView():Articulos( nView ) )->Familia
                  ( dbfTmpLin )->cGrpFam        := cGruFam( ( TDataView():Articulos( nView ) )->Familia, TDataView():Familias( nView ) )

                  /*
                  Ponemos el precio de venta recomendado-----------------------------
                  */
      
                  ( dbfTmpLin )->nPvpRec        := ( TDataView():Articulos( nView ) )->PvpRec
                  ( dbfTmpLin )->cUnidad        := ( TDataView():Articulos( nView ) )->cUnidad
                  ( dbfTmpLin )->nStkMin        := ( TDataView():Articulos( nView ) )->nMinimo

                  // Valores del stock-----------------------------------------

                  oStock:aStockArticulo( ( dbfTmpLin )->cRef, ( dbfTmpLin )->cAlmLin )

                  ( dbfTmpLin )->nStkAct        := oStock:nUnidadesInStock()
                  ( dbfTmpLin )->nPdtRec        := oStock:nPendientesRecibirInStock()

                  // Consumo de producto entre dos fechas----------------------

                  nConsumo                      := oStock:nConsumoArticulo( ( dbfTmpLin )->cRef, ( dbfTmpLin )->cAlmLin, ( dbfTmpLin )->cValPr1, ( dbfTmpLin )->cValPr2, ( dbfTmpLin )->cLote, dFecIni, dFecFin )

                  if !Empty( nConsumo )
                        
                        ( dbfTmpLin )->nConRea  := nConsumo

                        // Aplicamos el incremento-----------------------------

                        nConsumoDia             := nConsumo + ( nConsumo * nPorcentaje / 100 )
                        nConsumoDia             := nConsumoDia / nDias

                        ( dbfTmpLin )->nConSem  := Round( nConsumoDia * 7, 0 ) 
                        ( dbfTmpLin )->nConQui  := Round( nConsumoDia * 15, 0 ) 
                        ( dbfTmpLin )->nConMes  := Round( nConsumoDia * 30, 0 ) 

                  end if 

                  ( dbfTmpLin )->( dbUnlock() )

            end if

            SetAutoMeterDialog( ( TDataView():Articulos( nView ) )->( Recno() ) )

            ( TDataView():Articulos( nView ) )->( dbSkip() )

            end while
      
      end if 

      EndAutoMeterDialog( ( TDataView():Articulos( nView ) )->( LastRec() ) )

      ( TDataView():Articulos( nView ) )->( ordSetFocus( nOrd ) )

      ( dbfTmpLin )->( dbGoTop() )

      CursorWE()

      oDlg:Enable()

Return .t. 

//---------------------------------------------------------------------------//

Static Function CalculaComprasProveedor( aTmp, oBrwLin, oImportaComprasProveedor )

      local nRec
      local nConsumo    := 0
      local nConsumoDia := 0
      local dFecIni     := oImportaComprasProveedor:oFechaInicio:Value()
      local dFecFin     := oImportaComprasProveedor:oFechaFin:Value() 
      local nPorcentaje := oImportaComprasProveedor:oPorcentaje:Value()
      local nDias       := dFecFin - dFecIni

      CursorWait()

      nRec              := ( dbfTmpLin )->( RecNo() )

      ( dbfTmpLin )->( dbGoTop() )
      while !( dbfTmpLin )->( eof() )

            /*
            Ponemos el stock---------------------------------------------------
            */

            if ( dbfTmpLin )->( dbRLock() )

                  oStock:aStockArticulo( ( dbfTmpLin )->cRef, ( dbfTmpLin )->cAlmLin )

                  ( dbfTmpLin )->nStkAct        := oStock:nUnidadesInStock()
                  ( dbfTmpLin )->nPdtRec        := oStock:nPendientesRecibirInStock()

                  nConsumo                      := oStock:nConsumoArticulo( ( dbfTmpLin )->cRef, , ( dbfTmpLin )->cValPr1, ( dbfTmpLin )->cValPr2, ( dbfTmpLin )->cLote, dFecIni, dFecFin )

                  if !Empty( nConsumo )
                        
                        ( dbfTmpLin )->nConRea  := nConsumo

                        // Aplicamos el incremento-----------------------------

                        nConsumoDia             := nConsumo + ( nConsumo * nPorcentaje / 100 )
                        nConsumoDia             := nConsumoDia / nDias

                        ( dbfTmpLin )->nConSem  := Round( nConsumoDia * 7, 0 ) 
                        ( dbfTmpLin )->nConQui  := Round( nConsumoDia * 15, 0 ) 
                        ( dbfTmpLin )->nConMes  := Round( nConsumoDia * 30, 0 ) 

                  end if 

                  ( dbfTmpLin )->( dbUnlock() )

            end if

            ( dbfTmpLin )->( dbSkip() )

      end while

      ( dbfTmpLin )->( dbGoTo( nRec ) )

      oBrwLin:Refresh()

      RecalculaTotal( aTmp )

      CursorWE()

Return nil 

//---------------------------------------------------------------------------//
 
Static Function ImportaComprasProveedor( aTmp, oBrwLin, oDlg )

      local oImportaComprasProveedor      := ImportarProductosProveedor():New()

      oImportaComprasProveedor:bAction    := {|| CargaComprasProveedor( aTmp, oImportaComprasProveedor, oDlg ), oBrwLin:Refresh() }

      oImportaComprasProveedor:Resource()
      oImportaComprasProveedor:End()      

Return ( nil )

//---------------------------------------------------------------------------//

Static Function ChangeUnidades( oCol, uNewValue, nKey, aTmp )

   /*
   Cambiamos el valor de las unidades de la linea de la factura---------------
   */

   if IsNum( nKey ) .and. ( nKey != VK_ESCAPE ) .and. !IsNil( uNewValue )

      ( dbfTmpLin )->nUnicaja       := uNewValue

      RecalculaTotal( aTmp )

   end if

Return .t.

//---------------------------------------------------------------------------//

Static Function ChangeComentario( oCol, uNewValue, nKey, aTmp )

   /*
   Cambiamos el valor de las unidades de la linea de la factura---------------
   */

   if IsNum( nKey ) .and. ( nKey != VK_ESCAPE ) .and. !IsNil( uNewValue )

      if dbSeekInOrd( ( dbfTmpLin )->cRef, "Codigo", TDataView():Articulos( nView ) )

            if dbLock( TDataView():Articulos( nView ) )
                  ( TDataView():Articulos( nView ) )->mComent      := uNewValue
                  ( TDataView():Articulos( nView ) )->( dbUnlock() )
            end if

      end if

   end if

Return .t.

//---------------------------------------------------------------------------//


/*
Sumamos una unidad a la linea de la factura--------------------------------
*/

Static Function SumaUnidadLinea( aTmp )

   ( dbfTmpLin )->nUniCaja++

   RecalculaTotal( aTmp )

Return .t.

//---------------------------------------------------------------------------//
/*
Restamos una unidad a la linea de la factura-------------------------------
*/

Static Function RestaUnidadLinea( aTmp )

   ( dbfTmpLin )->nUniCaja--

   RecalculaTotal( aTmp )

Return .t.

//---------------------------------------------------------------------------//

Static Function ImprimirSeriesPedidosProveedores( nDevice, lExt )

   local aStatus
   local oPrinter   
   local cFormato 

   DEFAULT nDevice   := IS_PRINTER
   DEFAULT lExt      := .f.

   // Cremaos el dialogo-------------------------------------------------------

   oPrinter          := PrintSeries():New( nView ):SetCompras()

   // Establecemos sus valores-------------------------------------------------

   oPrinter:Serie(      ( TDataView():PedidosProveedores( nView ) )->cSerPed )
   oPrinter:Documento(  ( TDataView():PedidosProveedores( nView ) )->nNumPed )
   oPrinter:Sufijo(     ( TDataView():PedidosProveedores( nView ) )->cSufPed )

   if lExt

      oPrinter:oFechaInicio:cText( ( TDataView():PedidosProveedores( nView ) )->dFecPed )
      oPrinter:oFechaFin:cText( ( TDataView():PedidosProveedores( nView ) )->dFecPed )

   end if

   oPrinter:oFormatoDocumento:TypeDocumento( "PP" )   

   // Formato de documento-----------------------------------------------------

   cFormato          := cFormatoDocumento( ( TDataView():PedidosProveedores( nView ) )->cSerPed, "nPedPrv", TDataView():Contadores( nView ) )
   if empty( cFormato )
      cFormato       := cFirstDoc( "PP", TDataView():Documentos( nView ) )
   end if
   oPrinter:oFormatoDocumento:cText( cFormato )

   // Codeblocks para que trabaje----------------------------------------------

   aStatus           := TDataview():GetInitStatus( "PedPROVT", nView )

   oPrinter:bInit    := {||   ( TDataview():PedidosProveedores( nView ) )->( dbSeek( oPrinter:DocumentoInicio(), .t. ) ) }

   oPrinter:bWhile   := {||   oPrinter:InRangeDocumento( TDataView():PedidosProveedoresId( nView ) )                  .and. ;
                              ( TDataView():PedidosProveedores( nView ) )->( !eof() ) }

   oPrinter:bFor     := {||   oPrinter:InRangeFecha( ( TDataView():PedidosProveedores( nView ) )->dFecPed )           .and. ;
                              oPrinter:InRangeProveedor( ( TDataView():PedidosProveedores( nView ) )->cCodPrv )         .and. ;
                              oPrinter:InRangeGrupoProveedor( RetFld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "cCodGrp" ) ) }

   oPrinter:bSkip    := {||   ( TDataView():PedidosProveedores( nView ) )->( dbSkip() ) }

   oPrinter:bAction  := {||   GenPedPrv( nDevice, "Imprimiendo documento : " + TDataView():PedidosProveedoresId( nView ), oPrinter:oFormatoDocumento:uGetValue, oPrinter:oImpresora:uGetValue, oPrinter:oCopias:uGetValue ) }

   oPrinter:bStart   := {||   if( lExt, oPrinter:DisableRange(), ) }

   // Abrimos el dialogo-------------------------------------------------------

   oPrinter:Resource():End()

   // Restore -----------------------------------------------------------------

   TDataview():SetStatus( "PedPROVT", nView, aStatus )
   
   if !Empty( oWndBrw )
      oWndBrw:Refresh()
   end if   

Return .t.

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
/*------------------------FUNCIONES GLOBALESS--------------------------------*/
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//


/*
Calcula el Total del pedido
*/

FUNCTION nTotPedPrv( cPedido, cPedPrvT, cPedPrvL, cIva, cDiv, aTmp, cDivRet, lPic )

   local nRec
   local nTotArt
      local dFecFac
      local lRecargo
      local nDtoEsp
      local nDtoPP
   local nDtoUno
      local nDtoDos
      local nPorte
      local cCodDiv
   local nRegIva
   local aTotDto     := { 0, 0, 0 }
   local aTotDPP     := { 0, 0, 0 }
   local aTotUno     := { 0, 0, 0 }
   local aTotDos     := { 0, 0, 0 }
   local bCondition

   DEFAULT cPedPrvT  := TDataView():PedidosProveedores( nView )
   DEFAULT cPedPrvL  := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT cIva      := TDataView():TiposIva( nView )
   DEFAULT cDiv      := TDataView():Divisas( nView )
   DEFAULT lPic      := .f.
   DEFAULT cPedido   := ( cPedPrvT )->cSerPed + Str( ( cPedPrvT )->nNumPed ) + ( cPedPrvT )->cSufPed

   public nTotPed    := 0
   public nTotBrt    := 0
   public nTotDto    := 0
   public nTotDPP    := 0
   public nTotNet    := 0
   public nTotIva    := 0
   public nTotReq    := 0
   public nTotImp    := 0
   public aTotIva    := { { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 } }
   public aIvaUno    := aTotIva[ 1 ]
   public aIvaDos    := aTotIva[ 2 ]
   public aIvaTre    := aTotIva[ 3 ]
   public nTotUno    := 0
   public nTotDos    := 0
    

   nRec              := ( cPedPrvL )->( Recno() )

   if aTmp != nil
            dFecFac                 := aTmp[ _DFECPED ]
            lRecargo                := aTmp[ _LRECARGO]
            nDtoEsp                 := aTmp[ _NDTOESP ]
            nDtoPP                  := aTmp[ _NDPP    ]
      nDtoUno        := aTmp[ _NDTOUNO ]
      nDtoDos        := aTmp[ _NDTODOS ]
            nPorte                  := aTmp[ _NPORTES ]
            cCodDiv                 := aTmp[ _CDIVPED ]
      nVdvDiv        := aTmp[ _NVDVPED ]
      nRegIva        := aTmp[ _NREGIVA ]
      bCondition     := {|| ( cPedPrvL )->( !eof() ) }
      ( cPedPrvL )->( dbGoTop() )
   else
      dFecFac        := ( cPedPrvT )->dFecPed
      lRecargo       := ( cPedPrvT )->lRecargo
      nDtoEsp        := ( cPedPrvT )->nDtoEsp
      nDtoPP         := ( cPedPrvT )->nDpp
      nDtoUno        := ( cPedPrvT )->nDtoUno
      nDtoDos        := ( cPedPrvT )->nDtoDos
      nPorte         := ( cPedPrvT )->nPortes
      cCodDiv        := ( cPedPrvT )->cDivPed
      nVdvDiv        := ( cPedPrvT )->nVdvPed
      nRegIva        := ( cPedPrvT )->nRegIva
      bCondition     := {|| ( cPedPrvL )->cSerPed + Str( ( cPedPrvL )->nNumPed ) + ( cPedPrvL )->cSufPed == cPedido .and. ( cPedPrvL )->( !eof() ) }
      ( cPedPrvL )->( dbSeek( cPedido ) )
   end if

   cPinDiv           := cPinDiv( cCodDiv, cDiv )
   cPirDiv           := cPirDiv( cCodDiv, cDiv )
   nDinDiv           := nDinDiv( cCodDiv, cDiv )
   nDirDiv           := nRinDiv( cCodDiv, cDiv )

   while Eval( bCondition )

      if lValLine( cPedPrvL )

         /*
         Importes de lineas
         */

         nTotArt           := nTotLPedPrv( cPedPrvL, nDinDiv, nDirDiv )
         if nTotArt != 0

            /*
            Estudio de impuestos
            */

            do case
            case _NPCTIVA1 == NIL .OR. _NPCTIVA1 == ( cPedPrvL )->nIva
               _NPCTIVA1   := (cPedPrvL)->NIVA
               _NPCTREQ1   := (cPedPrvL)->NREQ
               _NBRTIVA1   += nTotArt

            case _NPCTIVA2 == NIL .OR. _NPCTIVA2 == ( cPedPrvL )->nIva
               _NPCTIVA2   := (cPedPrvL)->NIVA
               _NPCTREQ2   := (cPedPrvL)->NREQ
               _NBRTIVA2   += nTotArt

            case _NPCTIVA3 == NIL .OR. _NPCTIVA3 == ( cPedPrvL )->nIva
               _NPCTIVA3   := (cPedPrvL)->NIVA
               _NPCTREQ3   := (cPedPrvL)->NREQ
               _NBRTIVA3   += nTotArt
            end case

         end if

      end if

      ( cPedPrvL )->( dbSkip() )

   end while

   ( cPedPrvL )->( dbGoTo( nRec ) )

      /*
   Obtenemos el total bruto----------------------------------------------------
      */

   nTotBrt           := _NBRTIVA1 + _NBRTIVA2 + _NBRTIVA3

      /*
   Portes de la Factura--------------------------------------------------------
      */

   nTotBrt           += nPorte

   _NBASIVA1         := _NBRTIVA1
   _NBASIVA2         := _NBRTIVA2
   _NBASIVA3         := _NBRTIVA3

      /*
      Descuentos de la Facturas
      */

      IF nDtoEsp != 0

      aTotDto[1]     := Round( _NBASIVA1 * nDtoEsp / 100, nDirDiv )
      aTotDto[2]     := Round( _NBASIVA2 * nDtoEsp / 100, nDirDiv )
      aTotDto[3]     := Round( _NBASIVA3 * nDtoEsp / 100, nDirDiv )

      nTotDto        := aTotDto[1] + aTotDto[2] + aTotDto[3]

      _NBASIVA1      -= aTotDto[1]
      _NBASIVA2      -= aTotDto[2]
      _NBASIVA3      -= aTotDto[3]

   END IF

      IF nDtoPP != 0

      aTotDPP[1]     := Round( _NBASIVA1 * nDtoPP / 100, nDirDiv )
      aTotDPP[2]     := Round( _NBASIVA2 * nDtoPP / 100, nDirDiv )
      aTotDPP[3]     := Round( _NBASIVA3 * nDtoPP / 100, nDirDiv )

      nTotDPP        := aTotDPP[1] + aTotDPP[2] + aTotDPP[3]

      _NBASIVA1      -= aTotDPP[1]
      _NBASIVA2      -= aTotDPP[2]
      _NBASIVA3      -= aTotDPP[3]

   END IF

   IF nDtoUno != 0

      aTotUno[1]     := Round( _NBASIVA1 * nDtoUno / 100, nDirDiv )
      aTotUno[2]     := Round( _NBASIVA2 * nDtoUno / 100, nDirDiv )
      aTotUno[3]     := Round( _NBASIVA3 * nDtoUno / 100, nDirDiv )

      nTotUno        := aTotDPP[1] + aTotDPP[2] + aTotDPP[3]

      _NBASIVA1      -= aTotUno[1]
      _NBASIVA2      -= aTotUno[2]
      _NBASIVA3      -= aTotUno[3]

      END IF

      IF nDtoDos != 0

      aTotDos[1]     := Round( _NBASIVA1 * nDtoDos / 100, nDirDiv )
      aTotDos[2]     := Round( _NBASIVA2 * nDtoDos / 100, nDirDiv )
      aTotDos[3]     := Round( _NBASIVA3 * nDtoDos / 100, nDirDiv )

      nTotDos        := aTotDPP[1] + aTotDPP[2] + aTotDPP[3]

      _NBASIVA1      -= aTotDos[1]
      _NBASIVA2      -= aTotDos[2]
      _NBASIVA3      -= aTotDos[3]

      END IF

   nTotNet           := Round( _NBASIVA1 + _NBASIVA2 + _NBASIVA3, nDirDiv )

      /*
   Calculos de impuestos
      */

   if nRegIva <= 1

      _NIMPIVA1      := if( _NPCTIVA1 != NIL, Round( _NBASIVA1 * _NPCTIVA1 / 100, nDirDiv ), 0 )
      _NIMPIVA2      := if( _NPCTIVA2 != NIL, Round( _NBASIVA2 * _NPCTIVA2 / 100, nDirDiv ), 0 )
      _NIMPIVA3      := if( _NPCTIVA3 != NIL, Round( _NBASIVA3 * _NPCTIVA3 / 100, nDirDiv ), 0 )

      /*
      Calculo de recargo
      */

      if lRecargo
         _NIMPREQ1   := if( _NPCTIVA1 != NIL, Round( _NBASIVA1 * _NPCTREQ1 / 100, nDirDiv ), 0 )
         _NIMPREQ2   := if( _NPCTIVA2 != NIL, Round( _NBASIVA2 * _NPCTREQ2 / 100, nDirDiv ), 0 )
         _NIMPREQ3   := if( _NPCTIVA3 != NIL, Round( _NBASIVA3 * _NPCTREQ3 / 100, nDirDiv ), 0 )
      end if

   end if

   /*
   Total impuestos
   */

   nTotIva           := Round( _NIMPIVA1 + _NIMPIVA2 + _NIMPIVA3, nDirDiv )

      /*
   Total de R.E.
      */

   nTotReq           := Round( _NIMPREQ1 + _NIMPREQ2 + _NIMPREQ3, nDirDiv )

   /*
      Total de impuestos
      */

   nTotImp           := Round( nTotIva + nTotReq, nDirDiv )

      /*
      Total facturas
      */

   nTotPed           := nTotNet + nTotImp

      /*
      Refrescos en Pantalla______________________________________________________
      */

   aTotIva           := aSort( aTotIva,,, {|x,y| abs( x[1] ) > abs( y[1] ) } )

   /*
   Solicitan una divisa distinta a la q se hizo originalmente la factura
   */

   if cDivRet != nil .and. cDivRet != cCodDiv
      nTotNet        := nCnv2Div( nTotNet, cCodDiv, cDivRet )
      nTotIva        := nCnv2Div( nTotIva, cCodDiv, cDivRet )
      nTotReq        := nCnv2Div( nTotReq, cCodDiv, cDivRet )
      nTotPed        := nCnv2Div( nTotPed, cCodDiv, cDivRet )
      cPirDiv        := cPirDiv( cDivRet, cDiv )
   end if

RETURN ( if( lPic, Trans( nTotPed, cPirDiv ), nTotPed ) ) //

//--------------------------------------------------------------------------//

FUNCTION aTotPedPrv( cFactura, cPedPrvT, dbfLine, cIva, cDiv, cDivRet )

   nTotPedPrv( cFactura, cPedPrvT, dbfLine, cIva, cDiv, nil, cDivRet, .f. )

RETURN ( { nTotNet, nTotIva, nTotReq, nTotPed, aTotIva } )

//---------------------------------------------------------------------------//

Function sTotPedPrv( cPedido, dbfMaster, dbfLine, cIva, cDiv, cDivRet )

   local sTotal

   nTotPedPrv( cPedido, dbfMaster, dbfLine, cIva, cDiv, nil, cDivRet, .f. )

   sTotal                                 := sTotal()
   sTotal:nTotalBruto                     := nTotBrt
   sTotal:nTotalNeto                      := nTotNet
   sTotal:nTotalIva                       := nTotIva
   sTotal:aTotalIva                       := aTotIva
   sTotal:nTotalRecargoEquivalencia       := nTotReq
   sTotal:nTotalDocumento                 := nTotPed
   sTotal:nTotalDescuentoGeneral          := nTotDto
   sTotal:nTotalDescuentoProntoPago       := nTotDpp
   sTotal:nTotalDescuentoUno              := nTotUno
   sTotal:nTotalDescuentoDos              := nTotDos

Return ( sTotal )

//--------------------------------------------------------------------------//

FUNCTION BrwPedPrv( oGetNum, cPedPrvT, cPedPrvL, cIva, cDiv, cFPago )

   local oDlg
   local oBrw
   local oGet1
   local cGet1
   local nOrd     := GetBrwOpt( "BrwPedPrv" )
   local oCbxOrd
   local aCbxOrd  := { "N�mero", "Fecha", "C�digo", "Nombre" }
   local cCbxOrd
   local aDbfBmp  := {  LoadBitmap( GetResources(), "bRed"   ),;
                        LoadBitmap( GetResources(), "bYelow" ),;
                        LoadBitmap( GetResources(), "bGreen" ) }

   nOrd           := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd        := aCbxOrd[ nOrd ]

   ( cPedPrvT )->( dbSetFilter( {|| Field->nEstado != 3 }, "nEstado != 3" ) )

   nOrd           := ( cPedPrvT )->( OrdSetFocus( nOrd ) )

   DEFINE DIALOG oDlg RESOURCE "HELPENTRY" TITLE "Pedido a proveedores"

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, cPedPrvT, .t., nil, .f. ) );
         VALID    ( OrdClearScope( oBrw, cPedPrvT ) );
         BITMAP   "FIND" ;
         OF       oDlg

      REDEFINE COMBOBOX oCbxOrd ;
         VAR       cCbxOrd ;
         ID        102 ;
         ITEMS     aCbxOrd ;
         ON CHANGE ( ( cPedPrvT )->( OrdSetFocus( oCbxOrd:nAt ) ), oBrw:refresh(), oGet1:SetFocus() ) ;
         OF        oDlg

      oBrw                 := IXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := cPedPrvT
      oBrw:nMarqueeStyle   := 5
      oBrw:cName           := "Pedido a proveedor.Browse"

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

      oBrw:CreateFromResource( 105 )

      with object ( oBrw:AddCol() )
         :cHeader          := "Es. Estado"
         :bStrData         := {|| "" }
         :bBmpData         := {|| ( cPedPrvT )->nEstado }
         :nWidth           := 20
         :AddResource( "Bullet_Square_Red_16" )
         :AddResource( "Bullet_Square_Yellow_16" )
         :AddResource( "Bullet_Square_Green_16" )
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "N�mero" 
         :cSortOrder       := "nNumPed"
         :bEditValue       := {|| ( cPedPrvT )->cSerPed + "/" + Str( ( cPedPrvT )->nNumPed ) + "/" + ( cPedPrvT )->cSufPed }
         :nWidth           := 60
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Fecha"
         :cSortOrder       := "dFecPed"
         :bEditValue       := {|| dToc( ( cPedPrvT )->dFecPed ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodPrv"
         :bEditValue       := {|| Rtrim( ( cPedPrvT )->cCodPrv ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cNomPrv"
         :bEditValue       := {|| Rtrim( ( cPedPrvT )->cNomPrv ) }
         :nWidth           := 400
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Total"
         :bEditValue       := {|| ( cPedPrvT )->nTotPed }
         :cEditPicture     := cPirDiv()
         :nWidth           := 120
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( oDlg:end( IDOK ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         ACTION   ( oDlg:end() )

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     .f.

      REDEFINE BUTTON ;
         ID       501 ;
         OF       oDlg ;
         WHEN     .f.

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   oDlg:bStart    := {|| oBrw:Load() }

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK
      oGetNum:cText( ( cPedPrvT )->cSerPed + Str( ( cPedPrvT )->nNumPed ) + ( cPedPrvT )->cSufPed )
      oGetNum:Disable()
   end if

   DestroyFastFilter( cPedPrvT )

   SetBrwOpt( "BrwPedPrv", ( cPedPrvT )->( OrdNumber() ) )

   ( cPedPrvT )->( dbSetFilter() )
   ( cPedPrvT )->( OrdSetFocus( nOrd ) )

   AEval( aDbfBmp, { | hBmp | DeleteObject( hBmp ) } )

   /*
   Guardamos los datos del browse
   */
   
   oBrw:CloseData()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

FUNCTION ChgPedPrv( nPedido, nMode, cPedPrvT )

   local oBlock
   local oError
   local lExito   := .t.
   local lClose   := .f.

   if nMode != APPD_MODE .OR. Empty( nPedido )
      return nil
   end if

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( cPedPrvT )
      USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @cPedPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   if ( cPedPrvT )->( dbSeek( nPedido ) )
      if dbDialogLock( cPedPrvT )
         ( cPedPrvT )->nEstado    := 1
      end if
   else
      lExito      := .f.
   end if

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( cPedPrvT )
   end if

RETURN lExito

//-------------------------------------------------------------------------//

FUNCTION nTotEPedPrv( uTmp )

   local nCalculo := 0

   do case
   case ValType( uTmp ) == "C"
      nCalculo    := NotCaja( (uTmp)->nCanEnt ) * (uTmp)->nUniEnt
   case ValType( uTmp ) == "O"
      nCalculo    := NotCaja( uTmp:nCanEnt ) * uTmp:nUniEnt
   case ValType( uTmp ) == "A"
      nCalculo    := NotCaja( uTmp[ _NCANENT ] * uTmp[ _NUNIENT ] )
   end case

RETURN ( nCalculo )

//---------------------------------------------------------------------------//

FUNCTION nTotNPedPrv( uTmp )

   local nCalculo := 0

   DEFAULT uTmp   := TDataView():PedidosProveedoresLineas( nView )

   do case
   case ValType( uTmp ) == "C"
      nCalculo    := ( uTmp )->nUniCaja
      nCalculo    *= NotCaja( ( uTmp )->nCanPed )
      nCalculo    *= NotCero( ( uTmp )->nUndKit )
      nCalculo    *= NotCero( ( uTmp )->nMedUno )
      nCalculo    *= NotCero( ( uTmp )->nMedDos )
      nCalculo    *= NotCero( ( uTmp )->nMedTre )

   case ValType( uTmp ) == "O"
      nCalculo    := uTmp:nUniCaja
      nCalculo    *= NotCaja( uTmp:nCanPed )
      nCalculo    *= NotCero( uTmp:nUndKit )
      nCalculo    *= NotCero( uTmp:nMedUno )
      nCalculo    *= NotCero( uTmp:nMedDos )
      nCalculo    *= NotCero( uTmp:nMedTre )

   case ValType( uTmp ) == "A"
      nCalculo    := uTmp[ _NUNICAJA ]
      nCalculo    *= NotCaja( uTmp[ _NCANPED ] )
      nCalculo    *= NotCero( uTmp[ _NUNDKIT ] )
      nCalculo    *= NotCero( uTmp[ _NMEDUNO ] )
      nCalculo    *= NotCero( uTmp[ _NMEDDOS ] )
      nCalculo    *= NotCero( uTmp[ _NMEDTRE ] )

   end case

RETURN ( nCalculo )

//---------------------------------------------------------------------------//
//Total de una linea con impuestos incluidos

FUNCTION nTotFPedPrv( cPedPrvL, nDec, nRou, nVdv, lDto, lPntVer, lImpTrn, cPorDiv )

   local nCalculo := 0

   nCalculo       += nTotLPedPrv( cPedPrvL, nDec, nRou, nVdv, lDto, lPntVer, lImpTrn )
   nCalculo       += nIvaLPedPrv( cPedPrvL, nDec, nRou, nVdv, lDto, lPntVer, lImpTrn )

return ( if( cPorDiv != nil, Trans( nCalculo, cPorDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nTotUPedPrv( uTmp, nDec, nVdv )

   local nCalculo := 0

   DEFAULT uTmp   := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec   := nDinDiv()
   DEFAULT nVdv   := 1

   do case
      case ValType( uTmp ) == "C"
         nCalculo := ( uTmp )->nPreDiv

      case ValType( uTmp ) == "O"
         nCalculo := uTmp:nPreDiv

      case ValType( uTmp ) == "A"
         nCalculo := uTmp[ _NPREDIV ]

   end case

   if nVdv != 0
      nCalculo    := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

FUNCTION nImpUPedPrv( uPedPrvT, uPedPrvL, nDec, nVdv, cPorDiv )

   local nCalculo       := 0

   DEFAULT uPedPrvT     := TDataView():PedidosProveedores( nView )
   DEFAULT uPedPrvL     := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec         := nDinDiv()
   DEFAULT nVdv         := 1

   nCalculo             := nTotUPedPrv( uPedPrvL, nDec, nVdv ) 

   if IsArray( uPedPrvT )

      nCalculo          -= Round( nCalculo * uPedPrvT[ _NDTOESP ]  / 100, nDec )
      nCalculo          -= Round( nCalculo * uPedPrvT[ _NDPP    ]  / 100, nDec )
      nCalculo          -= Round( nCalculo * uPedPrvT[ _NDTOUNO ]  / 100, nDec )
      nCalculo          -= Round( nCalculo * uPedPrvT[ _NDTODOS ]  / 100, nDec )
   
   else
   
      nCalculo          -= Round( nCalculo * ( uPedPrvT )->nDtoEsp / 100, nDec )
      nCalculo          -= Round( nCalculo * ( uPedPrvT )->nDpp    / 100, nDec )
      nCalculo          -= Round( nCalculo * ( uPedPrvT )->nDtoUno / 100, nDec )
      nCalculo          -= Round( nCalculo * ( uPedPrvT )->nDtoDos / 100, nDec )
   
   end if

Return ( if( cPorDiv != nil, Trans( nCalculo, cPorDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nIvaUPedPrv( uTmp, nDec, nVdv )

   local nCalculo

   DEFAULT uTmp   := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec   := nDinDiv()
   DEFAULT nVdv   := 1

   nCalculo       := nTotUPedPrv( uTmp, nDec, nVdv )
   nCalculo       := nCalculo * ( uTmp )->nIva / 100

   if nVdv != 0
      nCalculo    := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

FUNCTION nTotLPedPrv( uTmp, nDec, nRec, nVdv, cPouDiv )

   local nCalculo

   DEFAULT uTmp   := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec   := nDinDiv()
   DEFAULT nRec   := nRinDiv()
   DEFAULT nVdv   := 1

   // Precio ------------------------------------------------------------------

   nCalculo       := nTotUPedPrv( uTmp, nDec, nVdv )

   do case
      case ValType( uTmp ) == "C"

         if ( uTmp )->nDtoLin != 0
            nCalculo    -= nCalculo * ( uTmp )->nDtoLin / 100
         end if

         if ( uTmp )->nDtoPrm != 0
            nCalculo    -= nCalculo * ( uTmp )->nDtoPrm / 100
         end if

      case ValType( uTmp ) == "O"

         if uTmp:nDtoLin != 0
            nCalculo    -= nCalculo * uTmp:nDtoLin / 100
         end if

         if uTmp:nDtoPrm != 0
            nCalculo    -= nCalculo * uTmp:nDtoPrm / 100
         end if

   end case

   // Unidades

   nCalculo       *= nTotNPedPrv( uTmp )

   if nRec != nil
      nCalculo    := Round( nCalculo, nRec )
   end if

RETURN ( if( cPouDiv != NIL, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//
/*
Devuelve el importe de descuento porcentual por cada linea---------------------
*/

FUNCTION nDtoLPedPrv( cPedPrvL, nDec, nRou, nVdv )

   local nCalculo       := 0

   DEFAULT cPedPrvL     := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec         := nDouDiv()
   DEFAULT nRou         := nRouDiv()
   DEFAULT nVdv         := 1

   if ( cPedPrvL )->nDtoLin != 0 

      nCalculo          := nTotUPedPrv( cPedPrvL, nDec ) * nTotNPedPrv( cPedPrvL )

      /*
      Descuentos---------------------------------------------------------------
      */

      nCalculo          := nCalculo * ( cPedPrvL )->nDtoLin / 100


      if nVdv != 0
         nCalculo       := nCalculo / nVdv
      end if

      if nRou != nil
         nCalculo       := Round( nCalculo, nRou )
      end if

   end if

RETURN ( nCalculo ) 

//---------------------------------------------------------------------------//
/*
Devuelve el importe de descuento porcentual en promociones por cada linea------
*/

FUNCTION nPrmLPedPrv( cPedPrvL, nDec, nRou, nVdv )

   local nCalculo       := 0

   DEFAULT cPedPrvL     := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec         := nDouDiv()
   DEFAULT nRou         := nRouDiv()
   DEFAULT nVdv         := 1

   if ( cPedPrvL )->nDtoPrm != 0 

      nCalculo          := nTotUPedPrv( cPedPrvL, nDec ) * nTotNPedPrv( cPedPrvL )

      /*
      Descuentos---------------------------------------------------------------
      */

      if ( cPedPrvL )->nDtoLin != 0 
         nCalculo       -= nCalculo * ( cPedPrvL )->nDtoLin / 100
      end if

      nCalculo          := nCalculo * ( cPedPrvL )->nDtoPrm / 100

      if nVdv != 0
         nCalculo       := nCalculo / nVdv
      end if

      if nRou != nil
         nCalculo       := Round( nCalculo, nRou )
      end if

   end if

RETURN ( nCalculo ) 

//---------------------------------------------------------------------------//

FUNCTION nIvaLPedPrv( uPedPrvL, nDec, nRec, nVdv, cPouDiv )

   local nCalculo

   DEFAULT uPedPrvL  := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec      := nDinDiv()
   DEFAULT nRec      := nRinDiv()
   DEFAULT nVdv      := 1

   nCalculo          := nTotLPedPrv( uPedPrvL, nDec, nRec, nVdv, cPouDiv )

   nCalculo          := Round( nCalculo * ( uPedPrvL )->nIva / 100, nRec )

RETURN ( if( cPouDiv != NIL, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nImpLPedPrv( uPedPrvT, uPedPrvL, nDec, nRec, nVdv, lIva, cPouDiv )

   local nCalculo

   DEFAULT uPedPrvT  := TDataView():PedidosProveedores( nView )
   DEFAULT uPedPrvL  := TDataView():PedidosProveedoresLineas( nView )
   DEFAULT nDec      := nDinDiv()
   DEFAULT nRec      := nRinDiv()
   DEFAULT nVdv      := 1
   DEFAULT lIva      := .f.

   nCalculo          := nTotLPedPrv( uPedPrvL, nDec, nRec, nVdv )

   if ValType( uPedPrvT ) == "A"
      nCalculo    -= Round( nCalculo * uPedPrvT[ _NDTOESP ]  / 100, nRec )
      nCalculo    -= Round( nCalculo * uPedPrvT[ _NDPP    ]  / 100, nRec )
      nCalculo    -= Round( nCalculo * uPedPrvT[ _NDTOUNO ]  / 100, nRec )
      nCalculo    -= Round( nCalculo * uPedPrvT[ _NDTODOS ]  / 100, nRec )
   else
      nCalculo    -= Round( nCalculo * ( uPedPrvT )->nDtoEsp / 100, nRec )
      nCalculo    -= Round( nCalculo * ( uPedPrvT )->nDpp    / 100, nRec )
      nCalculo    -= Round( nCalculo * ( uPedPrvT )->nDtoUno / 100, nRec )
      nCalculo    -= Round( nCalculo * ( uPedPrvT )->nDtoDos / 100, nRec )
   end if

   if lIva .and. ( TDataView():PedidosProveedoresLineas( nView ) )->nIva != 0
      nCalculo    += nCalculo * ( uPedPrvL )->nIva / 100
   end if

RETURN ( if( cPouDiv != NIL, Trans( nCalculo, cPouDiv ), nCalculo ) )

//----------------------------------------------------------------------------//

FUNCTION nBrtLPedPrv( uTmpLin, nDec, nRec, nVdv, cPorDiv )

   local nCalculo    := 0

   DEFAULT nDec      := 2
   DEFAULT nVdv      := 1

   nCalculo          := nTotUPedPrv( uTmpLin, nDec, nVdv, cPorDiv )
   nCalculo          *= nTotNPedPrv( uTmpLin )

   nCalculo          := Round( nCalculo / nVdv, nRec )

Return ( if( cPorDiv != nil, Trans( nCalculo, cPorDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION mkPedPrv( cPath, lAppend, cPathOld, oMeter, bFor )

   local oldPedPrvT
   local oldPedPrvL
   local oldPedPrvI
   local oldPedPrvD

   DEFAULT lAppend   := .f.
   DEFAULT bFor      := {|| .t. }

   if oMeter != NIL
      oMeter:cText   := "Generando bases"
      SysRefresh()
   end if

   CreateFiles( cPath )

   rxPedPrv( cPath, oMeter )

   IF lAppend .and. lIsDir( cPathOld )

      dbUseArea( .t., cDriver(), cPath + "PedPROVT.DBF", cCheckArea( "PedPROVT", @dbfPedPrvT ), .f. )
      if !( dbfPedPrvT )->( neterr() )
            ordListAdd( cPath + "PedPROVT.CDX"  )
      end if

      dbUseArea( .t., cDriver(), cPath + "PedPROVL.DBF", cCheckArea( "PedPROVL", @dbfPedPrvL ), .f. )
      if !( dbfPedPrvL )->( neterr() )
            ordListAdd( cPath + "PedPROVL.CDX"  )
      end if

      dbUseArea( .t., cDriver(), cPath + "PedPrvI.Dbf", cCheckArea( "PedPrvI", @dbfPedPrvI ), .f. )
      if !( dbfPedPrvI )->( neterr() )
            ( dbfPedPrvI )->( ordListAdd( cPath + "PedPrvI.Cdx" ) )
      end if

      dbUseArea( .t., cDriver(), cPath + "PedPrvD.Dbf", cCheckArea( "PedPrvD", @dbfPedPrvD ), .f. )
      if !( dbfPedPrvD)->( neterr() )
            ( dbfPedPrvD )->( ordListAdd( cPath + "PedPrvD.Cdx" ) )
      end if

      dbUseArea( .t., cDriver(), cPathOld + "PEDPROVT.DBF", cCheckArea( "PEDPROVT", @oldPedPrvT ), .f. )
      if !( oldPedPrvT )->( neterr() )
            ordListAdd( cPathOld + "PEDPROVT.CDX"  )
      end if

       dbUseArea( .t., cDriver(), cPathOld + "PEDPROVL.DBF", cCheckArea( "PEDPROVL", @oldPedPrvL ), .f. )
      if !( oldPedPrvL )->( neterr() )
            ordListAdd( cPathOld + "PEDPROVL.CDX"  )
      end if

      dbUseArea( .t., cDriver(), cPathOld + "PEDPRVI.DBF", cCheckArea( "PEDPRVI", @oldPedPrvI ), .f. )
      if !( oldPedPrvI )->( neterr() )
            ( oldPedPrvI )->( ordListAdd( cPathOld + "PEDPRVI.CDX" ) )
      end if

      dbUseArea( .t., cDriver(), cPathOld + "PEDPRVD.DBF", cCheckArea( "PEDPRVD", @oldPedPrvD ), .f. )
      if !( dbfPedPrvD)->( neterr() )
            ( oldPedPrvD )->( ordListAdd( cPathOld + "PEDPRVD.CDX" ) )
      end if

      while !( oldPedPrvT )->( eof() )

         if eval( bFor, oldPedPrvT )
            dbCopy( oldPedPrvT, dbfPedPrvT, .t. )

            if ( dbfPedPrvT )->( dbRLock() )
               ( dbfPedPrvT )->cTurPed    := Padl( "1", 6 )
               ( dbfPedPrvT )->( dbRUnlock() )
            end if

            if ( oldPedPrvL )->( dbSeek( (oldPedPrvT)->CSERPED + Str( (oldPedPrvT)->nNumPed ) + (oldPedPrvT)->cSufPed ) )
               while (oldPedPrvT)->CSERPED + Str( (oldPedPrvL)->nNumPed ) + (oldPedPrvL)->cSufPed == (oldPedPrvT)->CSERPED + Str( (dbfPedPrvT)->nNumPed ) + (dbfPedPrvT)->cSufPed .and. !(oldPedPrvL)->( eof() )
                  dbCopy( oldPedPrvL, dbfPedPrvL, .t. )
                  ( oldPedPrvL )->( dbSkip() )
               end while
            end if

            if ( oldPedPrvI )->( dbSeek( ( oldPedPrvT )->cSerPed + Str( ( oldPedPrvT )->nNumPed ) + ( oldPedPrvT )->cSufPed ) )
               while ( oldPedPrvI )->cSerPed + Str( ( oldPedPrvI )->nNumPed ) + ( oldPedPrvI )->cSufPed == ( oldPedPrvT )->cSerPed + Str( ( oldPedPrvT )->nNumPed ) + ( oldPedPrvT )->cSufPed .and. !( oldPedPrvI )->( eof() )
                  dbCopy( oldPedPrvI, dbfPedPrvI, .t. )
                  ( oldPedPrvI )->( dbSkip() )
               end while
            end if

            if ( oldPedPrvD )->( dbSeek( ( oldPedPrvT )->cSerPed + Str( ( oldPedPrvT )->nNumPed ) + ( oldPedPrvT )->cSufPed ) )
               while ( oldPedPrvD )->cSerPed + Str( ( oldPedPrvD )->nNumPed ) + ( oldPedPrvD )->cSufPed == ( oldPedPrvT )->cSerPed + Str( ( oldPedPrvT )->nNumPed ) + ( oldPedPrvT )->cSufPed .and. !( oldPedPrvD )->( eof() )
                  dbCopy( oldPedPrvD, dbfPedPrvD, .t. )
                  ( oldPedPrvD )->( dbSkip() )
               end while
            end if

         end if

         ( oldPedPrvT )->( dbSkip() )

      end while

      ( dbfPedPrvT )->( dbCloseArea() )
      ( dbfPedPrvL )->( dbCloseArea() )
      ( dbfPedPrvI )->( dbCloseArea() )
      ( dbfPedPrvD )->( dbCloseArea() )

      ( oldPedPrvT )->( dbCloseArea() )
      ( oldPedPrvL )->( dbCloseArea() )
      ( oldPedPrvI )->( dbCloseArea() )
      ( oldPedPrvD )->( dbCloseArea() )

   end if

Return nil

//--------------------------------------------------------------------------//

FUNCTION rxPedPrv( cPath, oMeter )

      local cPedPrvT

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "PEDPROVT.DBF" ) .or. ;
      !lExistTable( cPath + "PEDPROVL.DBF" ) .or. ;
      !lExistTable( cPath + "PEDPRVI.DBF" )  .or. ;
      !lExistTable( cPath + "PEDPRVD.DBF" )
      CreateFiles( cPath )
   end if

      /*
      Eliminamos los indices
      */

   fEraseIndex( cPath + "PEDPROVT.CDX" )
   fEraseIndex( cPath + "PEDPROVL.CDX" )
   fEraseIndex( cPath + "PEDPRVI.CDX" )
   fEraseIndex( cPath + "PEDPRVD.CDX" )

   dbUseArea( .t., cDriver(), cPath + "PEDPROVT.DBF", cCheckArea( "PEDPROVT", @cPedPrvT ), .f. )
   if !( cPedPrvT )->( neterr() )
      ( cPedPrvT)->( __dbPack() )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "NNUMPED", "CSERPED + STR( NNUMPED ) + CSUFPED", {|| Field->CSERPED + STR( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "DFECPED", "DFECPED", {|| Field->DFECPED } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "DFECENT", "DFECENT", {|| Field->DFECENT } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "CCODPRV", "CCODPRV", {|| Field->CCODPRV } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "CNOMPRV", "Upper( CNOMPRV )", {|| Upper( Field->CNOMPRV ) } ) )


      /*
      Ordenes fechados---------------------------------------------------------
      */

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "nNumPedYea", "Str( Year( dFecPed ) ) + CSERPED + STR( NNUMPED ) + CSUFPED", {|| Str( Year( Field->dFecPed ) ) + Field->CSERPED + STR( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "dFecPedYea", "Str( Year( dFecPed ) ) + Dtoc( DFECPED )", {|| Str( Year( Field->dFecPed ) ) + Dtoc( Field->DFECPED ) } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "dFecEntYea", "Str( Year( dFecPed ) ) + Dtoc( DFECENT )", {|| Str( Year( Field->dFecPed ) ) + Dtoc( Field->DFECENT ) } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "cCodPrvYea", "Str( Year( dFecPed ) ) + CCODPRV", {|| Str( Year( Field->dFecPed ) ) + Field->CCODPRV } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "cNomPrvYea", "Str( Year( dFecPed ) ) + Upper( CNOMPRV )", {|| Str( Year( Field->dFecPed ) ) + Upper( Field->CNOMPRV ) } ) )

      /*
      Otros ordenes------------------------------------------------------------
      */

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "NESTADO", "NESTADO", {|| Field->NESTADO } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PedProvT.CDX", "cTurPed", "cTurPed + cSufPed + cCodCaj", {|| Field->cTurPed + Field->cSufPed + Field->cCodCaj } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PedProvT.Cdx", "cPedCli", "cNumPedCli", {|| Field->cNumPedCli } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PedProvT.Cdx", "cCodUsr", "cCodUsr + Dtos( dFecChg ) + cTimChg", {|| Field->cCodUsr + Dtos( Field->dFecChg ) + Field->cTimChg } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PedProvT.Cdx", "cNumAlb", "cNumAlb", {|| Field->cNumAlb } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVT.CDX", "iNumPed", "'01' + CSERPED + STR( NNUMPED ) + CSUFPED", {|| '01' + Field->CSERPED + STR( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de pedidos de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "PEDPROVL.DBF", cCheckArea( "PEDPROVL", @cPedPrvT ), .f. )
   if !( cPedPrvT )->( neterr() )
      ( cPedPrvT)->( __dbPack() )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "nNumPed", "cSerPed + Str( nNumPed ) + cSufPed", {|| Field->cSerPed + Str( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "cRef", "cRef", {|| Field->cRef }, ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "Lote", "cLote", {|| Field->cLote }, ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "cRefLote", "cRef + cLote", {|| Field->cRef + Field->cLote } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "cPedCliRef", "cPedCli + cRef + cValPr1 + cValPr2", {|| Field->cPedCli + Field->cRef + Field->cValPr1 + Field->cValPr2 } ) )

      ( cPedPrvT)->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT)->( ordCreate( cPath + "PEDPROVL.CDX", "cPedCliDet", "cPedCli + cRef + cValPr1 + cValPr2 + cRefPrv ", {|| Field->cPedCli + Field->cRef + Field->cValPr1 + Field->cValPr2 + Field->cRefPrv } ) ) // + cDetalle

      ( cPedPrvT )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
      ( cPedPrvT )->( ordCreate( cPath + "PedProvL.Cdx", "iNumPed", "'01' + cSerPed + Str( nNumPed ) + cSufPed", {|| '01' + Field->cSerPed + Str( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de pedidos de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "PedPrvI.DBF", cCheckArea( "PedPrvI", @cPedPrvT ), .f. )
   if !( cPedPrvT )->( neterr() )
      ( cPedPrvT )->( __dbPack() )

      ( cPedPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT )->( ordCreate( cPath + "PedPrvI.CDX", "NNUMPED", "CSERPED + STR( NNUMPED ) + CSUFPED", {|| Field->CSERPED + STR( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de pedidos de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "PedPrvD.DBF", cCheckArea( "PedPrvD", @cPedPrvT ), .f. )
   if !( cPedPrvT )->( neterr() )
      ( cPedPrvT )->( __dbPack() )

      ( cPedPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( cPedPrvT )->( ordCreate( cPath + "PedPrvD.CDX", "NNUMPED", "CSERPED + STR( NNUMPED ) + CSUFPED", {|| Field->CSERPED + STR( Field->nNumPed ) + Field->cSufPed } ) )

      ( cPedPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de pedidos de proveedores" )
   end if

Return nil

//--------------------------------------------------------------------------//

function aIncPedPrv()

   local aIncPedPrv  := {}

   aAdd( aIncPedPrv, { "cSerPed", "C",    1,  0, "Serie de pedido" ,                 "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "nNumPed", "N",    9,  0, "N�mero de pedido" ,                "'999999999'",        "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "cSufPed", "C",    2,  0, "Sufijo de pedido" ,                "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "cCodTip", "C",    3,  0, "Tipo de incidencia" ,              "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "dFecInc", "D",    8,  0, "Fecha de la incidencia" ,          "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "mDesInc", "M",   10,  0, "Descripci�n de la incidencia" ,    "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "lListo",  "L",    1,  0, "L�gico de listo" ,                 "",                   "", "( cDbfCol )" } )
   aAdd( aIncPedPrv, { "lAviso",  "L",    1,  0, "L�gico de Aviso" ,                 "",                   "", "( cDbfCol )" } )

return ( aIncPedPrv )

//---------------------------------------------------------------------------//

function aPedPrvDoc()

   local aPedPrvDoc  := {}

   aAdd( aPedPrvDoc, { "cSerPed", "C",    1,  0, "Serie de pedido" ,                 "",                   "", "( cDbfCol )" } )
   aAdd( aPedPrvDoc, { "nNumPed", "N",    9,  0, "N�mero de pedido" ,                "'999999999'",        "", "( cDbfCol )" } )
   aAdd( aPedPrvDoc, { "cSufPed", "C",    2,  0, "Sufijo de pedido" ,                "",                   "", "( cDbfCol )" } )
   aAdd( aPedPrvDoc, { "cNombre", "C",  250,  0, "Nombre del documento" ,            "",                   "", "( cDbfCol )" } )
   aAdd( aPedPrvDoc, { "cRuta",   "M",   10,  0, "Ruta del documento" ,              "",                   "", "( cDbfCol )" } )
   aAdd( aPedPrvDoc, { "mObsDoc", "M",   10,  0, "Observaciones del documento" ,     "",                   "", "( cDbfCol )" } )

return ( aPedPrvDoc )

//---------------------------------------------------------------------------//

FUNCTION lSnd( oWndBrw, dbf )

   local nRecAct
   local nRecOld           := ( dbf )->( Recno() )

   for each nRecAct in ( oWndBrw:oBrw:aSelected )

      ( dbf )->( dbGoTo( nRecAct ) )

      if dbDialogLock( dbf )

         ( dbf )->lSndDoc  := !( dbf )->lSndDoc

         ( dbf )->( dbUnlock() )

      end if

   next

   ( dbf )->( dbGoTo( nRecOld ) )

    oWndBrw:Refresh()

    oWndBrw:SetFocus()

Return nil

//---------------------------------------------------------------------------//

Function AppPedPrv( cCodPrv, cCodArt, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_APPD ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv( nil, nil, cCodPrv, cCodArt )
         oWndBrw:RecAdd()
      end if

   else

      if OpenFiles( .t. )
         WinAppRec( nil, bEdtRec, TDataView():PedidosProveedores( nView ), cCodPrv, cCodArt )
         CloseFiles()
      end if

   end if

RETURN .t.

//----------------------------------------------------------------------------//

FUNCTION EdtPedPrv( nNumPed, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv()
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            oWndBrw:RecEdit()
         else
            MsgStop( "No se encuentra pedido" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            WinEdtRec( nil, bEdtRec, TDataView():PedidosProveedores( nView ) )
         else
            MsgStop( "No se encuentra pedido" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//----------------------------------------------------------------------------//

FUNCTION ZooPedPrv( nNumPed, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv()
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            oWndBrw:RecZoom()
         else
            MsgStop( "No se encuentra pedido" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            WinZooRec( nil, bEdtRec, TDataView():PedidosProveedores( nView ) )
         else
            MsgStop( "No se encuentra pedido" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//----------------------------------------------------------------------------//

FUNCTION DelPedPrv( nNumPed, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv()
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            WinDelRec( nil, TDataView():PedidosProveedores( nView ), {|| QuiPedPrv() } )
         else
            MsgStop( "No se encuentra pedido" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            WinDelRec( nil, TDataView():PedidosProveedores( nView ), {|| QuiPedPrv() } )
         else
            MsgStop( "No se encuentra pedido" )
         end if
         CloseFiles()
      end if

   end if

Return nil

//----------------------------------------------------------------------------//

FUNCTION PrnPedPrv( nNumPed, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv()
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            GenPedPrv( IS_PRINTER )
         else
            MsgStop( "No se encuentra pedido" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            GenPedPrv( IS_PRINTER )
         else
            MsgStop( "No se encuentra pedido" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION VisPedPrv( nNumPed, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if PedPrv()
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            GenPedPrv( IS_SCREEN )
         else
            MsgStop( "No se encuentra pedido" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumPed, "nNumPed", TDataView():PedidosProveedores( nView ) )
            GenPedPrv( IS_SCREEN )
         else
            MsgStop( "No se encuentra pedido" )
         end if
         CloseFiles()
      end if

   end if

Return nil

//---------------------------------------------------------------------------//

function nVtaPedPrv( cCodPrv, dDesde, dHasta, cPedPrvT, cPedPrvL, cIva, cDiv )

   local nCon     := 0
   local nRec     := ( cPedPrvT )->( Recno() )

   /*
   Facturas a Clientes -------------------------------------------------------
   */

   if ( cPedPrvT )->( dbSeek( cCodPrv ) )

      while ( cPedPrvT )->cCodPrv == cCodPrv .and. !( cPedPrvT )->( Eof() )

         if ( dDesde == nil .or. ( cPedPrvT )->dFecPed >= dDesde )    .and.;
            ( dHasta == nil .or. ( cPedPrvT )->dFecPed <= dHasta )

            nCon  += nTotPedPrv( ( cPedPrvT )->cSerPed + Str( ( cPedPrvT )->nNumPed ) + ( cPedPrvT )->cSufPed, cPedPrvT, cPedPrvL, cIva, cDiv, nil, cDivEmp(), .f. )

         end if

         ( cPedPrvT )->( dbSkip() )

      end while

   end if

   ( cPedPrvT )->( dbGoTo( nRec ) )

return nCon

//----------------------------------------------------------------------------//

FUNCTION aDocPedPrv( dbfDocFld, dbfDocCol )

   local aDoc  := {}

   /*
   Itmes-----------------------------------------------------------------------
   */

   aAdd( aDoc, { "Empresa",         "EM" } )
   aAdd( aDoc, { "Pedido",          "PP" } )
   aAdd( aDoc, { "Proveedor",       "PR" } )
   aAdd( aDoc, { "Almacen",         "AL" } )
   aAdd( aDoc, { "Divisas",         "DV" } )
   aAdd( aDoc, { "Formas de pago",  "PG" } )

RETURN ( aDoc )

//---------------------------------------------------------------------------//

FUNCTION dFecPedPrv( cPedPrv, cPedPrvT )

   local dFecPed  := CtoD("")

   IF ( cPedPrvT )->( dbSeek( cPedPrv ) )
      dFecPed  := ( cPedPrvT )->dFecPed
   END IF

RETURN ( dFecPed )

//---------------------------------------------------------------------------//

FUNCTION nEstPedPrv( cPedPrv, cPedPrvT )

   local nEstPed  := 1

   IF ( cPedPrvT )->( dbSeek( cPedPrv ) )
      nEstPed     := ( cPedPrvT )->nEstado
   END IF

RETURN ( nEstPed )

//---------------------------------------------------------------------------//

FUNCTION cNbrPedPrv( cPedPrv, cPedPrvT )

   local cNomPrv  := ""

   IF ( cPedPrvT )->( dbSeek( cPedPrv ) )
      cNomPrv  := ( cPedPrvT )->cNomPrv
      END IF

RETURN ( cNomPrv )

//---------------------------------------------------------------------------//

function nTotDPedPrv( cCodArt, cPedPrvL, cPedPrvT, cCodAlm )

   local nTotVta  := 0
   local nRecno   := ( cPedPrvL )->( Recno() )

   if ( cPedPrvL )->( dbSeek( cCodArt ) )

      while ( cPedPrvL )->cRef == cCodArt .and. !( cPedPrvL )->( eof() )

        if cCodAlm != nil
           if cCodAlm == ( cPedPrvL )->cAlmLin
              nTotVta  += nTotNPedPrv( cPedPrvL )
           end if
        else
           nTotVta     += nTotNPedPrv( cPedPrvL )
        end if

        ( cPedPrvL )->( dbSkip() )

      end while

   end if

   ( cPedPrvL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//---------------------------------------------------------------------------//

function nTotVPedPrv( cCodArt, cPedPrvL, nDec, nDor )

   local nTotVta  := 0
   local nRecno   := ( cPedPrvL )->( Recno() )

   if ( cPedPrvL )->( dbSeek( cCodArt ) )

      while ( cPedPrvL )->CREF == cCodArt .and. !( cPedPrvL )->( eof() )

         nTotVta += nTotLPedPrv( cPedPrvL, nDec, nDor )

         ( cPedPrvL )->( dbSkip() )

      end while

   end if

   ( cPedPrvL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//---------------------------------------------------------------------------//

function aItmPedPrv()

   local aBase := {  { "cSerPed",   "C",  1,   0, "Serie del pedido",            "",                   "", "( cDbf )"},;
                     { "nNumPed",   "N",  9,   0, "N�mero del pedido",           "'999999999'",        "", "( cDbf )"},;
                     { "cSufPed",   "C",  2,   0, "Sufijo del pedido",           "",                   "", "( cDbf )"},;
                     { "cTurPed",   "C",  6,   0, "Sesi�n del pedido",           "",                   "", "( cDbf )"},;
                     { "dFecPed",   "D",  8,   0, "Fecha del pedido",            "",                   "", "( cDbf )"},;
                     { "cCodPrv",   "C", 12,   0, "Codigo del proveedor",        "",                   "", "( cDbf )"},;
                     { "cCodAlm",   "C", 16,   0, "C�digo de almacen",           "",                   "", "( cDbf )"},;
                     { "cCodCaj",   "C",  3,   0, "C�digo de caja",              "",                   "", "( cDbf )"},;
                     { "cNomPrv",   "C", 35,   0, "Nombre del proveedor",        "'@!'",               "", "( cDbf )"},;
                     { "cDirPrv",   "C", 35,   0, "Domicilio del proveedor",     "'@!'",               "", "( cDbf )"},;
                     { "cPobPrv",   "C", 25,   0, "Poblaci�n del proveedor",     "'@!'",               "", "( cDbf )"},;
                     { "cProPrv",   "C", 20,   0, "Provincia del proveedor",     "'@!'",               "", "( cDbf )"},;
                     { "cPosPrv",   "C",  5,   0, "C�digo postal del proveedor", "",                   "", "( cDbf )"},;
                     { "cDniPrv",   "C", 30,   0, "D.N.I. del proveedor",        "",                   "", "( cDbf )"},;
                     { "dFecEnt",   "D",  8,   0, "Fecha de entrada",            "",                   "", "( cDbf )"},;
                     { "nEstado",   "N",  1,   0, "Estado del pedido",           "",                   "", "( cDbf )"},;
                     { "cSuped",    "C", 10,   0, "Comentario su pedido",        "",                   "", "( cDbf )"},;
                     { "cCodPgo",   "C",  2,   0, "Codigo de la forma de pago",  "",                   "", "( cDbf )"},;
                     { "nBulTos",   "N",  3,   0, "N�mero de bultos",            "'999'",              "", "( cDbf )"},;
                     { "nPorTes",   "N",  6,   0, "Precio de los portes",        "cPirDivPed",         "", "( cDbf )"},;
                     { "cDtoEsp",   "C", 50,   0, "Descripci�n descuento especial","",                 "", "( cDbf )"},;
                     { "nDtoEsp",   "N",  5,   2, "Descuento factura",           "'@EZ 99.99'",        "", "( cDbf )"},;
                     { "cDpp",      "C", 50,   0, "Descripci�n descuento pronto pago","",              "", "( cDbf )"},;
                     { "nDpp",      "N",  5,   2, "Descuento pronto pago",       "'@EZ 99.99'",        "", "( cDbf )"},;
                     { "lRecargo",  "L",  1,   0, "Recargo de equivalencia",     "",                   "", "( cDbf )"},;
                     { "cCondEnt",  "C", 20,   0, "Comentarios del pedido",      "",                   "", "( cDbf )"},;
                     { "cExped",    "C", 20,   0, "Expedici�n",                  "",                   "", "( cDbf )"},;
                     { "cObserv",   "M", 10,   0, "Observaciones",               "",                   "", "( cDbf )"},;
                     { "cDivPed",   "C",  3,   0, "Codigo de divisa",            "",                   "", "( cDbf )"},;
                     { "nVdvPed",   "N", 10,   4, "Valor de la divisa",          "'@EZ 999,999.9999'", "", "( cDbf )"},;
                     { "lSndDoc",   "L",  1,   0, "Enviar documento",            "",                   "", "( cDbf )"},;
                     { "cDtoUno",   "C", 25,   0, "Descripci�n de primer descuento personalizado", "", "", "( cDbf )"},;          //   26
                     { "nDtoUno",   "N",  5,   2, "Porcentaje de primer descuento personalizado", "",  "", "( cDbf )"},;           //   27
                     { "cDtoDos",   "C", 25,   0, "Descripci�n de segundo descuento personalizado","", "", "( cDbf )"},;          //   28
                     { "nDtoDos",   "N",  5,   2, "Porcentaje de segundo descuento personalizado", "", "", "( cDbf )"},;
                     { "lCloPed",   "L",  1,   0, "",                                              "", "", "( cDbf )"},;
                     { "cCodUsr",   "C",  3,   0, "C�digo de usuario",                             "", "", "( cDbf )"},;
                     { "cNumPedCli","C", 12,   0, "N�mero del pedido del cliente del que viene",   "", "", "( cDbf )"},;
                     { "lImprimido","L",  1,   0, "L�gico de imprimido del documento",             "", "", "( cDbf )"},;
                     { "dFecImp",   "D",  8,   0, "�ltima fecha de impresi�n del documento",       "", "", "( cDbf )"},;
                     { "cHorImp",   "C",  5,   0, "Hora de la �ltima impresi�n del documento",     "", "", "( cDbf )"},;
                     { "dFecChg",   "D",  8,   0, "Fecha de modificaci�n del documento",           "", "", "( cDbf )"},;
                     { "cTimChg",   "C",  5,   0, "Hora de modificaci�n del documento",            "", "", "( cDbf )"},;
                     { "cCodDlg",   "C",  2,   0, "C�digo delegaci�n",                             "", "", "( cDbf )"},;
                     { "cSituac",   "C", 20,   0, "Situaci�n del documento",                       "", "", "( cDbf )"},;
                     { "nRegIva",   "N",  1,   0, "Regimen de " + cImp(),                          "", "", "( cDbf )"},;
                     { "nTotNet",   "N", 16,   6, "Total neto",                                    "", "", "( cDbf )"},;
                     { "nTotIva",   "N", 16,   6, "Total " + cImp(),                               "", "", "( cDbf )"},;
                     { "nTotReq",   "N", 16,   6, "Total recargo equivalencia",                    "", "", "( cDbf )"},;
                     { "nTotPed",   "N", 16,   6, "Total pedido",                                  "", "", "( cDbf )"},;
                     { "cNumAlb",   "C", 12,   0, "N�meo del albar�n en el se ha agrupado",        "", "", "( cDbf )"},;
                     { "lRECC",     "L",  1,   0, "L�gico r�gimen especial del criterio de caja",  "", "", "( cDbf )"} }

return ( aBase )

//---------------------------------------------------------------------------//

function aCalPedPrv()

   local aCalPedPrv  := {  { "aTotIva[1,1]",                                              "N", 16,  6, "Bruto primer tipo de " + cImp(),    "cPirDivPed",  "!Empty( aTotIva[1,1] ) .and. lEnd" },;
                           { "aTotIva[2,1]",                                              "N", 16,  6, "Bruto segundo tipo de " + cImp(),   "cPirDivPed",  "!Empty( aTotIva[2,1] ) .and. lEnd" },;
                           { "aTotIva[3,1]",                                              "N", 16,  6, "Bruto tercer tipo de " + cImp(),    "cPirDivPed",  "!Empty( aTotIva[3,1] ) .and. lEnd" },;
                           { "aTotIva[1,2]",                                              "N", 16,  6, "Base primer tipo de " + cImp(),     "cPirDivPed",  "!Empty( aTotIva[1,2] ) .and. lEnd" },;
                           { "aTotIva[2,2]",                                              "N", 16,  6, "Base segundo tipo de " + cImp(),    "cPirDivPed",  "!Empty( aTotIva[2,2] ) .and. lEnd" },;
                           { "aTotIva[3,2]",                                              "N", 16,  6, "Base tercer tipo de " + cImp(),     "cPirDivPed",  "!Empty( aTotIva[3,2] ) .and. lEnd" },;
                           { "aTotIva[1,3]",                                              "N",  5,  2, "Porcentaje primer tipo " + cImp(),  "'@R 99.99%'", "!Empty( aTotIva[1,3] ) .and. lEnd" },;
                           { "aTotIva[2,3]",                                              "N",  5,  2, "Porcentaje segundo tipo " + cImp(), "'@R 99.99%'", "!Empty( aTotIva[2,3] ) .and. lEnd" },;
                           { "aTotIva[3,3]",                                              "N",  5,  2, "Porcentaje tercer tipo " + cImp(),  "'@R 99.99%'", "!Empty( aTotIva[3,3] ) .and. lEnd" },;
                           { "aTotIva[1,4]",                                              "N",  5,  2, "Porcentaje primer tipo RE",   "'@R 99.99%'", "!Empty( aTotIva[1,4] ) .and. lEnd" },;
                           { "aTotIva[2,4]",                                              "N",  5,  2, "Porcentaje segundo tipo RE",  "'@R 99.99%'", "!Empty( aTotIva[2,4] ) .and. lEnd" },;
                           { "aTotIva[3,4]",                                              "N",  5,  2, "Porcentaje tercer tipo RE",   "'@R 99.99%'", "!Empty( aTotIva[3,4] ) .and. lEnd" },;
                           { "round( aTotIva[1,2] * aTotIva[1,3] / 100, nDinDivPed )",    "N", 16,  6, "Importe primer tipo " + cImp(),     "cPinDivPed",  "!Empty( aTotIva[1,2] ) .and. lEnd" },;
                           { "round( aTotIva[2,2] * aTotIva[2,3] / 100, nDinDivPed )",    "N", 16,  6, "Importe segundo tipo " + cImp(),    "cPinDivPed",  "!Empty( aTotIva[2,2] ) .and. lEnd" },;
                           { "round( aTotIva[3,2] * aTotIva[3,3] / 100, nDinDivPed )",    "N", 16,  6, "Importe tercer tipo " + cImp(),     "cPinDivPed",  "!Empty( aTotIva[3,2] ) .and. lEnd" },;
                           { "round( aTotIva[1,2] * aTotIva[1,4] / 100, nDinDivPed )",    "N", 16,  6, "Importe primer RE",           "cPinDivPed",  "!Empty( aTotIva[1,2] ) .and. lEnd" },;
                           { "round( aTotIva[2,2] * aTotIva[2,4] / 100, nDinDivPed )",    "N", 16,  6, "Importe segundo RE",          "cPinDivPed",  "!Empty( aTotIva[2,2] ) .and. lEnd" },;
                           { "round( aTotIva[3,2] * aTotIva[3,4] / 100, nDinDivPed )",    "N", 16,  6, "Importe tercer RE",           "cPinDivPed",  "!Empty( aTotIva[3,2] ) .and. lEnd" },;
                           { "nTotBrt",                                                   "N", 16,  6, "Total bruto",                 "cPirDivPed",  "lEnd" },;
                           { "nTotDto",                                                   "N", 16,  6, "Total descuento",             "cPirDivPed",  "lEnd" },;
                           { "nTotDpp",                                                   "N", 16,  6, "Total descuento pronto pago", "cPirDivPed",  "lEnd" },;
                           { "nTotNet",                                                   "N", 16,  6, "Total neto",                  "cPirDivPed",  "lEnd" },;
                           { "nTotIva",                                                   "N", 16,  6, "Total " + cImp(),                   "cPirDivPed",  "lEnd" },;
                           { "nTotReq",                                                   "N", 16,  6, "Total RE",                    "cPirDivPed",  "lEnd" },;
                           { "nTotPed",                                                   "N", 16,  6, "Total pedido",                "cPirDivPed",  "lEnd" },;
                           { "nImpEuros( nTotPed, (cDbf)->CDIVPED, cDbfDiv )",            "N", 16,  6, "Total pedido (Euros)",        "",            "lEnd" },;
                           { "nImpPesetas( nTotPed, (cDbf)->CDIVPED, cDbfDiv )",          "N", 16,  6, "Total pedido (Pesetas)",      "",            "lEnd" },;
                           { "nPagina",                                                   "N",  2,  0, "N�mero de p�gina",            "'99'",        "" },;
                           { "lEnd",                                                      "L",  1,  0, "Fin del documento",           "",            "" } }

return ( aCalPedPrv )

//---------------------------------------------------------------------------//

function aColPedPrv()

   local aColPedPrv  := {}

   aAdd( aColPedPrv,  { "cSerPed", "C",  1,   0, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nNumPed", "N",  9,   0, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cSufPed", "C",  2,   0, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cRef",    "C", 18,   0, "Referencia del art�culo",          "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cRefPrv", "C", 18,   0, "Referencia del proveedor",         "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cDetalle","C",250,   0, "Nombre del art�culo",              "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nIva",    "N",  6,   2, "Porcentaje de " + cImp(),          "'@E 99.9'",         "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nCanPed", "N", 16,   6, "Cantidad pedida",                  "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nUniCaja","N", 16,   6, "Unidades por caja",                "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nPreDiv", "N", 16,   6, "Precio",                           "cPirDivPed",        "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nCanEnt", "N", 16,   6, "Cajas recibidas",                  "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nUniEnt", "N", 16,   6, "Unidades recibidas",               "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cUniDad", "C",  2,   0, cNombreUnidades(),                  "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "mLngDes", "M", 10,   0, "Descripci�n larga",                "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nDtoLin", "N",  6,   2, "Descuento en lineas",              "'@E 999.99'",       "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nDtoPrm", "N",  6,   2, "Descuento pormociones",            "'@E 999.99'",       "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nDtoRap", "N",  6,   2, "Descuento por rappels",            "'@E 999.99'",       "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cCodPr1", "C", 20,   0, "C�digo de la primera propiedad",   "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cCodPr2", "C", 20,   0, "C�digo de la segunda propiedad",   "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cValPr1", "C", 40,   0, "Valor de la primera propiedad",    "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cValPr2", "C", 40,   0, "Valor de la segunda propiedad",    "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nFacCnv", "N", 13,   4, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nCtlStk", "N",  1,   0, "Control de stock (1,2,3)",         "'9'",               "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cAlmLin" ,"C", 16,   0, "C�digo de almac�n" ,               "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lLote",   "L",  1,   0, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nLote",   "N",  9,   0, "",                                 "'999999999'",       "", "(cDbfCol)" } ) 
   aAdd( aColPedPrv,  { "cLote",   "C", 12,   0, "N�mero de lote",                   "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nNumLin", "N",  4,   0, "N�mero de la l�nea",               "'9999'",            "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nUndKit", "N", 16,   6, "Unidades del producto kit",        "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lKitArt", "L",  1,   0, "L�nea con escandallo",             "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lKitChl", "L",  1,   0, "L�nea pertenciente a escandallo",  "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lKitPrc", "L",  1,   0, "",                                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lImpLin", "L",  1,   0, "Imprimir linea",                   "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lControl","L",  1,   0, "" ,                                "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "mNumSer", "M", 10,   0, "" ,                                "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lAnulado","L",  1,   0, "Anular linea",                     "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "dAnulado","D",  8,   0, "Fecha de anulacion",               "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "mAnulado","M",100,   0, "Motivo anulacion",                 "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cCodFam", "C", 16,   0, "C�digo de familia",                "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cGrpFam", "C",  3,   0, "C�digo del grupo de familia",      "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nReq",    "N", 16,   6, "Recargo de equivalencia",          "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "mObsLin", "M", 10,   6, "Observaciones de la linea",        "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "cPedCli", "C", 12,   0, "N�mero del pedido del cliente del que viene",  "",      "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nPvpRec", "N", 16,   6, "Precio de venta recomendado",      "cPirDivPed",        "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nNumMed", "N",  1,   0, "N�mero de mediciones",             "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nMedUno", "N", 16,   6, "Primera unidad de medici�n",       "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nMedDos", "N", 16,   6, "Segunda unidad de medici�n",       "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nMedTre", "N", 16,   6, "Tercera unidad de medici�n",       "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nStkAct", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nStkMin", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nPdtRec", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nConRea", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nConSem", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nConQui", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nConMes", "N", 16,   6, "",                                 "MasUnd()",          "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "nEstado", "N",  1,   0, "Estado del pedido",                "",                  "", "(cDbfCol)" } )
   aAdd( aColPedPrv,  { "lFromImp","L",  1,   0, "",                                 "",                  "", "(cDbfCol)" } )

return ( aColPedPrv )

//---------------------------------------------------------------------------//

function aCocPedPrv()

   local aCocPedPrv  := {  { "Descrip( cDbfCol )",                                           "C", 50, 0, "Detalle del art�culo",       "",            "Descripci�n", "" },;
                           { "nTotNPedPrv( cDbfCol )",                                       "N", 16, 6, "Total unidades",             "cPicUndPed",  cNombreUnidades(),    "" },;
                           { "nTotUPedPrv( cDbfCol, nDinDivPed, nVdvDivPed )",               "N", 16, 6, "Precio unitario de pedido",  "cPinDivPed",  "Precio",      "" },;
                           { "nTotLPedPrv( cDbfCol, nDinDivPed, nDirDivPed, nVdvDivPed )",   "N", 16, 6, "Total linea de pedido",      "cPirDivPed",  "Total",       "" } }

return ( aCocPedPrv )

//---------------------------------------------------------------------------//

Static Function nClrText( dbfTmpLin )

Return ( if ( ( dbfTmpLin )->lKitChl, CLR_GRAY, CLR_BLACK ) )

//----------------------------------------------------------------------------//

Function EdtNumSer( mNumSer, nTotUnd, nMode )

   local oDlg
   local oBrwSer
   local oProSer
   local nProSer
   local aNumSer
   local cPreFix  := Space( 18 )
   local oSerIni
   local nSerIni  := 0
   local oSerFin
   local nSerFin  := 0
   local oNumGen
   local nNumGen  := 0

   if nTotUnd == 0
      MsgStop( "No hay unidades para asignar n�meros de serie." )
      Return ( mNumSer )
   end if

   DEFAULT nMode  := APPD_MODE

   nTotUnd        := abs( nTotUnd )
   aNumSer        := Afill( Array( nTotUnd ), Space( 30 ) )

   if nMode != APPD_MODE
      aMem2Ser( mNumSer, nTotUnd )
   end if

   DEFINE DIALOG oDlg RESOURCE "VtaNumSer"

      REDEFINE GET nTotUnd ;
                  ID          100 ;
         PICTURE  MasUnd() ;
         WHEN     .f. ;
         OF       oDlg

      REDEFINE GET cPreFix ;
         ID       110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET oSerIni VAR nSerIni ;
         ID       120 ;
         PICTURE  "99999999999999999999" ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oSerFin:cText( nSerIni + nTotUnd ), .t. ) ;
         OF       oDlg

      REDEFINE GET oSerFin VAR nSerFin ;
         ID       130 ;
         PICTURE  "99999999999999999999" ;
         WHEN     .f. ;
         OF       oDlg

      REDEFINE GET oNumGen VAR nNumGen ;
         ID       140 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "99999999999999999999" ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( GenNumSer( cPreFix, aNumSer, nSerIni, nNumGen, oBrwSer ) )

      oBrwSer                 := IXBrowse():New( oDlg )

      oBrwSer:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwSer:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwSer:lHScroll        := .f.
      oBrwSer:lRecordSelector := .t.
      oBrwSer:lFastEdit       := .t.

      oBrwSer:nMarqueeStyle   := MARQSTYLE_HIGHLCELL

      oBrwSer:SetArray( aNumSer, , , .f. )

      oBrwSer:nColSel         := 2

      with object ( oBrwSer:addCol() )
         :cHeader       := "N."
         :bStrData      := {|| Trans( oBrwSer:nArrayAt, "999999999" ) }
         :nWidth        := 60
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
      end with

      with object ( oBrwSer:addCol() )
         :cHeader       := "Serie"
         :bEditValue    := {|| aNumSer[ oBrwSer:nArrayAt ] }
         :nWidth        := 240
         :nEditType     := 1
         :bOnPostEdit   := {|o,x| aNumSer[ oBrwSer:nArrayAt ] := x }
      end with

      oBrwSer:CreateFromResource( 150 )

      oProSer     := TApoloMeter():ReDefine( 240, { | u | if( pCount() == 0, nProSer, nProSer := u ) }, 10, oDlg, .f., , , .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )

      REDEFINE BUTTON ;
         ID       510 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( mNumSer   := mSer2Mem( aNumSer, nTotUnd ), oDlg:End() )

      REDEFINE BUTTON ;
         ID       520 ;
         OF       oDlg ;
         ACTION   ( oDlg:End() )

      oDlg:AddFastKey( VK_F5, {|| mNumSer := mSer2Mem( aNumSer, nTotUnd ), oDlg:End() } )

   ACTIVATE DIALOG oDlg CENTER

Return ( mNumSer )

//----------------------------------------------------------------------------//

Function GenNumSer( cPreFix, aNumSer, nSerIni, nNumGen, oBrwSer )

   local n
   local nChg  := 1

   CursorWait()

   if Empty( nNumGen )
      aEval( aNumSer, {| a, n | aNumSer[ n ] := Padr( Rtrim( cPreFix ) + Ltrim( Str( nSerIni + n - 1 ) ), 30 ) } )
   else
      for n := 1 to len( aNumSer )
         if Empty( aNumSer[ n ] )
            aNumSer[ n ]                     := Padr( Rtrim( cPreFix ) + Ltrim( Str( nSerIni + nChg - 1 ) ), 30 )
            nChg++
         end if
         if nChg == nNumGen
            exit
         end if
      next
   end if

   CursorWE()

   if !Empty( oBrwSer )
      oBrwSer:Refresh()
   end if

Return nil

//---------------------------------------------------------------------------//

Function aMem2Ser( mNumSer, nTotUnd )

   local n
   local nPosSer
   local aMemSer

   CursorWait()

   aMemSer           := Afill( Array( nTotUnd ), Space( 40 ) )

   for n := 1 to nTotUnd

      nPosSer        := At( ",", mNumSer )
      if nPosSer != 0
         aMemSer[ n ]:= Padr( SubStr( mNumSer, 1, nPosSer - 1 ), 40 )
         mNumSer     := SubStr( mNumSer, nPosSer + 1 )
      end if
   next

   CursorWE()

Return ( aMemSer )

//----------------------------------------------------------------------------//

Function SynPedPrv( cPath )

   local oError
   local oBlock      
   local aTotPed
   local nEstado

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   dbUseArea( .t., cDriver(), cPath + "PedPROVT.DBF", cCheckArea( "PedPROVT", @dbfPedPrvT ), .f. )
   if !lAIS(); ordListAdd( cPath + "PedPROVT.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPath + "PedPROVL.DBF", cCheckArea( "PedPROVL", @dbfPedPrvL ), .f. )
   if !lAIS(); ordListAdd( cPath + "PedPROVL.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPath + "PedPRVI.DBF", cCheckArea( "PedPRVI", @dbfPedPrvI ), .f. )
   if !lAIS(); ordListAdd( cPath + "PedPRVI.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPatArt() + "FAMILIAS.DBF", cCheckArea( "FAMILIAS", @dbfFamilia ), .f. )
   if !lAIS(); ordListAdd( cPatArt() + "FAMILIAS.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPatArt() + "ARTICULO.DBF", cCheckArea( "ARTICULO", @dbfArticulo ), .f. )
   if !lAIS(); ordListAdd( cPatArt() + "ARTICULO.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPatArt() + "PROVART.DBF", cCheckArea( "PROVART", @dbfArtPrv ), .f. )
   if !lAIS(); ordListAdd( cPatArt() + "PROVART.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPatDat() + "TIVA.DBF", cCheckArea( "TIVA", @dbfIva ), .t. )
   if !lAIS(); ordListAdd( cPatDat() + "TIVA.CDX" ); else ; ordSetFocus( 1 ) ; end

   dbUseArea( .t., cDriver(), cPatDat() + "DIVISAS.DBF", cCheckArea( "DIVISAS", @dbfDiv ), .t. )
   if !lAIS(); ordListAdd( cPatDat() + "DIVISAS.CDX" ); else ; ordSetFocus( 1 ) ; end

   ( dbfPedPrvT )->( OrdSetFocus( 0 ) )
   ( dbfPedPrvT )->( dbGoTop() )

   while !( dbfPedPrvT )->( eof() )

      if Empty( ( dbfPedPrvT )->cSufPed )
         ( dbfPedPrvT )->cSufPed    := "00"
      end if

      if Empty( ( dbfPedPrvT )->cCodCaj )
         ( dbfPedPrvT )->cCodCaj    := "000"
      end if

      if !Empty( ( dbfPedPrvT )->cNumPedCli ) .and. Len( AllTrim( ( dbfPedPrvT )->cNumPedCli ) ) != 12
         ( dbfPedPrvT )->cNumPedCli := AllTrim( ( dbfPedPrvT )->cNumPedCli ) + "00"
      end if

      if !Empty( ( dbfPedPrvT )->cNumAlb ) .and. Len( AllTrim( ( dbfPedPrvT )->cNumAlb ) ) != 12
         ( dbfPedPrvT )->cNumAlb    := AllTrim( ( dbfPedPrvT )->cNumAlb ) + "00"
      end if

      /*
      Rellenamos los campos de totales-----------------------------------------
      */

      if ( dbfPedPrvT )->nTotPed == 0

         aTotPed                    := aTotPedPrv( ( dbfPedPrvT )->cSerPed + Str( ( dbfPedPrvT )->nNumPed ) + ( dbfPedPrvT )->cSufPed, dbfPedPrvT, dbfPedPrvL, dbfIva, dbfDiv, ( dbfPedPrvT )->cDivPed )

         ( dbfPedPrvT )->nTotNet    := aTotPed[1]
         ( dbfPedPrvT )->nTotIva    := aTotPed[2]
         ( dbfPedPrvT )->nTotReq    := aTotPed[3]
         ( dbfPedPrvT )->nTotPed    := aTotPed[4]

      end if

      ( dbfPedPrvT )->( dbSkip() )

   end while

   ( dbfPedPrvT )->( OrdSetFocus( 1 ) )

   // Lineas ------------------------------------------------------------------

   ( dbfPedPrvL )->( OrdSetFocus( 0 ) )
   ( dbfPedPrvL )->( dbGoTop() )

   while !( dbfPedPrvL )->( eof() )

      if Empty( ( dbfPedPrvL )->cSufPed )
         ( dbfPedPrvL )->cSufPed := "00"
      end if

      if !Empty( ( dbfPedPrvL )->cPedCli ) .and. Len( AllTrim( ( dbfPedPrvL )->cPedCli ) ) != 12
         ( dbfPedPrvL )->cPedCli := AllTrim( ( dbfPedPrvL )->cPedCli ) + "00"
      end if

      if Empty( ( dbfPedPrvL )->cLote ) .and. !Empty( ( dbfPedPrvL )->nLote )
         ( dbfPedPrvL )->cLote   := AllTrim( Str( ( dbfPedPrvL )->nLote ) )
      end if

      if !Empty( ( dbfPedPrvL )->cRef ) .and. Empty( ( dbfPedPrvL )->cCodFam )
         ( dbfPedPrvL )->cCodFam := RetFamArt( ( dbfPedPrvL )->cRef, dbfArticulo )
      end if

      if !Empty( ( dbfPedPrvL )->cRef ) .and. !Empty( ( dbfPedPrvL )->cGrpFam )
         ( dbfPedPrvL )->cGrpFam := cGruFam( ( dbfPedPrvL )->cCodFam, dbfFamilia )
      end if

      if Empty( ( dbfPedPrvL )->nReq )
         ( dbfPedPrvL )->nReq    := nPReq( dbfIva, ( dbfPedPrvL )->nIva )
      end if

      if Empty( ( dbfPedPrvL )->cAlmLin )
         ( dbfPedPrvL )->cAlmLin := RetFld( ( dbfPedPrvL )->cSerPed + Str( ( dbfPedPrvL )->nNumPed ) + ( dbfPedPrvL )->cSufPed, dbfPedPrvT, "cCodAlm" )
      end if

      nEstado     := RetFld( ( dbfPedPrvL )->cSerPed + Str( ( dbfPedPrvL )->nNumPed ) + ( dbfPedPrvL )->cSufPed, dbfPedPrvT, "nEstado" )

      if nEstado == 3
         ( dbfPedPrvL )->nEstado := nEstado
      end if

      ( dbfPedPrvL )->( dbSkip() )

      SysRefresh()

   end while

   ( dbfPedPrvL )->( OrdSetFocus( 1 ) )

   // Incidencias -------------------------------------------------------------

   ( dbfPedPrvI )->( OrdSetFocus( 0 ) )
   ( dbfPedPrvI )->( dbGoTop() )

   while !( dbfPedPrvI )->( eof() )

      if Empty( ( dbfPedPrvI )->cSufPed )
         ( dbfPedPrvI )->cSufPed := "00"
      end if

      ( dbfPedPrvI )->( dbSkip() )

      SysRefresh()

   end while

   ( dbfPedPrvI )->( OrdSetFocus( 1 ) )

   RECOVER USING oError

      msgStop( "Imposible sincronizar pedidos de proveedores" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( dbfPedPrvT ) .and. ( dbfPedPrvT )->( Used() )
      ( dbfPedPrvT )->( dbCloseArea() )
   end if

   if !Empty( dbfPedPrvL ) .and. ( dbfPedPrvL )->( Used() )
      ( dbfPedPrvL )->( dbCloseArea() )
   end if

   if !Empty( dbfPedPrvI ) .and. ( dbfPedPrvI )->( Used() )
      ( dbfPedPrvI )->( dbCloseArea() )
   end if

   if !Empty( dbfArticulo ) .and. ( dbfArticulo )->( Used() )
      ( dbfArticulo )->( dbCloseArea() )
   end if

   if !Empty( dbfFamilia ) .and. ( dbfFamilia )->( Used() )
      ( dbfFamilia )->( dbCloseArea() )
   end if

   if !Empty( dbfArtPrv ) .and. ( dbfArtPrv )->( Used() )
      ( dbfArtPrv )->( dbCloseArea() )
   end if

   if !Empty( dbfIva ) .and. ( dbfIva )->( Used() )
      ( dbfIva )->( dbCloseArea() )
   end if

   if !Empty( dbfDiv ) .and. ( dbfDiv )->( Used() )
      ( dbfDiv )->( dbCloseArea() )
   end if

return nil

//------------------------------------------------------------------------//
//------------------------------------------------------------------------//
//------------------------------------------------------------------------//
//------------------------------------------------------------------------//
//------------------------------------------------------------------------//
//------------------------------------------------------------------------//

CLASS TPedidosProveedorSenderReciver FROM TSenderReciverItem

   Method CreateData()

   Method RestoreData()

   Method SendData()

   Method ReciveData()

   Method Process()

END CLASS

//----------------------------------------------------------------------------//

Method CreateData()

   local oBlock
   local oError
   local lSnd        := .f.
   local cPedPrvT
   local dbfPedPrvL
   local tmpPedPrvT
   local tmpPedPrvL
   local cFileName   := "PedPrv" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   ::oSender:SetText( "Enviando pedidos a proveedores" )

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @cPedPrvT ) )
   SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PEDPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVL", @dbfPedPrvL ) )
   SET ADSINDEX TO ( cPatEmp() + "PEDPROVL.CDX" ) ADDITIVE

   /*
   Creamos todas las bases de datos relacionadas con Articulos
   */

   CreateFiles( cPatSnd() )

   rxPedPrv( cPatSnd() )

   USE ( cPatSnd() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @tmpPedPrvT ) )
   SET ADSINDEX TO ( cPatSnd() + "PEDPROVT.CDX" ) ADDITIVE

   USE ( cPatSnd() + "PEDPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVL", @tmpPedPrvL ) )
   SET ADSINDEX TO ( cPatSnd() + "PEDPROVL.CDX" ) ADDITIVE

   if !Empty( ::oSender:oMtr )
      ::oSender:oMtr:nTotal := ( cPedPrvT )->( lastrec() )
   end if

   while !( cPedPrvT )->( eof() )

      if ( cPedPrvT )->lSndDoc

         lSnd  := .t.

         dbPass( cPedPrvT, tmpPedPrvT, .t. )

         ::oSender:SetText( ( cPedPrvT )->cSerPed + "/" + AllTrim( Str( ( cPedPrvT )->nNumPed ) ) + "/" + Alltrim( ( cPedPrvT )->cSufPed ) + "; " + Dtoc( ( cPedPrvT )->dFecPed ) + "; " + AllTrim( ( cPedPrvT )->cCodPrv ) + "; " + ( cPedPrvT )->cNomPrv )

         if ( dbfPedPrvL )->( dbSeek( ( cPedPrvT )->CSERPED + Str( ( cPedPrvT )->nNumPed ) + ( cPedPrvT )->cSufPed ) )

            while ( ( dbfPedPrvL )->CSERPED + Str( ( dbfPedPrvL )->nNumPed ) + ( dbfPedPrvL )->cSufPed ) == ( ( cPedPrvT )->CSERPED + Str( ( cPedPrvT )->nNumPed ) + ( cPedPrvT )->cSufPed ) .AND. !( dbfPedPrvL )->( eof() )

               dbPass( dbfPedPrvL, tmpPedPrvL, .t. )
               ( dbfPedPrvL )->( dbSkip() )

            end do

         end if

      end if

      ( cPedPrvT )->( dbSkip() )

      if !Empty( ::oSender:oMtr )
         ::oSender:oMtr:Set( ( cPedPrvT )->( OrdKeyNo() ) )
      end if

   END DO

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE ( cPedPrvT )
   CLOSE ( dbfPedPrvL )
   CLOSE ( tmpPedPrvT )
   CLOSE ( tmpPedPrvL )

   /*
   Comprimir los archivos------------------------------------------------------
   */

   if lSnd

      ::oSender:SetText( "Comprimiendo pedidos de proveedores" )

      if ::oSender:lZipData( cFileName )
         ::oSender:SetText( "Ficheros comprimidos" )
      else
         ::oSender:SetText( "ERROR al crear fichero comprimido" )
      end if

   else

      ::oSender:SetText( "No hay pedidos de proveedores para enviar" )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method RestoreData()

   local oBlock
   local oError
   local cPedPrvT

   if ::lSuccesfullSend

      /*
      Retorna el valor anterior
      */

      oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
      BEGIN SEQUENCE

      USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @cPedPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE

         lSelectAll( nil, cPedPrvT, "lSndDoc", .f., .t., .f. )

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

      CLOSE ( cPedPrvT )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method SendData()

   local cFileName         := "PedPrv" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   if File( cPatOut() + cFileName )

      if ftpSndFile( cPatOut() + cFileName, cFileName, 2000, ::oSender )
         ::lSuccesfullSend := .t.
         ::IncNumberToSend()
         ::oSender:SetText( "Fichero enviado " + cFileName )
      else
         ::oSender:SetText( "ERROR al enviar fichero" )
      end if

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method ReciveData()

   local n
   local aExt        := aRetDlgEmp()

   /*
   Recibirlo de internet
   */

   ::oSender:SetText( "Recibiendo pedidos de proveedores" )

   for n := 1 to len( aExt )
      ftpGetFiles( "PedPrv*." + aExt[ n ], cPatIn(), 2000, ::oSender )
   next

   ::oSender:SetText( "Pedidos de proveedores recibidos" )

Return Self

//----------------------------------------------------------------------------//

Method Process()

   local m
   local oBlock
   local oError
   local cPedPrvT
   local dbfPedPrvL
   local tmpPedPrvT
   local tmpPedPrvL
   local aFiles      := Directory( cPatIn() + "PedPrv*.*" )

   /*
   Procesamos los ficheros recibidos
   */

   for m := 1 to len( aFiles )

      ::oSender:SetText( "Procesando fichero : " + aFiles[ m, 1 ] )

      oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )

      BEGIN SEQUENCE

      /*
      descomprimimos el fichero
      */

      if ::oSender:lUnZipData( cPatIn() + aFiles[ m, 1 ] )

         dbUseArea(.t., cDriver(), cPatSnd() + "PEDPROVT.DBF", cCheckArea( "PEDPROVT", @tmpPedPrvT ), .f., .t. )
         if !( cPedPrvT )->( neterr() )
               ( tmpPedPrvT )->( ordListAdd( cPatSnd() + "PEDPROVT.CDX" ) )
         end if

         dbUseArea(.t., cDriver(), cPatSnd() + "PEDPROVL.DBF", cCheckArea( "PEDPROVL", @tmpPedPrvL ), .f., .t. )
         if !( dbfPedPrvL )->( neterr() )
               ( tmpPedPrvL )->( ordListAdd( cPatSnd() + "PEDPROVL.CDX" ) )
         end if

         USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @cPedPrvT ) )
         SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE

         USE ( cPatEmp() + "PEDPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVL", @dbfPedPrvL ) )
         SET ADSINDEX TO ( cPatEmp() + "PEDPROVL.CDX" ) ADDITIVE

         WHILE ( tmpPedPrvT )->( !eof() )

            /*
            Comprobamos que no exista el pedido en la base de datos
            */

            if lValidaOperacion( ( tmpPedPrvT )->dFecPed, .f. ) .and. ;
               !( cPedPrvT )->( dbSeek( ( tmpPedPrvT )->cSerPed + Str( ( tmpPedPrvT )->nNumPed ) + ( tmpPedPrvT )->cSufPed ) )

               dbPass( tmpPedPrvT, cPedPrvT, .t. )
               ::oSender:SetText( "A�adido     : " + ( tmpPedPrvT )->cSerPed + "/" + AllTrim( Str( ( tmpPedPrvT )->nNumPed ) ) + "/" + AllTrim( ( tmpPedPrvT )->cSufPed ) + "; " + Dtoc( ( tmpPedPrvT )->dFecPed ) + "; " + AllTrim( ( tmpPedPrvT )->cCodPrv ) + "; " + ( tmpPedPrvT )->cNomPrv )

               if ( tmpPedPrvL )->( dbSeek( ( tmpPedPrvT )->CSERPED + Str( ( tmpPedPrvT )->nNumPed ) + ( tmpPedPrvT )->cSufPed ) )

                  while ( ( tmpPedPrvL )->CSERPED + Str( ( tmpPedPrvL )->nNumPed ) + ( tmpPedPrvL )->cSufPed ) == ( ( tmpPedPrvT )->CSERPED + Str( ( tmpPedPrvT )->nNumPed ) + ( tmpPedPrvT )->cSufPed ) .AND. !( tmpPedPrvL )->( eof() )

                     dbPass( tmpPedPrvL, dbfPedPrvL, .t. )
                     ( tmpPedPrvL )->( dbSkip() )

                  end do

               end if

            else

               ::oSender:SetText( "Desestimado : " + ( tmpPedPrvT )->cSerPed + "/" + AllTrim( Str( ( tmpPedPrvT )->nNumPed ) ) + "/" + AllTrim( ( tmpPedPrvT )->cSufPed ) + "; " + Dtoc( ( tmpPedPrvT )->dFecPed ) + "; " + AllTrim( ( tmpPedPrvT )->cCodPrv ) + "; " + ( tmpPedPrvT )->cNomPrv )

            end if

            ( tmpPedPrvT )->( dbSkip() )

         END DO

         CLOSE ( cPedPrvT )
         CLOSE ( dbfPedPrvL )
         CLOSE ( tmpPedPrvT )
         CLOSE ( tmpPedPrvL )

         ::oSender:AppendFileRecive( aFiles[ m, 1 ] )

      end if

      RECOVER USING oError

         CLOSE ( cPedPrvT )
         CLOSE ( dbfPedPrvL )
         CLOSE ( tmpPedPrvT )
         CLOSE ( tmpPedPrvL )

         ::oSender:SetText( "Error procesando fichero " + aFiles[ m, 1 ] )
         ::oSender:SetText( ErrorMessage( oError ) )

      END SEQUENCE

      ErrorBlock( oBlock )

   next

Return Self

//----------------------------------------------------------------------------//

/*
Selecciona todos los registros
*/

FUNCTION lSelAll( oBrw, dbf, lSel, lTop, lMeter )

   local nRecAct  := ( dbf )->( recno() )

   DEFAULT lSel   := .t.
   DEFAULT lTop   := .t.
   DEFAULT lMeter := .f.

   if lMeter
      CreateWaitMeter( nil, nil, ( dbf )->( OrdKeyCount() ) )
   else
      CursorWait()
   end if

   if lTop
      ( dbf )->( dbGoTop() )
   end if

   while !( dbf )->( eof() )

      if dbLock( dbf )
         ( dbf )->lSndDoc := lSel
         ( dbf )->( dbUnlock() )
      end if

      ( dbf )->( dbSkip() )

      if lMeter
         RefreshWaitMeter( ( dbf )->( OrdKeyNo() ) )
      else
         SysRefresh()
      end if

   end do

   ( dbf )->( dbGoTo( nRecAct ) )

   if lMeter
      EndWaitMeter()
   else
      CursorWE()
   end if

   if !Empty( oBrw )
      oBrw:Refresh()
      oBrw:SetFocus()
   end if

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION aDocumentsPedidoProveedor( cNumPed )

   local oBlock
   local oError
   local dbfAlbPrvT
   local aDocuments  := {}

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbPrvT ) )
   SET ADSINDEX TO ( cPatEmp() + "ALBPROVT.CDX" ) ADDITIVE
   ( dbfAlbPrvT )->( OrdSetFocus( "cNumPed" ) )

   if ( dbfAlbPrvT )->( dbSeek( cNumPed ) )
      while ( dbfAlbPrvT )->cNumPed == cNumPed .and. !( dbfAlbPrvT )->( eof() )
         aAdd( aDocuments, {  ( dbfAlbPrvT )->cSerAlb + Str( ( dbfAlbPrvT )->nNumAlb ) + ( dbfAlbPrvT )->cSufAlb,;
                              Dtoc( ( dbfAlbPrvT )->dFecAlb ),;
                              ( dbfAlbPrvT )->cCodPrv,;
                              Rtrim( ( dbfAlbPrvT )->cNomPrv ),;
                              ( dbfAlbPrvT )->cCodAlm } )
         ( dbfAlbPrvT )->( dbSkip() )
      end while
   end if

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE( dbfAlbPrvT )

Return ( aDocuments )

//---------------------------------------------------------------------------//

Function GetCodCli( cNumPed )

   local oBlock
   local oError
   local dbfPedCliT
   local cCodCli  := ""

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "PedCliT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PedCliT", @dbfPedCliT ) )
   SET ADSINDEX TO ( cPatEmp() + "PEDCLIT.CDX" ) ADDITIVE

   ( dbfPedCliT )->( OrdSetFocus( "NNUMPED" ) )

   if ( dbfPedCliT )->( dbSeek( cNumPed ) )
      cCodCli     := ( dbfPedCliT )->cCodCli
   end if 

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE( dbfPedCliT )

Return cCodCli

//---------------------------------------------------------------------------//

Function GetNomCli( cNumPed )

   local oBlock
   local oError
   local dbfPedCliT
   local cNomCli  := ""

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "PedCliT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PedCliT", @dbfPedCliT ) )
   SET ADSINDEX TO ( cPatEmp() + "PEDCLIT.CDX" ) ADDITIVE

   ( dbfPedCliT )->( OrdSetFocus( "NNUMPED" ) )

   if ( dbfPedCliT )->( dbSeek( cNumPed ) )
      cNomCli     := ( dbfPedCliT )->cNomCli
   end if

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE( dbfPedCliT )

Return cNomCli

//---------------------------------------------------------------------------//

function lChgImpDoc( dbfT )

   if dbLock( dbfT )
      ( dbfT )->lImprimido := .t.
      ( dbfT )->dFecImp    := GetSysDate()
      ( dbfT )->cHorImp    := SubStr( Time(), 1, 5 )
      ( dbfT )->( dbUnLock() )
   end if

Return .t.

//---------------------------------------------------------------------------//

/*
Funci�n que monta los di�logos para la generaci�n de pedidos a proveedor
*/

Function Generador( oBrwPed )

   local oDlg
   local oPag
   local oBmp
   local oMtr
   local nMtr
   local oBrw
   local oCol
   local oBtnAnt
   local oBtnNxt
   local oProvee
   local cProvee
   local oSayPrv
   local cSayPrv
   local oArtOrg
   local oArtDes
   local oSayArtOrg
   local oSayArtDes
   local cArtOrg        := dbFirst ( TDataView():Articulos( nView ), 1 )
   local cArtDes        := dbLast  ( TDataView():Articulos( nView ), 1 )
   local cSayArtOrg     := dbFirst ( TDataView():Articulos( nView ), 2 )
   local cSayArtDes     := dbLast  ( TDataView():Articulos( nView ), 2 )
   local oCodAlm
   local oNomAlm
   local cCodAlm        := cDefAlm()
   local cNomAlm        := retAlmacen( cCodAlm, TDataView():Almacen( nView ) )
   local nStockDis      := 4
   local nStockFin      := 1

   CreaTemporal()

   DEFINE DIALOG oDlg RESOURCE "ASS_PEDCLI" TITLE "Generar pedido a proveedor"

   REDEFINE BITMAP oBmp ;
      RESOURCE "GENERARPEDPRV" ;
      ID       500 ;
      OF       oDlg

   REDEFINE PAGES oPag ID 110 OF oDlg ;
      DIALOGS "ASS_PEDPRV1", "ASS_PEDCLI2"

   REDEFINE GET oProvee VAR cProvee;
      ID       110;
      VALID    cProvee( oProvee, TDataView():Proveedores( nView ), oSayPrv ) ;
      BITMAP   "LUPA" ;
      ON HELP  BrwProvee( oProvee, oSayPrv ) ;
            COLOR       CLR_GET ;
      OF       oPag:aDialogs[1]

   REDEFINE GET oSayPrv VAR cSayPrv ;
      ID       120;
      WHEN     .f.;
      COLOR    CLR_GET ;
      OF       oPag:aDialogs[1]

   REDEFINE GET oArtOrg VAR cArtOrg;
      ID       150 ;
      VALID    cArticulo( oArtOrg, TDataView():Articulos( nView ), oSayArtOrg );
      BITMAP   "LUPA" ;
      ON HELP  BrwArticulo( oArtOrg, oSayArtOrg );
      OF       oPag:aDialogs[1]

   REDEFINE GET oSayArtOrg VAR cSayArtOrg ;
            WHEN        .F.;
      ID       160 ;
      OF       oPag:aDialogs[1]

   REDEFINE GET oArtDes VAR cArtDes;
      ID       170 ;
      VALID    cArticulo( oArtDes, TDataView():Articulos( nView ), oSayArtDes );
      BITMAP   "LUPA" ;
      ON HELP  BrwArticulo( oArtDes, oSayArtDes );
      OF       oPag:aDialogs[1]

   REDEFINE GET oSayArtDes VAR cSayArtDes ;
            WHEN        .F.;
      ID       180 ;
      OF       oPag:aDialogs[1]

   REDEFINE GET oCodAlm VAR cCodAlm ;
      ID       190 ;
      VALID    ( cAlmacen( oCodAlm, TDataView():Almacen( nView ), oNomAlm ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( BrwAlmacen( oCodAlm, oNomAlm ) ) ;
      COLOR    CLR_GET ;
      OF       oPag:aDialogs[1]

   REDEFINE GET oNomAlm VAR cNomAlm ;
      WHEN     .F. ;
      ID       200 ;
      OF       oPag:aDialogs[1]

   REDEFINE RADIO nStockDis ;
      ID       201, 202, 203, 204 ;
      OF       oPag:aDialogs[1]

   REDEFINE RADIO nStockFin ;
      ID       212, 213 ;
      OF       oPag:aDialogs[ 1 ]

 REDEFINE APOLOMETER oMtr ;
      VAR      nMtr ;
            PROMPT      "Procesando" ;
      ID       220 ;
      TOTAL    ( ( TDataView():Articulos( nView ) )->( LastRec() ) ) ;
      OF       oPag:aDialogs[ 1 ]

   oBrw                 := IXBrowse():New( oPag:aDialogs[ 2 ] )

   oBrw:lHScroll        := .f.

   oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
   oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

   oBrw:cAlias          := dbfTmpArt
   oBrw:nMarqueeStyle   := 5
   oBrw:cName           := "Pedido a proveedores.Asistente"
   oBrw:lFastEdit       := .t.
   oBrw:nMarqueeStyle   := MARQSTYLE_HIGHLCELL

      with object ( oBrw:AddCol() )
         :cHeader       := "Se. Seleccionado"
         :bStrData      := {|| "" }
         :bEditValue    := {|| ( dbfTmpArt )->lSelArt }
         :nEditType     := 0
         :nWidth        := 20
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrw:AddCol() )
         :cHeader       := "C�digo"
         :bEditValue    := {|| ( dbfTmpArt )->cRef }
         :nEditType     := 0
         :nWidth        := 60
      end with

      with object ( oBrw:AddCol() )
         :cHeader       := "Detalle"
         :bEditValue    := {|| ( dbfTmpArt )->cDetalle }
         :nEditType     := 0
         :nWidth        := 200
      end with

      with object ( oBrw:AddCol() )
         :cHeader       := "Objetivo"
         :bEditValue    := {|| ( dbfTmpArt )->nObjUni }
         :cEditPicture  := MasUnd()
         :nEditType     := 0
         :nWidth        := 65
         :nDataStrAlign := AL_RIGHT
         :nHeadStrAlign := AL_RIGHT
      end with

      with object ( oCol := oBrw:AddCol() )
         :cHeader       := "A pedir"
         :bEditValue    := {|| ( dbfTmpArt )->nNumUni }
         :cEditPicture  := MasUnd()
         :nEditType     := 1
         :nWidth        := 65
         :bOnPostEdit   := {|o,x| if( x > 0, ( dbfTmpArt )->nNumUni := x, ), .t. }
         :nDataStrAlign := AL_RIGHT
         :nHeadStrAlign := AL_RIGHT
      end with

      with object ( oBrw:AddCol() )
         :cHeader       := "Stock actual"
         :bEditValue    := {|| ( dbfTmpArt )->nStkFis }
         :cEditPicture  := MasUnd()
         :nEditType     := 0
         :nWidth        := 65
         :nDataStrAlign := AL_RIGHT
         :nHeadStrAlign := AL_RIGHT
      end with

      with object ( oBrw:AddCol() )
         :cHeader       := "Stock disponible"
         :bEditValue    := {|| ( dbfTmpArt )->nStkDis }
         :cEditPicture  := MasUnd()
         :nEditType     := 0
         :nWidth        := 65
         :nDataStrAlign := AL_RIGHT
         :nHeadStrAlign := AL_RIGHT
      end with

   oBrw:CreateFromResource( 100 )

   oBrw:bLDblClick      := {|| oCol:Edit() }

   REDEFINE BUTTON ;
      ID       110;
      OF       oPag:aDialogs[2] ;
      ACTION   ( oCol:Edit() )

   REDEFINE BUTTON ;
      ID       120;
      OF       oPag:aDialogs[2] ;
      ACTION   ( SelArt( dbfTmpArt, oBrw ) )

   REDEFINE BUTTON ;
      ID       130;
      OF       oPag:aDialogs[2] ;
      ACTION   ( SelAllArt( dbfTmpArt, oBrw, .t. ) )

   REDEFINE BUTTON ;
      ID       140;
      OF       oPag:aDialogs[2] ;
      ACTION   ( SelAllArt( dbfTmpArt, oBrw, .f. ) )

   REDEFINE BUTTON oBtnAnt ;
      ID       401 ;
      OF       oDlg;
      ACTION   ( BtnAnt( oPag, oBtnNxt, oBtnAnt ) )

   REDEFINE BUTTON oBtnNxt ;
      ID       402 ;
      OF       oDlg;
      ACTION   ( BtnNxt( oPag, oBtnNxt, oBtnAnt, oDlg, oProvee, cProvee, cArtOrg, cArtDes, nStockDis, nStockFin, oMtr, oBrw, cCodAlm ) )

   REDEFINE BUTTON ;
      ID       403 ;
      OF       oDlg ;
      ACTION   ( KillTemporal(), oDlg:end() )

   ACTIVATE DIALOG oDlg CENTER ON INIT( oBtnAnt:Hide(), oBrw:Load() )

   oBmp:End()

   oBrwPed:Refresh()

RETURN ( nil )

//---------------------------------------------------------------------------//

function ShowKitCom( dbfMaster, dbfTmpLin, oBrw, cCodPrv, dbfTmpInc, aGet )

   if !Empty( aGet )

      if lUsrMaster() .or. oUser():lCambiarPrecio()
         aGet[ ( dbfMaster )->( FieldPos( "lRecargo" ) ) ]:HardEnable()
      else
         aGet[ ( dbfMaster )->( FieldPos( "lRecargo" ) ) ]:HardDisable()
      end if

      if !Empty( cCodPrv )
         aGet[ ( dbfMaster )->( FieldPos( "cCodPrv" ) ) ]:cText( cCodPrv )
         aGet[ ( dbfMaster )->( FieldPos( "cCodPrv" ) ) ]:lValid()
      end if

      aGet[ ( dbfMaster )->( FieldPos( "cCodPrv" ) ) ]:SetFocus()

   end if

   /*
   Hace que salte la incidencia al entrar en el documento----------------------
   */

   if !Empty( dbfTmpInc )

      while !( dbfTmpInc )->( Eof() )
         if ( dbfTmpInc )->lAviso .and. !( dbfTmpInc )->lListo
            MsgInfo( Trim( ( dbfTmpInc )->mDesInc ), "�Incidencia!" )
         end if
         ( dbfTmpInc )->( dbSkip() )
      end while

      ( dbfTmpInc )->( dbGoTop() )

   end if

   oBrw:Refresh()

return nil

//----------------------------------------------------------------------------//

Function IsPedPrv( cPath )

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "PedProvT.DBF" )
      dbCreate( cPath + "PedProvT.DBF", aSqlStruct( aItmPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedProvL.DBF" )
      dbCreate( cPath + "PedProvL.DBF", aSqlStruct( aColPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedPrvI.Dbf" )
      dbCreate( cPath + "PedPrvI.Dbf", aSqlStruct( aIncPedPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "PedPrvD.Dbf" )
      dbCreate( cPath + "PedPrvD.Dbf", aSqlStruct( aPedPrvDoc() ), cDriver() )
   end if

   if !lExistIndex( cPath + "PedProvT.Cdx" ) .or. ;
      !lExistIndex( cPath + "PedProvL.Cdx" ) .or. ;
      !lExistIndex( cPath + "PedPrvI.Cdx" )  .or. ;
      !lExistIndex( cPath + "PedPrvD.Cdx" )
      rxPedPrv( cPath )
   end if

Return ( nil )

//---------------------------------------------------------------------------//

FUNCTION cDesPedPrv( cPedPrvL )

   DEFAULT cPedPrvL  := TDataView():PedidosProveedoresLineas( nView )

RETURN ( Descrip( cPedPrvL ) )

//---------------------------------------------------------------------------//

Function DesignReportPedPrv( oFr, cDoc )

   local lOpen    := .f.
   local lFlag    := .f.

   /*
   Tratamiento para no hacer dos veces el openfiles al editar el documento en imprimir series
   */

   if lOpenFiles
      lFlag       := .t.
   else
      if Openfiles()
         lFlag    := .t.
         lOpen    := .t.
      else
         lFlag    := .f.
      end if
   end if

   if lFlag

      /*
      Zona de datos------------------------------------------------------------
      */

      DataReport( oFr )

      /*
      Paginas y bandas---------------------------------------------------------
      */

      if !Empty( ( cDoc )->mReport )

         oFr:LoadFromBlob( ( cDoc )->( Select() ), "mReport")

      else

         oFr:SetProperty(     "Report",            "ScriptLanguage", "PascalScript" )
         oFr:SetProperty(     "Report.ScriptText", "Text",;
                                                   + ;
                                                   "procedure DetalleOnMasterDetail(Sender: TfrxComponent);"   + Chr(13) + Chr(10) + ;
                                                   "begin"                                                     + Chr(13) + Chr(10) + ;
                                                   "CallHbFunc('nTotPedPrv');"                                 + Chr(13) + Chr(10) + ;
                                                   "end;"                                                      + Chr(13) + Chr(10) + ;
                                                   "begin"                                                     + Chr(13) + Chr(10) + ;
                                                   "end." )

         oFr:AddPage(         "MainPage" )

         oFr:AddBand(         "CabeceraDocumento", "MainPage", frxPageHeader )
         oFr:SetProperty(     "CabeceraDocumento", "Top", 0 )
         oFr:SetProperty(     "CabeceraDocumento", "Height", 200 )

         oFr:AddBand(         "CabeceraColumnas",  "MainPage", frxMasterData )
         oFr:SetProperty(     "CabeceraColumnas",  "Top", 200 )
         oFr:SetProperty(     "CabeceraColumnas",  "Height", 0 )
         oFr:SetProperty(     "CabeceraColumnas",  "StartNewPage", .t. )
         oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet", "Pedidos" )

         oFr:AddBand(         "DetalleColumnas",   "MainPage", frxDetailData  )
         oFr:SetProperty(     "DetalleColumnas",   "Top", 230 )
         oFr:SetProperty(     "DetalleColumnas",   "Height", 28 )
         oFr:SetObjProperty(  "DetalleColumnas",   "DataSet", "Lineas de pedidos" )
         oFr:SetProperty(     "DetalleColumnas",   "OnMasterDetail", "DetalleOnMasterDetail" )

         oFr:AddBand(         "PieDocumento",      "MainPage", frxPageFooter )
         oFr:SetProperty(     "PieDocumento",      "Top", 930 )
         oFr:SetProperty(     "PieDocumento",      "Height", 110 )

      end if

      /*
      Zona de variables--------------------------------------------------------
      */

      VariableReport( oFr )

      /*
      Dise�o de report---------------------------------------------------------
      */

      oFr:DesignReport()

      /*
      Destruye el dise�ador----------------------------------------------------
      */

      oFr:DestroyFr()

      /*
      Cierra ficheros----------------------------------------------------------
      */

      if lOpen
         CloseFiles()
      end if

   else

      Return .f.

   end if

Return .t.

//---------------------------------------------------------------------------//

Function PrintReportPedPrv( nDevice, nCopies, cPrinter, cDoc )

   local oFr
   local cFilePdf       := cPatTmp() + "PedidoProveedor" + StrTran( ( TDataView():PedidosProveedores( nView ) )->cSerPed + Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) + ( TDataView():PedidosProveedores( nView ) )->cSufPed, " ", "" ) + ".Pdf"

   DEFAULT nDevice      := IS_SCREEN
   DEFAULT nCopies      := 1
   DEFAULT cPrinter     := PrnGetName()

   SysRefresh()

   oFr                  := frReportManager():New()

   oFr:LoadLangRes(     "Spanish.Xml" )

   oFr:SetIcon( 1 )

   oFr:SetTitle(        "Dise�ador de documentos" )

   /*
   Manejador de eventos--------------------------------------------------------
   */

   oFr:SetEventHandler( "Designer", "OnSaveReport", {|| oFr:SaveToBlob( ( cDoc )->( Select() ), "mReport" ) } )

   /*
   Zona de datos------------------------------------------------------------
   */

   DataReport( oFr )

   /*
   Cargar el informe-----------------------------------------------------------
   */

   if !Empty( ( cDoc )->mReport )

      oFr:LoadFromBlob( ( cDoc )->( Select() ), "mReport")

      /*
      Zona de variables--------------------------------------------------------
      */

      VariableReport( oFr )

      /*
      Preparar el report-------------------------------------------------------
      */

      oFr:PrepareReport()

      /*
      Imprimir el informe------------------------------------------------------
      */

      do case
         case nDevice == IS_SCREEN

            oFr:ShowPreparedReport()

         case nDevice == IS_PRINTER

            oFr:PrintOptions:SetPrinter( cPrinter )
            oFr:PrintOptions:SetCopies( nCopies )
            oFr:PrintOptions:SetShowDialog( .f. )
            oFr:Print()

         case nDevice == IS_PDF

            oFr:PrintOptions:SetShowDialog( .f. )
            oFr:SetProperty(  "PDFExport", "DefaultPath",      cPatTmp() )
            oFr:SetProperty(  "PDFExport", "FileName",         cFilePdf )
            oFr:SetProperty(  "PDFExport", "ShowDialog",       .f. )
            oFr:SetProperty(  "PDFExport", "EmbeddedFonts",    .t. )
            oFr:SetProperty(  "PDFExport", "PrintOptimized",   .t. )
            oFr:SetProperty(  "PDFExport", "Outline",          .t. )
            oFr:SetProperty(  "PDFExport", "OpenAfterExport",  .t. )
            oFr:DoExport(     "PDFExport" )

         case nDevice == IS_MAIL

            oFr:SetProperty(  "PDFExport", "ShowDialog",       .f. )
            oFr:SetProperty(  "PDFExport", "DefaultPath",      cPatTmp() )
            oFr:SetProperty(  "PDFExport", "FileName",         cFilePdf )
            oFr:SetProperty(  "PDFExport", "EmbeddedFonts",    .t. )
            oFr:SetProperty(  "PDFExport", "PrintOptimized",   .t. )
            oFr:SetProperty(  "PDFExport", "Outline",          .t. )
            oFr:SetProperty(  "PDFExport", "OpenAfterExport",  .f. )
            oFr:DoExport(     "PDFExport" )

            if file( cFilePdf )

               with object ( TGenMailing():New() )

                  :SetTypeDocument( "nPedPrv" )
                  :SetDe(           uFieldEmpresa( "cNombre" ) )
                  :SetCopia(        uFieldEmpresa( "cCcpMai" ) )
                  :SetAdjunto(      cFilePdf )
                  :SetPara(         RetFld( ( TDataView():PedidosProveedores( nView ) )->cCodPrv, TDataView():Proveedores( nView ), "cMeiInt" ) )
                  :SetAsunto(       "Envio de pedido de proveedor n�mero " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + "/" + Alltrim( Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) ) )
                  :SetMensaje(      "Adjunto le remito nuestro pedido de proveedor " + ( TDataView():PedidosProveedores( nView ) )->cSerPed + "/" + Alltrim( Str( ( TDataView():PedidosProveedores( nView ) )->nNumPed ) ) + Space( 1 ) )
                  :SetMensaje(      "de fecha " + Dtoc( ( TDataView():PedidosProveedores( nView ) )->dfecPed ) + Space( 1 ) )
                  :SetMensaje(      CRLF )
                  :SetMensaje(      CRLF )
                  :SetMensaje(      "Reciba un cordial saludo." )

                  :GeneralResource( TDataView():PedidosProveedores( nView ), aItmFacRec() )

               end with

            end if

      end case

   end if

   /*
   Destruye el dise�ador-------------------------------------------------------
   */

   oFr:DestroyFr()

Return .t.

//---------------------------------------------------------------------------//