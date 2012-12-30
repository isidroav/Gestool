#ifndef __PDA__
#include "FiveWin.Ch"
#include "Font.ch"
#include "Report.ch"
#include "Factu.ch"
#else
#include "FWCE.ch"
REQUEST DBFCDX
#endif

#ifndef __PDA__

#define _CCODALM                   1      //   C      3     0
#define _CNOMALM                   2      //   C     20     0
#define _CDIRALM                   3      //   C     50     0
#define _CPOSALM                   4      //   C      7     0
#define _CPOBALM                   5      //   C     30     0
#define _CPROALM                   6      //   C     20     0
#define _CTFNALM                   7      //   C     12     0
#define _CFAXALM                   8      //   C     12     0
#define _CPERALM                   9      //   C     50     0
#define _CCODCLI                   10     //   C     14     0
#define _CUBICA1                   11     //   C      5     0
#define _CUBICA2                   12     //   C      5     0
#define _CUBICA3                   13     //   C      5     0
#define _CNOMUBI1                  14     //   C     30     0
#define _CNOMUBI2                  15     //   C     30     0
#define _CNOMUBI3                  16     //   C     30     0

static bEdit := { |aTemp, aoGet, dbfAlmT, oBrw, bWhen, bValid, nMode | EdtRec( aTemp, aoGet, dbfAlmT, oBrw, bWhen, bValid, nMode ) }
static bEdit2:= {	|aTemp, aoGet, dbfAlmL, oBrw, bWhen, bValid, nMode, cCodAlm | EdtDet( aTemp, aoGet, dbfAlmL, oBrw, bWhen, bValid, nMode, cCodAlm ) }

#endif

static oWndBrw
static dbfAlmT
static dbfAlmL
static dbfAgent
static dbfUbicaT
static dbfUbicaL
static dbfTmp
static cNewFile

static aBase := { { "CCODALM",  "C",      3,     0, "C�digo de almacen"              ,  "",   "", "( cDbfAlm )" },;
                  { "CNOMALM",  "C",     20,     0, "Nombre de almacen"              ,  "",   "", "( cDbfAlm )" },;
                  { "CDIRALM",  "C",     50,     0, "Domicilio de almacen"           ,  "",   "", "( cDbfAlm )" },;
                  { "CPOSALM",  "C",      7,     0, "C�digo postal de almacen"       ,  "",   "", "( cDbfAlm )" },;
                  { "CPOBALM",  "C",     30,     0, "Poblaci�n de almacen"           ,  "",   "", "( cDbfAlm )" },;
                  { "CPROALM",  "C",     20,     0, "Provincia de almacen"           ,  "",   "", "( cDbfAlm )" },;
                  { "CTFNALM",  "C",     12,     0, "Tel�fono de almacen"            ,  "",   "", "( cDbfAlm )" },;
                  { "CFAXALM",  "C",     12,     0, "Fax de almacen"                 ,  "",   "", "( cDbfAlm )" },;
                  { "CPERALM",  "C",     50,     0, "Persona de contacto de almacen" ,  "",   "", "( cDbfAlm )" },;
                  { "CCODCLI",  "C",     12,     0, "Codigo del cliente"             ,  "",   "", "( cDbfAlm )" },;
                  { "CUBICA1",  "C",      5,     0, "Ubicaci�n 1"                    ,  "",   "", "( cDbfAlm )" },;
                  { "CUBICA2",  "C",      5,     0, "Ubicaci�n 2"                    ,  "",   "", "( cDbfAlm )" },;
                  { "CUBICA3",  "C",      5,     0, "Ubicaci�n 3"                    ,  "",   "", "( cDbfAlm )" },;
                  { "CNOMUBI1", "C",     30,     0, "Nombre ubicaci�n 1"             ,  "",   "", "( cDbfAlm )" },;
                  { "CNOMUBI2", "C",     30,     0, "Nombre ubicaci�n 2"             ,  "",   "", "( cDbfAlm )" },;
                  { "CNOMUBI3", "C",     30,     0, "Nombre ubicaci�n 3"             ,  "",   "", "( cDbfAlm )" } }

static aBase2:= { { "CCODALM",  "C",      3,     0, "" },;
						{ "CCODAGE",  "C",      3,     0, "" } }

//----------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION Almacen( oMenuItem, oWnd )

   local nLevel

   DEFAULT  oMenuItem   := "01035"
   DEFAULT  oWnd        := oWnd()

	IF oWndBrw == NIL

      /*
      Obtenemos el nivel de acceso
      */

      nLevel            := nLevelUsr( oMenuItem )
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

      /*
      Apertura de ficheros
      */

      if !lOpenFiles()
         return nil
      end if

      /*
      Anotamos el movimiento para el navegador
      */

      AddMnuNext( "Almacen", ProcName() )

      DEFINE SHELL oWndBrw FROM 2, 10 TO 18, 70;
      XBROWSE ;
      TITLE    "Almac�n" ;
      PROMPT   "C�digo",;
					"Nombre";
      MRU      "Package_16";
      BITMAP   clrTopAlmacenes ;
		ALIAS		( dbfAlmT ) ;
      APPEND   ( WinAppRec( oWndBrw:oBrw, bEdit, dbfAlmT ) );
      DUPLICAT ( WinDupRec( oWndBrw:oBrw, bEdit, dbfAlmT ) );
		EDIT 		( WinEdtRec( oWndBrw:oBrw, bEdit, dbfAlmT ) ) ;
		DELETE   ( DBDelRec(  oWndBrw:oBrw, dbfAlmT ) ) ;
      LEVEL    nLevel ;
		OF 		oWnd

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodAlm"
         :bEditValue       := {|| ( dbfAlmT )->cCodAlm }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cNomAlm"
         :bEditValue       := {|| ( dbfAlmT )->cNomAlm }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfAlmT )->cDirAlm }
         :nWidth           := 280
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo postal"
         :bEditValue       := {|| ( dbfAlmT )->cPosAlm }
         :nWidth           := 60
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Poblaci�n"
         :bEditValue       := {|| ( dbfAlmT )->cPobAlm }
         :nWidth           := 180
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Provincia"
         :bEditValue       := {|| ( dbfAlmT )->cProAlm }
         :nWidth           := 140
      end with

      oWndBrw:cHtmlHelp    := "Almacen"

      oWndBrw:CreateXFromCode()

      DEFINE BTNSHELL RESOURCE "BUS" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( oWndBrw:SearchSetFocus() ) ;
			TOOLTIP 	"(B)uscar" ;
         HOTKEY   "B"

      oWndBrw:AddSeaBar()

      DEFINE BTNSHELL RESOURCE "NEW" OF oWndBrw ;
			NOBORDER ;
			ACTION 	( oWndBrw:RecAdd() );
			ON DROP	( oWndBrw:RecDup() );
			TOOLTIP 	"(A)�adir";
         BEGIN GROUP;
         HOTKEY   "A" ;
         LEVEL    ACC_APPD

      DEFINE BTNSHELL RESOURCE "DUP" OF oWndBrw ;
			NOBORDER ;
			ACTION 	( oWndBrw:RecDup() );
			TOOLTIP 	"(D)uplicar";
         MRU ;
         HOTKEY   "D" ;
         LEVEL    ACC_APPD

		DEFINE BTNSHELL RESOURCE "EDIT" OF oWndBrw ;
			NOBORDER ;
			ACTION  	( oWndBrw:RecEdit() );
         TOOLTIP  "(M)odificar";
         MRU ;
         HOTKEY   "M";
         LEVEL    ACC_EDIT

		DEFINE BTNSHELL RESOURCE "ZOOM" OF oWndBrw ;
			NOBORDER ;
			ACTION  	( WinZooRec( oWndBrw:oBrw, bEdit, dbfAlmT ) );
			TOOLTIP 	"(Z)oom";
         MRU ;
         HOTKEY   "Z";
         LEVEL    ACC_ZOOM

		DEFINE BTNSHELL RESOURCE "DEL" OF oWndBrw ;
			NOBORDER ;
			ACTION 	( oWndBrw:RecDel() );
			TOOLTIP 	"(E)liminar";
         MRU ;
         HOTKEY   "E";
         LEVEL    ACC_DELE

#ifndef __TACTIL__

      DEFINE BTNSHELL RESOURCE "IMP" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( InfAlm():New( "Listado de almacenes" ):Play() ) ;
         TOOLTIP  "(L)istado" ;
         HOTKEY   "L";
         LEVEL    ACC_IMPR

#endif

      DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBrw ;
			NOBORDER ;
         ACTION   ( oWndBrw:End() ) ;
         TOOLTIP  "(S)alir" ;
			HOTKEY 	"S"

		ACTIVATE WINDOW oWndBrw VALID ( CloseFiles() )

	ELSE

		oWndBrw:SetFocus()

	END IF

RETURN NIL

//----------------------------------------------------------------------------//

STATIC FUNCTION EdtRec( aTemp, aoGet, dbfAlmT, oBrw, bWhen, bValid, nMode )

	local oDlg
   local oGet
   local oGet2
	local oBrw2
   local cCodCli
   local oCodCli
   local oFld
   local oBmpGeneral

	BeginTrans( aTemp )

   DEFINE DIALOG oDlg RESOURCE "ALMACEN" TITLE LblTitle( nMode ) + "Almac�n"

      REDEFINE FOLDER oFld;
         ID       100 ;
         OF       oDlg ;
         PROMPT   "&General",;
                  "&Facturaci�n y agentes";
         DIALOGS  "ALMACEN_01",;
                  "ALMACEN_02";

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "package_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[1]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "security_agent_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[2]

      REDEFINE GET oGet VAR aTemp[ _CCODALM ];
         ID       100 ;
         WHEN     ( nMode == APPD_MODE .or. nMode == DUPL_MODE ) ;
         VALID    ( NotValid( oGet, dbfAlmT, .T., "0" ) ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oGet2 VAR aTemp[ _CNOMALM ];
         ID       110   ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CDIRALM ];
         ID       120 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "@!" ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CPOSALM ];
         ID       130 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CPOBALM ];
         ID       140 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CPROALM ];
         ID       150 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CTFNALM ];
         ID       160 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         PICTURE  "@R ##########" ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CFAXALM ];
         ID       170 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         PICTURE  "@R ##########" ;
         OF       oFld:aDialogs[1]

		REDEFINE GET aTemp[ _CPERALM ];
         ID       180;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CUBICA1 ] VAR aTemp[ _CUBICA1 ];
         ID       190;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         COLOR    CLR_GET ;
         ON HELP  ( BrwUbicacion( aoGet[ _CUBICA1 ], dbfUbicaT, aoGet[ _CNOMUBI1 ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CNOMUBI1 ] VAR aTemp[ _CNOMUBI1 ] ;
         WHEN     .F. ;
         ID       191 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CUBICA2 ] VAR aTemp[ _CUBICA2 ];
         ID       200;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         COLOR    CLR_GET ;
         ON HELP  ( BrwUbicacion( aoGet[ _CUBICA2 ], dbfUbicaT, aoGet[ _CNOMUBI2 ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CNOMUBI2 ] VAR aTemp[ _CNOMUBI2 ] ;
         WHEN     .F. ;
         ID       201 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CUBICA3 ] VAR aTemp[ _CUBICA3 ];
         ID       210;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         COLOR    CLR_GET ;
         ON HELP  ( BrwUbicacion( aoGet[ _CUBICA3 ], dbfUbicaT, aoGet[ _CNOMUBI3 ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CNOMUBI3 ] VAR aTemp[ _CNOMUBI3 ] ;
         WHEN     .F. ;
         ID       211 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aoGet[ _CCODCLI ] VAR aTemp[ _CCODCLI ];
         ID       190;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cClient( aoGet[ _CCODCLI ], , oCodCli ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwClient( aoGet[ _CCODCLI ], oCodCli ) ) ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[2]

      REDEFINE GET oCodCli VAR cCodCli ;
         WHEN     .F. ;
         COLOR    CLR_GET ;
         ID       200 ;
         OF       oFld:aDialogs[2]

      oBrw2                := TXBrowse():New( oFld:aDialogs[2] )

      oBrw2:bClrSel        := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw2:bClrSelFocus   := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw2:cAlias          := dbfTmp
      oBrw2:nMarqueeStyle   := 5

      with object ( oBrw2:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| ( dbfTmp )->cCodAge }
         :nWidth           := 120
      end with

      with object ( oBrw2:AddCol() )
         :cHeader          := "Agente"
         :bEditValue       := {|| RetNbrAge( ( dbfTmp )->cCodAge, dbfAgent ) }
         :nWidth           := 550
      end with

      oBrw2:bLDblClick     := {|| oDlg:end( IDOK ) }

      oBrw2:CreateFromResource( 210 )

      if nMode != ZOOM_MODE
         oBrw2:bLDblClick  := {|| EdtDeta( oBrw2, bEdit2, aTemp ) }
      end if

      REDEFINE BUTTON ;
			ID 		500 ;
         OF       oFld:aDialogs[2] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ACTION 	( AppDeta( oBrw2, bEdit2, aTemp) )

      REDEFINE BUTTON ;
			ID 		501 ;
         OF       oFld:aDialogs[2] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ACTION 	( EdtDeta( oBrw2, bEdit2, aTemp ) )

      REDEFINE BUTTON ;
			ID 		502 ;
         OF       oFld:aDialogs[2] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ACTION 	( DelDeta( oBrw2, aTemp ) )

		REDEFINE BUTTON ;
			ID 		524 ;
         OF       oFld:aDialogs[2] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ACTION 	( DbSwapUp( dbfTmp, oBrw2 ) )

		REDEFINE BUTTON ;
			ID 		525 ;
         OF       oFld:aDialogs[2] ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			ACTION 	( DbSwapDown( dbfTmp, oBrw2 ) )

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( EndTrans( aTemp, aoGet, dbfAlmT, oBrw, nMode, oDlg, oGet, oGet2 ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   if nMode != ZOOM_MODE
         oFld:aDialogs[2]:AddFastKey( VK_F2, {|| AppDeta( oBrw2, bEdit2, aTemp) } )
         oFld:aDialogs[2]:AddFastKey( VK_F3, {|| EdtDeta( oBrw2, bEdit2, aTemp ) } )
         oFld:aDialogs[2]:AddFastKey( VK_F4, {|| DelDeta( oBrw2, aTemp ) } )
         oDlg:AddFastKey( VK_F5, {|| if( nMode == DUPL_MODE, if( oGet:lValid(), EndTrans( aTemp, aoGet, dbfAlmT, oBrw, nMode, oDlg, oGet, oGet2 ), ), EndTrans( aTemp, aoGet, dbfAlmT, oBrw, nMode, oDlg, oGet, oGet2 ) ) } )
   end if

   oDlg:bStart := {|| oGet:SetFocus() }

	ACTIVATE DIALOG oDlg	ON PAINT ( EvalGet( aoGet ) ) CENTER

   /*
	Borramos los ficheros
	*/

   oBmpGeneral:End()

   KillTrans( oBrw2 )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

STATIC FUNCTION BeginTrans( aTemp )

   local cDbf     := "TAlmL"
	local cCodAlm	:= aTemp[ ( dbfAlmT )->( FieldPos( "CCODALM" ) ) ]

   cNewFile       := cGetNewFileName( cPatTmp() + cDbf )

	/*
	Primero Crear la base de datos local
	*/

   dbCreate( cNewFile, aSqlStruct( aBase2 ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFile, cCheckArea( cDbf, @dbfTmp ), .f. )

   if !( dbfTmp )->( neterr() )
      ( dbfTmp )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfTmp )->( OrdCreate( cNewFile, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )

      /*
      A�adimos desde el fichero de lineas--------------------------------------
      */

      if ( dbfAlmL )->( dbSeek( cCodAlm ) )

         while ( ( dbfAlmL )->CCODALM == cCodAlm .AND. !( dbfAlmL )->( Eof() ) )
            dbPass( dbfAlmL, dbfTmp, .t. )
            ( dbfAlmL )->( DbSkip() )
         end while

      end if

      ( dbfTmp )->( dbGoTop() )

   end if

RETURN NIL

//-----------------------------------------------------------------------//

/*
Funcion Auxiliar para A�adir lineas de detalle
*/

STATIC FUNCTION AppDeta( oBrw, bEdit2, aTemp )

RETURN WinAppRec( oBrw, bEdit2, dbfTmp, , , aTemp[(dbfAlmT)->( FieldPos( "CCODALM" ) )] )

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para la Edici�n de Lineas de Detalle
*/

STATIC FUNCTION EdtDeta( oBrw, bEdit2, aTemp )

RETURN WinEdtRec( oBrw, bEdit2, dbfTmp )

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para borrar las Lineas de Detalle
*/

STATIC FUNCTION DelDeta( oBrw )

RETURN DBDelRec( oBrw, dbfTmp )

//--------------------------------------------------------------------------//

STATIC FUNCTION EndTrans( aTemp, aoGet, dbfAlmT, oBrw, nMode, oDlg, oGet, oGet2 )

   local oError
   local oBlock
   local aTabla
   local cCodAlm  := aTemp[ ( dbfAlmT )->( FieldPos( "CCODALM" ) ) ]

   if nMode == APPD_MODE .or. nMode == DUPL_MODE

      if Empty( aTemp[ _CCODALM ] )
         MsgStop( "El c�digo del almac�n no puede estar vac�o." )
         oGet:SetFocus()
         Return nil
      end if

      if dbSeekInOrd( aTemp[ _CCODALM ], "CCODALM", dbfAlmT )
         MsgStop( "C�digo ya existe " + Rtrim( aTemp[ _CCODALM ] ) )
         return nil
      end if

   end if

   if Empty( aTemp[ _CNOMALM ] )
      MsgStop( "El nombre del almac�n no puede estar vac�o." )
      oGet2:SetFocus()
      Return nil
   end if

   do case
      case !Empty( aTemp[ _CUBICA3 ] ) .AND. ( Empty( aTemp[ _CUBICA2 ] ) .or. Empty( aTemp[ _CUBICA1 ] ) )
         if Empty( aTemp[ _CUBICA1 ] )
            MsgStop( "Para informar la ubicaci�n 3 no puede dejar vac�a la ubicaci�n 1" )
         end if
         if Empty( aTemp[ _CUBICA2 ] )
            MsgStop( "Para informar la ubicaci�n 3 no puede dejar vac�a la ubicaci�n 2" )
         end if
         Return nil

      case Empty( aTemp[ _CUBICA3 ] ) .AND. !Empty( aTemp[ _CUBICA2 ] ) .and. Empty( aTemp[ _CUBICA1 ] )
         MsgStop( "Para informar la ubicaci�n 2 no puede dejar vac�a la ubicaci�n 1" )
         Return nil

      case aTemp[ _CUBICA1 ] == aTemp[ _CUBICA2 ] .AND. !Empty( aTemp[ _CUBICA1 ] ) .AND. !Empty( aTemp[ _CUBICA2 ] )
         MsgStop( "Ubicaciones repetidas" )
         Return nil

      case aTemp[ _CUBICA1 ] == aTemp[ _CUBICA3 ] .AND. !Empty( aTemp[ _CUBICA1 ] ) .AND. !Empty( aTemp[ _CUBICA3 ] )
         MsgStop( "Ubicaciones repetidas" )
         Return nil

      case aTemp[ _CUBICA2 ] == aTemp[ _CUBICA3 ] .AND. !Empty( aTemp[ _CUBICA2 ] ) .AND. !Empty( aTemp[ _CUBICA3 ] )
         MsgStop( "Ubicaciones repetidas" )
         Return nil

   end case

	/*
   Primero hacer el RollBack---------------------------------------------------
	*/

   CursorWait()

   oBlock      := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   BeginTransaction()

   oDlg:Disable()

	/*
   Roll Back-------------------------------------------------------------------
	*/

   while ( dbfAlmL )->( dbSeek( cCodAlm ) )
      if ( dbfAlmL )->( dbRLock() )
         ( dbfAlmL )->( dbDelete() )
         ( dbfAlmL )->( dbUnLock() )
      end if
   end while

	/*
   Ahora escribimos en el fichero definitivo------------------------------------
	*/

	( dbfTmp )->( DbGoTop() )
   while ( dbfTmp )->( !Eof() )

      aTabla                                          := DBScatter( dbfTmp )
      aTabla[( dbfAlmL )->( FieldPos( "CCODALM" ) )]  := cCodAlm
		( dbfAlmL )->( dbAppend() )
		DBGather( aTabla, dbfAlmL )
		( dbfTmp )->( dbSkip() )

   end while

   WinGather( aTemp, aoGet, dbfAlmT, oBrw, nMode )

   /*
   Escribe los datos pendientes------------------------------------------------
   */

   dbCommitAll()

   CommitTransaction()

   RECOVER USING oError

      RollBackTransaction()
      msgStop( "Imposible eliminar datos anteriores" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE
   ErrorBlock( oBlock )

   oDlg:Enable()

   oDlg:end( IDOK )

   CursorWe()

RETURN nil

//------------------------------------------------------------------------//

STATIC FUNCTION KillTrans( oBrw2 )

	/*
	Borramos los ficheros
	*/

	( dbfTmp )->( dbCloseArea() )
   dbfErase( cNewFile )

RETURN .T.

//------------------------------------------------------------------------//


STATIC FUNCTION EdtDet( aTemp, aoGet, dbfTmp, oBrw, bWhen, bValid, nMode, cCodAlm )

	local oDlg
	local oGet
	local oGetTxt
	local cGetTxt

	IF nMode == APPD_MODE
		aTemp[ (dbfAlmL)->( FieldPos( "CCODALM" ) ) ] := cCodAlm
	END CASE

   DEFINE DIALOG oDlg RESOURCE "AGEALM" TITLE LblTitle( nMode ) + "Agentes relacionados"

		REDEFINE GET oGet VAR aTemp[ (dbfAlmL)->( FieldPos( "CCODAGE" ) ) ];
			ID 		100 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			VALID 	( cAgentes( oGet, dbfAgent, oGetTxt ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( oGet, oGetTxt ) ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET oGetTxt VAR cGetTxt;
			ID 		110 ;
			WHEN 		( .F. ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( 	nMode != ZOOM_MODE ) ;
         ACTION   ( lPreSave( aTemp, aoGet, dbfTmp, oBrw, nMode, oDlg, oGet ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| lPreSave( aTemp, aoGet, dbfTmp, oBrw, nMode, oDlg, oGet ) } )
   end if

	ACTIVATE DIALOG oDlg ON PAINT ( oGet:lValid() ) CENTER

RETURN ( oDlg:nResult == IDOK )

//-------------------------------------------------------------------------//

Static Function lPreSave( aTemp, aoGet, dbfTmp, oBrw, nMode, oDlg, oGet )

   if Empty( aTemp[ (dbfAlmL)->( FieldPos( "CCODAGE" ) ) ] )
      MsgStop( "El c�digo del agente no puede estar vac�o" )
      oGet:SetFocus()
      Return nil
   end if

   WinGather( aTemp, aoGet, dbfTmp, oBrw, nMode )

Return ( oDlg:end( IDOK ) )

//-------------------------------------------------------------------------//

FUNCTION RetAlmacen( cCodAlm, dbfAlmT )

   local oBlock
   local oError
	local cAlmacen 	:= ""
   local lClose      := .f.

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

	IF dbfAlmT == NIL
      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE
      lClose         := .t.
	END IF

   do case
      case Valtype( dbfAlmT ) == "C"

         if ( dbfAlmT )->( DbSeek( cCodAlm ) )
            cAlmacen       := ( dbfAlmT )->cNomAlm
         end if

      case Valtype( dbfAlmT ) == "O"

         if dbfAlmT:Seek( cCodAlm )
            cAlmacen       := dbfAlmT:cNomAlm
         end if

   end case

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos de almacenes" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

	IF lClose
		CLOSE ( dbfAlmT )
	END IF

RETURN cAlmacen

//--------------------------------------------------------------------------//
/*
Devuelve el cliente de un almacen
*/

FUNCTION RetCliAlm( cCodAlm, dbfAlmT )

   local oBlock
   local oError
	local cAlmacen 	:= ""
   local lClose      := .f.

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if dbfAlmT == nil
      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE
      lClose         := .t.
   end if

   if ( dbfAlmT )->( dbSeek( cCodAlm ) )
      cAlmacen       := ( dbfAlmT)->cCodCli
   end if

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos de agentes" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      Close ( dbfAlmT )
   end if

RETURN cAlmacen

//--------------------------------------------------------------------------//


FUNCTION aItmAlm()

RETURN ( aBase )

//---------------------------------------------------------------------------//
//Funcion que devuelve el nombre de la ubicaci�n, diciendole
//el almacen y el n�mero de la ubicaci�n

Function cGetUbica( cCodAlm, dbfAlm, nNumUbica )

   local cNomUbica := ""

   ( dbfAlm )->( dbGoTop() )

   if ( dbfAlm )->( dbSeek( cCodAlm ) )

      do case
         case nNumUbica == 1
            cNomUbica := ( dbfAlm )->cUbica1
         case nNumUbica == 2
            cNomUbica := ( dbfAlm )->cUbica2
         case nNumUbica == 3
            cNomUbica := ( dbfAlm )->cUbica3
      end case

   end if

return cNomUbica

//---------------------------------------------------------------------------//

Function SelectAlmacen()

   local oDlg
   local oBrw
   local oBmp
   local oBrush
   local oGetBuscar
   local cGetBuscar     := Space( 100 )
   local oCbxOrden
   local cCbxOrden      := "C�digo"

   if !lOpenFiles()
      return .f.
   end if

   DEFINE BRUSH oBrush COLOR Rgb( 255, 255, 255 )

   DEFINE DIALOG oDlg ;
      RESOURCE    "SELECTITEM" ;
      TITLE       "Seleccionar almac�n" ;
      BRUSH       oBrush

      REDEFINE BITMAP oBmp ;
         RESOURCE "PACKAGE_48" ;
         ID       300;
         OF       oDlg

      REDEFINE GET oGetBuscar ;
         VAR      cGetBuscar;
         ID       100 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfAlmT, nil, nil, .f. ) );
         BITMAP   "FIND" ;
         OF       oDlg

      REDEFINE COMBOBOX oCbxOrden ;
         VAR      cCbxOrden ;
         ID       110 ;
         ITEMS    { "C�digo", "Nombre" } ;
         ON CHANGE( ( dbfAlmT )->( OrdSetFocus( oCbxOrden:nAt ) ), oBrw:Refresh(), oGetBuscar:SetFocus() ) ;
			OF 		oDlg

      oBrw                 := TXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfAlmT
      oBrw:nMarqueeStyle   := 5

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| ( dbfAlmT )->cCodAlm }
         :cSortOrder       := "cCodAlm"
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrden:Set( oCol:cHeader ) }
         :nWidth           := 40
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :bEditValue       := {|| ( dbfAlmT )->cNomAlm }
         :cSortOrder       := "cNomAlm"
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrden:Set( oCol:cHeader ) }
         :nWidth           := 200
      end with

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

      oBrw:CreateFromResource( 200 )

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( oDlg:end( IDOK ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK
      oUser():cAlmacen( ( dbfAlmT )->cCodAlm )
   else
      MsgInfo( "No seleccion� ning�n almac�n, se establecer� el almac�n por defecto." + CRLF + ;
               "Almac�n actual, " + oUser():cAlmacen() )
   end if

   CloseFiles()

   if oBmp != nil
      oBmp:End()
   end if

   if oBrush != nil
      oBrush:End()
   end if

RETURN ( oDlg:nResult == IDOK )

#else

//---------------------------------------------------------------------------//
//Funciones solo de PDA
//---------------------------------------------------------------------------//

static function pdaMenuEdtRec( oDlg, oBrw )

   local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )

   oBrw:GoTop()

Return oMenu

//--------------------------------------------------------------------------//

#endif

CLASS pdaAlmacenSenderReciver

   Method CreateData()

END CLASS

//----------------------------------------------------------------------------//

//--------------------------------------------------------------------------//
//Funciones comunes del programa y pda
//--------------------------------------------------------------------------//

Method CreateData( oPgrActual, oSayStatus, cPatPreVenta ) CLASS pdaAlmacenSenderReciver

   local oBlock
   local oError
   local dbfAlm
   local tmpAlm
   local lExist      := .f.
   local cFileName
   local cPatPc      := if( Empty( cPatPreVenta ), cPatPc(), cPatPreVenta )

   USE ( cPatAlm() + "Almacen.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "Almacen", @dbfAlm ) )
   SET ADSINDEX TO ( cPatAlm() + "Almacen.Cdx" ) ADDITIVE

   dbUseArea( .t., cDriver(), cPatPc + "Almacen.Dbf", cCheckArea( "Almacen", @tmpAlm ), .t. )
   ( tmpAlm )->( ordListAdd( cPatPc + "Almacen.Cdx" ) )

   if !Empty( oPgrActual )
      oPgrActual:SetRange( 0, ( tmpAlm )->( OrdKeyCount() ) )
   end if

   ( tmpAlm )->( dbGoTop() )
   while !( tmpAlm )->( eof() )

         if ( dbfAlm )->( dbSeek( ( tmpAlm )->cCodAlm ) )
            dbPass( tmpAlm, dbfAlm, .f. )
         else
            dbPass( tmpAlm, dbfAlm, .t. )
         end if

         ( tmpAlm )->( dbSkip() )

         if !Empty( oSayStatus )
            oSayStatus:SetText( "Sincronizando Almacenes " + Alltrim( Str( ( tmpAlm )->( OrdKeyNo() ) ) ) + " de " + Alltrim( Str( ( tmpAlm )->( OrdKeyCount() ) ) ) )
         end if

      SysRefresh()

      if !Empty( oPgrActual )
         oPgrActual:SetPos( ( tmpAlm )->( OrdKeyNo() ) )
      end if

      SysRefresh()

   end while

   CLOSE ( tmpAlm )
   CLOSE ( dbfAlm )

Return ( Self )

function IsAlmacen( cPatEmp )

   local oBlock
   local oError

   local dbfAlmT
   local lIsAlmacen  := .f.

   DEFAULT cPatEmp   := cPatAlm()

   if !lExistTable( cPatEmp + "Almacen.Dbf" ) .or. !lExistTable( cPatEmp + "AlmacenL.Dbf" )
      mkAlmacen()
   end if

   if !lExistIndex( cPatEmp + "Almacen.Cdx" ) .or. !lExistIndex( cPatEmp + "AlmacenL.Cdx" )
      rxAlmacen()
   end if

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
   SET ADSINDEX TO ( cPatEmp + "ALMACEN.CDX" ) ADDITIVE

   if !( dbfAlmT )->( dbSeek( "000" ) ) .and. ( dbfAlmT )->( LastRec() ) == 0
      ( dbfAlmT )->( dbAppend() )
      ( dbfAlmT )->cCodAlm := "000"
      ( dbfAlmT )->cNomAlm := "Almac�n principal"
      ( dbfAlmT )->( dbUnLock() )
   end if

   lIsAlmacen        := .t.

   CLOSE( dbfAlmT )

   RECOVER USING oError

      msgStop( "Imposible abrir base de datos de almacenes" + CRLF + ErrorMessage( oError )  )

   END SEQUENCE

   ErrorBlock( oBlock )

return ( lIsAlmacen )

//---------------------------------------------------------------------------//

FUNCTION mkAlmacen( cPath, lAppend, cPathOld, oMeter )

   DEFAULT cPath     := cPatAlm()
	DEFAULT lAppend	:= .F.

	IF oMeter != NIL
		oMeter:cText	:= "Generando Bases"
		sysrefresh()
	END IF

   IF !lExistTable( cPath + "ALMACEN.DBF" )
      dbCreate( cPath + "ALMACEN.DBF", aSqlStruct( aBase ), cDriver() )
	END IF

   IF !lExistTable( cPath + "ALMACENL.DBF" )
      dbCreate( cPath + "ALMACENL.DBF", aSqlStruct( aBase2 ), cDriver() )
	END IF

	rxAlmacen( cPath, oMeter )

	IF lAppend .and. lIsDir( cPathOld )
      AppDbf( cPathOld, cPath, "ALMACEN" )
	END IF

	IF lAppend .and. lIsDir( cPathOld )
      AppDbf( cPathOld, cPath, "ALMACENL" )
	END IF

RETURN .t.

//--------------------------------------------------------------------------//

FUNCTION rxAlmacen( cPath, oMeter )

	local dbfAlmT
	local dbfAlmL

   DEFAULT cPath  := cPatAlm()

   IF !lExistTable( cPath + "ALMACEN.DBF" )
      dbCreate( cPath + "ALMACEN.DBF", aSqlStruct( aBase ), cDriver() )
	END IF

   fEraseIndex( cPath + "ALMACEN.CDX" )

   dbUseArea( .t., cDriver(), cPath + "ALMACEN.DBF", cCheckArea( "ALMACEN", @dbfAlmT ), .f. )

   if !( dbfAlmT )->( neterr() )
      ( dbfAlmT )->( __dbPack() )

      ( dbfAlmT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfAlmT )->( ordCreate( cPath + "ALMACEN.CDX", "CCODALM", "CCODALM", {|| Field->cCodAlm } ) )

      ( dbfAlmT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfAlmT )->( ordCreate( cPath + "ALMACEN.CDX", "CNOMALM", "Upper( CNOMALM )", {|| Upper( Field->cNomAlm ) }, ) )

      ( dbfAlmT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de almacenes" )
   end if

   IF !lExistTable( cPath + "ALMACENL.DBF" )
      dbCreate( cPath + "ALMACENL.DBF", aSqlStruct( aBase2 ), cDriver() )
	END IF

   fErase( cPath + "ALMACENL.CDX" )

   dbUseArea( .t., cDriver(), cPath + "ALMACENL.DBF", cCheckArea( "ALMACENL", @dbfAlmL ), .f. )

   if !( dbfAlmL )->( neterr() )
      ( dbfAlmL )->( __dbPack() )

      ( dbfAlmL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfAlmL )->( ordCreate( cPath + "ALMACENL.CDX", "CCODALM", "CCODALM", {|| Field->cCodAlm } ) )

      ( dbfAlmL )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de almacenes" )
   end if

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION cAlmacen( oGet, dbfAlmT, oGet2 )

   local oBlock
   local oError
   local lClose   := .f.
   local lValid   := .f.
   local xValor   := oGet:VarGet()

   if Empty( xValor )
      if( oGet2 != nil, oGet2:cText( "" ), )
      return .t.
   else
      xValor   := RJustObj( oGet, "0" )
   end if

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if dbfAlmT == nil
      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   do case
      case Valtype( dbfAlmT ) == "C"

         if ( dbfAlmT )->( dbSeek( xValor ) )
            oGet:cText( ( dbfAlmT )->cCodAlm )
            if( oGet2 != nil, oGet2:cText( ( dbfAlmT )->cNomAlm ), )
            lValid   := .t.
         else
            oGet:Refresh()
            msgStop( "Almac�n no encontrado" )
         end if

      case Valtype( dbfAlmT ) == "O"

         if dbfAlmT:Seek( xValor )
            oGet:cText( dbfAlmT:cCodAlm )

            if oGet2 != nil
               oGet2:cText( dbfAlmT:cNomAlm )
            end if

            lValid   := .t.
         else
            oGet:Refresh()
            msgStop( "Almac�n no encontrado" )
         end if

   end case

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos de almacenes" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfAlmT )
   end if

RETURN lValid

//---------------------------------------------------------------------------//

FUNCTION BrwAlmacen( oGet, oGet2, lBigStyle )

	local oDlg
	local oBrw
   local oFont
   local oBtn
	local oGet1
	local cGet1
   local nOrdAnt        := GetBrwOpt( "BrwAlmacen" )
	local oCbxOrd
   local aCbxOrd        := { "C�digo", "Nombre" }
   local cCbxOrd
   local nLevel         := nLevelUsr( "01035" )
   local oSayText
   local cSayText       := "Listado de almacenes"
   local cReturn        := ""

   nOrdAnt              := Min( Max( nOrdAnt, 1 ), len( aCbxOrd ) )
   cCbxOrd              := aCbxOrd[ nOrdAnt ]

   DEFAULT  lBigStyle   := .f.

   if lOpenFiles()

      nOrdAnt           := ( dbfAlmT )->( OrdSetFocus( nOrdAnt ) )

      ( dbfAlmT )->( dbGoTop() )

      /*do case
      case lBigStyle
         DEFINE DIALOG oDlg RESOURCE "BIGHELPENTRY"   TITLE "Seleccionar almac�n"
      case ( "PDA" $ cParamsMain() )
         DEFINE DIALOG oDlg RESOURCE "HELPENTRY_PDA"  TITLE "Seleccionar almac�n"
      otherwise
         DEFINE DIALOG oDlg RESOURCE "HELPENTRY"      TITLE "Seleccionar almac�n"
      end case*/

#ifndef __PDA__
   if lBigStyle

      DEFINE DIALOG oDlg RESOURCE "BIGHELPENTRY"   TITLE "Seleccionar almac�n"

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfAlmT ) );
         VALID    ( OrdClearScope( oBrw, dbfAlmT ) );
         BITMAP   "FIND" ;
         OF       oDlg

   else

      DEFINE DIALOG oDlg RESOURCE "HELPENTRY"      TITLE "Seleccionar almac�n"

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfAlmT ) );
         VALID    ( OrdClearScope( oBrw, dbfAlmT ) );
         BITMAP   "FIND" ;
         OF       oDlg

   end if
#else
      DEFINE DIALOG oDlg RESOURCE "HELPENTRY_PDA"  TITLE "Seleccionar almac�n"

      DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

         REDEFINE SAY oSayTit ;
            VAR      "Buscando almacenes" ;
            ID       110 ;
            COLOR    "N/W*" ;
            FONT     oFont ;
            OF       oDlg

         REDEFINE BTNBMP oBtn ;
            ID       100 ;
            OF       oDlg ;
            FILE     ( cPatBmp() + "Factory_16.bmp" ) ;
            NOBORDER ;
            ACTION      ( nil )

         oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfAlmT ) );
         BITMAP   "FIND" ;
         OF       oDlg

#endif

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ( dbfAlmT )->( OrdSetFocus( oCbxOrd:nAt ) ), oBrw:refresh(), oGet1:SetFocus(), oCbxOrd:refresh() ) ;
			OF 		oDlg


#ifndef __PDA__

      oBrw                 := IXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfAlmT
      oBrw:nMarqueeStyle   := 5
      oBrw:cName           := "Browse.Almacen"

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodAlm"
         :bEditValue       := {|| ( dbfAlmT )->cCodAlm }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cNomAlm"
         :bEditValue       := {|| ( dbfAlmT )->cNomAlm }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Domicilio"
         :cSortOrder       := "cDirAlm"
         :bEditValue       := {|| ( dbfAlmT )->cDirAlm }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }
      oBrw:bRClicked       := {| nRow, nCol, nFlags | oBrw:RButtonDown( nRow, nCol, nFlags ) }

      oBrw:CreateFromResource( 105 )

      if lBigStyle
         oBrw:nHeaderHeight   := 36
         oBrw:nFooterHeight   := 36
         oBrw:nLineHeight     := 36
      end if

      if ( "PDA" $ cParamsMain() )

         REDEFINE SAY oSayText VAR cSayText ;
            ID       100 ;
            OF       oDlg

      end if

		REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:end(IDOK) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

      if !( "PDA" $ cParamsMain() )

		REDEFINE BUTTON ;
			ID 		500 ;
			OF 		oDlg ;
         WHEN     ( nAnd( nLevel, ACC_APPD ) != 0 .and. !IsReport() );
         ACTION   ( WinAppRec( oBrw, bEdit, dbfAlmT ) )

		REDEFINE BUTTON ;
			ID 		501 ;
			OF 		oDlg ;
         WHEN     ( nAnd( nLevel, ACC_EDIT ) != 0 .and. !IsReport() );
         ACTION   ( WinEdtRec( oBrw, bEdit, dbfAlmT ) )

      if !IsReport()
         oDlg:AddFastKey( VK_F2,    {|| if( nAnd( nLevel, ACC_APPD ) != 0, WinAppRec( oBrw, bEdit, dbfAlmT ), ) } )
         oDlg:AddFastKey( VK_F3,    {|| if( nAnd( nLevel, ACC_EDIT ) != 0, WinEdtRec( oBrw, bEdit, dbfAlmT ), ) } )
      end if

      end if

      oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end(IDOK) } )
      oDlg:AddFastKey( VK_F5,       {|| oDlg:end(IDOK) } )

      ACTIVATE DIALOG oDlg CENTER

#else

      REDEFINE LISTBOX oBrw ;
			FIELDS ;
                  ( dbfAlmT )->cCodAlm + CRLF + ( dbfAlmT )->cNomAlm ;
			HEAD ;
                  "C�digo" + CRLF + "Nombre" ;
			ID 		105 ;
			ALIAS 	( dbfAlmT ) ;
			OF 		oDlg

         oBrw:aActions        := {| nCol | lPressCol( nCol, oBrw, oCbxOrd, aCbxOrd, dbfAlmT ) }
         oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuEdtRec( oDlg, oBrw ) )

#endif

      cReturn                 := ( dbfAlmT )->cCodAlm

      if oDlg:nResult == IDOK

         if !Empty( oGet )
            oGet:cText( cReturn )
            oGet:lValid()
         end if

         if !Empty( oGet2 ) .and. ValType( oGet2 ) == "O"
            oGet2:cText( ( dbfAlmT )->cNomAlm )
         end if

      end if

      DestroyFastFilter( dbfAlmT )

      SetBrwOpt( "BrwAlmacen", ( dbfAlmT )->( OrdNumber() ) )

		CloseFiles()

      if !Empty( oGet )
         oGet:setFocus()
      end if

   end if

RETURN ( cReturn )

//---------------------------------------------------------------------------//

STATIC FUNCTION lOpenFiles()

   local lOpen       := .t.
   local oBlock      := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

      IF !lExistTable( cPatAlm() + "ALMACEN.DBF" ) .OR.;
         !lExistTable( cPatAlm() + "ALMACENL.DBF" )
			mkAlmacen()
		END IF

      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE

      USE ( cPatAlm() + "ALMACENL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACENL", @dbfAlmL ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACENL.CDX" ) ADDITIVE

      USE ( cPatCli() + "AGENTES.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AGENTES", @dbfAgent ) )
      SET ADSINDEX TO ( cPatCli() + "AGENTES.CDX" ) ADDITIVE

#ifndef __PDA__

      USE ( cPatAlm() + "UBICAT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "UBICAT", @dbfUbicaT ) )
      SET ADSINDEX TO ( cPatAlm() + "UBICAT.CDX" ) ADDITIVE

      USE ( cPatAlm() + "UBICAL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "UBICAL", @dbfUbicaL ) )
      SET ADSINDEX TO ( cPatAlm() + "UBICAL.CDX" ) ADDITIVE

#endif

   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      CloseFiles()
      lOpen       := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN lOpen

//----------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles()

   CLOSE ( dbfAlmT   )
   CLOSE ( dbfAlmL   )
   CLOSE ( dbfAgent  )
   CLOSE ( dbfUbicaT )
   CLOSE ( dbfUbicaL )

   dbfAlmT   := nil
   dbfAlmL   := nil
   dbfAgent  := nil
   dbfUbicaT := nil
   dbfUbicaL := nil

   oWndBrw   := nil

Return .t.

//----------------------------------------------------------------------------//
/*
Funcion para editar un almac�n desde cualquier parte del programa
*/

FUNCTION EdtAlm( cCodAlm )

   local nLevel         := nLevelUsr( "01035" )

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenFiles()

      if dbSeekInOrd( cCodAlm, "cCodAlm", dbfAlmT )
         WinEdtRec( nil, bEdit, dbfAlmT )
      end if

      CloseFiles()

   end if

RETURN .t.

//---------------------------------------------------------------------------//