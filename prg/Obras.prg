#ifndef __PDA__
   #include "FiveWin.Ch"
   #include "Font.ch"
   #include "Report.ch"
#else
   #include "FWCE.ch"
   REQUEST DBFCDX
#endif

#include "Factu.ch"

#ifndef __PDA__
   static bEdit      := {| aBlank, aoGet, dbfObrasT, oBrw, bWhen, bValid, nMode, cCodCli | EdtRec( aBlank, aoGet, dbfObrasT, oBrw, bWhen, bValid, nMode, cCodCli ) }
#endif

static oWndBrw
static dbfObrasT

#ifndef __PDA__

//--------------------------------------------------------------------------//
//Funciones del programa
//--------------------------------------------------------------------------//

STATIC FUNCTION EdtRec( aBlank, aoGet, dbfObrasT, oBrw, bWhen, bValid, nMode, cCodCli )

	local oDlg
	local oGet
   local oGet2

   if nMode == APPD_MODE .AND. !Empty( cCodCli )
      aBlank[ ( dbfObrasT )->( FieldPos( "CCODCLI" ) ) ] := cCodCli
   end if

   DEFINE DIALOG oDlg RESOURCE "OBRAS" TITLE LblTitle( nMode ) + "direcciones de clientes"

      REDEFINE GET oGet VAR aBlank[ ( dbfObrasT )->( FieldPos( "CCODOBR" ) ) ] ;
			ID 		120 ;
			WHEN 		( nMode == APPD_MODE ) ;
         VALID    ( If ( nMode == APPD_MODE, ChkObra( oGet, cCodCli, dbfObrasT ), .t. ) ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE GET oGet2 VAR aBlank[ ( dbfObrasT )->( FieldPos( "CNOMOBR" ) ) ] ;
			ID 		130 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE GET aBlank[ ( dbfObrasT )->( FieldPos( "CDIROBR" ) ) ] ;
			ID 		140 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CPOBOBR" ) ) ] ;
			ID 		150 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CPRVOBR" ) ) ] ;
			ID 		160 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CPOSOBR" ) ) ] ;
			ID 		170 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CTELOBR" ) ) ] ;
			ID 		180 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CFAXOBR" ) ) ] ;
			ID 		190 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CCODEDI" ) ) ] ;
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aBlank[ (dbfObrasT)->( FieldPos( "CESTOBR" ) ) ] ;
         ID       240 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE CHECKBOX aBlank[ (dbfObrasT)->( FieldPos( "LDEFOBR" ) ) ] ;
         ID       220 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aBlank[ ( dbfObrasT )->( FieldPos( "CCNTOBR" ) ) ] ;
         ID       200 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE GET aBlank[ ( dbfObrasT )->( FieldPos( "CMOVOBR" ) ) ] ;
         ID       210 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

      REDEFINE GET aBlank[ ( dbfObrasT )->( FieldPos( "cCodPos" ) ) ] ;
         ID       300 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( EndTrans( aBlank, aoGet, dbfObrasT, oBrw, nMode, oDlg, oGet, oGet2 ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

      REDEFINE BUTTON ;
         ID       559 ;
			OF 		oDlg ;
         ACTION   ( ChmHelp( "Clientes" ) )

      if nMode != ZOOM_MODE
         oDlg:AddFastKey( VK_F5, {|| EndTrans( aBlank, aoGet, dbfObrasT, oBrw, nMode, oDlg, oGet, oGet2 ) } )
      end if

      oDlg:AddFastKey( VK_F1, {|| ChmHelp( "Clientes" ) } )

	ACTIVATE DIALOG oDlg ON PAINT ( oGet:lValid() ) CENTER

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

Static Function EndTrans( aBlank, aoGet, dbfObrasT, oBrw, nMode, oDlg, oGet, oGet2 )

   local nRec  := ( dbfObrasT )->( Recno() )

   if nMode == APPD_MODE .or. nMode == DUPL_MODE

      if Empty( aBlank[ ( dbfObrasT )->( FieldPos( "CCODOBR" ) ) ] )
         MsgStop( "C�digo no puede estar vac�o" )
         oGet:SetFocus()
         return nil
      end if

   end if

   if Empty( aBlank[ ( dbfObrasT )->( FieldPos( "CNOMOBR" ) ) ] )
      MsgStop( "Nombre no puede estar vac�o" )
      oGet2:SetFocus()
      return nil
   end if

   if aBlank[ ( dbfObrasT )->( FieldPos( "LDEFOBR" ) ) ]

      ( dbfObrasT )->( dbGoTop() )

      while !( dbfObrasT )->( Eof() )

         if dbLock( dbfObrasT )
            ( dbfObrasT )->lDefObr := .f.
            ( dbfObrasT )->( dbUnlock() )
         end if

         ( dbfObrasT )->( dbSkip() )

      end while

   end if

   ( dbfObrasT )->( dbGoTo( nRec ) )

   WinGather( aBlank, aoGet, dbfObrasT, oBrw, nMode )

   oBrw:Refresh()

Return ( oDlg:end( IDOK ) )

//--------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles()

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
   SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      CloseFiles()
      lOpen       := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//----------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles()

   if oWndBrw != nil
      oWndBrw  := nil
   end if

   if !Empty( dbfObrasT )
      ( dbfObrasT )->( dbCloseArea() )
   end if

   dbfObrasT   := nil

RETURN ( .T. )

//----------------------------------------------------------------------------//

FUNCTION retObras( cCodCli, cCodObr, dbfObrasT )

   local lClose   := .f.
	local cTemp		:= Space( 30 )

	IF ( dbfObrasT ) == NIL
      USE ( cPatEmp() + "" + "OBRAST" + ".DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
      SET ADSINDEX TO ( cPatEmp() + "" + "OBRAST" + ".CDX" ) ADDITIVE
      lClose      := .t.
	END IF

   IF ( dbfObrasT )->( DbSeek( cCodCli + cCodObr ) )
      cTemp       := ( dbfObrasT )->cNomObr
   END IF

	IF lClose
		CLOSE ( dbfObrasT )
	END IF

RETURN cTemp

//---------------------------------------------------------------------------//

FUNCTION AppObras( cCodCli, dbfObrasT, oBrw )

   WinAppRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli )

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION EdtObras( cCodCli, cCodObr, dbfObrasT, oBrw, lControl )

   local nLevel   := nLevelUsr( "01032" )

   DEFAULT cCodObr   := ( dbfObrasT )->cCodObr
   DEFAULT lControl  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lControl
      WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli )
   else

      if ( dbfObrasT )->( dbSeek( cCodCli + cCodObr ) )
         WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli )
      else
         MsgStop( "No se encuentra la obra" )
      end if

   end if

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION ZoomObras( dbfObrasT, oBrw )

   WinZooRec( oBrw, bEdit, dbfObrasT )

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION delObras( dbfObrasT, oBrw )

   if dbDelRec( oBrw, dbfObrasT )
      oBrw:Refresh()
   end if

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION ChkObra( oGet, cCodCli, dbfObrasT )

	local lFound
	local xValor
	local nRecno   := ( dbfObrasT )->( RecNo() )

	xValor			:= cCodCli + oGet:varGet()
   lFound         := ( dbfObrasT )->( dbSeek( xValor ) )

   ( dbfObrasT )->( dbGoTo( nRecno ) )

   if lFound
		MsgStop( "Obra ya existe" )
   end if

RETURN ( !lFound )

//--------------------------------------------------------------------------//

function PredObras( dbfTmpObr, oBrwObr )

   local nRec  := ( dbfTmpObr )->( Recno() )

   if !( dbfTmpObr )->lDefObr

      ( dbfTmpObr )->( dbGoTop() )

      while !( dbfTmpObr )->( Eof() )

         if dbLock( dbfTmpObr )
            ( dbfTmpObr )->lDefObr := .f.
            ( dbfTmpObr )->( dbUnlock() )
         end if

         ( dbfTmpObr )->( dbSkip() )

      end while

      ( dbfTmpObr )->( dbGoTo( nRec ) )

      if dbLock( dbfTmpObr )
         ( dbfTmpObr )->lDefObr := .t.
         ( dbfTmpObr )->( dbUnlock() )
      end if

   end if

   oBrwObr:Refresh()

return ( .t. )

//---------------------------------------------------------------------------//

function cObraDir( cCodCli, dbfClient, dbfObrasT )

   local cDireccion     := ""
   local nRecObr        := ( dbfObrasT )->( Recno() )
   local nRecCli        := ( dbfClient )->( Recno() )

   if dbSeekInOrd( cCodCli, "LDEFOBR", dbfObrasT )

      cDireccion  := ( dbfObrasT )->cDirObr

   end if

   if Empty( cDireccion ) .and. dbSeekInOrd( cCodCli, "COD", dbfClient )

      cDireccion     := ( dbfClient )->Domicilio

   end if

   ( dbfObrasT )->( dbGoTo( nRecObr ) )
   ( dbfClient )->( dbGoTo( nRecCli ) )

return ( cDireccion )

//---------------------------------------------------------------------------//

function cObraPob( cCodCli, dbfClient, dbfObrasT )

   local cPoblacion     := ""
   local nRecObr        := ( dbfObrasT )->( Recno() )
   local nRecCli        := ( dbfClient )->( Recno() )

   if dbSeekInOrd( cCodCli, "LDEFOBR", dbfObrasT )

      cPoblacion  := ( dbfObrasT )->cPobObr

   end if

   if Empty( cPoblacion ) .and. dbSeekInOrd( cCodCli, "COD", dbfClient )

      cPoblacion     := ( dbfClient )->Poblacion

   end if

   ( dbfObrasT )->( dbGoTo( nRecObr ) )
   ( dbfClient )->( dbGoTo( nRecCli ) )

return ( cPoblacion )

//---------------------------------------------------------------------------//

function cObraPrv( cCodCli, dbfClient, dbfObrasT )

   local cProvincia     := ""
   local nRecObr        := ( dbfObrasT )->( Recno() )
   local nRecCli        := ( dbfClient )->( Recno() )

   if dbSeekInOrd( cCodCli, "LDEFOBR", dbfObrasT )

      cProvincia  := ( dbfObrasT )->cPrvObr

   end if

   if Empty( cProvincia ) .and. dbSeekInOrd( cCodCli, "COD", dbfClient )

      cProvincia     := ( dbfClient )->Provincia

   end if

   ( dbfObrasT )->( dbGoTo( nRecObr ) )
   ( dbfClient )->( dbGoTo( nRecCli ) )

return ( cProvincia )

//---------------------------------------------------------------------------//

function cObraPos( cCodCli, dbfClient, dbfObrasT )

   local cCodPostal     := ""
   local nRecObr        := ( dbfObrasT )->( Recno() )
   local nRecCli        := ( dbfClient )->( Recno() )

   if dbSeekInOrd( cCodCli, "LDEFOBR", dbfObrasT )
      cCodPostal        := ( dbfObrasT )->cPosObr
   end if

   if Empty( cCodPostal ) .and. dbSeekInOrd( cCodCli, "COD", dbfClient )
      cCodPostal        := ( dbfClient )->CodPostal
   end if

   ( dbfObrasT )->( dbGoTo( nRecObr ) )
   ( dbfClient )->( dbGoTo( nRecCli ) )

return ( cCodPostal )

//---------------------------------------------------------------------------//

function cObraNbr( cCodCli, dbfClient, dbfObrasT )

   local cNombre        := ""
   local nRecObr        := ( dbfObrasT )->( Recno() )
   local nRecCli        := ( dbfClient )->( Recno() )

   if dbSeekInOrd( cCodCli, "LDEFOBR", dbfObrasT )

      cNombre           := ( dbfObrasT )->cNomObr

   end if

   if Empty( cNombre ) .and. dbSeekInOrd( cCodCli, "COD", dbfClient )

      cNombre           := ( dbfClient )->Titulo

   end if

   ( dbfObrasT )->( dbGoTo( nRecObr ) )
   ( dbfClient )->( dbGoTo( nRecCli ) )

return ( cNombre )

//---------------------------------------------------------------------------//

Function aCalObrCli()

   local aCalObrCli  := {}

   aAdd( aCalObrCli, { "cObraNbr( ( cDbfCli )->Cod, cDbfCli, cDbfObr )",  "C", 100, 0, "Nombre defecto",        "",  "Nombre",      "" } )
   aAdd( aCalObrCli, { "cObraDir( ( cDbfCli )->Cod, cDbfCli, cDbfObr )",  "C", 100, 0, "Domicilio defecto",     "",  "Domicilio",   "" } )
   aAdd( aCalObrCli, { "cObraPob( ( cDbfCli )->Cod, cDbfCli, cDbfObr )",  "C", 100, 0, "Poblaci�n defecto",     "",  "Poblaci�n",   "" } )
   aAdd( aCalObrCli, { "cObraPrv( ( cDbfCli )->Cod, cDbfCli, cDbfObr )",  "C",  20, 0, "Provincia defecto",     "",  "Provincia",   "" } )
   aAdd( aCalObrCli, { "cObraPos( ( cDbfCli )->Cod, cDbfCli, cDbfObr )",  "C",  20, 0, "C�digo postal defecto", "",  "C�d. postal", "" } )

Return ( aCalObrCli )

//---------------------------------------------------------------------------//

#else

//---------------------------------------------------------------------------//
//Funciones solo de PDA
//---------------------------------------------------------------------------//

FUNCTION pdaBrwObras( oGet, oGet2, cCodCli, dbfObrasT )

	local oDlg
	local oBrw
   local oFont
   local oBtn
	local oGet1
	local cGet1
   local nOrd        := GetBrwOpt( "BrwObras" )
	local oCbxOrd
   local aCbxOrd     := { "C�digo", "Nombre" }
   local cCbxOrd     := "C�digo"
   local nLevel      := nLevelUsr( "01032" )
   local lClose      := .f.
   local oSayText
   local cSayText    := "Listado de obras"

   nOrd              := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd           := aCbxOrd[ nOrd ]

   if Empty( cCodCli )
		MsgStop( "Es necesario codificar un cliente" )
      return .t.
   end if

   if !File( cPatCli() + "ObrasT.Dbf" )
      MsgStop( 'No existe el fichero de obras' )
      Return .f.
   end if

   if Empty( dbfObrasT )
      USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
      SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE
      lClose      := .t.
   END IF

   ( dbfObrasT )->( ordSetFocus( nOrd ) )

   ( dbfObrasT )->( OrdScope( 0, cCodCli ) )
   ( dbfObrasT )->( OrdScope( 1, cCodCli ) )
   ( dbfObrasT )->( dbGoTop() )

#ifndef __PDA__
   DEFINE DIALOG oDlg RESOURCE "HELPENTRY"      TITLE "Seleccionar direcciones"
#else
   DEFINE DIALOG oDlg RESOURCE "HELPENTRY_PDA"  TITLE "Seleccionar direcciones"

   DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

      REDEFINE SAY oSayTit ;
         VAR      "Buscando direcciones" ;
         ID       110 ;
         COLOR    "N/W*" ;
         FONT     oFont ;
         OF       oDlg

      REDEFINE BTNBMP oBtn ;
         ID       100 ;
         OF       oDlg ;
         FILE     ( cPatBmp() + "brickwall.bmp" ) ;
         NOBORDER ;
         ACTION      ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

#endif

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfObrasT, nil, cCodCli ) );
         BITMAP   "FIND" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE(  ( dbfObrasT )->( OrdSetFocus( oCbxOrd:nAt ) ),;
                     ( dbfObrasT )->( OrdScope( 0, cCodCli ) ),;
                     ( dbfObrasT )->( OrdScope( 1, cCodCli ) ),;
                     oBrw:Refresh(),;
                     oCbxOrd:Refresh(),;
                     oGet1:SetFocus() );
			OF 		oDlg

		REDEFINE LISTBOX oBrw ;
			FIELDS ;
                  ( dbfObrasT )->cCodObr + CRLF + ( dbfObrasT )->cNomObr;
         HEAD ;
                  "C�digo" + CRLF + "Nombre";
         SIZES ;
                  180;
         ALIAS    ( dbfObrasT ) ;
         ID       105 ;
         OF       oDlg

      oBrw:aActions    := {| nCol | lPressCol( nCol, oBrw, oCbxOrd, aCbxOrd, dbfObrasT ) }
      oBrw:bLDblClick  := {|| oDlg:end( IDOK ) }

#ifndef __PDA__

      if ( "PDA" $ cParamsMain() )

      REDEFINE SAY oSayText VAR cSayText ;
         ID       100 ;
         OF       oDlg

      end if

		REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( oDlg:end(IDOK) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         ACTION   ( oDlg:end() )

      if !( "PDA" $ cParamsMain() )

		REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( nAnd( nLevel, ACC_APPD ) != 0 .and. !IsReport() );
         ACTION   ( WinAppRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ) )

		REDEFINE BUTTON ;
         ID       501 ;
         OF       oDlg ;
         WHEN     ( nAnd( nLevel, ACC_EDIT ) != 0 .and. !IsReport() );
         ACTION   ( WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ) )

      if !IsReport()
         oDlg:AddFastKey( VK_F2,    {|| if( nAnd( nLevel, ACC_APPD ) != 0, WinAppRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ), ) } )
         oDlg:AddFastKey( VK_F3,    {|| if( nAnd( nLevel, ACC_EDIT ) != 0, WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ), ) } )
      end if

      end if

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

#else

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuEdtRec( oDlg ) )

#endif

   if oDlg:nResult == IDOK
      oGet:cText( ( dbfObrasT )->CCODOBR )

      if oGet2 != NIL
         oGet2:cText( ( dbfObrasT )->CNOMOBR )
      end if
   end if

   DestroyFastFilter( dbfObrasT )

   SetBrwOpt( "BrwObras", ( dbfObrasT )->( OrdNumber() ) )

   if lClose
      ( dbfObrasT )->( dbCloseArea() )
   else
      ( dbfObrasT )->( OrdSetFocus( nOrd ) )
      ( dbfObrasT )->( OrdScope( 0, nil ) )
      ( dbfObrasT )->( OrdScope( 1, nil ) )
   end if

	oGet:setFocus()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

static function pdaMenuEdtRec( oDlg )

   local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )

Return oMenu

//---------------------------------------------------------------------------//

#endif

//--------------------------------------------------------------------------//
//Funciones comunes del programa y pda
//--------------------------------------------------------------------------//

FUNCTION aItmObr()

   local aItmObr  := {}

   aAdd( aItmObr, { "cCodCli",   "C",   12,    0, "" ,                                 "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cCodObr",   "C",   10,    0, "C�digo de la direcci�n" ,           "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cNomObr",   "C",  150,    0, "Nombre de la direcci�n" ,           "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cDirObr",   "C",  100,    0, "Domicilio de la direcci�n" ,        "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cPobObr",   "C",  100,    0, "Poblaci�n de la direcci�n" ,        "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cPrvObr",   "C",   20,    0, "Provincia de la direcci�n" ,        "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cPosObr",   "C",   10,    0, "C�digo postal de la direcci�n" ,    "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cTelObr",   "C",   17,    0, "Tel�fono de la direcci�n" ,         "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cFaxObr",   "C",   17,    0, "Fax de la direcci�n" ,              "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cCntObr",   "C",  100,    0, "Contacto de la direcci�n" ,         "'@!'",              "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cMovObr",   "C",   17,    0, "M�vil de la direcci�n" ,            "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "lDefObr",   "L",    1,    0, "L�gico de direcci�n por defecto" ,  "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cCodEdi",   "C",   17,    0, "C�digo del cliente en EDI (EAN)",   "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cCodWeb",   "N",   11,    0, "Codigo para la web             ",   "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cEstObr",   "C",   35,    0, "Nombre del establecimiento     ",   "",                  "", "( cDbfObr )" } )
   aAdd( aItmObr, { "cCodPos",   "C",   12,    0, "N�mero operacional" ,               "",                  "", "( cDbfObr )" } )

RETURN ( aItmObr )

//---------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION BrwObras( oGet, oGet2, cCodCli, dbfObrasT )

	local oDlg
	local oBrw
   local oFont
   local oBtn
	local oGet1
	local cGet1
   local nOrd        := GetBrwOpt( "BrwObras" )
	local oCbxOrd
   local aCbxOrd     := { "C�digo", "Nombre" }
   local cCbxOrd     := "C�digo"
   local nLevel      := nLevelUsr( "01032" )
   local lClose      := .f.
   local oSayText
   local cSayText    := "Listado de obras"

   nOrd              := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd           := aCbxOrd[ nOrd ]

   if Empty( cCodCli )
		MsgStop( "Es necesario codificar un cliente" )
      return .t.
   end if

   if !File( cPatCli() + "ObrasT.Dbf" )
      MsgStop( 'No existe el fichero de obras' )
      Return .f.
   end if

   if Empty( dbfObrasT )
      USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
      SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE
      lClose      := .t.
   END IF

   ( dbfObrasT )->( ordSetFocus( nOrd ) )

   ( dbfObrasT )->( OrdScope( 0, cCodCli ) )
   ( dbfObrasT )->( OrdScope( 1, cCodCli ) )
   ( dbfObrasT )->( dbGoTop() )

   DEFINE DIALOG  oDlg ;
      RESOURCE    "HELPENTRY";
      TITLE       "Seleccionar direcciones"

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfObrasT, nil, cCodCli ) );
         BITMAP   "FIND" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE(  ( dbfObrasT )->( OrdSetFocus( oCbxOrd:nAt ) ),;
                     ( dbfObrasT )->( OrdScope( 0, cCodCli ) ),;
                     ( dbfObrasT )->( OrdScope( 1, cCodCli ) ),;
                     oBrw:Refresh(),;
                     oGet1:SetFocus() );
			OF 		oDlg

      oBrw                 := TXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfObrasT
      oBrw:nMarqueeStyle   := 5

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "Codigo"
         :bEditValue       := {|| ( dbfObrasT )->cCodObr }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "Nombre"
         :bEditValue       := {|| ( dbfObrasT )->cNomObr }
         :nWidth           := 360
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

      oBrw:CreateFromResource( 105 )

		REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( nAnd( nLevel, ACC_APPD ) != 0 .and. !IsReport() );
         ACTION   ( WinAppRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ) )

		REDEFINE BUTTON ;
         ID       501 ;
         OF       oDlg ;
         WHEN     ( nAnd( nLevel, ACC_EDIT ) != 0 .and. !IsReport() );
         ACTION   ( WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ) )

      if !IsReport()
         oDlg:AddFastKey( VK_F2,    {|| if( nAnd( nLevel, ACC_APPD ) != 0, WinAppRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ), ) } )
         oDlg:AddFastKey( VK_F3,    {|| if( nAnd( nLevel, ACC_EDIT ) != 0, WinEdtRec( oBrw, bEdit, dbfObrasT, nil, nil, cCodCli ), ) } )
      end if

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK
      oGet:cText( ( dbfObrasT )->CCODOBR )

      if oGet2 != NIL
         oGet2:cText( ( dbfObrasT )->CNOMOBR )
      end if
   end if

   DestroyFastFilter( dbfObrasT )

   SetBrwOpt( "BrwObras", ( dbfObrasT )->( OrdNumber() ) )

   if lClose
      ( dbfObrasT )->( dbCloseArea() )
   else
      ( dbfObrasT )->( OrdSetFocus( nOrd ) )
      ( dbfObrasT )->( OrdScope( 0, nil ) )
      ( dbfObrasT )->( OrdScope( 1, nil ) )
   end if

	oGet:setFocus()

RETURN ( oDlg:nResult == IDOK )

#endif

//---------------------------------------------------------------------------//

FUNCTION cObras( oGet, oGet2, cCodCli, dbfObrasT )

	local lValid 	:= .F.
	local lClose 	:= .F.
	local xValor 	:= oGet:varGet()

	IF Empty( xValor )
		IF oGet2 != NIL
			oGet2:cText( "" )
		END IF
		RETURN .T.
	END IF

   IF Empty( cCodCli )
		MsgStop( "Es necesario codificar un cliente" )
		RETURN .t.
	END IF

   IF dbfObrasT == NIL
      USE ( cPatEmp() + "OBRAST.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
      SET ADSINDEX TO ( cPatEmp() + "OBRAST.CDX" ) ADDITIVE
      lClose   := .t.
   else
      ( dbfObrasT )->( OrdSetFocus( "cCodCli" ) )
   END IF

   xValor      := cCodCli + xValor

   IF ( dbfObrasT )->( dbSeek( xValor ) )

      oGet:cText( ( dbfObrasT )->CCODOBR )

		IF oGet2 != NIL
			oGet2:cText( (dbfObrasT)->CNOMOBR )
		END IF

      lValid   := .T.

	ELSE

      msgStop( "Obra no encontrada", ( dbfObrasT )->( OrdSetFocus() ) )

	END IF

   IF lClose
      CLOSE ( dbfObrasT )
   END IF

RETURN lValid

//---------------------------------------------------------------------------//