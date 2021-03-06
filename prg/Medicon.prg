#include "Error.ch"
#include "FiveWin.ch"
#include "Factu.ch" 

#define  HKEY_LOCAL_MACHINE      2147483650

#define NTRIM(n)                 ( LTrim( Str( n ) ) )

static cFullCurDir

static oMeter
static nMeter  := 0

static oText
static cText   := ""

//--------------------------------------------------------------------------//

#ifndef __PDA__

/*
Alinea por la derecha una cadena con el caracter pasado como 2�
argumento
*/

FUNCTION LJust( cCadena, cChar, nLen )

	DEFAULT cChar := ' '
	DEFAULT nLen  := Len( cCadena )

	IF ValType( cCadena ) == "N"
		cCadena := Str( Int( cCadena ) )
	END IF

RETURN PadR( AllTrim( cCadena ), nLen, cChar )

//--------------------------------------------------------------------------//

/*
Devuelve una cadena con la fecha pasada como argumento
*/

FUNCTION cHoy( dFecha )

	local cMes
	local aMeses := { "Enero",;
							"Febrero",;
							"Marzo",;
							"Abril",;
							"Mayo",;
							"Junio",;
							"Julio",;
							"Agosto",;
							"Septiembre",;
							"Octubre",;
							"Noviembre",;
							"Diciembre" }

	DEFAULT dFecha := DATE()

	cMes	:= aMeses[ month( dFecha ) ]

RETURN ( Str(Day(dFecha)) + " de " +  cMes + " de " + str(year(dFecha)) )

//--------------------------------------------------------------------------//

/*
Crear un codeblock con la expresi�n pasada como argumento comprobando
antes de ralizar esta operacion que sea una expresion valida
*/

FUNCTION Compile( cExpression )

	local bExpression

   if !Empty( cExpression ) .and. Type( cExpression ) != "UE" .and. Type( cExpression ) != "UI"
      bExpression    := &( "{|| " + Rtrim( cExpression ) + " } " )
   else
      bExpression    := nil 
   end if

RETURN ( bExpression )

//----------------------------------------------------------------------------//

FUNCTION CompileParam( cExpression )

   local lError
   local oError
   local oBlock
   local bExpression

   lError            := .f.

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      bExpression    := &( "{| uParam | " + Rtrim( cExpression ) + " } " )

   RECOVER USING oError

      lError         := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

   if lError

      msgStop( "Expresi�n incorrecta " + cExpression + CRLF + ErrorMessage( oError ), cExpression )

      bExpression    := nil

   end if

RETURN ( bExpression )

//----------------------------------------------------------------------------//
/*
Camino completo dentro de un disco
*/

FUNCTION FullCurDir()

   if Empty( cFullCurDir )

#ifdef __XHARBOUR__
      cFullCurDir    := curdrive()
#else
      cFullCurDir    := hb_curdrive()
#endif   
 
      if IsAlpha( cFullCurDir ) .and. ( cFullCurDir != "A" )
         cFullCurDir += ":\"
      else 
         cFullCurDir := "\"
      end if

      cFullCurDir    += CurDir() + If( !Empty( CurDir() ), "\", "" )

   end if

RETURN ( cFullCurDir )

//----------------------------------------------------------------------------//
/*
Funcion Len con mas tipos de datos y acepta pictures
*/

FUNCTION nlen( xVar, xPicture )

   LOCAL nLen  := 0
   LOCAL cTipo := ValType( xVar )

   do case
      case ( cTipo == 'N' ) .AND. ( xPicture == NIL )
			nLen := len( str( xVar ) )   // Controlar decimales y tama�o

      case ( cTipo == 'N' ) .AND. ( xPicture != NIL )
			nLen := len( Transform( xVar, xPicture ) )

      case ( cTipo == 'C' ) .AND. ( xPicture == NIL )
			nLen := len( xVar )

      case ( cTipo == 'C' ) .AND. ( xPicture != NIL )
			nLen := len( Transform( xVar, xPicture ) )

      case ( cTipo == 'D' )
			 nLen := len( dtoc( xVar ) )  // Por el SET CENTURY

      case ( cTipo == 'L' )
			 nLen := 1

      case ( cTipo == 'A' )
			 nLen := Len( xVar )

      case ( cTipo == 'B' )
          nLen := nLen( Eval( xVar ) ) // Recursiva hasta devolver la len del valor de la ultima evaluacion

   end case

RETURN nLen

//--------------------------------------------------------------------------//

FUNCTION nPadR( cText, nSize, oFont, nCol, oInf )

	local nStartCol
	local nWidth

	nWidth 		:= oInf:oDevice:GetTextWidth( cText, oFont ) / oInf:nLogPixX
	nSize			:= oInf:oDevice:GetTextWidth( Replicate( "B", nSize),	oFont ) / oInf:nLogPixX

   nStartCol   := nCol - nWidth + nSize

RETURN nStartCol

//---------------------------------------------------------------------------//

FUNCTION nPadC( cText, nSize, oFont, nCol, oInf )

	local nStartCol
	local nWidth

	nWidth 		:= oInf:oDevice:GetTextWidth( cText, oFont ) / oInf:nLogPixX
	nSize			:= oInf:oDevice:GetTextWidth( Replicate( "B", nSize),	oFont ) / oInf:nLogPixX

	nStartCol	:= nCol + ( ( nWidth - nSize ) / 2 )

RETURN nStartCol

//---------------------------------------------------------------------------//

FUNCTION cDayToStr( dDate )

RETURN ( { "Domingo", "Lunes", "Martes", "Mi�rcoles", "Jueves", "Viernes", "S�bado" }[ DoW( dDate ) ] )

//---------------------------------------------------------------------------//

FUNCTION cMonthToStr( dDate )

RETURN ( {  "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto",;
            "Septiembre", "Octubre", "Noviembre", "Diciembre" }[ Month( dDate ) ] )

//---------------------------------------------------------------------------//
//Devuelve informaci�n sobre la impresora indicada
//

function aPrinterInfo( cPrnName )

   local aInfo    := {}

return ( aInfo )

//---------------------------------------------------------------------------//

Function GoWeb( cUrl )

   DEFAULT cUrl   := __GSTWEB__

   IF !IsWinNt()
      WinExec('start urlto:'+cURL,0)
   ELSE
      WinExec("rundll32.exe url.dll,FileProtocolHandler " + cURL)
   ENDIF

Return NIL

//---------------------------------------------------------------------------//

Function GoHelp( cUrl )

   IF !IsWinNt()
      WinExec( 'start urlto:' + __GSTHELP__ , 0 )
   ELSE
      WinExec( "rundll32.exe url.dll,FileProtocolHandler " + __GSTHELP__ )
   ENDIF

Return NIL

//---------------------------------------------------------------------------//

Static Function DecodeUrlHelp( cUrl )

   cUrl     := StrTran( cUrl, ' ', '_' )
   cUrl     := StrTran( cUrl, '�', '%C3%B1' )
   cUrl     := StrTran( cUrl, '�', '%C3%91' )
   cUrl     := StrTran( cUrl, '�', '%C3%A1' )
   cUrl     := StrTran( cUrl, '�', '%C3%A9' )
   cUrl     := StrTran( cUrl, '�', '%C3%AD' )
   cUrl     := StrTran( cUrl, '�', '%C3%B3' )
   cUrl     := StrTran( cUrl, '�', '%C3%BA' )
   cUrl     := StrTran( cUrl, '�', '%C3%81' )
   cUrl     := StrTran( cUrl, '�', '%C3%89' )
   cUrl     := StrTran( cUrl, '�', '%C3%8D' )
   cUrl     := StrTran( cUrl, '�', '%C3%93' )
   cUrl     := StrTran( cUrl, '�', '%C3%9A' )

Return ( cUrl )


#endif

//---------------------------------------------------------------------------//

Function cNamePath( cFile )

    local nPos    := 0
    local cPath   := ""

    if ( nPos := Rat( "\", cFile ) ) != 0
        cPath     := Upper( SubStr( cFile, 1, nPos - 1 ) )
    endif

Return( cPath )

//---------------------------------------------------------------------------//

FUNCTION RJustObj( oGet, cChar, nLen )

   local cCadena  := oGet:varGet()

   DEFAULT cChar  := ' '
   DEFAULT nLen   := Len( cCadena )

   cCadena        := RJust( cCadena, cChar, nLen )

	oGet:varPut( cCadena )
	oGet:refresh()

RETURN cCadena

//--------------------------------------------------------------------------//

FUNCTION PntReplace( oGet, cChar, nLen )

	local nPointPos
	local cCadena := oGet:varGet()

	DEFAULT cChar	:= "0"
	DEFAULT nLen  	:= Len( cCadena )

	nPointPos 		:= At( ".", cCadena )

	IF nPointPos	!= 0

		cCadena := StrTran( cCadena, ".", "0" )

		WHILE len( AllTrim( cCadena ) ) < nLen
			cCadena := SubStr( cCadena, 1, nPointPos - 1 ) + cChar + SubStr( cCadena, nPointPos )
		END WHILE

		oGet:cText( cCadena )

	END IF

RETURN cCadena

//--------------------------------------------------------------------------//

/*
Alinea por la derecha una cadena con el caracter pasado como 2�
argumento
*/

FUNCTION RJust( cCadena, cChar, nLen )

	DEFAULT cChar := '0'
	DEFAULT nLen  := Len( cCadena )

	IF ValType( cCadena ) == "N"
		cCadena    := Str( Int( cCadena ) )
	END IF

RETURN PadL( AllTrim( cCadena ), nLen, cChar )

//--------------------------------------------------------------------------//

Function GetSubArray( aArray, nPos )

   local a
   local aKeys    := {}

   for each a in aArray
      if !empty(a[ nPos ])
         aAdd( aKeys, a[ nPos ] )
      end if 
   next 

RETURN ( aKeys )

//--------------------------------------------------------------------------//

FUNCTION cGetValue( xVal, cType )

   local cTemp    := ""

   DEFAULT cType  := ValType( xVal )

   xVal           := IsCharBlock( xVal )

   do case
      case cType == "C" .or. cType == "M"

         if !Empty( xVal )
            xVal  := Rtrim( xVal )
         end if
         
         if ( '"' $ xVal ) .or. ( "'" $ xVal )
            cTemp := Rtrim( cValToChar( xVal ) )
         else
            cTemp := '"' + Rtrim( cValToChar( xVal ) ) + '"'
         end if

      case cType == "N"
         cTemp    := cValToChar( xVal )

      case cType == "D"

         cTemp    := 'Ctod( "' + Rtrim( cValToChar( xVal ) ) + '" )'

      case cType == "L"
         if "S" $ Rtrim( Upper( xVal ) )
            cTemp := ".t."
         else
            cTemp := ".f."
         end if

   end case

RETURN ( Rtrim( cTemp ) )

//---------------------------------------------------------------------------//

Static Function IsCharBlock( xVal )

   if IsChar( xVal )

      xVal           := AllTrim( xVal )

      if left( xVal, 1 ) == "{" .and. right( xVal, 1 ) == "}"
         xVal        := StrTran( xVal, "{", "" )
         xVal        := StrTran( xVal, "}", "" )
         xVal        := c2Block( xVal )
         if IsBlock( xVal )
            xVal     := Eval( xVal )
         end if 

      end if 

   end if

Return ( xVal )

//---------------------------------------------------------------------------//

Function ReplaceCreator( oShell, cDbf, aStructure, cType )

   local oReplaceDialog

   oReplaceDialog       := TReplaceCreator():Init( oShell )

   if !Empty( oReplaceDialog )
      oReplaceDialog:SetFields( aStructure )
      oReplaceDialog:SetFilterType( cType )
      oReplaceDialog:SetDatabaseToReplace( cDbf )
      oReplaceDialog:Dialog()
      oReplaceDialog:End()
   end if

RETURN ( nil )

//---------------------------------------------------------------------------//

Function AutoMeterDialog( oDialog )

   oDialog:Disable()

   oMeter   := TMeter():New( 0, 0, {| u | if( pCount() == 0, nMeter, nMeter := u ) }, 100, oDialog, oDialog:nWidth, 4, .t., .t., , "", .t., , ,rgb( 128,255,0 ) )

RETURN ( oMeter )

//---------------------------------------------------------------------------//

Function SetTotalAutoMeterDialog( nSet )

   if !empty(oMeter)
      oMeter:SetTotal( nSet )  
   end if 

RETURN ( oMeter )

//---------------------------------------------------------------------------//

Function SetAutoMeterDialog( nSet )

   if !empty(oMeter)
      oMeter:Set( nSet )
   end if 

RETURN ( oMeter )

//---------------------------------------------------------------------------//

Function EndAutoMeterDialog( oDialog )

   oMeter:Hide()
   oMeter:End()

   oMeter   := nil

   oDialog:Enable()

RETURN ( nil )

//---------------------------------------------------------------------------//

Function GetAutoMeterDialog( nSet )

RETURN ( oMeter )

//---------------------------------------------------------------------------//

Function AutoTextDialog( oDialog )

   oText   := TSay():New( 5, 0, {||cText}, oDialog, , , .t., .f., .f., .t., rgb(0,0,0), rgb(239,228,176), oDialog:nWidth, 18, .f., .t., .f., .f., .f. )

RETURN ( oText )

//---------------------------------------------------------------------------//

Function SetAutoTextDialog( cText )

   if !empty(oText)
      oText:SetText( cText )  
   end if 

RETURN ( oText )

//---------------------------------------------------------------------------//

Function EndAutoTextDialog( oDialog )

   oText:Hide()
   oText:End()

   oText   := nil

RETURN ( nil )

//---------------------------------------------------------------------------//

Function GetAutoTextDialog()

RETURN ( oText )

//---------------------------------------------------------------------------//

/*
Function ErrorMessage( e )

   // start error message
    local cMessage := if( empty( e:OsCode ), ;
                          if( e:severity > ES_WARNING, "Error ", "Warning " ),;
                          "(DOS Error " + NTRIM(e:osCode) + ") " )

   // add subsystem name if available
    cMessage += if( ValType( e:SubSystem ) == "C",;
                    e:SubSystem()                ,;
                    "???" )

   // add subsystem's error code if available
    cMessage += if( ValType( e:SubCode ) == "N",;
                    "/" + NTRIM( e:SubCode )   ,;
                    "/???" )
   // add error description if available
  if ( ValType( e:Description ) == "C" )
        cMessage += "  " + e:Description
   end

   // add either filename or operation
    cMessage += if( ! Empty( e:FileName ),;
                    ": " + e:FileName   ,;
                    if( !Empty( e:Operation ),;
                        ": " + e:Operation   ,;
                        "" ) )
return cMessage
*/
//----------------------------------------------------------------------------//
