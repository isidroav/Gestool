#include "FiveWin.Ch"
#include "Folder.ch"
#include "Report.ch"
#include "Factu.ch"
#include "Xbrowse.ch"

static nLevel
static dbfFacCliP
static dbfFacPrvP
static dbfClient

static dbfFacPrvT
static dbfFacPrvL
static dbfFacCliT
static dbfFacCliL
static dbfFacRecT
static dbfFacRecL
static dbfRctPrvT
static dbfRctPrvL
static dbfAntCliT
static dbfIva
static dbfDiv

static cNewCli
static cNewPrv
static dbfNewRecCli
static dbfNewRecPrv

static oFecIniCli
static oFecFinCli
static dFecIniCli
static dFecFinCli
static oEstadoCli
static aEstadoCli    := { "Pendientes", "Pagados", "Todos" }
static cEstadoCli

static oPeriodoCli
static aPeriodoCli   := {}
static cPeriodoCli

static oPeriodoPrv
static aPeriodoPrv   := {}
static cPeriodoPrv

static oFecIniPrv
static oFecFinPrv
static dFecIniPrv
static dFecFinPrv
static oEstadoPrv
static aEstadoPrv    := { "Pendientes", "Pagados", "Todos" }
static cEstadoPrv

static oBrwRecCli
static oBrwRecPrv

static nMeter        := 0
static oMeter

//----------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles()

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   USE ( cPatEmp() + "FACCLIP.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIP", @dbfFacCliP ) )
   SET ADSINDEX TO ( cPatEmp() + "FACCLIP.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACPRVP.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVP", @dbfFacPrvP ) )
   SET ADSINDEX TO ( cPatEmp() + "FACPRVP.CDX" ) ADDITIVE

   USE ( cPatCli() + "CLIENT.DBF" )    NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT",  @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACPRVT.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacPrvT ) )
   SET ADSINDEX TO ( cPatEmp() + "FACPRVT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACPRVL.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacPrvL ) )
   SET ADSINDEX TO ( cPatEmp() + "FACPRVL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACCLIT.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIT", @dbfFacCliT ) )
   SET ADSINDEX TO ( cPatEmp() + "FACCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACCLIL.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIL", @dbfFacCliL ) )
   SET ADSINDEX TO ( cPatEmp() + "FACCLIL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACRECT.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACRECT", @dbfFacRecT ) )
   SET ADSINDEX TO ( cPatEmp() + "FACRECT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACRECL.DBF" )   NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACRECL", @dbfFacRecL ) )
   SET ADSINDEX TO ( cPatEmp() + "FACRECL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "AntCliT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AntCliT", @dbfAntCliT ) )
   SET ADSINDEX TO ( cPatEmp() + "AntCliT.CDX" ) ADDITIVE

   USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) )
   SET ADSINDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

   USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
   SET ADSINDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfRctPrvT ) )
   SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfRctPrvL ) )
   SET ADSINDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

   /*
   Fichero temporal de recibos de clientes-------------------------------------
   */

   cNewCli  := cGetNewFileName( cPatTmp() + "FACCLIP"  )
   dbCreate( cNewCli, aItmTmpCli(), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewCli, cCheckArea( "FACCLIP", @dbfNewRecCli ), .f. )
   if !( dbfNewRecCli )->( neterr() )

      ( dbfNewRecCli )->( ordCreate( cNewCli, "nNumFac", "cSerie + Str( nNumFac ) + cSufFac + Str( nNumRec )", {|| Field->cSerie + Str( Field->nNumFac ) + Field->cSufFac + Str( Field->nNumRec ) }, ) )
      ( dbfNewRecCli )->( ordListAdd( cNewCli ) )

      ( dbfNewRecCli )->( ordCreate( cNewCli, "dFecVto", "dFecVto", {|| Field->dFecVto } ) )
      ( dbfNewRecCli )->( ordListAdd( cNewCli ) )

   end if

   /*
   Fichero temporal de recibos de proveedores----------------------------------
   */

   cNewPrv  := cGetNewFileName( cPatTmp() + "FacPrvP"  )
   dbCreate( cNewPrv, aItmTmpPrv(), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewPrv, cCheckArea( "FacPrvP", @dbfNewRecPrv ), .f. )
   if !( dbfNewRecPrv )->( neterr() )

      ( dbfNewRecPrv )->( ordCreate( cNewPrv, "nNumFac", "cSerFac + Str( nNumFac ) + cSufFac + Str( nNumRec )", {|| Field->cSerFac + Str( Field->nNumFac ) + Field->cSufFac + Str( Field->nNumRec ) }, ) )
      ( dbfNewRecPrv )->( ordListAdd( cNewPrv ) )

      ( dbfNewRecPrv )->( ordCreate( cNewPrv, "dFecVto", "dFecVto", {|| Field->dFecVto } ) )
      ( dbfNewRecPrv )->( ordListAdd( cNewPrv ) )

   end if


   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      CloseFiles()
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lOpen )

//----------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles()

   if !Empty( dbfNewRecCli )
      ( dbfNewRecCli )->( dbCloseArea() )
   end if

   if !Empty( dbfNewRecPrv )
      ( dbfNewRecPrv )->( dbCloseArea() )
   end if

   if File( cNewCli )
      fErase( cNewCli )
   end if

   if File( cNewPrv )
      fErase( cNewPrv )
   end if

   if !Empty( dbfFacCliP )
      ( dbfFacCliP )->( dbCloseArea() )
   end if

   if !Empty( dbfFacPrvP )
      ( dbfFacPrvP )->( dbCloseArea() )
   end if

   if !Empty( dbfClient )
      ( dbfClient )->( dbCloseArea() )
   end if

   if !Empty( dbfFacPrvT )
      ( dbfFacPrvT )->( dbCloseArea() )
   end if

   if !Empty( dbfFacPrvL )
      ( dbfFacPrvL )->( dbCloseArea() )
   end if

   if !Empty( dbfRctPrvT )
      ( dbfRctPrvT )->( dbCloseArea() )
   end if

   if !Empty( dbfRctPrvL )
      ( dbfRctPrvL )->( dbCloseArea() )
   end if

   if !Empty( dbfFacCliT )
      ( dbfFacCliT )->( dbCloseArea() )
   end if

   if !Empty( dbfFacCliL )
      ( dbfFacCliL )->( dbCloseArea() )
   end if

   if !Empty( dbfFacRecT )
      ( dbfFacRecT )->( dbCloseArea() )
   end if

   if !Empty( dbfFacRecL )
      ( dbfFacRecL )->( dbCloseArea() )
   end if

   if !Empty( dbfAntCliT )
      ( dbfAntCliT )->( dbCloseArea() )
   end if

   if !Empty( dbfIva )
      ( dbfIva )->( dbCloseArea() )
   end if

   if !Empty( dbfDiv )
      ( dbfDiv )->( dbCloseArea() )
   end if

   dbfFacCliP              := nil
   dbfFacPrvP              := nil
   dbfClient               := nil
   dbfNewRecPrv            := nil
   dbfNewRecCli            := nil
   dbfFacPrvT              := nil
   dbfFacPrvL              := nil
   dbfRctPrvT              := nil
   dbfRctPrvL              := nil
   dbfFacCliT              := nil
   dbfFacCliL              := nil
   dbfFacRecT              := nil
   dbfFacRecL              := nil
   dbfAntCliT              := nil
   dbfIva                  := nil
   dbfDiv                  := nil

Return .t.

//----------------------------------------------------------------------------//

FUNCTION PageIni( oMenuItem, oWnd )

   local oDlg
   local oFld
   local oError
   local oBlock
   local oBmpCobros
   local oBmpPagos

   // Return nil

   DEFAULT  oMenuItem      := "01004"
   DEFAULT  oWnd           := oWnd()

   /*
   Obtenemos el nivel de acceso
   */

   nLevel                  := nLevelUsr( oMenuItem )
   if nAnd( nLevel, 1 ) != 0
      msgStop( "Acceso no permitido." )
      return nil
   end if

   /*
   Cerramos todas las ventanas
   */

   if oWnd != nil
      SysRefresh(); oWnd:CloseAll(); SysRefresh()
   end if

   // VistaMenu()

   /*
   Abrimos las tablas necesarias-----------------------------------------------
   */

   if !OpenFiles()
      return nil
   end if

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   /*
   Cargamos los valores por defecto--------------------------------------------
   */

   cEstadoCli  := "Pendientes"
   cEstadoPrv  := "Pendientes"

   aPeriodoCli := aCreaArrayPeriodos()
   cPeriodoCli := "Hoy"
   aPeriodoPrv := aCreaArrayPeriodos()
   cPeriodoPrv := "Hoy"

   /*
   Caja de dialogo_____________________________________________________________
   */

   DEFINE DIALOG oDlg RESOURCE "PAGEINI" OF oWnd

      REDEFINE FOLDER oFld ;
         ID       200 ;
         OF       oDlg ;
         PROMPT   "&Cobros",;
                  "&Pagos" ;
         DIALOGS  "PAGEINI_01",;
                  "PAGEINI_02"

      /*
      PRIMERA CAJA DE DIALOGO--------------------------------------------------
      */

      REDEFINE BITMAP oBmpCobros ;
         ID       500 ;
         RESOURCE "SAFE_INTO_ALPHA_48" ;
         TRANSPARENT ;
         OF       oFld:aDialogs[1]

      REDEFINE COMBOBOX oPeriodoCli ;
         VAR         cPeriodoCli ;
         ID          100 ;
         ITEMS       aPeriodoCli ;
         ON CHANGE   ( lRecFechaCli(), LoadPageIni( .t., .f. ) ) ;
         OF          oFld:aDialogs[1]

      REDEFINE GET oFecIniCli VAR dFecIniCli;
         ID       110 ;
			SPINNER ;
         VALID    ( LoadPageIni( .t., .f. ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET oFecFinCli VAR dFecFinCli;
         ID       120 ;
			SPINNER ;
         VALID    ( LoadPageIni( .t., .f. ) );
         OF       oFld:aDialogs[1]

      REDEFINE COMBOBOX oEstadoCli VAR cEstadoCli ;
         ID       130 ;
         ITEMS    aEstadoCli ;
         ON CHANGE( LoadPageIni( .t., .f. ) );
         OF       oFld:aDialogs[1]

      REDEFINE BUTTON ;
         ID       140 ;
         OF       oFld:aDialogs[1] ;
         ACTION   ( SelAllRecCli( .t. ) )

      REDEFINE BUTTON ;
         ID       150 ;
         OF       oFld:aDialogs[1] ;
         ACTION   ( SelAllRecCli( .f. ) )

      REDEFINE BUTTON ;
         ID       160 ;
         OF       oFld:aDialogs[1] ;
         ACTION   ( SelRecCli() )

      REDEFINE BUTTON ;
         ID       180 ;
         OF       oFld:aDialogs[1] ;
         ACTION   ( if( !Empty( ( dbfNewRecCli )->cSerie ), EdtRecCli( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac + Str( ( dbfNewRecCli )->nNumRec ), .f., !Empty( ( dbfNewRecCli )->cTipRec ) ), ) )

      oBrwRecCli                 := TXBrowse():New( oFld:aDialogs[1] )

      oBrwRecCli:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwRecCli:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwRecCli:cAlias          := dbfNewRecCli

      oBrwRecCli:nMarqueeStyle   := 6
      oBrwRecCli:lRecordSelector := .f.
      // oBrwRecCli:cName           := "Recibos de clientes.Inicio"

      oBrwRecCli:bLDblClick      := {|| SelRecCli() }

      oBrwRecCli:CreateFromResource( 170 )

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "E. Estado"
         :bStrData               := {|| "" }
         :bEditValue             := {|| ( dbfNewRecCli )->lCobrado }
         :nWidth                 := 18
         :SetCheck( { "Sel16", "Cnt16" } )
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "T. Tipo"
         :bEditValue             := {|| if( Empty( (dbfNewRecCli )->cTipRec ), "F. Factura", "R. Rectificativa" ) }
         :nWidth                 := 18
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "N�mero"
         :bEditValue             := {|| AllTrim( ( dbfNewRecCli )->cSerie ) + "/" + AllTrim( Str( ( dbfNewRecCli )->nNumFac ) ) + "/" +  AllTrim( ( dbfNewRecCli )->cSufFac ) + "-" + AllTrim( Str( ( dbfNewRecCli )->nNumRec ) ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "Cliente"
         :bEditValue             := {|| AllTrim( ( dbfNewRecCli )->cCodCli ) }
         :nWidth                 := 60
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "Nombre"
         :bEditValue             := {|| AllTrim( ( dbfNewRecCli )->cNomCli ) }
         :nWidth                 := 130
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "Fecha"
         :bEditValue             := {|| Dtoc( ( dbfNewRecCli )->dPreCob ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "Vencimiento"
         :bEditValue             := {|| Dtoc( ( dbfNewRecCli )->dFecVto ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecCli:AddCol() )
         :cHeader                := "Importe"
         :bEditValue             := {|| ( dbfNewRecCli )->nImporte }
         :cEditPicture           := cPorDiv()
         :nWidth                 := 70
         :nDataStrAlign          := 1
         :nHeadStrAlign          := 1
      end with

      REDEFINE BUTTON ;
         ID       510;
         OF       oFld:aDialogs[1] ;
         ACTION   ( LiquidaRecCli() )

      REDEFINE BUTTON ;
         ID       520;
         OF       oFld:aDialogs[1] ;
         ACTION   ( oDlg:end() )

      /*
      SEGUNDA CAJA DE DIALOGO--------------------------------------------------
      */

      REDEFINE BITMAP oBmpPagos ;
         ID       500 ;
         RESOURCE "SAFE_OUT_ALPHA_48" ;
         TRANSPARENT ;
         OF       oFld:aDialogs[2]

      REDEFINE COMBOBOX oPeriodoPrv ;
         VAR         cPeriodoPrv ;
         ID          100 ;
         ITEMS       aPeriodoPrv ;
         ON CHANGE   ( lRecFechaPrv(), LoadPageIni( .f., .t. ) );
         OF          oFld:aDialogs[2]

      REDEFINE GET oFecIniPrv VAR dFecIniPrv;
         ID       110 ;
			SPINNER ;
         VALID    ( LoadPageIni( .f., .t. ) );
         OF       oFld:aDialogs[2]

      REDEFINE GET oFecFinPrv VAR dFecFinPrv;
         ID       120 ;
			SPINNER ;
         VALID    ( LoadPageIni( .f., .t. ) );
         OF       oFld:aDialogs[2]

      REDEFINE COMBOBOX oEstadoPrv VAR cEstadoPrv ;
         ID       130 ;
         ITEMS    aEstadoPrv ;
         ON CHANGE( LoadPageIni( .f., .t. ) );
         OF       oFld:aDialogs[2]

      REDEFINE BUTTON ;
         ID       140 ;
         OF       oFld:aDialogs[2] ;
         ACTION   ( SelAllRecPrv( .t. ) )

      REDEFINE BUTTON ;
         ID       150 ;
         OF       oFld:aDialogs[2] ;
         ACTION   ( SelAllRecPrv( .f. ) )

      REDEFINE BUTTON ;
         ID       160 ;
         OF       oFld:aDialogs[2] ;
         ACTION   ( SelRecPrv() )

      REDEFINE BUTTON ;
         ID       180 ;
         OF       oFld:aDialogs[2] ;
         ACTION   ( if( !Empty( ( dbfNewRecPrv )->cSerFac ), EdtRecPrv( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac + Str( ( dbfNewRecPrv )->nNumRec ) ), ) )

      oBrwRecPrv                 := IXBrowse():New( oFld:aDialogs[2] )

      oBrwRecPrv:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwRecPrv:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwRecPrv:cAlias          := dbfNewRecPrv

      oBrwRecPrv:nMarqueeStyle   := 6
      oBrwRecPrv:lRecordSelector := .f.
      oBrwRecPrv:cName           := "Recibos de proveedor.Inicio"

      oBrwRecPrv:bLDblClick      := {|| SelRecPrv() }

      oBrwRecPrv:CreateFromResource( 170 )

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "E. Estado"
         :bStrData               := {|| "" }
         :bEditValue             := {|| ( dbfNewRecPrv )->lCobrado }
         :nWidth                 := 18
         :SetCheck( { "Sel16", "Cnt16" } )
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "T. Tipo"
         :bEditValue             := {|| if( Empty( (dbfNewRecPrv )->cTipRec ), "F. Factura", "R. Rectificativa" ) }
         :nWidth                 := 18
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "N�mero"
         :bEditValue             := {|| AllTrim( ( dbfNewRecPrv )->cSerFac ) + "/" + AllTrim( Str( ( dbfNewRecPrv )->nNumFac ) ) + "/" +  AllTrim( ( dbfNewRecPrv )->cSufFac ) + "-" + AllTrim( Str( ( dbfNewRecPrv )->nNumRec ) ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "Proveedor"
         :bEditValue             := {|| AllTrim( ( dbfNewRecPrv )->cCodPrv ) }
         :nWidth                 := 60
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "Nombre"
         :bEditValue             := {|| AllTrim( ( dbfNewRecPrv )->cNomPrv ) }
         :nWidth                 := 130
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "Fecha"
         :bEditValue             := {|| Dtoc( ( dbfNewRecPrv )->dPreCob ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "Vencimiento"
         :bEditValue             := {|| Dtoc( ( dbfNewRecPrv )->dFecVto ) }
         :nWidth                 := 80
      end with

      with object ( oBrwRecPrv:AddCol() )
         :cHeader                := "Importe"
         :bEditValue             := {|| ( dbfNewRecPrv )->nImporte }
         :cEditPicture           := cPirDiv()
         :nWidth                 := 70
         :nDataStrAlign          := 1
         :nHeadStrAlign          := 1
      end with

      REDEFINE BUTTON ;
         ID       510;
         OF       oFld:aDialogs[2] ;
         ACTION   ( LiquidaRecPrv() )

      REDEFINE BUTTON ;
         ID       520;
         OF       oFld:aDialogs[2] ;
         ACTION   ( oDlg:end() )

      /*
      Redefinimos el meter-----------------------------------------------------
      */

      oMeter                     := TMeter():ReDefine( 210, { | u | if( pCount() == 0, nMeter, nMeter := u ) }, ( dbfNewRecPrv )->( LastRec() ), oDlg, .f., , , .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )

      oFld:aDialogs[1]:AddFastKey( VK_F3, {|| if( !Empty( ( dbfNewRecCli )->cSerie ), EdtRecCli( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac + Str( ( dbfNewRecCli )->nNumRec ), .f., !Empty( ( dbfNewRecCli )->cTipRec ) ), ) } )
      oFld:aDialogs[1]:AddFastKey( VK_F5, {|| LiquidaRecCli() } )
      oFld:aDialogs[2]:AddFastKey( VK_F3, {|| if( !Empty( ( dbfNewRecPrv )->cSerFac ), EdtRecPrv( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac + Str( ( dbfNewRecPrv )->nNumRec ) ), ) } )
      oFld:aDialogs[2]:AddFastKey( VK_F5, {|| LiquidaRecPrv() } )

      oDlg:bStart                := {|| lRecFechaCli(), lRecFechaPrv(), LoadPageIni( .t., .t.) }

   ACTIVATE DIALOG oDlg ;
      CENTER

   /*
   Guardamos la configuracion de los browse------------------------------------
   */

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible p�gina de inicio" )

      CloseFiles()

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Cerramos las tablas abiertas------------------------------------------------
   */

   CloseFiles()

   /*
   Matamos el objeto imagen----------------------------------------------------
   */

   if !Empty( oBmpCobros )
      oBmpCobros:End()
   end if

   if !Empty( oBmpPagos )
      oBmpPagos:End()
   end if

RETURN ( NIL )

//----------------------------------------------------------------------------//

static function LoadPageIni( lLoadCli, lLoadPrv )

   local cExpHead    := ""

   DEFAULT lLoadCli  := .t.
   DEFAULT lLoadPrv  := .t.

   /*
   Recargamos la temporal de recibos de clientes-------------------------------
   */

   if lLoadCli

      /*
      Vaciamos la tabla y colocamos los filtros--------------------------------
      */

      ( dbfNewRecCli )->( __dbZap() )

      ( dbfFacCliP )->( OrdSetFocus( "dFecVto" ) )

      do case
         case oEstadoCli:nAt == 1
            cExpHead    := '!lCobrado .and. dFecVto >= Ctod( "' + Dtoc( dFecIniCli ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinCli ) + '" )'
         case oEstadoCli:nAt == 2
            cExpHead    := 'lCobrado .and. dFecVto >= Ctod( "' + Dtoc( dFecIniCli ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinCli ) + '" )'
         case oEstadoCli:nAt == 3
            cExpHead    := 'dFecVto >= Ctod( "' + Dtoc( dFecIniCli ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinCli ) + '" )'
      end case

      if CreateFastFilter( cExpHead, dbfFacCliP, .f., oMeter )

         oMeter:SetTotal( ( dbfFacCliP )->( OrdKeyCount() ) )

         while !( dbfFacCliP )->( Eof() )

            ( dbfNewRecCli )->( dbAppend() )
            ( dbfNewRecCli )->cSerie   := ( dbfFacCliP )->cSerie
            ( dbfNewRecCli )->nNumFac  := ( dbfFacCliP )->nNumFac
            ( dbfNewRecCli )->cSufFac  := ( dbfFacCliP )->cSufFac
            ( dbfNewRecCli )->nNumRec  := ( dbfFacCliP )->nNumRec
            ( dbfNewRecCli )->cTipRec  := ( dbfFacCliP )->cTipRec
            ( dbfNewRecCli )->cCodCli  := ( dbfFacCliP )->cCodCli
            ( dbfNewRecCli )->cNomCli  := ( dbfFacCliP )->cNomCli
            ( dbfNewRecCli )->dEntrada := ( dbfFacCliP )->dEntrada
            ( dbfNewRecCli )->nImporte := ( dbfFacCliP )->nImporte
            ( dbfNewRecCli )->dPreCob  := ( dbfFacCliP )->dPreCob
            ( dbfNewRecCli )->lCobrado := ( dbfFacCliP )->lCobrado
            ( dbfNewRecCli )->dFecVto  := ( dbfFacCliP )->dFecVto
            ( dbfNewRecCli )->( dbUnLock() )

            ( dbfFacCliP )->( dbSkip() )

            oMeter:Set( ( dbfFacCliP )->( OrdKeyNo() ) )

         end while

         oMeter:Set( ( dbfFacCliP )->( LastRec() ) )

         DestroyFastFilter( dbfFacCliP )

      end if

      ( dbfNewRecCli )->( dbGoTop() )

   end if

   /*
   Recargamos la temporal de recibos de proveedores----------------------------
   */

   if lLoadPrv

      /*
      Vaciamos la tabla y colocamos los filtros--------------------------------
      */

      ( dbfNewRecPrv )->( __dbZap() )

      ( dbfFacPrvP )->( OrdSetFocus( "dFecVto" ) )

      do case
         case oEstadoPrv:nAt == 1
            cExpHead    := '!lCobrado .and. dFecVto >= Ctod( "' + Dtoc( dFecIniPrv ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinPrv ) + '" )'
         case oEstadoPrv:nAt == 2
            cExpHead    := 'lCobrado .and. dFecVto >= Ctod( "' + Dtoc( dFecIniPrv ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinPrv ) + '" )'
         case oEstadoPrv:nAt == 3
            cExpHead    := 'dFecVto >= Ctod( "' + Dtoc( dFecIniPrv ) + '" ) .and. dFecVto <= Ctod( "' + Dtoc( dFecFinPrv ) + '" )'
      end case

      if CreateFastFilter( cExpHead, dbfFacPrvP, .f., oMeter )

         oMeter:SetTotal( ( dbfFacPrvP )->( OrdKeyCount() ) )

         while !( dbfFacPrvP )->( Eof() )

            ( dbfNewRecPrv )->( dbAppend() )
            ( dbfNewRecPrv )->cSerFac  := ( dbfFacPrvP )->cSerFac
            ( dbfNewRecPrv )->nNumFac  := ( dbfFacPrvP )->nNumFac
            ( dbfNewRecPrv )->cSufFac  := ( dbfFacPrvP )->cSufFac
            ( dbfNewRecPrv )->nNumRec  := ( dbfFacPrvP )->nNumRec
            ( dbfNewRecPrv )->cTipRec  := ( dbfFacPrvP )->cTipRec
            ( dbfNewRecPrv )->cCodPrv  := ( dbfFacPrvP )->cCodPrv
            ( dbfNewRecPrv )->cNomPrv  := ( dbfFacPrvP )->cNomPrv
            ( dbfNewRecPrv )->dEntrada := ( dbfFacPrvP )->dEntrada
            ( dbfNewRecPrv )->nImporte := ( dbfFacPrvP )->nImporte
            ( dbfNewRecPrv )->dPreCob  := ( dbfFacPrvP )->dPreCob
            ( dbfNewRecPrv )->lCobrado := ( dbfFacPrvP )->lCobrado
            ( dbfNewRecPrv )->dFecVto  := ( dbfFacPrvP )->dFecVto
            ( dbfNewRecPrv )->( dbUnLock() )

            ( dbfFacPrvP )->( dbSkip() )

            oMeter:Set( ( dbfFacPrvP )->( OrdKeyNo() ) )

         end while

         oMeter:Set( ( dbfFacPrvP )->( LastRec() ) )

         DestroyFastFilter( dbfFacPrvP )

      end if

      ( dbfNewRecPrv )->( dbGoTop() )

   end if

   /*
   Refrescamos los browse------------------------------------------------------
   */

   if !Empty( oBrwRecCli )
      oBrwRecCli:Refresh()
   end if

   if !Empty( oBrwRecPrv )
      oBrwRecPrv:Refresh()
   end if

return .t.

//----------------------------------------------------------------------------//

static function aItmTmpCli()

   local aBasRecCli  := {}

   aAdd( aBasRecCli, {"cSerie"      ,"C",  1, 0, "Serie de factura",            "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"nNumFac"     ,"N",  9, 0, "N�mero de factura",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"cSufFac"     ,"C",  2, 0, "Sufijo de factura",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"nNumRec"     ,"N",  2, 0, "N�mero del recibo",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"cTipRec"     ,"C",  1, 0, "Tipo de recibo",              "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"cCodCli"     ,"C", 12, 0, "C�digo de cliente",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"cNomCli"     ,"C", 80, 0, "Nombre de cliente",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"dEntrada"    ,"D",  8, 0, "Fecha de cobro",              "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"nImporte"    ,"N", 16, 6, "Importe",                     "cPorDivRec",         "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"dPreCob"     ,"D",  8, 0, "Fecha de previsi�n de cobro", "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"lCobrado"    ,"L",  1, 0, "L�gico de cobrado",           "",                   "", "( cDbfRec )" } )
   aAdd( aBasRecCli, {"dFecVto"     ,"D",  8, 0, "Fecha de vencimiento",        "",                   "", "( cDbfRec )" } )

return ( aBasRecCli )

//---------------------------------------------------------------------------//

static function aItmTmpPrv()

   local aRecFacPrv := {}

   aAdd( aRecFacPrv, { "cSerFac"    ,"C",  1, 0, "Serie de factura",                      "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "nNumFac"    ,"N",  9, 0, "N�mero de factura",                     "'999999999'", "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "cSufFac"    ,"C",  2, 0, "Sufijo de factura",                     "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "nNumRec"    ,"N",  2, 0, "N�mero del recibo",                     "'99'",        "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "cTipRec"    ,"C",  1, 0, "Tipo de recibo",                        "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "CCODPRV"    ,"C", 12, 0, "C�digo de proveedor",                   "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "cNomPrv"    ,"C", 80, 0, "Nombre de proveedor",                   "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "DENTRADA"   ,"D",  8, 0, "Fecha de entrada",                      "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "NIMPORTE"   ,"N", 16, 6, "Importe del pago",                      "cPirDivRec",  "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "DPRECOB"    ,"D",  8, 0, "Fecha de previsi�n de pago",            "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "LCOBRADO"   ,"L",  1, 0, "L�gico de pagado" ,                     "",            "", "( cDbfRec )" } )
   aAdd( aRecFacPrv, { "DFECVTO"    ,"D",  8, 0, "Fecha de vencimiento",                  "",            "", "( cDbfRec )" } )

return ( aRecFacPrv )

//---------------------------------------------------------------------------//

function SelAllRecCli( lSel )

   ( dbfNewRecCli )->( dbGoTop() )

   oMeter:SetTotal( ( dbfNewRecCli )->( OrdKeyCount() ) )

   while !( dbfNewRecCli )->( Eof() )

      if dbLock( dbfNewRecCli )
         ( dbfNewRecCli )->lCobrado    := lSel
         ( dbfNewRecCli )->( dbUnLock() )
      end if

      ( dbfNewRecCli )->( dbSkip() )

      oMeter:Set( ( dbfNewRecCli )->( OrdKeyNo() ) )

   end while

   oMeter:Set( ( dbfNewRecCli )->( LastRec() ) )

   ( dbfNewRecCli )->( dbGoTop() )

   if !Empty( oBrwRecCli )
      oBrwRecCli:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

function SelAllRecPrv( lSel )

   ( dbfNewRecPrv )->( dbGoTop() )

   oMeter:SetTotal( ( dbfNewRecPrv )->( OrdKeyCount() ) )

   while !( dbfNewRecPrv )->( Eof() )

      if dbLock( dbfNewRecPrv )
         ( dbfNewRecPrv )->lCobrado    := lSel
         ( dbfNewRecPrv )->( dbUnLock() )
      end if

      ( dbfNewRecPrv )->( dbSkip() )

      oMeter:Set( ( dbfNewRecPrv )->( OrdKeyNo() ) )

   end while

   oMeter:Set( ( dbfNewRecPrv )->( LastRec() ) )

   ( dbfNewRecPrv )->( dbGoTop() )

   if !Empty( oBrwRecPrv )
      oBrwRecPrv:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

function SelRecCli()

   if dbLock( dbfNewRecCli )
      ( dbfNewRecCli )->lCobrado    := .t.
      ( dbfNewRecCli )->( dbUnLock() )
   end if

   if !Empty( oBrwRecCli )
      oBrwRecCli:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

function SelRecPrv()

   if dbLock( dbfNewRecPrv )
      ( dbfNewRecPrv )->lCobrado    := .t.
      ( dbfNewRecPrv )->( dbUnLock() )
   end if

   if !Empty( oBrwRecPrv )
      oBrwRecPrv:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

static function LiquidaRecCli()

   ( dbfNewRecCli )->( dbGoTop() )

   oMeter:SetTotal( ( dbfNewRecCli )->( OrdKeyCount() ) )

   while !( dbfNewRecCli )->( Eof() )

      if ( dbfNewRecCli )->lCobrado

         if Empty( ( dbfNewRecCli )->cTipRec )

            if dbSeekInOrd( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac + Str( ( dbfNewRecCli )->nNumRec ), "pNumFac", dbfFacCliP )  .and.;
               !( dbfFacCliP )->lCobrado

               if ( dbfFacCliP )->( dbRLock() )
                  ( dbfFacCliP )->lCobrado   := .t.
                  ( dbfFacCliP )->dEntrada   := GetSysDate()
                  ( dbfFacCliP )->cTurRec    := cCurSesion()
                  delRiesgo( ( dbfFacCliP )->nImporte, ( dbfFacCliP )->cCodCli, dbfClient )
                  ( dbfFacCliP )->( dbUnLock() )
               end if

               /*
               Actualizamos el estado de la factura----------------------------------
               */

               if ( dbfFacCliT )->( dbSeek( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac ) )
                  ChkLqdFacCli( nil, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfIva, dbfDiv )
               end if

            end if

         else

            if dbSeekInOrd( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac + Str( ( dbfNewRecCli )->nNumRec ), "rNumFac", dbfFacCliP ) .and.;
               !( dbfFacCliP )->lCobrado

               if ( dbfFacCliP )->( dbRLock() )
                  ( dbfFacCliP )->lCobrado   := .t.
                  ( dbfFacCliP )->dEntrada   := GetSysDate()
                  ( dbfFacCliP )->cTurRec    := cCurSesion()
                  delRiesgo( ( dbfFacCliP )->nImporte, ( dbfFacCliP )->cCodCli, dbfClient )
                  ( dbfFacCliP )->( dbUnLock() )
               end if

               /*
               Actualizamos el estado de la factura----------------------------------
               */

               if ( dbfFacRecT )->( dbSeek( ( dbfNewRecCli )->cSerie + Str( ( dbfNewRecCli )->nNumFac ) +  ( dbfNewRecCli )->cSufFac ) )
                  ChkLqdFacRec( nil, dbfFacRecT, dbfFacRecL, dbfFacCliP, dbfIva, dbfDiv )
               end if

            end if

         end if

      end if

      ( dbfNewRecCli )->( dbSkip() )

      oMeter:Set( ( dbfNewRecCli )->( OrdKeyNo() ) )

   end while

   oMeter:Set( ( dbfNewRecCli )->( LastRec() ) )

   LoadPageIni( .t., .f. )

   Msginfo( "Proceso Finalizado con �xito" )

   if !Empty( oBrwRecCli )
      oBrwRecCli:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

static function LiquidaRecPrv()

   local nOrdAnt  := ( dbfFacPrvP )->( OrdSetFocus( "nNumFac" ) )

   ( dbfNewRecPrv )->( dbGoTop() )

   oMeter:SetTotal( ( dbfNewRecPrv )->( OrdKeyCount() ) )

   while !( dbfNewRecPrv )->( Eof() )

      if ( dbfNewRecPrv )->lCobrado

         if Empty( ( dbfNewRecPrv )->cTipRec )

            if dbSeekInOrd( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac + Str( ( dbfNewRecPrv )->nNumRec ), "fNumFac", dbfFacPrvP ) .and.;
               !( dbfFacPrvP )->lCobrado

               if ( dbfFacPrvP )->( dbRLock() )
                  ( dbfFacPrvP )->lCobrado   := .t.
                  ( dbfFacPrvP )->dEntrada   := GetSysDate()
                  ( dbfFacPrvP )->cTurRec    := cCurSesion()
                  ( dbfFacPrvP )->( dbUnLock() )
               end if

            end if

            /*
            Actualizamos el estado de la factura----------------------------------
            */

            if ( dbfFacPrvT )->( dbSeek( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac ) )
               ChkLqdFacPrv( nil, dbfFacPrvT, dbfFacPrvL, dbfFacPrvP, dbfIva, dbfDiv )
            end if

         else

            if dbSeekInOrd( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac + Str( ( dbfNewRecPrv )->nNumRec ), "rNumFac", dbfFacPrvP ) .and.;
               !( dbfFacPrvP )->lCobrado

               if ( dbfFacPrvP )->( dbRLock() )
                  ( dbfFacPrvP )->lCobrado   := .t.
                  ( dbfFacPrvP )->dEntrada   := GetSysDate()
                  ( dbfFacPrvP )->cTurRec    := cCurSesion()
                  ( dbfFacPrvP )->( dbUnLock() )
               end if

            end if

            /*
            Actualizamos el estado de la factura----------------------------------
            */

            if ( dbfRctPrvT )->( dbSeek( ( dbfNewRecPrv )->cSerFac + Str( ( dbfNewRecPrv )->nNumFac ) +  ( dbfNewRecPrv )->cSufFac ) )
               ChkLqdRctPrv( nil, dbfRctPrvT, dbfRctPrvL, dbfFacPrvP, dbfIva, dbfDiv )
            end if

         end if

      end if

      ( dbfNewRecPrv )->( dbSkip() )

      oMeter:Set( ( dbfNewRecPrv )->( OrdKeyNo() ) )

   end while

   oMeter:Set( ( dbfNewRecPrv )->( LastRec() ) )

   ( dbfFacCliP )->( OrdSetFocus( nOrdAnt ) )

   LoadPageIni( .f., .t. )

   Msginfo( "Proceso Finalizado con �xito" )

   if !Empty( oBrwRecPrv )
      oBrwRecPrv:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

static function aCreaArrayPeriodos()

   local aPeriodo := {}

   aAdd( aPeriodo, "Hoy" )

   aAdd( aPeriodo, "Ayer" )

   aAdd( aPeriodo, "Mes en curso" )

   aAdd( aPeriodo, "Mes anterior" )

   do case
      case Month( GetSysDate() ) <= 3
         aAdd( aPeriodo, "Primer trimestre" )

      case Month( GetSysDate() ) > 3 .and. Month( GetSysDate() ) <= 6
         aAdd( aPeriodo, "Primer trimestre" )
         aAdd( aPeriodo, "Segundo trimestre" )

      case Month( GetSysDate() ) > 6 .and. Month( GetSysDate() ) <= 9
         aAdd( aPeriodo, "Primer trimestre" )
         aAdd( aPeriodo, "Segundo trimestre" )
         aAdd( aPeriodo, "Tercer trimestre" )

      case Month( GetSysDate() ) > 9 .and. Month( GetSysDate() ) <= 12
         aAdd( aPeriodo, "Primer trimestre" )
         aAdd( aPeriodo, "Segundo trimestre" )
         aAdd( aPeriodo, "Tercer trimestre" )
         aAdd( aPeriodo, "Cuatro trimestre" )

   end case

   aAdd( aPeriodo, "Doce �ltimos meses" )

   aAdd( aPeriodo, "A�o en curso" )

   aAdd( aPeriodo, "A�o anterior" )

Return ( aPeriodo )

//---------------------------------------------------------------------------//

Static Function lRecFechaCli()

   do case
      case cPeriodoCli == "Hoy"

         oFecIniCli:cText( GetSysDate() )
         oFecFinCli:cText( GetSysDate() )

      case cPeriodoCli == "Ayer"

         oFecIniCli:cText( GetSysDate() -1 )
         oFecFinCli:cText( GetSysDate() -1 )

      case cPeriodoCli == "Mes en curso"

         oFecIniCli:cText( CtoD( "01/" + Str( Month( GetSysDate() ) ) + "/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( GetSysDate() )

      case cPeriodoCli == "Mes anterior"

         oFecIniCli:cText( CtoD( "01/" + Str( Month( GetSysDate() ) - 1 ) + "/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( nLastDay( Month( GetSysDate() ) - 1 ) )

      case cPeriodoCli == "Primer trimestre"

         oFecIniCli:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( CtoD( "31/03/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoCli == "Segundo trimestre"

         oFecIniCli:cText( CtoD( "01/04/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( CtoD( "30/06/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoCli == "Tercer trimestre"

         oFecIniCli:cText( CtoD( "01/07/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( CtoD( "30/09/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoCli == "Cuatro trimestre"

         oFecIniCli:cText( CtoD( "01/10/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoCli == "Doce �ltimos meses"

         oFecIniCli:cText( CtoD( Str( Day( GetSysDate() ) ) + "/" + Str( Month( GetSysDate() ) ) + "/" + Str( Year( GetSysDate() ) -1 ) ) )
         oFecFinCli:cText( GetSysDate() )

      case cPeriodoCli == "A�o en curso"

         oFecIniCli:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinCli:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoCli == "A�o anterior"

         oFecIniCli:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) - 1 ) ) )
         oFecFinCli:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) - 1 ) ) )

   end case

   oFecIniCli:Refresh()
   oFecFinCli:Refresh()

RETURN ( .t. )

//---------------------------------------------------------------------------//

Static Function lRecFechaPrv()

   do case
      case cPeriodoPrv == "Hoy"

         oFecIniPrv:cText( GetSysDate() )
         oFecFinPrv:cText( GetSysDate() )

      case cPeriodoPrv == "Ayer"

         oFecIniPrv:cText( GetSysDate() -1 )
         oFecFinPrv:cText( GetSysDate() -1 )

      case cPeriodoPrv == "Mes en curso"

         oFecIniPrv:cText( CtoD( "01/" + Str( Month( GetSysDate() ) ) + "/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( GetSysDate() )

      case cPeriodoPrv == "Mes anterior"

         oFecIniPrv:cText( CtoD( "01/" + Str( Month( GetSysDate() ) - 1 ) + "/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( nLastDay( Month( GetSysDate() ) - 1 ) )

      case cPeriodoPrv == "Primer trimestre"

         oFecIniPrv:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( CtoD( "31/03/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoPrv == "Segundo trimestre"

         oFecIniPrv:cText( CtoD( "01/04/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( CtoD( "30/06/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoPrv  == "Tercer trimestre"

         oFecIniPrv:cText( CtoD( "01/07/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( CtoD( "30/09/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoPrv == "Cuatro trimestre"

         oFecIniPrv:cText( CtoD( "01/10/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoPrv == "Doce �ltimos meses"

         oFecIniPrv:cText( CtoD( Str( Day( GetSysDate() ) ) + "/" + Str( Month( GetSysDate() ) ) + "/" + Str( Year( GetSysDate() ) -1 ) ) )
         oFecFinPrv:cText( GetSysDate() )

      case cPeriodoPrv == "A�o en curso"

         oFecIniPrv:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) ) ) )
         oFecFinPrv:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) ) ) )

      case cPeriodoPrv == "A�o anterior"

         oFecIniPrv:cText( CtoD( "01/01/" + Str( Year( GetSysDate() ) - 1 ) ) )
         oFecFinPrv:cText( CtoD( "31/12/" + Str( Year( GetSysDate() ) - 1 ) ) )

   end case

   oFecIniPrv:Refresh()
   oFecFinPrv:Refresh()

RETURN ( .t. )

//---------------------------------------------------------------------------//
/*
Function VistaMenu()

   local oWnd
   local oIcon
   local oVmenu
   local oItem

   DEFINE WINDOW oWnd TITLE "First test VistaMenu" ICON oIcon

    oVMenu           := TVistaMenu():New( 0,0, 100, 100, oWnd )
    oVMenu:nColumns  := 1
    oVMenu:nType     := 2

    oItem := oVMenu:AddItem( "Sistema y mantenimiento ", ".\..\bitmaps\pngs\image1.png" )
             oItem:AddItem( "Empezar a trabajar con windows",,;
                            { || MsgInfo( "Sistema y mantenimiento" ) } )
             oItem:AddItem( "Hacer una copia de seguridad del equipo" )
             oItem:AddItem( "Item 1 Item 1" )
             oItem:AddItem( "ItemItem2 ItemItem2" )
             oItem:AddItem( "ItemItemItem3 ItemItemItem3" )

    oItem := oVMenu:AddItem( "Seguridad", ".\..\bitmaps\pngs\image2.png" )
             oItem:AddItem( "Buscar actualizaciones" )
             oItem:AddItem( "Dejar pasar un programa a trav�s de Firewall de Windows" )

    oItem := oVMenu:AddItem( "Redes e Internet", ".\..\bitmaps\pngs\image3.png" )
    oItem:lEnable := .f.
             oItem:AddItem( "Ver el estado y las tareas de red" )
             oItem:AddItem( "Configurar el uso compartido de archivos" )

    oItem := oVMenu:AddItem( "Hardware y sonido", ".\..\bitmaps\pngs\image4.png" )
             oItem:AddItem( "Reproducir un CD u otros archivos multimedia autom�ticamente" )
             oItem:AddItem( "Impresora" )
             oItem:AddItem( "Mouse" )

    oItem := oVMenu:AddItem( "Programas", ".\..\bitmaps\pngs\image5.png" )
             oItem:AddItem( "Desinstalar un programa" )
             oItem:AddItem( "Cambiar programas de inicio" )

    oItem := oVMenu:AddItem( "Equipo portatil", ".\..\bitmaps\pngs\image6.png" )
             oItem:AddItem( "Cambiar la configuraci�n de la bateria" )
             oItem:AddItem( "Ajustar parametros de configuraci�n de movilidad de uso frecuente" )

    oItem := oVMenu:AddItem( "Cuentas de usuario", ".\..\bitmaps\pngs\image7.png" )
             oItem:AddItem( "Cambiar tipo de cuenta" )

    oItem := oVMenu:AddItem( "Opciones adicionales", ".\..\bitmaps\pngs\image12.png" )

    oItem := oVMenu:AddItem( "Apariencia y personalizaci�n", ".\..\bitmaps\pngs\image8.png" )
             oItem:AddItem( "Cambiar fondo de escritorio" )
             oItem:AddItem( "Cambiar la combinaci�n de colores" )
             oItem:AddItem( "Ajustar la resoluci�n de pantalla" )

    oItem := oVMenu:AddItem( "Reloj, idioma y regi�n", ".\..\bitmaps\pngs\image9.png" )
             oItem:AddItem( "Cambiar teclados u otros m�todos de entrada" )
             oItem:AddItem( "Cambiar el idioma para mostrar" )

    oItem := oVMenu:AddItem( "Accesibilidad", ".\..\bitmaps\pngs\image10.png" )
             oItem:AddItem( "Permitir que Windows sugiera parametros de configuraci�n" )
             oItem:AddItem( "Optimizar la presentaci�n visual" )

    oWnd:oClient := oVMenu

   ACTIVATE WINDOW oWnd

Return ( 0 )
*/
//---------------------------------------------------------------------------//

























































































