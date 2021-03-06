#include "FiveWin.Ch"
#include "Factu.ch" 
#include "MesDbf.ch"

//----------------------------------------------------------------------------//

CLASS TTipArt FROM TMANT

   DATA oClasificacionArticulo

   METHOD Create( cPath ) CONSTRUCTOR

   METHOD New( cPath, oWndParent, oMenuItem ) CONSTRUCTOR

   METHOD OpenFiles( lExclusive )
   MESSAGE OpenService( lExclusive )   METHOD OpenFiles( lExclusive )

   METHOD DefineFiles()

   METHOD Activate()

   METHOD lValid( oGet, oSay )

   METHOD cNombre( cCodArt )
   METHOD nTipo( cCodArt )

   METHOD Resource( nMode )
   METHOD InitResource()
   METHOD SaveResource( oGet, oGet2, oDlg )

   METHOD PublicarWeb( lLoad )

   METHOD Enviar( lLoad )

   METHOD lSelect( lSel, oBrw )
   METHOD SelectAll( lSel, oBrw )

END CLASS

//----------------------------------------------------------------------------//

METHOD Create( cPath )

   DEFAULT cPath     := cPatArt()

   ::cPath           := cPath
   ::oDbf            := nil

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD New( cPath, oWndParent, oMenuItem )

   DEFAULT cPath        := cPatArt()
   DEFAULT oWndParent   := GetWndFrame()

   if oMenuItem != nil
      ::nLevel          := nLevelUsr( oMenuItem )
   else
      ::nLevel          := nLevelUsr( "01013" )
   end if

   ::cPath              := cPath
   ::oWndParent         := oWndParent

   ::oDbf               := nil

   ::cMru               := "Cubes_Blue_16"

   ::cBitmap            := clrTopArchivos

   ::lAutoButtons       := .f.
   ::lCreateShell       := .f.

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD OpenFiles( lExclusive, cPath )

   local lOpen          := .t.
   local oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   DEFAULT lExclusive   := .f.

   BEGIN SEQUENCE

   if Empty( ::oDbf )
      ::DefineFiles( cPath )
   end if

   ::oDbf:Activate( .f., !( lExclusive ) )

   RECOVER

      msgStop( "Imposible abrir las bases de datos de tipos de articulos" )
      ::CloseFiles()
      lOpen             := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//----------------------------------------------------------------------------//

METHOD DefineFiles( cPath, cDriver )

   DEFAULT cPath        := ::cPath
   DEFAULT cDriver      := cDriver()

   DEFINE DATABASE ::oDbf FILE "Tipart.Dbf" CLASS "Tipart" ALIAS "Tipart" PATH ( cPath ) VIA ( cDriver ) COMMENT "Tipos de art�culos"

      FIELD CALCULATE NAME "bSndDoc"   LEN  14  DEC 0 COMMENT { "Enviar", "Lbl16", 3 }       VAL {|| ::oDbf:FieldGetByName( "lSelect" ) } ;
            BITMAPS "Sel16", "Nil16" COLSIZE 20                                                             OF ::oDbf

      FIELD CALCULATE NAME "bPubInt"   LEN  14  DEC 0 COMMENT { "Publicar", "SndInt16", 3 }  VAL {|| ::oDbf:FieldGetByName( "lPubInt" ) } ;
            BITMAPS "Sel16", "Nil16" COLSIZE 20                                                             OF ::oDbf

      FIELD NAME "cCodTip" TYPE "C"    LEN   3  DEC 0 COMMENT "C�digo"         PICTURE "@!"  COLSIZE 60     OF ::oDbf
      FIELD NAME "cNomTip" TYPE "C"    LEN 100  DEC 0 COMMENT "Nombre"                       COLSIZE 200    OF ::oDbf

      FIELD CALCULATE NAME "cTipArt"   LEN 100  DEC 0 COMMENT "Clasificaci�n"                VAL {|| ClasificacionTipoArticulo():GetNombre( ::oDbf:FieldGetByName( "nTipArt" ) ) } ;
            COLSIZE 120                                                                                     OF ::oDbf

      FIELD NAME "nTipArt" TYPE "N"    LEN   1  DEC 0 COMMENT ""               HIDE          COLSIZE 0      OF ::oDbf              
      FIELD NAME "lSelect" TYPE "L"    LEN   1  DEC 0 COMMENT ""               HIDE          COLSIZE 0      OF ::oDbf
      FIELD NAME "lPubInt" TYPE "L"    LEN   1  DEC 0 COMMENT ""               HIDE          COLSIZE 0      OF ::oDbf
      FIELD NAME "cCodWeb" TYPE "N"    LEN  11  DEC 0 COMMENT "C�digo Web"     HIDE                         OF ::oDbf
      FIELD NAME "cImgTip" TYPE "C"    LEN 250  DEC 0 COMMENT "Imagen"         HIDE                         OF ::oDbf
      FIELD NAME "nPosInt" TYPE "N"    LEN   3  DEC 0 COMMENT "nPosInt"        HIDE                         OF ::oDbf
      FIELD NAME "cNomInt" TYPE "C"    LEN 100  DEC 0 COMMENT "Nombre comercio electr�nico"                 OF ::oDbf

      INDEX TO "TipArt.CDX" TAG "cCodTip" ON "cCodTip"            COMMENT "C�digo"           NODELETED      OF ::oDbf
      INDEX TO "TipArt.CDX" TAG "cNomTip" ON "Upper( cNomTip )"   COMMENT "Nombre"           NODELETED      OF ::oDbf
      INDEX TO "TipArt.CDX" TAG "cCodWeb" ON "Str( cCodWeb, 11 )" COMMENT "C�digoweb"        NODELETED      OF ::oDbf

   END DATABASE ::oDbf

RETURN ( ::oDbf )

//----------------------------------------------------------------------------//

METHOD Activate()

   if nAnd( ::nLevel, 1 ) != 0
      msgStop( "Acceso no permitido." )
      Return ( Self )
   end if

   /*
   Cerramos todas las ventanas-------------------------------------------------
   */

   if ::oWndParent != nil
      ::oWndParent:CloseAll()
   end if

   if Empty( ::oDbf ) .or. !::oDbf:Used()
      ::lOpenFiles      := ::OpenFiles()
   end if

   /*
   Creamos el Shell------------------------------------------------------------
   */

   if ::lOpenFiles

      if !::lCreateShell
         ::CreateShell( ::nLevel )
      end if

      ::oWndBrw:GralButtons( Self )

      DEFINE BTNSHELL RESOURCE "Lbl" OF ::oWndBrw ;
         NOBORDER ;
         ACTION   ( ::Enviar( .t. ) ) ;
         TOOLTIP  "En(v)iar" ;
         HOTKEY   "V";
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "SNDINT" OF ::oWndBrw ;
         NOBORDER ;
         ACTION   ( ::PublicarWeb( .t. ) ) ;
         TOOLTIP  "(P)ublicar" ;
         HOTKEY   "P";
         LEVEL    ACC_EDIT

      ::oWndBrw:EndButtons( Self )

      if ::cHtmlHelp != nil
         ::oWndBrw:cHtmlHelp  := ::cHtmlHelp
      end if

      ::oWndBrw:Activate( nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, {|| ::CloseFiles() }, nil, nil )

   end if

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD Resource( nMode )

	local oDlg
   local oGet
   local oGetNombre
   local oGetNombreInt
   local oGetImagen
   local oBmpImagen

   if ( nMode == APPD_MODE )
      ::oDbf:nPosInt := 1
      ::oDbf:nTipArt := 1
   end if

   DEFINE DIALOG oDlg RESOURCE "TipArt" TITLE LblTitle( nMode ) + "tipos de art�culos"

      REDEFINE GET oGet VAR ::oDbf:cCodTip UPDATE;
			ID 		100 ;
         WHEN     ( nMode == APPD_MODE ) ;
			PICTURE 	"@!" ;
			OF 		oDlg

      REDEFINE GET oGetNombre VAR ::oDbf:cNomTip UPDATE;
			ID 		110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      ::oClasificacionArticulo   := ClasificacionTipoArticulo():New( 200, oDlg )
      ::oClasificacionArticulo:SetMode( nMode )

      REDEFINE GET oGetNombreInt VAR ::oDbf:cNomInt UPDATE;
         ID       150 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE CHECKBOX ::oDbf:lPubInt ;
         ID       130 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET ::oDbf:nPosInt ;
         ID       180 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         VALID    ( ::oDbf:nPosInt >= 1 .and. ::oDbf:nPosInt <= 999 ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET oGetImagen VAR ::oDbf:cImgTip UPDATE;
         BITMAP   "Folder" ;
         ON HELP  ( GetBmp( oGetImagen, oBmpImagen ) ) ;
         ON CHANGE( ChgBmp( oGetImagen, oBmpImagen ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ID       120 ;
         OF       oDlg

      REDEFINE IMAGE oBmpImagen ;
         ID       600 ;
         OF       oDlg ;
         FILE     cFileBmpName( ::oDbf:cImgTip )

      oBmpImagen:SetColor( , GetSysColor( 15 ) )
      oBmpImagen:bLClicked  := {|| ShowImage( oBmpImagen ) }
      oBmpImagen:bRClicked  := {|| ShowImage( oBmpImagen ) }

      REDEFINE GET ::oDbf:cCodWeb UPDATE;
         ID       140 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "99999" ;
			OF 		oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::SaveResource( oGet, oGetNombre, oDlg, nMode ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
			ACTION 	( oDlg:end() )

   REDEFINE BUTTON ;
         ID       9 ;
			OF 		oDlg ;
         ACTION   ( ChmHelp( "Tipos_de_art�culos" ) )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| ::SaveResource( oGet, oGetNombre, oDlg ) } )
   end if

   oDlg:AddFastKey( VK_F1, {|| ChmHelp( "Tipos_de_art�culos" ) } )

   oDlg:bStart    := {|| oGet:SetFocus() }

   oDlg:Activate( , , , .t., , , {|| ::InitResource() } )

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

METHOD InitResource()
   
   ::oClasificacionArticulo:SetNumber( ::oDbf:nTipArt )

Return ( Self )

//--------------------------------------------------------------------------//

METHOD SaveResource( oGet, oGetNombre, oDlg )

   if ( ::nMode == APPD_MODE .or. ::nMode == DUPL_MODE )

      if Empty( ::oDbf:cCodTip )
         MsgStop( "C�digo de tipo de art�culo no puede estar vac�o." )
         oGet:SetFocus()
         Return .f.
      end if

      ::oDbf:cCodTip := RJust( ::oDbf:cCodTip, "0" )

      if ::oDbf:SeekInOrd( ::oDbf:cCodTip, "cCodTip" )
         MsgStop( "C�digo ya existe " + Rtrim( ::oDbf:cCodTip ) )
         return .f.
      end if

   end if

   if Empty( ::oDbf:cNomTip )
      MsgStop( "Nombre de tipo de art�culo no puede estar vac�o." )
      oGetNombre:SetFocus()
      Return .f.
   end if

   ::oDbf:lSelect    := .t.
   ::oDbf:cCodWeb    := 0
   ::oDbf:nTipArt    := ::oClasificacionArticulo:GetNumber()

RETURN ( oDlg:end( IDOK ) )

//--------------------------------------------------------------------------//

Method lSelect( lSel, oBrw )

   ::oDbf:FieldPutByName( "lSelect", lSel )

   if oBrw != nil
      oBrw:Refresh()
   end if

Return ( Self )

//--------------------------------------------------------------------------//

METHOD SelectAll( lSel, oBrw )

   ::oDbf:GetStatus()

   DEFAULT lSel   := .f.

   ::oDbf:GoTop()
   while !( ::oDbf:eof() )
      ::lSelect( lSel )
      ::oDbf:Skip()
   end while

   ::oDbf:SetStatus()

   if oBrw != nil
      oBrw:Refresh()
   end if

RETURN ( Self )

//--------------------------------------------------------------------------//

METHOD lValid( oGet, oSay )

   local cCodArt

   if Empty( oGet:VarGet() )
      return .t.
   end if

   cCodArt        := RJustObj( oGet, "0" )

   if ::oDbf:Seek( cCodArt )
      oGet:cText( cCodArt )
      if oSay != nil
         oSay:cText( ::oDbf:cNomTip )
      end if
   else
      msgStop( "C�digo no encontrado" )
      return .f.
   end if

RETURN .t.

//--------------------------------------------------------------------------//

METHOD cNombre( cCodTip )

   local cNombre  := ""

   if ::oDbf:Seek( cCodTip )
      cNombre     := ::oDbf:cNomTip
   end if

RETURN ( cNombre )

//---------------------------------------------------------------------------//

METHOD nTipo( cCodTip )

   local nTipo  := 0

   if ::oDbf:Seek( cCodTip )
      nTipo     := ::oDbf:nTipArt
   end if

RETURN ( nTipo )

//---------------------------------------------------------------------------//

METHOD PublicarWeb()

   local lPublicar   := !::oDbf:lPubInt

   ::oDbf:Load()
   ::oDbf:lPubInt    := lPublicar
   ::oDbf:lSelect    := lPublicar
   ::oDbf:cCodWeb    := 0
   ::oDbf:Save()

   ::oWndBrw:Refresh()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Enviar( lLoad )

   DEFAULT lLoad     := .f.

   if lLoad
      ::oDbf:Load()
      ::oDbf:lSelect := !::oDbf:lSelect
   end if

      ::oDbf:cCodWeb := 0

   if lLoad
      ::oDbf:Save()
      ::oWndBrw:Refresh()
   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

CLASS ClasificacionTipoArticulo
   
   DATA        oClasificacionArticulo
   DATA        cClasificacionArticulo

   CLASSDATA   aClasificacionArticulo     INIT { "Terminado", "Semiterminado", "Materia prima", "Desecho", "Otros" }
   
   METHOD New( nId, oDialog)

   METHOD Change()                        VIRTUAL

   METHOD GetText()                       INLINE ( ::oClasificacionArticulo:VarGet() )
   METHOD SetText( cText )                INLINE ( ::oClasificacionArticulo:Set( cText ) )

   METHOD GetNumber()                     INLINE ( ::oClasificacionArticulo:nAt )
   METHOD SetNumber( nNumber )            INLINE ( ::SetText( nNumber ) )

   METHOD SetMode( nMode )                INLINE ( ::oClasificacionArticulo:bWhen := {| nMode | nMode != APPD_MODE } )

   METHOD GetNombre()

END CLASS

METHOD New( nId, oDialog ) CLASS ClasificacionTipoArticulo

   REDEFINE COMBOBOX ::oClasificacionArticulo ;
            VAR      ::cClasificacionArticulo ;
            ID       ( nId ) ;
            ITEMS    ::aClasificacionArticulo ;
            OF       oDialog

   ::oClasificacionArticulo:bChange := {|| ::Change( ::oClasificacionArticulo ) }
   
RETURN ( Self )

METHOD GetNombre( nTipArt )

   local cNombre     := ""

   if nTipArt > 0
      cNombre        := ::aClasificacionArticulo[ ( Min( Max( nTipArt, 1 ), len( ::aClasificacionArticulo ) ) ) ] 
   end if

RETURN ( cNombre )

//---------------------------------------------------------------------------//

Function GetNombreClasificacionTipoArticulo( nTipoArticulo )

Return ( ClasificacionTipoArticulo():GetNombre( nTipoArticulo ) )

//---------------------------------------------------------------------------//
