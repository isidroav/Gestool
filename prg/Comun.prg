#ifndef __PDA__
   #include "FiveWin.Ch"
   #include "Factu.ch"
   #include "Empresa.ch"
   #include "hbxml.ch"
   #include "Xbrowse.ch"
#else
   #include "FWCE.ch"
   REQUEST DBFCDX
#endif

#ifdef __SQLLIB__
   #include "sqlrdd.ch"        // Needed if you plan to use native connection to MySQL
   #include "mysql.ch"         // Needed if you plan to use native connection to MySQL
#endif

static aEmpresa

static cCodEmp          := ""

#ifndef __PDA__

static aMnuNext         := {}
static aMnuPrev         := {}
static aDlgEmp          := {}

static nError           := 0

static nHndCaj

static aEmpresasGrupo   := {}

static cDefPicIn
static cDefPicOut

static cCodigoEmpresaEnUso

#endif

static lAds             := .f.
static lAIS             := .f.
static lCdx             := .f.

static cIp              := ""
static cData            := ""

static dSysDate

static cEmpUsr
static cPatGrp
static cPatCli
static cPatArt
static cPatPrv
static cPatAlm
static cPatEmp
static cPatTmp
static cPathPC
static cNombrePc        := ""

static cUsrTik

static oFastReport

//----------------------------------------------------------------------------//

Function lAds( lSetAds )

   if IsLogic( lSetAds )
      lAds     := lSetAds
   end if

Return ( lAds )

//----------------------------------------------------------------------------//

Function lAIS( lSetAIS )

   if IsLogic( lSetAIS )
      lAIS     := lSetAIS
   end if

Return ( lAIS )

//----------------------------------------------------------------------------//

Function lAdsRdd()

Return ( lAds() .or. lAIS() )

//----------------------------------------------------------------------------//

Function cIp( cSetIp )

   if IsChar( cSetIp )
      cIp      := cSetIp
   end if

Return ( cPath( cIp ) )

//----------------------------------------------------------------------------//

Function cData( cSetData )

   if IsChar( cSetData )
      cData    := cSetData
   end if

Return ( if( !Empty( cData ), cPath( cData ), "" ) )

//----------------------------------------------------------------------------//

Function cAdsUNC()

   if ( "localhost" $ cIp() )
      Return( cData() )
   end if

Return ( cIp() + cData() )

//----------------------------------------------------------------------------//

Function lCdx( lSetCdx )

   if IsLogic( lSetCdx )
      lCdx     := lSetCdx
   end if

Return ( lCdx )

//---------------------------------------------------------------------------//

Function lPda()

Return ( "PDA" $ cParamsMain() )

//---------------------------------------------------------------------------//

#ifndef __PDA__

Function cDriver()

   if lAds()
      Return ( 'ADSCDX' )
   end if

   if lAIS()
      Return ( 'ADSCDX' )
   end if

Return ( 'DBFCDX' )

//---------------------------------------------------------------------------//

Function cADSDriver()

Return ( 'ADS' )

//---------------------------------------------------------------------------//

Function cLocalDriver()

Return ( 'DBFCDX' )

//---------------------------------------------------------------------------//

Function cNombrePc( xValue )

   if !Empty( xValue )
      cNombrePc   := xValue
   end if

Return ( cNombrePc )

//--------------------------------------------------------------------------//

Function CacheRecords( cAlias )

   if lAdsRdd()
      ( cAlias )->( AdsCacheRecords( 50 ) )
   end if

Return nil

//---------------------------------------------------------------------------//

/*
Funciones para gst rotor
*/
//---------------------------------------------------------------------------//

#ifdef __SQLLIB__

Function cPatDat()

Return ( "Datos\" )

#else

Function cPatDat( lFull )

   DEFAULT lFull  := .f.

   if lAds()
      Return ( cAdsUNC() + "Datos\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + "Datos\" )
   end if

   if lAIS() .and. !lFull
      Return ( "Datos" )
   end if

   if lCdx()
      Return ( FullCurDir() + "Datos\" )
   end if

Return ( FullCurDir() + "Datos\" )

//----------------------------------------------------------------------------//

Function cPatADS( lFull )

   DEFAULT lFull  := .f.

   if lAds()
      Return ( cAdsUNC() + "ADS\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + "ADS\" )
   end if

   if lAIS() .and. !lFull
      Return ( "ADS" )
   end if

   if lCdx()
      Return ( FullCurDir() + "ADS\" )
   end if

Return ( FullCurDir() + "ADS\" )

//----------------------------------------------------------------------------//

Function cPatEmpTmp( lShort )

   DEFAULT lShort  := .f.

   if lAds()
      Return ( cAdsUNC() + "EmpTmp\" )
   end if

Return ( if( !lShort, FullCurDir(), "" ) + "EmpTmp\" )

//----------------------------------------------------------------------------//

Function cPatEmpOld( cCodEmp )

   if lAds()
      Return ( cAdsUNC() + "Emp" + cCodEmp + "\" )
   end if

Return ( FullCurDir() + "Emp" + cCodEmp + "\" )

//----------------------------------------------------------------------------//

Function cPatGrpOld( cCodGrp )

   if lAds()
      Return ( cAdsUNC() + "Grp" + cCodGrp + "\" )
   end if

Return ( FullCurDir() + "Grp" + cCodGrp + "\" )

//----------------------------------------------------------------------------//

Function cPatTmp()

   if Empty( cPatTmp )

      cPatTmp     := GetEnv( 'TEMP' )

      if Empty( cPatTmp )
         cPatTmp  := GetEnv( 'TMP' )
      endif

      if Empty( cPatTmp ) .or. ! lIsDir( cPatTmp )
         cPatTmp  := GetWinDir()
      endif

      cPatTmp     += If( Right( cPatTmp, 1 ) == '\', '', '\' ) + 'Apolo'

      if !lIsDir( cPatTmp )
         MakeDir( cPatTmp )
      endif

      if Right( cPatTmp, 1 ) != '\'
         cPatTmp  += '\'
      end if

   end if

Return ( cPatTmp )

//----------------------------------------------------------------------------//

Function cPatIn( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "In\" )

//---------------------------------------------------------------------------//

Function cPatScript( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Script\" )

//----------------------------------------------------------------------------//

Function cPatOut( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Out\" )

//----------------------------------------------------------------------------//

Function cPatSafe( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Safe\" )

//----------------------------------------------------------------------------//

Function cPatBmp( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Bmp\" )

//----------------------------------------------------------------------------//

Function cPatPsion( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Psion\" )

//----------------------------------------------------------------------------//

Function cPatHtm( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Htm\" )

//----------------------------------------------------------------------------//

Function cPatXml( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Xml\" )

//----------------------------------------------------------------------------//

FUNCTION PicIn()

   if Empty( cDefPicIn )
      cDefPicIn   := cPirDiv( cDivEmp() )
   end if

RETURN ( cDefPicIn )

//---------------------------------------------------------------------------//

Function cPatReport( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Reports\" )

//----------------------------------------------------------------------------//

function by( uVal )

   local uRet     := uVal

return ( uRet )

//---------------------------------------------------------------------------//

Function nHndCaj( nHnd )

   if nHnd != nil
      nHndCaj  := nHnd
   end if

Return nHndCaj

//---------------------------------------------------------------------------//

Function SelSysDate( oMenuItem )

   DEFAULT oMenuItem := "01084"

   if dSysDate == nil
      dSysDate       := Date()
   end if

   /*
   Obtenemos el nivel de acceso
   */

   if nAnd( nLevelUsr( oMenuItem ), 1 ) != 0
      msgStop( "Acceso no permitido." )
   else
      dSysDate       := Calendario( dSysDate, "Fecha de trabajo" )
   end if

Return ( dSysDate )

//----------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

function ExcMnuNext( cName )

   local nPos

   if cName == nil
      nPos  := len( aMnuNext )
   else
      nPos  := aScan( aMnuNext, {|c| c[1] == cName } )
   end if

   if nPos != 0

      Eval( aMnuNext[ nPos, 2 ] )

      // Pasamos la accion a menu atras

      addMnuPrev( aMnuNext[ nPos, 1 ], aMnuNext[ nPos, 2 ] )

      // Eliminamos la accion

      aDel( aMnuNext, nPos )
      aSize( aMnuNext, len( aMnuNext ) - 1 )

   end if

return .t.

//---------------------------------------------------------------------------//

function MnuNext( oBtn, oWnd )

   local n
   local cText
   local oMenu
   local bAction

   DEFAULT oWnd   := oWnd()

   oMenu := MenuBegin( .T. )

   for n := 1 to len( aMnuNext )

      cText    := by( aMnuNext[ n, 1 ] )
      bAction  := bMnuNext( cText )

      MenuAddItem( cText,, .F.,, bAction,,,,,,, .F.,,, .F. )

   next

   MenuEnd()

   oMenu:Activate( 0, oBtn:nRight, oBtn )

RETURN NIL

//---------------------------------------------------------------------------//

function addMnuPrev( cName, uAction )

   if aScan( aMnuPrev, {|c| c[1] == cName } ) == 0
      if valtype( uAction ) == "C"
         aAdd( aMnuPrev, { cName, &( "{||" + uAction + "() }" ) } )
      else
         aAdd( aMnuPrev, { cName, uAction } )
      end if
   end if

return nil

//---------------------------------------------------------------------------//

function ExcMnuPrev( cName )

   local nPos

   if cName == nil
      nPos  := len( aMnuPrev )
   else
      nPos  := aScan( aMnuPrev, {|c| c[1] == cName } )
   end if

   if nPos != 0

      Eval( aMnuPrev[ nPos, 2 ] )

      // Pasamos la accion a menu atras

      addMnuNext( aMnuPrev[ nPos, 1 ], aMnuPrev[ nPos, 2 ] )

      // Eliminamos la accion

      aDel( aMnuPrev, nPos )
      aSize( aMnuPrev, len( aMnuPrev ) - 1 )

   end if

return .t.

//---------------------------------------------------------------------------//

Function MnuPrev( oBtn, oWnd )

   local n
   local cText
   local oMenu
   local bAction

   DEFAULT oWnd   := oWnd()

   oMenu := MenuBegin( .T. )

   for n := 1 to len( aMnuPrev )

      cText    := by( aMnuPrev[ n, 1 ] )
      bAction  := bMnuPrev( cText )

      MenuAddItem( cText,, .F.,, bAction,,,,,,, .F.,,, .F. )

   next

   MenuEnd()

   oMenu:Activate( oBtn:nBottom - 1, 0, oBtn )

Return nil

//---------------------------------------------------------------------------//

static function bMnuPrev( uValue )
return {|| ExcMnuPrev( uValue ) }

//---------------------------------------------------------------------------//

static function bMnuNext( uValue )
return {|| ExcMnuNext( uValue ) }

//---------------------------------------------------------------------------//

function Visor( aMsg )

   local oDlg
   local oBrwCon
   //local hBmp     := LoadBitmap( GetResources(), "BSTOP" )

   if len( aMsg ) == 0
      return .f.
   end if


   DEFINE DIALOG oDlg RESOURCE "VISOR"

   oBrwCon                        := TXBrowse():New( oDlg )

   oBrwCon:bClrSel                := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
   oBrwCon:bClrSelFocus           := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

   oBrwCon:SetArray( aMsg, , , .f. )

   oBrwCon:nMarqueeStyle          := 5
   oBrwCon:lRecordSelector        := .f.
   oBrwCon:lHScroll               := .f.
   oBrwCon:lHeader                := .f.

   oBrwCon:CreateFromResource( 100 )

   with object ( oBrwCon:AddCol() )
      :cHeader          := Space(1)
      :bStrData         := {|| Space(1) }
      :bEditValue       := {|| aMsg[ oBrwCon:nArrayAt, 1 ] }
      :nWidth           := 20
      :SetCheck( { "Cnt16", "Nil16" } )
   end with

   with object ( oBrwCon:AddCol() )
      :cHeader          := Space(1)
      :bStrData         := {|| aMsg[ oBrwCon:nArrayAt, 2 ] }
      :nWidth           := 300
   end with

   REDEFINE BUTTON ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   ( oDlg:end() )

	ACTIVATE DIALOG oDlg CENTER

RETURN NIL

//------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

FUNCTION aItmVentas()

   local aItmVta := {}

   aAdd( aItmVta, { { "CSERALB",    "CSERIE",      "CSERIE",      "CSERTIK" }, { "C", "C", "C", "C" },   1, 0, "Serie del documento" } )
   aAdd( aItmVta, { { "NNUMALB",    "NNUMFAC",     "NNUMFAC",     "CNUMTIK" }, { "N", "N", "N", "C" },   9, 0, "N�mero del documento" } )
   aAdd( aItmVta, { { "CSUFALB",    "CSUFFAC",     "CSUFFAC",     "CSUFTIK" }, { "C", "C", "C", "C" },   2, 0, "Sufijo del documento" } )
   aAdd( aItmVta, { { "CTURALB",    "CTURFAC",     "CTURFAC",     "CTURTIK" }, { "C", "C", "C", "C" },   6, 0, "Sesi�n del documento" } )
   aAdd( aItmVta, { { "DFECALB",    "DFECFAC",     "DFECFAC",     "DFECTIK" }, { "D", "D", "D", "D" },   8, 0, "Fecha del documento" } )
   aAdd( aItmVta, { { "CCODCLI",    "CCODCLI",     "CCODCLI",     "CCLITIK" }, { "C", "C", "C", "C" },  12, 0, "C�digo del cliente" } )
   aAdd( aItmVta, { { "CNOMCLI",    "CNOMCLI",     "CNOMCLI",     "CNOMTIK" }, { "C", "C", "C", "C" },  80, 0, "Nombre del cliente" } )
   aAdd( aItmVta, { { "CDIRCLI",    "CDIRCLI",     "CDIRCLI",     "CDIRCLI" }, { "C", "C", "C", "C" }, 100, 0, "Domicilio del cliente" } )
   aAdd( aItmVta, { { "CPOBCLI",    "CPOBCLI",     "CPOBCLI",     "CPOBCLI" }, { "C", "C", "C", "C" },  35, 0, "Poblaci�n del cliente" } )
   aAdd( aItmVta, { { "CPRVCLI",    "CPRVCLI",     "CPRVCLI",     "CPRVCLI" }, { "C", "C", "C", "C" },  20, 0, "Provincia del cliente" } )
   aAdd( aItmVta, { { "CPOSCLI",    "CPOSCLI",     "CPOSCLI",     "CPOSCLI" }, { "C", "C", "C", "C" },  15, 0, "C�digo postal del cliente" } )
   aAdd( aItmVta, { { "CDNICLI",    "CDNICLI",     "CDNICLI",     "CDNICLI" }, { "C", "C", "C", "C" },  15, 0, "DNI/CIF del cliente" } )
   aAdd( aItmVta, { { "CCODALM",    "CCODALM",     "CCODALM",     "CALMTIK" }, { "C", "C", "C", "C" },   3, 0, "C�digo del almac�n" } )
   aAdd( aItmVta, { { "CCODCAJ",    "CCODCAJ",     "CCODCAJ",     "CNCJTIK" }, { "C", "C", "C", "C" },   3, 0, "C�digo de la caja" } )
   aAdd( aItmVta, { { "CCODPAGO",   "CCODPAGO",    "CCODPAGO",    "CFPGTIK" }, { "C", "C", "C", "C" },   2, 0, "Forma de pago del documento" } )
   aAdd( aItmVta, { { "CCODOBR",    "CCODOBR",     "CCODOBR",     "CCODOBR" }, { "C", "C", "C", "C" },  10, 0, "Obra del documento" } )
   aAdd( aItmVta, { { "CCODTAR",    "CCODTAR",     "CCODTAR",     "CCODTAR" }, { "C", "C", "C", "C" },   5, 0, "C�digo de la tarifa" } )
   aAdd( aItmVta, { { "CCODRUT",    "CCODRUT",     "CCODRUT",     "CCODRUT" }, { "C", "C", "C", "C" },   4, 0, "C�digo de la ruta" } )
   aAdd( aItmVta, { { "CCODAGE",    "CCODAGE",     "CCODAGE",     "CCODAGE" }, { "C", "C", "C", "C" },   3, 0, "C�digo del agente" } )
   aAdd( aItmVta, { { "NPCTCOMAGE", "NPCTCOMAGE",  "NPCTCOMAGE",  "NCOMAGE" }, { "N", "N", "N", "" },    6, 2, "Comisi�n agente" } )
   aAdd( aItmVta, { { "NTARIFA",    "NTARIFA",     "NTARIFA",     "NTARIFA" }, { "N", "N", "N", "N" },   1, 0, "Tarifa del documento" } )
   aAdd( aItmVta, { { "NDTOESP",    "NDTOESP",     "NDTOESP",     "" },        { "N", "N", "N", "" },    6, 2, "Descuento general" } )
   aAdd( aItmVta, { { "NDPP",       "NDPP",        "NDPP",        "" },        { "N", "N", "N", "" },    6, 2, "Descuento por pronto pago" } )
   aAdd( aItmVta, { { "NDTOUNO",    "NDTOUNO",     "NDTOUNO",     "" },        { "N", "N", "N", "" },    6, 2, "Descuento definido 1" } )
   aAdd( aItmVta, { { "NDTODOS",    "NDTODOS",     "NDTODOS",     "" },        { "N", "N", "N", "" },    4, 1, "Descuento definido 2" } )
   aAdd( aItmVta, { { "LRECARGO",   "LRECARGO",    "LRECARGO",    "" },        { "L", "L", "L", "" },    1, 0, "L�gico de recargo" } )
   aAdd( aItmVta, { { "CDIVALB",    "CDIVFAC",     "CDIVFAC",     "CDIVTIK" }, { "C", "C", "C", "C" },   3, 0, "C�digo divisa" } )
   aAdd( aItmVta, { { "NVDVALB",    "NVDVFAC",     "NVDVFAC",     "NVDVTIK" }, { "N", "N", "N", "N" },  10, 4, "Valor divisa" } )
   aAdd( aItmVta, { { "CRETPOR",    "CRETPOR",     "CRETPOR",     "CRETPOR" }, { "C", "C", "C", "C" }, 100, 0, "Retirado por" } )
   aAdd( aItmVta, { { "CRETMAT",    "CRETMAT",     "CRETMAT",     "CRETMAT" }, { "C", "C", "C", "C" },  20, 0, "Matricula" } )
   aAdd( aItmVta, { { "LIVAINC",    "LIVAINC",     "LIVAINC",     "" },        { "L", "L", "L", "" },    1, 0, "L�gico IGIC incluido" } )
   aAdd( aItmVta, { { "NREGIVA",    "NREGIVA",     "NREGIVA",     "" },        { "N", "N", "N", "" },   20, 0, "R�gimen de " + cImp() } )
   aAdd( aItmVta, { { "CCODTRN",    "CCODTRN",     "CCODTRN",     "" },        { "C", "C", "C", "" },    9, 0, "C�digo del transportista" } )
   aAdd( aItmVta, { { "CCODUSR",    "CCODUSR",     "CCODUSR",     "CCCJTIK" }, { "C", "C", "C", "C" },   3, 0, "C�digo de usuario" } )
   aAdd( aItmVta, { { "DFECCRE",    "DFECCRE",     "DFECCRE",     "DFECCRE" }, { "D", "D", "D", "D" },   8, 0, "Fecha de creaci�n/modificaci�n" } )
   aAdd( aItmVta, { { "CTIMCRE",    "CTIMCRE",     "CTIMCRE",     "CTIMCRE" }, { "C", "C", "C", "C" },  20, 0, "Hora de creaci�n/modificaci�n" } )
   aAdd( aItmVta, { { "CCODGRP",    "CCODGRP",     "CCODGRP",     ""        }, { "C", "C", "C", "" },    4, 0, "Grupo de cliente" } )
   aAdd( aItmVta, { { "lImprimido", "lImprimido",  "lImprimido",  ""        }, { "L", "L", "L", "" },    1, 0, "L�gico de imprimido" } )
   aAdd( aItmVta, { { "dFecImp",    "dFecImp",     "dFecImp",     ""        }, { "D", "D", "D", "" },    8, 0, "Fecha �ltima impresi�n" } )
   aAdd( aItmVta, { { "cHorImp",    "cHorImp",     "cHorImp",     ""        }, { "C", "C", "C", "" },    5, 0, "Hora �ltima impresi�n" } )
   aAdd( aItmVta, { { "cCodDlg",    "cCodDlg",     "cCodDlg",     "cCodDlg" }, { "C", "C", "C", "C" },   2, 0, "C�digo delegaci�n" } )

RETURN ( aItmVta )

//----------------------------------------------------------------------------//

FUNCTION aItmCompras()

   local aItmCom := {}

   aAdd( aItmCom, { { "CSERALB",    "CSERFAC"   }, { "C", "C" },  1, 0, "Serie del documento" } )
   aAdd( aItmCom, { { "NNUMALB",    "NNUMFAC"   }, { "N", "N" },  9, 0, "N�mero del documento" } )
   aAdd( aItmCom, { { "CSUFALB",    "CSUFFAC"   }, { "C", "C" },  2, 0, "Sufijo del documento" } )
   aAdd( aItmCom, { { "CTURALB",    "CTURFAC"   }, { "C", "C" },  6, 0, "Sesi�n del documento" } )
   aAdd( aItmCom, { { "DFECALB",    "DFECFAC"   }, { "D", "D" },  8, 0, "Fecha del documento" } )
   aAdd( aItmCom, { { "CCODALM",    "CCODALM"   }, { "C", "C" },  3, 0, "C�digo del almac�n" } )
   aAdd( aItmCom, { { "CCODCAJ",    "CCODCAJ"   }, { "C", "C" },  3, 0, "C�digo de la caja" } )
   aAdd( aItmCom, { { "CCODPRV",    "CCODPRV"   }, { "C", "C" }, 12, 0, "C�digo del proveedor" } )
   aAdd( aItmCom, { { "CNOMPRV",    "CNOMPRV"   }, { "C", "C" }, 35, 0, "Nombre del proveedor" } )
   aAdd( aItmCom, { { "CDIRPRV",    "CDIRPRV"   }, { "C", "C" }, 35, 0, "Domicilio del proveedor" } )
   aAdd( aItmCom, { { "CPOBPRV",    "CPOBPRV"   }, { "C", "C" }, 25, 0, "Poblaci�n del proveedor" } )
   aAdd( aItmCom, { { "CPROPRV",    "CPROVPROV" }, { "C", "C" }, 20, 0, "Provincia del proveedor" } )
   aAdd( aItmCom, { { "CPOSPRV",    "CPOSPRV"   }, { "C", "C" },  5, 0, "C�digo postal del provedor" } )
   aAdd( aItmCom, { { "CDNIPRV",    "CDNIPRV"   }, { "C", "C" }, 30, 0, "DNI/CIF del proveedor" } )
   aAdd( aItmCom, { { "DFECENT",    "DFECENT"   }, { "D", "D" },  8, 0, "Fecha de entrada" } )
   aAdd( aItmCom, { { "CCODPGO",    "CCODPAGO"  }, { "C", "C" },  2, 0, "Forma de pago" } )
   aAdd( aItmCom, { { "NBULTOS",    "NBULTOS"   }, { "N", "N" },  3, 0, "N�mero de bultos" } )
   aAdd( aItmCom, { { "NPORTES",    "NPORTES"   }, { "N", "N" },  6, 0, "Valor de los portes" } )
   aAdd( aItmCom, { { "NDTOESP",    "NDTOESP"   }, { "N", "N" },  6, 2, "Descuento general" } )
   aAdd( aItmCom, { { "NDPP",       "NDPP"      }, { "N", "N" },  6, 2, "Descuento por pronto pago" } )
   aAdd( aItmCom, { { "LRECARGO",   "LRECARGO"  }, { "L", "L" },  1, 0, "L�gico de recargo" } )
   aAdd( aItmCom, { { "CCONDENT",   "CCONDENT"  }, { "C", "C" }, 20, 0, "Condici�n de entrada" } )
   aAdd( aItmCom, { { "CEXPED",     "CEXPED"    }, { "C", "C" }, 20, 0, "Expedici�n" } )
   aAdd( aItmCom, { { "COBSERV",    "COBSERV"   }, { "M", "M" }, 10, 0, "Observaciones" } )
   aAdd( aItmCom, { { "CDIVALB",    "CDIVFAC"   }, { "C", "C" },  3, 0, "C�digo de la divisa" } )
   aAdd( aItmCom, { { "NVDVALB",    "NVDVFAC"   }, { "N", "N" }, 10, 4, "Valor de la divisa" } )
   aAdd( aItmCom, { { "NDTOUNO",    "NDTOUNO"   }, { "N", "N" },  5, 2, "Descuento definido 1" } )
   aAdd( aItmCom, { { "NDTODOS",    "NDTODOS"   }, { "N", "N" },  5, 2, "Descuento definido 2" } )
   aAdd( aItmCom, { { "CCODUSR",    "CCODUSR"   }, { "C", "C" },  3, 0, "C�digo de usuario" } )
   aAdd( aItmCom, { { "LIMPRIMIDO", "LIMPRIMIDO"}, { "L", "L" },  1, 0, "L�gico de imprimido" } )
   aAdd( aItmCom, { { "DFECIMP",    "DFECIMP"   }, { "D", "D" },  8, 0, "Fecha de �ltima impresi�n" } )
   aAdd( aItmCom, { { "CHORIMP",    "CHORIMP"   }, { "C", "C" },  5, 0, "Hora �ltima impresi�n" } )
   aAdd( aItmCom, { { "DFECCHG",    "DFECCHG"   }, { "D", "D" },  8, 0, "Fecha creaci�n/modificaci�n" } )
   aAdd( aItmCom, { { "CTIMCHG",    "CTIMCHG"   }, { "C", "C" },  5, 0, "Hora creaci�n/modificaci�n" } )
   aAdd( aItmCom, { { "CCODDLG",    "CCODDLG"   }, { "C", "C" },  2, 0, "C�digo de la delegaci�n" } )

RETURN ( aItmCom )

//----------------------------------------------------------------------------//

Function aEmpresa( cEmp, dbfEmp, dbfDlg, dbfUser, lRptGal )

   local oBlock
   local oError
   local lEmpFnd     := .t.
   local lCloDlg     := .f.
   local lCloEmp     := .f.
   local lCloUsr     := .f.

   DEFAULT lRptGal   := .f.

   aDlgEmp           := {}

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if dbfEmp == nil
      USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmp ) )
      SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE
      lCloEmp   := .t.
   end if

   if dbfUser == nil
      USE ( cPatDat() + "USERS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "USERS", @dbfUser ) )
      SET ADSINDEX TO ( cPatDat() + "USERS.CDX" ) ADDITIVE
      lCloUsr  := .t.
   end if

   if dbfDlg == nil
      USE ( cPatDat() + "DELEGA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DELEGA", @dbfDlg ) )
      SET ADSINDEX TO ( cPatDat() + "DELEGA.CDX" ) ADDITIVE
      lCloDlg  := .t.
   end if

   //if ( dbfEmp )->( dbSeek( cEmp ) )
   if dbSeekInOrd( cEmp, "CodEmp", dbfEmp )

      aEmpresa    := dbScatter( dbfEmp )

      /*
      Configuraciones desde el usuario-----------------------------------------
      */

      if !lRptGal

         if Empty( oUser():cCaja() )
            oUser():cCaja( cCajUsr( ( dbfEmp )->cDefCaj ) )
         end if

         if Empty( oUser():cAlmacen() )
            oUser():cAlmacen( cAlmUsr( ( dbfEmp )->cDefAlm ) )
         end if

      end if

      /*
      Cargamos las delegaciones------------------------------------------------
      */

      if ( dbfDlg )->( dbSeek( cEmp ) )

         do while ( dbfDlg )->cCodEmp == cEmp .and. ( dbfDlg )->( !eof() )

            aAdd( aDlgEmp, ( dbfDlg )->cCodDlg )
            ( dbfDlg )->( dbSkip() )

         end while

      else

         aDlgEmp  := { "" }

      end if

   else

      lEmpFnd  := .f.

   end if

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lCloDlg
      CLOSE ( dbfDlg )
   end if

   if lCloUsr
      CLOSE ( dbfUser )
   end if

   if lCloEmp
      CLOSE ( dbfEmp )
   end if

RETURN ( lEmpFnd )

//---------------------------------------------------------------------------//

Function SetEmp( uVal, nPos )

   if nPos >= 0 .and. nPos <= len( aEmpresa )
      aEmpresa[ nPos ]  := uVal
   end if

 Return ( aEmpresa )

//---------------------------------------------------------------------------//

Function aRetDlgEmp() ; Return ( aDlgEmp )

//---------------------------------------------------------------------------//

Function cCodigoEmpresaEnUso( cCodEmp )

   if cCodEmp != nil
      cCodigoEmpresaEnUso  := cCodEmp
   end if

Return ( cCodigoEmpresaEnUso )

//---------------------------------------------------------------------------//

FUNCTION GetCodEmp( dbfEmp )

   local oBlock
   local oError
   local nRec
   local cCodEmp
   local lClose   := .f.

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   IF dbfEmp == NIL
      USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmp ) )
      SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE
      lClose      := .t.
	END IF

   nRec           := ( dbfEmp )->( RecNo() )
   cCodEmp        := ""

   ( dbfEmp )->( dbGoTop() )
   while !( dbfEmp )->( eof() )
      if ( dbfEmp )->lActiva
         cCodEmp  := ( dbfEmp )->CodEmp
      end if
      ( dbfEmp )->( dbSkip() )
   end while

   /*
   Quitamos la empresa actual--------------------------------------------------
   */

   if Empty( cCodEmp )
      ( dbfEmp )->( dbGoTop() )
      cCodEmp     := ( dbfEmp )->CodEmp
   end if

   ( dbfEmp )->( dbGoTo( nRec ) )

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfEmp )
   end if

Return ( cCodEmp )

//---------------------------------------------------------------------------//
/*
Funciones para crear las bases de datos de los favoritos de la galeria de
informenes; lo metemos aqui para que pueda actualizar ficheros
*/

Function mkReport( cPath, lAppend, cPathOld, oMeter )

   DEFAULT lAppend      := .f.

   IF oMeter != NIL
		oMeter:cText		:= "Generando Bases"
      sysRefresh()
	END IF

   CreateDbfReport( cPath )
   rxReport( cPath, oMeter )

   if lAppend .and. lIsDir( cPathOld )
      AppDbf( cPathOld, cPath, "CfgCar" )
   end if

   if lAppend .and. lIsDir( cPathOld )
      AppDbf( cPathOld, cPath, "CfgFav" )
   end if

Return .t.

//---------------------------------------------------------------------------//

Function rxReport( cPath, oMeter )

   local dbfFolder
   local dbfFavorito

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "CfgCar.Dbf" ) .or.;
      !lExistTable( cPath + "CfgFav.Dbf" )

      CreateDbfReport( cPath )

   end if

   fEraseIndex( cPath + "CFGCAR.CDX" )

   dbUseArea( .t., cDriver(), cPath + "CFGCAR.DBF", cCheckArea( "CFGCAR", @dbfFolder ), .f. )
   if !( dbfFolder )->( neterr() )
      ( dbfFolder )->( __dbPack() )

      ( dbfFolder )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfFolder )->( ordCreate( cPath + "CFGCAR.CDX", "CUSRNOM", "CCODUSR + CNOMBRE", {|| Field->CCODUSR + Field->CNOMBRE } ) )

      ( dbfFolder )->( dbCloseArea() )

   else

      msgStop( "Imposible abrir en modo exclusivo la tabla de configuraciones" )

   end if

   fEraseIndex( cPath + "CFGFAV.CDX" )

   dbUseArea( .t., cDriver(), cPath + "CFGFAV.DBF", cCheckArea( "CFGFAV", @dbfFavorito ), .f. )
   if !( dbfFavorito )->( neterr() )
      ( dbfFavorito )->( __dbPack() )

      ( dbfFavorito )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfFavorito )->( ordCreate( cPath + "CFGFAV.CDX", "CUSRFAV", "CCODUSR + CNOMFAV", {|| Field->CCODUSR + Field->CNOMFAV } ) )

      ( dbfFavorito )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfFavorito )->( ordCreate( cPath + "CFGFAV.CDX", "CUSRCAR", "CCODUSR + CCARPETA", {|| Field->CCODUSR + Field->CCARPETA } ) )

      ( dbfFavorito )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfFavorito )->( ordCreate( cPath + "CFGFAV.CDX", "CUSRRPT", "CCODUSR + CCARPETA + CNOMRPT", {|| Field->CCODUSR + Field->CCARPETA + Field->CNOMRPT } ) )

      ( dbfFavorito )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfFavorito )->( ordCreate( cPath + "CFGFAV.CDX", "CUSRCARFAV", "CCODUSR + CCARPETA + CNOMFAV", {|| Field->CCODUSR + Field->CCARPETA + Field->CNOMFAV } ) )

      ( dbfFavorito )->( dbCloseArea() )

   else

      msgStop( "Imposible abrir en modo exclusivo la tabla de configuraciones" )

   end if

Return nil

//---------------------------------------------------------------------------//

Function CreateDbfReport( cPath )

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "CFGCAR.DBF" )
      dbCreate( cPath + "CFGCAR.DBF", aSqlStruct( aItmDbfReport() ), cDriver() )
   end if

   if !lExistTable( cPath + "CFGFAV.DBF" )
      dbCreate( cPath + "CFGFAV.DBF", aSqlStruct( aItmDbfFavoritos() ), cDriver() )
   end if

Return nil

//---------------------------------------------------------------------------//

Function aItmDbfReport()

   local aBase := {}

   aAdd( aBase, { "cCodUsr",  "C",   3, 0, "C�digo de usuario" } )
   aAdd( aBase, { "cNombre",  "C", 100, 0, "Nombre de la carpeta" } )

Return ( aBase )

//---------------------------------------------------------------------------//

Function aItmDbfFavoritos()

   local aBase := {}

   aAdd( aBase, { "cCodUsr",  "C",   3, 0, "C�digo de usuario" } )
   aAdd( aBase, { "cCarpeta", "C", 100, 0, "Nombre de la carpeta" } )
   aAdd( aBase, { "cNomFav",  "C", 100, 0, "Descripci�n para favoritos" } )
   aAdd( aBase, { "cNomRpt",  "C", 100, 0, "Descripci�n original" } )

Return ( aBase )

//---------------------------------------------------------------------------//

Function lTactilMode()

Return ( "TCT" $ cParamsMain() )

//---------------------------------------------------------------------------//

Function lTpvMode()

Return ( "TPV" $ cParamsMain() )

//---------------------------------------------------------------------------//

Function GoogleMaps( cStreetTo, cCityTo, cCountryTo )

   local oDlg
   local oWebMap
   local oActiveX

   local oStreetFrom
   local cStreetFrom
   local oCityFrom
   local cCityFrom
   local oCountryFrom
   local cCountryFrom

   cStreetTo         := Padr( cStreetTo, 200 )
   cCityTo           := Padr( cCityTo, 200 )

   if Empty( cCountryTo )
      cCountryTo     := Padr( "Spain", 100 )
   end if

   cStreetFrom       := Space( 200 )
   cCityFrom         := Space( 200 )
   cCountryFrom      := Space( 100 )

   oWebMap           := WebMap():new()

   DEFINE DIALOG oDlg RESOURCE "GoogleMap"

   REDEFINE ACTIVEX oActiveX  ID 100   OF oDlg  PROGID "Shell.Explorer"

   REDEFINE GET oStreetFrom   VAR cStreetFrom   ON HELP  load( oStreetFrom, oCityFrom, oCountryFrom ) BITMAP "Office_16" ID 200 OF oDlg

   REDEFINE GET oCityFrom     VAR cCityFrom     ID 210   OF oDlg

   REDEFINE GET oCountryFrom  VAR cCountryFrom  ID 220   OF oDlg

   REDEFINE GET cStreetTo     ID 300   OF oDlg

   REDEFINE GET cCityTo       ID 310   OF oDlg

   REDEFINE GET cCountryTo    ID 320   OF oDlg

   REDEFINE BUTTON            ID 1     OF oDlg  ACTION ShowInWin( cStreetFrom, cCityFrom, cCountryFrom, cStreetTo, cCityTo, cCountryTo, oWebMap, oActiveX )

   REDEFINE BUTTON            ID 3     OF oDlg  ACTION ShowInExplorer( cStreetFrom, cCityFrom, cCountryFrom, cStreetTo, cCityTo, cCountryTo, oWebMap, oActiveX )

   ACTIVATE DIALOG oDlg CENTERED       ON INIT  ShowInWin( cStreetFrom, cCityFrom, cCountryFrom, cStreetTo, cCityTo, cCountryTo, oWebMap, oActiveX )

return nil

//---------------------------------------------------------------------------//

static function Load( oStreetFrom, oCityFrom, oCountryFrom )

   oStreetFrom:cText(   Padr( cDomEmp(), 200 ) )
   oCityFrom:cText(     Padr( Rtrim( cPobEmp() ) + Space( 1 ) + Rtrim( cPrvEmp() ), 200 ) )
   oCountryFrom:cText(  Padr( "Spain", 100 ) )

return nil

//---------------------------------------------------------------------------//

static function ShowInWin( cStreetFrom, cCityFrom, cCountryFrom, cStreetTo, cCityTo, cCountryTo, oWebMap, oActiveX )

   oWebMap:aAddress  := {}

   if !Empty( cStreetFrom )
      oWebMap:AddStopSep( cStreetFrom, cCityFrom, , , cCountryFrom )
   end if

   oWebMap:AddStopSep( cStreetTo, cCityTo, , , cCountryTo )

   oWebMap:GenLink()

   if !Empty( oWebMap:cLink )
      oActiveX:Do( "Navigate", oWebMap:cLink )
      sysrefresh()
   end if

return nil

//---------------------------------------------------------------------------//

static function ShowInExplorer( cStreetFrom, cCityFrom, cCountryFrom, cStreetTo, cCityTo, cCountryTo, oWebMap, oActiveX )

   oWebMap:aAddress  := {}

   if !Empty( cStreetFrom )
      oWebMap:AddStopSep( cStreetFrom, cCityFrom, , , cCountryFrom )
   end if

   oWebMap:AddStopSep( cStreetTo, cCityTo, , , cCountryTo )

   oWebMap:ShowMap()

return nil

//---------------------------------------------------------------------------//

Function cUnidadMedicion( cDbf, lParentesis )

   local cUnidad        := ""

   DEFAULT lParentesis  := .f.

   if !Empty( ( cDbf )->nMedUno )
      cUnidad           += AllTrim( Trans( ( cDbf )->nMedUno, MasUnd() ) )
   end if

   if !Empty( ( cDbf )->nMedDos )
      cUnidad           += " x "
      cUnidad           += AllTrim( Trans( ( cDbf )->nMedDos, MasUnd() ) )
   end if

   if !Empty( ( cDbf )->nMedTre )
      cUnidad           += " x "
      cUnidad           += AllTrim( Trans( ( cDbf )->nMedTre, MasUnd() ) )
   end if

   if lParentesis .and. !Empty( cUnidad )
      cUnidad           := "(" + cUnidad + ")"
   end if

Return ( cUnidad )

//---------------------------------------------------------------------------//

Function sErrorBlock( bBlock )

   nError++

   titulo( str( nError ) )
   logwrite( "suma control del errores 1:" + procname(1) + "2:" + procname(2) + str( nError ) )

Return ( ErrorBlock( {| oError | ApoloBreak( oError ) } ) )

Function rErrorBlock( oBlock )

   nError--

   titulo( str( nError ) )
   logwrite( "resta control del errores 1:" + procname(1) + "2:" + procname(2) + str( nError ) )

Return ( ErrorBlock( oBlock ) )

//---------------------------------------------------------------------------//

//---------------------------------------------------------------------------//

FUNCTION AppSql( cEmpDbf, cEmpSql, cFile )

   local oBlock
   local oError
   local dbfOld
	local dbfTmp
   local dbfDbf      := FullCurDir() + cEmpDbf + "\" + cFile + ".Dbf"
   local cdxDbf      := FullCurDir() + cEmpDbf + "\" + cFile + ".Cdx"
   local dbfSql      := cEmpSql + "\" + cFile + ".Dbf"
   local cdxSql      := cEmpSql + "\" + cFile + ".Cdx"

   if !File( dbfDbf )
      Return nil
   end if

   if !lExistTable( dbfSql )
      Return nil
   end if

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      // DBFCDX ------------------------------------------------------------------

      USE ( dbfDbf ) NEW VIA ( cLocalDriver() ) ALIAS ( cCheckArea( "OLD", @dbfOld ) )
      if File( cdxDbf )
         SET ADSINDEX TO ( cdxDbf ) ADDITIVE
      end if

      // SQLRDD ------------------------------------------------------------------

      USE ( dbfSql ) NEW VIA "SQLRDD" ALIAS ( cCheckArea( "TMP", @dbfTmp ) )
      if lExistIndex( cdxSql )
         SET ADSINDEX TO ( cdxSql ) ADDITIVE
      end if

      // Pasamos los datos---------------------------------------------------------

      // APPEND FROM ( dbfDbf ) VIA ( cLocalDriver() )

      while !( dbfOld )->( eof() )
         dbPass( dbfOld, dbfTmp, .t. )
         ( dbfOld )->( dbSkip() )
         sysRefresh()
      end while

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

	CLOSE ( dbfOld )
	CLOSE ( dbfTmp )

RETURN NIL

//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//

Function cSqlTableName( cTableName )

   if cTableName[2] == ":"
      cTableName  := SubStr( cTableName, 3 )
   endif

   cTableName     := StrTran( AllTrim( Lower( cTableName ) ), ".dbf", "_dbf" )
   cTableName     := StrTran( cTableName, ".ntx", "" )
   cTableName     := StrTran( cTableName, ".cdx", "" )
   cTableName     := StrTran( cTableName, "\", "_" )

   if cTableName[1] == "/"
      cTableName  := SubStr( cTableName, 2 )
   endif

   cTableName     := StrTran( cTableName, "/", "_" )
   cTableName     := StrTran( cTableName, ".", "_" )
   cTableName     := AllTrim( cTableName )

   if len( cTableName ) > 30
      cTableName  := SubStr( cTableName, len( cTableName ) - 30 + 1 )
   endif

Return ( cTableName )

//--------------------------------------------------------------------------//

Function PrinterPreferences( oGet )

   PrinterSetup()

   if !Empty( oGet )
      oGet:cText( PrnGetName() )
   end if

Return ( Nil )

//---------------------------------------------------------------------------//

function DateTimeRich( oRTF )

   local aLbx := REGetDateTime()
   local nLbx := 1
   local oDlg, oLbx

   DEFINE DIALOG oDlg RESOURCE "DateRich"

   REDEFINE LISTBOX oLbx VAR nLbx ITEMS aLbx ID 101 OF oDlg

   REDEFINE BUTTON ID 201 ACTION ( oDlg:End( IDOK ) )

   REDEFINE BUTTON ID 202 ACTION ( oDlg:End() )

   oDlg:AddFastKey( VK_F5, {|| oDlg:End( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK
      oRTF:InsertRTF( aLbx[ nLbx ] )
   endif

return nil

//---------------------------------------------------------------------------//

function FindRich( oRTF )

   local oDlg
   local oFind
   local cFind    := Space( 100 )
   local nDir     := 1
   local lCase    := .f.
   local lWord    := .t.

   DEFINE DIALOG oDlg RESOURCE "FindRich"

   REDEFINE GET oFind VAR cFind ID 101 OF oDlg UPDATE

   REDEFINE RADIO nDir ID 102, 103 OF oDlg

   REDEFINE CHECKBOX lCase ID 104 OF oDlg

   REDEFINE CHECKBOX lWord ID 105 OF oDlg

   REDEFINE BUTTON ID 201 ACTION ( oRTF:SetFocus(), oRTF:Find( AllTrim( cFind ), ( nDir == 1 ), lCase, lWord ) )

   REDEFINE BUTTON ID 202 ACTION ( oDlg:End() )

   oDlg:bStart := { || oDlg:SetFocus() }

   ACTIVATE DIALOG oDlg CENTER NOWAIT

return nil

//---------------------------------------------------------------------------//

Function ReportBackLine( oInf, nLines )

   DEFAULT nLines := 1

   if !Empty( oInf )
      oInf:BackLine( nLines )
   end if

Return ( "" )

//---------------------------------------------------------------------------//

Function SetBrwOpt( cName, cOption )

Return ( WritePProString( "browse", cName, cValToChar( cOption ), cPatEmp() + "Empresa.Ini" ) )

//---------------------------------------------------------------------------//

Function GetBrwOpt( cName )

Return ( GetPvProfInt( "browse", cName, 2, cPatEmp() + "Empresa.Ini" ) )

//---------------------------------------------------------------------------//

#else

//---------------------------------------------------------------------------//
/*
funciones para gst PDA
*/
//---------------------------------------------------------------------------//

Function cPatDat()

Return ( CurDir() + "\Datos\" )

//---------------------------------------------------------------------------//

Function cPatBmp()

Return ( CurDir() + "\Bmp\" )

//---------------------------------------------------------------------------//

Function cPatTmp()

Return ( CurDir() + "\Tmp\")

//---------------------------------------------------------------------------//

Function FullCurDir( lInvert )

   local cFullCurDir := CurDir() + "\"

   if IsTrue( lInvert )
      StrTran( cFullCurDir, "\", "/" )
   end if

Return ( cFullCurDir )

//---------------------------------------------------------------------------//

Function SetBrwOpt( cName, cOption )

Return ( "" )

//---------------------------------------------------------------------------//

Function GetBrwOpt( cName )

Return ( 2 )

//---------------------------------------------------------------------------//

#endif

//---------------------------------------------------------------------------//

Function cPatPc( cPath )

   if !Empty( cPath )
      cPathPC     := cPath
   end if

Return ( cPathPc )

//----------------------------------------------------------------------------//

/*
funciones tanto para gst PDA como para gst rotor
*/
//---------------------------------------------------------------------------//

Function cEmpUsr( cEmp )

   if cEmp != nil
      cEmpUsr  := cEmp
   end if

Return cEmpUsr

//---------------------------------------------------------------------------//

function lGrupoEmpresa( cCodEmp, dbfEmpresa )

   local oBlock
   local oError
   local lClose   := .f.
   local lGrupo   := .f.

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfEmpresa )
      USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmpresa ) )
      SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   if dbSeekInOrd( cCodEmp, "CodEmp", dbfEmpresa )
      lGrupo      := ( dbfEmpresa )->lGrupo
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfEmpresa )
   end if

return ( lGrupo )

//---------------------------------------------------------------------------//

function cCodigoGrupo( cCodEmp, dbfEmpresa )

   local nRec
   local oBlock
   local oError
   local lClose   := .f.
   local cGrupo   := ""

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfEmpresa )
      USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmpresa ) )
      SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE
      lClose      := .t.
   else
      nRec        := ( dbfEmpresa )->( Recno() )
   end if

   if dbSeekInOrd( cCodEmp, "CodEmp", dbfEmpresa )
      cGrupo      := ( dbfEmpresa )->cCodGrp
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfEmpresa )
   else
      ( dbfEmpresa )->( dbGoTo( nRec ) )
   end if

return ( cGrupo )

//---------------------------------------------------------------------------//

Function cItemsToReport( aItems )

   local aItem
   local cString  := ""

   for each aItem in aItems
      if !Empty( aItem[ 5 ] )
         cString  += aItem[ 1 ] + "=" + aItem[ 5 ] + ";"
      end if
   next

Return ( cString )

//---------------------------------------------------------------------------//

FUNCTION cObjectsToReport( oDbf )

   local oItem
   local cString  := ""

   for each oItem in oDbf:aTField

      if !Empty( oItem:cComment ) .and. !( oItem:lCalculate )
         cString  += oItem:cName + "=" + oItem:cComment + ";"
      end if

   next

Return ( cString )

//---------------------------------------------------------------------------//

FUNCTION aEmpGrp( cCodGrp, dbfEmp, lEmpresa )

   local nRec
   local nOrd
   local lClose            := .f.

   DEFAULT lEmpresa        := .f.

   if !Empty( cCodGrp )

      if Empty( dbfEmp )

         USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmp ) )
         SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE

         ( dbfEmp )->( OrdSetFocus( "cCodGrp" ) )

         lClose            := .t.

      else

         nOrd              := ( dbfEmp )->( OrdSetFocus( "cCodGrp" ) )
         nRec              := ( dbfEmp )->( Recno() )

      end if

      aEmpresasGrupo       := {}

      if lEmpresa

         aAdd( aEmpresasGrupo, cCodGrp )

      else

         if ( dbfEmp )->( dbSeek( cCodGrp ) )

            while ( dbfEmp )->cCodGrp == cCodGrp .and. !( dbfEmp )->( Eof() )

               aAdd( aEmpresasGrupo, ( dbfEmp )->CodEmp )

               ( dbfEmp )->( dbSkip() )

            end while

         end if

      end if

      if lClose

         CLOSE( dbfEmp )

      else

         ( dbfEmp )->( OrdSetFocus( nOrd ) )
         ( dbfEmp )->( dbGoTo( nRec ) )

      end if

   end if

Return ( aEmpresasGrupo )

//----------------------------------------------------------------------------//

FUNCTION cPatStk( cPath, lPath, lShort, lGrp )

   DEFAULT lPath  := .t.
   DEFAULT lShort := .f.
   DEFAULT lGrp   := .f.

   if lAds()
      Return ( cAdsUNC() + if( lGrp, "Grp", "Emp" ) + cPath + if( lPath, "\", "" ) )
   end if


   #ifdef __SQLLIB__
Return ( if( lGrp, "Grp", "Emp" ) + cPath + if( lPath, "\", "" ) )
   #else
Return ( if( !lShort, FullCurDir(), "" ) + if( lGrp, "Grp", "Emp" ) + cPath + if( lPath, "\", "" ) )
   #endif

//---------------------------------------------------------------------------//
/*
Devuelve la descripci�n de una line de factura
*/

FUNCTION Descrip( cFacCliL, cFacCliS )

   local nOrd
   local cKey
   local cReturn     := ""

   if !Empty( ( cFacCliL )->cDetalle )
      cReturn        := Rtrim( ( cFacCliL )->cDetalle )
   else
      cReturn        := Rtrim( ( cFacCliL )->mLngDes )
   end if

   if !Empty( cFacCliS )

      nOrd           := ( cFacCliL )->( OrdSetFocus( 1 ) )
      cKey           := ( cFacCliL )->( OrdKeyVal() ) + Str( ( cFacCliL )->nNumLin, 4 )

      cReturn        += SerialDescrip( cKey, cFacCliS )

      ( cFacCliL )->( OrdSetFocus( nOrd ) )

   end if

RETURN ( cReturn )

//---------------------------------------------------------------------------//

Function SerialDescrip( cKey, cFacCliS )

   local nOrd
   local nInc
   local nLast
   local cLast
   local nPrior
   local cPrior
   local cReturn           := ""

   nInc                    := 0
   nOrd                    := ( cFacCliS )->( OrdSetFocus( 1 ) )

   if ( cFacCliS )->( dbSeek( cKey ) )

      while ( ( cFacCliS )->( ordKeyVal() ) == cKey .and. !( cFacCliS )->( eof() ) )

         if Empty( nPrior )
            nInc           := 0
            cPrior         := ( cFacCliS )->cNumSer
            nPrior         := SpecialVal( ( cFacCliS )->cNumSer )
         else
            nInc++
         end if

         if !Empty( nPrior ) .and. ( nInc != 0 )

            if ( SpecialVal( ( cFacCliS )->cNumSer ) == nPrior + nInc )

               cLast       := ( cFacCliS )->cNumSer
               nLast       := SpecialVal( ( cFacCliS )->cNumSer )

            else

               cReturn     += Alltrim( cPrior )    // cReturn     += Alltrim( Str( nPrior ) )

               if !Empty( nLast )
                  cReturn  += "-"
                  cReturn  += Alltrim( cLast )     // Alltrim( Str( nLast ) )
               end if

               cReturn     += ","

               nInc        := 0
               nLast       := nil
               cPrior      := ( cFacCliS )->cNumSer
               nPrior      := SpecialVal( ( cFacCliS )->cNumSer )

            end if

         end if

         ( cFacCliS )->( dbSkip() )

      end while

      if !Empty( nPrior )
         cReturn           += Alltrim( cPrior )    // Alltrim( Str( nPrior ) )
      end if

      if !Empty( nLast )
         cReturn           += "-"
         cReturn           += Alltrim( cLast )     // Alltrim( Str( nLast ) )
      end if

      cReturn              := Space( 1 ) + "[" + cReturn + "]"

   end if

   ( cFacCliS )->( OrdSetFocus( nOrd ) )

Return ( cReturn )

//---------------------------------------------------------------------------//

FUNCTION AppDbf( cEmpOld, cEmpTmp, cFile, aStruct )

   local oBlock
   local oError
   local dbfOld
	local dbfTmp
   local dbfNamOld   := cEmpOld + cFile + ".Dbf"
   local dbfNamTmp   := cEmpTmp + cFile + ".Dbf"
   local cdxNamOld   := cEmpOld + cFile + ".Cdx"
   local cdxNamTmp   := cEmpTmp + cFile + ".Cdx"

   IF !File( dbfNamOld )
      MsgStop( "No existe : " + dbfNamOld )
      RETURN NIL
	END IF

   IF !File( dbfNamTmp )
      MsgStop( "No existe : " + dbfNamTmp )
      RETURN NIL
	END IF

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( dbfNamOld ) NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "OLD", @dbfOld ) ) EXCLUSIVE
   if File( cdxNamOld )
      SET ADSINDEX TO ( cdxNamOld ) ADDITIVE
   end if

   USE ( dbfNamTmp ) NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "TMP", @dbfTmp ) ) EXCLUSIVE
   if File( cdxNamTmp )
      SET ADSINDEX TO ( cdxNamTmp ) ADDITIVE
   end if

   if !Empty( aStruct )

      while !( dbfOld )->( eof() )
         dbAppendDefault( dbfOld, dbfTmp, aStruct )
         ( dbfOld )->( dbSkip() )
      end while

   else

      while !( dbfOld )->( eof() )
         dbPass( dbfOld, dbfTmp, .t. )
         ( dbfOld )->( dbSkip() )
      end while

   end if

   RECOVER USING oError

      msgStop( "Error en el trasbase de registros " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

	CLOSE ( dbfOld )
	CLOSE ( dbfTmp )

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION cPatGrp( cPath, lFull, lEmpresa )

   DEFAULT lFull     := .f.
   DEFAULT lEmpresa  := .t.

   if !Empty( cPath )

      if lEmpresa
         cPatGrp     := "Emp" + cPath
      else
         cPatGrp     := "Grp" + cPath
      end if

   end if

   if lAds()
      Return ( cAdsUNC() + cPatGrp + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatGrp + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatGrp )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatGrp + "\" )
   end if

#ifdef __SQLLIB__
Return ( cPatGrp + "\" )
#else
Return ( if( lFull, FullCurDir(), "" ) + cPatGrp + "\" )
#endif

//---------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION cPatCli( cPath, lFull, lEmpresa )

   DEFAULT lFull     := .f.
   DEFAULT lEmpresa  := .t.

   if !Empty( cPath )
      if lEmpresa
         cPatCli     := "Emp" + cPath
      else
         cPatCli     := "Grp" + cPath
      end if
   end if

   if lAds()
      Return ( cAdsUNC() + cPatCli + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatCli + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatCli )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatCli + "\" )
   end if

Return ( if( lFull, FullCurDir(), "" ) + cPatCli + "\" )

#else

FUNCTION cPatCli(); Return ( cPatGrp() )

#endif

//---------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION cPatArt( cPath, lFull, lEmpresa )

   DEFAULT lFull     := .f.
   DEFAULT lEmpresa  := .t.

   if !Empty( cPath )

      if lEmpresa
         cPatArt     := "Emp" + cPath
      else
         cPatArt     := "Grp" + cPath
      end if

   end if

   if lAds()
      Return ( cAdsUNC() + cPatArt + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatArt + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatArt )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatArt + "\" )
   end if

Return ( if( lFull, FullCurDir(), "" ) + cPatArt + "\" )

#else

FUNCTION cPatArt(); Return ( cPatGrp() )

#endif

//---------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION cPatPrv( cPath, lFull, lEmpresa )

   DEFAULT lFull     := .f.
   DEFAULT lEmpresa  := .t.

   if !Empty( cPath )

      if lEmpresa
         cPatPrv     := "Emp" + cPath
      else
         cPatPrv     := "Grp" + cPath
      end if

   end if

   if lAds()
      Return ( cAdsUNC() + cPatPrv + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatPrv + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatPrv )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatPrv + "\" )
   end if

#ifdef __SQLLIB__
   Return ( cPatPrv + "\" )
#else
   Return ( if( !lFull, FullCurDir(), "" ) + cPatPrv + "\" )
#endif

//---------------------------------------------------------------------------//

#else

FUNCTION cPatPrv(); Return ( cPatGrp() )

//---------------------------------------------------------------------------//

#endif

#ifndef __PDA__

FUNCTION cPatAlm( cPath, lFull, lEmpresa )

   DEFAULT lFull     := .f.
   DEFAULT lEmpresa  := .t.

   if !Empty( cPath )

      if lEmpresa
         cPatAlm     := "Emp" + cPath
      else
         cPatAlm     := "Grp" + cPath
      end if

   end if

   if lAds()
      Return ( cAdsUNC() + cPatAlm + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatAlm + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatAlm )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatAlm + "\" )
   end if

#ifdef __SQLLIB__
Return ( cPatAlm + "\" )
#else
Return ( if( lFull, FullCurDir(), "" ) + cPatAlm + "\" )
#endif

//---------------------------------------------------------------------------//

#else

FUNCTION cPatAlm(); Return ( cPatGrp() )

//---------------------------------------------------------------------------//

#endif

Function GetSysDate()

Return ( if( dSysDate != nil, dSysDate, Date() ) )

//---------------------------------------------------------------------------//

Function aEmp() ; Return ( aEmpresa )

//---------------------------------------------------------------------------//

FUNCTION cPatEmp( cPath, lFull )

   DEFAULT cPath  := ""
   DEFAULT lFull  := .f.

   if !Empty( cPath )
      cPatEmp     := "Emp" + cPath
   end if

   if lAds()
      Return ( cAdsUNC() + cPatEmp + "\" )
   end if

   if lAIS() .and. lFull
      Return ( cAdsUNC() + cPatEmp + "\" )
   end if

   if lAIS() .and. !lFull
      Return ( cPatEmp )
   end if

   if lCdx()
      Return ( FullCurDir() + cPatEmp + "\" )
   end if

#ifdef __SQLLIB__
Return ( cPatEmp + "\" )
#else
Return ( if( lFull, FullCurDir(), "" ) + cPatEmp + "\" )
#endif

//---------------------------------------------------------------------------//

Function IsMuebles()

#ifndef __PDA__
   Return ( "MUEBLES" $ cParamsMain() )
#else
   Return .f.
#endif

//---------------------------------------------------------------------------//

FUNCTION ChmHelp( cTema )

RETURN WinExec( ( "HH " + cPatHelp() + "HELP.CHM::/" + AllTrim( cTema ) + ".HTM" ) )

//----------------------------------------------------------------------------//

Function cPatHelp()

Return ( FullCurDir() + "Help\" )

//----------------------------------------------------------------------------//

Function HtmlHelp()

Return ( "" )

//---------------------------------------------------------------------------//

function lUsrMaster()

return ( cCurUsr() == "000" )

//---------------------------------------------------------------------------//

Function IsPda()

Return ( "PDA" $ cParamsMain() )

//---------------------------------------------------------------------------//

Function cPatSnd( lShort )

   DEFAULT lShort := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Snd\" )

//----------------------------------------------------------------------------//

Function cEmpTmp( lPath, lShort )

   DEFAULT lPath  := .t.
   DEFAULT lShort := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "EmpTmp" + if( lPath, "\", "" ) )

//----------------------------------------------------------------------------//

Function cPatUsr()

Return ( FullCurDir() + "Usr\" )

//----------------------------------------------------------------------------//

Function cImp()

   local cImp  := uFieldEmpresa( "cNomImp" )

   if !IsChar( cImp )
      cImp     := ""
   end if

Return ( cImp )

//----------------------------------------------------------------------------//

Function addMnuNext( cName, uAction )

   if aScan( aMnuNext, {|c| c[1] == cName } ) == 0
      if valtype( uAction ) == "C"
         aAdd( aMnuNext, { cName, &( "{||" + uAction + "() }" ) } )
      else
         aAdd( aMnuNext, { cName, uAction } )
      end if
   end if

Return .t.

//---------------------------------------------------------------------------//

function cValToChar( uVal )

   local cType := ValType( uVal )

   do case
      case cType == "C" .or. cType == "M"
           return uVal

      case cType == "D"
           return DToC( uVal )

      case cType == "L"
           return If( uVal, ".T.", ".F." )

      case cType == "N"
           return AllTrim( Str( uVal ) )

      case cType == "B"
           return "{|| ... }"

      case cType == "A"
           return "{ ... }"

      case cType == "O"
           return "Object"

      otherwise
           return ""
   endcase

return nil

//---------------------------------------------------------------------------//

function cValToText( uVal, lBarraFecha )

   local cType             := ValType( uVal )

   DEFAULT lBarraFecha     := .f.

   do case
      case cType == "C" .or. cType == "M"
           return uVal

      case cType == "D"
           if lBarraFecha
               return DToC( uVal )
           else
               return StrTran( DToC( uVal ), "/", "" )
           end if

      case cType == "L"
           return If( uVal, "S", "N" )

      case cType == "N"
           return AllTrim( Str( uVal ) )

      case cType == "B"
           return "{|| ... }"

      case cType == "A"
           return "{ ... }"

      case cType == "O"
           return "Object"

      otherwise
           return ""
   endcase

return nil

//---------------------------------------------------------------------------//

function dToIso( dDate )

   local cDate := ""

   if Valtype( dDate ) != "D"
      dDate    := Date()
   endif

   cDate       := Alltrim( Str( Year( dDate ) ) + "-" + StrZero( Month( dDate ), 2 ) + "-" + StrZero( Day( dDate ), 2 ) )

return ( cDate )

//---------------------------------------------------------------------------//

Function LogWrite( cText, cFileName )

   local nHand

   DEFAULT cFileName := "Trace.Log"

   if !Empty( cText )

      if !File( cFileName )
         nHand := fCreate( cFileName )
      else
        nHand  := fOpen( cFileName, 1 )
      endif

      fSeek( nHand, 0 , 2 )


      #ifndef __PDA__
         fWrite( nHand, Time() + '-' + Trans( Seconds(), "999999.9999" ) + Space( 1 ) )
      #endif

      fWrite( nHand, cValToChar( cText ) + CRLF )
      fClose( nHand )

   end if

RETURN NIL

//---------------------------------------------------------------------------//

#ifdef __908__

FUNCTION CtrlConnection( cIp )

   	local oDlg
   	local oBmp
      local pConn
   	local oBrush
   	local lRetry	:= .t.

	cIp	  			:= Padr( cIp, 100 )

   	while lRetry

   	pConn          	:= Net_OpenConnection( Alltrim( cIP ), 2813 )

	if Empty( pConn )

   		DEFINE BRUSH oBrush COLOR Rgb( 255, 255, 255 )

   		DEFINE DIALOG oDlg RESOURCE "InitConnect" BRUSH oBrush

   		REDEFINE BITMAP oBmp ;
      		RESOURCE "Lock_48" ;
      		ID       600;
      		OF       oDlg

	   	REDEFINE GET cIp ;
	   		ID       110 ;
      		COLOR    Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) ;
      		OF       oDlg

         REDEFINE SAY COLOR Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) ID 120 OF oDlg

   		REDEFINE SAY COLOR Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) ID 130 OF oDlg

         TWebBtn():Redefine( 200,,,,, {|| goWeb( __GSTWEB__  ) }, oDlg,,,,, "LEFT",,,,, ( 255 * 65536 ), ( 255 * 65536 ) ):SetTransparent()

   		REDEFINE BUTTON ;
      		ID       IDOK ;
      		OF       oDlg ;
      		ACTION   ( oDlg:End( IDOK ) )

   		REDEFINE BUTTON ;
      		ID       IDCANCEL ;
      		OF       oDlg ;
      		ACTION   ( lRetry := .f., oDlg:End() )

   		ACTIVATE DIALOG oDlg CENTER

	   oBmp:end()
   	   oBrush:end()

		if oDlg:nResult != IDOK
			return .f.
		end if

	else

		lRetry		:= .f.

	end if

   	end while

return .t.

#endif

//---------------------------------------------------------------------------//

//----------------------------------------------------------------------------//

CLASS ApoloBtnBmp FROM TBtnBmp

   METHOD aGrad INLINE Eval( If( ::bClrGrad == nil, ::oWnd:bClrGrad, ::bClrGrad ), ( ::lMOver .or. ::lBtnDown ) )

ENDCLASS

//----------------------------------------------------------------------------//

FUNCTION PicOut()

   if Empty( cDefPicOut )
      cDefPicOut  := cPorDiv( cDivEmp() )
   end if

RETURN ( cDefPicOut )

//---------------------------------------------------------------------------//

FUNCTION cUsrTik( cCodUsr )

   if !Empty( cCodUsr )
      cUsrTik     := cCodUsr
   end if

Return cUsrTik

//---------------------------------------------------------------------------//

FUNCTION cDelUsrTik( cCodUsr )

   cUsrTik     := Space(3)

Return .t.

//---------------------------------------------------------------------------//

FUNCTION nAjuste( nNumber, cAdjust )

   local n
   local cNumber
   local cResult

   cResult           := ""
   cNumber           := Trans( nNumber, cPorDiv() )

   if IsNum( cAdjust )
      cAdjust        := Trans( cAdjust, cPorDiv() )
   else
      cAdjust        := Alltrim( cAdjust )
   end if

   cAdjust           := Padl( cAdjust, len( cNumber ), Space( 1 ) )

   for n := 1 to len( cNumber )
      if ( cAdjust[ n ] == Space( 1 ) .or. cAdjust[ n ] == "#" )
         cResult     += cNumber[ n ]
      else
         cResult     += cAdjust[ n ]
      end if
   next

   nNumber           := Val( StrTran( cResult, ",", "." ) )

RETURN ( nNumber )

//---------------------------------------------------------------------------//

/*Function cPatIn( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "In\" )*/

//----------------------------------------------------------------------------//

#ifndef __PDA__

Function cPatLog( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, FullCurDir(), "" ) + "Log\" )

#else

//---------------------------------------------------------------------------//

Function cPatLog( lShort )

   DEFAULT lShort  := .f.

Return ( if( !lShort, AllTrim( cNombrePC() ), "" ) + "Log\" )

#endif

//----------------------------------------------------------------------------//

Function cCodigoEmpresa( xValue )

   if !Empty( xValue )
      cCodEmp     := xValue
   end if

Return ( cCodEmp )

//--------------------------------------------------------------------------//

#ifndef __PDA__

PROCEDURE xmlIterator( cFileName, cNode, cAttrib, cValue, cData )

   LOCAL hFile, cXml
   LOCAL oDoc, oNode, oIter, lFind
   LOCAL cText    := ""

   SET EXACT OFF

   CLS

   cText          += "X H A R B O U R - XML ITERATOR test "

   IF cFileName == NIL
      cFileName := "xmltest.xml"
   ENDIF

   // this can happen if I call xmltest filename "" cdata
   IF ValType( cNode ) == "C" .and. Len( cNode ) == 0
      cNode := NIL
   ENDIF

   // this can happen if I call xmltest filename "" cdata
   IF ValType( cAttrib ) == "C" .and. Len( cAttrib ) == 0
      cAttrib := NIL
   ENDIF

   // this can happen if I call xmltest filename "" cdata
   IF ValType( cValue ) == "C" .and. Len( cValue ) == 0
      cValue := NIL
   ENDIF

   cText          +=  "Processing file " + cFileName + "..." + CRLF

   oDoc := TXmlDocument():New( cFileName )

   IF oDoc:nStatus != HBXML_STATUS_OK
      cText       +=  "Error While Processing File: "+cFileName
      cText       +=  "On Line: " + AllTrim( Str( oDoc:nLine ) )
      cText       +=  "Error: " + oDoc:ErrorMsg
      cText       +=  "Program Terminating, press any key"
      RETURN
   ENDIF

   lFind := ( cNode != NIL .or. cAttrib != NIL .or. cValue != NIL .or. cData != NIL )

   cText          += "Navigating all nodes with a base iterator" + CRLF

   oNode := oDoc:CurNode

if ! lFind

   DO WHILE oNode != NIL
      cXml := oNode:Path()
      IF cXml == NIL
         cXml :=  "(Node without path)"
      ENDIF

      cText       += Alltrim( Str( oNode:nType ) ) + ", " + cValToChar( oNode:cName ) + ", " + ValToPrg( oNode:aAttributes ) + ", " + cValToChar( oNode:cData ) + ": " + cValToChar( cXml ) + CRLF

      oNode       := oDoc:Next()
   ENDDO

else
      cText       += "Iterator - Navigating all nodes" +  cValToChar( cNode ) +  "," + cValToChar( cAttrib ) + "=" + cValToChar( cValue ) + " with data having " + cValToChar( cData ) + CRLF

      oIter := TXmlIterator():New( oDoc:oRoot )
      oIter:lRegex := .t.

      IF cNode != NIL
         cNode := HB_RegexComp( cNode )
      ENDIF

      IF cAttrib != NIL
         cAttrib := HB_RegexComp( cAttrib )
      ENDIF

      IF cValue != NIL
         cValue := HB_RegexComp( cValue )
      ENDIF

      IF cData != NIL
         cData := HB_RegexComp( cData )
      ENDIF

      oNode := oIter:Find( cNode, cAttrib, cValue, cData )

      WHILE oNode != NIL
         cText    += "Found node " + oNode:Path() + ValToPrg( oNode:ToArray() ) + CRLF
         oNode    := oIter:FindNext()
      ENDDO

endif

   cText          += "Terminated. Press any key to continue"


RETURN

#endif

//---------------------------------------------------------------------------//

Function lBancas()

Return ( "BANCAS" $ cParamsMain() )

//---------------------------------------------------------------------------//

function GetOleObject( cApp )

   local oObj

   TRY
      oObj  := GetActiveObject( cApp )
   CATCH
      TRY
         oObj  := CreateObject( cApp )
      CATCH
      END
   END

return oObj

//----------------------------------------------------------------------------//

function WinWordObj()

   local lInstalled
   local oWord

   if !( lInstalled == .f. )
      lInstalled  := ( ( oWord := GetOleObject( "Word.Application" ) ) != nil )
   endif

return oWord

//----------------------------------------------------------------------------//

function ExcelObj()

   local lInstalled
   local oExcel

   if !( lInstalled == .f. )
      lInstalled  := ( ( oExcel := GetOleObject( "Excel.Application" ) ) != nil )
   endif

return oExcel

//----------------------------------------------------------------------------//

function SunCalcObj()

   local lInstalled
   local oCalc

   if !( lInstalled == .f. )
      lInstalled  := ( ( oCalc := GetOleObject( "com.sun.star.ServiceManager" ) ) != nil )
   endif

return oCalc

//----------------------------------------------------------------------------//

function GetExcelRange( cBook, cSheet, acRange )

   local oExcel, oBook, oSheet, oRange

   if ( oExcel := ExcelObj() ) != nil
      if ( oBook := GetExcelBook( cBook ) ) != nil
         TRY
            oSheet   := oBook:WorkSheets( cSheet )
            if ValType( acRange ) == 'A'
               oRange   := oSheet:Range( oSheet:Cells( acRange[ 1 ], acRange[ 2 ] ), ;
                                         oSheet:Cells( acRange[ 3 ], acRange[ 4 ] ) )
            else
               oRange   := oSheet:Range( acRange )
            endif
         CATCH
         END
      endif
   endif

return oRange

//----------------------------------------------------------------------------//

function GetExcelBook( cBook )

   local oExcel, oBook
   local c, n, nBooks

   cBook := Upper( cFilePath( cBook ) + cFileNoExt( cBook ) )
   if ( oExcel := ExcelObj() ) != nil
      nBooks   := oExcel:WorkBooks:Count()
      for n := 1 to nBooks
         c  := oExcel:WorkBooks( n ):FullName
         if cBook == Upper( cFilePath( c ) + cFileNoExt( c ) )
            return oExcel:WorkBooks( n )
         endif
      next n
      TRY
         oBook := oExcel:WorkBooks:Open( cBook )
      CATCH
      END
   endif

return oBook

//----------------------------------------------------------------------------//

Function SpecialVal( cNumber )

   local cChar
   local cResult  := ""

   cNumber        := Alltrim( cNumber )

   for each cChar in cNumber
      if Str( Val( cChar ) ) == cChar
         cResult  += cChar
      end if
   next

Return ( Val( cResult ) )

//----------------------------------------------------------------------------//

Function ApoloMsgNoYes( cText, cTitle, lTactil )

   local oDlg
   local oBmp
   local oBtnOk
   local oBtnCancel

   DEFAULT cText              := "�Desea eliminar el registro en curso?"
   DEFAULT cTitle             := "Confirme supresi�n."
   DEFAULT lTactil            := .f.

   if lTactil
      DEFINE DIALOG oDlg RESOURCE "DeleteRecnoTct" TITLE ( cTitle )
   else
      DEFINE DIALOG oDlg RESOURCE "DeleteRecno" TITLE ( cTitle )
   end if

   REDEFINE BITMAP oBmp       ID 500         OF oDlg RESOURCE "Symbol_questionmark_48_Alpha" TRANSPARENT

   REDEFINE SAY PROMPT cText  ID 100         OF oDlg

   REDEFINE BUTTON oBtnOk     ID IDOK        OF oDlg ACTION ( oDlg:end( IDOK ) )

   REDEFINE BUTTON oBtnCancel ID IDCANCEL    OF oDlg ACTION ( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   if !Empty( oBmp )
      oBmp:End()
   end if

RETURN ( oDlg:nResult == IDOK )

//----------------------------------------------------------------------------//

Function ApoloWaitSeconds( nSecs )

   local n

   for n := 1 to nSecs
      WaitSeconds( 1 )
      SysRefresh()
   next

return nil

//----------------------------------------------------------------------------//

Function ApoloDescend( uParam )

Return ( Descend( uParam ) )

//----------------------------------------------------------------------------//

Function CreateFastReport()

   if Empty( oFastReport )

      oFastReport    := frReportManager():new()

      oFastReport:LoadLangRes( "Spanish.Xml" )
      oFastReport:SetIcon( 1 )

   end if

Return ( oFastReport )

//----------------------------------------------------------------------------//

Function DestroyFastReport()

   if Empty( oFastReport )
      oFastReport:DestroyFR()
   end if

Return ( nil )

//----------------------------------------------------------------------------//


/*------------------------------------------------------------------------------
Pasa del formato RGB al format RGB Hexadecimal  #000000-------------------------
------------------------------------------------------------------------------*/

function RgbToRgbHex( nColorRgb )

   local cRgbHex  := ""

   cRgbHex        += "#"
   cRgbHex        += NumToHex( nRgbRed( nColorRgb ), 2 )
   cRgbHex        += NumToHex( nRgbGreen( nColorRgb ), 2 )
   cRgbHex        += NumToHex( nRgbBlue( nColorRgb ), 2 )

return cRgbHex

//----------------------------------------------------------------------------//

function InfoStack()

   local i
   local cStack

   i              := 2
   cStack         := ""

   while !Empty( ProcName( i ) )
      cStack      += "Llamado desde " + Trim( ProcName( i ) ) + "(" + LTrim( Str( ProcLine( i ) ) ) + ")" + CRLF
      i++
   enddo

   MsgInfo( cStack )

return nil

//----------------------------------------------------------------------------//
/*
#pragma BEGINDUMP

#define STRICT
#include <windows.h>
#include <algorithm>
using std::min;
using std::max;
#include <gdiplus.h>
#include "hbapi.h"

using namespace Gdiplus;

static  GdiplusStartupInput gdiplusStartupInput;
static  ULONG_PTR gdiplusToken;

LPSTR WideToAnsi( BSTR wString )
  {
     char *cString;
     int nConvertedLen = WideCharToMultiByte( CP_ACP, 0, wString, -1, NULL, 0, NULL, NULL );

     if( nConvertedLen )
     {
        cString = (char *) hb_xgrab( nConvertedLen );
        WideCharToMultiByte( CP_ACP, 0, wString, -1, cString, nConvertedLen, NULL, NULL );
     }
     else
     {
        cString = (char *) hb_xgrab( 1 );
        cString[0] = '\0';
     }

     //wprintf( L"\nWide: '%s'\n", wString );
     //printf( "\nAnsi: '%s'\n", cString );

     return cString;
  }

   LPWSTR AnsiToWide( LPSTR cAnsi )
   {
      WORD wLen;
      LPWSTR cString;

      wLen  = MultiByteToWideChar( CP_ACP, MB_PRECOMPOSED, cAnsi, -1, 0, 0 );

      cString = (LPWSTR) hb_xgrab( wLen * 2 );
      MultiByteToWideChar( CP_ACP, MB_PRECOMPOSED, cAnsi, -1, cString, wLen );

      return ( cString );
   }

HB_FUNC( GDIPLUSSTARTUP )
{

    GdiplusStartup(&gdiplusToken, &gdiplusStartupInput, NULL);
    hb_retni( (int) gdiplusToken );

}

HB_FUNC( GDIPLUSSHUTDOWN )
{
    GdiplusShutdown(gdiplusToken);
    hb_ret();
}

HB_FUNC( PRUEBA )
{
  HDC hdc = (HDC) hb_parnl( 1 );

   Graphics graphics(hdc);
   Pen pen(Color(255, 0, 0, 255));

   Matrix matrix;
   matrix.Rotate(30.0f);                                 // first a rotation
   matrix.Translate(150.0f, 100.0f, MatrixOrderAppend);  // then a translation

   graphics.SetTransform(&matrix);

   // Draw a tramsformed ellipse. The composite transformation
   // is rotate 30 degrees, then translate 150 right and 100 down.
   graphics.DrawEllipse(&pen, -40, -20, 80, 40);

   // Draw rotated axes with the origin at the center of the ellipse.
   graphics.DrawLine(&pen, -50, 0, 50, 0);
   graphics.DrawLine(&pen, 0, -50, 0, 50);

  hb_ret();
}

HB_FUNC( GRAPHICS )
{
   Graphics* pg = new Graphics( (HDC) hb_parnl( 1 ) );
   hb_retnl( (long) pg );
}

HB_FUNC( DELETEG )
{
   Graphics* p = (Graphics*) hb_parnl( 1 );
   delete p;
   hb_ret();
}

HB_FUNC( DRAWIMAGE )
{
   Graphics* g = (Graphics*) hb_parnl( 1 );
   Image* image = (Image*) hb_parnl( 2 );
   g->DrawImage(image, (REAL) hb_parni( 4 ), (REAL) hb_parni( 3 ), (REAL)hb_parni( 5 ),  (REAL)hb_parni( 6 ) );
}

HB_FUNC( DELETEP )
{
   Image* p = (Image*) hb_parnl( 1 );
   delete p;
   hb_ret();
}

HB_FUNC( IMAGE )
{
   WCHAR* cImage =  AnsiToWide( (LPSTR) hb_parc( 1 ) );
   //Image* i = new GdiPlus::Image(cImage, FALSE));
   Image* i = new Image(cImage, FALSE);
   hb_retnl( (long) i );
}

HB_FUNC( GDIPLOADIMAGEFROMFILE )
{
    Image* image;
    WCHAR* filename =  AnsiToWide( (LPSTR)hb_parc( 1 ));
    image = new Image( filename, FALSE );
    hb_retnl( (long) image );
}

#pragma ENDDUMP
*/
//----------------------------------------------------------------------------//





































/*
Function ADSRunSQL( cAlias, cSql, aParameters, hConnection, lShow )

   LOCAL cOldAlias  := Alias()
   LOCAL lCreate    := FALSE
   LOCAL nItem      := 0
   LOCAL xParameter

   DEFAULT hConnection := hConn
   DEFAULT lShow       := FALSE

   IF !Empty( cAlias ) .and. !Empty( cSql )

      cSql := StrTran( cSql, ";", "" )

      DBSelectArea( 0 )

      IF !AdsCreateSqlStatement( cAlias, ADS_CDX, hConnection )
         MsgAlert( "Error AdsCreateSqlStatement()" + FINL + "Error: " + cValtoChar( AdsGetLastError() ) )
      ELSE
         IF !HB_IsNil( aParameters ) .and. HB_IsArray( aParameters )
            FOR EACH xParameter IN aParameters
               nItem := HB_EnumIndex()
               cSql  := StrTran( cSql, "%" + AllTrim( Str( nItem ) ) , Var2Str( xParameter ) )
            NEXT
         ENDIF
         IF lShow
            MsgInfo( cSql, "SQLDebug")
         ENDIF
         IF !AdsExecuteSqlDirect( cSql )
            ( cAlias )->( DBCloseArea() )
            MsgAlert( "Error AdsExecuteSqlDirect( cSql )" + FINL + "Error:" + cValtoChar( AdsGetLastError() ) + FINL + cSql )
         ELSE
            lCreate := TRUE
         ENDIF
      ENDIF

      IF !Empty( cOldAlias )
         DBSelectArea( cOldAlias )
      ENDIF

   ENDIF

RETURN lCreate
*/