#include "FiveWin.Ch"
#include "Factu.ch" 

static oMsg
static oDlgWat
static nPrgWat := 0
static oCur
static nCur    := 1

//--------------------------------------------------------------------------//

Function PlayAvi( cFileAvi )

	local oBitMap
	local cBuffer		:= Space(200)

	DEFAULT cFileAvi 	:= "VRFYDATA.AVI"

	DEFINE DIALOG oDlgWat RESOURCE "TESTAVI"

	REDEFINE BITMAP oBitMap ID 500 OF oDlgWat

	ACTIVATE DIALOG oDlgWat ;
		NOWAIT ;
		ON INIT ;
			(  mciSendStr( "OPEN AVIVIDEO ALIAS VIDEO STYLE POPUP", @cBuffer,	oDlgWat:hWnd),;
				mciSendStr( "CLOSE VIDEO", @cBuffer, oDlgWat:hWnd ),;
				mciSendStr( "OPEN AVIVIDEO!" + Upper( Alltrim( cFileAvi ) ) + " ALIAS VIDEO PARENT "+ Alltrim( str( oBitMap:hWnd ) ), @cBuffer, oDlgWat:hWnd ),;
				mciSendStr( "PUT VIDEO DESTINATION AT 0 0 170 156", @cBuffer, oDlgWat:hWnd ),;
				mciSendStr( "WINDOW VIDEO HANDLE " + Alltrim( Str( oBitMap:hWnd ) ), @cBuffer, oDlgWat:hWnd),;
				mciSendStr( "PLAY VIDEO REPEAT", @cBuffer, oDlgWat:hWnd ),;
				sysRefresh();
			 )

Return nil

//--------------------------------------------------------------------------//

Function EndAvi()

	oDlgWat:end()

   oDlgWat  := nil

Return nil

//--------------------------------------------------------------------------//

Function WaitPlease( cMsg, cTitle )

   local oBmp

   DEFAULT cMsg   := "Procesando"
	DEFAULT cTitle	:= "Espere por favor..."

   CursorWait()

   DEFINE DIALOG oDlgWat NAME "WAIT_MOVE" TITLE cTitle

   REDEFINE BITMAP oBmp RESOURCE "WEBTOP" ID 600 OF oDlgWat

   TAnimat():Redefine( oDlgWat, 100, { "BAR_01" }, 1 )

   REDEFINE SAY oMsg PROMPT cMsg ID 110 OF oDlgWat

   ACTIVATE DIALOG oDlgWat CENTER NOWAIT

RETURN ( oDlgWat )

//--------------------------------------------------------------------------//

FUNCTION InitWait()

   CursorWait()

   DEFINE DIALOG oDlgWat TITLE "" FROM -10, -10 TO -10, -10

   ACTIVATE DIALOG oDlgWat NOWAIT

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION EndWait()

	oDlgWat:end()
   oDlgWat        := nil

   CursorWE()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION WatMet( oMet, dbfTmp, cTxt )

	DEFAULT cTxt	:= "Procesando"

   CursorWait()

   if oMet != nil .and. cTxt != nil
      oMet:cText  := cTxt
   end if

   if dbfTmp != nil
      oMet:nTotal := ( dbfTmp )->( LastRec() )
   end if

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION RefMet( oMet )

RETURN ( oMet:set( ++nPrgWat ) )

//--------------------------------------------------------------------------//

FUNCTION EndMet( oMet )

   local nMetTot  := oMet:nTotal

   if oMet != nil
      oMet:cText  := ""
      oMet:Set( nMetTot )
      Eval( oMet:bSetGet, 0 )
   end if

   CursorWe()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION IniWatCur()

   oCur  := Array( 8 )

   DEFINE CURSOR oCur[1] RESOURCE "PROC_1"
   DEFINE CURSOR oCur[2] RESOURCE "PROC_2"
   DEFINE CURSOR oCur[3] RESOURCE "PROC_3"
   DEFINE CURSOR oCur[4] RESOURCE "PROC_4"
   DEFINE CURSOR oCur[5] RESOURCE "PROC_5"
   DEFINE CURSOR oCur[6] RESOURCE "PROC_6"
   DEFINE CURSOR oCur[7] RESOURCE "PROC_7"
   DEFINE CURSOR oCur[8] RESOURCE "PROC_8"

   SetCursor( oCur[nCur]:hCursor )
   SysRefresh()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION RefWatCur()

   nCur++

   if nCur > 8
      nCur := 1
   end if

   SetCursor( oCur[nCur]:hCursor )
   SysRefresh()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION EndWatCur()

   oCur[1]:End()
   oCur[2]:End()
   oCur[3]:End()
   oCur[4]:End()
   oCur[5]:End()
   oCur[6]:End()
   oCur[7]:End()
   oCur[8]:End()

   CursorWe()
   SysRefresh()

RETURN NIL

//--------------------------------------------------------------------------//

Function CreateWaitMeter( cMsg, cTitle, nTotal )

   oDlgWat              := TWaitMeter():New( cMsg, cTitle, nTotal )

Return ( SysRefresh() )

//--------------------------------------------------------------------------//

Function RefreshWaitMeter( nPosition )

   oDlgWat:RefreshMeter( nPosition )

Return ( SysRefresh() )

//--------------------------------------------------------------------------//

Function EndWaitMeter()

   oDlgWat:End()

Return ( SysRefresh() )

//--------------------------------------------------------------------------//

CLASS TWaitMeter

   DATA  oDlgWait

   DATA  oMessage
   DATA  cMessage

   DATA  oProgress

   DATA  cTitle
   DATA  oBitmap

   DATA  oMeter
   DATA  nTotal

   Method New( cMsg, cTitle, nTotal )

   Method SetMessage( cMessage )       INLINE   ( ::oMessage:SetText( cMessage ) )

   Method RefreshMeter( nPosition )    INLINE   ( ::oProgress:Set( nPosition ) )

   Method SetTotal( nTotal )           INLINE   ( ::oProgress:SetTotal( nTotal ) )

   Method End()

ENDCLASS

//--------------------------------------------------------------------------//

Method New( cTitle, cMsg, nTotal ) CLASS TWaitMeter

   DEFAULT cMsg         := "Procesando"
   DEFAULT cTitle       := "Espere por favor..."
   DEFAULT nTotal       := 0

   ::cMessage           := cMsg
   ::cTitle             := cTitle
   ::nTotal             := nTotal

   CursorWait()

   ::oDlgWait           := TDialog():New( , , , , ::cTitle, "Wait_Meter", , .f.,,,,,,.f. )

   ::oBitmap            := TBitmap():ReDefine( 600, "Gears_48_alpha", , ::oDlgWait, , , .f., .f., , , .f., , , .f. )

   ::oMessage           := TSay():ReDefine( 110, {|| ::cMessage }, ::oDlgWait, , , , .f. )

   ::oProgress          := TApoloMeter():ReDefine( 120, { | u | If( pCount() == 0, nPrgWat, nPrgWat := u ) }, ::nTotal, ::oDlgWait, .f., , , .t. )

   ::oDlgWait:Activate( , , , .t., ,.f. )

   SysRefresh()

RETURN ( Self )

//--------------------------------------------------------------------------//

Method End() CLASS TWaitMeter

   ::RefreshMeter( 0 )

   ::oBitmap:End()

   ::oDlgWait:End()

   ::oDlgWait           := nil

   CursorWE()

   SysRefresh()

RETURN ( nil )

//--------------------------------------------------------------------------//