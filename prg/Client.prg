#ifndef __PDA__
   #include "FiveWin.Ch"
   #include "Report.ch"
   #include "Folder.ch"
   #include "Label.ch"
   #include "RichEdit.ch"
   #include "Xbrowse.ch"
   #include "FastRepH.ch"
#else
   #include "FWCE.ch"
   REQUEST DBFCDX
#endif
   #include "Factu.ch"
   #include "Ini.ch"

#define _COD                       1      //   C      7     0
#define _TITULO                    2      //   C     50     0
#define _NIF                       3      //   C     15     0
#define _DOMICILIO                 4      //   C     35     0
#define _POBLACION                 5      //   C     25     0
#define _PROVINCIA                 6      //   C     20     0
#define _CODPOSTAL                 7      //   C     15     0
#define _TELEFONO                  8      //   C     12     0
#define _FAX                       9      //   C     12     0
#define _MOVIL                    10      //   C     12     0
#define _NBREST                   11      //   C     35     0
#define _DIREST                   12      //   C     35     0
#define _DIAPAGO                  13      //   N      2     0
#define _DIAPAGO2                 14      //   N      2     0
#define _BANCO                    15      //   C     35     0
#define _DIRBANCO                 16      //   C     35     0
#define _POBBANCO                 17      //   C     25     0
#define _CPROBANCO                18      //   C     20     0
#define _CUENTA                   19      //   C     20     0
#define _NTIPCLI                  20
#define _CODPAGO                  21      //   C      2     0
#define _CDTOESP                  22      //   C     50     2
#define _NDTOESP                  23      //   N      5     2
#define _CDPP                     24      //   C     50     2
#define _NDPP                     25      //   N      5     2
#define _NDTOCNT                  26      //   N      5     2
#define _NDTORAP                  27      //   N      5     2
#define _CDTOUNO                  28      //   C     50     2
#define _CDTODOS                  29      //   C     50     2
#define _NDTOPTF                  30      //   N      5     2
#define _RIESGO                   31      //   N     10     0
#define _COPIASF                  32      //   N      1     0
#define _SERIE                    33      //   C      1     0
#define _NREGIVA                  34      //   L      1     0
#define _LREQ                     35      //   L      1     0
#define _SUBCTA                   36      //   C     12     0
#define _CTAVENTA                 37      //   C      3     0
#define _CAGENTE                  38      //   C      3     0
#define _LMAYORISTA               39      //   L      1     0
#define _NTARIFA                  40      //   N      1     0
#define _LLABEL                   41      //   L      1     0
#define _NLABEL                   42      //   N      5     0
#define _CCODTAR                  43      //   C      4     0
#define _MCOMENT                  44      //   M     10     0
#define _CCODRUT                  45      //   C      4     0
#define _CCODRUT2                 46      //   C      4     0
#define _CCODPAI                  47      //   C      4     0
#define _CCODGRP                  48      //   C      4     0
#define _CCODREM                  49      //   C      4     0
#define _CMEIINT                  50      //   C     65     0
#define _CWEBINT                  51      //   C     65     0
#define _LCHGPRE                  52      //   L      1     0
#define _LCRESOL                  53      //   L      1     0
#define _LPNTVER                  54      //   L      1     0
#define _CUSRDEF01                55      //   C     100    0
#define _CUSRDEF02                56      //   C     100    0
#define _CUSRDEF03                57      //   C     100    0
#define _CUSRDEF04                58      //   C     100    0
#define _CUSRDEF05                59      //   C     100    0
#define _CUSRDEF06                60      //   C     100    0
#define _CUSRDEF07                61      //   C     100    0
#define _CUSRDEF08                62      //   C     100    0
#define _CUSRDEF09                63      //   C     100    0
#define _CUSRDEF10                64      //   C     100    0
#define _LVISLUN                  65      //   L      1     0
#define _LVISMAR                  66      //   L      1     0
#define _LVISMIE                  67      //   L      1     0
#define _LVISJUE                  68      //   L      1     0
#define _LVISVIE                  69      //   L      1     0
#define _LVISSAB                  70      //   L      1     0
#define _LVISDOM                  71      //   L      1     0
#define _NVISLUN                  72      //   N      3     0
#define _NVISMAR                  73      //   N      3     0
#define _NVISMIE                  74      //   N      3     0
#define _NVISJUE                  75      //   N      3     0
#define _NVISVIE                  76      //   N      3     0
#define _NVISSAB                  77      //   N      3     0
#define _NVISDOM                  78      //   N      3     0
#define _CAGELUN                  79      //   N      3     0
#define _CAGEMAR                  80      //   N      3     0
#define _CAGEMIE                  81      //   N      3     0
#define _CAGEJUE                  82      //   N      3     0
#define _CAGEVIE                  83      //   N      3     0
#define _CAGESAB                  84      //   N      3     0
#define _CAGEDOM                  85      //   N      3     0
#define _LSNDINT                  86      //   L      1     0
#define _CPERCTO                  87      //   L      1     0
#define _CCODALM                  88      //   C      3     0
#define _NMESVAC                  89      //   N      2     0
#define _NIMPRIE                  90      //   N     16     6
#define _NCOLOR                   91      //   N     16     6
#define _SUBCTADTO                92      //   C     12     0
#define _LBLQCLI                  93      //   L      1     0
#define _LMOSCOM                  94      //   L      1     0
#define _LTOTALB                  95      //   L      1     0
#define _CDTOATP                  96      //   C     50     0
#define _NDTOATP                  97      //   N      6     2
#define _NSBRATP                  98      //   N      1     0
#define _CCODUSR                  99      //
#define _DFECCHG                 100      //
#define _CTIMCHG                 101      //
#define _NTIPRET                 102      //
#define _NPCTRET                 103      //
#define _DFECBLQ                 104      //   D      8     0
#define _CMOTBLQ                 105      //   C     50     0
#define _LMODDAT                 106      //   l      1     0
#define _LMAIL                   107      //   L      1     0
#define _CCODTRN                 108      //   L      1     0
#define _MOBSERV                 109      //   M     10     0
#define _LPUBINT                 110      //   L     1      0
#define _CCLAVE                  111      //   C     40     0
#define _CCODWEB                 112      //   N     11     0
#define _CCODEDI                 113      //   N     11     0
#define _CFACAUT                 114      //   C      3     0
#define _LWEB                    115      //   L      1     0
#define _NDTOART                 116      //   N      1     0
#define _LEXCFID                 117      //   L      1     0
#define _MFACAUT                 118      //   M     10     0

#define _aCCODCLI                  1      //   C     12     0
#define _aCCODART                  2      //   C     14     0
#define _aCCODFAM                  3      //   C      8     0
#define _aNTIPATP                  4      //   N      1     0
#define _aCCODPR1                  5      //   C      5     0
#define _aCVALPR1                  6      //   C      5     0
#define _aCCODPR2                  7      //   C      5     0
#define _aCVALPR2                  8      //   C      5     0
#define _aDFECINI                  9      //   D      8     0
#define _aDFECFIN                 10      //   D      8     0
#define _aLPRCCOM                 11      //   L      1     0
#define _aNPRCCOM                 12      //   N     16     6
#define _aNPRCART                 13      //   N     16     6
#define _aNPRCART2                14      //   N     16     6
#define _aNPRCART3                15      //   N     16     6
#define _aNPRCART4                16      //   N     16     6
#define _aNPRCART5                17      //   N     16     6
#define _aNPRCART6                18      //   N     16     6
#define _aNPREIVA1                19      //   N     16     6
#define _aNPREIVA2                20      //   N     16     6
#define _aNPREIVA3                21      //   N     16     6
#define _aNPREIVA4                22      //   N     16     6
#define _aNPREIVA5                23      //   N     16     6
#define _aNPREIVA6                24      //   N     16     6
#define _aNDTOART                 25      //   N      6     2
#define _aNDPRART                 26      //   N      6     2
#define _aLCOMAGE                 27      //   L      1     0
#define _aNCOMAGE                 28      //   N      6     2
#define _aNDTODIV                 29      //   N     16     6
#define _aLAPLPRE                 30      //   L      1     0
#define _aLAPLPED                 31      //   L      1     0
#define _aLAPLALB                 32      //   L      1     0
#define _aLAPLFAC                 33      //   L      1     0
#define _aNUNVOFE                 34      //   N      3     0
#define _aNUNCOFE                 35      //   N      3     0
#define _aNTIPXBY                 36      //   N      1     0
#define _aNDTO1                   37      //   N     16     6
#define _aNDTO2                   38      //   N     16     6
#define _aNDTO3                   39      //   N     16     6
#define _aNDTO4                   40      //   N     16     6
#define _aNDTO5                   41      //   N     16     6
#define _aNDTO6                   42      //   N     16     6

#define fldGeneral                oFld:aDialogs[1]
#define fldComercial              oFld:aDialogs[2]
#define fldAutomaticas            oFld:aDialogs[3]
#define fldDirecciones            oFld:aDialogs[4]
#define fldContactos              oFld:aDialogs[5]
#define fldBancos                 oFld:aDialogs[6]
#define fldContabilidad           oFld:aDialogs[7]
#define fldDefinidos              oFld:aDialogs[8]
#define fldTarifa                 oFld:aDialogs[9]
#define fldDocumentos             oFld:aDialogs[10]
#define fldIncidencias            oFld:aDialogs[11]
#define fldObservaciones          oFld:aDialogs[12]

#ifndef __PDA__
   #define FW_BOLD               700
#endif

memvar dbfCli
memvar cDbfCli
memvar dbfObr
memvar cDbfObr
memvar dbfCon
memvar cDbfCon

static oWndBrw
static dbfConfig
static dbfClient
static filClient
static tmpClient
static dbfClientD
static dbfCliAtp
static dbfAlbCliT
static dbfAlbCliL
static dbfFacCliT
static dbfFacCliL
static dbfFacCliP
static dbfAntCliT
static dbfPro
static dbfCliInc
static dbfProL
static dbfTikT
static dbfTikL
static dbfTikP
static dbfArticulo
static dbfArtKit
static dbfFPago
static dbfIva
static dbfDoc
static cFpago
static dbfDiv
static dbfFamilia
static oBandera
static dbfObrasT
static dbfContactos
static dbfBanco
static dbfAlmT
static dbfTmpDoc
static dbfTmpObr
static dbfTmpBnc
static dbfTmpAtp
static dbfTmpInc
static dbfTmpCon
static dbfTmpSubCta
static dbfArtDiv
static dbfInci
static dbfFlt
static dbfOfe
static oTrans
static cTmpDoc
static cTmpObr
static cTmpBnc
static cTmpAtp
static cTmpCta
static cTmpInc
static cTmpCon
static oFacAut
static oGrpCli
static oPais
static oCtaRem
static cAgente
static oNewImp
static cPinDiv
static cPouDiv
static cPorDiv
static aRgbColor
static oMenu
static oStock
static oBanco
static aFacAut          := {}

static oRTF
static cRTF
static lBold
static lItalic
static lUnderline
static lBullet

static aRentabilidad    := { { "", "", 0, .t., .f. } }
static aStrClients      := { "Clientes", "Potenciales", "Web" }

static lExpandida       := .f.

static lExternal        := .f.
static lOpenFiles       := .f.

static nLabels          := 1

#ifndef __PDA__

static aIniCli          := Array( 11 )

static bEdtRec          := { | aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode | EdtRec( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode ) }
static bEdtBig          := { | aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode | EdtBig( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode ) }
static bEdtAtp          := { | aTmp, aGet, dbfCliAtp, oBrw, bWhen, bValid, nMode | EdtAtp( aTmp, aGet, dbfCliAtp, oBrw, bWhen, bValid, nMode ) }
static bEdtDoc          := { | aTmp, aGet, dbfClientD, oBrw, bWhen, bValid, nMode, cCodCli | EdtDoc( aTmp, aGet, dbfClientD, oBrw, bWhen, bValid, nMode, cCodCli ) }
static bEdtBnc          := { | aTmp, aGet, dbfBanco, oBrw, bWhen, bValid, nMode, cCodCli | EdtBnc( aTmp, aGet, dbfBanco, oBrw, bWhen, bValid, nMode, cCodCli ) }
static bEdtInc          := { | aTmp, aGet, dbfCliInc, oBrw, bWhen, bValid, nMode | EdtInc( aTmp, aGet, dbfCliInc, oBrw, bWhen, bValid, nMode ) }

#else

static bEdtPda          := { | aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode | EdtPda( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode ) }
static bAtpPda          := { | aTmp, aGet, dbfCliAtp, oBrw, bWhen, bValid, nMode | AtpPda( aTmp, aGet, dbfCliAtp, oBrw, bWhen, bValid, nMode ) }
static aClientes        := {}
static aDbfBmp
static cComboOrden

#endif

static oReporting

#ifndef __PDA__

//--------------------------------------------------------------------------//
//Funciones del programa
//--------------------------------------------------------------------------//

FUNCTION Client( oMenuItem, oWnd, cCodCli )

   local oSnd
   local oRpl
   local oDel
   local nLevel
   local oRotor

   DEFAULT  oMenuItem   := "01032"
   DEFAULT  oWnd        := oWnd()

   if Empty( oWndBrw )

      /*
      Obtenemos el nivel de acceso---------------------------------------------
      */

      nLevel            := nLevelUsr( oMenuItem )

      if nAnd( nLevel, 1 ) != 0
         msgStop( "Acceso no permitido." )
         return nil
      end if

      /*
      Cerramos todas las ventanas----------------------------------------------
      */

      if oWnd != nil
         SysRefresh(); oWnd:CloseAll(); SysRefresh()
      end if

      /*
      Apertura de ficheros-----------------------------------------------------
      */

      if !OpenFiles( .f. )
         return nil
      end if

      /*
      Anotamos el movimiento para el navegador---------------------------------
      */

      DisableAcceso()

      DEFINE SHELL oWndBrw FROM 0, 0 TO 22, 80 ;
         XBROWSE ;
			TITLE 	"Clientes" ;
         PROMPT   "C�digo",;
                  "Nombre",;
                  if( uFieldEmpresa( "nCifRut" ) == 1, "NIF/CIF", "RUT" ),;
                  "Poblaci�n",;
                  "Provincia",;
                  "C�digo postal",;
                  "Tel�fono",;
                  "Establecimiento",;
                  "Correo electr�nico",;
                  "Cliente web" ,;
                  if( Empty( AllTrim( aIniCli[1] ) ), "Campo definido 1", AllTrim( aIniCli[1] ) ) ,;
                  if( Empty( AllTrim( aIniCli[2] ) ), "Campo definido 2", AllTrim( aIniCli[2] ) ) ,;
                  if( Empty( AllTrim( aIniCli[3] ) ), "Campo definido 3", AllTrim( aIniCli[3] ) ) ;
         ALIAS    ( dbfClient ) ;
         MRU      "User1_16";
         APPEND   ( WinAppRec( oWndBrw:oBrw, bEdtRec, dbfClient ) );
         DUPLICAT ( WinDupRec( oWndBrw:oBrw, bEdtRec, dbfClient ) );
         EDIT     ( WinEdtRec( oWndBrw:oBrw, bEdtRec, dbfClient ) ) ;
         DELETE   ( WinDelRec( oWndBrw:oBrw, dbfClient ) ) ;
         LEVEL    nLevel ;
         OF       oWnd

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Bloqueado"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->lBlqCli }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "stop_16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Envio"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->lSndInt }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "LBl16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Internet"
         :cSortOrder       := "lPubInt"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->lPubInt }
         :nWidth           := 20
         :lHide            := .t.
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "SNDINT16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Tarifas atipicas"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfCliAtp )->( dbSeek( ( dbfClient )->Cod ) ) }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "PERCENT_16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Potencial"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->nTipCli == 2 }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "CLIPOT" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "Cod"
         :bEditValue       := {|| ( dbfClient )->Cod }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "Titulo"
         :bEditValue       := {|| ( dbfClient )->Titulo }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with


      with object ( oWndBrw:AddXCol() )
         if uFieldEmpresa( "nCifRut" ) == 1
         :cHeader          := "NIF/CIF"
         else
         :cHeader          := "RUT"
         :cEditPicture     := "@R 999999999-9"
         end if
         :cSortOrder       := "Nif"
         :bEditValue       := {|| ( dbfClient )->Nif }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Tel�fono"
         :cSortOrder       := "Telefono"
         :bEditValue       := {|| ( dbfClient )->Telefono }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfClient )->Fax }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfClient )->Domicilio }
         :nWidth           := 300
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Poblaci�n"
         :cSortOrder       := "Poblacion"
         :bEditValue       := {|| ( dbfClient )->Poblacion }
         :nWidth           := 200
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo postal"
         :cSortOrder       := "CodPostal"
         :bEditValue       := {|| ( dbfClient )->CodPostal }
         :nWidth           := 60
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Provincia"
         :cSortOrder       := "Provincia"
         :bEditValue       := {|| ( dbfClient )->Provincia }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Establecimiento"
         :cSortOrder       := "NbrEst"
         :bEditValue       := {|| ( dbfClient )->NbrEst }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Correo electr�nico"
         :cSortOrder       := "cMeiInt"
         :bEditValue       := {|| ( dbfClient )->cMeiInt }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Riesgo"
         :bEditValue       := {|| Trans( ( dbfClient )->Riesgo, PicOut() ) }
         :nWidth           := 60
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Contacto"
         :bEditValue       := {|| ( dbfClient )->cPerCto }
         :nWidth           := 200
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Observaciones"
         :bEditValue       := {|| ( dbfClient )->mComent }
         :nWidth           := 200
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Cliente web"
         :cSortOrder       := "cCliWeb"
         :bEditValue       := {|| aStrClients[ Min( Max( ( dbfClient )->nTipCli, 1 ), len( aStrClients ) ) ] }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := if( Empty( AllTrim( aIniCli[1] ) ), "Campo definido 1", AllTrim( aIniCli[1] ) )
         :cSortOrder       := "cUsrDef01"
         :bEditValue       := {|| ( dbfClient )->cUsrDef01 }
         :nWidth           := 120
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := if( Empty( AllTrim( aIniCli[2] ) ), "Campo definido 2", AllTrim( aIniCli[2] ) )
         :cSortOrder       := "cUsrDef02"
         :bEditValue       := {|| ( dbfClient )->cUsrDef02 }
         :nWidth           := 120
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := if( Empty( AllTrim( aIniCli[3] ) ), "Campo definido 3", AllTrim( aIniCli[3] ) )
         :cSortOrder       := "cUsrDef03"
         :bEditValue       := {|| ( dbfClient )->cUsrDef03 }
         :nWidth           := 120
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
         :lHide            := .t.
      end with

      oWndBrw:cHtmlHelp    := "Clientes"

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
         HOTKEY   "D" ;
         LEVEL    ACC_APPD

		DEFINE BTNSHELL RESOURCE "EDIT" OF oWndBrw ;
			NOBORDER ;
			ACTION  	( oWndBrw:RecEdit() );
			TOOLTIP 	"(M)odificar";
         HOTKEY   "M" ;
         LEVEL    ACC_EDIT

		DEFINE BTNSHELL RESOURCE "ZOOM" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( WinZooRec( oWndBrw:oBrw, bEdtRec, dbfClient ) );
			TOOLTIP 	"(Z)oom";
			HOTKEY 	"Z"

      DEFINE BTNSHELL oDel RESOURCE "DEL" OF oWndBrw ;
			NOBORDER ;
			ACTION 	( oWndBrw:RecDel() );
			TOOLTIP 	"(E)liminar";
         HOTKEY   "E" ;
         LEVEL    ACC_DELE

         DEFINE BTNSHELL RESOURCE "DEL" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( TDelTarifasClientes():New() );
            TOOLTIP  "Eliminar tarifas" ;
            FROM     oDel ;
            CLOSED ;
            LEVEL    ACC_DELE

      #ifndef __TACTIL__

      DEFINE BTNSHELL RESOURCE "INFO" GROUP OF oWndBrw ;
			NOBORDER ;
         ACTION   ( BrwVtaCli( ( dbfClient )->Cod, ( dbfClient )->Titulo ) );
         TOOLTIP  "(I)nforme cliente" ;
         HOTKEY   "I" ;
         LEVEL    ACC_ZOOM

		DEFINE BTNSHELL RESOURCE "IMP" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( TInfCliGrp():New( "Listado de clientes" ):Play() ) ;
         TOOLTIP  "Lis(t)ado";
         HOTKEY   "T"

      DEFINE BTNSHELL RESOURCE "IMP" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( TarCli():New( "Tarifas personalizadas por clientes" ):Play() ) ;
         TOOLTIP  "Listad(o) de tarifas";
         HOTKEY   "O"

      DEFINE BTNSHELL RESOURCE "Document_Chart_" GROUP OF oWndBrw ;
			NOBORDER ;
         ACTION   ( ReportingClient() ) ;
         TOOLTIP  "Rep(o)rting";
         HOTKEY   "O" ;
         LEVEL    ACC_IMPR

      #endif

      DEFINE BTNSHELL RESOURCE "RemoteControl_" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( TClienteLabelGenerator():Create() ) ;
         TOOLTIP  "Eti(q)uetas" ;
         HOTKEY   "Q"

      DEFINE BTNSHELL RESOURCE "Mail" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( TGenMailing():ClientResource( dbfClient, aItmCli(), oWndBrw ) ) ;
         TOOLTIP  "Enviar correos" ;
         HOTKEY   "V" ;
         LEVEL    ACC_IMPR

      DEFINE BTNSHELL oSnd RESOURCE "Lbl" GROUP OF oWndBrw ;
         NOBORDER ;
         MENU     This:Toggle() ;
         TOOLTIP  "En(v)iar" ;
         MESSAGE  "Seleccionar clientes para ser enviados" ;
         ACTION   lSndCli( oWndBrw, dbfClient ) ;
         HOTKEY   "V";
         LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Lbl" OF oWndBrw ;
            NOBORDER ;
            ACTION   lSndCli( oWndBrw, dbfClient, .t. ) ;
            TOOLTIP  "Seleccionar para envio" ;
            FROM     oSnd ;
            CLOSED ;
            LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Lbl" OF oWndBrw ;
            NOBORDER ;
            ACTION   lSndCli( oWndBrw, dbfClient, .f. ) ;
            TOOLTIP  "Deseleccionar para envio" ;
            FROM     oSnd ;
            CLOSED ;
            LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "BMPCONTA" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( ChkAllSubCta() ) ;
         TOOLTIP  "Com(p)robar subcuentas" ;
         HOTKEY   "P";
         LEVEL    ACC_EDIT

      if oUser():lAdministrador()

         DEFINE BTNSHELL RESOURCE "CHGPRE" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( ChgPrc( dbfCliAtp, oWndBrw ) ) ;
            TOOLTIP  "(C)ambiar precios" ;
            HOTKEY   "C";
            LEVEL    ACC_APPD

         DEFINE BTNSHELL oRpl RESOURCE "BMPCHG" GROUP OF oWndBrw ;
            NOBORDER ;
            MENU     This:Toggle() ;
            ACTION   ( TDlgFlt():New( aItmCli(), dbfClient ):ChgFields() ) ;
            TOOLTIP  "Cambiar campos" ;
            LEVEL    ACC_APPD

            DEFINE BTNSHELL RESOURCE "BMPCHG" OF oWndBrw ;
               NOBORDER ;
               ACTION   ( TDlgFlt():New( aItmAtp(), dbfCliAtp ):ChgFields() ) ;
               TOOLTIP  "Tarifa" ;
               FROM     oRpl ;
               CLOSED ;
               LEVEL    ACC_EDIT

      end if

		DEFINE BTNSHELL RESOURCE "CNFCLI" GROUP OF oWndBrw ;
			NOBORDER ;
			ACTION 	( CnfCli( dbfClient ) ) ;
         TOOLTIP  "Confi(g)urar" ;
         HOTKEY   "G";
         LEVEL    ACC_APPD

      DEFINE BTNSHELL oRotor RESOURCE "ROTOR" GROUP OF oWndBrw ;
         NOBORDER ;
         ACTION   ( oRotor:Expand() ) ;
         TOOLTIP  "Rotor" ;
         LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Notebook_user1_" OF oWndBrw ;
            ALLOW    EXIT ;
            ACTION   ( PreCli( nil, oWnd, ( dbfClient )->Cod, nil ) );
            TOOLTIP  "A�adir presupuesto de cliente" ;
            FROM     oRotor ;
            LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Clipboard_empty_user1_" OF oWndBrw ;
            ALLOW    EXIT ;
            ACTION   ( PedCli( nil, oWnd, ( dbfClient )->Cod, nil ) );
            TOOLTIP  "A�adir pedido de cliente" ;
            FROM     oRotor ;
            LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Document_plain_user1_" OF oWndBrw ;
            ALLOW    EXIT ;
            ACTION   ( AlbCli( nil, oWnd, ( dbfClient )->Cod, nil ) );
            TOOLTIP  "A�adir albar�n de cliente" ;
            FROM     oRotor ;
            LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Document_user1_" OF oWndBrw ;
            ALLOW    EXIT ;
            ACTION   ( FactCli( nil, oWnd, ( dbfClient )->Cod, nil ) );
            TOOLTIP  "A�adir factura de cliente" ;
            FROM     oRotor ;
            LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "Cashier_user1_" OF oWndBrw ;
            ALLOW    EXIT ;
            ACTION   ( FrontTpv( nil, oWnd, ( dbfClient )->Cod, nil ) );
            TOOLTIP  "A�adir tiket de cliente" ;
            FROM     oRotor ;
            LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBrw ;
         ALLOW    EXIT ;
			ACTION 	( oWndBrw:End() ) ;
			TOOLTIP 	"(S)alir" ;
			HOTKEY 	"S"

      /*
      Datos para el filtro-----------------------------------------------------
      */

      oWndBrw:oActiveFilter:aTField       := aItmCli()
      oWndBrw:oActiveFilter:cDbfFilter    := dbfFlt
      oWndBrw:oActiveFilter:cTipFilter    := CLI_TBL

      /*
      Abrimos la ventana-------------------------------------------------------
      */

      ACTIVATE WINDOW oWndBrw VALID ( CloseFiles( .t. ) )

      EnableAcceso()

   else

		oWndBrw:SetFocus()

   end if

Return ( .t. )

//----------------------------------------------------------------------------//

/*
Edita el cliente en el tactil
*/

STATIC FUNCTION EdtBig( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode )

	local oDlg
   local oBmpGeneral
   local cResource      := "BigEdtCliente"

   if ( nMode == APPD_MODE .or. nMode == DUPL_MODE )
      aTmp[ _COD     ]  := NextKey( aTmp[ _COD ], dbfClient, "0", RetNumCodCliEmp() )
      aTmp[ _LSNDINT ]  := .t.
      aTmp[ _LMODDAT ]  := .t.
      aTmp[ _LCHGPRE ]  := .t.
      aTmp[ _COPIASF ]  := 0
      aTmp[ _NLABEL  ]  := 1
      aTmp[ _NTARIFA ]  := 1
   end case

   if GetSysMetrics( 1 ) == 560

      DEFINE DIALOG oDlg RESOURCE "BigEdtCliente_1024x576" TITLE ( LblTitle( nMode ) + "cliente" )

   else

      DEFINE DIALOG oDlg RESOURCE cResource TITLE ( LblTitle( nMode ) + "cliente" )

   end if

      REDEFINE BITMAP oBmpGeneral ;
        ID       500 ;
        RESOURCE "Businessman2_Alpha_48" ;
        TRANSPARENT ;
        OF       oDlg

      REDEFINE GET aGet[ _COD ] VAR aTmp[ _COD ] ;
         ID       100 ;
         PICTURE  ( Replicate( "X", RetNumCodCliEmp() ) );
         WHEN     ( nMode == APPD_MODE .or. nMode == DUPL_MODE ) ;
         VALID    ( NotValid( aGet[ _COD ], dbfClient, .t., "0", 1, RetNumCodCliEmp() ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ _TITULO ] VAR aTmp[ _TITULO ];
         ID       110 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         ON CHANGE( ActTitle( nKey, nFlags, Self, nMode, oDlg ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( if( nMode == APPD_MODE, lValidNombre( aGet[_TITULO] ), .t. ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ _DOMICILIO ] VAR aTmp[ _DOMICILIO ];
         ID       120 ;
         ON HELP  GoogleMaps( aTmp[ _DOMICILIO ], Rtrim( aTmp[ _POBLACION ] ) + Space( 1 ) + Rtrim( aTmp[ _PROVINCIA ] ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ _POBLACION ] VAR aTmp[ _POBLACION ];
         ID       130 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ _CODPOSTAL ] VAR aTmp[ _CODPOSTAL ] ;
         ID       140 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ _TELEFONO ] VAR aTmp[ _TELEFONO ] ;
         ID       150 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( if( nMode == APPD_MODE, lValidTlf( aGet[_TELEFONO] ), .t. ) ) ;
         OF       oDlg

      if uFieldEmpresa( "nCifRut" ) <= 1

      REDEFINE GET aGet[ _NIF ] VAR aTmp[ _NIF ] ;
         ID       160 ;
         PICTURE  "@!" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( CheckCif( aGet[ _NIF ] ), if( nMode == APPD_MODE, lValidCif( aGet[ _NIF ] ), .t. ) );
         OF       oDlg

      else

      REDEFINE GET aGet[ _NIF ] VAR aTmp[ _NIF ] ;
         ID       160 ;
         PICTURE  "@R 999999999-9" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( CheckRut( aGet[ _NIF ] ), if( nMode == APPD_MODE, lValidCif( aGet[ _NIF ] ), .t. ) );
         OF       oDlg

      end if

      REDEFINE GET aGet[ _CMEIINT ] VAR aTmp[ _CMEIINT ] ;
         ID       170 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         ON HELP  ( ShellExecute( oDlg:hWnd, "open", "mailto:" + Rtrim( aGet[ _CMEIINT ]:cText() ) ) ) ;
         UPDATE ;
         OF       oDlg

      REDEFINE GET aGet[ _MCOMENT ] VAR aTmp[ _MCOMENT ];
         ID       180 ;
			MEMO ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

		/*
		Botones de la Caja de Dialogo__________________________________________
		*/

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
			ACTION 	( oDlg:end() )

      if nMode != ZOOM_MODE
         oDlg:AddFastKey( VK_F5, {|| SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) } )
      end if

   ACTIVATE DIALOG oDlg CENTER

   oBmpGeneral:End()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//
/*
Edita el cliente
*/

STATIC FUNCTION EdtRec( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode )

	local oDlg
	local oFld
   local oGetSubCta
   local oGetSubDto
   local oBrwCta
	local oBrwObr
   local oBrwAtp
   local oBrwDoc
   local oBrwBnc
   local oBrwInc
   local oBrwCon
   local oBrwFacAut
   local oBmpDiv
   local oGet
   local cColor
   local nImpRie        := 0
   local cTipCli
   local cTipRetencion
   local nSeaColor
   local oGetSalDto
   local nGetSalDto     := 0
   local oSay           := Array( 9 )
   local cSay           := Array( 9 )
   local oGetCta
	local cGetSubCta		:= Space( 30 )
   local cGetSubDto     := Space( 30 )
	local cGetCta			:= Space( 30 )
   local nGetDebe       := 0
   local nGetHaber      := 0
   local oGetSaldo
   local nGetSaldo      := 0
   local aStrColor      := { "Ninguno", "Verde", "Naranja", "Rojo" }
   local aResColor      := { "COLOR_00", "COLOR_01", "COLOR_02", "COLOR_03" }
   local aStrRetencion  := { "Ret. S/Base", "Ret. S/Total" }
   local aResClients    := { "Cli", "CliPot", "CliPot" }
   local aMes           := { "Ninguno", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" }
   local oFiltroAtp
   local cFiltroAtp     := aIniCli[ 11 ]
   local aFiltroAtp     := { "Todas", "Activas" }
   local oZoom
   local cZoom          := "100%"
   local aZoom          := { "500%", "200%", "150%", "100%", "75%", "50%", "25%", "10%" }
   local oFuente
   local cFuente        := "Arial"
   local aFuente        := aGetFont( oWnd() )
   local oSize
   local cSize          := "10"
   local aSize          := { " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72" }
   local oClp
   local oBtn           := Array( 17 )
   local aRatio         := { { 5, 1 }, { 2, 1 }, { 3, 2 }, { 1, 1 }, { 3, 4 }, { 1, 2 }, { 1, 4 }, { 1, 10 } }
   local oBmpGeneral
   local oBmpComercial
   local oBmpDirecciones
   local oBmpContactos
   local oBmpBancos
   local oBmpContabilidad
   local oBmpComentario
   local oBmpTarifa
   local oBmpDocumentos
   local oBmpIncidencias
   local oBmpObservaciones
   local oBmpAutomaticas

   aFacAut              := hb_aTokens( aTmp[ _MFACAUT ], "," )

   aRgbColor            := { Rgb( 255, 255, 255 ), Rgb( 102, 204,  51 ), Rgb( 255, 204, 102 ), Rgb( 255,  51,   0 ) }

   nSeaColor            := aScan( aRgbColor, aTmp[ _NCOLOR ] )
   if nSeaColor != 0
      cColor            := aStrColor[ nSeaColor ]
   end if

   do case
      case nMode == APPD_MODE
         aTmp[ _LSNDINT ]  := .t.
         aTmp[ _LMODDAT ]  := .t.
         aTmp[ _LCHGPRE ]  := .t.
         aTmp[ _COPIASF ]  := 0
         aTmp[ _NLABEL  ]  := 1
         aTmp[ _NTARIFA ]  := 1

      case nMode == DUPL_MODE
         aTmp[ _COD ]      := NextKey( aTmp[ _COD ], dbfClient, "0", RetNumCodCliEmp() )

      otherwise
         nImpRie           := oStock:nRiesgo( aTmp[ _COD ] )

   end case

   aTmp[ _NMESVAC ]        := aMes[ Min( Max( aTmp[ _NMESVAC ], 1 ), len( aMes ) ) ]

   cTipCli                 := aStrClients[ Min( Max( aTmp[ _NTIPCLI ], 1 ), len( aStrClients ) ) ]

   cTipRetencion           := aStrRetencion[ Min( Max( aTmp[ _NTIPRET ], 1 ), len( aStrRetencion ) ) ]

   if Empty( aTmp[ _CDTOESP ] )
      aTmp[ _CDTOESP ]     := Padr( "General", 50 )
   end if

   if Empty( aTmp[ _CDPP ] )
      aTmp[ _CDPP ]        := Padr( "Pronto pago", 50 )
   end if

   if Empty( aTmp[ _CDTOATP ] )
      aTmp[ _CDTOATP ]     := Padr( "Atipico", 50 )
   end if

   /*
   Abrimos las bases de datos si no estan abiertas-----------------------------
   */

   if BeginTrans( aTmp, nMode )
      Return .f.
   end if

   /*
   Colocamos los filtros
   */

   DEFINE DIALOG  oDlg ;
         RESOURCE "CLIENT" ;
         TITLE    LblTitle( nMode ) + "Cliente : " + Rtrim( aTmp[ _TITULO ] )

		REDEFINE FOLDER oFld ;
			ID 		500 ;
			OF 		oDlg ;
			PROMPT 	"&General",;
                  "C&omercial",;
                  "Au&tom�ticas",;
                  "&Direcciones",;
                  "C&ontactos",;
                  "&Bancos",;
                  "Co&ntabilidad",;
                  "Definidos",;
                  "&Tarifa",;
                  "Doc&umentos",;
                  "&Incidencias",;
                  "Ob&servaciones";
         DIALOGS  "CLIENT_0"  ,;
                  "CLIENT_1"  ,;
                  "CLIENT_17" ,;
                  "CLIENT_15" ,;
                  "CLIENT_16" ,;
                  "CLIENT_2"  ,;
                  "CLIENT_3"  ,;
                  "CLIENT_4"  ,;
                  "CLIENT_5"  ,;
                  "CLIENT_10" ,;
                  "CLIENT_12" ,;
                  "CLIENT_14"
      /*
      Primera pestan�a---------------------------------------------------------
      */

      REDEFINE BITMAP oBmpGeneral ;
         ID       500 ;
         RESOURCE "Businessman2_Alpha_48" ;
         TRANSPARENT ;
         OF       fldGeneral

      REDEFINE GET oGet ;
         VAR      aTmp[ _COD ] ;
			ID 		110 ;
         PICTURE  ( Replicate( "X", RetNumCodCliEmp() ) );
         WHEN     ( nMode == APPD_MODE .or. nMode == DUPL_MODE ) ;
         ON HELP  ( oGet:cText( NextKey( aTmp[ _COD ], dbfClient, "0", RetNumCodCliEmp() ) ) ) ;
         BITMAP   "BOT" ;
         VALID    ( NotValid( oGet, dbfClient, .t., "0", 1, RetNumCodCliEmp() ) ) ;
         OF       fldGeneral

      REDEFINE COMBOBOX aGet[ _NTIPCLI ] VAR cTipCli ;
         ID       105 ;
         ITEMS    aStrClients;
         BITMAPS  aResClients;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_TITULO] VAR aTmp[_TITULO];
			ID 		120 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         ON CHANGE( ActTitle( nKey, nFlags, Self, nMode, oDlg ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( if( nMode == APPD_MODE, lValidNombre( aGet[_TITULO] ), .t. ) ) ;
         OF       fldGeneral

      if uFieldEmpresa( "nCifRut" ) <= 1

      REDEFINE GET aGet[ _NIF ] VAR aTmp[ _NIF ] ;
			ID 		130 ;
         PICTURE  "@!" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( CheckCif( aGet[ _NIF ] ), if( nMode == APPD_MODE, lValidCif( aGet[ _NIF ] ), .t. ) );
         OF       fldGeneral

      else

      REDEFINE GET aGet[ _NIF ] VAR aTmp[ _NIF ] ;
			ID 		130 ;
         PICTURE  "@R 999999999-9" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( CheckRut( aGet[ _NIF ] ), if( nMode == APPD_MODE, lValidCif( aGet[ _NIF ] ), .t. ) );
         OF       fldGeneral

      end if

      REDEFINE GET aGet[ _DOMICILIO ] VAR aTmp[ _DOMICILIO ];
			ID 		140 ;
         BITMAP   "Environnment_View_16" ;
         ON HELP  GoogleMaps( aTmp[ _DOMICILIO ], Rtrim( aTmp[ _POBLACION ] ) + Space( 1 ) + Rtrim( aTmp[ _PROVINCIA ] ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CCODEDI ] VAR aTmp[ _CCODEDI ] ;
         ID       145 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _POBLACION ] VAR aTmp[ _POBLACION ];
			ID 		150 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CODPOSTAL ] VAR aTmp[ _CODPOSTAL ] ;
			ID 		160 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _PROVINCIA ] VAR aTmp[ _PROVINCIA ] ;
			ID 		170 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CCODPAI ] VAR aTmp[ _CCODPAI ] ;
         ID       300 ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oPais:GetPais( aTmp[ _CCODPAI ], oSay[6], oBmpDiv ) ) ;
         ON HELP  ( oPais:Buscar( aGet[ _CCODPAI ] ) ) ;
         BITMAP   "LUPA" ;
         OF       fldGeneral

      REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
         ID       301;
         OF       fldGeneral

      REDEFINE GET oSay[6] VAR cSay[6] ;
         ID       302 ;
			SPINNER ;
         WHEN     ( .f. ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CPERCTO ] VAR aTmp[ _CPERCTO ];
         ID       90 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE COMBOBOX aGet[ _NCOLOR ] VAR cColor;
         ID       95;
         ITEMS    aStrColor;
         BITMAPS  aResColor;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_TELEFONO] VAR aTmp[_TELEFONO] ;
			ID 		180 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( if( nMode == APPD_MODE, lValidTlf( aGet[_TELEFONO] ), .t. ) ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_FAX] VAR aTmp[_FAX] ;
			ID 		190 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_MOVIL] VAR aTmp[_MOVIL] ;
         ID       195 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _NTARIFA ] VAR aTmp[ _NTARIFA ] ;
         ID       100 ;
         PICTURE  "9" ;
         SPINNER ;
         MIN      1 ;
         MAX      6 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( lUsrMaster() .or. oUser():lCambiarPrecio() ) );
         VALID    ( aTmp[ _NTARIFA ] >= 1 .and. aTmp[ _NTARIFA ] <= 6 );
         OF       fldGeneral

      REDEFINE GET aGet[ _NDTOART ] VAR aTmp[ _NDTOART ] ;
         ID       101 ;
         PICTURE  "9" ;
         SPINNER ;
         MIN      0 ;
         MAX      6 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( lUsrMaster() .or. oUser():lCambiarPrecio() ) );
         VALID    ( aTmp[ _NDTOART ] >= 0 .and. aTmp[ _NDTOART ] <= 6 );
         OF       fldGeneral

      REDEFINE GET aGet[_CCODTAR] VAR aTmp[_CCODTAR] ;
			ID 		200 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE .and. oUser():lAdministrador() ) ;
         VALID    ( cTarifa( aGet[_CCODTAR], oSay[3] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwTarifa( aGet[_CCODTAR], oSay[3] ) ) ;
         OF       fldGeneral

      REDEFINE GET oSay[3] VAR cSay[3] ;
			ID 		201;
			COLOR 	CLR_GET ;
			WHEN 		( .F. ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_CODPAGO] VAR aTmp[_CODPAGO];
			ID 		210 ;
         PICTURE  "@!" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cFPago( aGet[_CODPAGO], dbfFPago, oSay[1] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwFPago( aGet[_CODPAGO ], oSay[1] ) );
         OF       fldGeneral

      REDEFINE GET oSay[1] VAR cSay[1];
         ID       211 ;
			WHEN 		.F. ;
			COLOR 	CLR_GET ;
         OF       fldGeneral

      REDEFINE GET aGet[_DIAPAGO] VAR aTmp[_DIAPAGO] ;
         ID       232;
         PICTURE  "99" ;
         SPINNER ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[_DIAPAGO2] VAR aTmp[_DIAPAGO2] ;
         ID       233;
         PICTURE  "99" ;
         SPINNER ;
         COLOR    CLR_GET ;
         VALID    ( if( ( aTmp[_DIAPAGO2] != 0 .and. aTmp[_DIAPAGO2] <= aTmp[_DIAPAGO] ),;
                      ( msgStop( "Segundo d�a de pago debe ser mayor que el primero" ), .f. ),;
                      .t. ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CMEIINT ] VAR aTmp[ _CMEIINT ] ;
         ID       280 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         ON HELP  ( ShellExecute( oDlg:hWnd, "open", "mailto:" + Rtrim( aGet[ _CMEIINT ]:cText() ) ) ) ;
         BITMAP   "MAIL16" ;
         UPDATE ;
         OF       fldGeneral

      /*
      Codigo de Cuenta de Remesas______________________________________________
      */

      REDEFINE GET aGet[_CCODREM] VAR aTmp[_CCODREM] ;
         ID       320 ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oCtaRem:lGetCtaRem( aGet[_CCODREM], oSay[8] ) ) ;
         ON HELP  ( oCtaRem:Buscar( aGet[_CCODREM] ) ) ;
         BITMAP   "LUPA" ;
         OF       fldGeneral

      REDEFINE GET oSay[8] VAR cSay[8] ;
			WHEN 		.F. ;
         ID       321 ;
         OF       fldGeneral

      REDEFINE GET aGet[_CCODRUT] VAR aTmp[_CCODRUT] ;
         ID       220 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cRuta( aGet[_CCODRUT], nil, oSay[4] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwRuta( aGet[_CCODRUT], nil, oSay[4] ) ) ;
			COLOR 	CLR_GET ;
         OF       fldGeneral

      REDEFINE GET oSay[4] VAR cSay[4] ;
         ID       221 ;
         WHEN     ( .f. ) ;
			COLOR 	CLR_GET ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CAGENTE ] VAR aTmp[ _CAGENTE ] ;
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cAgentes( aGet[ _CAGENTE ], , oSay[2] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGENTE ], oSay[2] ) ) ;
         OF       fldGeneral

      REDEFINE GET oSay[2] VAR cSay[2] ;
         ID       231 ;
			COLOR 	CLR_GET ;
			WHEN 		( .F. ) ;
         OF       fldGeneral

      REDEFINE GET aGet[ _CCODGRP ] VAR aTmp[ _CCODGRP ] ;
         ID       240 ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oGrpCli:Existe( aGet[ _CCODGRP ], oSay[ 5 ], "cNomGrp", .t., .t., "0" ) );
         ON HELP  ( oGrpCli:Buscar( aGet[ _CCODGRP ] ) ) ;
         BITMAP   "LUPA" ;
         OF       fldGeneral

      REDEFINE GET oSay[5] VAR cSay[5] ;
         ID       241 ;
			SPINNER ;
         WHEN     ( .f. ) ;
         COLOR    CLR_GET ;
         OF       fldGeneral

      /*
      Codigo de Almacen______________________________________________________________
      */

      REDEFINE GET aGet[ _CCODALM ] VAR aTmp[ _CCODALM ] ;
         ID       310 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cAlmacen( aGet[ _CCODALM ], dbfAlmT, oSay[7] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( aGet[ _CCODALM ], oSay[7] ) ) ;
			COLOR 	CLR_GET ;
         OF       fldGeneral

      REDEFINE GET oSay[ 7 ] VAR cSay[ 7 ] ;
			WHEN 		.F. ;
         ID       311 ;
         OF       fldGeneral

      /*
      Propiedades--------------------------------------------------------------
      */

      REDEFINE GET aGet[ _SERIE ] VAR aTmp[ _SERIE ] ;
         ID       260 ;
         SPINNER ;
         ON UP    ( UpSerie( aGet[ _SERIE ] ) );
         ON DOWN  ( DwSerie( aGet[ _SERIE ] ) );
         PICTURE  "@!" ;
         WHEN     ( nMode != ZOOM_MODE );
         VALID    ( Empty( aTmp[ _SERIE ] ) .or. ( aTmp[ _SERIE ] >= "A" .and. aTmp[ _SERIE ] <= "Z" ) );
         OF       fldGeneral

      REDEFINE GET aTmp[ _COPIASF ] ;
         ID       270 ;
			SPINNER ;
         MIN      0;
         MAX      9;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			PICTURE 	"9" ;
         OF       fldGeneral

      REDEFINE CHECKBOX aTmp[ _LPNTVER ] ;
         ID       157 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE CHECKBOX aTmp[ _LTOTALB ] ;
         ID       156 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE CHECKBOX aTmp[ _LMODDAT ] ;
         ID       158 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      REDEFINE CHECKBOX aTmp[ _LMAIL ] ;
         ID       159 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldGeneral

      /*
      Transportistas-----------------------------------------------------------
      */

      REDEFINE GET aGet[ _CCODTRN ] VAR aTmp[ _CCODTRN ] ;
         ID       315 ;
         IDTEXT   316 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "Lupa" ;
         OF       fldGeneral

      aGet[ _CCODTRN ]:bValid := {|| oTrans:Existe( aGet[ _CCODTRN ], aGet[ _CCODTRN ]:oHelpText ) }
      aGet[ _CCODTRN ]:bHelp  := {|| oTrans:Buscar( aGet[ _CCODTRN ] ) }


      /*
      Segunda Caja de Dialogo--------------------------------------------------
		*/

      REDEFINE BITMAP oBmpComercial ;
         ID       500 ;
         RESOURCE "Address_book2_Alpha_48" ;
         TRANSPARENT ;
         OF       fldComercial

      // oBmpGeneral:nAlphaLevel := 0

      REDEFINE GET aGet[_NBREST] VAR aTmp[_NBREST];
         ID       100 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[_DIREST] VAR aTmp[_DIREST] ;
         ID       110 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      /*
      INTERNET_________________________________________________________________
      */

      REDEFINE GET aGet[ _CWEBINT ] VAR aTmp[ _CWEBINT ] ;
         ID       290 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[ _LPUBINT ] ;
         ID       400 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lPubInt( nMode, aTmp ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CCLAVE ] ;
         VAR      aTmp[ _CCLAVE ] ;
         ID       410 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      /*
      IGIC----------------------------------------------------------------------
      */

      REDEFINE RADIO aGet[ _NREGIVA ] ;
         VAR      aTmp[ _NREGIVA ] ;
         ID       240,;
                  241,;
                  242,;
                  243 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LREQ] ;
         ID       130 ;
         WHEN     ( aTmp[_NREGIVA] == 1 .AND. nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[ _LCHGPRE ] ;
         ID       140 ;
         WHEN     ( oUser():lAdministrador() .and. nMode != ZOOM_MODE .and. !aTmp[ _LBLQCLI ] ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[ _LCRESOL ] ;
         ID       145 ;
         WHEN     ( oUser():lAdministrador() .and. aTmp[ _LCHGPRE ] .and. nMode != ZOOM_MODE .and. !aTmp[ _LBLQCLI ] ) ;
         OF       fldComercial

      REDEFINE GET aTmp[ _RIESGO ] ;
         ID       250 ;
         PICTURE  cPorDiv ;
         WHEN     ( oUser():lAdministrador() .and. aTmp[ _LCHGPRE ] .and. nMode != ZOOM_MODE .and. !aTmp[ _LBLQCLI ] ) ;
         OF       fldComercial

      REDEFINE GET nImpRie ;
         ID       251 ;
         PICTURE  cPorDiv ;
         OF       fldComercial

      /*
      Descuentos---------------------------------------------------------------
      */

      REDEFINE GET aGet[ _CDTOESP ] VAR aTmp[ _CDTOESP ] ;
			SPINNER ;
         ID       159;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lRecargaArray( aGet, aTmp ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[_NDTOESP] VAR aTmp[_NDTOESP] ;
			SPINNER ;
         ID       160;
			COLOR 	CLR_GET ;
         PICTURE  "@E 999.99" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CDPP ] VAR aTmp[ _CDPP ] ;
			SPINNER ;
         ID       169;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lRecargaArray( aGet, aTmp ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[_NDPP] VAR aTmp[_NDPP] ;
			SPINNER ;
         ID       170;
			COLOR 	CLR_GET ;
         PICTURE  "@E 999.99" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CDTOUNO ] VAR aTmp[ _CDTOUNO ] ;
			SPINNER ;
         ID       175;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lRecargaArray( aGet, aTmp ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _NDTOCNT ] VAR aTmp[ _NDTOCNT ];
			SPINNER ;
         ID       180 ;
         PICTURE  "@E 999.99" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CDTODOS ] VAR aTmp[ _CDTODOS ] ;
			SPINNER ;
         ID       185;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lRecargaArray( aGet, aTmp ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CDTOATP ] VAR aTmp[ _CDTOATP ] ;
			SPINNER ;
         ID       205;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _NDTORAP ] VAR aTmp[ _NDTORAP ];
			SPINNER ;
         ID       190 ;
         PICTURE  "@E 999.99" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _NDTOATP ] VAR aTmp[ _NDTOATP ];
			SPINNER ;
         ID       200 ;
         PICTURE  "@E 999.99" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE COMBOBOX aGet[ _NSBRATP ] VAR aTmp[ _NSBRATP ];
         ID       300 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aGet[ _LBLQCLI ] VAR aTmp[ _LBLQCLI ] ;
         ID       155 ;
         WHEN     ( oUser():lAdministrador() .and. nMode != ZOOM_MODE ) ;
         ON CHANGE( if( aTmp[ _LBLQCLI ], aGet[ _DFECBLQ ]:cText( GetSysDate() ), ( aGet[ _DFECBLQ ]:cText( Ctod("") ), aGet[ _CMOTBLQ ]:cText( Space(50) ) ) ) );
         OF       fldComercial

      REDEFINE GET aGet[ _DFECBLQ ] VAR aTmp[ _DFECBLQ ];
         ID       156 ;
         WHEN     ( oUser():lAdministrador() .and. nMode != ZOOM_MODE .and. aTmp[ _LBLQCLI ] );
         SPINNER;
         OF       fldComercial

      REDEFINE GET aGet[ _CMOTBLQ ] VAR aTmp[ _CMOTBLQ ];
         ID       157 ;
         WHEN     ( oUser():lAdministrador() .and. nMode != ZOOM_MODE .and. aTmp[ _LBLQCLI ] );
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISLUN] ;
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISMAR] ;
         ID       231 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISMIE] ;
         ID       232 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISJUE] ;
         ID       233 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISVIE] ;
         ID       234 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISSAB] ;
         ID       235 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[_LVISDOM] ;
         ID       236 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _NVISLUN ] ;
         VAR      aTmp[ _NVISLUN ] ;
         ID       330 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISLUN ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISMAR ] ;
         VAR      aTmp[ _NVISMAR ] ;
         ID       331 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMAR ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISMIE ] ;
         VAR      aTmp[ _NVISMIE ] ;
         ID       332 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMIE ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISJUE ] ;
         VAR      aTmp[ _NVISJUE ] ;
         ID       333 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISJUE ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISVIE ] ;
         VAR      aTmp[ _NVISVIE ] ;
         ID       334 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISVIE ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISSAB ] ;
         VAR      aTmp[ _NVISSAB ] ;
         ID       335 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISSAB ] );
         OF       fldComercial

      REDEFINE GET aGet[ _NVISDOM ] ;
         VAR      aTmp[ _NVISDOM ] ;
         ID       336 ;
         SPINNER ;
         MIN      1 ;
         MAX      999 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISDOM ] );
         OF       fldComercial

      REDEFINE GET aGet[ _CAGELUN ] VAR aTmp[ _CAGELUN ] ;
         ID       430 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISLUN ] );
         VALID    ( cAgentes( aGet[ _CAGELUN ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGELUN ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGEMAR ] VAR aTmp[ _CAGEMAR ] ;
         ID       431 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMAR ] );
         VALID    ( cAgentes( aGet[ _CAGEMAR ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGEMAR ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGEMIE ] VAR aTmp[ _CAGEMIE ] ;
         ID       432 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMIE ] );
         VALID    ( cAgentes( aGet[ _CAGEMIE ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGEMIE ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGEJUE ] VAR aTmp[ _CAGEJUE ] ;
         ID       433 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISJUE ] );
         VALID    ( cAgentes( aGet[ _CAGEJUE ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGEJUE ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGEVIE ] VAR aTmp[ _CAGEVIE ] ;
         ID       434 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISVIE ] );
         VALID    ( cAgentes( aGet[ _CAGEVIE ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGEVIE ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGESAB ] VAR aTmp[ _CAGESAB ] ;
         ID       435 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISSAB ] );
         VALID    ( cAgentes( aGet[ _CAGESAB ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGESAB ] ) ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _CAGEDOM ] VAR aTmp[ _CAGEDOM ] ;
         ID       436 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISDOM ] );
         VALID    ( cAgentes( aGet[ _CAGEDOM ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CAGEDOM ] ) ) ;
         OF       fldComercial

      REDEFINE COMBOBOX aGet[ _NMESVAC ] ;
         VAR      aTmp[ _NMESVAC ];
         ITEMS    aMes ;
         ID       210 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE COMBOBOX aGet[ _NTIPRET ] ;
         VAR      cTipRetencion ;
         ITEMS    aStrRetencion ;
         ID       310 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      REDEFINE GET aGet[ _NPCTRET ] ;
         VAR      aTmp[ _NPCTRET ] ;
         ID       320 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "@E 999.99" ;
         OF       fldComercial

      REDEFINE CHECKBOX aTmp[ _LEXCFID ] ;
         ID       158 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldComercial

      /*
      Tercera pesta�a----------------------------------------------------------
      */

      REDEFINE BITMAP oBmpAutomaticas ;
         ID       500 ;
         RESOURCE "Document_Gear_48_alpha" ;
         TRANSPARENT ;
         OF       fldAutomaticas

      REDEFINE BUTTON  ;
         ID       501 ;
         OF       fldAutomaticas ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( AddFacAut( oBrwFacAut ) )

      REDEFINE BUTTON ;
         ID       502 ;
         OF       fldAutomaticas ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( oFacAut:ExternalEdit( if( Len( aFacAut ) > 0, aFacAut[ oBrwFacAut:nArrayAt ], "" ) ) )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       fldAutomaticas ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( DelFacAut( oBrwFacAut ) )

      oBrwFacAut                        := IXBrowse():New( fldAutomaticas )

      oBrwFacAut:bClrSel                := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwFacAut:bClrSelFocus           := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwFacAut:SetArray( aFacAut, , , .f. )

      oBrwFacAut:nMarqueeStyle          := 5

      oBrwFacAut:CreateFromResource( 400 )

      with object ( oBrwFacAut:AddCol() )
         :cHeader          := "C�digo"
         :bStrData         := {|| if( Len( aFacAut ) > 0, aFacAut[ oBrwFacAut:nArrayAt ], "" ) }
         :nWidth           := 75
      end with

      with object ( oBrwFacAut:AddCol() )
         :cHeader          := "Nombre"
         :bStrData         := {|| if( Len( aFacAut ) > 0, RetFld( aFacAut[ oBrwFacAut:nArrayAt ], oFacAut:oDbf:cAlias, "cNomFac" ), "" ) }
         :nWidth           := 565
      end with

      /*
      Cuarta pesta�a-----------------------------------------------------------
      */

      REDEFINE BITMAP oBmpDirecciones ;
         ID       600 ;
         RESOURCE "Signpost_Alpha_48" ;
         TRANSPARENT ;
         OF       fldDirecciones

      REDEFINE BUTTON  ;
			ID 		500 ;
         OF       fldDirecciones ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( AppObras( aTmp[ _COD ], dbfTmpObr, oBrwObr ) )

      REDEFINE BUTTON ;
			ID 		501 ;
         OF       fldDirecciones ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( EdtObras( aTmp[ _COD ], nil, dbfTmpObr, oBrwObr, .t. ) )

      REDEFINE BUTTON ;
			ID 		502 ;
         OF       fldDirecciones ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( DelObras( dbfTmpObr, oBrwObr ) )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       fldDirecciones ;
         ACTION   ( ZoomObras( dbfTmpObr, oBrwObr ) )

      REDEFINE BUTTON ;
         ID       504 ;
         OF       fldDirecciones ;
         ACTION   ( PredObras( dbfTmpObr, oBrwObr ) )

      oBrwObr                 := IXBrowse():New( fldDirecciones )

      oBrwObr:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwObr:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwObr:cAlias          := dbfTmpObr
      oBrwObr:nMarqueeStyle   := 5
      oBrwObr:cName           := "Clientes.Obras"

       with object ( oBrwObr:AddCol() )
         :cHeader          := "Defecto"
         :bEditValue       := {|| ( dbfTmpObr )->lDefObr }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| ( dbfTmpObr )->cCodObr }
         :nWidth           := 60
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Nombre domicilio"
         :bEditValue       := {|| ( dbfTmpObr )->cNomObr }
         :nWidth           := 120
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfTmpObr )->cDirObr }
         :nWidth           := 120
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Poblaci�n"
         :bEditValue       := {|| ( dbfTmpObr )->cPobObr }
         :nWidth           := 100
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "C�digo postal"
         :bEditValue       := {|| ( dbfTmpObr )->cPosObr }
         :nWidth           := 60
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Provincia"
         :bEditValue       := {|| ( dbfTmpObr )->cPrvObr }
         :nWidth           := 80
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Tel�fono"
         :bEditValue       := {|| ( dbfTmpObr )->cTelObr }
         :nWidth           := 80
      end with

      with object ( oBrwObr:AddCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfTmpObr )->cFaxObr }
         :nWidth           := 80
      end with

      oBrwObr:bRClicked       := {| nRow, nCol, nFlags | oBrwObr:RButtonDown( nRow, nCol, nFlags ) }
      if nMode != ZOOM_MODE
         oBrwObr:bLDblClick   := {|| EdtObras( aTmp[ _COD ], nil, dbfTmpObr, oBrwObr, .t. ) }
      end if

      oBrwObr:CreateFromResource( 400 )

      /*
      Pesta�a de contactos-----------------------------------------------------
      */

      REDEFINE BITMAP oBmpContactos ;
         ID       600 ;
         RESOURCE "User_mobilephone_Alpha_48" ;
         TRANSPARENT ;
         OF       fldContactos

      REDEFINE BUTTON  ;
			ID 		500 ;
         OF       fldContactos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( AppContactos( aTmp[ _COD ], dbfTmpCon, oBrwCon ) )

      REDEFINE BUTTON ;
			ID 		501 ;
         OF       fldContactos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( EdtContactos( dbfTmpCon, oBrwCon ) )

      REDEFINE BUTTON ;
			ID 		502 ;
         OF       fldContactos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( DelContactos( dbfTmpCon, oBrwCon ) )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       fldContactos ;
         ACTION   ( ZoomContactos( dbfTmpCon, oBrwCon ) )

      oBrwCon                 := IXBrowse():New( fldContactos )

      oBrwCon:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwCon:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwCon:cAlias          := dbfTmpCon
      oBrwCon:nMarqueeStyle   := 5
      oBrwCon:cName           := "Clientes.Contactos"

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Nombre"
         :cSortOrder          := "cNomCon"
         :bEditValue          := {|| ( dbfTmpCon )->cNomCon }
         :nWidth              := 120
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Domicilio"
         :bEditValue          := {|| ( dbfTmpCon )->cDirCon }
         :nWidth              := 120
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Poblaci�n"
         :bEditValue          := {|| ( dbfTmpCon )->cPobCon }
         :nWidth              := 80
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "C�digo postal"
         :bEditValue          := {|| ( dbfTmpCon )->cPosCon }
         :nWidth              := 60
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Provincia"
         :bEditValue          := {|| ( dbfTmpCon )->cPrvCon }
         :nWidth              := 80
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Tel�fono"
         :bEditValue          := {|| ( dbfTmpCon )->cTelCon }
         :nWidth              := 80
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Movil"
         :bEditValue          := {|| ( dbfTmpCon )->cMovCon }
         :nWidth              := 80
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Fax"
         :lHide               := .t.
         :bEditValue          := {|| ( dbfTmpCon )->cFaxCon }
         :nWidth              := 80
      end with

      with object ( oBrwCon:AddCol() )
         :cHeader             := "Email"
         :bEditValue          := {|| ( dbfTmpCon )->cMaiCon }
         :nWidth              := 120
      end with

      oBrwCon:bRClicked       := {| nRow, nCol, nFlags | oBrwCon:RButtonDown( nRow, nCol, nFlags ) }
      if nMode != ZOOM_MODE
         oBrwCon:bLDblClick   := {|| EdtContactos( dbfTmpCon, oBrwCon ) }
      end if

      oBrwCon:CreateFromResource( 400 )

      /*
      Tercera pesta�a----------------------------------------------------------
      */

      REDEFINE BITMAP oBmpBancos ;
         ID       500 ;
         RESOURCE "Money_Alpha_48" ;
         TRANSPARENT ;
         OF       fldBancos

      REDEFINE BUTTON ;
         ID       101 ;
         OF       fldBancos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( WinAppRec( oBrwBnc, bEdtBnc, dbfTmpBnc, aTmp, , aTmp[ _COD ] ) )

      REDEFINE BUTTON ;
         ID       102 ;
         OF       fldBancos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( WinEdtRec( oBrwBnc, bEdtBnc, dbfTmpBnc, aTmp, , aTmp[ _COD ] ) )

      REDEFINE BUTTON ;
         ID       103 ;
         OF       fldBancos ;
         ACTION   ( WinZooRec( oBrwBnc, bEdtBnc, dbfTmpBnc ) )

      REDEFINE BUTTON ;
         ID       104 ;
         OF       fldBancos ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( DelBnc( aTmp, oBrwBnc, dbfTmpBnc ) )

      oBrwBnc                 := IXBrowse():New( fldBancos )

      oBrwBnc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwBnc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwBnc:cAlias          := dbfTmpBnc
      oBrwBnc:nMarqueeStyle   := 5
      oBrwBnc:cName           := "Clientes.Bancos"

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "D. Banco por defecto"
         :bEditValue       := {|| ( dbfTmpBnc )->lBncDef }
         :nWidth           := 16
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Nombre banco"
         :bEditValue       := {|| ( dbfTmpBnc )->cCodBnc }
         :nWidth           := 180
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Cuenta"
         :bEditValue       := {|| ( dbfTmpBnc )->cEntBnc + "-" + ( dbfTmpBnc )->cSucBnc + "-" + ( dbfTmpBnc )->cDigBnc + "-" + ( dbfTmpBnc )->cCtaBnc }
         :nWidth           := 150
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfTmpBnc )->cDirBnc }
         :nWidth           := 120
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Poblaci�n"
         :bEditValue       := {|| ( dbfTmpBnc )->cPobBnc }
         :nWidth           := 100
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "C�digo postal"
         :bEditValue       := {|| ( dbfTmpBnc )->cCPBnc }
         :nWidth           := 40
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Provincia"
         :bEditValue       := {|| ( dbfTmpBnc )->cProBnc }
         :nWidth           := 80
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Tel�fono"
         :bEditValue       := {|| ( dbfTmpBnc )->cTlfBnc }
         :nWidth           := 80
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfTmpBnc )->cFaxBnc }
         :nWidth           := 80
      end with

      with object ( oBrwBnc:AddCol() )
         :cHeader          := "Contacto"
         :bEditValue       := {|| ( dbfTmpBnc )->cPContBnc }
         :nWidth           := 140
      end with

      oBrwBnc:bRClicked       := {| nRow, nCol, nFlags | oBrwBnc:RButtonDown( nRow, nCol, nFlags ) }
      if nMode != ZOOM_MODE
         oBrwBnc:bLDblClick   := {|| WinEdtRec( oBrwBnc, bEdtBnc, dbfTmpBnc, aTmp, , aTmp[_COD] ) }
      end if

      oBrwBnc:CreateFromResource( 100 )

      /*
      Quinta caja de dialogo--------------------------------------------------
      */

      REDEFINE BITMAP oBmpContabilidad ;
         ID       500 ;
         RESOURCE "Folder2_red_Alpha_48" ;
         TRANSPARENT ;
         OF       fldContabilidad

      REDEFINE GET aGet[ _SUBCTA ] VAR aTmp[ _SUBCTA ] ;
         ID       350 ;
         PICTURE  ( Replicate( "X", nLenSubcuentaContaplus() ) ) ;
         WHEN     ( nLenCuentaContaplus() != 0 .AND. nMode != ZOOM_MODE ) ;
         BITMAP   "Lupa" ;
         ON HELP  ( BrwChkSubCta( aGet[_SUBCTA], oGetSubCta ) ) ;
         VALID    ( MkSubCta(  aGet[ _SUBCTA ],;
                               {  aTmp[ _SUBCTA    ],;
                                  aTmp[ _TITULO    ],;
                                  aTmp[ _NIF       ],;
                                  aTmp[ _DOMICILIO ],;
                                  aTmp[ _POBLACION ],;
                                  aTmp[ _PROVINCIA ],;
                                  aTmp[ _CODPOSTAL ],;
                                  aTmp[ _TELEFONO  ],;
                                  aTmp[ _FAX       ],;
                                  aTmp[ _CMEIINT   ] },;
                               oGetSubCta,;
                               nil,;
                               nil,;
                               @nGetDebe,;
                               @nGetHaber,;
                               oGetSaldo ) );
         OF       fldContabilidad

		REDEFINE GET oGetSubCta VAR cGetSubCta ;
			ID 		351 ;
         WHEN     .f. ;
         OF       fldContabilidad

      REDEFINE GET oGetSaldo VAR nGetSaldo ;
         ID       352 ;
         PICTURE  cPorDiv ;
         WHEN     .f. ;
         OF       fldContabilidad

      REDEFINE GET aGet[_CTAVENTA] VAR aTmp[_CTAVENTA] ;
			ID 		360 ;
			COLOR 	CLR_GET ;
         WHEN     ( nLenCuentaContaplus() != 0 .AND. nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwChkCta( aGet[_CTAVENTA], oGetCta ) ) ;
         VALID    ( ChkCta( aTmp[_CTAVENTA], oGetCta ) ) ;
         OF       fldContabilidad

		REDEFINE GET oGetCta VAR cGetCta ;
			ID 		361 ;
         WHEN     .f. ;
         OF       fldContabilidad

      /*
      Subcuenta dto -----------------------------------------------------------
      */

      REDEFINE GET aGet[_SUBCTADTO] VAR aTmp[_SUBCTADTO] ;
         ID       370 ;
			COLOR 	CLR_GET ;
         PICTURE  ( Replicate( "X", nLenSubcuentaContaplus() ) ) ;
         WHEN     ( nLenCuentaContaplus() != 0 .AND. nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwChkSubCta( aGet[_SUBCTADTO], oGetSubDto ) ) ;
         VALID    ( MkSubCta( aGet[ _SUBCTADTO ],;
                              {  aTmp[ _SUBCTADTO ],;
                                 aTmp[ _TITULO    ],;
                                 aTmp[ _NIF       ],;
                                 aTmp[ _DOMICILIO ],;
                                 aTmp[ _POBLACION ],;
                                 aTmp[ _PROVINCIA ],;
                                 aTmp[ _CODPOSTAL ],;
                                 aTmp[ _TELEFONO  ],;
                                 aTmp[ _FAX       ],;
                                 aTmp[ _CMEIINT   ] },;
                              oGetSubDto,;
                              nil,;
                              nil,;
                              nil,;
                              nil,;
                              oGetSalDto ) );
         OF       fldContabilidad

      REDEFINE GET oGetSubDto VAR cGetSubDto ;
         ID       371 ;
			COLOR 	CLR_GET ;
         WHEN     .F. ;
         OF       fldContabilidad

      REDEFINE GET oGetSalDto VAR nGetSalDto ;
         ID       372 ;
         PICTURE  cPorDiv ;
			COLOR 	CLR_GET ;
			WHEN 		.F. ;
         OF       fldContabilidad

      /*
      Diario de la subcuenta---------------------------------------------------
      */

      oBrwCta                 := IXBrowse():New( fldContabilidad )

      oBrwCta:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwCta:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwCta:cAlias          := dbfTmpSubCta
      oBrwCta:nMarqueeStyle   := 5
      oBrwCta:cName           := "Clientes.Contabilidad"
      oBrwCta:lFooter         := .t.

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Asiento"
         :bEditValue       := {|| Trans( ( dbfTmpSubCta )->nAsiento, "9999999" ) }
         :nWidth           := 80
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Fecha"
         :bEditValue       := {|| Dtoc( ( dbfTmpSubCta )->dFecha ) }
         :nWidth           := 80
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Concepto"
         :bEditValue       := {|| ( dbfTmpSubCta )->cConcepto }
         :nWidth           := 180
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Debe"
         :bEditValue       := {|| ( dbfTmpSubCta )->nDebe }
         :bFooter          := {|| nGetDebe }
         :cEditPicture     := cPorDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Haber"
         :bEditValue       := {|| ( dbfTmpSubCta )->nHaber }
         :bFooter          := {|| nGetHaber }
         :cEditPicture     := cPorDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Departamento"
         :bEditValue       := {|| ( dbfTmpSubCta )->cDeparta }
         :nWidth           := 80
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Factura"
         :bEditValue       := {|| Trans( ( dbfTmpSubCta )->nFactura, "99999999" ) }
         :nWidth           := 80
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := "Base"
         :bEditValue       := {|| ( dbfTmpSubCta )->nBase }
         :cEditPicture     := cPorDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwCta:AddCol() )
         :cHeader          := cImp()
         :bEditValue       := {|| ( dbfTmpSubCta )->nIva }
         :cEditPicture     := cPorDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      oBrwCta:bRClicked       := {| nRow, nCol, nFlags | oBrwCta:RButtonDown( nRow, nCol, nFlags ) }

      oBrwCta:CreateFromResource( 400 )

      /*
      Tercera caja de dialogo_______________________________________________
		*/

      REDEFINE BITMAP oBmpComentario ;
         ID       500 ;
         RESOURCE "Message_Alpha_48" ;
         TRANSPARENT ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _MCOMENT ] VAR aTmp[ _MCOMENT ];
			ID 		370 ;
			MEMO ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldDefinidos

      REDEFINE CHECKBOX aTmp[ _LMOSCOM ] ;
         ID       380 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       fldDefinidos

      REDEFINE SAY PROMPT aIniCli[1] ;
			ID 		105 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF01 ] VAR aTmp[ _CUSRDEF01 ] ;
			ID 		110 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[2] ;
			ID 		115 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF02 ] VAR aTmp[ _CUSRDEF02 ] ;
			ID 		120 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[3] ;
			ID 		125 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF03 ] VAR aTmp[ _CUSRDEF03 ] ;
			ID 		130 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[4] ;
			ID 		135 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF04 ] VAR aTmp[ _CUSRDEF04 ] ;
			ID 		140 ;
         OF       fldDefinidos

      REDEFINE SAY PROMPT aIniCli[5] ;
			ID 		145 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF05 ] VAR aTmp[ _CUSRDEF05 ] ;
			ID 		150 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[6] ;
			ID 		155 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF06 ] VAR aTmp[ _CUSRDEF06 ] ;
			ID 		160 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[7] ;
			ID 		165 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF07 ] VAR aTmp[ _CUSRDEF07 ] ;
			ID 		170 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[8] ;
			ID 		175 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF08 ] VAR aTmp[ _CUSRDEF08 ] ;
			ID 		180 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[9] ;
			ID 		185 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF09 ] VAR aTmp[ _CUSRDEF09 ] ;
			ID 		190 ;
         OF       fldDefinidos

		REDEFINE SAY PROMPT aIniCli[10] ;
			ID 		195 ;
         OF       fldDefinidos

      REDEFINE GET aGet[ _CUSRDEF10 ] VAR aTmp[ _CUSRDEF10 ] ;
			ID 		200 ;
         OF       fldDefinidos

		/*
      Quinta caja de dialogo__________________________________________________
		*/

      REDEFINE BITMAP oBmpTarifa ;
         ID       600 ;
         RESOURCE "Symbol_euro_Alpha_48" ;
         TRANSPARENT ;
         OF       fldTarifa

      REDEFINE BUTTON  ;
         ID       500 ;
         OF       fldTarifa ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE );
         ACTION   ( WinAppRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) )

      REDEFINE BUTTON  ;
         ID       501 ;
         OF       fldTarifa ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE );
         ACTION   ( WinEdtRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       fldTarifa ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE );
         ACTION   ( WinZooRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) )

      REDEFINE BUTTON  ;
         ID       502 ;
         OF       fldTarifa ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE );
         ACTION   ( WinDelRec( oBrwAtp, dbfTmpAtp ) )

      REDEFINE BUTTON ;
         ID       504 ;
         OF       fldTarifa ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE );
         ACTION   ( AddFamilia( oBrwAtp, dbfTmpAtp, aTmp[_COD] ) )

      REDEFINE BUTTON ;
         ID       505 ;
         OF       fldTarifa ;
         ACTION   ( Searching( dbfTmpAtp, { "Art�culo", "Familia" }, oBrwAtp ) )

#ifndef __TACTIL__

      REDEFINE BUTTON ;
         ID       506 ;
         OF       fldTarifa ;
         ACTION   ( TInfAtp():New( "Plantilla de condiciones especificas", , , , , , { dbfTmpAtp, aGet, aTmp } ):Play() )

#endif

      REDEFINE COMBOBOX oFiltroAtp VAR cFiltroAtp ;
         ID       507 ;
         ITEMS    aFiltroAtp ;
         ON CHANGE( FiltroAtipica( oFiltroAtp, dbfTmpAtp, oBrwAtp ) );
         OF       fldTarifa

      /*
      Diario de la subcuenta---------------------------------------------------
      */

      oBrwAtp                 := IXBrowse():New( fldTarifa )

      oBrwAtp:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwAtp:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwAtp:cAlias          := dbfTmpAtp
      oBrwAtp:nMarqueeStyle   := 6
      oBrwAtp:cName           := "Clientes.Atipicas"

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Tipo"
         :bEditValue       := {|| if( ( dbfTmpAtp )->nTipAtp <= 1, "Art�culo", "Familia" ) }
         :nWidth           := 60
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Of. Art�culo en oferta"
         :bEditValue       := {|| ( dbfTmpAtp )->nTipAtp <= 1 .and. lArticuloEnOferta( ( dbfTmpAtp )->cCodArt, ( dbfClient )->Cod, ( dbfClient )->cCodGrp ) }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| if( ( dbfTmpAtp )->nTipAtp <= 1, ( dbfTmpAtp )->cCodArt, ( dbfTmpAtp )->cCodFam ) }
         :nWidth           := 80
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Nombre"
         :bEditValue       := {|| if( ( dbfTmpAtp )->nTipAtp <= 1, RetArticulo( ( dbfTmpAtp )->cCodArt, dbfArticulo ), RetFamilia( ( dbfTmpAtp )->cCodFam, dbfFamilia ) ) }
         :nWidth           := 160
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Prop.1"
         :bEditValue       := {|| ( dbfTmpAtp )->cValPr1 }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Prop.2"
         :bEditValue       := {|| ( dbfTmpAtp )->cValPr2 }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar1", "Precio 1" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar2", "Precio 2" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt2 }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar3", "Precio 3" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt3 }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar4", "Precio 4" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt4 }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar5", "Precio 5" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt5 }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := uFieldEmpresa( "cTxtTar6", "Precio 6" )
         :bEditValue       := {|| ( dbfTmpAtp )->nPrcArt6 }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "% Descuento"
         :bEditValue       := {|| ( dbfTmpAtp )->nDtoArt }
         :cEditPicture     := "@E 999.99"
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Descuento lineal"
         :bEditValue       := {|| ( dbfTmpAtp )->nDtoDiv }
         :cEditPicture     := cPouDiv
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "% Agente"
         :bEditValue       := {|| ( dbfTmpAtp )->nComAge }
         :cEditPicture     := "@E 999.99"
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Inicio"
         :bEditValue       := {|| ( dbfTmpAtp )->dFecIni }
         :nWidth           := 80
      end with

      with object ( oBrwAtp:AddCol() )
         :cHeader          := "Fin"
         :bEditValue       := {|| ( dbfTmpAtp )->dFecFin }
         :nWidth           := 80
      end with

      if oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE
         oBrwAtp:bLDblClick   := {|| WinEdtRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) }
      end if
      oBrwAtp:bRClicked       := {| nRow, nCol, nFlags | oBrwAtp:RButtonDown( nRow, nCol, nFlags ) }

      oBrwAtp:CreateFromResource( 400 )

      /*
      Octava pesta�a-----------------------------------------------------------
      */

      REDEFINE BITMAP oBmpDocumentos ;
         ID       600 ;
         RESOURCE "Books_blue_Alpha_48" ;
         TRANSPARENT ;
         OF       fldDocumentos

      oBrwDoc                 := IXBrowse():New( fldDocumentos )

      oBrwDoc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwDoc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwDoc:cAlias          := dbfTmpDoc
      oBrwDoc:nMarqueeStyle   := 5
      oBrwDoc:cName           := "Clientes.Documentos"
      oBrwDoc:nRowHeight      := 38
      oBrwDoc:nDataLines      := 2

      with object ( oBrwDoc:AddCol() )
         :cHeader          := "Documento"
         :bEditValue       := {|| Rtrim( ( dbfTmpDoc )->cNombre ) + CRLF + Space( 5 ) + lTrim( ( dbfTmpDoc )->cRuta ) }
         :nWidth           := 480
      end with

      if ( nMode != ZOOM_MODE )
         oBrwDoc:bLDblClick   := {|| ShellExecute( oDlg:hWnd, "open", rTrim( ( dbfTmpDoc )->cRuta ) ) }
      end if
      oBrwDoc:bRClicked       := {| nRow, nCol, nFlags | oBrwDoc:RButtonDown( nRow, nCol, nFlags ) }

      oBrwDoc:CreateFromResource( 400 )

      REDEFINE BUTTON ;
         ID       500 ;
         OF       fldDocumentos ;
         WHEN     ( nMode != ZOOM_MODE );
         ACTION   ( WinAppRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) )

      REDEFINE BUTTON ;
         ID       501 ;
         OF       fldDocumentos ;
         WHEN     ( nMode != ZOOM_MODE );
         ACTION   ( WinEdtRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) )

      REDEFINE BUTTON ;
         ID       502 ;
         OF       fldDocumentos ;
         WHEN     ( nMode != ZOOM_MODE );
         ACTION   ( DbDelRec( oBrwDoc, dbfTmpDoc, nil, nil, .t. ) )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       fldDocumentos ;
         ACTION   ( WinZooRec( oBrwDoc, bEdtDoc, dbfTmpDoc ) )

      REDEFINE BUTTON ;
         ID       504 ;
         OF       fldDocumentos ;
         WHEN     ( nMode != ZOOM_MODE );
         ACTION   ( ShellExecute( oDlg:hWnd, "open", rTrim( ( dbfTmpDoc )->cRuta ) ) )

      /*
		Detalle________________________________________________________________
		*/

      REDEFINE BITMAP oBmpIncidencias ;
         ID       600 ;
         RESOURCE "Sign_warning_Alpha_48" ;
         TRANSPARENT ;
         OF       fldIncidencias

      oBrwInc                 := IXBrowse():New( fldIncidencias )

      oBrwInc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwInc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwInc:cAlias          := dbfTmpInc
      oBrwInc:nMarqueeStyle   := 5
      oBrwInc:cName           := "Clientes.Incidencias"

      with object ( oBrwInc:AddCol() )
         :cHeader          := "Rs. Resuelta"
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfTmpInc )->lListo }
         :nWidth           := 18
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrwInc:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodTip"
         :bEditValue       := {|| ( dbfTmpInc )->cCodTip }
         :nWidth           := 80
      end with

      with object ( oBrwInc:AddCol() )
         :cHeader          := "Incidencia"
         :bEditValue       := {|| cNomInci( ( dbfTmpInc )->cCodTip, dbfInci ) }
         :nWidth           := 180
      end with

      with object ( oBrwInc:AddCol() )
         :cHeader          := "Fecha"
         :cSortOrder       := "cCodCli"
         :bEditValue       := {|| Dtoc( ( dbfTmpInc )->dFecInc ) }
         :nWidth           := 80
      end with

      with object ( oBrwInc:AddCol() )
         :cHeader          := "Descripci�n"
         :bEditValue       := {|| ( dbfTmpInc )->mDesInc }
         :nWidth           := 300
      end with

      if nMode != ZOOM_MODE
         oBrwInc:bLDblClick   := {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) }
      end if
      oBrwInc:bRClicked       := {| nRow, nCol, nFlags | oBrwInc:RButtonDown( nRow, nCol, nFlags ) }

      oBrwInc:CreateFromResource( 400 )

      REDEFINE BUTTON ;
         ID       500 ;
         OF       fldIncidencias ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinAppRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) )

      REDEFINE BUTTON ;
         ID       501 ;
         OF       fldIncidencias ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) )

		REDEFINE BUTTON ;
			ID 		502 ;
         OF       fldIncidencias ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( DbDelRec( oBrwInc, dbfTmpInc, nil, nil, .t. ) )

		REDEFINE BUTTON ;
			ID 		503 ;
         OF       fldIncidencias ;
         ACTION   ( WinZooRec( oBrwInc, bEdtInc, dbfTmpInc ) )

      /*
      Observaciones de clientes------------------------------------------------
      */

      REDEFINE BITMAP oBmpObservaciones ;
         ID       600 ;
         RESOURCE "Information2_Alpha_48" ;
         TRANSPARENT ;
         OF       fldObservaciones

      DEFINE CLIPBOARD oClp OF fldObservaciones FORMAT TEXT

      REDEFINE BTNBMP oBtn[ 1 ] ;
         ID       100 ;
         WHEN     ( .t. ) ;
         OF       fldObservaciones ;
         RESOURCE "IMP16" ;
         NOBORDER ;
         TOOLTIP  "Imprimir" ;
         ACTION   ( oRTF:Print(), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 2 ] ;
         ID       110 ;
         WHEN     ( .t. ) ;
         OF       fldObservaciones ;
         RESOURCE "PREV116" ;
         NOBORDER ;
         TOOLTIP  "Previsualizar" ;
         ACTION   ( oRTF:Preview( "Class TRichEdit" ) )

      REDEFINE BTNBMP oBtn[ 3 ] ;
         ID       120 ;
         WHEN     ( .t. ) ;
         OF       fldObservaciones ;
         RESOURCE "Bus16" ;
         NOBORDER ;
         TOOLTIP  "Buscar" ;
         ACTION   ( FindRich( oRTF ) )

      REDEFINE BTNBMP oBtn[ 4 ] ;
         ID       130 ;
         WHEN     ( ! Empty( oRTF:GetSel() ) .and. ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Cut_16" ;
         NOBORDER ;
         TOOLTIP  "Cortar" ;
         ACTION   ( oRTF:Cut(), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 5 ] ;
         ID       140 ;
         WHEN     ( ! Empty( oRTF:GetSel() ) ) ;
         OF       fldObservaciones ;
         RESOURCE "Copy16" ;
         NOBORDER ;
         TOOLTIP  "Copiar" ;
         ACTION   ( oRTF:Copy(), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 6 ] ;
         ID       150 ;
         WHEN     ( ! Empty( oClp:GetText() ) .and. ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Paste_16" ;
         NOBORDER ;
         TOOLTIP  "Pegar" ;
         ACTION   ( oRTF:Paste(), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 7 ] ;
         ID       160 ;
         WHEN     ( oRTF:SendMsg( EM_CANUNDO ) != 0 ) ;
         OF       fldObservaciones ;
         RESOURCE "Undo1_16" ;
         NOBORDER ;
         TOOLTIP  "Deshacer" ;
         ACTION   ( oRTF:Undo(), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 8 ] ;
         ID       170 ;
         WHEN     ( oRTF:SendMsg( EM_CANREDO ) != 0 ) ;
         OF       fldObservaciones ;
         RESOURCE "Redo_16" ;
         NOBORDER ;
         TOOLTIP  "Rehacer" ;
         ACTION   ( oRTF:Redo(), oRTF:SetFocus() )

      REDEFINE COMBOBOX oZoom VAR cZoom ;
         ITEMS    aZoom ;
         ID       180 ;
         OF       fldObservaciones

      oZoom:bChange     := {|| oRTF:SetZoom( aRatio[ oZoom:nAt, 1 ], aRatio[ oZoom:nAt, 2 ] ), oRTF:SetFocus()  }

      REDEFINE COMBOBOX oFuente VAR cFuente ;
         ITEMS    aFuente ;
         ID       190 ;
         OF       fldObservaciones

      oFuente:bChange   := {|| oRTF:SetFontName( oFuente:VarGet() ), oRTF:SetFocus() }

      REDEFINE COMBOBOX oSize VAR cSize ;
         ITEMS    aSize ;
         ID       200 ;
         OF       fldObservaciones

      oSize:bChange     := {|| oRTF:SetFontSize( Val( oSize:VarGet() ) ), oRTF:SetFocus() }

      REDEFINE BTNBMP oBtn[10] ;
         ID       210 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Bold" ;
         NOBORDER ;
         TOOLTIP  "Negrita" ;
         ACTION   ( lBold  := !lBold, oRTF:SetBold( lBold ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 10 ] ;
         ID       220 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Italics_16" ;
         NOBORDER ;
         TOOLTIP  "Cursiva" ;
         ACTION   ( lItalic := !lItalic, oRTF:SetItalic( lItalic ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 11 ] ;
         ID       230 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Underlined_16" ;
         NOBORDER ;
         TOOLTIP  "Subrayado" ;
         ACTION   ( lUnderline := !lUnderline, oRTF:SetUnderline( lUnderline ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 12 ] ;
         ID       240 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Align_Left_16" ;
         NOBORDER ;
         TOOLTIP  "Izquierda" ;
         ACTION   ( oRTF:SetAlign( PFA_LEFT ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 13 ]  ;
         ID       250 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Center" ;
         NOBORDER ;
         TOOLTIP  "Centro" ;
         ACTION   ( oRTF:SetAlign( PFA_CENTER ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 14 ]  ;
         ID       260 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Align_Right_16" ;
         NOBORDER ;
         TOOLTIP  "Derecha" ;
         ACTION   ( oRTF:SetAlign( PFA_RIGHT ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 15 ] ;
         ID       270 ;
         WHEN     ( ! oRTF:lReadOnly ) ;
         OF       fldObservaciones ;
         RESOURCE "Text_Justified_16" ;
         NOBORDER ;
         TOOLTIP  "Justificado" ;
         ACTION   ( oRTF:SetAlign( PFA_JUSTIFY ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 16 ] ;
         ID       280 ;
         WHEN     ( ! oRTF:lReadOnly .AND. !oRTF:GetNumbering() ) ;
         OF       fldObservaciones ;
         RESOURCE "Pin_Blue_16" ;
         NOBORDER ;
         TOOLTIP  "Vi�etas" ;
         ACTION   ( lBullet := !lBullet, oRTF:SetBullet( lBullet ), oRTF:SetFocus() )

      REDEFINE BTNBMP oBtn[ 17 ] ;
         ID       290 ;
         WHEN     ( .t. ) ;
         OF       fldObservaciones ;
         RESOURCE "Calendar_16" ;
         NOBORDER ;
         TOOLTIP  "Fecha/Hora" ;
         ACTION   ( DateTimeRich( oRTF ) )

      REDEFINE RICHEDIT oRTF VAR cRTF ;
         ID       300 ;
         OF       fldObservaciones

      oRTF:bChange:= { || RTFRefreshButtons( oRtf, oBtn ) }

		/*
		Botones de la Caja de Dialogo__________________________________________
		*/

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
			ACTION 	( oDlg:end() )

      if nMode != ZOOM_MODE

         fldDirecciones:AddFastKey( VK_F2, {|| AppObras( aTmp[ _COD ], dbfTmpObr, oBrwObr ) } )
         fldDirecciones:AddFastKey( VK_F3, {|| EdtObras( aTmp[ _COD ], nil, dbfTmpObr, oBrwObr, .t. ) } )
         fldDirecciones:AddFastKey( VK_F4, {|| DelObras( dbfTmpObr, oBrwObr ) } )

         fldContactos:AddFastKey( VK_F2, {|| AppContactos( aTmp[ _COD ], dbfTmpCon, oBrwCon ) } )
         fldContactos:AddFastKey( VK_F3, {|| EdtContactos( dbfTmpCon, oBrwCon ) } )
         fldContactos:AddFastKey( VK_F4, {|| DelContactos( dbfTmpCon, oBrwCon ) } )

         fldBancos:AddFastKey( VK_F2, {|| WinAppRec( oBrwBnc, bEdtBnc, dbfTmpBnc, aTmp, , aTmp[ _COD ] ) } )
         fldBancos:AddFastKey( VK_F3, {|| WinEdtRec( oBrwBnc, bEdtBnc, dbfTmpBnc, aTmp, , aTmp[ _COD ] ) } )
         fldBancos:AddFastKey( VK_F4, {|| DelBnc( aTmp, oBrwBnc, dbfTmpBnc ) } )

         fldTarifa:AddFastKey( VK_F2, {|| WinAppRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) } )
         fldTarifa:AddFastKey( VK_F3, {|| WinEdtRec( oBrwAtp, bEdtAtp, dbfTmpAtp, aTmp, aGet ) } )
         fldTarifa:AddFastKey( VK_F4, {|| WinDelRec(  oBrwAtp, dbfTmpAtp ), oBrwAtp:Refresh() } )

         fldDocumentos:AddFastKey( VK_F2, {|| WinAppRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
         fldDocumentos:AddFastKey( VK_F3, {|| WinEdtRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
         fldDocumentos:AddFastKey( VK_F4, {|| DbDelRec(  oBrwDoc, dbfTmpDoc, nil, nil, .t. ) } )

         fldIncidencias:AddFastKey( VK_F2, {|| WinAppRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
         fldIncidencias:AddFastKey( VK_F3, {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
         fldIncidencias:AddFastKey( VK_F4, {|| DbDelRec( oBrwInc, dbfTmpInc, nil, nil, .t. ) } )

         oDlg:AddFastKey(             VK_F5, {|| SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) } )

      end if

   oDlg:bStart := { || ShowComentario( aTmp ), ShowInciCliente( aTmp[ _COD ], dbfCliInc ), ShowFld( aTmp, aGet ), FiltroAtipica( oFiltroAtp, dbfTmpAtp, oBrwAtp ), oGet:SetFocus(), oBrwBnc:Load(), oBrwObr:Load(), oBrwCta:Load(), oBrwAtp:Load() }

   ACTIVATE DIALOG oDlg ;
      ON INIT  ( EdtRotorMenu( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) ) ;
      VALID    ( KillTrans( oBmpDiv, oBrwBnc, oBrwObr, oBrwCta, oBrwAtp, oBrwInc, oBrwCon ) ) ;
      CENTER

   EndEdtRotorMenu()

   oBmpGeneral:End()
   oBmpComercial:End()
   oBmpDirecciones:End()
   oBmpContactos:End()
   oBmpBancos:End()
   oBmpContabilidad:End()
   oBmpComentario:End()
   oBmpTarifa:End()
   oBmpDocumentos:End()
   oBmpIncidencias:End()
   oBmpObservaciones:End()
   oBmpAutomaticas:End()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

function AddFacAut( oBrwFacAut )

   local cResultado  := ""

   cResultado := oFacAut:Buscar()

   if !Empty( cResultado )

      if aScan( aFacAut, cResultado ) == 0
         aAdd( aFacAut, cResultado )
      else
         MsgStop( "La plantilla autom�tica ya se encuentra introducida." )
      end if

   end if

   if !Empty( oBrwFacAut )
      oBrwFacAut:Refresh()
   end if

Return ( .t. )

//---------------------------------------------------------------------------//

function DelFacAut( oBrwFacAut )

   if ApoloMsgNoYes()
      aDel( aFacAut, oBrwFacAut:nArrayAt, .t. )
   end if

   if !Empty( oBrwFacAut )
      oBrwFacAut:Refresh()
   end if

Return ( .t. )

//---------------------------------------------------------------------------//

function ShowInciCliente( cCodCli, dbfInci )

   local nRec  := ( dbfInci )->( Recno() )

   if dbSeekInOrd( cCodCli, "CCODCLI", dbfInci )

      while ( dbfInci )->cCodCli == cCodCli .and. !( dbfInci )->( Eof() )

         if ( dbfInci )->lAviso .and. !( dbfInci )->lListo

            MsgInfo( AllTrim( ( dbfInci )->mDesInc ), "Incidencia de cliente" )

         end if

         ( dbfInci )->( dbSkip() )

      end while

   end if

   ( dbfInci )->( dbGoTo( nRec ) )

Return ( .t. )

//--------------------------------------------------------------------------//

static function ShowComentario( aTmp, nMode )

   if nMode != APPD_MODE         .and.;
      aTmp[ _LMOSCOM ]           .and.;
      !Empty( aTmp[ _MCOMENT ] )

      MsgInfo( AllTrim( aTmp[ _MCOMENT ] ), "Comentario" )

   end if

Return ( .t. )

//--------------------------------------------------------------------------//

Static Function lRecargaArray( aGet, aTmp )

   local aSbrAtp  := {}
   local nPosAtp  := aGet[ _NSBRATP ]:nAt

   aAdd( aSbrAtp, "Base" )
   aAdd( aSbrAtp, if( !Empty( aTmp[ _CDTOESP ] ), aTmp[ _CDTOESP ], "General" )      )
   aAdd( aSbrAtp, if( !Empty( aTmp[ _CDPP    ] ), aTmp[ _CDPP    ], "Pronto pago" )  )
   aAdd( aSbrAtp, if( !Empty( aTmp[ _CDTOUNO ] ), aTmp[ _CDTOUNO ], "Definido 1" )   )
   aAdd( aSbrAtp, if( !Empty( aTmp[ _CDTODOS ] ), aTmp[ _CDTODOS ], "Definido 2" )   )

   aGet[ _NSBRATP ]:SetItems( aSbrAtp )
   aGet[ _NSBRATP ]:Set( aSbrAtp[ Min( Max( nPosAtp, 1 ), len( aSbrAtp ) ) ] )

Return ( .t. )

//--------------------------------------------------------------------------//

Static Function EdtDoc( aTmp, aGet, dbfClientD, oBrw, bWhen, bValid, nMode, aTmpLin )

   local oDlg
   local oRuta
   local oNombre
   local oObservacion

   DEFINE DIALOG oDlg RESOURCE "DOCUMENTOS" TITLE LblTitle( nMode ) + "documento de pedidos de clientes"

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
      oDlg:AddFastKey( VK_F5,       {|| WinGather( aTmp, nil, dbfTmpDoc, oBrw, nMode ), oDlg:end( IDOK ) } )
   end if

   ACTIVATE DIALOG oDlg CENTER

Return ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

Static Function ShowFld( aTmp, aGet )

	local n

   for n := 1 TO 10
      if Empty( Rtrim( aIniCli[ n ] ) )
         aGet[ ( dbfClient )->( fieldpos( "cUsrDef" + Rjust( str( n ), "0", 2 ) ) ) ]:hide()
      end if
   next

   lRecargaArray( aGet, aTmp )

   /*
   Pasamos del campo memo de las observaciones al objeto richedit--------------
   */

   oRTF:LoadAsRTF( aTmp[ _MOBSERV ] )

   /*
   Validez para todos los controles--------------------------------------------
   */

   EvalGet( aGet )

Return nil

//--------------------------------------------------------------------------//

STATIC FUNCTION EdtAtp( aTmp, aGet, dbfTmpAtp, oBrw, aTmpCli, aGetCli, nMode )

   local oDlg
   local oFld
   local oGetArticulo
   local cGetArticulo
   local oGetFamilia
   local cGetFamilia
   local oSayPr1
   local oSayPr2
   local oSayVp1
   local oSayVp2
   local cSayPr1
   local cSayPr2
   local cSayVp1
   local cSayVp2
   local oCosto
   local cCosto
   local oSobre
   local cSobre         := "Precio 1"
   local aSobre         := { "Precio 1", "Precio 2", "Precio 3", "Precio 4", "Precio 5", "Precio 6" }
   local cNaturaleza    := "Art�culo"
   local aNaturaleza    := { "Art�culo", "Familia" }
   local oBrwRen
   local cPouEmp        := cPouDiv( cDivEmp(), dbfDiv )
   local cPouChg        := cPouDiv( cDivChg(), dbfDiv )
   local oBtnRen
   local oSayLabels     := Array( 16 )

   if nMode == APPD_MODE

      cCosto            := 0
      aTmp[ _aCCODCLI ] := aTmpCli[ _COD ]
      aTmp[ _aDFECINI ] := Ctod( "" )
      aTmp[ _aDFECFIN ] := Ctod( "" )
      aTmp[ _aLAPLPRE ] := .t.
      aTmp[ _aLAPLPED ] := .t.
      aTmp[ _aLAPLALB ] := .t.
      aTmp[ _aLAPLFAC ] := .t.
      aTmp[ _aNTIPXBY ] := 2
      aTmp[ _aNUNVOFE ] := 1
      aTmp[ _aNUNCOFE ] := 1

      if !Empty( aTmpCli[ _CAGENTE ] )
         if ( cAgente )->( dbSeek( aTmpCli[ _CAGENTE ] ) )
            aTmp[ _aNCOMAGE ]    := ( cAgente )->nCom1
            if ( cAgente )->nCom1 != 0
               aTmp[ _aLCOMAGE ] := .t.
            end if
         end if
      end if

   else

      cNaturaleza       := Max( Min( aTmp[ _aNTIPATP ], len( aNaturaleza ) ), 1 )

      cGetArticulo      := RetArticulo( aTmp[ _aCCODART ] )

      if !Empty( aTmp[ _aCCODPR1 ] )
         cSayPr1        := retProp( aTmp[ _aCCODPR1 ], dbfPro )
         cSayVp1        := retValProp( aTmp[ _aCCODPR1 ] + aTmp[ _aCVALPR1 ], dbfProL )
      end if

      if !Empty( aTmp[ _aCCODPR2 ] )
         cSayPr2        := retProp( aTmp[ _aCCODPR2 ], dbfPro )
         cSayVp2        := retValProp( aTmp[ _aCCODPR2 ] + aTmp[ _aCVALPR2 ], dbfProL )
      end if

      cGetFamilia       := retFld( aTmp[ _aCCODFAM ], dbfFamilia )

   end if

   DEFINE DIALOG oDlg RESOURCE "CLIATP" TITLE LblTitle( nMode ) + "tarifas de clientes"

      REDEFINE FOLDER oFld ;
         ID       100 ;
			OF 		oDlg ;
         PROMPT   "&General"  ,;
                  "A&mbito"   ;
         DIALOGS  "CLIATP_0"  ,;
                  "CLIATP_1"  ;

      REDEFINE COMBOBOX aGet[ _aNTIPATP ] VAR cNaturaleza ;
         ITEMS    aNaturaleza ;
         ID       90 ;
         ON CHANGE( ChangeNaturaleza( aGet, aTmp, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oCosto, nMode, oSayLabels ) ) ;
         WHEN     ( nMode == APPD_MODE ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _aCCODART ] VAR aTmp[ _aCCODART ];
			ID 		100 ;
         WHEN     ( nMode == APPD_MODE );
         ON HELP  ( BrwArticulo( aGet[ 2 ], oGetArticulo ) );
         BITMAP   "LUPA" ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         VALID    ( IsCliAtp( aGet, aTmp, oGetArticulo, dbfCliAtp, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oCosto ) ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oGetArticulo VAR cGetArticulo ;
			ID 		110 ;
			WHEN  	( .F. );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aCCODFAM ] VAR aTmp[ _aCCODFAM ];
         ID       105 ;
         WHEN     ( nMode == APPD_MODE );
         VALID    cFamilia( aGet[ _aCCODFAM ], dbfFamilia, oGetFamilia ) ;
         BITMAP   "LUPA" ;
         ON HELP  BrwFamilia( aGet[ _aCCODFAM ], oGetFamilia ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oGetFamilia VAR cGetFamilia ;
         ID       106 ;
         WHEN     ( .f. );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayPr1 VAR cSayPr1;
         ID       888 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aCVALPR1 ] VAR aTmp[ _aCVALPR1 ];
         ID       250 ;
         BITMAP   "LUPA" ;
         WHEN     ( nMode == APPD_MODE ) ;
         ON HELP  ( brwPrpAct( aGet[ _aCVALPR1 ], oSayVp1, aTmp[ _aCCODPR1 ] ) ) ;
         VALID    ( if( lPrpAct( aGet[ _aCVALPR1 ], oSayVp1, aTmp[ _aCCODPR1 ], dbfProL ),;
                    IsCliAtp( aGet, aTmp, oGetArticulo, dbfCliAtp, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oCosto ),;
                    .f. ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oSayVp1 VAR cSayVp1;
         ID       251 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayPr2 VAR cSayPr2;
         ID       999 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aCVALPR2 ] VAR aTmp[ _aCVALPR2 ];
         ID       260 ;
         BITMAP   "LUPA" ;
         WHEN     ( nMode == APPD_MODE ) ;
         ON HELP  ( brwPrpAct( aGet[ _aCVALPR2 ], oSayVp2, aTmp[ _aCCODPR2 ] ) ) ;
         VALID    ( if( lPrpAct( aGet[ _aCVALPR2 ], oSayVp2, aTmp[ _aCCODPR2 ], dbfProL ),;
                    IsCliAtp( aGet, aTmp, oGetArticulo, dbfCliAtp, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oCosto ),;
                    .f. ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oSayVp2 VAR cSayVp2;
         ID       261 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCCOM ] VAR aTmp[ _aNPRCCOM ];
         ID       120 ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         VALID    ( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         SPINNER  ;
         PICTURE  cPinDiv ;
         OF       oFld:aDialogs[1]

      REDEFINE CHECKBOX aGet[ _aLPRCCOM ] VAR aTmp[ _aLPRCCOM ] ;
         ID       122 ;
         ON CHANGE( lChangeCostoParticular( aGet, aTmp, oCosto, nMode ) );
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 1 ]

      REDEFINE GET oCosto VAR cCosto;
         ID       123 ;
         WHEN     ( .f. );
         SPINNER  ;
         PICTURE  cPinDiv ;
         OF       oFld:aDialogs[ 1 ]

      REDEFINE GET aGet[ _aNPRCART ] VAR aTmp[ _aNPRCART ];
         ID       121 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA1 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCART2 ] VAR aTmp[ _aNPRCART2 ];
         ID       124 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART2 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA2 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCART3 ] VAR aTmp[ _aNPRCART3 ];
         ID       125 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART3 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA3 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCART4 ] VAR aTmp[ _aNPRCART4 ];
         ID       126 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART4 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA4 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCART5 ] VAR aTmp[ _aNPRCART5 ];
         ID       127 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART5 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA5 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPRCART6 ] VAR aTmp[ _aNPRCART6 ];
         ID       128 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART6 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA6 ] ),lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      /*
      Precios con IGIC
      */

      REDEFINE GET aGet[ _aNPREIVA1 ] VAR aTmp[ _aNPREIVA1 ] ;
         ID       300 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA1 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPREIVA2 ] VAR aTmp[ _aNPREIVA2 ] ;
         ID       310 ;
         PICTURE  cPouDiv ;
         SPINNER ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA2 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART2 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPREIVA3 ] VAR aTmp[ _aNPREIVA3 ] ;
         ID       320 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA3 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART3 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPREIVA4 ] VAR aTmp[ _aNPREIVA4 ] ;
         ID       330 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA4 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART4 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPREIVA5 ] VAR aTmp[ _aNPREIVA5 ] ;
         ID       340 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA5 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART5 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNPREIVA6 ] VAR aTmp[ _aNPREIVA6 ] ;
         ID       350 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA6 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART6 ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTOART ] VAR aTmp[ _aNDTOART ];
			ID 		130 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[_aNDTOART] >= 0 .AND. aTmp[_aNDTOART] <= 100 ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ))  ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTODIV ] VAR aTmp[ _aNDTODIV ];
         ID       135 ;
         WHEN     ( nMode != ZOOM_MODE );
         SPINNER ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         VALID    ( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         PICTURE  cPouDiv ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_aNDPRART] VAR aTmp[_aNDPRART];
         ID       601 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[_aNDPRART] >= 0 .AND. aTmp[_aNDPRART] <= 100 ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) ) ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE CHECKBOX aTmp[ _aLCOMAGE ] ;
         ID       151 ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNCOMAGE ] VAR aTmp[ _aNCOMAGE ];
			ID 		150 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[_aNCOMAGE] >= 0 .AND. aTmp[_aNCOMAGE] <= 100 ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) ) ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GROUP oSayLabels[ 1 ]   ID 700 OF oFld:aDialogs[ 1 ] TRANSPARENT
      REDEFINE GROUP oSayLabels[ 2 ]   ID 701 OF oFld:aDialogs[ 1 ] TRANSPARENT
      REDEFINE GROUP oSayLabels[ 3 ]   ID 702 OF oFld:aDialogs[ 1 ] TRANSPARENT
      REDEFINE SAY   oSayLabels[ 4 ]   ID 703 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 5 ]   ID 704 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 6 ]   ID 705 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 7 ]   ID 706 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 8 ]   ID 707 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 9 ]   ID 708 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 10]   ID 709 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 11]   ID 710 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 12]   ID 711 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 13]   ID 712 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 14]   ID 713 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 15]   ID 714 OF oFld:aDialogs[ 1 ]
      REDEFINE GROUP oSayLabels[ 16]   ID 715 OF oFld:aDialogs[ 1 ] TRANSPARENT

      REDEFINE GET aGet[ _aNDTO1 ] VAR aTmp[ _aNDTO1 ];
         ID       400 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO1 ] >= 0 .AND. aTmp[ _aNDTO1 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTO2 ] VAR aTmp[ _aNDTO2 ];
         ID       410 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO2 ] >= 0 .AND. aTmp[ _aNDTO2 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTO3 ] VAR aTmp[ _aNDTO3 ];
         ID       420 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO3 ] >= 0 .AND. aTmp[ _aNDTO3 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTO4 ] VAR aTmp[ _aNDTO4 ];
         ID       430 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO4 ] >= 0 .AND. aTmp[ _aNDTO4 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTO5 ] VAR aTmp[ _aNDTO5 ];
         ID       440 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO5 ] >= 0 .AND. aTmp[ _aNDTO5 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _aNDTO6 ] VAR aTmp[ _aNDTO6 ];
         ID       450 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[ _aNDTO6 ] >= 0 .AND. aTmp[ _aNDTO6 ] <= 100 ) ) ;
         PICTURE  "@E 999.99";
         OF       oFld:aDialogs[1]

      /*
      Segunda caja de dialogo--------------------------------------------------
      */

      REDEFINE GET aGet[ _aDFECINI ] VAR aTmp[ _aDFECINI ];
         ID       160 ;
         WHEN     ( nMode != ZOOM_MODE );
         SPINNER ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _aDFECFIN ] VAR aTmp[ _aDFECFIN ];
         ID       170 ;
         WHEN     ( nMode != ZOOM_MODE );
         SPINNER ;
         OF       oFld:aDialogs[2]

      REDEFINE CHECKBOX aTmp[ _aLAPLPRE ] ;
         ID       180 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[2]

      REDEFINE CHECKBOX aTmp[ _aLAPLPED ] ;
         ID       190 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[2]

      REDEFINE CHECKBOX aTmp[ _aLAPLALB ] ;
         ID       200 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[2]

      REDEFINE CHECKBOX aTmp[ _aLAPLFAC ] ;
         ID       210 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[2]

      /*
      Ofertas de X*Y
      */

      REDEFINE RADIO aGet[ _aNTIPXBY ] VAR aTmp[ _aNTIPXBY ] ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE ) ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         ID       220, 221 ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _aNUNVOFE ] VAR aTmp[ _aNUNVOFE ] ;
         ID       230 ;
         PICTURE  "@E 999" ;
         SPINNER ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE ) ;
         VALID    ( isBig( aTmp[ _aNUNVOFE ], aTmp[ _aNUNCOFE ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) ) ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _aNUNCOFE ] VAR aTmp[ _aNUNCOFE ] ;
         ID       240 ;
         PICTURE  "@E 999" ;
         SPINNER ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and.  nMode != ZOOM_MODE ) ;
         VALID    ( isBig( aTmp[ _aNUNVOFE ], aTmp[ _aNUNCOFE ] ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) ) ;
         ON CHANGE( lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) );
         OF       oFld:aDialogs[2]

      /*
      Estudio rentabilidad - segunda pesta�a-----------------------------------
      */

      REDEFINE COMBOBOX oSobre VAR cSobre ;
         ITEMS    aSobre ;
         ID       400 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      oSobre:bChange := {|| lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) }

      REDEFINE LISTBOX oBrwRen ;
			FIELDS ;
                  if( aRentabilidad[ oBrwRen:nAt, 5 ], LoadBitmap( GetResources(), "BALERT" ), "" ) ,;
                  aRentabilidad[ oBrwRen:nAt, 1 ],;
                  aRentabilidad[ oBrwRen:nAt, 2 ],;
                  if( !aRentabilidad[ oBrwRen:nAt, 4 ], Trans( aRentabilidad[ oBrwRen:nAt, 3 ], cPouEmp ), Trans( aRentabilidad[ oBrwRen:nAt, 3 ], "999.99" ) + " %" ),;
                  if( !aRentabilidad[ oBrwRen:nAt, 4 ], Trans( nCnv2Div( aRentabilidad[ oBrwRen:nAt, 3 ], cDivEmp(), cDivChg(), dbfDiv ), cPouChg ), "" ),;
                  "";
         HEAD ;
                  "",;
                  "Naturaleza",;
                  "Tipo",;
                  "Importe " + cDivEmp(),;
                  "Importe " + cDivChg(),;
                  "";
			FIELDSIZES;
                  16,;
                  97,;
                  48,;
                  70,;
                  70,;
                  10;
         ID       450 ;
         OF       oDlg

         oBrwRen:SetArray( aRentabilidad )
         oBrwRen:nClrText       := { || if( aRentabilidad[ oBrwRen:nAt, 3 ] < 0 , CLR_HRED, CLR_BLACK ) }
         oBrwRen:aJustify       := { .f., .f., .t., .t., .t., .f. }

      /*
      Botones comunes de la caja de di�logo
      */

      REDEFINE BUTTON oBtnRen ;
         ID       600 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( lExpandir( oDlg, oBtnRen ), lArrayRen( oSobre:nAt, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto ) )

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( SaveEdtAtp( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode ) )

      REDEFINE BUTTON ;
         ID       550 ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   if nMode != ZOOM_MODE
   oDlg:AddFastKey( VK_F5, {|| SaveEdtAtp( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode ) } )
   end if

   oDlg:bStart    := {|| StartEdtAtp( aTmp, aGet, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oSayLabels, oCosto, oBtnRen ) }

   ACTIVATE DIALOG oDlg CENTER ;
         ON INIT  ( lExpandir( oDlg, oBtnRen, .f. ), if( nMode != APPD_MODE, aGet[ _aCCODART ]:lValid(), ), EdtDetMenu( aGet[ _aCCODART ], oDlg, lArticuloEnOferta( aTmp[ _aCCODART ], aTmpCli[ _COD ], aTmpCli[ _CCODGRP ] ) ) )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function StartEdtAtp( aTmp, aGet, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oSayLabels, oCosto, oBtnRen )

   cValoresProp( aTmp, aGet, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2 )

   if !lUsrMaster()
      oBtnRen:Hide()
   else
      oBtnRen:Show()
   end if

   lChangeCostoParticular( aGet, aTmp, oCosto, nMode )

   if aGet[ _aNTIPATP ]:nAt == 1
      aGet[ _aCCODART ]:SetFocus()
   else
      aGet[ _aCCODFAM ]:SetFocus()
   end if

   ChangeNaturaleza( aGet, aTmp, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oCosto, nMode, oSayLabels, .t. )

Return nil

//---------------------------------------------------------------------------//

Static Function lExpandir( oDlg, oBtn, lSet )

   local oRect    := oDlg:GetRect()

   if lSet != nil
      lExpandida  := lSet
   end if

   if lExpandida
      SetWindowText( oBtn:hWnd, "Retabilidad <" )
      oDlg:Move( oRect:nTop, oRect:nLeft, 800, 522, .t. )
   else
      SetWindowText( oBtn:hWnd, "Retabilidad >" )
      oDlg:Move( oRect:nTop, oRect:nLeft, 463, 522, .t. )
   end if

   lExpandida  := !lExpandida

return .t.

//---------------------------------------------------------------------------//

Static Function cValoresProp( aTmp, aGet, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2 )

   if nMode == APPD_MODE

      oSayPr1:Hide()
      oSayPr2:Hide()
      oSayVp1:Hide()
      oSayVp2:Hide()
      aGet[ _aCVALPR1 ]:Hide()
      aGet[ _aCVALPR2 ]:Hide()

   else

      if aTmp[ _aNTIPATP ] == 2

         oSayPr1:Hide()
         oSayVp1:Hide()
         aGet[ _aCVALPR1 ]:Hide()
         oSayPr2:Hide()
         oSayVp2:Hide()
         aGet[ _aCVALPR2 ]:Hide()

      else

         if Empty( aTmp[ _aCCODPR1 ] )
            oSayPr1:Hide()
            oSayVp1:Hide()
            aGet[ _aCVALPR1 ]:Hide()
         else
            oSayPr1:Show()
            oSayVp1:Show()
            aGet[ _aCVALPR1 ]:Show()
            oSayPr1:Disable()
         end if

         if Empty( aTmp[ _aCCODPR2 ] )
            oSayPr2:Hide()
            oSayVp2:Hide()
            aGet[ _aCVALPR2 ]:Hide()
         else
            oSayPr2:Disable()
            oSayPr2:Show()
            oSayVp2:Show()
            aGet[ _aCVALPR2 ]:Show()
         end if

      end if

   end if

Return nil

//---------------------------------------------------------------------------//

STATIC FUNCTION GenReport( dbfClient, oWndBrw )

	local oDlg
	local oSayDesde
	local cSayDesde
	local oSayHasta
	local cSayHasta
	local oCliDesde
   local oCliHasta
   local oFlt
   local nFont       := 12
   local nOrden      := 1
	local cPostal		:= Space( 7 )
	local nRecno  		:= ( dbfClient )->( RecNo() )
	local cTag    		:= ( dbfClient )->( OrdSetFocus() )
	local cCliDesde	:= dbFirst( dbfClient, 1 )
	local cCliHasta	:= dbLast(  dbfClient, 1 )
   local cTitulo     := Padr( cCodEmp() + " - " + cNbrEmp(), 100 )
	local cSubTitulo	:= Padr( "Listado de Clientes", 100 )
   local alOption    := { .f., .t., .f., .t. }

	/*
	Llamada a la funcion que activa la caja de dialogo
	*/

	DEFINE DIALOG oDlg RESOURCE "REP_CLIENT"

	REDEFINE RADIO nOrden ;
		ID 		100, 101 ;
		ON CHANGE( ( dbfClient )->( OrdSetFocus( nOrden ) ),;
						oSayDesde:cText( dbFirst( dbfClient, _TITULO ) ),;
						oSayHasta:cText( dbLast(  dbfClient, _TITULO ) ),;
						oCliDesde:cText( dbFirst( dbfClient, _COD ) ),;
						oCliHasta:cText( dbLast(  dbfClient, _COD ) ) );
		OF 		oDlg

	REDEFINE GET oCliDesde VAR cCliDesde ;
		ID 		110 ;
		WHEN		( nOrden == 1 );
		VALID 	( cClient( oCliDesde, dbfClient, oSayDesde ) );
      ON HELP  ( BrwCli( oCliDesde, oSayDesde, dbfClient ) );
      BITMAP   "LUPA" ;
      COLOR    CLR_GET ;
		OF 		oDlg

	REDEFINE GET oSayDesde VAR cSayDesde ;
      ID       120 ;
      WHEN     ( nOrden == 2 );
      ON HELP  ( BrwCli( oCliDesde, oSayDesde, dbfClient ) );
      BITMAP   "LUPA" ;
      COLOR    CLR_GET ;
		OF 		oDlg

	REDEFINE GET oCliHasta VAR cCliHasta ;
		ID 		130 ;
		WHEN		( nOrden == 1 );
		VALID 	( cClient( oCliHasta, dbfClient, oSayHasta ) );
      ON HELP  ( BrwCli( oCliHasta, oSayHasta, dbfClient ) );
      BITMAP   "LUPA" ;
      COLOR    CLR_GET ;
		OF 		oDlg

	REDEFINE GET oSayHasta VAR cSayHasta ;
		WHEN		( nOrden == 2 );
		ID 		140 ;
      ON HELP  ( BrwCli( oCliHasta, oSayHasta, dbfClient ) );
      BITMAP   "LUPA" ;
      COLOR    CLR_GET ;
		OF 		oDlg

	REDEFINE GET cPostal ;
		ID 		150 ;
		OF 		oDlg

   REDEFINE GET nFont ;
		PICTURE	"@E 99" ;
		SPINNER ;
		MIN 6 MAX 72 ;
		VALID		nFont >= 6 .AND. nFont <= 72 ;
      ID       155 ;
		OF 		oDlg

   REDEFINE CHECKBOX alOption[1] ;
		ID 		160 ;
		OF 		oDlg

   REDEFINE CHECKBOX alOption[2] ;
      ID       161 ;
		OF 		oDlg

   REDEFINE CHECKBOX alOption[3] ;
      ID       162 ;
		OF 		oDlg

   REDEFINE CHECKBOX alOption[4] ;
      ID       163 ;
		OF 		oDlg

	REDEFINE GET cTitulo ;
		ID 		170 ;
		OF 		oDlg

	REDEFINE GET cSubTitulo ;
		ID 		180 ;
		OF 		oDlg

	REDEFINE BUTTON ;
		ID 		531 ;
		OF 		oDlg ;
      ACTION   ( oFlt   := TDlgFlt():New( aItmCli(), dbfClient ):Resource() )

	REDEFINE BUTTON ;
		ID 		508;
		OF 		oDlg ;
		ACTION 	( 	IF ( nOrden == 1,;
                     PrnReport( cCliDesde, cCliHasta, cPostal, oFlt, cTitulo, cSubTitulo, 1, alOption, nFont ),;
                     PrnReport( cSayDesde, cSayHasta, cPostal, oFlt, cTitulo, cSubTitulo, 1, alOption, nFont ) );
					)

	REDEFINE BUTTON ;
		ID 		505;
		OF 		oDlg ;
		ACTION 	( 	IF ( nOrden == 1,;
                     PrnReport( cCliDesde, cCliHasta, cPostal, oFlt, cTitulo, cSubTitulo, 2, alOption, nFont ),;
                     PrnReport( cSayDesde, cSayHasta, cPostal, oFlt, cTitulo, cSubTitulo, 2, alOption, nFont ) );
					)

	REDEFINE BUTTON ;
		ID 		510;
		OF 		oDlg ;
		ACTION 	( oDlg:end() )

	ACTIVATE DIALOG oDlg CENTER ;
		ON PAINT ( oCliDesde:lValid(), oCliHasta:lValid() )

	( dbfClient )->( OrdSetFocus( cTag ) )
	( dbfClient )->( dbGoto( nRecno ) )

	IF oWndBrw != NIL
		oWndBrw:refresh()
	END IF

RETURN ( oDlg:nResult == IDOK )

//------------------------------------------------------------------------//

STATIC FUNCTION PrnReport( cCliDesde, cCliHasta, cPostal, oFlt, cTitulo, cSubTitulo, nDevice, alOption, nFont )

   local oReport
   local oFont1   := TFont():New( "Courier New", 0, - ( nFont ), .f., .t. )
   local oFont2   := TFont():New( "Courier New", 0, - ( nFont ), .f., .f. )

	/*
	Posicionamos en el primer registro
	*/

	( dbfClient )->( DbSeek( cCliDesde ) )

	IF nDevice == 1

		REPORT oReport ;
				TITLE  	Rtrim( cTitulo ),;
							Rtrim( cSubTitulo ) ;
				FONT   	oFont1, oFont2 ;
				HEADER 	"Fecha: " + dtoc(date()) RIGHT ;
            FOOTER   "P�gina : " + str( oReport:nPage, 3 ) CENTERED;
            CAPTION  "Listado de clientes";
				PREVIEW

	ELSE

		REPORT oReport ;
				TITLE  	Rtrim( cTitulo ),;
							Rtrim( cSubTitulo ) ;
				FONT   	oFont1, oFont2 ;
            HEADER   "Fecha: " + dtoc( date() ) RIGHT ;
            FOOTER   "P�gina : " + str( oReport:nPage, 3 ) CENTERED ;
            CAPTION  "Listado de clientes";
				TO PRINTER

	END IF

		COLUMN TITLE "Codg." ;
				DATA (dbfClient)->COD ;
				SIZE 10 ;
				FONT 2

      COLUMN TITLE "Nombre", "Contacto", If( alOption[1], "D.N.I. / C.I.F.", "" ) ;
            DATA  (dbfClient)->Titulo,;
                  (dbfClient)->cPerCto,;
                   If( alOption[1], (dbfClient)->NIF, "" ) ;
            SIZE 44 ;
				FONT 2

      COLUMN TITLE "Domicilio", "Poblaci�n", "Cod.Pos. - Provincia" ;
            DATA  (dbfClient)->DOMICILIO,;
                  (dbfClient)->POBLACION,;
                  (dbfClient)->CODPOSTAL + " - " + (dbfClient)->PROVINCIA;
            SIZE  60 ;
            FONT  2

      IF alOption[2]

         COLUMN TITLE "Tel�fono", "M�vil", "Fax" ;
            DATA  ( dbfClient)->Telefono,;
                  ( dbfClient)->Movil   ,;
                  ( dbfClient)->Fax      ;
            SIZE  18 ;
            FONT  2

      END IF

      IF alOption[3]

         COLUMN TITLE "Riesgo" ;
            DATA  Trans( ( dbfClient )->Riesgo, cPorDiv ) ;
            SIZE  18 ;
            FONT  2

      END IF

      IF alOption[4]

         COLUMN TITLE "Cuenta" ;
            DATA  Trans( cClientCuenta( dbfClient ), "@R ####-####-##-##########" ) ;
            SIZE  20 ;
            FONT  2

      END IF

		END REPORT

      IF !Empty( oReport ) .and. oReport:lCreated
			oReport:Margin(0, RPT_RIGHT, RPT_CMETERS)
         oReport:bSkip        := {|| (dbfClient)->(DbSkip()) }
         oReport:lSeparator   := .t.
		END IF

      ACTIVATE REPORT oReport ;
         FOR            ( dbfClient )->( OrdKeyVal() ) >= cCliDesde                 .AND.;
                        ( dbfClient )->( OrdKeyVal() ) <= cCliHasta                 .AND.;
                        IF( !empty( oFlt ) .and. !empty( oFlt:bExpFilter ), ( dbfClient )->( eval( oFlt:bExpFilter ) ), .t. )  .AND.;
                        IF( empty( cPostal ), .t., ( dbfClient )->CodPostal == cPostal ) ;
         WHILE          !( dbfClient )->( eof() )

	oFont1:end()
	oFont2:end()

   if !Empty( oReport )
      oReport:End()
   end if

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION BrwCli( oGet, oGet2, dbfClient )

   local oDlg
	local oBrw
   local hBmp
	local oGet1
	local cGet1
   local nOrd     := GetBrwOpt( "BrwCli" )
	local oCbxOrd
   local aCbxOrd  := { "C�digo", "Nombre", "NIF/CIF", "Poblaci�n", "Provincia", "C�digo postal", "Tel�fono", "Establecimiento", "Correo electr�nico" }
   local cCbxOrd
   local cReturn  := Space( 12 )

   nOrd           := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd        := aCbxOrd[ nOrd ]

   nOrd           := ( dbfClient )->( OrdSetFocus( nOrd ) )

   ( dbfClient )->( dbGoTop() )

   DEFINE DIALOG oDlg RESOURCE "HelpEntry" TITLE "Seleccionar clientes"

		REDEFINE GET oGet1 VAR cGet1;
			ID 		104 ;
			ON CHANGE AutoSeek( nKey, nFlags, Self, oBrw, dbfClient ) ;
         BITMAP   "FIND" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ( dbfClient )->( OrdSetFocus( oCbxOrd:nAt ) ), oBrw:Refresh(), oGet1:SetFocus() ) ;
			OF 		oDlg

      oBrw                 := IXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfClient
      oBrw:nMarqueeStyle   := 5
      oBrw:cName           := "Browse.Clientes.Report"

      with object ( oBrw:AddCol() )
         :cHeader          := "Bl. Bloqueado"
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->lBlqCli }
         :nWidth           := 20
         :SetCheck( { "Cnt16", "Nil16" } )
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "Cod"
         :bEditValue       := {|| ( dbfClient )->Cod }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "Titulo"
         :bEditValue       := {|| ( dbfClient )->Titulo }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "NIF/CIF"
         :cSortOrder       := "Nif"
         :bEditValue       := {|| ( dbfClient )->Nif }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Tel�fono"
         :cSortOrder       := "Telefono"
         :bEditValue       := {|| ( dbfClient )->Telefono }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfClient )->Fax }
         :nWidth           := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfClient )->Domicilio }
         :nWidth           := 300
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Poblaci�n"
         :cSortOrder       := "Poblacion"
         :bEditValue       := {|| ( dbfClient )->Poblacion }
         :nWidth           := 200
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo postal"
         :cSortOrder       := "CodPostal"
         :bEditValue       := {|| ( dbfClient )->CodPostal }
         :nWidth           := 60
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Provincia"
         :cSortOrder       := "Provincia"
         :bEditValue       := {|| ( dbfClient )->Provincia }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Establecimiento"
         :cSortOrder       := "NbrEst"
         :bEditValue       := {|| ( dbfClient )->NbrEst }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Correo electr�nico"
         :cSortOrder       := "cMeiInt"
         :bEditValue       := {|| ( dbfClient )->cMeiInt }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Riesgo"
         :bEditValue       := {|| Trans( ( dbfClient )->Riesgo, PicOut() ) }
         :nWidth           := 60
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Contacto"
         :bEditValue       := {|| ( dbfClient )->cPerCto }
         :nWidth           := 100
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Observaciones"
         :bEditValue       := {|| ( dbfClient )->mComent }
         :nWidth           := 200
      end with

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }
      oBrw:bRClicked       := {| nRow, nCol, nFlags | oBrw:RButtonDown( nRow, nCol, nFlags ) }

      oBrw:CreateFromResource( 105 )

		REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:end(IDOK) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

      REDEFINE BUTTON ;
			ID 		500 ;
			OF 		oDlg ;
         WHEN     .f. ;
         ACTION   ( nil )

		REDEFINE BUTTON ;
			ID 		501 ;
			OF 		oDlg ;
         WHEN     .f. ;
         ACTION   ( nil )

   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )

   oDlg:bStart                := {|| oBrw:Load() }

   ACTIVATE DIALOG oDlg CENTER

   CursorWait()

   if oDlg:nResult == IDOK

      cReturn  := ( dbfClient )->Cod

      if !Empty( oGet )
         oGet:cText( ( dbfClient )->Cod )
         oGet:lValid()
      end if

      if ValType( oGet2 ) == "O"
         oGet2:cText( ( dbfClient )->Titulo )
         if ( dbfClient )->nColor != 0
            oGet2:SetColor( , ( dbfClient )->nColor )
         end if
      end if

   end if

   SetBrwOpt( "BrwCli", ( dbfClient )->( OrdNumber() ) )

   ( dbfClient )->( OrdSetFocus( nOrd ) )

   if !Empty( oBrw )
      oBrw:end()
   end if

   CursorWE()

   if !Empty( oGet )
      oGet:SetFocus()
   end if

RETURN cReturn

//---------------------------------------------------------------------------//

/*
Devuelve la cuenta del banco cliente
*/

FUNCTION cCtaBanCli( cCodCli, dbfBanco )

   local nRec
   local oBlock
   local oError
   local nOrdAnt
   local cText    := ""
   local lClose   := .f.

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfBanco )
      USE ( cPatCli() + "CliBnc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIBNC", @dbfBanco ) )
      SET ADSINDEX TO ( cPatCli() + "CliBnc.Cdx" ) ADDITIVE
      SET TAG TO CCODDEF
      lClose      := .t.
   else
      nRec        := ( dbfBanco )->( Recno() )
      nOrdAnt     := ( dbfBanco )->( OrdSetFocus( "cCodDef" ) )
   end if

   if ( dbfBanco )->( dbSeek( cCodCli ) )
      cText       := ( dbfBanco )->cCtaBnc
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de bancos" )

   END SEQUENCE
   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfBanco )
   else
      ( dbfBanco )->( OrdSetFocus( nOrdAnt ) )
      ( dbfBanco )->( dbGoTo( nRec ) )
   end if

Return ( cText )

//---------------------------------------------------------------------------//

/*
Devuelve la cuenta contable de un cliente
*/

FUNCTION cCliCta( cCodCli, dbfClient )

   local oBlock
   local oError
   local cText    := ""
   local lClose   := .f.

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfClient )
      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      cText       := Rtrim( ( dbfClient )->SubCta )
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de clientes" )

   END SEQUENCE
   ErrorBlock( oBlock )

	IF lClose
		CLOSE ( dbfClient )
	END IF

RETURN cText

//---------------------------------------------------------------------------//

/*
Devuelve la cuenta de Venta de un cliente
*/

FUNCTION cCliCtaVta( cCodCli, dbfClient )

   local oBlock
   local oError
   local lClose      := .f.
   local cCliCtaVta  := ""

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfClient )
      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
      lClose         := .t.
   end if

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      cCliCtaVta     := ( dbfClient )->CtaVenta
   end if

   if Empty( cCliCtaVta )
      cCliCtaVta     := cCtaCli()
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de clientes" )

   END SEQUENCE
   ErrorBlock( oBlock )

   if lClose
		CLOSE ( dbfClient )
   end if

RETURN ( cCliCtaVta )

//---------------------------------------------------------------------------//

FUNCTION cBanco( cCodCli, dbfClient )

   local oBlock
   local oError
   local cText    := ""
   local lClose   := .f.

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfClient )
      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   IF ( dbfClient )->( dbSeek( Rjust( cCodCli, "0" ) ) )
      cText       := ( dbfClient )->Banco
	END IF

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de clientes" )

   END SEQUENCE
   ErrorBlock( oBlock )

	IF lClose
		CLOSE ( dbfClient )
	END IF

RETURN cText

//---------------------------------------------------------------------------//

FUNCTION lCliCreditoSolicitado( cCodCli, dbfClient )

   local lRet     := .f.

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      lRet        := ( dbfClient )->lCreSol
   end if

RETURN lRet

//---------------------------------------------------------------------------//

/*
Chequea las cuentas de contaplus
*/

STATIC FUNCTION ChkAllSubCta()

   local oDlg
   local cArea
   local nRecno      := ( dbfClient )->( RecNo() )
   local cTag        := ( dbfClient )->( OrdSetFocus( 1 ) )
   local cRuta       := cRutCnt()
   local cCodEmp     := cEmpCnt( "A" )
   local oChkCreate
   local lChkCreate  := .f.
   local oChkCuenta
   local lChkCuenta  := .f.
   local aMsg        := {}
   local oTree
   local cCliOrg
   local cCliDes
   local oCliOrg
   local oCliDes
   local oSayCliOrg
   local oSayCliDes
   local cSayCliOrg
   local cSayCliDes
   local oImageList

   if Empty( cRuta ) .or. Empty( cCodEmp )
      msgStop( "No existe enlace a contaplus �" )
      return .f.
   end if

   if !OpenSubCuenta( cRuta, cCodEmp, @cArea, .f. )
      msgStop( "Imposible acceder a ficheros de contaplus �" )
      return .t.
   end if

   /*
	Obtenemos los valores del primer y ultimo codigo
	*/

   cCliOrg           := dbFirst( dbfClient, 1 )
   cCliDes           := dbLast(  dbfClient, 1 )
   cSayCliOrg        := dbFirst( dbfClient, 2 )
   cSayCliDes        := dbLast(  dbfClient, 2 )

   oImageList        := TImageList():New( 16, 16 )
   oImageList:AddMasked( TBitmap():Define( "bRed" ),     Rgb( 255, 0, 255 ) )
   oImageList:AddMasked( TBitmap():Define( "bGreen" ),   Rgb( 255, 0, 255 ) )

   /*
   Llamada a la funcion que activa la caja de dialogo--------------------------
	*/

   DEFINE DIALOG oDlg RESOURCE "ChkAllSubCta"

   /*
   Monta los clientes----------------------------------------------------------
   */

   REDEFINE GET oCliOrg VAR cCliOrg;
      ID       80 ;
      VALID    cClient( oCliOrg, dbfClient, oSayCliOrg );
      BITMAP   "LUPA" ;
      ON HELP  BrwCli( oCliOrg, oSayCliOrg, dbfClient );
      OF       oDlg

   REDEFINE GET oSayCliOrg VAR cSayCliOrg ;
      WHEN     .f.;
      ID       81 ;
      OF       oDlg

   REDEFINE GET oCliDes VAR cCliDes;
      ID       90 ;
      VALID    cClient( oCliDes, dbfClient, oSayCliDes );
      BITMAP   "LUPA" ;
      ON HELP  BrwCli( oCliDes, oSayCliDes, dbfClient );
      OF       oDlg

   REDEFINE GET oSayCliDes VAR cSayCliDes ;
      WHEN     .f.;
      ID       91 ;
      OF       oDlg

   REDEFINE CHECKBOX oChkCreate VAR lChkCreate ;
      ID       100 ;
		OF 		oDlg

   REDEFINE CHECKBOX oChkCuenta VAR lChkCuenta ;
      ID       110 ;
		OF 		oDlg

   oTree       := TTreeView():Redefine( 170, oDlg )

   REDEFINE BUTTON ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   ( MakAllSubCta( cCliOrg, cCliDes, lChkCuenta, lChkCreate, cArea, aMsg, oTree, oDlg ) )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      CANCEL ;
      ACTION   ( oDlg:end() )

   ACTIVATE DIALOG oDlg ;
      CENTER ;
      ON INIT  ( oTree:SetImageList( oImageList ) )

	( dbfClient )->( dbGoTo( nRecno ) )
	( dbfClient )->( OrdSetFocus( cTag ) )

   CLOSE ( cArea )

   oImageList:End()

   oTree:Destroy()

   oWndBrw:oBrw:SetFocus()
   oWndBrw:oBrw:Refresh()

return .t.

//-------------------------------------------------------------------------//

Static Function MakAllSubCta( cCliOrg, cCliDes, lChkCuenta, lChkCreate, cArea, aMsg, oTree, oDlg )

   local nLen
   local oItem

   oDlg:Disable()

   oTree:DeleteAll()

   nLen              := nLenCuentaContaplus()

   if ( dbfClient )->( dbSeek( cCliOrg ) )

      while ( dbfClient )->Cod <= cCliDes .and. !( dbfClient )->( Eof() )

         if Empty( AllTrim( ( dbfClient )->SubCta ) ) .and. lChkCuenta
            if dbLock( dbfClient )
               ( dbfClient )->SubCta      := "430" + Right( Rtrim( ( dbfClient )->Cod ), nLen )
               ( dbfClient )->( dbUnLock() )
            end if
         end if

         if !Empty( AllTrim( ( dbfClient )->SubCta ) )

            if !( cArea )->( dbSeek( ( dbfClient )->SubCta, .t. ) )

               if lChkCreate .or. ApoloMsgNoYes(   "Subcuenta : " + Rtrim( ( dbfClient )->SubCta ) + " no existe" + CRLF + ;
                                                   "� Desea crearla ?",;
                                                   "Enlace con contaplus �" )

                  ( cArea )->( dbAppend() )
                  ( cArea )->Cod         := ( dbfClient )->Subcta
                  ( cArea )->Titulo      := ( dbfClient )->Titulo
                  ( cArea )->Nif         := ( dbfClient )->Nif
                  ( cArea )->Domicilio   := ( dbfClient )->Domicilio
                  ( cArea )->Poblacion   := ( dbfClient )->Poblacion
                  ( cArea )->Provincia   := ( dbfClient )->Provincia
                  ( cArea )->CodPostal   := ( dbfClient )->CodPostal
                  ( cArea )->( dbCommit() )

                  oItem := oTree:Add( "Cuenta " + Rtrim( ( dbfClient )->Subcta ) + " del cliente " + Rtrim( ( dbfClient )->Cod ) + ", " + Rtrim( ( dbfClient )->Titulo ) + " creada", 1 )

               else

                  oItem := oTree:Add( "Cuenta " + Rtrim( ( dbfClient )->Subcta ) + " del cliente " + Rtrim( ( dbfClient )->Cod ) + ", " + Rtrim( ( dbfClient )->Titulo ) + " creaci�n cancelada", 1 )

               end if

            else

               oItem    := oTree:Add( "Cuenta " + Rtrim( ( dbfClient )->Subcta ) + " del cliente " + Rtrim( ( dbfClient )->Cod ) + ", " + Rtrim( ( dbfClient )->Titulo ) + " ya existe", 0 )

            end if

         else

            oItem       := oTree:Add( "El Cliente : " + Rtrim( ( dbfClient )->Cod ) + ", " + Rtrim( ( dbfClient )->Titulo ) + " no tiene codificada cuenta en Contaplus", 0 )

         end if

         oTree:Select( oItem )

         SysRefresh()

         ( dbfClient )->( dbSkip() )

      end do

   end if

   MsgInfo( "Proceso finalizado" )

   oDlg:Enable()

Return nil

//---------------------------------------------------------------------------//

/*
Devuelve la estructura de la base de datos en funcion del codigo de cliente
*/

STATIC FUNCTION CnfCli( dbfClient )

	local oDlg
   local cIniCli  := cPatEmp() + "Client.Ini"

   DEFINE DIALOG oDlg RESOURCE "CNF_DEF_CLI" TITLE "Configurar clientes"

      REDEFINE GET aIniCli[ 1 ] ID 110 OF oDlg

      REDEFINE GET aIniCli[ 2 ] ID 120 OF oDlg

      REDEFINE GET aIniCli[ 3 ] ID 130 OF oDlg

      REDEFINE GET aIniCli[ 4 ] ID 140 OF oDlg

      REDEFINE GET aIniCli[ 5 ] ID 150 OF oDlg

      REDEFINE GET aIniCli[ 6 ] ID 160 OF oDlg

      REDEFINE GET aIniCli[ 7 ] ID 170 OF oDlg

      REDEFINE GET aIniCli[ 8 ] ID 180 OF oDlg

      REDEFINE GET aIniCli[ 9 ] ID 190 OF oDlg

      REDEFINE GET aIniCli[ 10 ] ID 200 OF oDlg

      REDEFINE COMBOBOX aIniCli[ 11 ] ID 210 UPDATE ITEMS { "Todas", "Activas" } OF oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( WrtIniCli( cIniCli, ), oDlg:end( IDOK ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| WrtIniCli( cIniCli, ), oDlg:end( IDOK ) } )

   // oDlg:bStart := {|| aIniCli[ 1 ] }

   ACTIVATE DIALOG oDlg CENTER

RETURN NIL

//---------------------------------------------------------------------------//

STATIC FUNCTION WrtIniCli( cIniCli )

	WritePProString( "campos", "1", aIniCli[ 1 ], cIniCli )
	WritePProString( "campos", "2", aIniCli[ 2 ], cIniCli )
	WritePProString( "campos", "3", aIniCli[ 3 ], cIniCli )
	WritePProString( "campos", "4", aIniCli[ 4 ], cIniCli )
	WritePProString( "campos", "5", aIniCli[ 5 ], cIniCli )
	WritePProString( "campos", "6", aIniCli[ 6 ], cIniCli )
	WritePProString( "campos", "7", aIniCli[ 7 ], cIniCli )
	WritePProString( "campos", "8", aIniCli[ 8 ], cIniCli )
	WritePProString( "campos", "9", aIniCli[ 9 ], cIniCli )
	WritePProString( "campos", "10",aIniCli[ 10], cIniCli )
   WritePProString( "filtro", "ft",aIniCli[ 11], cIniCli )

RETURN NIL

//---------------------------------------------------------------------------//
/*
Exporta el fichero de articulos a EDM
*/

FUNCTION EdmCli( cCodRut, cPathTo, oStru )

   local n           := 0
   local cChr
   local fTar
   local cFilEdm
   local cFilOdb
   local nWrote
   local nRead
   local oError
   local oBlock
   local dbfClient

   DEFAULT cCodRut   := "001"
   DEFAULT cPathTo   := "C:\INTERS~1\"

   cCodRut           := SubStr( cCodRut, -3 )

   cFilEdm           := cPathTo + "ECLIE" + cCodRut + ".TXT"
   cFilOdb           := cPathTo + "ECLIE" + cCodRut + ".ODB"

   /*
   Creamos el fichero destino
   */

   IF file( cFilEdm )
      fErase( cFilEdm )
   END IF

   fTar              := fCreate( cFilEdm )

   /*
   Abrimos las bases de datos
   */

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   oStru:oMetUno:cText   := "Clientes"
   oStru:oMetUno:SetTotal( ( dbfClient )->( LastRec() ) )

   WHILE !(dbfClient)->( eof() )

      cChr  := "+"
      cChr  += Rjust( (dbfClient)->COD, "0", 7 ) + ","                        // Codigo de cliente

      if !empty( (dbfClient)->NBREST )
      cChr  += EdmSubStr( (dbfClient)->NBREST, 1, 35 )                        // Nombre del estblecimiento
      else
      cChr  += EdmSubStr( (dbfClient)->TITULO, 1, 35 )                        // Nombre de cliente
      end if

      cChr  += EdmSubStr( (dbfClient)->TITULO, 1, 35 )                        // Nombre de cliente
      cChr  += EdmSubStr( (dbfClient)->DOMICILIO, 1, 35 )                     // Domicilio
      cChr  += EdmSubStr( (dbfClient)->POBLACION, 1, 25 )                     // Poblaci�n
      cChr  += EdmSubStr( (dbfClient)->NIF, 1, 14 )                           // N.I.F.
      cChr  += EdmLogicSN( (dbfClient)->LREQ )                                // Recargo de Equivalencia
      cChr  += EdmLocig12( (dbfClient)->LMAYORISTA )                          // Tipo de tarifa
      cChr  += EdmSubStr( "S" )                                               // Valoraci�n de albaranes
      cChr  += EdmSubStr( Trans( (dbfClient)->NDTOESP, "@ 99.99" ), 1, 5 )    // Descuento de cliente
      cChr  += EdmSubStr( "0" )                                               // Numero para grupo de ofertas
      cChr  += EdmSubStr( Trans( (dbfClient)->RIESGO, "@ 9999.99" ), 1, 7 )   // Riesgo
      cChr  += EdmSubStr( Trans( (dbfClient)->NDPP, "@ 99.99" ), 1, 5 )       // Descuento pronto pago de cliente
      cChr  += EdmSubStr( "S", 1, 1, .f. )                                    // S/N Imprime en Euros o en Ptas
      //cChr  += EdmSubStr( (dbfClient)->Telefono, 1, 10 )                      // Telefono
      cChr  += CRLF

      nWrote:= fwrite( fTar, cChr, nRead )

      oStru:oMetUno:Set( ++n )

      /*
      IF fError() != 0
         msginfo( "Hay errores" )
      END IF
      */

      (dbfClient)->( dbSkip() )

   END DO

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE
   ErrorBlock( oBlock )

   CLOSE ( dbfClient )
   fClose( fTar )

   /*
   Conversion a formato exportable a la psion
   */

   if file( FullCurDir() + "CONVER.EXE" )
      WinExec( FullCurDir() + "CONVER.EXE " + cFilEdm + " " + cFilOdb + " 44 -x", 6 ) // Minimized
   end if

RETURN NIL

//---------------------------------------------------------------------------//

/*
Exporta el fichero de rutas y clientes a EDM
*/

FUNCTION EdmRutCli( cCodRut, cPathTo, oStru )

   local n           := 0
   local cChr
   local fTar
   local nWrote
   local nRead
   local cFilEdm
   local cFilOdb
   local cRutCli
   local dbfClient

   DEFAULT cCodRut   := "001"
   DEFAULT cPathTo   := "C:\INTERS~1\"

   cRutCli           := cCodRut

   cCodRut           := SubStr( cCodRut, -3 )

   cFilEdm           := cPathTo + "ERUTA" + cCodRut + ".TXT"    //  de momento ruta unica
   cFilOdb           := cPathTo + "ERUTA" + cCodRut + ".ODB"    //  de momento ruta unica

   /*
   Creamos el fichero destino
   */

   if file( cFilEdm )
      fErase( cFilEdm )
   end if

   fTar              := fCreate( cFilEdm )

   /*
   Abrimos las bases de datos
   */

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   oStru:oMetUno:cText   := "Rutas"
   oStru:oMetUno:SetTotal( ( dbfClient )->( LastRec() ) )

   WHILE !(dbfClient)->( eof() )

      if ( dbfClient )->cCodRut == cRutCli

         cChr  := Right( cCodRut, 1 )                             // Codigo de ruta
         cChr  += Rjust( (dbfClient)->COD, "0", 7 )               // Codigo de cliente
         cChr  += CRLF

         nWrote:= fwrite( fTar, cChr, nRead )

      end if

      oStru:oMetUno:Set( ++n )

      /*
      IF fError() != 0
         msginfo( "Hay errores" )
      END IF
      */

      ( dbfClient )->( dbSkip() )

   END DO

   CLOSE ( dbfClient )
   fClose( fTar )

   if file( FullCurDir() + "CONVER.EXE" )
      WinExec( FullCurDir() + "CONVER.EXE " + cFilEdm + " " + cFilOdb + " 44 -x", 6 ) // Minimized
   end if

RETURN NIL

//-------------------------------------------------------------------------//
/*
Selecciona todos los registros
*/

STATIC FUNCTION lSelAll( oBrw, dbf, lSel )

   local nRecAct  := ( dbf )->( Recno() )

   DEFAULT lSel   := .t.

   CursorWait()

   ( dbf )->( dbGoTop() )

   while !( dbf )->( eof() )

      if dbLock( dbf )
         ( dbf )->lSndInt := lSel
         ( dbf )->( dbUnlock() )
      end if

      ( dbf )->( dbSkip() )

   end do

   ( dbf )->( dbGoTo( nRecAct ) )

   if oBrw != nil
      oBrw:Refresh()
      oBrw:SetFocus()
   end if

   CursorWe()

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION lSndCli( oWndBrw, dbf, lVal )

   local nRecAct
   local nRecOld           := ( dbf )->( Recno() )

   for each nRecAct in ( oWndBrw:oBrw:aSelected )
      ( dbf )->( dbGoTo( nRecAct ) )

      if dbDialogLock( dbf )

         if Empty( lVal )
            ( dbf )->lSndInt  := !( dbf )->lSndInt
         else
            ( dbf )->lSndInt  := lVal
         end if

         ( dbf )->( dbUnlock() )

      end if

   next

   ( dbf )->( dbGoTo( nRecOld ) )

    oWndBrw:Refresh()

    oWndBrw:oBrw:Select()

Return nil

//---------------------------------------------------------------------------//

/*
Devuelve el codigo del Grupo de Cliente de un cliente determinado
*/

FUNCTION RetGrpCli( cCodCli, dbfClient )

   local cGrpCli  := ""

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      cGrpCli     := ( dbfClient )->cCodGrp
   end if

RETURN ( cGrpCli )

//----------------------------------------------------------------------------//
/*
static function ComCorCli()

   local oDoc
   local oText
   local oFind
   local cFound
   local bError
   local cText
   local oWord
   local cFile    := FullCurDir() + "Test.doc"
   local cAreAnt  := Alias()
   local nRecAnt  := ( dbfClient )->( RecNo() )

   Select( dbfClient )

   if File( cFile )

      oWord := TOleAuto():New( "Word.Application" )
      oWord:Set( "Visible", .t. )      //set it to .f. for faster results
      oWord:Set( "WindowState", 1 )    // Maximizado

      oDoc  := oWord:Get( "Documents" )
      oDoc:Open( cFile )

      while !( dbfClient )->( eof() )

         oText := oWord:Selection()
         oFind := oText:Find()

         while .t.

            oFind:Set( "ClearFormatting" )

            oFind:Text  :="#*#"
            oFind:Wrap  :=1
            oFind:Set("MatchWildcards",.t.)

            oFind:Execute()

            cFound      := Alltrim( SubStr( oText:Text, 2, Len( Alltrim( oText:Text) ) -2 ) )

            if Empty( cFound )
               exit
            end if


            cText := cValToChar( Eval( &( '{||' + cFound + '}' ) ) )
            if Empty( cText )
               oText:TypeText( "" )
            else
               oText:TypeText( cText )
            end if

         ( dbfClient )->( dbSkip() )

         end do

      end do

   else

      MsgInfo( "Cannot find " + cFile )

   endif

   if cAreaAnt != ""
      Select( cAreaAnt )
   end if

   ( dbfClient )->( dbGoTo( nRecAnt ) )

RETURN ( nil )
*/

//----------------------------------------------------------------------------//
/*
static function MkDocCli()

   local oDoc
   local oText
   local oFind
   local cFound
   local bError
   local cText
   local oWord

   oWord := TOleAuto():New( "Word.Application" )
   oWord:Set( "Visible", .t. )      //set it to .f. for faster results
   oWord:Set( "WindowState", 1 )    // Maximizado
   oWord:Documents:Add()

   oText             := oWord:Selection()
   oText:Text        := "Clientes"
   oText:Font:Name   := "Arial"
   oText:Font:Size   := 20
   oText:Font:Bold   := .t.

   oDoc              := oWord:Get("ActiveDocument")
   oDoc              := ActiveDocument.Range(0, 0)
   oDoc:Tables:Add( oDoc:Range( 0, 0 ), 1, ( dbfClient )->( fCount() ) )

RETURN ( nil )
*/
//----------------------------------------------------------------------------//

function CalRiesgo( cPatEmp, cCodCli, oMeter, oMessage, lMessage )

return ( 0 )

//---------------------------------------------------------------------------//

function SetRiesgo( cCodCli, dbfClient, oRieCli )

return ( 0 )

//---------------------------------------------------------------------------//

static function AddFamilia( oBrwAtp, dbfTmpAtp, cCodCli )

   local oDlg
   local nPre        := aFill( Array( 6 ), 0 )
   local aPre        := aFill( Array( 6 ), .f. )
   local nDto        := aFill( Array( 6 ), 0 )
   local nDtoArt     := 0
   local nDtoDiv     := 0
   local nDprArt     := 0
   local nComAge     := 0
   local dFecIni     := Ctod( "" )
   local dFecFin     := Ctod( "" )
   local lAplPre     := .t.
   local lAplPed     := .t.
   local lAplAlb     := .t.
   local lAplFac     := .t.
   local oFamIni
   local cFamIni     := dbFirst( dbfFamilia, 1 )
   local oFamIniTxt
   local cFamIniTxt  := ""
   local oFamFin
   local cFamFin     := dbLast( dbfFamilia, 1 )
   local oFamFinTxt
   local cFamFinTxt  := ""
   local oBtnOk

   DEFINE DIALOG oDlg RESOURCE "AddFamilia"

   REDEFINE GET oFamIni VAR cFamIni;
      ID       100 ;
      VALID    cFamilia( oFamIni, dbfFamilia, oFamIniTxt ) ;
      BITMAP   "LUPA" ;
      ON HELP  BrwFamilia( oFamIni, oFamIniTxt ) ;
		COLOR 	CLR_GET ;
      OF       oDlg

   REDEFINE GET oFamIniTxt VAR cFamIniTxt ;
      ID       110 ;
      WHEN     .f.;
      COLOR    CLR_GET ;
      OF       oDlg

   REDEFINE GET oFamFin VAR cFamFin;
      ID       120 ;
      VALID    cFamilia( oFamFin, dbfFamilia, oFamFinTxt ) ;
      BITMAP   "LUPA" ;
      ON HELP  BrwFamilia( oFamFin, oFamFinTxt ) ;
		COLOR 	CLR_GET ;
      OF       oDlg

   REDEFINE GET oFamFinTxt VAR cFamFinTxt ;
      ID       130 ;
      WHEN     .f.;
      COLOR    CLR_GET ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 1 ] ;
      ID       140 ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 2 ] ;
      ID       141 ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 3 ] ;
      ID       142 ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 4 ] ;
      ID       143 ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 5 ] ;
      ID       144 ;
      OF       oDlg

   REDEFINE CHECKBOX aPre[ 6 ] ;
      ID       145 ;
      OF       oDlg

   REDEFINE GET nPre[ 1 ];
      ID       250 ;
      SPINNER ;
      WHEN     ( !aPre[ 1 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nPre[ 2 ];
      ID       251 ;
      SPINNER ;
      WHEN     ( !aPre[ 2 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nPre[ 3 ];
      ID       252 ;
      SPINNER ;
      WHEN     ( !aPre[ 3 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nPre[ 4 ];
      ID       253 ;
      SPINNER ;
      WHEN     ( !aPre[ 4 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nPre[ 5 ];
      ID       254 ;
      SPINNER ;
      WHEN     ( !aPre[ 5 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nPre[ 6 ];
      ID       255 ;
      SPINNER ;
      WHEN     ( !aPre[ 6 ] );
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nDto[ 1 ];
      ID       400 ;
      SPINNER ;
      VALID    nDto[ 1 ] >= 0 .and. nDto[ 1 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDto[ 2 ];
      ID       410 ;
      SPINNER ;
      VALID    nDto[ 2 ] >= 0 .and. nDto[ 2 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDto[ 3 ];
      ID       420 ;
      SPINNER ;
      VALID    nDto[ 3 ] >= 0 .and. nDto[ 3 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDto[ 4 ];
      ID       430 ;
      SPINNER ;
      VALID    nDto[ 4 ] >= 0 .and. nDto[ 4 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDto[ 5 ];
      ID       440 ;
      SPINNER ;
      VALID    nDto[ 5 ] >= 0 .and. nDto[ 5 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDto[ 6 ];
      ID       450 ;
      SPINNER ;
      VALID    nDto[ 6 ] >= 0 .and. nDto[ 6 ] <= 100 ;
      PICTURE  "@E 999.99" ;
      OF       oDlg

   REDEFINE GET nDtoArt;
      ID       150 ;
      SPINNER ;
      VALID    nDtoArt >= 0 .AND. nDtoArt <= 100 ;
      PICTURE  "@E 999.99";
      OF       oDlg

   REDEFINE GET nDtoDiv;
      ID       160 ;
      SPINNER ;
      PICTURE  cPouDiv ;
      OF       oDlg

   REDEFINE GET nDprArt;
      ID       170 ;
      SPINNER ;
      VALID    nDprArt >= 0 .AND. nDprArt <= 100 ;
      PICTURE  "@E 999.99";
      OF       oDlg

   REDEFINE GET nComAge ;
      ID       180 ;
      SPINNER ;
      VALID    nComAge >= 0 .AND. nComAge <= 100 ;
      PICTURE  "@E 999.99";
      OF       oDlg

   REDEFINE GET dFecIni;
      ID       190 ;
      SPINNER ;
      OF       oDlg

   REDEFINE GET dFecFin ;
      ID       200 ;
      SPINNER ;
      OF       oDlg

   REDEFINE CHECKBOX lAplPre ;
      ID       210 ;
      OF       oDlg

   REDEFINE CHECKBOX lAplPed ;
      ID       220 ;
      OF       oDlg

   REDEFINE CHECKBOX lAplAlb ;
      ID       230 ;
      OF       oDlg

   REDEFINE CHECKBOX lAplFac ;
      ID       240 ;
      OF       oDlg

   /*
   Botones de la Caja de Dialogo__________________________________________
   */

   REDEFINE BUTTON oBtnOk ;
      ID       IDOK ;
      OF       oDlg ;
      ACTION   (  AddArtFam( cCodCli, cFamIni, cFamFin, aPre, nPre, nDto, nDtoArt, nDtoDiv, nDprArt, nComAge, dFecIni, dFecFin, lAplPre, lAplPed, lAplAlb, lAplFac, oDlg ),;
                  oBrwAtp:Refresh() )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
      OF       oDlg ;
      CANCEL ;
      ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| oBtnOk:Click() } )

   ACTIVATE DIALOG oDlg ON INIT ( oFamIni:lValid(), oFamFin:lValid() ) CENTER

return nil

//---------------------------------------------------------------------------//

static function AddArtFam( cCodCli, cFamIni, cFamFin, aPre, nPre, nDto, nDtoArt, nDtoDiv, nDprArt, nComAge, dFecIni, dFecFin, lAplPre, lAplPed, lAplAlb, lAplFac, oDlg )

   local nIvaPct  := 0
   local nOrdArt  := ( dbfArticulo )->( OrdSetFocus( "cFamCod" ) )
   local nRecAtp  := ( dbfTmpAtp )->( RecNo() )
   local nOrdAnt  := ( dbfTmpAtp )->( OrdSetFocus( "cCodArt" ) )

   oDlg:Disable()

   if ( dbfFamilia )->( dbSeek( cFamIni ) )

      while ( dbfFamilia )->cCodFam <= cFamFin .and. !( dbfFamilia )->( eof() )

         if ( dbfArticulo )->( dbSeek( ( dbfFamilia )->cCodFam ) )

            while ( dbfArticulo )->Familia == ( dbfFamilia )->cCodFam .and. !( dbfArticulo )->( eof() )

               /*
               Vamos a ver si el articulo ya existe
               */

               if !( dbfTmpAtp )->( dbSeek( ( dbfArticulo )->Codigo ) )

                  nIvaPct                    := nIva( dbfIva, ( dbfArticulo )->TipoIva )

                  ( dbfTmpAtp )->( dbAppend() )

                  ( dbfTmpAtp )->cCodCli     := cCodCli
                  ( dbfTmpAtp )->cCodArt     := ( dbfArticulo )->Codigo

                  if aPre[ 1 ]
                     ( dbfTmpAtp )->nPrcArt  := ( dbfArticulo )->pVenta1
                  else
                     ( dbfTmpAtp )->nPrcArt  := nPre[ 1 ]
                  end if

                  if aPre[ 2 ]
                     ( dbfTmpAtp )->nPrcArt2 := ( dbfArticulo )->pVenta2
                  else
                     ( dbfTmpAtp )->nPrcArt2 := nPre[ 2 ]
                  end if

                  if aPre[ 3 ]
                     ( dbfTmpAtp )->nPrcArt3 := ( dbfArticulo )->pVenta3
                  else
                     ( dbfTmpAtp )->nPrcArt3 := nPre[ 3 ]
                  end if

                  if aPre[ 4 ]
                     ( dbfTmpAtp )->nPrcArt4 := ( dbfArticulo )->pVenta4
                  else
                     ( dbfTmpAtp )->nPrcArt4 := nPre[ 4 ]
                  end if

                  if aPre[ 5 ]
                     ( dbfTmpAtp )->nPrcArt5 := ( dbfArticulo )->pVenta5
                  else
                     ( dbfTmpAtp )->nPrcArt5 := nPre[ 5 ]
                  end if

                  if aPre[ 6 ]
                     ( dbfTmpAtp )->nPrcArt6 := ( dbfArticulo )->pVenta6
                  else
                     ( dbfTmpAtp )->nPrcArt6 := nPre[ 6 ]
                  end if

                  ( dbfTmpAtp )->nPreIva1    := ( dbfTmpAtp )->nPrcArt  + ( ( dbfTmpAtp )->nPrcArt  * nIvaPct / 100 )
                  ( dbfTmpAtp )->nPreIva2    := ( dbfTmpAtp )->nPrcArt2 + ( ( dbfTmpAtp )->nPrcArt2 * nIvaPct / 100 )
                  ( dbfTmpAtp )->nPreIva3    := ( dbfTmpAtp )->nPrcArt3 + ( ( dbfTmpAtp )->nPrcArt3 * nIvaPct / 100 )
                  ( dbfTmpAtp )->nPreIva4    := ( dbfTmpAtp )->nPrcArt4 + ( ( dbfTmpAtp )->nPrcArt4 * nIvaPct / 100 )
                  ( dbfTmpAtp )->nPreIva5    := ( dbfTmpAtp )->nPrcArt5 + ( ( dbfTmpAtp )->nPrcArt5 * nIvaPct / 100 )
                  ( dbfTmpAtp )->nPreIva6    := ( dbfTmpAtp )->nPrcArt6 + ( ( dbfTmpAtp )->nPrcArt6 * nIvaPct / 100 )

                  ( dbfTmpAtp )->nDtoArt     := nDtoArt
                  ( dbfTmpAtp )->nDtoDiv     := nDtoDiv
                  ( dbfTmpAtp )->nComAge     := nComAge
                  ( dbfTmpAtp )->dFecIni     := dFecIni
                  ( dbfTmpAtp )->dFecFin     := dFecFin
                  ( dbfTmpAtp )->lAplPre     := lAplPre
                  ( dbfTmpAtp )->lAplPed     := lAplPed
                  ( dbfTmpAtp )->lAplAlb     := lAplAlb
                  ( dbfTmpAtp )->lAplFac     := lAplFac

                  ( dbfTmpAtp )->nDto1       := nDto[ 1 ]
                  ( dbfTmpAtp )->nDto2       := nDto[ 2 ]
                  ( dbfTmpAtp )->nDto3       := nDto[ 3 ]
                  ( dbfTmpAtp )->nDto4       := nDto[ 4 ]
                  ( dbfTmpAtp )->nDto5       := nDto[ 5 ]
                  ( dbfTmpAtp )->nDto6       := nDto[ 6 ]

               end if

               ( dbfArticulo )->( dbSkip() )

            end while

         end if

         ( dbfFamilia )->( dbSkip() )

      end while

   end if

   oDlg:Enable()
   oDlg:End()

   ( dbfArticulo )->( OrdSetFocus( nOrdArt ) )
   ( dbfTmpAtp   )->( OrdSetFocus( nOrdAnt ) )
   ( dbfTmpAtp   )->( dbGoTo( nRecAtp ) )

return nil

//---------------------------------------------------------------------------//

function RefBrwCta( oBrwCta, cSubCta, dbfDiario )

   if dbfDiario != nil

      if !Empty( cSubCta )
         ( dbfDiario )->( OrdScope( 0, cSubCta ) )
         ( dbfDiario )->( OrdScope( 1, cSubCta ) )
      else
         ( dbfDiario )->( OrdScope( 0, Replicate( "9", 12 ) ) )
         ( dbfDiario )->( OrdScope( 1, Replicate( "9", 12 ) ) )
      end if

      ( dbfDiario )->( dbGoTop() )

      if oBrwCta != nil
         oBrwCta:Refresh()
      end if

   end if

return .t.

//---------------------------------------------------------------------------//

STATIC FUNCTION ChgPrc( dbfCliAtp, oWndBrw )

	local oDlg
   local cFam              := Space( 5 )
	local oFam
   local cTxtFam           := "Todas"
	local oTxtFam
   local cTipIva           := Space( 1 )
	local oTipIva
   local cTxtIva           := "Todos"
   local oTxtIva
   local lTarifa1          := .f.
   local lTarifa2          := .f.
   local lTarifa3          := .f.
   local lTarifa4          := .f.
   local lTarifa5          := .f.
   local lTarifa6          := .f.
   local cCliOrg
   local cCliDes
   local oCliOrg
   local oCliDes
   local oSayCliOrg
   local oSayCliDes
   local cSayCliOrg
   local cSayCliDes
   local oRad
   local nRad              := 1
   local nPctInc           := 0
   local nUndInc           := 0
   local aComBox           :=  { "Precio actual", "Precio 1", "Precio 2", "Precio 3", "Precio 4", "Precio 5", "Precio 6" }
   local oComBox
   local cComBox           := "Precio actual"
   local oMtr
   local nMtr              := 0
   local lRnd              := .f.
   local lGenerateTarifa   := .f.
   local lAppTarifaFecha   := .f.
   local nDec              := nRouDiv( cDivEmp(), dbfDiv )
   local cArtOrg
   local cArtDes
   local oArtOrg
   local oArtDes
   local oSayArtOrg
   local oSayArtDes
   local cSayArtOrg
   local cSayArtDes
   local dIniPrc           := Date()
   local dFinPrc           := Ctod( "31/12/" + Str( Year( Date() ), 4 ) )
   local aStaCli           := aGetStatus( dbfClient, .t. )

	/*
	Llamada a la funcion que activa la caja de dialogo
	*/

   DEFINE DIALOG oDlg RESOURCE "CHGPRECLI"

   /*
	Obtenemos los valores del primer y ultimo codigo
	*/

   cCliOrg        := dbFirst( dbfClient, 1 )
   cCliDes        := dbLast ( dbfClient, 1 )
   cSayCliOrg     := dbFirst( dbfClient, 2 )
   cSayCliDes     := dbLast ( dbfClient, 2 )

   cArtOrg        := dbFirst( dbfArticulo, 1 )
   cArtDes        := dbLast ( dbfArticulo, 1 )
   cSayArtOrg     := dbFirst( dbfArticulo, 2 )
   cSayArtDes     := dbLast ( dbfArticulo, 2 )

   /*
   Monta los clientes
   */

   REDEFINE GET oCliOrg VAR cCliOrg;
      ID       80 ;
      VALID    cClient( oCliOrg, dbfClient, oSayCliOrg );
      BITMAP   "LUPA" ;
      ON HELP  BrwCli( oCliOrg, oSayCliOrg, dbfClient );
      OF       oDlg

   REDEFINE GET oSayCliOrg VAR cSayCliOrg ;
      WHEN     .f.;
      ID       81 ;
      OF       oDlg

   REDEFINE GET oCliDes VAR cCliDes;
      ID       90 ;
      VALID    cClient( oCliDes, dbfClient, oSayCliDes );
      BITMAP   "LUPA" ;
      ON HELP  BrwCli( oCliDes, oSayCliDes, dbfClient );
      OF       oDlg

   REDEFINE GET oSayCliDes VAR cSayCliDes ;
      WHEN     .f.;
      ID       91 ;
      OF       oDlg

   /*
   Monta los art�culos
   */

   REDEFINE GET oArtOrg VAR cArtOrg;
      ID       200 ;
      VALID    cArticulo( oArtOrg, dbfArticulo, oSayArtOrg );
      BITMAP   "LUPA" ;
      ON HELP  BrwArticulo( oArtOrg, oSayArtOrg );
      OF       oDlg

   REDEFINE GET oSayArtOrg VAR cSayArtOrg ;
		WHEN 		.F.;
      ID       201 ;
      OF       oDlg

   REDEFINE GET oArtDes VAR cArtDes;
      ID       210 ;
      VALID    cArticulo( oArtDes, dbfArticulo, oSayArtDes );
      BITMAP   "LUPA" ;
      ON HELP  BrwArticulo( oArtDes, oSayArtDes );
      OF       oDlg

   REDEFINE GET oSayArtDes VAR cSayArtDes ;
		WHEN 		.F.;
      ID       211 ;
      OF       oDlg

   /*
   Monta las familias
   */

   REDEFINE GET oFam VAR cFam ;
		ID 		100 ;
		VALID 	( cFamilia( oFam, , oTxtFam ) );
      BITMAP   "LUPA" ;
      ON HELP  ( BrwFamilia( oFam, oTxtFam ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

	REDEFINE GET oTxtFam VAR cTxtFam ;
		ID 		110 ;
		WHEN		.F. ;
		COLOR 	CLR_GET ;
		OF 		oDlg

   /*
   Monta los tipos de IGIC
   */

   REDEFINE GET oTipIva VAR cTipIva ;
		ID 		120 ;
      PICTURE  "@!" ;
      VALID    ( cTiva( oTipIva, dbfIva, oTxtIva ) );
      BITMAP   "LUPA" ;
      ON HELP  ( BrwIva( oTipIva, nil, oTxtIva ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

	REDEFINE GET oTxtIva VAR cTxtIva ;
		ID 		130 ;
		WHEN		.F. ;
		COLOR 	CLR_GET ;
      OF       oDlg

   /*
   Elige si quiere redondeo y la cantidad
   */

   REDEFINE CHECKBOX lGenerateTarifa ;
      ID       300 ;
		OF 		oDlg

   REDEFINE GET dIniPrc;
      ID       230 ;
      SPINNER;
      WHEN     lGenerateTarifa;
      OF       oDlg

   REDEFINE GET dFinPrc;
      ID       240 ;
      SPINNER;
      WHEN     lGenerateTarifa;
      OF       oDlg

   REDEFINE CHECKBOX lAppTarifaFecha ;
      ID       310 ;
      OF       oDlg

   /*
   Montamos los check para elegir que precio o precios cambiar
   */

   REDEFINE CHECKBOX lTarifa1 ;
		ID 		161 ;
		OF 		oDlg

   REDEFINE CHECKBOX lTarifa2 ;
		ID 		162 ;
		OF 		oDlg

   REDEFINE CHECKBOX lTarifa3 ;
      ID       163 ;
		OF 		oDlg

   REDEFINE CHECKBOX lTarifa4 ;
      ID       164 ;
		OF 		oDlg

   REDEFINE CHECKBOX lTarifa5 ;
      ID       165 ;
		OF 		oDlg

   REDEFINE CHECKBOX lTarifa6 ;
      ID       166 ;
		OF 		oDlg

   /*
   Monta el combo para saber cual es la base sobre la que se hace en nuevo precio
   */

   REDEFINE COMBOBOX oComBox ;
      VAR      cComBox ;
      ID       218 ;
      ITEMS    aComBox ;
      OF       oDlg

   /*monta el radio para elejir el tipo de descuente*/

   REDEFINE RADIO oRad VAR nRad ;
		ID 		170, 172 ;
		OF 		oDlg

   /*Porcentual*/
   REDEFINE GET nPctInc ;
		WHEN		( nRad == 1 ) ;
		PICTURE	"@E 999.99" ;
		SPINNER ;
		ID 		171 ;
		OF 		oDlg

   /*Lineal*/
   REDEFINE GET nUndInc ;
		WHEN		( nRad == 2 ) ;
      PICTURE  cPouDiv ;
		ID 		173 ;
		OF 		oDlg

   /*Elige si quiere redondeo y la cantidad*/
   REDEFINE CHECKBOX lRnd ;
		ID 		180 ;
		OF 		oDlg

	REDEFINE GET nDec ;
		PICTURE	"@E 9" ;
		SPINNER ;
		ID 		190 ;
		OF 		oDlg

   REDEFINE METER oMtr;
		VAR 		nMtr ;
		PROMPT	"Procesando" ;
      ID       220 ;
		OF 		oDlg ;
      TOTAL    ( dbfCliAtp )->( lastrec() )

   REDEFINE BUTTON ;
      ID       IDOK;
		OF 		oDlg ;
      ACTION   (  mkChgPrc( cFam, cTipIva, cCliOrg, cCliDes, lTarifa1, lTarifa2, lTarifa3, lTarifa4, lTarifa5, lTarifa6, nRad, nPctInc, nUndInc, lRnd, nDec, dbfCliAtp, oComBox, oMtr, oDlg, oWndBrw, cArtOrg, cArtDes, lGenerateTarifa, dIniPrc, dFinPrc, lAppTarifaFecha ) )

	REDEFINE BUTTON ;
      ID       IDCANCEL;
		OF 		oDlg ;
		ACTION	( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| mkChgPrc( cFam, cTipIva, cCliOrg, cCliDes, lTarifa1, lTarifa2, lTarifa3, lTarifa4, lTarifa5, lTarifa6, nRad, nPctInc, nUndInc, lRnd, nDec, dbfCliAtp, oComBox, oMtr, oDlg, oWndBrw, cArtOrg, cArtDes, lGenerateTarifa, dIniPrc, dFinPrc, lAppTarifaFecha ) } )

   oDlg:bStart := {|| oCliOrg:SetFocus() }

   ACTIVATE DIALOG oDlg CENTER

   SetStatus( dbfClient, aStaCli )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

STATIC FUNCTION mkChgPrc( cFam, cIva, cCliOrg, cCliDes, lTarifa1, lTarifa2, lTarifa3, lTarifa4, lTarifa5, lTarifa6, nRad, nPctInc, nUndInc, lRnd, nDec, dbfCliAtp, oComBox, oMtr, oDlg, oWndBrw, cArtOrg, cArtDes, lGenerateTarifa, dIniPre, dFinPre, lAppTarifaFecha )

   local nOrdAct
   local nRecAct
   local nPrecio        := oComBox:nAt
   local aTmpAtp        := {}
   local aTmpGenerate   := {}
   local x              := 0

   if ApoloMsgNoYes( "�Desea actualizar los datos de las tarifas de clientes?", "ATENCION" )

      if !lTarifa1 .and. !lTarifa2 .and. !lTarifa3 .and. !lTarifa4 .and. !lTarifa5 .and. !lTarifa6
         msgStop( "No ha elegido ning�na tarifa a cambiar." )
         Return .f.
      end if

      if lGenerateTarifa

         if Empty( dIniPre )
            msgStop( "Al generar una nueva tarifa la fecha de inicio debe de estar rellena." )
            Return .f.
         end if

         if Empty( dFinPre )
            msgStop( "Al generar una nueva tarifa la fecha de fin debe de estar rellena." )
            Return .f.
         end if

         if dIniPre > dFinPre
            msgStop( "Fecha de inicio debe ser anterior a la fecha de finalizaci�n." )
            Return .f.
         end if

      end if

      oDlg:Disable()

      nRecAct           := ( dbfCliAtp )->( RecNo() )
      nOrdAct           := ( dbfCliAtp )->( OrdSetFocus( "cCodCli" ) )

      if ( dbfCliAtp )->( dbSeek( cCliOrg ) )

      while ( dbfCliAtp )->cCodCli <= cCliDes .and. !( dbfCliAtp )->( eof() )

         if ( ( dbfCliAtp )->cCodArt >= cArtOrg .and. ( dbfCliAtp )->cCodArt <= cArtDes )             .and.;
            ( empty( cFam ) .or. RetFld( ( dbfCliAtp )->cCodArt, dbfArticulo, "Familia" ) == cFam )   .and.;
            ( empty( cIva ) .or. RetFld( ( dbfCliAtp )->cCodArt, dbfArticulo, "TipoIva" ) == cIva )   .and.;
            ( !lAppTarifaFecha  .or. ( dbfCliAtp )->dFecFin >= GetSysDate() )

            aTmpAtp  := dbScatter( dbfCliAtp )

            /*
            Cambio la fecha de fin a la tarifa anterior y pongo la fecha en la nueva tarifa
            */

            if lGenerateTarifa

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "dFecIni" ) ) ]   := dIniPre
               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "dFecFin" ) ) ]   := dFinPre

               if Empty( ( dbfCliAtp )->dFecFin ) .or. ( dbfCliAtp )->dFecFin >= dIniPre

                  if( dbfCliAtp )->( dbRLock() )
                     if Empty( ( dbfCliAtp )->dFecIni )
                        ( dbfCliAtp )->dFecIni                       := CtoD( "01/01/" + Str( Year( Date() ) ) )
                     end if
                     ( dbfCliAtp )->dFecFin                          := dIniPre - 1
                     ( dbfCliAtp )->( dbUnLock() )
                  end if

               end if

            end if

            /*
            Estudio de precios
            */

            if lTarifa1

                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt )

                  if nRad == 1
                     aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ] ) * nPctInc / 100
                  else
                     aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ]  += nUndInc
                  end if

                  if lRnd
                     aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt" ) ) ], nDec )
                  end if

            end if

            if lTarifa2

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt2 )

               if nRad == 1
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ] ) * nPctInc / 100
               else
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ]  += nUndInc
               end if

               if lRnd
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt2" ) ) ], nDec )
               end if

            end if

            if lTarifa3

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt3 )

               if nRad == 1
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ] ) * nPctInc / 100
               else
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ]  += nUndInc
               end if

               if lRnd
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt3" ) ) ], nDec )
               end if

            end if

            if lTarifa4

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt4 )

               if nRad == 1
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ] ) * nPctInc / 100
               else
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ]  += nUndInc
               end if

               if lRnd
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt4" ) ) ], nDec )
               end if

            end if

            if lTarifa5

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt5 )

               if nRad == 1
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ] ) * nPctInc / 100
               else
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ]  += nUndInc
               end if

               if lRnd
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt5" ) ) ], nDec )
               end if

            end if

            if lTarifa6

               aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ]     := nVal2Change( nPrecio, ( dbfCliAtp )->nPrcArt6 )

               if nRad == 1
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ]  += nVal2Change( nPrecio, aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ] ) * nPctInc / 100
               else
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ]  += nUndInc
               end if

               if lRnd
                  aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ]  := Round( aTmpAtp[ ( dbfCliAtp )->( Fieldpos( "nPrcArt6" ) ) ], nDec )
               end if

            end if

            if lGenerateTarifa
               aAdd( aTmpGenerate, aTmpAtp )
            else
               DBGather( aTmpAtp, dbfCliAtp )
            end if

         end if

         ( dbfCliAtp )->( dbSkip() )

         oMtr:Set( ( dbfCliAtp )->( OrdKeyNo() ) )

      end do

      end if

      if lGenerateTarifa

         for x := 1 to Len( aTmpGenerate )
            DBGather( aTmpGenerate[ x ], dbfCliAtp, .t. )
         next

      end if

      oMtr:Set( ( dbfCliAtp )->( LastRec() ) )

      ( dbfCliAtp )->( OrdSetFocus( nOrdAct ) )
      ( dbfCliAtp )->( dbGoto( nRecAct ) )

      oDlg:Enable()

   end if

   oDlg:End()

   oWndBrw:Refresh()

RETURN NIL

//---------------------------------------------------------------------------//

Static Function nVal2Change( nPrecio, nImporte )

   local nVal2Change := 0

   do case
      case nPrecio == 1
         nVal2Change := nImporte
      case nPrecio == 2
         nVal2Change := ( dbfCliAtp )->nPrcArt
      case nPrecio == 3
         nVal2Change := ( dbfCliAtp )->nPrcArt2
      case nPrecio == 4
         nVal2Change := ( dbfCliAtp )->nPrcArt3
      case nPrecio == 5
         nVal2Change := ( dbfCliAtp )->nPrcArt4
      case nPrecio == 6
         nVal2Change := ( dbfCliAtp )->nPrcArt5
      case nPrecio == 7
         nVal2Change := ( dbfCliAtp )->nPrcArt6
   end case

RETURN nVal2Change

//---------------------------------------------------------------------------//

FUNCTION AppCli( lOpenBrowse )

   local nLevel         := nLevelUsr( "01032" )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_APPD ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if Client()
         oWndBrw:RecAdd()
      end if

   else

      if OpenFiles( .t. )

         WinAppRec( nil, bEdtRec, dbfClient )
         CloseFiles()

      end if

   end if

RETURN .t.

//---------------------------------------------------------------------------//

FUNCTION EdtCli( cCodCli, lOpenBrowse )

   local nLevel         := nLevelUsr( "01032" )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if Client()
         if dbSeekInOrd( cCodCli, "Cod", dbfClient )
            oWndBrw:RecEdit()
         else
            MsgStop( "No se encuentra cliente" )
         end if
      end if

   else

      if OpenFiles( .t. )

         if dbSeekInOrd( cCodCli, "Cod", dbfClient )
            WinEdtRec( nil, bEdtRec, dbfClient )
         end if

         CloseFiles()

      end if

   end if

RETURN .t.

//---------------------------------------------------------------------------//

Function InfCliente( cCodCli, oBrw )

   local nLevel   := nLevelUsr( "01032" )

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if !OpenFiles( .t. )
      CloseFiles()
      return nil
   end if

#ifndef __TACTIL__

   if ( dbfClient )->( dbSeek( cCodCli ) )
      BrwVtaCli( cCodCli, ( dbfClient )->Titulo )
   else
      MsgStop( "No se encuentra cliente" )
   end if

#endif

   if oBrw != nil
      oBrw:Refresh()
   end if

   CloseFiles()

RETURN .t.

//---------------------------------------------------------------------------//

Static Function EdtRotorMenu( aTmp, aGet, oDlg, dbfClient, oBrw, nMode )

   MENU oMenu

      MENUITEM    "&1. Rotor"

      MENU

#ifndef __TACTIL__

         MENUITEM "&1. Informe del cliente";
         MESSAGE  "Muestra el informe del Cliente" ;
         RESOURCE "info16" ;
         ACTION   ( BrwVtaCli( ( dbfClient )->Cod, ( dbfClient )->Titulo ) )

#endif

         if !lExternal

            SEPARATOR

            MENUITEM "&1. A�adir presupuesto de cliente";
            MESSAGE  "A�ade un presupuesto de cliente" ;
            RESOURCE "Notebook_user1_16";
            ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), PreCli( nil, nil, ( dbfClient )->Cod, nil ) )

            MENUITEM "&2. A�adir pedido de cliente";
            MESSAGE  "A�ade un pedido de cliente" ;
            RESOURCE "Clipboard_empty_user1_16";
            ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), PedCli( nil, nil, ( dbfClient )->Cod, nil ) )

            MENUITEM "&3. A�adir albar�n de cliente";
            MESSAGE  "A�ade un albar�n de cliente" ;
            RESOURCE "Document_plain_user1_16";
            ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), AlbCli( nil, nil, ( dbfClient )->Cod, nil ) )

            MENUITEM "&4. A�adir factura de cliente";
            MESSAGE  "A�ade una factura de cliente" ;
            RESOURCE "Document_user1_16";
            ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), FactCli( nil, nil, ( dbfClient )->Cod, nil ) )

            MENUITEM "&5. A�adir tiket de cliente";
            MESSAGE  "A�ade un tiket de cliente" ;
            RESOURCE "Cashier_user1_16";
            ACTION   ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), FrontTpv( nil, nil, ( dbfClient )->Cod, nil ) )

         end if

      ENDMENU

   ENDMENU

   oDlg:SetMenu( oMenu )

Return ( oMenu )

//---------------------------------------------------------------------------//

Static Function EndEdtRotorMenu()

Return ( oMenu:End() )

//---------------------------------------------------------------------------//
/*
Esta funci�n carga el valor del precio de compra segun el campo LPRCCOM
*/

Static Function  lChangeCostoParticular( aGet, aTmp, oCosto, nMode )

   if aTmp[ _aLPRCCOM ]
      oCosto:Hide()
      aGet[ _aNPRCCOM ]:Show()
   else
      oCosto:Show()
      aGet[ _aNPRCCOM ]:Hide()
      if nMode != APPD_MODE
         oCosto:cText( nCosto( nil, dbfArticulo, dbfArtKit ) )
      end if
   end if

Return ( .t. )

//---------------------------------------------------------------------------//

/*
Funci�n que edita la caja de di�logo de bancos
*/

Static Function EdtBnc( aTmp, aGet, dbfTmpBnc, oBrw, aTmpCli, bValid, nMode, cCodCli )

   local oDlg
   local oBmpDiv
   local oSayPai
   local cSayPai
   local lDis        := .f.
   local lOldCtaBnc  := aTmp[ ( dbfTmpBnc )->( Fieldpos( "cEntBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( Fieldpos( "cSucBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( Fieldpos( "cDigBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( Fieldpos( "cCtaBnc" ) ) ]

   /*
   Control para que el primer banco que metamos se ponga por defecto
   */

   if nMode == APPD_MODE
      ( dbfTmpBnc )->( dbGoTop() )
      if ( dbfTmpBnc )->( Eof() )
         aTmp[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ] := .t.
         lDis        := .t.
      end if
   end if

   DEFINE DIALOG oDlg RESOURCE "Banco" TITLE LblTitle( nMode ) + "banco de cliente"

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cCodBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cCodBnc" ) ) ] ;
         ID       200 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  ( lCargaBanco( aGet, aTmp, nMode ) ) ;
         BITMAP   "LUPA" ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cDirBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cDirBnc" ) ) ] ;
         ID       210 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cPobBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cPobBnc" ) ) ] ;
         ID       220 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cCPBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cCPBnc" ) ) ] ;
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cProBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cProBnc" ) ) ] ;
         ID       240 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cPaiBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cPaiBnc" ) ) ] ;
         ID       300 ;
         COLOR    CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oPais:GetPais( aTmp[ ( dbfTmpBnc )->( FieldPos( "cPaiBnc" ) ) ], oSayPai, oBmpDiv ) ) ;
         ON HELP  ( oPais:Buscar( aGet[ ( dbfTmpBnc )->( FieldPos( "cPaiBnc" ) ) ] ) ) ;
         BITMAP   "LUPA" ;
         OF       oDlg

      REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
         ID       301;
         OF       oDlg

      REDEFINE GET oSayPai VAR cSayPai ;
         ID       302 ;
         SPINNER ;
         WHEN     ( .f. ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cTlfBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cTlfBnc" ) ) ] ;
         ID       250 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cFaxBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cFaxBnc" ) ) ] ;
         ID       260 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cPContBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cPContBnc" ) ) ] ;
         ID       270 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ];
         ID       310 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDC( aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ], aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ];
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ];
         ID       320 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDC( aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ], aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ];
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) )  ];
         ID       330 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDC( aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ], aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ];
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ];
         ID       340 ;
         PICTURE  "9999999999" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDC( aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ], aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ], aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] ) ) ;
         OF       oDlg

      REDEFINE CHECKBOX aGet[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ] ;
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ] ;
         ID       290 ;
         WHEN     ( nMode != ZOOM_MODE .and. !lDis ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpBnc )->( FieldPos( "nSalIni" ) ) ];
         VAR      aTmp[ ( dbfTmpBnc )->( FieldPos( "nSalIni" ) ) ];
         ID       350 ;
         PICTURE  cPorDiv( cDivEmp(), dbfDiv ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlg

   /*
   Botones de la caja----------------------------------------------------------
   */

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( EndEdtBnc( aTmp, aGet, dbfTmpBnc, oBrw, nMode, oDlg, cCodCli, aTmpCli, lOldCtaBnc ) )

      REDEFINE BUTTON ;
         ID       550 ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:End() )

   /*
   Tecla r�pida para boton aceptar---------------------------------------------
   */

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| EndEdtBnc( aTmp, aGet, dbfTmpBnc, oBrw, nMode, oDlg, cCodCli, aTmpCli, lOldCtaBnc ) } )
   end if

   oDlg:bStart := {|| if( aTmp[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ], aGet[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ]:Disable(), aGet[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ]:Enable() ) }

   ACTIVATE DIALOG oDlg CENTER

   if !Empty( oBmpDiv )
      oBmpDiv:end()
   end if

Return ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//
/*
Funcion que termina el di�logo y comprueba que no falte ning�n campo
*/

Static Function EndEdtBnc( aTmp, aGet, dbfTmpBnc, oBrw, nMode, oDlg, cCodCli, aTmpCli, lOldCtaBnc )

   local nRec

   aTmp[ ( dbfTmpBnc )->( FieldPos( "cCodCli" ) ) ]   := cCodCli

   if lOldCtaBnc != aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ]

      /*
      if Empty( aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ] ) .or.;
         Empty( aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ] ) .or.;
         Empty( aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] ) .or.;
         Empty( aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ] ) .or.;
         Len( AllTrim( aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ] ) ) < 10

         msgStop( "La cuenta bancaria es incorrecta" )

         aGet[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ]:SetFocus()

         return .f.

      end if
      */

      nRec     := ( dbfTmpBnc )->( Recno() )

      if ( dbfTmpBnc )->( dbSeek( cCodCli + aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ] ) )

         msgStop( "La cuenta bancaria ya existe" )

         aGet[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ]:SetFocus()

         ( dbfTmpBnc )->( dbGoTo( nRec ) )

         return .f.

      end if

      ( dbfTmpBnc )->( dbGoTo( nRec ) )

   end if

   /*
   Grabamos el registro--------------------------------------------------------
   */

   WinGather( aTmp, aGet, dbfTmpBnc, oBrw, nMode, , .f. )

   /*
   Cambiamos el banco por defecto para controlar cuando cancela
   */

   if aTmp[ ( dbfTmpBnc )->( FieldPos( "lBncDef" ) ) ]
      lSelDefBnc( aTmp, dbfTmpBnc )
   end if

Return ( oDlg:end( IDOK ) )

//---------------------------------------------------------------------------//
/*
Cambia el banco por defecto y mete los datos en la tabla de cliente
*/

Static Function lSelDefBnc( aTmp, dbfTmpBnc, oBrw )

   local nRec  := ( dbfTmpBnc )->( RecNo() )

   ( dbfTmpBnc )->( dbGoTop() )
   while !( dbfTmpBnc )->( Eof() )

      if ( dbfTmpBnc )->cEntBnc + ( dbfTmpBnc )->cSucBnc + ( dbfTmpBnc )->cDigBnc + ( dbfTmpBnc )->cCtaBnc != aTmp[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ] + aTmp[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ]
         ( dbfTmpBnc )->lBncDef := .f.
      else
         ( dbfTmpBnc )->lBncDef := .t.
      end if

      ( dbfTmpBnc )->( dbSkip() )

   end while

   ( dbfTmpBnc )->( dbGoto( nRec ) )

   if !Empty( oBrw )
      oBrw:Refresh()
   end if

Return .t.

//---------------------------------------------------------------------------//
/*
Carga Todos los Valores del Banco
*/

Static Function lCargaBanco( aGet, aTmp, nMode )

   local cBanco   := ""

   oBanco:Buscar( aGet[ ( dbfTmpBnc )->( FieldPos( "cCodBnc" ) ) ], "cCodBnc" )

   cBanco         := aTmp[ ( dbfTmpBnc )->( FieldPos( "cCodBnc" ) ) ]

   aGet[ ( dbfTmpBnc )->( FieldPos( "cCodBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cNomBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cDirBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cDirBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cPobBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cPobBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cProBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cProBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cCPBnc"  ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cPosBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cTlfBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cTlfBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cFaxBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cFaxBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cPContBnc")) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cPcoBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cEntBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cEntBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cSucBnc" ) ) ]:cText( oRetFld( cBanco, oBanco:oDbf, "cOfiBnc" ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cDigBnc" ) ) ]:cText( Space( 2 ) )
   aGet[ ( dbfTmpBnc )->( FieldPos( "cCtaBnc" ) ) ]:cText( Space( 10 ) )

Return .t.

//---------------------------------------------------------------------------//
/*
Funcion de borrado del banco
*/

Static Function DelBnc( aTmp, oBrwBnc, dbfTmpBnc )

   /*
   Si no es el de por defecto lo borramos sin mas------------------------------
   */

   if !( dbfTmpBnc )->lBncDef

      dbDelRec( oBrwBnc, dbfTmpBnc )

   else

      if dbDelRec( oBrwBnc, dbfTmpBnc )

         /*
         Si mandamos borrar el de por defecto, pondremos el primero de la lista en defecto y cambiamos la tabla de clientes
         */

         ( dbfTmpBnc )->( dbGoTop() )

         if !( dbfTmpBnc )->( Eof() )
            ( dbfTmpBnc )->lBncDef  := .t.
         end if

      end if

   end if

   oBrwBnc:Refresh()

Return ( .t. )

//---------------------------------------------------------------------------//

Function lBancoDefecto( cCodigoCliente, dbfBanco )

   local lBanco      := .f.

   if ( dbfBanco )->( dbSeekInOrd( cCodigoCliente, "cCodDef", dbfBanco ) )
      lBanco         := .t.
   end if

Return ( lBanco )

//--------------------------------------------------------------------------//

Function SynClient( cPath )

   DEFAULT cPath     := cPatCli()

   /*
   Abrimos los ficheros--------------------------------------------------------
   */

   if OpenFiles( .f. )

      while !( dbfBanco )->( eof() )
         if Len( Rtrim( ( dbfBanco )->cCtaBnc ) ) >= 20
            if dbLock( dbfBanco )
               ( dbfBanco )->cEntBnc   := SubStr( ( dbfBanco )->cCtaBnc,  1,  4 )
               ( dbfBanco )->cSucBnc   := SubStr( ( dbfBanco )->cCtaBnc,  5,  4 )
               ( dbfBanco )->cDigBnc   := SubStr( ( dbfBanco )->cCtaBnc,  9,  2 )
               ( dbfBanco )->cCtaBnc   := SubStr( ( dbfBanco )->cCtaBnc, 11, 10 )
               ( dbfBanco )->( dbUnLock() )
            end if
         end if


         if Empty( ( dbfBanco )->cDigBnc )

            if dbLock( dbfBanco )
               ( dbfBanco )->cDigBnc   := cDgtControl( ( dbfBanco )->cEntBnc, ( dbfBanco )->cSucBnc, ( dbfBanco )->cDigBnc, ( dbfBanco )->cCtaBnc )
               ( dbfBanco )->( dbUnLock() )
            end if

         end if

         ( dbfBanco )->( dbSkip() )

      end while

      /*
      Recorremos la tabla de cliente, y si no existe el banco lo a�adimos

      while !( dbfClient )->( Eof() )

         if !Empty( ( dbfClient )->Cuenta )

            if !( dbfBanco )->( dbSeek( ( dbfClient )->Cod + ( dbfClient )->Cuenta ) )

               // Ponemos todos los bancos por defecto a falso--------------------

               if ( dbfBanco )->( dbSeek( ( dbfClient )->Cod ) )
                  while ( dbfBanco )->cCodCli == ( dbfClient )->Cod .and. !( dbfBanco )->( eof() )
                     if dbLock( dbfBanco )
                        ( dbfBanco )->lBncDef   := .f.
                        ( dbfBanco )->( dbUnLock() )
                     end if
                     ( dbfBanco )->( dbSkip() )
                  end while
               end if

               // A�adimos el banco en la tabla relacionada-----------------------

               ( dbfBanco )->( dbAppend() )
               ( dbfBanco )->lBncDef   := .t.
               ( dbfBanco )->cCodCli   := ( dbfClient )->Cod
               ( dbfBanco )->cEntBnc   := SubStr( ( dbfClient )->Cuenta,  1,  4 )
               ( dbfBanco )->cSucBnc   := SubStr( ( dbfClient )->Cuenta,  5,  4 )
               ( dbfBanco )->cDigBnc   := SubStr( ( dbfClient )->Cuenta,  9,  2 )
               ( dbfBanco )->cCtaBnc   := SubStr( ( dbfClient )->Cuenta, 11, 10 )
               ( dbfBanco )->cCodBnc   := ( dbfClient )->Banco
               ( dbfBanco )->cDirBnc   := ( dbfClient )->DirBanco
               ( dbfBanco )->cPobBnc   := ( dbfClient )->PobBanco
               ( dbfBanco )->cProBnc   := ( dbfClient )->cProBanco
               ( dbfBanco )->cPaiBnc   := ( dbfClient )->cCodPai
               ( dbfBanco )->( dbUnLock() )

            end if

            if dbLock( dbfClient )
               ( dbfClient )->Cuenta   := ""
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         ( dbfClient )->( dbSkip() )

      end while
      */

      /*
      Pasamos y limpiamos el campo antiguo de facturas autom�ticas-------------
      */

      while !( dbfClient )->( Eof() )

         if Empty( ( dbfClient )->mFacAut ) .and. !Empty( ( dbfClient )->cFacAut )

            if dbLock( dbfClient )

               ( dbfClient )->mFacAut  := AllTrim( ( dbfClient )->cFacAut ) + ","
               ( dbfClient )->cFacAut  := ""

               ( dbfClient )->( dbUnLock() )

            end if

         end if

         ( dbfClient )->( dbSkip() )

      end while

      CloseFiles()

   end if

Return ( nil )
//---------------------------------------------------------------------------//

Function BrwCliTactil( oGet, dbfCli, oGet2, lReturnCliente, cText, cBitmap )

   local oDlg
   local oBrw
   local nRec
   local nOrdAnt
   local cCliente          := ""
   local lClose            := .f.
   local oGetUnidades
   local cGetUnidades      := Space( 100 )
   local oBmpGeneral
   local oSayGeneral
   local cResource         := "HelpEntryTactilCli"
   local oFntBrw

   DEFAULT lReturnCliente  := .f.
   DEFAULT cText           := "Selecione un cliente"
   DEFAULT cBitmap         := "Businessman2_Alpha_48"

   if Empty( dbfCli )

      if !OpenFiles( .t. )
         Return nil
      end if

      dbfCli               := dbfClient
      lClose               := .t.

   end if

   oFntBrw                 := TFont():New( "Segoe UI",  0, 20, .f., .t. )

   nRec                    := ( dbfCli )->( Recno() )
   nOrdAnt                 := ( dbfCli )->( OrdSetFocus( "Telefono" ) )

   ( dbfCli )->( dbGoTop() )

   DEFINE DIALOG oDlg RESOURCE cResource TITLE "Seleccionar cliente ordenado por: Tel�fono"

      REDEFINE BUTTONBMP ;
         ID       100 ;
         OF       oDlg ;
         BITMAP   "Keyboard2_32";
         ACTION   ( VirtualKey( .f., oGetUnidades ), if( lBigSeek( nil, cGetUnidades, dbfCli ), oBrw:Refresh(), ) )

      REDEFINE SAY oSayGeneral ;
         PROMPT   cText;
         ID       200 ;
         FONT     oFntBrw ;
         OF       oDlg

      REDEFINE BITMAP oBmpGeneral ;
        ID       500 ;
        RESOURCE   cBitmap ;
        TRANSPARENT ;
        OF       oDlg

      REDEFINE GET oGetUnidades VAR cGetUnidades;
         ID       600 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfCli ) );
         OF       oDlg

      oBrw                 := IXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfCli
      oBrw:nMarqueeStyle   := 5
      oBrw:cName           := "Browse cliente tactil"
      oBrw:nHeaderHeight   := 40
      oBrw:nRowHeight      := 60
      oBrw:nDataLines      := 2
      oBrw:lHScroll        := .f.
      oBrw:oFont           := oFntBrw

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

      oBrw:CreateFromResource( 105 )

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "CodBig"
         :bEditValue       := {|| AllTrim( ( dbfCli )->Cod ) }
         :nWidth           := 110
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre y domicilio"
         :cSortOrder       := "Titulo"
         :bEditValue       := {|| AllTrim( ( dbfCli )->Titulo ) + CRLF + AllTrim( ( dbfCli )->Domicilio ) }
         :nWidth           := 440
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Tel�fono"
         :cSortOrder       := "Telefono"
         :bEditValue       := {|| AllTrim( ( dbfCli )->Telefono ) }
         :nWidth           := 140
      end with

      REDEFINE BUTTONBMP ;
         ID       160 ;
         OF       oDlg ;
         BITMAP   "User1_Add_32" ;
         ACTION   ( WinAppRec( oBrw, bEdtBig, dbfCli ) )

      REDEFINE BUTTONBMP ;
         ID       170 ;
         OF       oDlg ;
         BITMAP   "User1_Edit_32" ;
         ACTION   ( WinEdtRec( oBrw, bEdtBig, dbfCli ) )

      REDEFINE BUTTONBMP ;
         ID       140 ;
         OF       oDlg ;
         BITMAP   "UP32" ;
         ACTION   ( oBrw:GoUp() )

      REDEFINE BUTTONBMP ;
         ID       150 ;
         OF       oDlg ;
         BITMAP   "DOWN32" ;
         ACTION   ( oBrw:GoDown() )

      REDEFINE BUTTONBMP ;
         BITMAP   "Check_32" ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( oDlg:End( IDOK ) )

      REDEFINE BUTTONBMP ;
         BITMAP   "Delete_32" ;
         ID       IDCANCEL ;
         OF       oDlg ;
         ACTION   ( oDlg:End() )

      oDlg:AddFastKey( VK_F5, {|| oDlg:end( IDOK ) } )

      oDlg:bStart := {|| oBrw:Load() }

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      cCliente    := ( dbfCli )->Cod

      if !Empty( oGet )
         oGet:cText( cCliente )
      end if

      if !Empty( oGet2 )
         oGet2:cText( Rtrim( ( dbfCli )->Titulo ) )
      end if

   end if

   if lClose

      CloseFiles()

   else

      ( dbfCli )->( OrdSetFocus( nOrdAnt ) )
      ( dbfCli )->( dbGoTo( nRec ) )

   end if

   if !Empty( oFntBrw )
      oFntBrw:End()
   end if

Return ( if( !lReturnCliente, oDlg:nResult == IDOK, cCliente ) )

//---------------------------------------------------------------------------//

Static Function EdtInc( aTmp, aGet, dbfFacCliI, oBrw, bWhen, bValid, nMode )

   local oDlg
   local oNomInci
   local cNomInci

   if nMode == APPD_MODE
      if IsMuebles()
         aTmp[ ( dbfTmpInc )->( FieldPos( "lAviso" ) ) ]  := .t.
      end if
   end if

   if !Empty( aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ] )
      cNomInci    := cNomInci( aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], dbfInci )
   end if

   DEFINE DIALOG oDlg RESOURCE "INCIDENCIA" TITLE LblTitle( nMode ) + "incidencias de clientes"

      REDEFINE GET aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         VAR      aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         ID       120 ;
         VALID    ( cTipInci( aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], dbfInci, oNomInci ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwIncidencia( dbfInci, aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], oNomInci ) ) ;
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

//--------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS TClienteLabelGenerator

   Data oDlg
   Data oFld

   Data oCriterio
   Data cCriterio
   Data aCriterio

   Data oGrupoInicio
   Data cGrupoInicio

   Data oGrupoFin
   Data cGrupoFin

   Data oFechaInicio
   Data dFechaInicio

   Data oFechaFin
   Data dFechaFin

   Data oInicio
   Data oFin

   Data oFormatoLabel
   Data cFormatoLabel

   Data nFilaInicio
   Data nColumnaInicio

   Data cFileTmpLabel
   Data cAreaTmpLabel

   Data oBrwLabel

   Data nCantidadLabels
   Data nUnidadesLabels

   Data oMtrLabel
   Data nMtrLabel

   Data oFilter

   Data hBmp

   Data oBtnListado

   Data oBtnFilter
   Data oBtnSiguiente
   Data oBtnAnterior
   Data oBtnCancel

   Data aSearch

   Method Create()
   Method End()

   Method lDefault()

   Method BotonAnterior()

   Method BotonSiguiente()

   Method PutLabel()

   Method SelectAllLabels()

   Method SelectCriterioLabels()

   Method AddLabel()

   Method DelLabel()

   Method EditLabel()

   Method FilterLabel()

   Method ChangeCriterio()

   Method lPrintLabels()

   Method InitLabel( oLabel )

   Method lCreateTemporal()

   Method PrepareTemporal( oFr )

   Method DestroyTemporal()

   Method SelectColumn( oCombo )

END CLASS

//----------------------------------------------------------------------------//

Method lDefault() CLASS TClienteLabelGenerator

   local oError
   local oBlock
   local lError            := .f.

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::cCriterio          := "Ning�n criterio"
      ::aCriterio          := { "Ning�n criterio", "Grupo clientes", "Fecha modificaci�n" }

      ::cGrupoInicio       := ( dbfClient )->cCodGrp
      ::cGrupoFin          := ( dbfClient )->cCodGrp

      ::dFechaInicio       := Ctod( "01/" + Str( Month( Date() ), 2 ) + "/" + Str( Year( Date() ), 4 ) )
      ::dFechaFin          := GetSysDate()

      ::cFormatoLabel      := GetPvProfString( "Etiquetas", "Cliente", Space( 3 ), cPatEmp() + "Empresa.Ini" )
      if len( ::cFormatoLabel ) < 3
         ::cFormatoLabel   := Space( 3 )
      end if

      ::nMtrLabel          := 0

      ::nFilaInicio        := 1
      ::nColumnaInicio     := 1

      ::nCantidadLabels    := 1
      ::nUnidadesLabels    := 1

      ::aSearch            := { "C�digo", "Nombre", "NIF/CIF", "Poblaci�n", "Provincia", "C�digo postal", "Tel�fono" }

   RECOVER USING oError

      lError               := .t.

      msgStop( "Error en la creaci�n de generador de etiquetas" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE
   ErrorBlock( oBlock )

Return ( !lError )

//--------------------------------------------------------------------------//

Method Create() CLASS TClienteLabelGenerator

   local oBtnPrp
   local oGetOrd
   local oCbxOrd
   local cGetOrd     := Space( 100 )
   local cCbxOrd     := "C�digo"
   local aCbxOrd     := { "C�digo", "Nombre" }

   if ::lDefault()

      DEFINE DIALOG ::oDlg RESOURCE "SelectLabels_0"

         REDEFINE PAGES ::oFld ;
            ID       10;
            OF       ::oDlg ;
            DIALOGS  "SelectLabels_4",;
                     "SelectLabels_2"

         /*
         Bitmap-------------------------------------------------------------------
         */

         REDEFINE BITMAP ;
            RESOURCE "EnvioEtiquetas" ;
            ID       500 ;
            OF       ::oDlg ;

         REDEFINE COMBOBOX ::oCriterio VAR ::cCriterio ;
            ITEMS    ::aCriterio ;
            ID       90 ;
            OF       ::oFld:aDialogs[ 1 ]

         ::oCriterio:bChange        := {|| ::ChangeCriterio() }

         REDEFINE GET ::oGrupoInicio VAR ::cGrupoInicio ;
            ID       100 ;
            IDTEXT   101 ;
            BITMAP   "LUPA" ;
            OF       ::oFld:aDialogs[ 1 ]

         ::oGrupoInicio:bValid    := {|| oGrpCli:Existe( ::cGrupoInicio, ::oGrupoInicio:oHelpText, "cNomGrp", .t., .t., "0" ) }
         ::oGrupoInicio:bHelp     := {|| oGrpCli:Buscar( ::oGrupoInicio ) }

         REDEFINE SAY ::oInicio ;
            ID       102 ;
            OF       ::oFld:aDialogs[1]

         REDEFINE GET ::oGrupoFin VAR ::cGrupoFin ;
            ID       110 ;
            IDTEXT   111 ;
            BITMAP   "LUPA" ;
            OF       ::oFld:aDialogs[ 1 ]

         ::oGrupoFin:bValid       := {|| oGrpCli:Existe( ::cGrupoFin, ::oGrupoFin:oHelpText, "cNomGrp", .t., .t., "0" ) }
         ::oGrupoFin:bHelp        := {|| oGrpCli:Buscar( ::oGrupoFin ) }

         REDEFINE SAY ::oFin ;
            ID       112 ;
            OF       ::oFld:aDialogs[1]

         REDEFINE GET ::oFechaInicio VAR ::dFechaInicio ;
            SPINNER ;
            ID       120 ;
            OF       ::oFld:aDialogs[1]

         REDEFINE GET ::oFechaFin VAR ::dFechaFin ;
            SPINNER ;
            ID       130 ;
            OF       ::oFld:aDialogs[1]

         REDEFINE GET ::oFormatoLabel VAR ::cFormatoLabel ;
            ID       160 ;
            IDTEXT   161 ;
            BITMAP   "LUPA" ;
            OF       ::oFld:aDialogs[ 1 ]

            ::oFormatoLabel:bValid  := {|| cDocumento( ::oFormatoLabel, ::oFormatoLabel:oHelpText, dbfDoc, "CL" ) }
            ::oFormatoLabel:bHelp   := {|| BrwDocumento( ::oFormatoLabel, ::oFormatoLabel:oHelpText, "CL" ) }

         TBtnBmp():ReDefine( 220, "Printer_pencil_16",,,,,{|| EdtDocumento( ::cFormatoLabel ) }, ::oFld:aDialogs[ 1 ], .f., , .f., "Modificar formato de etiquetas" )

         REDEFINE GET ::nFilaInicio ;
            ID       180 ;
            PICTURE  "999" ;
            SPINNER ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::nColumnaInicio ;
            ID       190 ;
            PICTURE  "999" ;
            SPINNER ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::nUnidadesLabels ;
            ID       210 ;
            PICTURE  "99999" ;
            SPINNER ;
            MIN      1 ;
            MAX      99999 ;
            OF       ::oFld:aDialogs[ 1 ]

         /*
         Segunda caja de dialogo--------------------------------------------------
         */

         REDEFINE GET oGetOrd ;
            VAR      cGetOrd;
            ID       200 ;
            BITMAP   "FIND" ;
            OF       ::oFld:aDialogs[ 2 ]

         oGetOrd:bChange   := {| nKey, nFlags, oGet | AutoSeek( nKey, nFlags, oGet, ::oBrwLabel, dbfClient ) }
         oGetOrd:bValid    := {|| ( dbfClient )->( OrdScope( 0, nil ) ), ( dbfClient )->( OrdScope( 1, nil ) ), ::oBrwLabel:Refresh(), .t. }

         REDEFINE COMBOBOX oCbxOrd ;
            VAR      cCbxOrd ;
            ID       210 ;
            ITEMS    aCbxOrd ;
            OF       ::oFld:aDialogs[ 2 ]

         oCbxOrd:bChange   := {|| ::SelectColumn( oCbxOrd ) }

         REDEFINE BUTTON ;
            ID       100 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::PutLabel() )

         REDEFINE BUTTON ;
            ID       110 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::SelectAllLabels( .t. ) )

         REDEFINE BUTTON ;
            ID       120 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::SelectAllLabels( .f. ) )

         REDEFINE BUTTON ;
            ID       130 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::AddLabel() )

         REDEFINE BUTTON ;
            ID       140 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::DelLabel() )

         REDEFINE BUTTON ;
            ID       150 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::EditLabel() )

         REDEFINE BUTTON ;
            ID       160 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( WinEdtRec( ::oBrwLabel, bEdtRec, dbfClient ) )

         REDEFINE BUTTON ;
            ID       165 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( WinZooRec( ::oBrwLabel, bEdtRec, dbfClient ) )

         REDEFINE BUTTON ::oBtnFilter ;
            ID       170 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( ::FilterLabel() )

         REDEFINE BUTTON oBtnPrp ;
            ID       220 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( nil )

         ::oBrwLabel                 := TXBrowse():New( ::oFld:aDialogs[ 2 ] )

         ::oBrwLabel:nMarqueeStyle   := 5
         ::oBrwLabel:nColSel         := 2

         ::oBrwLabel:lHScroll        := .f.
         ::oBrwLabel:cAlias          := dbfClient

         ::oBrwLabel:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
         ::oBrwLabel:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }
         ::oBrwLabel:bLDblClick      := {|| ::PutLabel() }

         ::oBrwLabel:CreateFromResource( 180 )

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Sl. Seleccionado"
            :bStrData         := {|| "" }
            :bEditValue       := {|| ( dbfClient )->lLabel }
            :nWidth           := 20
            :SetCheck( { "Sel16", "Nil16" } )
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "C�digo"
            :cSortOrder       := "Cod"
            :bEditValue       := {|| ( dbfClient )->Cod }
            :nWidth           := 80
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Nombre"
            :cSortOrder       := "Titulo"
            :bEditValue       := {|| ( dbfClient )->Titulo }
            :nWidth           := 280
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "N. etiquetas"
            :bEditValue       := {|| ( dbfClient )->nLabel }
            :cEditPicture     := "@E 99,999"
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
            :nEditType        := 1
            :bOnPostEdit      := {|o,x| if( dbDialogLock( dbfClient ), ( ( dbfClient )->nLabel := x, ( dbfClient )->( dbUnlock() ) ), ) }
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "NIF/CIF"
            :cSortOrder       := "Nif"
            :bEditValue       := {|| ( dbfClient )->Nif }
            :nWidth           := 80
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Tel�fono"
            :cSortOrder       := "Telefono"
            :bEditValue       := {|| ( dbfClient )->Telefono }
            :nWidth           := 80
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Fax"
            :bEditValue       := {|| ( dbfClient )->Fax }
            :nWidth           := 80
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Domicilio"
            :bEditValue       := {|| ( dbfClient )->Domicilio }
            :nWidth           := 300
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Poblaci�n"
            :cSortOrder       := "Poblacion"
            :bEditValue       := {|| ( dbfClient )->Poblacion }
            :nWidth           := 200
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "C�digo postal"
            :cSortOrder       := "CodPostal"
            :bEditValue       := {|| ( dbfClient )->CodPostal }
            :nWidth           := 60
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Provincia"
            :cSortOrder       := "Provincia"
            :bEditValue       := {|| ( dbfClient )->Provincia }
            :nWidth           := 100
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Establecimiento"
            :cSortOrder       := "NbrEst"
            :bEditValue       := {|| ( dbfClient )->NbrEst }
            :nWidth           := 100
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Correo electr�nico"
            :cSortOrder       := "cMeiInt"
            :bEditValue       := {|| ( dbfClient )->cMeiInt }
            :nWidth           := 100
         end with

         REDEFINE METER ::oMtrLabel ;
            VAR      ::nMtrLabel ;
            PROMPT   "" ;
            ID       190 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            TOTAL    ( dbfClient )->( lastrec() )

         ::oMtrLabel:nClrText   := rgb( 128,255,0 )
         ::oMtrLabel:nClrBar    := rgb( 128,255,0 )
         ::oMtrLabel:nClrBText  := rgb( 128,255,0 )

         /*
         Botones generales--------------------------------------------------------
         */

         REDEFINE BUTTON ::oBtnListado ;          // Boton listado
            ID       40 ;
            OF       ::oDlg ;
            ACTION   ( TInfCliGrp():New( "Listado de clientes seleccionados para etiquetas" ):Play( .t. ) )

         REDEFINE BUTTON ::oBtnAnterior ;          // Boton anterior
            ID       20 ;
            OF       ::oDlg ;
            ACTION   ( ::BotonAnterior() )

         REDEFINE BUTTON ::oBtnSiguiente ;         // Boton de Siguiente
            ID       30 ;
            OF       ::oDlg ;
            ACTION   ( ::BotonSiguiente() )

         REDEFINE BUTTON ::oBtnCancel ;            // Boton de Siguiente
            ID       IDCANCEL ;
            OF       ::oDlg ;
            ACTION   ( ::oDlg:End() )

      ::oDlg:bStart  := {|| ::oBtnAnterior:Hide(), ::ChangeCriterio(), ::oFormatoLabel:lValid(), oBtnPrp:Hide() }

      ACTIVATE DIALOG ::oDlg CENTER

      ::End()

   end if

Return ( Self )

//--------------------------------------------------------------------------//

Method BotonAnterior() CLASS TClienteLabelGenerator

   ::oFld:GoPrev()

   ::oBtnAnterior:Hide()

   SetWindowText( ::oBtnSiguiente:hWnd, "Siguien&te >" )

Return ( Self )

//--------------------------------------------------------------------------//

Method BotonSiguiente() CLASS TClienteLabelGenerator

   do case
      case ::oFld:nOption == 1

         if Empty( ::cFormatoLabel )

            MsgStop( "Debe cumplimentar un formato de etiquetas" )

         else

            ::oFld:GoNext()
            ::oBtnAnterior:Show()

            if ::oCriterio:nAt != 1
               ::SelectCriterioLabels()
            end if

            SetWindowText( ::oBtnSiguiente:hWnd, "&Terminar" )

         end if

      case ::oFld:nOption == 2

         if ::lPrintLabels()

            SetWindowText( ::oBtnCancel:hWnd, "&Cerrar" )

         end if

         ::oBrwLabel:Refresh()

   end case

Return ( Self )

//--------------------------------------------------------------------------//

Method End() CLASS TClienteLabelGenerator

   WritePProString( "Etiquetas", "Cliente", ::cFormatoLabel, cPatEmp() + "Empresa.Ini" )

Return ( Self )

//--------------------------------------------------------------------------//

Method PutLabel() CLASS TClienteLabelGenerator

   if dbLock( dbfClient )
      ( dbfClient )->lLabel      := !( dbfClient )->lLabel
      if ( dbfClient )->lLabel .and. Empty( ( dbfClient )->nLabel )
         ( dbfClient )->nLabel   := 1
      end if
      ( dbfClient )->( dbUnLock() )
   end if

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//--------------------------------------------------------------------------//

Method SelectAllLabels( lSelect ) CLASS TClienteLabelGenerator

	local n			:= 0
   local nRecno   := ( dbfClient )->( Recno() )

	CursorWait()

   ( dbfClient )->( dbGoTop() )
   while !( dbfClient )->( eof() )

      if dbLock( dbfClient )
         ( dbfClient )->lLabel := lSelect
         ( dbfClient )->( dbUnLock() )
      end if

      ( dbfClient )->( dbSkip() )

      ::oMtrLabel:Set( ++n )

   end while

   ( dbfClient )->( dbGoTo( nRecno ) )

   ::oBrwLabel:Refresh()

   ::oMtrLabel:Set( 0 )
   ::oMtrLabel:Refresh()

	CursorArrow()

Return ( Self )

//--------------------------------------------------------------------------//

Method SelectCriterioLabels() CLASS TClienteLabelGenerator

	local n			:= 0
   local nRecno   := ( dbfClient )->( Recno() )

	CursorWait()

   ( dbfClient )->( dbGoTop() )
   while !( dbfClient )->( eof() )

      if dbLock( dbfClient )

         do case
            case ::oCriterio:nAt == 2 .and. ( dbfClient )->cCodGrp >= ::cGrupoInicio .and. ( dbfClient )->cCodGrp <= ::cGrupoFin
               ( dbfClient )->lLabel := .t.
               ( dbfClient )->nLabel := ::nUnidadesLabels

            case ::oCriterio:nAt == 3 .and. ( dbfClient )->dFecChg >= ::dFechaInicio .and. ( dbfClient )->dFecChg <= ::dFechaFin
               ( dbfClient )->lLabel := .t.
               ( dbfClient )->nLabel := ::nUnidadesLabels

            otherwise
               ( dbfClient )->lLabel := .f.
               ( dbfClient )->nLabel := 1

         end case

         ( dbfClient )->( dbUnLock() )

      end if

      ( dbfClient )->( dbSkip() )

      ::oMtrLabel:Set( ++n )

   end while

   ( dbfClient )->( dbGoTo( nRecno ) )

   ::oBrwLabel:Refresh()

   ::oMtrLabel:Set( 0 )
   ::oMtrLabel:Refresh()

	CursorArrow()

Return ( Self )

//--------------------------------------------------------------------------//

Method AddLabel() CLASS TClienteLabelGenerator

   if dbLock( dbfClient )
      ( dbfClient )->nLabel++
      ( dbfClient )->( dbUnLock() )
   end if

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//--------------------------------------------------------------------------//

Method DelLabel() CLASS TClienteLabelGenerator

   if ( dbfClient )->nLabel > 1
      if dbLock( dbfClient )
         ( dbfClient )->nLabel--
         ( dbfClient )->( dbUnLock() )
      end if
   end if

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//---------------------------------------------------------------------------//

Method EditLabel() CLASS TClienteLabelGenerator

   ::oBrwLabel:aCols[ 4 ]:Edit()

Return ( Self )

//---------------------------------------------------------------------------//

Method FilterLabel()

   if Empty( ::oFilter )
      ::oFilter      := TDlgFlt():New( aItmCli(), dbfClient )
   end if

   if !Empty( ::oFilter )

      ::oFilter:Resource()

      if ::oFilter:cExpFilter != nil
         SetWindowText( ::oBtnFilter:hWnd, "Filtro activo" )
      else
         SetWindowText( ::oBtnFilter:hWnd, "Filtrar" )
      end if

   end if

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//---------------------------------------------------------------------------//

Method ChangeCriterio() CLASS TClienteLabelGenerator

   ::oGrupoInicio:Hide()
   ::oGrupoFin:Hide()

   ::oInicio:Hide()
   ::oFin:Hide()

   ::oFechaInicio:Hide()
   ::oFechaFin:Hide()

   do case
      case ::oCriterio:nAt == 2

         ::oGrupoInicio:Show()
         ::oGrupoFin:Show()
         ::oInicio:Show()
         ::oFin:Show()

      case ::oCriterio:nAt == 3

         ::oFechaInicio:Show()
         ::oFechaFin:Show()
         ::oInicio:Show()
         ::oFin:Show()

   end case

Return ( Self )

//---------------------------------------------------------------------------//

#ifndef __PDA__

Method lPrintLabels() CLASS TClienteLabelGenerator

   local oFr

   if !::lCreateTemporal()
      Return .f.
   end if

   SysRefresh()

   oFr                  := frReportManager():New()

   oFr:LoadLangRes(     "Spanish.Xml" )

   oFr:SetIcon( 1 )

   oFr:SetTitle(        "Dise�ador de documentos" )

   /*
   Manejador de eventos--------------------------------------------------------
   */

   oFr:SetEventHandler( "Designer", "OnSaveReport", {|| oFr:SaveToBlob( ( dbfDoc )->( Select() ), "mReport" ) } )

   /*
   Zona de datos------------------------------------------------------------
   */

   DataReport( oFr, .t. )

   /*
   Cargar el informe-----------------------------------------------------------
   */

   if !Empty( ( dbfDoc )->mReport )

      oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      /*
      Zona de variables--------------------------------------------------------
      */

      ::PrepareTemporal( oFr )

      /*
      Preparar el report-------------------------------------------------------
      */

      oFr:PrepareReport()

      /*
      Imprimir el informe------------------------------------------------------
      */

      oFr:ShowPreparedReport()

   end if

   /*
   Destruye el dise�ador-------------------------------------------------------
   */

   oFr:DestroyFr()

   /*
   Destruye el fichero temporal------------------------------------------------
   */

   ::DestroyTemporal()

Return ( .t. )

//---------------------------------------------------------------------------//

Method InitLabel( oLabel ) CLASS TClienteLabelGenerator

   local nStartRow

   if ::nFilaInicio > 1
      nStartRow            := oLabel:nStartRow
      nStartRow            += ( ::nFilaInicio - 1 ) * ( oLabel:nLblHeight + oLabel:nVSeparator )

      if nStartRow < oLabel:nBottomRow
         oLabel:nStartRow  := nStartRow
      end if
   end if

   if ::nColumnaInicio > 1 .and. ::nColumnaInicio <= oLabel:nLblOnLine
      oLabel:nLblCurrent   := ::nColumnaInicio
   end if

Return ( Self )

//---------------------------------------------------------------------------//

Method lCreateTemporal() CLASS TClienteLabelGenerator

   local n
   local nRec
   local oBlock
   local oError
   local nBlancos
   local lCreateTemporal   := .t.
   local lClose            := .f.

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      tmpClient            := "LblCli"
      filClient            := cGetNewFileName( cPatTmp() + "LblCli" )

      dbCreate( filClient, aSqlStruct( aItmCli() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), filClient, tmpClient, .f. )

      ( tmpClient )->( OrdCondSet( "!Deleted()", {|| !Deleted() } ) )
      ( tmpClient )->( OrdCreate( filClient, "Cod", "Cod", {|| Field->Cod } ) )

      /*
      Cargamos a la temporal---------------------------------------------------
      */

      nRec                 := ( dbfClient )->( Recno() )

      ( dbfClient )->( dbGoTop() )
      while !( dbfClient )->( eof() )

         if ( dbfClient )->lLabel
            for n := 1 to ( dbfClient )->nLabel
               dbPass( dbfClient, tmpClient, .t. )
            next
         end if

         ( dbfClient )->( dbSkip() )

      end while
      ( tmpClient )->( dbGoTop() )

      ( dbfClient )->( dbGoTo( nRec ) )

   RECOVER USING oError

      lCreateTemporal      := .f.

      MsgStop( 'Imposible crear tablas temporales' + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lCreateTemporal )

//---------------------------------------------------------------------------//

Method PrepareTemporal( oFr ) CLASS TClienteLabelGenerator

   local n
   local nBlancos       := 0
   local nPaperHeight   := oFr:GetProperty( "MainPage", "PaperHeight" ) * fr01cm
   local nHeight        := oFr:GetProperty( "CabeceraColumnas", "Height" )
   local nColumns       := oFr:GetProperty( "MainPage", "Columns" )
   local nItemsInColumn := int( nPaperHeight / nHeight )

   nBlancos             := ( ::nColumnaInicio - 1 ) * nItemsInColumn
   nBlancos             += ( ::nFilaInicio - 1 )

   for n := 1 to nBlancos
      dbPass( dbBlankRec( dbfClient ), tmpClient, .t. )
   next

   ( tmpClient )->( dbGoTop() )

Return ( .t. )

//---------------------------------------------------------------------------//

Method DestroyTemporal() CLASS TClienteLabelGenerator

   if ( tmpClient )->( Used() )
      ( tmpClient )->( dbCloseArea() )
   end if

   dbfErase( filClient )

Return ( .t. )

//---------------------------------------------------------------------------//

Method SelectColumn( oCombo ) CLASS TClienteLabelGenerator

   local oCol
   local cOrd                    := oCombo:VarGet()

   if ::oBrwLabel != nil

      with object ::oBrwLabel

         for each oCol in :aCols

            if Eq( cOrd, oCol:cHeader )
               oCol:cOrder       := "A"
               oCol:SetOrder()
            else
               oCol:cOrder       := " "
            end if

         next

      end with

      ::oBrwLabel:Refresh()

   end if

Return ( Self )

//---------------------------------------------------------------------------//

#endif

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

Function RtfRefreshButtons( oRtf, oBtn )

   local aChar := REGetCharFormat( oRTF:hWnd )

   lBold       := aChar[ 5 ] == FW_BOLD
   lItalic     := aChar[ 6 ]
   lUnderline  := aChar[ 7 ]
   lBullet     := REGetBullet( oRTF:hWnd )

   if oBtn[ 4 ]:lWhen()
      oBtn[ 4 ]:Enable()
      oBtn[ 4 ]:Refresh()
   else
      oBtn[ 4 ]:Disable()
      oBtn[ 4 ]:Refresh()
   end if

   if oBtn[ 5 ]:lWhen()
      oBtn[ 5 ]:Enable()
      oBtn[ 5 ]:Refresh()
   else
      oBtn[ 5 ]:Disable()
      oBtn[ 5 ]:Refresh()
   end if

Return ( nil )

//---------------------------------------------------------------------------//

/*
Browse de clientes
*/

FUNCTION BrwClient( uGet, uGetName, lBigStyle )

	local oDlg
   local hBmp
	local oBrw
   local uGet1
	local cGet1
   local cTxtOrigen  := uGet:VarGet()
   local nOrdAnt     := GetBrwOpt( "BrwClient" )
	local oCbxOrd
   local aCbxOrd     := { "C�digo", "Nombre", "NIF/CIF", "Poblaci�n", "Provincia", "C�digo postal", "Tel�fono", "Establecimiento", "Correo electr�nico" }
   local cCbxOrd
   local nLevel      := nLevelUsr( "01032" )
   local oSayText
   local cSayText    := "Listado de clientes"

   nOrdAnt           := Min( Max( nOrdAnt, 1 ), len( aCbxOrd ) )
   cCbxOrd           := aCbxOrd[ nOrdAnt ]

   DEFAULT lBigStyle := .f.

   if !OpenFiles( .t. )
      Return nil
   end if

   /*
   Origen de busqueda----------------------------------------------------------
   */

   if !Empty( cTxtOrigen ) .and. !( dbfClient )->( dbSeek( cTxtOrigen ) )
      ( dbfClient )->( OrdSetFocus( nOrdAnt ) )
      ( dbfClient )->( dbGoTop() )
   else
      ( dbfClient )->( OrdSetFocus( nOrdAnt ) )
   end if

   /*
   Distintas cajas de dialogo--------------------------------------------------
   */

   do case
   case lBigStyle
      DEFINE DIALOG oDlg RESOURCE "BIGHELPENTRY"   TITLE "Seleccionar clientes"
   case ( "PDA" $ cParamsMain() )
      DEFINE DIALOG oDlg RESOURCE "HELPENTRY_PDA"  TITLE "Seleccionar clientes"
   otherwise
      DEFINE DIALOG oDlg RESOURCE "HELPENTRY"      TITLE "Seleccionar clientes"
   end case

      REDEFINE GET uGet1 VAR cGet1;
			ID 		104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfClient, .t. ) );
         VALID    ( OrdClearScope( oBrw, dbfClient ) );
         BITMAP   "FIND" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ( dbfClient )->( OrdSetFocus( oCbxOrd:nAt ) ), oBrw:refresh(), uGet1:SetFocus() ) ;
			OF 		oDlg

      oBrw                 := IXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfClient
      oBrw:nMarqueeStyle   := 5
      oBrw:cName           := "Browse.Clientes"

      with object ( oBrw:AddCol() )
         :cHeader          := "Bl. Bloqueado"
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfClient )->lBlqCli }
         :nWidth           := 20
         :SetCheck( { "Cnt16", "Nil16" } )
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "Cod"
         :bEditValue       := {|| ( dbfClient )->Cod }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "Titulo"
         :bEditValue       := {|| ( dbfClient )->Titulo }
         :nWidth           := 280
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "NIF/CIF"
         :cSortOrder       := "Nif"
         :bEditValue       := {|| ( dbfClient )->Nif }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Tel�fono"
         :cSortOrder       := "Telefono"
         :bEditValue       := {|| ( dbfClient )->Telefono }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfClient )->Fax }
         :nWidth           := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfClient )->Domicilio }
         :nWidth           := 300
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Poblaci�n"
         :cSortOrder       := "Poblacion"
         :bEditValue       := {|| ( dbfClient )->Poblacion }
         :nWidth           := 200
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo postal"
         :cSortOrder       := "CodPostal"
         :bEditValue       := {|| ( dbfClient )->CodPostal }
         :nWidth           := 60
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Provincia"
         :cSortOrder       := "Provincia"
         :bEditValue       := {|| ( dbfClient )->Provincia }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Establecimiento"
         :cSortOrder       := "NbrEst"
         :bEditValue       := {|| ( dbfClient )->NbrEst }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Correo electr�nico"
         :cSortOrder       := "cMeiInt"
         :bEditValue       := {|| ( dbfClient )->cMeiInt }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Riesgo"
         :bEditValue       := {|| Trans( ( dbfClient )->nImpRie, PicOut() ) }
         :nWidth           := 60
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Contacto"
         :bEditValue       := {|| ( dbfClient )->cPerCto }
         :nWidth           := 100
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Observaciones"
         :bEditValue       := {|| ( dbfClient )->mComent }
         :nWidth           := 200
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
			ACTION 	( oDlg:end() )

   if !( "PDA" $ cParamsMain() )

      REDEFINE BUTTON ;
			ID 		500 ;
			OF 		oDlg ;
         WHEN     nAnd( nLevel, ACC_APPD ) != 0 ;
         ACTION   ( WinAppRec( oBrw, bEdtRec, dbfClient ) )

		REDEFINE BUTTON ;
			ID 		501 ;
			OF 		oDlg ;
         WHEN     nAnd( nLevel, ACC_EDIT ) != 0;
         ACTION   ( WinEdtRec( oBrw, bEdtRec, dbfClient ) )

      oDlg:AddFastKey( VK_F2,    {|| if( nAnd( nLevel, ACC_APPD ) != 0, WinAppRec( oBrw, bEdtRec, dbfClient ), ) } )
      oDlg:AddFastKey( VK_F3,    {|| if( nAnd( nLevel, ACC_EDIT ) != 0, WinEdtRec( oBrw, bEdtRec, dbfClient ), ) } )

   end if

   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )

   oDlg:bStart                := {|| oBrw:Load() }

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      if ValType( uGet ) == "O"
         uGet:cText( (dbfClient)->Cod )
         uGet:lValid()
      else
         uGet  := ( dbfClient )->Cod
      end if

      if ValType( uGetName ) == "O"
         uGetName:cText( ( dbfClient )->Titulo )
      end if

   end if

   DestroyFastFilter( dbfClient )

   SetBrwOpt( "BrwClient", ( dbfClient )->( OrdNumber() ) )

   CloseFiles()

   if Valtype( uGet ) == "O"
      uGet:setFocus()
   end if

   DeleteObject( hBmp )

RETURN oDlg:nResult == IDOK

//---------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles( lExt )

   local oBlock
   local oError

   if lOpenFiles
      MsgStop( 'Imposible abrir ficheros de clientes' )
      Return ( .f. )
   end if

   DEFAULT  lExt        := .f.

   lExternal            := lExt

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DisableAcceso()

      lOpenFiles           := .t.

      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

      /*
      Documentos asociados al cliente---------------------------------------------
      */

      USE ( cPatCli() + "ClientD.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENTD", @dbfClientD ) )
      SET ADSINDEX TO ( cPatCli() + "ClientD.Cdx" ) ADDITIVE

      /*
      Tarifas personalizadas------------------------------------------------------
      */

      USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @dbfCliAtp ) )
      SET ADSINDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE

      /*
      Apertura de fichero de Obras------------------------------------------------
      */

      USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
      SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

      /*
      Apertura de fichero de Contactos--------------------------------------------
      */

      USE ( cPatCli() + "CliContactos.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CliConta", @dbfContactos ) )
      SET ADSINDEX TO ( cPatCli() + "CliContactos.Cdx" ) ADDITIVE

      /*
      Apertura de fichero de Bancos------------------------------------------------
      */

      USE ( cPatCli() + "CliBnc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIBNC", @dbfBanco ) )
      SET ADSINDEX TO ( cPatCli() + "CliBnc.Cdx" ) ADDITIVE

      /*
      Apertura de fichero de Indicencias--------------------------------------------
      */

      USE ( cPatCli() + "CliInc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CliInc", @dbfCliInc ) )
      SET ADSINDEX TO ( cPatCli() + "CliInc.Cdx" ) ADDITIVE

      /*
      Articulos-------------------------------------------------------------------
      */

      USE ( cPatArt() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) )
      SET ADSINDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

      USE ( cPatArt() + "ARTKIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTTIK", @dbfArtKit ) )
      SET ADSINDEX TO ( cPatArt() + "ARTKIT.CDX" ) ADDITIVE

      USE ( cPatCli() + "AGENTES.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AGENTES", @cAgente ) )
      SET ADSINDEX TO ( cPatCli() + "AGENTES.CDX" ) ADDITIVE

      /*
      Otros Ficheros--------------------------------------------------------------
      */

      USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
      SET ADSINDEX TO ( cPatGrp() + "FPAGO.CDX" ) ADDITIVE

      USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) )
      SET ADSINDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

      USE ( cPatArt() + "FAMILIAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) )
      SET ADSINDEX TO ( cPatArt() + "FAMILIAS.CDX" ) ADDITIVE

      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE

      USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
      SET ADSINDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

      USE ( cPatArt() + "PRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PRO", @dbfPro ) )
      SET ADSINDEX TO ( cPatArt() + "PRO.CDX" ) ADDITIVE

      USE ( cPatArt() + "TBLPRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TBLPRO", @dbfProL ) )
      SET ADSINDEX TO ( cPatArt() + "TBLPRO.CDX" ) ADDITIVE

      USE ( cPatEmp() + "TIPINCI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIPINCI", @dbfInci ) )
      SET ADSINDEX TO ( cPatEmp() + "TIPINCI.CDX" ) ADDITIVE

      USE ( cPatDat() + "CNFFLT.DBF" ) NEW SHARED VIA ( cDriver() ) ALIAS ( cCheckArea( "CNFFLT", @dbfFlt ) )
      SET ADSINDEX TO ( cPatDat() + "CNFFLT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RDOCUMEN.DBF" ) NEW SHARED VIA ( cDriver() ) ALIAS ( cCheckArea( "RDOCUMEN", @dbfDoc ) )
      SET ADSINDEX TO ( cPatEmp() + "RDOCUMEN.CDX" ) ADDITIVE
      SET TAG TO "CTIPO"

      USE ( cPatArt() + "OFERTA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OFERTA", @dbfOfe ) )
      SET ADSINDEX TO ( cPatArt() + "OFERTA.CDX" ) ADDITIVE

      USE ( cPatArt() + "ARTDIV.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTDIV", @dbfArtDiv ) )
      SET ADSINDEX TO ( cPatArt() + "ARTDIV.CDX" ) ADDITIVE

      USE ( cPatEmp() + "AntCliT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AntCliT", @dbfAntCliT ) )
      SET ADSINDEX TO ( cPatEmp() + "AntCliT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIT", @dbfFacCliT ) )
      SET ADSINDEX TO ( cPatEmp() + "FACCLIT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACCLIP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIP", @dbfFacCliP ) )
      SET ADSINDEX TO ( cPatEmp() + "FACCLIP.CDX" ) ADDITIVE

      USE ( cPatEmp() + "ALBCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIT", @dbfAlbCliT ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBCLIT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "TIKET.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKET", @dbfTikT ) )
      SET ADSINDEX TO ( cPatEmp() + "TIKET.CDX" ) ADDITIVE

      USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTikL ) )
      SET ADSINDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE

      oBandera             := TBandera():New()

      oStock               := TStock():Create( cPatGrp() )
      if !oStock:lOpenFiles()
         lOpenFiles        := .f.
      else
         oStock:cTikT      := dbfTikT
         oStock:cFacCliP   := dbfFacCliP
         oStock:cFacCliT   := dbfFacCliT
         oStock:cAlbCliT   := dbfAlbCliT
         oStock:cAntCliT   := dbfAntCliT
      end if

      oGrpCli              := TGrpCli():Create( cPatCli() )
      if !oGrpCli:OpenFiles()
         lOpenFiles        := .f.
      end if

      oPais                := TPais():Create( cPatDat() )
      if !oPais:OpenFiles()
         lOpenFiles        := .f.
      end if

      oCtaRem              := TCtaRem():Create( cPatCli() )
      if !oCtaRem:OpenFiles()
         lOpenFiles        := .f.
      end if

      oNewImp              := TNewImp():Create( cPatEmp() )
      if !oNewImp:OpenFiles()
         lOpenFiles        := .f.
      end if

      oTrans               := TTrans():Create( cPatCli() )
      if !oTrans:OpenFiles()
         lOpenFiles        := .f.
      end if

      oFacAut              := TFacAutomatica():Create( cPatEmp() )
      if !oFacAut:Openfiles()
         lOpenfiles        := .f.
      end if

      oBanco            := TBancos():Create()
      oBanco:OpenFiles()

      cPinDiv              := cPinDiv( cDivEmp(), dbfDiv ) // Picture de la divisa de compra
      cPouDiv              := cPouDiv( cDivEmp(), dbfDiv ) // Picture de la divisa
      cPorDiv              := cPorDiv( cDivEmp(), dbfDiv ) // Picture de la divisa redondeada

      LoaIniCli( cPatEmp() )

      EnableAcceso()

   RECOVER USING oError

      lOpenFiles        := .f.

      EnableAcceso()

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de clientes" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpenFiles
      CloseFiles()
   end if

RETURN ( lOpenFiles )

//--------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles( lDestroy )

	DEFAULT lDestroy	:= .f.

   DisableAcceso()

   CLOSE ( dbfClient    )
   CLOSE ( dbfClientD   )
   CLOSE ( dbfCliAtp    )
   CLOSE ( dbfArticulo  )
   CLOSE ( dbfArtKit    )
   CLOSE ( dbfCliInc    )
   CLOSE ( cFPago       )
   CLOSE ( cAgente      )
   CLOSE ( dbfObrasT    )
   CLOSE ( dbfContactos )
   CLOSE ( dbfFPago     )
   CLOSE ( dbfIva       )
   CLOSE ( dbfDiv       )
   CLOSE ( dbfAlmT      )
   CLOSE ( dbfFamilia   )
   CLOSE ( dbfPro       )
   CLOSE ( dbfProL      )
   CLOSE ( dbfDoc       )
   CLOSE ( dbfBanco     )
   CLOSE ( dbfInci      )
   CLOSE ( dbfFlt       )
   CLOSE ( dbfOfe       )
   CLOSE ( dbfArtDiv    )
   CLOSE ( dbfAntCliT   )
   CLOSE ( dbfFacCliT   )
   CLOSE ( dbfFacCliP   )
   CLOSE ( dbfAlbCliT   )
   CLOSE ( dbfAntCliT   )
   CLOSE ( dbfTikT      )
   CLOSE ( dbfTikL      )

   dbfClientD     := nil
   dbfCliAtp      := nil
   dbfArticulo    := nil
   dbfArtKit      := nil
   dbfCliInc      := nil
   cFPago         := nil
   cAgente        := nil
   dbfObrasT      := nil
   dbfContactos   := nil
   dbfFPago       := nil
   dbfIva         := nil
   dbfDiv         := nil
   dbfAlmT        := nil
   dbfFamilia     := nil
   dbfPro         := nil
   dbfProL        := nil
   dbfDoc         := nil
   dbfBanco       := nil
   dbfInci        := nil
   dbfFlt         := nil
   dbfOfe         := nil
   dbfArtDiv      := nil
   dbfAntCliT     := nil
   dbfAlbCliT     := nil
   dbfAntCliT     := nil
   dbfTikT        := nil
   dbfTikL        := nil

   if !Empty( oStock )
      oStock:end()
   end if

   if oPais != nil
      oPais:end()
   end if

   if oGrpCli != nil
      oGrpCli:end()
   end if

   if oCtaRem != nil
      oCtaRem:end()
   end if

   if oNewImp != nil
      oNewImp:end()
   end if

   if !Empty( oTrans )
      oTrans:End()
   end if

   if !Empty( oFacAut )
      oFacAut:End()
   end if

   if !Empty( oBanco )
      oBanco:End()
   end if

   oPais          := nil
   oGrpCli        := nil
   oCtaRem        := nil
   oNewImp        := nil
   oTrans         := nil
   oFacAut        := nil
   oBanco         := nil

   if lDestroy
      oWndBrw     := nil
   end if

   lOpenFiles     := .f.

   EnableAcceso()

Return .t.

//----------------------------------------------------------------------------//

FUNCTION LoaIniCli( cPath, cIniCli )

	local n
   local oIniCli

   DEFAULT cPath     := cPatEmp()
   DEFAULT cIniCli   := cPath + "Client.Ini"

	/*
	Fichero Ini de la Aplicaci�n
	---------------------------------------------------------------------------
	*/

	INI oIniCli FILE cIniCli

      GET aIniCli[ 1 ] SECTION "campos" ENTRY "1" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 2 ] SECTION "campos" ENTRY "2" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 3 ] SECTION "campos" ENTRY "3" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 4 ] SECTION "campos" ENTRY "4" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 5 ] SECTION "campos" ENTRY "5" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 6 ] SECTION "campos" ENTRY "6" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 7 ] SECTION "campos" ENTRY "7" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 8 ] SECTION "campos" ENTRY "8" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 9 ] SECTION "campos" ENTRY "9" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 10 ] SECTION "campos" ENTRY "10" OF oIniCli DEFAULT Space( 50 )

      GET aIniCli[ 11 ] SECTION "filtro" ENTRY "ft" OF oIniCli DEFAULT "Activas"

	ENDINI

   for n := 1 TO 10
      aIniCli[ n ]   := padr( aIniCli[ n ], 50 )
   next

   aIniCli[ 11 ]     := Rtrim( aIniCli[ 11 ] )

//RETURN ( nil )
RETURN ( aIniCli )

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

CLASS TClienteSenderReciver FROM TSenderReciverItem

   Method CreateData()

   Method RestoreData()

   Method SendData()

   Method ReciveData()

   Method Process()

   Method CleanRelation( cCodCli )

END CLASS

//----------------------------------------------------------------------------//

Method CreateData() CLASS TClienteSenderReciver

   local lSnd        := .f.
   local tmpCli
   local tmpAtp
   local tmpObr
   local tmpCon
   local oError
   local oBlock
   local cFileName

   if ::oSender:lServer
      cFileName      := "Cli" + StrZero( ::nGetNumberToSend(), 6 ) + ".All"
   else
      cFileName      := "Cli" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()
   end if

   ::oSender:SetText( "Enviando clientes" )

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
   ( dbfClient )->( OrdSetFocus( "lSndInt" ) )

   USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @dbfCliAtp ) )
   SET ADSINDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE

   USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
   SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

   USE ( cPatCli() + "CliContactos.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLICONTA", @dbfContactos ) )
   SET ADSINDEX TO ( cPatCli() + "CliContactos.Cdx" ) ADDITIVE

   /*
   Creamos todas las bases de datos temporales
   */

   mkClient( cPatSnd() )

   dbUseArea( .t., cDriver(), cPatSnd() + "Client.Dbf", cCheckArea( "Client", @tmpCli ), .f. )
   ( tmpCli )->( ordListAdd( cPatSnd() + "Client.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatSnd() + "CliAtp.Dbf", cCheckArea( "CliAtp", @tmpAtp ), .f. )
   ( tmpAtp )->( ordListAdd( cPatSnd() + "CliAtp.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatSnd() + "ObrasT.Dbf", cCheckArea( "ObrasT", @tmpObr ), .f. )
   ( tmpObr )->( ordListAdd( cPatSnd() + "ObrasT.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatSnd() + "CliContactos.Dbf", cCheckArea( "CLICONTA", @tmpCon ), .f. )
   ( tmpCon )->( ordListAdd( cPatSnd() + "CliContactos.Cdx" ) )

   if !Empty( ::oSender:oMtr )
      ::oSender:oMtr:nTotal := ( dbfClient )->( lastrec() )
   end if

   ( dbfClient )->( dbGoTop() )
   while !( dbfClient )->( eof() )

      /*
      No dejamos que viajen los clientes portenciales
      */

      if ( dbfClient )->lSndInt .and. ( dbfClient )->nTipCli != 2

         lSnd  := .t.

         dbPass( dbfClient, tmpCli, .t. )
         ::oSender:SetText( AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )

         if ( dbfObrasT )->( dbSeek( ( dbfClient )->Cod ) )
            while ( dbfObrasT )->cCodCli == ( dbfClient )->Cod
               dbPass( dbfObrasT, tmpObr, .t. )
               ( dbfObrasT )->( dbSkip() )
            end while
         end if

         if ( dbfContactos )->( dbSeek( ( dbfClient )->Cod ) )
            while ( dbfContactos )->cCodCli == ( dbfClient )->Cod
               dbPass( dbfContactos, tmpCon, .t. )
               ( dbfContactos )->( dbSkip() )
            end while
         end if

         if ( dbfCliAtp )->( dbSeek( ( dbfClient )->Cod ) )
            while ( dbfCliAtp )->cCodCli == ( dbfClient )->Cod
               dbPass( dbfCliAtp, tmpAtp, .t. )
               ( dbfCliAtp )->( dbSkip() )
            end while
         end if

      end if

      SysRefresh()

      ( dbfClient )->( dbSkip() )

      if !Empty( ::oSender:oMtr )
         ::oSender:oMtr:Set( ( dbfClient )->( OrdKeyNo() ) )
      end if

   end while

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE
   ErrorBlock( oBlock )

   CLOSE ( tmpCli       )
   CLOSE ( tmpAtp       )
   CLOSE ( tmpObr       )
   CLOSE ( tmpCon       )
   CLOSE ( dbfClient    )
   CLOSE ( dbfCliAtp    )
   CLOSE ( dbfObrasT    )
   CLOSE ( dbfContactos )

   /*
   Comprimir los archivos------------------------------------------------------
   */

   if lSnd

      ::oSender:SetText( "Comprimiendo clientes" )

      if ::oSender:lZipData( cFileName )
         ::oSender:SetText( "Ficheros comprimidos" )
      else
         ::oSender:SetText( "ERROR al crear fichero comprimido" )
      end if

   else

      ::oSender:SetText( "No hay clientes para enviar" )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method RestoreData() CLASS TClienteSenderReciver

   local oError
   local oBlock
   local dbfClient

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if ::lSuccesfullSend

      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

      while !( dbfClient )->( eof() )

         if ( dbfClient )->lSndInt .and. dbLock( dbfClient )
            ( dbfClient )->lSndInt := .f.
            ( dbfClient )->( dbUnlock() )
         end if

         ( dbfClient )->( dbSkip() )

      end do

      CLOSE ( dbfClient )

   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE
   ErrorBlock( oBlock )

Return ( Self )

//----------------------------------------------------------------------------//

Method SendData() CLASS TClienteSenderReciver

   local cFileName

   if ::oSender:lServer
      cFileName      := "Cli" + StrZero( ::nGetNumberToSend(), 6 ) + ".All"
   else
      cFileName      := "Cli" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()
   end if

   /*
   Enviarlos a internet--------------------------------------------------------
   */

   if file( cPatOut() + cFileName )

      if FtpSndFile( cPatOut() + cFileName, cFileName, 2000, ::oSender )
         ::IncNumberToSend()
         ::lSuccesfullSend := .t.
         ::oSender:SetText( "Ficheros de clientes enviados " + cFileName )
      else
         ::oSender:SetText( "ERROR fichero de clientes no enviado" )
      end if

   end if

Return Self

//----------------------------------------------------------------------------//

Method ReciveData() CLASS TClienteSenderReciver

   local n
   local aExt

   /*
   Recibirlo de internet
   */

   if ::oSender:lServer
      aExt              := aRetDlgEmp()
   else
      aExt              := { "All" }
   end if

   ::oSender:SetText( "Recibiendo clientes" )

   for n := 1 to len( aExt )
      FtpGetFiles( "Cli*." + aExt[ n ], cPatIn(), 2000, ::oSender )
   next

   ::oSender:SetText( "Clientes recibidos" )

Return Self

//----------------------------------------------------------------------------//

Method Process() CLASS TClienteSenderReciver

   local m
   local tmpCli
   local tmpAtp
   local tmpObr
   local tmpCon
   local aFiles               := Directory( cPatIn() + "Cli*.*" )
   local oBlock
   local oError

   /*
   Procesamos los ficheros recibidos
   */

   for m := 1 to len( aFiles )

      oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
      BEGIN SEQUENCE

      ::oSender:SetText( "Procesando fichero : " + aFiles[ m, 1 ] )

      if fSize( cPatIn() + aFiles[ m, 1 ] ) > 0

         /*
         Procesamos los ficheros recibidos
         */

         if ::oSender:lUnZipData( cPatIn() + aFiles[ m, 1 ] )

            if lExistTable( cPatSnd() + "Client.Dbf" ) .and.;
               lExistTable( cPatSnd() + "CliAtp.Dbf" ) .and.;
               lExistTable( cPatSnd() + "ObrasT.Dbf" ) .and.;
               lExistTable( cPatSnd() + "CliContactos.Dbf" )

               dbUseArea( .t., cDriver(), cPatSnd() + "Client.Dbf", cCheckArea( "Client", @tmpCli ), .f. )

               dbUseArea( .t., cDriver(), cPatSnd() + "CliAtp.Dbf", cCheckArea( "CliAtp", @tmpAtp ), .f. )

               dbUseArea( .t., cDriver(), cPatSnd() + "ObrasT.Dbf", cCheckArea( "ObrasT", @tmpObr ), .f. )

               dbUseArea( .t., cDriver(), cPatSnd() + "CliContactos.Dbf", cCheckArea( "CLICONTA", @tmpCon ), .f. )

               USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
               SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

               USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @dbfCliAtp ) )
               SET ADSINDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE
               SET TAG TO "cCliArt"

               USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
               SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

               USE ( cPatCli() + "CliContactos.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLICONTA", @dbfContactos ) )
               SET ADSINDEX TO ( cPatCli() + "CliContactos.Cdx" ) ADDITIVE

               if !Empty( ::oSender:oMtr )
                  ::oSender:oMtr:nTotal := ( tmpCli )->( lastrec() )
               end if

               ( tmpCli )->( dbGoTop() )
               while !( tmpCli )->( eof() )

                  if ( dbfClient )->( dbSeek( ( tmpCli )->Cod ) )
                     if !::oSender:lServer
                        dbPass( tmpCli, dbfClient, .f. )
                        ::oSender:SetText( "Reemplazado : " + AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )
                        ::CleanRelation( ( tmpCli )->Cod )
                     else
                        ::oSender:SetText( "Desestimado : " + AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )
                     end if
                  else
                        dbPass( tmpCli, dbfClient, .t. )
                        ::oSender:SetText( "A�adido     : " + AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )
                        ::CleanRelation( ( tmpCli )->Cod )
                  end if

                  ( tmpCli )->( dbSkip() )

                  if !Empty( ::oSender:oMtr )
                     ::oSender:oMtr:Set( ( tmpCli )->( recno() ) )
                  end if

                  SysRefresh()

               end while

               if !Empty( ::oSender:oMtr )
                  ::oSender:oMtr:nTotal := ( tmpAtp )->( lastrec() )
               end if

               ( tmpAtp )->( dbGoTop() )
               while !( tmpAtp )->( eof() )

                  if ( dbfCliAtp )->( dbSeek( ( tmpAtp )->cCodCli + ( tmpAtp )->cCodArt ) )
                     if !::oSender:lServer
                        dbPass( tmpAtp, dbfCliAtp, .f. )
                        ::oSender:SetText( "Reemplazado : " + Rtrim( ( tmpAtp )->cCodCli ) + "; " + Rtrim( ( tmpAtp )->cCodArt + "; " + Rtrim( ( tmpAtp )->cCodFam ) ) )
                     else
                        ::oSender:SetText( "Desestimado : " + Rtrim( ( tmpAtp )->cCodCli ) + "; " + Rtrim( ( tmpAtp )->cCodArt + "; " + Rtrim( ( tmpAtp )->cCodFam ) ) )
                     end if
                  else
                        dbPass( tmpAtp, dbfCliAtp, .t. )
                        ::oSender:SetText( "A�adido     : " + Rtrim( ( tmpAtp )->cCodCli ) + "; " + Rtrim( ( tmpAtp )->cCodArt + "; " + Rtrim( ( tmpAtp )->cCodFam ) ) )
                  end if

                  ( tmpAtp )->( dbSkip() )

                  if !Empty( ::oSender:oMtr )
                     ::oSender:oMtr:Set( ( tmpAtp )->( recno() ) )
                  end if

                  SysRefresh()

               end while

               ( tmpObr )->( dbGoTop() )
               while !( tmpObr )->( eof() )

                  if ( dbfObrasT )->( dbSeek( ( tmpObr )->cCodCli + ( tmpObr )->cCodObr ) )
                     if !::oSender:lServer
                        dbPass( tmpObr, dbfObrasT, .f. )
                     end if
                  else
                        dbPass( tmpObr, dbfObrasT, .t. )
                  end if

                  ( tmpObr )->( dbSkip() )

                  if !Empty( ::oSender:oMtr )
                     ::oSender:oMtr:Set( ( tmpObr )->( recno() ) )
                  end if

                  SysRefresh()

               end while

               ( tmpCon )->( dbGoTop() )
               while !( tmpCon )->( eof() )

                  if ( dbfObrasT )->( dbSeek( ( tmpCon )->cCodCli ) )
                     if !::oSender:lServer
                        dbPass( tmpCon, dbfContactos, .f. )
                     end if
                  else
                        dbPass( tmpCon, dbfContactos, .t. )
                  end if

                  ( tmpCon )->( dbSkip() )

                  if !Empty( ::oSender:oMtr )
                     ::oSender:oMtr:Set( ( tmpCon )->( recno() ) )
                  end if

                  SysRefresh()

               end while

               CLOSE ( tmpCli    )
               CLOSE ( tmpAtp    )
               CLOSE ( tmpObr    )
               CLOSE ( tmpCon    )
               CLOSE ( dbfClient )
               CLOSE ( dbfCliAtp )
               CLOSE ( dbfObrasT )
               CLOSE ( dbfContactos )

               ::oSender:AppendFileRecive( aFiles[ m, 1 ] )

            else

               ::oSender:SetText( "Faltan ficheros" )

               if !lExistTable( cPatSnd() + "Client.Dbf" )
                  ::oSender:SetText( "Falta" + cPatSnd() + "Client.Dbf" )
               end if

               if !lExistTable( cPatSnd() + "CliAtp.Dbf" )
                  ::oSender:SetText( "Falta" + cPatSnd() + "CliAtp.Dbf" )
               end if

               if !lExistTable( cPatSnd() + "ObrasT.Dbf" )
                  ::oSender:SetText( "Falta" + cPatSnd() + "ObrasT.Dbf" )
               end if

               if !lExistTable( cPatSnd() + "CliContactos.Dbf" )
                  ::oSender:SetText( "Falta" + cPatSnd() + "CliContactos.Dbf" )
               end if

            end if

         else

            ::oSender:SetText( "Error en ficheros comprimidos" )

         end if

      else

         ::oSender:SetText( "Fichero vacio" )

      end if

      RECOVER USING oError

         CLOSE ( tmpCli       )
         CLOSE ( tmpAtp       )
         CLOSE ( tmpObr       )
         CLOSE ( tmpCon       )
         CLOSE ( dbfClient    )
         CLOSE ( dbfCliAtp    )
         CLOSE ( dbfObrasT    )
         CLOSE ( dbfContactos )

         ::oSender:SetText( "Error procesando fichero " + aFiles[ m, 1 ] )
         ::oSender:SetText( ErrorMessage( oError ) )

      END SEQUENCE
      ErrorBlock( oBlock )

   next

Return Self

//----------------------------------------------------------------------------//

Method CleanRelation( cCodCli ) CLASS TClienteSenderReciver

   while ( dbfCliAtp )->( dbSeek( cCodCli ) )
      dbDel( dbfCliAtp )
   end while

   SysRefresh()

   while ( dbfObrasT )->( dbSeek( cCodCli ) )
      dbDel( dbfObrasT )
   end while

   SysRefresh()

   while ( dbfContactos )->( dbSeek( cCodCli ) )
      dbDel( dbfContactos )
   end while

   SysRefresh()

Return Self

//----------------------------------------------------------------------------//

#else

//---------------------------------------------------------------------------//
//Funciones del PDA
//---------------------------------------------------------------------------//

FUNCTION pdaBrwClient( uGet, uGetName )

	local oDlg
   local oSayTit
   local oBtn
   local oFont
   local hBmp
	local oBrw
   local uGet1
	local cGet1
   local cTxtOrigen  := uGet:VarGet()
   local nOrdAnt     := GetBrwOpt( "BrwClient" )
	local oCbxOrd
   local aCbxOrd     := { "C�digo", "Nombre", "NIF/CIF", "Poblaci�n", "Provincia", "C�digo postal", "Tel�fono", "Establecimiento" }
   local cCbxOrd     := "C�digo"
   local nLevel      := nLevelUsr( "01032" )
   local dbfClient

   nOrdAnt           := Min( Max( nOrdAnt, 1 ), len( aCbxOrd ) )
   cCbxOrd           := aCbxOrd[ nOrdAnt ]

   hBmp              := LoadBitmap( GetResources(), "bStop"  )


   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   /*
   Origen de busqueda----------------------------------------------------------
   */

   if !Empty( cTxtOrigen ) .and. !( dbfClient )->( dbSeek( cTxtOrigen ) )
      ( dbfClient )->( OrdSetFocus( nOrdAnt ) )
      ( dbfClient )->( dbGoTop() )
   else
      ( dbfClient )->( OrdSetFocus( nOrdAnt ) )
   end if

   /*
   Distintas cajas de dialogo--------------------------------------------------
   */

   DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

   DEFINE DIALOG oDlg RESOURCE "HELPENTRY_PDA"  TITLE "Seleccionar clientes"

      REDEFINE SAY oSayTit ;
         VAR      "Buscando clientes" ;
         ID       110 ;
         COLOR    "N/W*" ;
         FONT     oFont ;
         OF       oDlg

      REDEFINE BTNBMP oBtn ;
         ID       100 ;
         OF       oDlg ;
         FILE     ( cPatBmp() + "user1_16.bmp" ) ;
         NOBORDER ;
         ACTION      ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE GET uGet1 VAR cGet1;
			ID 		104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfClient, .t. ) );
         VALID    ( OrdClearScope( oBrw, dbfClient ) );
         BITMAP   "FIND" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ( dbfClient )->( OrdSetFocus( oCbxOrd:nAt ) ), ( dbfClient )->( dbGoTop() ), oBrw:refresh(), uGet1:SetFocus(), oCbxOrd:refresh() ) ;
			OF 		oDlg

      REDEFINE IBROWSE oBrw ;
         FIELDS   if( ( dbfClient )->lBlqCli, hBmp, "" ),;
                  ( dbfClient )->Cod + CRLF + ( dbfClient )->NbrEst,;
                  ( dbfClient )->Titulo + CRLF + ( dbfClient )->Telefono,;
                  ( dbfClient )->Domicilio,;
                  ( dbfClient )->Nif,;
                  ( dbfClient )->Poblacion,;
                  ( dbfClient )->Provincia,;
                  ( dbfClient )->CodPostal,;
                  ( dbfClient )->mComent;
         HEAD     "B",;
                  "C�digo" + CRLF + "Establec.",;
                  "Nombre" + CRLF + "Tel�fono",;
                  "Domicilio",;
                  "NIF/CIF",;
                  "Poblaci�n",;
                  "Provincia",;
                  "Cod. postal",;
                  "Observaciones";
         FIELDSIZES ;
                  16,;
                  90,;
                  300,;
                  300,;
                  100,;
                  100,;
                  80,;
                  80,;
                  300 ;
         JUSTIFY  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f. ;
			ALIAS 	( dbfClient ) ;
         ID       105 ;
			OF 		oDlg

   ACTIVATE DIALOG oDlg ;
      ON INIT ( oDlg:SetMenu( pdaMenuEdtRec( oDlg , dbfClient , uGet , uGetName ) ) )

      if oDlg:nResult == IDOK

         if ValType( uGet ) == "O"
            uGet:cText( ( dbfClient )->Cod )
            uGet:lValid()
         else
            uGet  := ( dbfClient )->Cod
         end if

         if ValType( uGetName ) == "O"
            uGetName:cText( ( dbfClient )->Titulo )
         end if

      end if

   DestroyFastFilter( dbfClient )

   CLOSE ( dbfClient )

   if Valtype( uGet ) == "O"
      uGet:setFocus()
   end if

   DeleteObject( hBmp )

   /*
   Guardo los campos del browse
   */

   oBrw:CloseData()

RETURN .t.

//---------------------------------------------------------------------------//

static function pdaMenuEdtRec( oDlg , dbfClient , uGet , uGetName )

   local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

Return oMenu

//---------------------------------------------------------------------------//

STATIC FUNCTION pdaOpenFiles( lExt )

   local oBlock
   local oError

   if lOpenFiles
      MsgStop( 'Imposible abrir ficheros de clientes' )
      Return ( .f. )
   end if

   DEFAULT  lExt        := .f.

   lExternal            := lExt

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   lOpenFiles           := .t.

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   /*
   Documentos asociados al cliente---------------------------------------------
   */
   USE ( cPatCli() + "ClientD.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENTD", @dbfClientD ) )
   SET ADSINDEX TO ( cPatCli() + "ClientD.Cdx" ) ADDITIVE

   /*
   Tarifas personalizadas------------------------------------------------------
   */

   USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @dbfCliAtp ) )
   SET ADSINDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE

   /*
   Apertura de fichero de Obras------------------------------------------------
   */

   USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
   SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

   USE ( cPatCli() + "CliContactos.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLICONTA", @dbfContactos ) )
   SET ADSINDEX TO ( cPatCli() + "CliContactos.Cdx" ) ADDITIVE

   /*
   Apertura de fichero de Bancos------------------------------------------------
   */

   USE ( cPatCli() + "CliBnc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIBNC", @dbfBanco ) )
   SET ADSINDEX TO ( cPatCli() + "CliBnc.Cdx" ) ADDITIVE

   /*
   Apertura de fichero de Indicencias--------------------------------------------
   */

   USE ( cPatCli() + "CliInc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CliInc", @dbfCliInc ) )
   SET ADSINDEX TO ( cPatCli() + "CliInc.Cdx" ) ADDITIVE

   /*
   Articulos-------------------------------------------------------------------
   */

   USE ( cPatArt() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) )
   SET ADSINDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

   USE ( cPatArt() + "ARTKIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTTIK", @dbfArtKit ) )
   SET ADSINDEX TO ( cPatArt() + "ARTKIT.CDX" ) ADDITIVE

   USE ( cPatCli() + "AGENTES.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AGENTES", @cAgente ) )
   SET ADSINDEX TO ( cPatCli() + "AGENTES.CDX" ) ADDITIVE

   /*
   Otros Ficheros--------------------------------------------------------------
   */

   USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
   SET ADSINDEX TO ( cPatGrp() + "FPAGO.CDX" ) ADDITIVE

   USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) )
   SET ADSINDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

   USE ( cPatArt() + "FAMILIAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) )
   SET ADSINDEX TO ( cPatArt() + "FAMILIAS.CDX" ) ADDITIVE

   USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlmT ) )
   SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE

   USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
   SET ADSINDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

   USE ( cPatArt() + "PRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PRO", @dbfPro ) )
   SET ADSINDEX TO ( cPatArt() + "PRO.CDX" ) ADDITIVE

   USE ( cPatArt() + "TBLPRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TBLPRO", @dbfProL ) )
   SET ADSINDEX TO ( cPatArt() + "TBLPRO.CDX" ) ADDITIVE

   USE ( cPatEmp() + "TIPINCI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIPINCI", @dbfInci ) )
   SET ADSINDEX TO ( cPatEmp() + "TIPINCI.CDX" ) ADDITIVE

   aDbfBmp           := {  LoadBitmap( GetResources(), "Sel16" ),;
                           LoadBitmap( GetResources(), "Nil16"   ) }

   cPouDiv              := cPouDiv( cDivEmp(), dbfDiv )

   RECOVER USING oError

      lOpenFiles  := .f.
      msgStop( "Imposible abrir todas las bases de datos" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpenFiles
      pdaCloseFiles()
   end if

RETURN ( lOpenFiles )

//--------------------------------------------------------------------------//

STATIC FUNCTION pdaCloseFiles( lDestroy )

	DEFAULT lDestroy	:= .f.

   if aDbfBmp != nil
      aEval( aDbfBmp, { | hBmp | DeleteObject( hBmp ) } )
   end if

   if lDestroy
		oWndBrw:oBrw:lCloseArea()
      oWndBrw        := nil
   else
      CLOSE ( dbfClient )
   end if

   CLOSE ( dbfClientD   )
   CLOSE ( dbfCliAtp    )
   CLOSE ( dbfArticulo  )
   CLOSE ( dbfArtKit    )
   CLOSE ( dbfCliInc    )
   CLOSE ( cFPago       )
   CLOSE ( cAgente      )
   CLOSE ( dbfObrasT    )
   CLOSE ( dbfContactos )
   CLOSE ( dbfFPago     )
   CLOSE ( dbfIva       )
   CLOSE ( dbfDiv       )
   CLOSE ( dbfAlmT      )
   CLOSE ( dbfFamilia   )
   CLOSE ( dbfPro       )
   CLOSE ( dbfProL      )
   CLOSE ( dbfBanco     )
   CLOSE ( dbfInci      )
   CLOSE ( dbfFlt       )

   dbfClientD     := nil
   dbfCliAtp      := nil
   dbfArticulo    := nil
   dbfArtKit      := nil
   dbfCliInc      := nil
   cFPago         := nil
   cAgente        := nil
   dbfObrasT      := nil
   dbfContactos   := nil
   dbfFPago       := nil
   dbfIva         := nil
   dbfDiv         := nil
   dbfAlmT        := nil
   dbfFamilia     := nil
   dbfPro         := nil
   dbfProL        := nil
   dbfBanco       := nil
   dbfInci        := nil
   dbfFlt         := nil

   if oPais != nil
      oPais:end()
   end if

   if oGrpCli != nil
      oGrpCli:end()
   end if

   if oCtaRem != nil
      oCtaRem:end()
   end if

   if oNewImp != nil
      oNewImp:end()
   end if

   if !Empty( oTrans )
      oTrans:End()
   end if

   oPais          := nil
   oGrpCli        := nil
   oCtaRem        := nil
   oNewImp        := nil
   oTrans         := nil

   lOpenFiles     := .f.

Return .t.

//----------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS pdaPcClienteSenderReciver

   Method CreateData()

END CLASS

//---------------------------------------------------------------------------//

Method CreateData( oPgrActual, oSayStatus ) CLASS pdaPcClienteSenderReciver

   local lExist      := .f.
   local pdaClient
   local dbfClient

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @pdaClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   /*
   Usamos las bases de datos del PC--------------------------------------------
   */

   dbUseArea( .t., cDriver(), cPatPc() + "Client.Dbf", cCheckArea( "Client", @dbfClient ), .t. )
   ( dbfClient )->( ordListAdd( cPatPc() + "Client.Cdx" ) )

   if !Empty( oPgrActual )
      oPgrActual:SetRange( 0, ( pdaClient )->( OrdKeyCount() ) )
   end if

   ( pdaClient )->( dbGoTop() )

   while !( pdaClient )->( eof() )

      if ( dbfClient )->( dbSeek( ( pdaClient )->Cod ) )
         if !( dbfClient )->lSndInt
            dbPass( pdaClient, dbfClient , .f. )
         end if
      else
         dbPass( pdaClient, dbfClient, .t. )
      end if

      /*
      Siguiente cliente-----------------------------------------------------
      */

      if dbLock( pdaClient )
         ( pdaClient )->lSndInt        := .f.
         ( pdaClient )->( dbUnLock() )
      end if

      ( pdaClient )->( dbSkip() )

      if !Empty( oSayStatus )
         oSayStatus:SetText( "Sincronizando clientes " + Alltrim( Str( ( pdaClient )->( OrdKeyNo() ) ) ) + " de " + Alltrim( Str( ( pdaClient )->( OrdKeyCount() ) ) ) )
      end if

      SysRefresh()

      if !Empty( oPgrActual )
         oPgrActual:SetPos( ( pdaClient )->( OrdKeyNo() ) )
      end if

      SysRefresh()

   end while

   CLOSE ( dbfClient )
   CLOSE ( pdaClient )

Return ( Self )

//---------------------------------------------------------------------------//

/*function pdaOrdenar( uGet, uGetName )

   local oDlg
   local oSayTit
   local oBtn
   local oFont
   local hBmp
   local oBrw
   local uGet1
   local cGet1
   local nOrdAnt     := GetBrwOpt( "BrwClient" )
   local oCbxOrd
   local aCbxOrd     := { "Lunes", "Martes", "Mi�rcoles", "Jueves", "Viernes", "S�bado", "Domingo" }
   local nLevel      := nLevelUsr( "01032" )

   nOrdAnt           := Min( Max( nOrdAnt, 1 ), len( aCbxOrd ) )
   cComboOrden       := aCbxOrd[ Dow( Date() - 1 ) ]

   hBmp              := LoadBitmap( GetResources(), "bStop"  )

   if !pdaOpenFiles()
      return .f.
   end if*/

   /*
   Distintas cajas de dialogo--------------------------------------------------
   */

/*   DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

   DEFINE DIALOG oDlg RESOURCE "ORDENAR_PDA"

      REDEFINE SAY oSayTit ;
         VAR      "Ordenar clientes" ;
         ID       110 ;
         COLOR    "N/W*" ;
         FONT     oFont ;
         OF       oDlg

      REDEFINE BTNBMP oBtn ;
         ID       100 ;
         OF       oDlg ;
         FILE     ( cPatBmp() + "calendar.bmp" ) ;
         NOBORDER ;
         ACTION      ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE COMBOBOX oCbxOrd ;
         VAR      cComboOrden ;
         ID       200 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ChangeDay( oCbxOrd, oBrw, dbfClient, oDlg ) ) ;
         OF       oDlg

      REDEFINE IBROWSE oBrw ;
         FIELDS   ;
                  ( dbfClient )->Cod + CRLF + ( dbfClient )->Telefono,;
                  ( dbfClient )->Titulo + CRLF + ( dbfClient )->Domicilio,;
                  ( dbfClient )->Nif,;
                  ( dbfClient )->Poblacion,;
                  ( dbfClient )->Provincia,;
                  ( dbfClient )->CodPostal,;
                  ( dbfClient )->mComent;
         HEAD     ;
                  "C�digo" + CRLF + "Tel�fono",;
                  "Nombre" + CRLF + "Domicilio",;
                  "NIF/CIF",;
                  "Poblaci�n",;
                  "Provincia",;
                  "Cod. postal",;
                  "Observaciones";
         FIELDSIZES ;
                  90,;
                  300,;
                  100,;
                  100,;
                  80,;
                  80,;
                  300 ;
         JUSTIFY  ;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f. ;
         ALIAS    ( dbfClient ) ;
         ID       210 ;
         OF       oDlg

      oDlg:bStart := {|| ChangeDay( oCbxOrd, oBrw, dbfClient, oDlg ) }

   ACTIVATE DIALOG oDlg ;
      ON INIT ( oDlg:SetMenu( pdaOrdenarMenu( oDlg, oBrw ) ) )

   /*
   Guardo los campos del browse
   */

  /* pdaCloseFiles()

   //Restauramos la ventana---------------------------------------------------

   oWnd():Show()

return .t.*/

//---------------------------------------------------------------------------//

/*static function pdaAddClientes( oBrw )

   local oDlg
   local nOrd
   local nRec
   local oSayTit
   local oBtn
   local oFont
   local hBmp
   local oBrwCli
   local uGet1
   local cGet1
   local nOrdAnt     := GetBrwOpt( "BrwClient" )
   local nLevel      := nLevelUsr( "01032" )
   local cCodCli

   hBmp              := LoadBitmap( GetResources(), "bStop"  )

   /*
   Distintas cajas de dialogo--------------------------------------------------
   */

  /* nRec              := ( dbfClient )->( Recno() )
   nOrd              := ( dbfClient )->( OrdSetFocus( "COD" ) )

   ( dbfClient )->( dbGoTop() )

   DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

   DEFINE DIALOG oDlg RESOURCE "ADDCLI_PDA"

      REDEFINE SAY oSayTit ;
         VAR      "A�adir clientes" ;
         ID       110 ;
         COLOR    "N/W*" ;
         FONT     oFont ;
         OF       oDlg

      REDEFINE BTNBMP oBtn ;
         ID       100 ;
         OF       oDlg ;
         FILE     ( cPatBmp() + "user.bmp" ) ;
         NOBORDER ;
         ACTION      ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE IBROWSE oBrwCli ;
         FIELDS   ;
                  pdaEstado(),;
                  ( dbfClient )->Cod + CRLF + ( dbfClient )->Telefono,;
                  ( dbfClient )->Titulo + CRLF + ( dbfClient )->Domicilio,;
                  ( dbfClient )->Nif,;
                  ( dbfClient )->Poblacion,;
                  ( dbfClient )->Provincia,;
                  ( dbfClient )->CodPostal,;
                  ( dbfClient )->mComent;
         HEAD     ;
                  "",;
                  "C�digo" + CRLF + "Tel�fono",;
                  "Nombre" + CRLF + "Domicilio",;
                  "NIF/CIF",;
                  "Poblaci�n",;
                  "Provincia",;
                  "Cod. postal",;
                  "Observaciones";
         FIELDSIZES ;
                  17,;
                  90,;
                  300,;
                  100,;
                  100,;
                  80,;
                  80,;
                  300 ;
         JUSTIFY  ;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f. ;
         ALIAS    ( dbfClient ) ;
         ID       210 ;
         OF       oDlg

   ACTIVATE DIALOG oDlg ;
      ON INIT     ( oDlg:SetMenu( pdaSeleccionarMenu( oDlg, oBrw ) ) )

   oBrwCli:Refresh()

   /*
   Limpiar el array------------------------------------------------------------
   */
   /*
   aClientes      := {}

   /*
   Restaurar orden y recno-----------------------------------------------------
   */
   /*
   ( dbfClient )->( OrdSetFocus( nOrd ) )
   ( dbfClient )->( dbGoTo( nRec ) )

   //Restauramos la ventana----------------------------------------------------

   oWnd():Show()

return .t.*/

//---------------------------------------------------------------------------//

function pdaOrdenar( uGet, uGetName )

   local oDlg
   local oSayTit
   local oBtn
   local oFont
   local hBmp
   local oBrw
   local uGet1
   local cGet1
   local nOrdAnt     := GetBrwOpt( "BrwClient" )
   local nLevel      := nLevelUsr( "01032" )
   local oGetBuscar
   local cGetBuscar  := Space( 100 )
   local oCbxOrden
   local cCbxOrden      := "C�digo"

   hBmp              := LoadBitmap( GetResources(), "bStop"  )

   if !pdaOpenFiles()
      return .f.
   end if

   /*
   Distintas cajas de dialogo--------------------------------------------------
   */

   DEFINE FONT oFont NAME "Verdana" SIZE 0, -14

   DEFINE DIALOG oDlg RESOURCE "CLIENTES"

      REDEFINE BTNBMP oBtn ;
         ID       100 ;
         OF       oDlg ;
         FILE     ( cPatBmp() + "user1_16.bmp" ) ;
         NOBORDER ;
         ACTION      ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE SAY oSayTit ;
         VAR      "Clientes" ;
         ID       110 ;
         COLOR    "N/W*" ;
         FONT     oFont ;
         OF       oDlg

      REDEFINE GET oGetBuscar ;
         VAR      cGetBuscar;
         ID       150 ;
         BITMAP   "FIND" ;
         OF       oDlg

      oGetBuscar:bChange   := {| nKey, nFlags | AutoSeek( nKey, nFlags, oGetBuscar, oBrw, dbfClient ) }

      REDEFINE COMBOBOX oCbxOrden ;
         VAR      cCbxOrden ;
         ID       151 ;
         ITEMS    { "C�digo", "Nombre" } ;
			OF 		oDlg

      oCbxOrden:bChange    := {|| ( dbfClient )->( OrdSetFocus( oCbxOrden:nAt ) ), ( dbfClient )->( dbGoTop() ), oBrw:Refresh(), oGetBuscar:SetFocus(), oCbxOrden:Refresh() }

      REDEFINE IBROWSE oBrw ;
         FIELDS   ;
                  ( dbfClient )->Cod + CRLF + ( dbfClient )->NbrEst,;
                  ( dbfClient )->Titulo + CRLF + ( dbfClient )->Domicilio,;
                  ( dbfClient )->Nif,;
                  ( dbfClient )->Poblacion,;
                  ( dbfClient )->Provincia,;
                  ( dbfClient )->CodPostal,;
                  ( dbfClient )->mComent;
         HEAD     ;
                  "C�digo" + CRLF + "Nombre comercial",;
                  "Nombre" + CRLF + "Domicilio",;
                  "NIF/CIF",;
                  "Poblaci�n",;
                  "Provincia",;
                  "Cod. postal",;
                  "Observaciones";
         FIELDSIZES ;
                  122,;
                  300,;
                  100,;
                  100,;
                  80,;
                  80,;
                  300 ;
         JUSTIFY  ;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f.,;
                  .f. ;
         ALIAS    ( dbfClient ) ;
         ID       210 ;
         OF       oDlg

   ACTIVATE DIALOG oDlg ;
      ON INIT ( oDlg:SetMenu( pdaOrdenarMenu( oDlg, oBrw ) ) )

   /*
   Guardo los campos del browse
   */

   pdaCloseFiles()

   //Restauramos la ventana---------------------------------------------------

   oWnd():Show()

return .t.

//---------------------------------------------------------------------------//

static function pdaOrdenarMenu( oDlg, oBrw )

  local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 700 ;
      BITMAPS  150 ; // bitmaps resoruces ID
      IMAGES   4     // number of images in the bitmap

      //REDEFINE MENUITEM ID 310 OF oMenu ACTION ( WinAppRec( oBrw, bEdtPda, dbfClient, oDlg ) )

      REDEFINE MENUITEM ID 710 OF oMenu ACTION ( WinEdtRec( oBrw, bEdtPda, dbfClient, oDlg ) )

      REDEFINE MENUITEM ID 720 OF oMenu ACTION ( DBDelRec( oBrw, dbfClient ) )

      REDEFINE MENUITEM ID 730 OF oMenu ACTION ( WinZooRec( oBrw, bEdtPda, dbfClient, oDlg ) )

      REDEFINE MENUITEM ID 740 OF oMenu ACTION ( oDlg:End() )

Return oMenu

//---------------------------------------------------------------------------//

static function pdaDelClientes( oBrw )

   //CASO LUNES

   if cComboOrden == "Lunes"

      if dbLock( dbfClient )
         ( dbfClient )->lVisLun  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO MARTES

   if cComboOrden == "Martes"

      if dbLock( dbfClient )
         ( dbfClient )->lVisMar  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO MI�RCOLES

   if cComboOrden == "Mi�rcoles"

      if dbLock( dbfClient )
         ( dbfClient )->lVisMie  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO JUEVES

   if cComboOrden == "Jueves"

      if dbLock( dbfClient )
         ( dbfClient )->lVisJue  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO VIERNES

   if cComboOrden == "Viernes"

      if dbLock( dbfClient )
         ( dbfClient )->lVisVie  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO S�BADO

   if cComboOrden == "S�bado"

      if dbLock( dbfClient )
         ( dbfClient )->lVisSab  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   //CASO DOMINGO

   if cComboOrden == "Domingo"

      if dbLock( dbfClient )
         ( dbfClient )->lVisDom  := .f.
         ( dbfClient )->( dbUnLock() )
      end if

   end if

   oBrw:Refresh()

return .t.

//---------------------------------------------------------------------------//

static function pdaCambiarPosicion( oBrw, lUpDown )

   local aPos
   local nPos     := 1
   local aRec     := {}
   local nRec     := ( dbfClient )->( Recno() )
   local cField
   local lField

   CursorWait()

   do case
      case cComboOrden == "Lunes"
         cField    := "nVisLun"
         lField    := "lVisLun"

      case cComboOrden == "Martes"
         cField    := "nVisMar"
         lField    := "lVisMar"

      case cComboOrden == "Mi�rcoles"
         cField    := "nVisMie"
         lField    := "lVisMie"

      case cComboOrden == "Jueves"
         cField    := "nVisJue"
         lField    := "lVisJue"

      case cComboOrden == "Viernes"
         cField    := "nVisVie"
         lField    := "lVisVie"

      case cComboOrden == "S�bado"
         cField    := "nVisSab"
         lField    := "lVisSab"

      case cComboOrden == "Domingo"
         cField    := "nVisDom"
         lField    := "lVisDom"
   end case

   do case
      case IsTrue( lUpDown )

         if ( dbfClient )->( dbRLock() )
            ( dbfClient )->( FieldPut( FieldPos( cField ), FieldGet( FieldPos( cField ) ) - 1.5 ) )
         end if
         ( dbfClient )->( dbUnLock() )

      case IsFalse( lUpDown )

         if ( dbfClient )->( dbRLock() )
            ( dbfClient )->( FieldPut( FieldPos( cField ), FieldGet( FieldPos( cField ) ) + 1.5 ) )
         end if
         ( dbfClient )->( dbUnLock() )
   end case

   //--------------------------------------------------------------------------

   ( dbfClient )->( dbGoTop() )

   while !( dbfClient )->( eof() )

      if ( dbfClient )->( FieldGet( FieldPos( lField ) ) )
         aAdd( aRec, { ( dbfClient )->( Recno() ), nPos++ } )
      end if

      ( dbfClient )->( dbSkip() )

   end while

   //--------------------------------------------------------------------------

   for each aPos in aRec

      ( dbfClient )->( dbGoTo( aPos[ 1 ] ) )

      if ( dbfClient )->( dbRLock() )
         ( dbfClient )->( FieldPut( FieldPos( cField ), aPos[ 2 ] ) )
         ( dbfClient )->( dbUnLock() )
      end if

   next

   //--------------------------------------------------------------------------

   CursorWE()

   ( dbfClient )->( dbGoTo( nRec ) )

   oBrw:Refresh()

return ( nil )

//---------------------------------------------------------------------------//

static function pdaSetClientes()

   local cCodCli

   /*
   A�adiendo clientes desde el Array-------------------------------------------
   */

   for each cCodCli in aClientes

      if !Empty( cCodCli ) .and. ( dbfClient )->( dbSeek( cCodCli ) )

         //CASO LUNES

         if cComboOrden == "Lunes"

            if dbLock( dbfClient )
               ( dbfClient )->lVisLun  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO MARTES

         if cComboOrden == "Martes"

            if dbLock( dbfClient )
               ( dbfClient )->lVisMar  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO MI�RCOLES

         if cComboOrden == "Mi�rcoles"

            if dbLock( dbfClient )
               ( dbfClient )->lVisMie  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO JUEVES

         if cComboOrden == "Jueves"

            if dbLock( dbfClient )
               ( dbfClient )->lVisJue  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO VIERNES

         if cComboOrden == "Viernes"

            if dbLock( dbfClient )
               ( dbfClient )->lVisVie  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO S�BADO

         if cComboOrden == "S�bado"

            if dbLock( dbfClient )
               ( dbfClient )->lVisSab  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

         //CASO DOMINGO

         if cComboOrden == "Domingo"

            if dbLock( dbfClient )
               ( dbfClient )->lVisDom  := .t.
               ( dbfClient )->( dbUnLock() )
            end if

         end if

      end if

   next

return aClientes

//---------------------------------------------------------------------------//

function pdaAddArray( oDlg, oBrwCli )

   local nScan    := aScan( aClientes, ( dbfClient )->Cod )

   if nScan == 0
      aAdd( aClientes, ( dbfClient )->Cod )
   else
      aDel( aClientes, nScan, .t. )
   end if

   oBrwCli:Refresh()

return aClientes

//---------------------------------------------------------------------------//

static function EdtPda( aTmp, aGet, dbfClient, oBrw, bWhen, bValid, nMode )

   local oDlg
   local aBtn        := Array( 4 )
   local oGet
   local oSayPgo
   local cSayPgo
   local cRuta
   local oRuta
   local oSayAge
   local cSayAge
   local oBrwAtp
   local oFiltroAtp
   local cFiltroAtp     := "Activas"
   local aFiltroAtp     := { "Todas", "Activas" }

   if BeginTrans( aTmp, nMode )
      Return .f.
   end if

   if nMode == APPD_MODE
      aTmp[ _LSNDINT ]  := .t.
      aTmp[ _LMODDAT ]  := .t.
      aTmp[ _LCHGPRE ]  := .t.
      aTmp[ _COPIASF ]  := 0
      aTmp[ _NLABEL  ]  := 1
      aTmp[ _NTARIFA ]  := 1
   end if

   if Empty( aTmp[ _CDTOESP ] )
      aTmp[ _CDTOESP ]  := Padr( "General", 50 )
   end if

   if Empty( aTmp[ _CDPP ] )
      aTmp[ _CDPP ]     := Padr( "Pronto pago", 50 )
   end if

   if Empty( aTmp[ _CDTOATP ] )
      aTmp[ _CDTOATP ]  := Padr( "Atipico", 50 )
   end if


   DEFINE DIALOG oDlg RESOURCE "PEDCLI_PDA_4"

   REDEFINE FOLDER oFld ;
      ID          200 ;
      OF          oDlg ;
      PROMPT      "General",        "Comercial",      "Tarifa";
      DIALOGS     "CLIENT_PDA",     "COMERCIAL_PDA",  "TARIFA_PDA"

   /*
   Primera Pesta�a: General----------------------------------------------------
   */

   REDEFINE GET oGet VAR aTmp[ _COD ];
      ID       210 ;
      WHEN     ( nMode == APPD_MODE ) ;
      ON HELP  ( oGet:cText( NextKey( aTmp[ _COD ], dbfClient, "0", RetNumCodCliEmp() ) ) );
      BITMAP   "BOT" ;
      VALID    ( NotValid( oGet, dbfClient, .t., "0", 1, RetNumCodCliEmp() ) ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_NIF] VAR aTmp[_NIF] ;
      ID       220 ;
      PICTURE  "@!" ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( CheckCif( aGet[_NIF] ), if( nMode == APPD_MODE, lValidCif( aGet[_NIF] ), .t. ) );
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_TITULO] VAR aTmp[_TITULO];
      ID       230 ;
      PICTURE  "@!" ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( if( nMode == APPD_MODE, lValidNombre( aGet[_TITULO] ), .t. ) ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _DOMICILIO ] VAR aTmp[ _DOMICILIO ];
      ID       240 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _POBLACION ] VAR aTmp[ _POBLACION ];
      ID       250 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _CODPOSTAL ] VAR aTmp[ _CODPOSTAL ] ;
      ID       260 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _PROVINCIA ] VAR aTmp[ _PROVINCIA ] ;
      ID       270 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _CPERCTO ] VAR aTmp[ _CPERCTO ];
      ID       280 ;
      PICTURE  "@!" ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[ _NTARIFA ] VAR aTmp[ _NTARIFA ] ;
      ID       290 ;
      PICTURE  "9" ;
      WHEN     ( nMode != ZOOM_MODE .and. ( lUsrMaster() .or. oUser():lCambiarPrecio() ) );
      VALID    ( aTmp[_NTARIFA] >= 1 .AND. aTmp[_NTARIFA] <= 6 );
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_TELEFONO] VAR aTmp[_TELEFONO] ;
      ID       291 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( if( nMode == APPD_MODE, lValidTlf( aGet[_TELEFONO] ), .t. ) ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_FAX] VAR aTmp[_FAX] ;
      ID       300 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_MOVIL] VAR aTmp[_MOVIL] ;
      ID       310 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_CODPAGO] VAR aTmp[_CODPAGO];
      ID       320 ;
      PICTURE  "@!" ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( cFPago( aGet[_CODPAGO], , oSayPgo ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( pdaBrwFPago( aGet[_CODPAGO ], dbfFpago, oSayPgo ) );
      OF       oFld:aDialogs[1]

   REDEFINE GET oSayPgo VAR cSayPgo  ;
       ID       321 ;
       WHEN     .f. ;
       OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_CCODRUT] VAR aTmp[_CCODRUT] ;
      ID       330 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( cRuta( aGet[_CCODRUT], nil, oRuta ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( pdaBrwRuta( aGet[_CCODRUT], nil, oRuta ) ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET oRuta VAR cRuta ;
      ID       331 ;
      WHEN     .f. ;
      OF       oFld:aDialogs[1]

   REDEFINE GET aGet[_CAGENTE] VAR aTmp[_CAGENTE] ;
      ID       340 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      VALID    ( cAgentes( aGet[_CAGENTE], , oSayAge ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( pdaBrwAgentes( aGet[_CAGENTE], oSayAge ) ) ;
      OF       oFld:aDialogs[1]

   REDEFINE GET oSayAge VAR cSayAge ;
      WHEN     .F. ;
      ID       341 ;
      OF       oFld:aDialogs[1]

   /*
   Segunda Pesta�a: Comercial--------------------------------------------------
   */

   REDEFINE GET aGet[_NBREST] VAR aTmp[_NBREST];
      ID       100 ;
      PICTURE  "@!" ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE GET aGet[_DIREST] VAR aTmp[_DIREST] ;
      ID       110 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE GET aGet[_CMEIINT] VAR aTmp[_CMEIINT] ;
      ID       120 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE GET aGet[_CWEBINT] VAR aTmp[_CWEBINT] ;
      ID       130 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE RADIO aGet[ _NREGIVA ] ;
      VAR      aTmp[ _NREGIVA ] ;
      ID       200,;
               220,;
               230,;
               240 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LREQ] ;
      ID       210 ;
      WHEN     ( aTmp[_NREGIVA] == 1 .AND. nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISLUN] ;
      ID       300 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISMAR] ;
      ID       310 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISMIE] ;
      ID       320 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISJUE] ;
      ID       330 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISVIE] ;
      ID       340 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISSAB] ;
      ID       350 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE CHECKBOX aTmp[_LVISDOM] ;
      ID       360 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      OF       oFld:aDialogs[2]

   REDEFINE GET aGet[ _NVISLUN ] ;
         VAR      aTmp[ _NVISLUN ] ;
         ID       400 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISLUN ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISMAR ] ;
         VAR      aTmp[ _NVISMAR ] ;
         ID       410 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMAR ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISMIE ] ;
         VAR aTmp[ _NVISMIE ] ;
         ID       420 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISMIE ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISJUE ] ;
         VAR aTmp[ _NVISJUE ] ;
         ID       430 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISJUE ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISVIE ] ;
         VAR aTmp[ _NVISVIE ] ;
         ID       440 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISVIE ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISSAB ] ;
         VAR aTmp[ _NVISSAB ] ;
         ID       450 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISSAB ] );
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NVISDOM ] ;
         VAR aTmp[ _NVISDOM ] ;
         ID       460 ;
         PICTURE  "999" ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LVISDOM ] );
         OF       oFld:aDialogs[2]

   /*
   Tercera Pesta�a: Tarifa--------------------------------------------------
   */

      REDEFINE BTNBMP aBtn[1] ;
         ID       100 ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 3 ] ;
         RESOURCE "New16" ;
         NOBORDER ;
         ACTION   ( WinAppRec( oBrwAtp, bAtpPda, dbfTmpAtp, aTmp, aGet ) )

      aBtn[1]:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE BTNBMP aBtn[2] ;
         ID       110 ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 3 ] ;
         RESOURCE "Edit16" ;
         NOBORDER ;
         ACTION   ( WinEdtRec( oBrwAtp, bAtpPda, dbfTmpAtp, aTmp, aGet ) )

      aBtn[2]:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE BTNBMP aBtn[3] ;
         ID       120 ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 3 ] ;
         RESOURCE "Del16" ;
         NOBORDER ;
         ACTION   ( dbDelRec( oBrwAtp, dbfTmpAtp ) )

      aBtn[3]:SetColor( 0, nRGB( 255, 255, 255 )  )

      REDEFINE BTNBMP aBtn[4] ;
         ID       130 ;
         WHEN     ( oUser():lCambiarPrecio() .and. nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 3 ] ;
         RESOURCE "Zoom16" ;
         NOBORDER ;
         ACTION   ( WinZooRec( oBrwAtp, bAtpPda, dbfTmpAtp, aTmp, aGet ) )

      aBtn[4]:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE COMBOBOX oFiltroAtp VAR cFiltroAtp ;
      ID       140 ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      ITEMS    aFiltroAtp ;
      ON CHANGE( FiltroAtipica( oFiltroAtp, dbfTmpAtp, oBrwAtp ) );
      OF       oFld:aDialogs[3]

   REDEFINE IBROWSE oBrwAtp ;
      FIELDS ;
               if( ( dbfTmpAtp )->nTipAtp <= 1, ( dbfTmpAtp )->cCodArt, ( dbfTmpAtp )->cCodFam ),;
               if( ( dbfTmpAtp )->nTipAtp <= 1, RetArticulo( ( dbfTmpAtp )->CCODART, dbfArticulo ), RetFamilia( ( dbfTmpAtp )->cCodFam, dbfFamilia ) ),;
               Tran( ( dbfTmpAtp )->nPrcArt,   cPouDiv ) ;
      TITLE ;
               "C�digo",;
               "Art�culo/Familia",;
               "Precio 1";
      SIZES ;
               100,;
               220,;
               80;
      JUSTIFY  .f., .f., .f. ;
      ALIAS    ( dbfTmpAtp ) ;
      OF       oFld:aDialogs[3] ;
      ID       150

   ACTIVATE DIALOG oDlg ;
      ON INIT ( oDlg:SetMenu( pdaMenuEdtCli( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ) ) )

   // Restauramos la ventana---------------------------------------------------

   oWnd():Show()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

static function pdaMenuEdtCli( aTmp, aGet, oDlg, dbfClient, oBrw, nMode )

   local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode ), oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

Return oMenu

//---------------------------------------------------------------------------//

STATIC FUNCTION AtpPda( aTmp, aGet, dbfTmpAtp, oBrw, aTmpCli, aGetCli, nMode )

   local oDlg
   local oFld
   local oGetArticulo
   local cGetArticulo
   local oGetFamilia
   local cGetFamilia
   local oSayPr1
   local oSayPr2
   local oSayVp1
   local oSayVp2
   local cSayPr1
   local cSayPr2
   local cSayVp1
   local cSayVp2
   local oCosto
   local cCosto
   local oSobre
   local cSobre         := "Precio 1"
   local aSobre         := { "Precio 1", "Precio 2", "Precio 3", "Precio 4", "Precio 5", "Precio 6" }
   local cNaturaleza    := "Art�culo"
   local aNaturaleza    := { "Art�culo", "Familia" }
   local oBrwRen
   local cPouEmp        := cPouDiv( cDivEmp(), dbfDiv )
   local cPouChg        := cPouDiv( cDivChg(), dbfDiv )
   local oBtnRen
   local oSayLabels     := Array( 16 )

   if nMode == APPD_MODE

      cCosto            := 0
      aTmp[ _aCCODCLI ] := aTmpCli[ _COD ]
      aTmp[ _aDFECINI ] := Ctod( "" )
      aTmp[ _aDFECFIN ] := Ctod( "" )
      aTmp[ _aLAPLPRE ] := .t.
      aTmp[ _aLAPLPED ] := .t.
      aTmp[ _aLAPLALB ] := .t.
      aTmp[ _aLAPLFAC ] := .t.
      aTmp[ _aNTIPXBY ] := 2
      aTmp[ _aNUNVOFE ] := 1
      aTmp[ _aNUNCOFE ] := 1

      if !Empty( aTmpCli[ _CAGENTE ] )
         if ( cAgente )->( dbSeek( aTmpCli[ _CAGENTE ] ) )
            aTmp[ _aNCOMAGE ]    := ( cAgente )->nCom1
            if ( cAgente )->nCom1 != 0
               aTmp[ _aLCOMAGE ] := .t.
            end if
         end if
      end if

   else

      cNaturaleza       := Max( Min( aTmp[ _aNTIPATP ], len( aNaturaleza ) ), 1 )

      cGetArticulo      := RetArticulo( aTmp[ _aCCODART ] )

      if !Empty( aTmp[ _aCCODPR1 ] )
         cSayPr1        := retProp( aTmp[ _aCCODPR1 ], dbfPro )
         cSayVp1        := retValProp( aTmp[ _aCCODPR1 ] + aTmp[ _aCVALPR1 ], dbfProL )
      end if

      if !Empty( aTmp[ _aCCODPR2 ] )
         cSayPr2        := retProp( aTmp[ _aCCODPR2 ], dbfPro )
         cSayVp2        := retValProp( aTmp[ _aCCODPR2 ] + aTmp[ _aCVALPR2 ], dbfProL )
      end if

      cGetFamilia       := retFld( aTmp[ _aCCODFAM ], dbfFamilia )

   end if

   DEFINE DIALOG oDlg RESOURCE "ATIPICA_PDA"

      REDEFINE COMBOBOX aGet[ _aNTIPATP ] VAR cNaturaleza ;
         ITEMS    aNaturaleza ;
         ID       100 ;
         ON CHANGE( ChangeNaturaleza( aGet, aTmp, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oCosto, nMode, oSayLabels ) ) ;
         WHEN     ( nMode == APPD_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ _aCCODART ] VAR aTmp[ _aCCODART ];
         ID       110 ;
         WHEN     ( nMode == APPD_MODE );
         ON HELP  ( BrwArticulo( aGet[ 2 ], oGetArticulo ) );
         BITMAP   "LUPA" ;
         VALID    ( IsCliAtp( aGet, aTmp, oGetArticulo, dbfCliAtp, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oCosto ) ) ;
         OF       oDlg

      REDEFINE GET oGetArticulo VAR cGetArticulo ;
         ID       120 ;
			WHEN  	( .F. );
         OF       oDlg

      REDEFINE GET aGet[ _aCCODFAM ] VAR aTmp[ _aCCODFAM ];
         ID       130 ;
         WHEN     ( nMode == APPD_MODE );
         VALID    cFamilia( aGet[ _aCCODFAM ], dbfFamilia, oGetFamilia ) ;
         BITMAP   "LUPA" ;
         ON HELP  pdaBrwFamilia( aGet[ _aCCODFAM ], oGetFamilia ) ;
         OF       oDlg

      REDEFINE GET oGetFamilia VAR cGetFamilia ;
         ID       140 ;
         WHEN     ( .F. );
         OF       oDlg

      REDEFINE GET aGet[ _aNDTOART ] VAR aTmp[ _aNDTOART ];
         ID       200 ;
         WHEN     ( nMode != ZOOM_MODE );
			SPINNER ;
         VALID    ( ( aTmp[_aNDTOART] >= 0 .AND. aTmp[_aNDTOART] <= 100 ) )  ;
         PICTURE  "@E 999.99";
         OF       oDlg

      REDEFINE GET aGet[ _aNDTODIV ] VAR aTmp[ _aNDTODIV ];
         ID       210 ;
         WHEN     ( nMode != ZOOM_MODE );
         SPINNER ;
         PICTURE  cPouDiv ;
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART ] VAR aTmp[ _aNPRCART ];
         ID       300 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA1 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART2 ] VAR aTmp[ _aNPRCART2 ];
         ID       310 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART2 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA2 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART3 ] VAR aTmp[ _aNPRCART3 ];
         ID       320 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART3 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA3 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART4 ] VAR aTmp[ _aNPRCART4 ];
         ID       330 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART4 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA4 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART5 ] VAR aTmp[ _aNPRCART5 ];
         ID       340 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART5 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA5 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPRCART6 ] VAR aTmp[ _aNPRCART6 ];
         ID       350 ;
         SPINNER  ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .and. nMode != ZOOM_MODE .and. !( dbfArticulo )->lIvaInc );
         VALID    ( CalIva( aTmp[ _aNPRCART6 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPREIVA6 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA1 ] VAR aTmp[ _aNPREIVA1 ] ;
         ID       360 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA1 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA2 ] VAR aTmp[ _aNPREIVA2 ] ;
         ID       370 ;
         PICTURE  cPouDiv ;
         SPINNER ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA2 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART2 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA3 ] VAR aTmp[ _aNPREIVA3 ] ;
         ID       380 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA3 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART3 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA4 ] VAR aTmp[ _aNPREIVA4 ] ;
         ID       390 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA4 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART4 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA5 ] VAR aTmp[ _aNPREIVA5 ] ;
         ID       400 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA5 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART5 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aNPREIVA6 ] VAR aTmp[ _aNPREIVA6 ] ;
         ID       410 ;
         SPINNER ;
         PICTURE  cPouDiv ;
         WHEN     ( aTmp[ _aNTIPATP ] <= 1 .AND. nMode != ZOOM_MODE .and. ( dbfArticulo )->lIvaInc ) ;
         VALID    ( CalBas( aTmp[ _aNPREIVA6 ], ( dbfArticulo )->lIvaInc, ( dbfArticulo )->TipoIva, ( dbfArticulo )->cCodImp, aGet[ _aNPRCART6 ] ) );
         OF       oDlg

      REDEFINE GET aGet[ _aDFECINI ] VAR aTmp[ _aDFECINI ];
         ID       500 ;
         WHEN     ( nMode != ZOOM_MODE );
         OF       oDlg

      REDEFINE GET aGet[ _aDFECFIN ] VAR aTmp[ _aDFECFIN ];
         ID       510 ;
         WHEN     ( nMode != ZOOM_MODE );
         OF       oDlg

   ACTIVATE DIALOG oDlg ;
      ON INIT ( oDlg:SetMenu( pdaMenuAtpCli( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode ) ) )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

static function pdaMenuAtpCli( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode )

   local oMenu

   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( SaveEdtAtp( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode ), oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

Return oMenu

//---------------------------------------------------------------------------//
#endif
//---------------------------------------------------------------------------//

CLASS pdaClienteSenderReciver

   Method CreateData()

   Method CleanRelation()

END CLASS

//---------------------------------------------------------------------------//

Method CreateData( oPgrActual, oSayStatus, cPatPreVenta ) CLASS pdaClienteSenderReciver

   local lExist      := .f.
   local pdaCliAtp
   local pdaClient
   local pdaObrasT
   local pdaContactos
   local dbfClient
   local dbfCliAtp
   local dbfObrasT
   local dbfContactos
   local cPatPc      := if( Empty( cPatPreVenta ), cPatPc(), cPatPreVenta )

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @pdaClient ) )
   SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @pdaCliAtp ) )
   SET ADSINDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE

   USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @pdaObrasT ) )
   SET ADSINDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

   USE ( cPatCli() + "CliContactos.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLICONTA", @pdaContactos ) )
   SET ADSINDEX TO ( cPatCli() + "CliContactos.Cdx" ) ADDITIVE

   /*
   Usamos las bases de datos del PC--------------------------------------------
   */

   dbUseArea( .t., cDriver(), cPatPc + "Client.Dbf", cCheckArea( "Client", @dbfClient ), .t. )
   ( dbfClient )->( ordListAdd( cPatPc + "Client.Cdx" ) )
   ( dbfClient )->( OrdSetFocus( "lSndEnviar" ) )

   dbUseArea( .t., cDriver(), cPatPc + "CliAtp.Dbf", cCheckArea( "CliAtp", @dbfCliAtp ), .t. )
   ( dbfCliAtp )->( ordListAdd( cPatPc + "CliAtp.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatPc + "ObrasT.Dbf", cCheckArea( "ObrasT", @dbfObrasT ), .t. )
   ( dbfObrasT )->( ordListAdd( cPatPc + "ObrasT.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatPc + "CliContactos.Dbf", cCheckArea( "CLICONTA", @dbfContactos ), .t. )
   ( dbfContactos )->( ordListAdd( cPatPc + "CliContactos.Cdx" ) )

   if !Empty( oPgrActual )
      oPgrActual:SetRange( 0, ( dbfClient )->( OrdKeyCount() ) )
   end if

   ( dbfClient )->( dbGoTop() )
   while !( dbfClient )->( eof() )

      ::CleanRelation( ( dbfClient )->Cod, pdaCliAtp, pdaObrasT, pdaContactos )

      if ( pdaClient )->( dbSeek( ( dbfClient )->Cod ) )
         dbPass( dbfClient, pdaClient, .f. )
      else
         dbPass( dbfClient, pdaClient, .t. )
      end if

      /*
      Situaciones atipicas--------------------------------------------------
      */

      if ( dbfCliAtp )->( dbSeek( ( dbfClient )->Cod ) )
         while ( dbfCliAtp )->cCodCli == ( dbfClient )->Cod .and. !( dbfCliAtp )->( eof() )
            dbPass( dbfCliAtp, pdaCliAtp, .t. )
            ( dbfCliAtp )->( dbSkip() )
         end while
      end if

      /*
      Situaciones atipicas----------------------------------------------------
      */

      if ( dbfObrasT )->( dbSeek( ( dbfClient )->Cod ) )
         while ( dbfObrasT )->cCodCli == ( dbfClient )->Cod .and. !( dbfObrasT )->( eof() )
            dbPass( dbfObrasT, pdaObrasT, .t. )
            ( dbfObrasT )->( dbSkip() )
         end while
      end if

      /*
      Situaciones atipicas----------------------------------------------------
      */

      if ( dbfContactos )->( dbSeek( ( dbfClient )->Cod ) )
         while ( dbfContactos )->cCodCli == ( dbfClient )->Cod .and. !( dbfContactos )->( eof() )
            dbPass( dbfContactos, pdaContactos, .t. )
            ( dbfContactos )->( dbSkip() )
         end while
      end if

      /*
      Desmarcamos el cliente------------------------------------------------
      */

      if dbLock( dbfClient )
         ( dbfClient )->lSndInt        := .f.
         ( dbfClient )->( dbUnLock() )
      end if

      /*
      Siguiente cliente--------------------------------------------------------
      */

      ( dbfClient )->( dbSkip() )

      if !Empty( oSayStatus )
         oSayStatus:SetText( "Sincronizando clientes " + Alltrim( Str( ( dbfClient )->( OrdKeyNo() ) ) ) + " de " + Alltrim( Str( ( dbfClient )->( OrdKeyCount() ) ) ) )
      end if

      SysRefresh()

      if !Empty( oPgrActual )
         oPgrActual:SetPos( ( dbfClient )->( OrdKeyNo() ) )
      end if

      SysRefresh()

   end while

   CLOSE ( dbfClient    )
   CLOSE ( dbfCliAtp    )
   CLOSE ( dbfObrasT    )
   CLOSE ( dbfContactos )
   CLOSE ( pdaClient    )
   CLOSE ( pdaCliAtp    )
   CLOSE ( pdaObrasT    )
   CLOSE ( pdaContactos )

Return ( Self )

//----------------------------------------------------------------------------//

Method CleanRelation( cCodCli, dbfCliAtp, dbfObrasT, dbfContactos ) CLASS pdaClienteSenderReciver

   while ( dbfCliAtp )->( dbSeek( cCodCli ) )
      dbDel( dbfCliAtp )
   end while

   while ( dbfObrasT )->( dbSeek( cCodCli ) )
      dbDel( dbfObrasT )
   end while

   while ( dbfContactos )->( dbSeek( cCodCli ) )
      dbDel( dbfContactos )
   end while

   SysRefresh()

Return Self

//---------------------------------------------------------------------------//
//Funciones comunes del programa y pda
//----------------------------------------------------------------------------//

Function IsClient( cPath )

   DEFAULT cPath  := cPatCli()

   if !lExistTable( cPath + "Client.Dbf" )
      dbCreate( cPath + "Client.Dbf", aSqlStruct( aItmCli() ), cDriver() )
   end if

   if !lExistTable( cPath + "CliAtp.Dbf" )
      dbCreate( cPath + "CliAtp.Dbf", aSqlStruct( aItmAtp() ), cDriver() )
   end if

   if !lExistTable( cPath + "ObrasT.Dbf" )
      dbCreate( cPath + "ObrasT.Dbf", aSqlStruct( aItmObr() ), cDriver() )
   end if

   if !lExistTable( cPath + "ClientD.Dbf" )
      dbCreate( cPath + "ClientD.Dbf", aSqlStruct( aCliDoc() ), cDriver() )
   end if

   if !lExistTable( cPath + "CliBnc.Dbf" )
      dbCreate( cPath + "CliBnc.Dbf", aSqlStruct( aCliBnc() ), cDriver() )
   end if

   if !lExistTable( cPath + "CliInc.Dbf" )
      dbCreate( cPath + "CliInc.Dbf", aSqlStruct( aCliInc() ), cDriver() )
   end if

   if !lExistIndex( cPath + "Client.Cdx"  ) .or. ;
      !lExistIndex( cPath + "CliAtp.Cdx"  ) .or. ;
      !lExistIndex( cPath + "ObrasT.Cdx"  ) .or. ;
      !lExistTable( cPath + "ClientD.Dbf" ) .or. ;
      !lExistTable( cPath + "CliBnc.Cdx"  ) .or. ;
      !lExistTable( cPath + "CliInc.Cdx"  )

      rxClient( cPath )

   end if

Return ( .t. )

//---------------------------------------------------------------------------//

/*
Crea las BD clientes
*/

FUNCTION mkClient( cPath, lAppend, cPathOld, oMeter )

   DEFAULT lAppend      := .f.

   IF oMeter != NIL
		oMeter:cText		:= "Generando Bases"
      sysRefresh()
	END IF

   CreateFiles( cPath )
   rxClient( cPath, oMeter )

   if lAppend .and. lIsDir( cPathOld )
      AppDbf( cPathOld, cPath, "Client"         )
      AppDbf( cPathOld, cPath, "CliAtp"         )
      AppDbf( cPathOld, cPath, "ObrasT"         )
      AppDbf( cPathOld, cPath, "CliBnc"         )
      AppDbf( cPathOld, cPath, "CliInc"         )
      AppDbf( cPathOld, cPath, "CliContactos"   )
   end if

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION rxClient( cPath, oMeter )

   local dbfClient

   DEFAULT cPath  := cPatCli()

   if !lExistTable( cPath + "Client.Dbf"  )     .or.;
      !lExistTable( cPath + "CliAtp.Dbf"  )     .or.;
      !lExistTable( cPath + "ObrasT.Dbf"  )     .or.;
      !lExistTable( cPath + "CliBnc.Dbf"  )     .or.;
      !lExistTable( cPath + "CliInc.Dbf"  )     .or.;
      !lExistTable( cPath + "ClientD.Dbf" )     .or.;
      !lExistTable( cPath + "CliContactos.Dbf" )

      CreateFiles( cPath )

   end if

   fEraseIndex( cPath + "CLIENT.CDX" )

   dbUseArea( .t., cDriver(), cPath + "CLIENT.DBF", cCheckArea( "CLIENT", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "COD", "Field->COD", {|| Field->COD } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "TITULO", "UPPER( Field->TITULO )", {|| UPPER( Field->TITULO ) }, ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "NIF", "Field->NIF", {|| Field->NIF }, ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "POBLACION", "UPPER( Field->POBLACION )", {|| UPPER( Field->POBLACION ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "PROVINCIA", "UPPER( Field->PROVINCIA )", {|| UPPER( Field->PROVINCIA ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "CodPostal", "Field->CodPostal", {|| Field->CodPostal } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "Telefono", "Field->Telefono", {|| Field->Telefono } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "NbrEst", "Field->NbrEst", {|| Field->NbrEst } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cMeiInt", "Upper( Field->cMeiInt )", {|| Upper( Field->cMeiInt ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted() .and. nTipCli == 3", {||!Deleted() .and. Field->nTipCli == 3 } ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cCliWeb", "COD", {|| Field->COD } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "CCODRUT", "UPPER( Field->CCODRUT )", {|| UPPER( Field->CCODRUT ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "lSndInt", "Field->lSndInt", {|| Field->lSndInt } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "Client.Cdx", "cCodUsr", "Field->cCodUsr + Dtos( Field->dFecChg ) + Field->cTimChg", {|| Field->cCodUsr + Dtos( Field->dFecChg ) + Field->cTimChg } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "CODBIG", "UPPER( Field->COD )", {|| UPPER( Field->COD ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cCodWeb", "Str( Field->cCodWeb, 11 )", {|| Str( Field->cCodWeb, 11 ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted() .and. Field->lSndInt" , {||!Deleted() .and. Field->lSndInt }  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "lSndEnviar", "Field->Cod", {|| Field->Cod } ) )

      ( dbfClient )->( ordCondSet("!Deleted() .and. Field->lSndInt .and. Field->lPubInt" , {||!Deleted() .and. Field->lSndInt .and. Field->lPubInt }  ) )
      ( dbfClient )->( ordCreate( cPath + "Client.CDX", "lPubInt", "Field->Cod", {|| Field->Cod } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cUsrDef01", "UPPER( Field->cUsrDef01 )", {|| UPPER( Field->cUsrDef01 ) } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cUsrDef02", "UPPER( Field->cUsrDef02 )", {|| UPPER( Field->cUsrDef02 ) } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "cUsrDef03", "UPPER( Field->cUsrDef03 )", {|| UPPER( Field->cUsrDef03 ) } ) )

      ( dbfClient )->( ordCondSet( "!Deleted() .and. !Field->lBlqCli", {|| !Deleted() .and. !Field->lBlqCli }  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIENT.CDX", "lBlqCli", "Field->Cod", {|| Field->Cod } ) )

      ( dbfClient )->( dbCloseArea() )

   else

      msgStop( "Imposible abrir en modo exclusivo la tabla de clientes" )

   end if

   fEraseIndex( cPath + "CliAtp.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "CliAtp.Dbf", cCheckArea( "CLIATP", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )

      while !( dbfClient )->( eof() )
         if ( dbfClient )->nTipAtp == 0
            ( dbfClient )->nTipAtp  := 1
         end if
         ( dbfClient )->( dbSkip() )
      end while

      ( dbfClient )->( dbGoTop() )

      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "CliAtp.Cdx", "cCodCli", "cCodCli", {|| Field->cCodCli } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliAtp.Cdx", "cCliArt", "cCodCli + cCodArt", {|| Field->cCodCli + Field->cCodArt } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliAtp.Cdx", "cCodArt", "cCodCli + cCodArt + cCodPr1 + cCodPr2 + cValPr1 + cValPr2", {|| Field->CCODCLI + Field->CCODART + Field->CCODPR1 + Field->CCODPR2 + Field->CVALPR1 + Field->CVALPR2 } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CLIATP.CDX", "CCODFAM", "CCODCLI + CCODFAM", {|| Field->CCODCLI + Field->CCODFAM } ) )

      ( dbfClient )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de atipicas" )
   end if

   fEraseIndex( cPath + "ObrasT.CDX" )

   dbUseArea( .t., cDriver(), cPath + "OBRAST.DBF", cCheckArea( "OBRAST", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "OBRAST.CDX", "CCODCLI", "cCodCli + cCodObr", {|| Field->cCodCli + Field->cCodObr } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "ObrasT.Cdx", "CNOMOBR", "cCodCli + cNomObr", {|| Field->cCodCli + Field->cNomObr } ) )

      ( dbfClient )->( ordCondSet("lDefObr .and. !Deleted()", {|| Field->lDefObr .and. !Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "OBRAST.CDX", "LDEFOBR", "cCodCli + cCodObr", {|| Field->cCodCli + Field->cCodObr } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "OBRAST.CDX", "CCODIGO", "cCodObr", {|| Field->cCodObr } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "ObrasT.Cdx", "CNOMBRE", "cNomObr", {|| Field->cNomObr } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "ObrasT.Cdx", "CCODWEB", "Str( cCodWeb, 11 )", {|| Str( Field->cCodWeb, 11 ) } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "ObrasT.Cdx", "CDIROBR", "Upper( cDirObr )", {|| Upper( Field->cDirObr ) } ) )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "OBRAST.CDX", "cCodPos", "cCodPos", {|| Field->cCodPos } ) )

      ( dbfClient )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de obras" )
   end if

   fEraseIndex( cPath + "CliBnc.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "CliBnc.DBF", cCheckArea( "CliBnc", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliBnc.CDX", "cCodCli", "cCodCli + cCodBnc", {|| Field->cCodCli + Field->cCodBnc } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfClient )->( ordCreate( cPath + "CliBnc.CDX", "cCtaBnc", "cCodCli + cEntBnc + cSucBnc + cDigBnc + cCtaBnc", {|| Field->cCodCli + Field->cEntBnc + Field->cSucBnc + Field->cDigBnc + Field->cCtaBnc } ) )

      ( dbfClient )->( ordCondSet("!Deleted() .and. lBncDef", {|| !Deleted() .and. Field->lBncDef } ) )
      ( dbfClient )->( ordCreate( cPath + "CliBnc.CDX", "cBncDef", "cCodCli + cCodBnc", {|| Field->cCodCli + Field->cCodBnc } ) )

      ( dbfClient )->( ordCondSet("!Deleted() .and. lBncDef", {|| !Deleted() .and. Field->lBncDef } ) )
      ( dbfClient )->( ordCreate( cPath + "CliBnc.CDX", "cCodDef", "cCodCli + cEntBnc + cSucBnc + cDigBnc + cCtaBnc", {|| Field->CCODCLI + Field->CENTBNC + Field->CSUCBNC + Field->CDIGBNC + Field->CCTABNC } ) )

      ( dbfClient )->( dbCloseArea() )

   else

      msgStop( "Imposible abrir en modo exclusivo la tabla de bancos de clientes" )

   end if

   fEraseIndex( cPath + "ClientD.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "ClientD.DBF", cCheckArea( "ClientD", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "ClientD.CDX", "cCodCli", "cCodCli", {|| Field->cCodCli } ) )

      ( dbfClient )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de documentos" )
   end if

   fEraseIndex( cPath + "CliInc.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "CliInc.Dbf", cCheckArea( "CliInc", @dbfClient ), .f. )
   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliInc.Cdx", "CCODCLI", "CCODCLI", {|| Field->CCODCLI } ) )

      ( dbfClient )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de incidencias" )
   end if


   // Tabla de contactos-------------------------------------------------------

   fEraseIndex( cPath + "CliContactos.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "CliContactos.Dbf", cCheckArea( "CLICONTA", @dbfClient ), .f. )

   if !( dbfClient )->( neterr() )
      ( dbfClient )->( __dbPack() )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cCodCli", "cCodCli", {|| Field->cCodCli } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cNomCon", "cNomCon", {|| Field->cNomCon } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cPosCon", "cPosCon", {|| Field->cPosCon } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cTelCon", "cTelCon", {|| Field->cTelCon } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cMovCon", "cMovCon", {|| Field->cMovCon } ) )

      ( dbfClient )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfClient )->( ordCreate( cPath + "CliContactos.Cdx", "cMaiCon", "cMaiCon", {|| Field->cMaiCon } ) )

      ( dbfClient )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de contactos de clientes." )
   end if

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION CreateFiles( cPath )

   IF !lExistTable( cPath + "CLIENT.DBF" )
      dbCreate( cPath + "CLIENT.DBF", aSqlStruct( aItmCli() ), cDriver() )
	END IF

   IF !lExistTable( cPath + "CLIATP.DBF" )
      dbCreate( cPath + "CLIATP.DBF", aSqlStruct( aItmAtp() ), cDriver() )
	END IF

   IF !lExistTable( cPath + "OBRAST.DBF" )
      dbCreate( cPath + "OBRAST.DBF", aSqlStruct( aItmObr() ), cDriver() )
	END IF

   IF !lExistTable( cPath + "CLIENTD.DBF" )
      dbCreate( cPath + "CLIENTD.DBF", aSqlStruct( aCliDoc() ), cDriver() )
   END IF

   IF !lExistTable( cPath + "CLIBNC.DBF" )
      dbCreate( cPath + "CLIBNC.DBF", aSqlStruct( aCliBnc() ), cDriver() )
   END IF

   if !lExistTable( cPath + "CLIINC.DBF" )
      dbCreate( cPath + "CLIINC.DBF", aSqlStruct( aCliInc() ), cDriver() )
   end if

   if !lExistTable( cPath + "CLICONTACTOS.Dbf" )
      dbCreate( cPath + "CLICONTACTOS.Dbf", aSqlStruct( aItmContacto() ), cDriver() )
   end if

RETURN NIL

//---------------------------------------------------------------------------//

function aCliInc()

   local aBase := {}

   aAdd( aBase, { "cCodCli",     "C", 12, 0, "C�digo del cliente",               "",                   "", "( cDbfInc )" } )
   aAdd( aBase, { "cCodTip",     "C",  3, 0, "Tipo de incidencia" ,              "",                   "", "( cDbfInc )" } )
   aAdd( aBase, { "dFecInc",     "D",  8, 0, "Fecha de la incidencia" ,          "",                   "", "( cDbfInc )" } )
   aAdd( aBase, { "mDesInc",     "M", 10, 0, "Descripci�n de la incidencia" ,    "",                   "", "( cDbfInc )" } )
   aAdd( aBase, { "lListo",      "L",  1, 0, "L�gico de listo" ,                 "",                   "", "( cDbfInc )" } )
   aAdd( aBase, { "lAviso",      "L",  1, 0, "L�gico de aviso" ,                 "",                   "", "( cDbfInc )" } )

return ( aBase )

//---------------------------------------------------------------------------//

FUNCTION aCliBnc()

   local aBase := {}

   aAdd( aBase, { "cCodCli",     "C", 12, 0, "C�digo del cliente",                        "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "lBncDef",     "L",  1, 0, "L�gico banco por defecto",                  "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cCodBnc",     "C", 50, 0, "Nombre del banco",                          "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cDirBnc",     "C", 35, 0, "Domicilio del banco",                       "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cPobBnc",     "C", 25, 0, "Poblaci�n del banco",                       "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cProBnc",     "C", 20, 0, "Provincia del banco",                       "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cCPBnc",      "C", 15, 0, "C�digo postal",                             "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cTlfBnc",     "C", 20, 0, "Tel�fono",                                  "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cFaxBnc",     "C", 20, 0, "Fax",                                       "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cPContBnc",   "C", 35, 0, "Persona de contacto",                       "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cPaiBnc",     "C",  4, 0, "Pais",                                      "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cEntBnc",     "C",  4, 0, "Entidad de la cuenta bancaria",             "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cSucBnc",     "C",  4, 0, "Sucursal de la cuenta bancaria",            "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cDigBnc",     "C",  2, 0, "D�gito de control de la cuenta bancaria",   "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "cCtaBnc",     "C", 20, 0, "Cuenta bancaria",                           "",                   "", "( cDbfBnc )" } )
   aAdd( aBase, { "nSalIni",     "N", 16, 6, "Saldo inicial",                             "",                   "", "( cDbfBnc )" } )

RETURN ( aBase )

//----------------------------------------------------------------------------//

function aCliDoc()

   local aCliDoc  := {}

   aAdd( aCliDoc, { "cCodCli", "C",   12,  0, "C�digo del cliente" ,             "",                   "", "( cDbfCol )" } )
   aAdd( aCliDoc, { "cNombre", "C",  250,  0, "Nombre del documento" ,           "",                   "", "( cDbfCol )" } )
   aAdd( aCliDoc, { "cRuta",   "C",  250,  0, "Ruta del documento" ,             "",                   "", "( cDbfCol )" } )
   aAdd( aCliDoc, { "mObsDoc", "M",   10,  0, "Observaciones del documento" ,    "",                   "", "( cDbfCol )" } )

return ( aCliDoc )

//--------------------------------------------------------------------------//

FUNCTION aItmAtp()

   local aBase := {}

   aAdd( aBase,  { "cCodCli",   "C", 12, 0, "C�digo del cliente"}                      )
   aAdd( aBase,  { "cCodArt",   "C", 18, 0, "C�digo de art�culo en atipicas" }         )
   aAdd( aBase,  { "cCodFam",   "C", 16, 0, "C�digo de familias en atipicas" }         )
   aAdd( aBase,  { "nTipAtp",   "N",  1, 0, "Tipo de at�picas" }                       )
   aAdd( aBase,  { "cCodPr1",   "C", 10, 0, "C�digo propiedad 1" }                     )
   aAdd( aBase,  { "cValPr1",   "C", 10, 0, "Valor propiedad 1" }                      )
   aAdd( aBase,  { "cCodPr2",   "C", 10, 0, "C�digo propiedad 2" }                     )
   aAdd( aBase,  { "cValPr2",   "C", 10, 0, "Valor propiedad 2" }                      )
   aAdd( aBase,  { "dFecIni",   "D",  8, 0, "Fecha inicio de la situaci�n atipica" }   )
   aAdd( aBase,  { "dFecFin",   "D",  8, 0, "Fecha fin de la situaci�n atipica" }      )
   aAdd( aBase,  { "lPrcCom",   "L",  1, 0, "L�gico para precio de compras personal" } )
   aAdd( aBase,  { "nPrcCom",   "N", 16, 6, "Precio de coste" }                        )
   aAdd( aBase,  { "nPrcArt",   "N", 16, 6, "Precio de venta 1 del art�culo" }         )
   aAdd( aBase,  { "nPrcArt2",  "N", 16, 6, "Precio de venta 2 del art�culo" }         )
   aAdd( aBase,  { "nPrcArt3",  "N", 16, 6, "Precio de venta 3 del art�culo" }         )
   aAdd( aBase,  { "nPrcArt4",  "N", 16, 6, "Precio de venta 4 del art�culo" }         )
   aAdd( aBase,  { "nPrcArt5",  "N", 16, 6, "Precio de venta 5 del art�culo" }         )
   aAdd( aBase,  { "nPrcArt6",  "N", 16, 6, "Precio de venta 6 del art�culo" }         )
   aAdd( aBase,  { "nPreIva1",  "N", 16, 6, "Precio de venta 1 con " + cImp() }              )
   aAdd( aBase,  { "nPreIva2",  "N", 16, 6, "Precio de venta 2 con " + cImp() }              )
   aAdd( aBase,  { "nPreIva3",  "N", 16, 6, "Precio de venta 3 con " + cImp() }              )
   aAdd( aBase,  { "nPreIva4",  "N", 16, 6, "Precio de venta 4 con " + cImp() }              )
   aAdd( aBase,  { "nPreIva5",  "N", 16, 6, "Precio de venta 5 con " + cImp() }              )
   aAdd( aBase,  { "nPreIva6",  "N", 16, 6, "Precio de venta 6 con " + cImp() }              )
   aAdd( aBase,  { "nDtoArt",   "N",  6, 2, "Descuento del articulo" }                 )
   aAdd( aBase,  { "nDprArt",   "N",  6, 2, "Descuento promocional del articulo" }     )
   aAdd( aBase,  { "lComAge",   "L",  1, 0, "L�gico para tener en cuenta el porcentaje o no" } )
   aAdd( aBase,  { "nComAge",   "N",  6, 2, "Comisi�n del agente" }                    )
   aAdd( aBase,  { "nDtoDiv",   "N", 16, 6, "Descuento lineal" }                       )
   aAdd( aBase,  { "lAplPre",   "L",  1, 0, "Aplicar en presupuestos" }                )
   aAdd( aBase,  { "lAplPed",   "L",  1, 0, "Aplicar en pedidos" }                     )
   aAdd( aBase,  { "lAplAlb",   "L",  1, 0, "Aplicar en albaranes" }                   )
   aAdd( aBase,  { "lAplFac",   "L",  1, 0, "Aplicar en facturas" }                    )
   aAdd( aBase,  { "nUnvOfe",   "N",  3, 0, "Unidades a vender en la oferta" }         )
   aAdd( aBase,  { "nUncOfe",   "N",  3, 0, "Unidades a cobrar en la oferta" }         )
   aAdd( aBase,  { "nTipXby",   "N",  1, 0, "Tipo de oferta" }                         )
   aAdd( aBase,  { "nDto1",     "N",  6, 2, "Descuento de tarifa de venta 1" }         )
   aAdd( aBase,  { "nDto2",     "N",  6, 2, "Descuento de tarifa de venta 2" }         )
   aAdd( aBase,  { "nDto3",     "N",  6, 2, "Descuento de tarifa de venta 3" }         )
   aAdd( aBase,  { "nDto4",     "N",  6, 2, "Descuento de tarifa de venta 4" }         )
   aAdd( aBase,  { "nDto5",     "N",  6, 2, "Descuento de tarifa de venta 5" }         )
   aAdd( aBase,  { "nDto6",     "N",  6, 2, "Descuento de tarifa de venta 6" }         )

RETURN ( aBase )

//---------------------------------------------------------------------------//

FUNCTION aItmCli()

   local aBase := {}

   aAdd( aBase, { "Cod",       "C", 12, 0, "C�digo",                                        "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Titulo",    "C", 80, 0, "Nombre",                                        "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Nif",       "C", 15, 0, "NIF",                                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Domicilio", "C",100, 0, "Domicilio",                                     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Poblacion", "C", 35, 0, "Poblaci�n",                                     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Provincia", "C", 20, 0, "Provincia",                                     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CodPostal", "C", 15, 0, "C�digo postal",                                 "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Telefono",  "C", 20, 0, "Tel�fono",                                      "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Fax",       "C", 20, 0, "Fax",                                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Movil",     "C", 20, 0, "M�vil",                                         "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NbrEst",    "C", 35, 0, "Nombre del establecimiento" ,                   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Direst",    "C", 35, 0, "Domicilio del servicio" ,                       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "DiaPago",   "N",  2, 0, "Primer d�a de pago",                            "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "DiaPago2",  "N",  2, 0, "Segundo d�a de pago",                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Banco",     "C", 50, 0, "Nombre del banco",                              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "DirBanco",  "C", 35, 0, "Domicilio del banco",                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "PobBanco",  "C", 25, 0, "Poblaci�n del banco",                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cProBanco", "C", 20, 0, "Provincia del banco",                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Cuenta",    "C", 20, 0, "",                                              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nTipCli",   "N",  1, 0, "Tipo",                                          "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CodPago",   "C",  2, 0, "C�digo del tipo de pago",                       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cDtoEsp",   "C", 50, 0, "Descripci�n del descuento por factura" ,        "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoEsp",   "N",  6, 2, "Porcentaje de descuento por factura" ,          "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cDpp",      "C", 50, 0, "Descripci�n del descuento por pronto pago" ,    "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDpp",      "N",  6, 2, "Porcentaje de descuento por pronto pago" ,      "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoCnt",   "N",  6, 2, "Porcentaje del primer dto personalizado" ,      "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoRap",   "N",  6, 2, "Porcentaje del segundo dto personalizado" ,     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cDtoUno",   "C", 50, 0, "Descripci�n del primer dto personalizado" ,     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cDtoDos",   "C", 50, 0, "Descripci�n del segundo dto personalizado" ,    "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoPtf",   "N",  6, 2, "Importe de descuento plataforma" ,              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Riesgo",    "N", 16, 6, "Importe maximo autorizado para operaciones",    "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CopiasF",   "N",  1, 0, "N�mero de facturas a imprimir",                 "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "Serie",     "C",  1, 0, "C�digo de la serie de facturas",                "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nRegIva",   "N",  1, 0, "Regimen de " + cImp(),                                "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LREQ",      "L",  1, 0, "L�gico para recargo de equivalencia (S/N)",     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "SUBCTA",    "C", 12, 0, "Subcuenta cliente enlace contaplus",            "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CTAVENTA",  "C",  3, 0, "Cuenta venta cliente contaplus",                "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGENTE",   "C",  3, 0, "C�digo agente comercial",                       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LMAYORISTA","L",  1, 0, "Utilizar precio de mayorista (S/N)" ,           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NTARIFA",   "N",  1, 0, "Tarifa a aplicar" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LLABEL",    "L",  1, 0, "L�gico para etiquetado (S/N)" ,                 "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NLABEL",    "N",  5, 0, "N�mero de etiquetas a imprimir" ,               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODTAR",   "C",  5, 0, "C�digo de tarifa" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "MCOMENT",   "M", 10, 0, "Memo para comentarios" ,                        "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODRUT",   "C",  4, 0, "C�digo de ruta" ,                               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODRUT2",  "C",  4, 0, "C�digo de ruta alternativa" ,                   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODPAI",   "C",  4, 0, "C�digo de pa�s" ,                               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODGRP",   "C",  4, 0, "C�digo de grupo de cliente" ,                   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODREM",   "C",  3, 0, "C�digo de remesa" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CMEIINT",   "C", 65, 0, "Correo electr�nico" ,                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CWEBINT",   "C", 65, 0, "P�gina web" ,                                   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LCHGPRE",   "L",  1, 0, "L�gico para autorizacion de venta de cr�dito" , "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LCRESOL",   "L",  1, 0, "L�gico para credito solicitado" ,               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LPNTVER",   "L",  1, 0, "L�gico para operar con punto verde" ,           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF01", "C",100, 0, "Campo definido 1" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF02", "C",100, 0, "Campo definido 2" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF03", "C",100, 0, "Campo definido 3" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF04", "C",100, 0, "Campo definido 4" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF05", "C",100, 0, "Campo definido 5" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF06", "C",100, 0, "Campo definido 6" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF07", "C",100, 0, "Campo definido 7" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF08", "C",100, 0, "Campo definido 8" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF09", "C",100, 0, "Campo definido 9" ,                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CUSRDEF10", "C",100, 0, "Campo definido 10" ,                            "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISLUN",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISMAR",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISMIE",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISJUE",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISVIE",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISSAB",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LVISDOM",   "L",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISLUN",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISMAR",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISMIE",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISJUE",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISVIE",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISSAB",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NVISDOM",   "N",  4, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGELUN",   "C",  3, 0, "C�digo agente para visita lunes",               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGEMAR",   "C",  3, 0, "C�digo agente para visita martes",              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGEMIE",   "C",  3, 0, "C�digo agente para visita miercoles",           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGEJUE",   "C",  3, 0, "C�digo agente para visita jueves",              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGEVIE",   "C",  3, 0, "C�digo agente para visita viernes",             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGESAB",   "C",  3, 0, "C�digo agente para visita sabado",              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CAGEDOM",   "C",  3, 0, "C�digo agente para visita domingo",             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "LSNDINT",   "L",  1, 0, "L�gico para envio por internet" ,               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CPERCTO",   "C",200, 0, "Persona de contacto" ,                          "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "CCODALM",   "C",  3, 0, "C�digo de almac�n",                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NMESVAC",   "N",  2, 0, "Mes de vacaciones",                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NIMPRIE",   "N", 16, 6, "Riesgo alcanzado",                              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "NCOLOR",    "N", 10, 0, "",                                              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "SubCtaDto", "C", 12, 0, "C�digo subcuenta descuento",                    "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lBlqCli",   "L",  1, 0, "Cliente bloqueado" ,                            "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lMosCom",   "L",  1, 0, "Mostrar comentario" ,                           "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lTotAlb",   "L",  1, 0, "Totalizar albaranes" ,                          "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cDtoAtp",   "C", 50, 0, "Descripci�n del descuento atipico" ,            "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoAtp",   "N",  6, 2, "Porcentaje de descuento at�pico" ,              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nSbrAtp",   "N",  1, 0, "" ,                                             "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cCodUsr",   "C",  3, 0, "C�digo de usuario que realiza el cambio" ,      "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "dFecChg",   "D",  8, 0, "Fecha de cambio" ,                              "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cTimChg",   "C",  5, 0, "Hora de cambio" ,                               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nTipRet",   "N",  1, 0, "Tipo de retenci�n ( 1-Base / 2-Base+IVA )",     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nPctRet",   "N",  6, 2, "Porcentaje de retenci�n",                       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "dFecBlq",   "D",  8, 0, "Fecha de bloqueo del cliente",                  "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cMotBlq",   "C",250, 0, "Motivo del bloqueo del cliente",                "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lModDat",   "L",  1, 0, "L�gico para no modificar datos en la venta" ,   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lMail",     "L",  1, 0, "L�gico para enviar mail" ,                      "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cCodTrn",   "C",  9, 0, "C�digo del transportista" ,                     "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "mObserv",   "M", 10, 0, "Observaciones",                                 "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lPubInt",   "L",  4, 0, "L�gico para publicar en internet (S/N)",        "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cClave",    "C", 40, 0, "Contrase�a cliente para Web",                   "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cCodWeb",   "N", 11, 0, "C�digo del cliente en la web",                  "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cCodEdi",   "C", 17, 0, "C�digo del cliente en EDI (EAN)",               "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "cFacAut",   "C",  3, 0, "C�digo de factura autom�tica",                  "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lWeb",      "L",  4, 0, "L�gico para creado desde internet (S/N)",       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "nDtoArt",   "N",  1, 0, "Descuento de art�culo",                         "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "lExcFid",   "L",  1, 0, "L�gico para creado desde internet (S/N)",       "",                   "", "( cDbfCli )" } )
   aAdd( aBase, { "mFacAut",   "M", 10, 0, "Plantillas de facturas autom�ticas",            "",                   "", "( cDbfCli )" } )

RETURN ( aBase )

//----------------------------------------------------------------------------//
/*
Devuelve si el cliente tiene autorizaci�n para ventas de credito
*/

FUNCTION lCliBlq( cCodCli, dbfClient )

   local lRet     := .f.

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      lRet        := ( dbfClient )->lBlqCli
   end if

RETURN lRet

//---------------------------------------------------------------------------//

function GetRiesgo( cCodCli, dbfCli, oRieCli )

   local nImpRiesgo := 0
   local aCliStatus

   if Empty( cCodCli )
      oRieCli:SetColor( Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) )
      oRieCli:cText( nImpRiesgo )
      Return ( nImpRiesgo )
   end if

   aCliStatus  := aGetStatus( dbfCli, .t. )

   if ( dbfCli )->( dbSeek( cCodCli ) )

      nImpRiesgo     := ( dbfCli )->nImpRie

      if oRieCli != nil

         if nImpRiesgo != 0 .and. nImpRiesgo >= ( dbfCli )->Riesgo
            oRieCli:SetColor( Rgb( 255, 0, 0 ), Rgb( 255, 255, 255 ) )
         else
            oRieCli:SetColor( Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) )
         end if

         oRieCli:cText( nImpRiesgo )

      end if

   end if

   SetStatus( dbfCli, aCliStatus )

return ( nImpRiesgo )

//---------------------------------------------------------------------------//

Function nXbYAtipica( cCodArt, cCodCli, nCajVen, nUndVen, dFecOfe, dbfAtpCli )

   local nModOfe  := 0
   local nTipXbY  := 0
   local nUndGrt  := 0
   local aXbYRet  := { 0, 0 }
   local nOrd     := ( dbfAtpCli )->( OrdSetFocus( "cCodArt" ) )

	/*
	Primero buscar si existe el articulo en la oferta
	*/

   if ( dbfAtpCli )->( dbSeek( cCodCli + cCodArt ) )

      while ( dbfAtpCli )->cCodCli + ( dbfAtpCli )->cCodArt == cCodCli + cCodArt .and. !( dbfAtpCli )->( eof() )

			/*
			Comprobamos si esta entre las fechas
			*/

         if ( dFecOfe >= ( dbfAtpCli )->dFecIni .or. Empty( ( dbfAtpCli )->dFecIni ) ) .and. ;
            ( dFecOfe <= ( dbfAtpCli )->dFecFin .or. Empty( ( dbfAtpCli )->dFecFin ) ) .and. ;
            ( dbfAtpCli )->nUnvOfe != 0                                                .and. ;
            ( dbfAtpCli )->nUncOfe != 0

            /*
            Vamos a comprobar si la oferta es de unidades o de cajas
            */

            nTipXbY  := ( dbfAtpCli )->nTipXbY

            if nTipXbY == 1   // Cajas

               if mod( nCajVen, ( dbfAtpCli )->nUnvOfe ) == 0

                  /*
                  Multiplos de la oferta
                  */

                  nModOfe     := Int( Div( nCajVen, ( dbfAtpCli )->nUnvOfe ) )
                  nUndGrt     := ( ( dbfAtpCli )->nUnvOfe - ( dbfAtpCli )->nUncOfe ) * nModOfe
                  aXbYRet     := { nTipXbY, nUndGrt }

                  exit

               end if

            else

               /*
               Comprobamos el numero de unidades a vender es igual a de la oferta
               o si al dividirlo devuelve un numero de resto 0 tendremos un
               multiplo de la oferta
               */

               if mod( nCajVen * nUndVen, ( dbfAtpCli )->nUnvOfe ) == 0

                  /*
                  Multiplos de la oferta
                  */

                  nModOfe     := Int( Div( ( nCajVen * nUndVen ), ( dbfAtpCli )->nUnvOfe ) )
                  nUndGrt     := ( ( dbfAtpCli )->nUnvOfe - ( dbfAtpCli )->nUncOfe ) * nModOfe
                  aXbYRet     := { nTipXbY, nUndGrt }

                  exit

               end if

            end if

         end if

         ( dbfAtpCli )->( dbSkip() )

      end do

   end if

   ( dbfAtpCli )->( OrdSetFocus( nOrd ) )

Return ( aXbYRet )

//---------------------------------------------------------------------------//

function lSeekAtpFam( cCadSea, dFecDoc, dbfCliAtp )

   local lSea     := .f.
   local nOrd     := ( dbfCliAtp )->( OrdSetFocus( "cCodFam" ) )

   if ( dbfCliAtp )->( dbSeek( cCadSea ) )

      while ( dbfCliAtp )->cCodCli + ( dbfCliAtp )->cCodFam == cCadSea .and.;
            !( dbfCliAtp )->( eof() )

         if ( ( dbfCliAtp )->dFecIni <= dFecDoc .or. Empty( ( dbfCliAtp )->dFecIni ) ) .and. ;
            ( ( dbfCliAtp )->dFecFin >= dFecDoc .or. Empty( ( dbfCliAtp )->dFecFin ) ) .and. ;
            ( dbfCliAtp )->nTipAtp == 2

            lSea  := .t.
            exit

         else

            ( dbfCliAtp )->( dbSkip() )

         end if

      end while

   end if

   ( dbfCliAtp )->( OrdSetFocus( nOrd ) )

return ( lSea )

//---------------------------------------------------------------------------//

function nDtoAtp( nTarifa, dbfCliAtp, oDto, oTarifa )

   local nDto        := 0

   DEFAULT nTarifa   := 1

   if nTarifa == 0
      nTarifa        := 1
   end if

   while .t.

      do case
         case nTarifa == 1
            nDto     := ( dbfCliAtp )->nDto1
         case nTarifa == 2
            nDto     := ( dbfCliAtp )->nDto2
         case nTarifa == 3
            nDto     := ( dbfCliAtp )->nDto3
         case nTarifa == 4
            nDto     := ( dbfCliAtp )->nDto4
         case nTarifa == 5
            nDto     := ( dbfCliAtp )->nDto5
         case nTarifa == 6
            nDto     := ( dbfCliAtp )->nDto6
      end do

      if nDto == 0 .and. nTarifa > 1 .and. lBuscaImportes()
         nTarifa--
         loop
      else
         exit
      end if

   end while

   /*
   Si no encontramos ningun descuento ponemos el general-----------------------
   */

   if nDto == 0
      nDto           := ( dbfCliAtp )->nDtoArt
   end if

   /*
   Ponemos el valor en el control----------------------------------------------
   */

   if nDto != 0 .and. oDto != nil
      oDto:cText( nDto )
   end if

   /*
   Ponemos la tarifa utilizada en el control-----------------------------------
   */

   if oTarifa != nil
      oTarifa:cText( nTarifa )
   end if

return ( nDto )

//---------------------------------------------------------------------------//

function nImpAtp( nTarifa, dbfCliAtp, uPreUnt, nIva, oTarifa )

   local nPre        := 0

   DEFAULT nTarifa   := 1
   DEFAULT nIva      := 0

   if nTarifa == 0
      nTarifa        := 1
   end if

   while .t.

      do case
         case nTarifa == 1
            nPre     := ( dbfCliAtp )->nPrcArt
         case nTarifa == 2
            nPre     := ( dbfCliAtp )->nPrcArt2
         case nTarifa == 3
            nPre     := ( dbfCliAtp )->nPrcArt3
         case nTarifa == 4
            nPre     := ( dbfCliAtp )->nPrcArt4
         case nTarifa == 5
            nPre     := ( dbfCliAtp )->nPrcArt5
         case nTarifa == 6
            nPre     := ( dbfCliAtp )->nPrcArt6
      end do

      if nPre == 0 .and. nTarifa > 1 .and. lBuscaImportes()
         nTarifa--
         loop
      else
         exit
      end if

   end while

   if nIva != 0
      nPre           += nPre * nIva / 100
   end if

   if nPre != 0 .and. uPreUnt != nil
      uPreUnt:cText( nPre )
   end if

   if oTarifa != nil
      oTarifa:cText( nTarifa )
   end if

return ( nPre )

//---------------------------------------------------------------------------//

function lSeekAtpArt( cCadSea, cCodPrp, cValPrp, dFecDoc, dbfCliAtp )

   local lSea        := .f.
   local nOrd        := ( dbfCliAtp )->( OrdSetFocus( "CCODART" ) )

   DEFAULT cCodPrp   := Space(10)
   DEFAULT cValPrp   := Space(10)

   if ( dbfCliAtp )->( dbSeek( cCadSea + cCodPrp + cValPrp ) )

      while ( ( dbfCliAtp )->cCodCli + ( dbfCliAtp )->cCodArt + ( dbfCliAtp )->cCodPr1 + ( dbfCliAtp )->cCodPr2 + ( dbfCliAtp )->cValPr1 + ( dbfCliAtp )->cValPr2 == cCadSea + cCodPrp + cValPrp ) .and.;
            (!( dbfCliAtp )->( eof() ) )

         if ( dbfCliAtp )->dFecIni <= dFecDoc .and. ( dbfCliAtp )->dFecFin >= dFecDoc .and. ( dbfCliAtp )->nTipAtp <= 1

            lSea     := .t.
            exit

         else

            ( dbfCliAtp )->( dbSkip() )

         end if

      end while

   end if

   if !lSea .and. ( dbfCliAtp )->( dbSeek( cCadSea + Space( 20 ) ) )

      while ( ( dbfCliAtp )->cCodCli + ( dbfCliAtp )->cCodArt == cCadSea ) .and.;
            (!( dbfCliAtp )->( eof() ) )

         if ( dbfCliAtp )->dFecIni <= dFecDoc .and. ( dbfCliAtp )->dFecFin >= dFecDoc .and. ( dbfCliAtp )->nTipAtp <= 1

            lSea     := .t.
            exit

         else

            ( dbfCliAtp )->( dbSkip() )

         end if

      end while

   end if

   /*
   Ahora vamos a ver si hay con fechas vacias----------------------------------
   */

   if !lSea .and. ( dbfCliAtp )->( dbSeek( cCadSea + cCodPrp + cValPrp ) )

      while ( ( dbfCliAtp )->cCodCli + ( dbfCliAtp )->cCodArt + ( dbfCliAtp )->cCodPr1 + ( dbfCliAtp )->cCodPr2 + ( dbfCliAtp )->cValPr1 + ( dbfCliAtp )->cValPr2 == cCadSea + cCodPrp + cValPrp ) .and.;
            (!( dbfCliAtp )->( eof() ) )

         if Empty( ( dbfCliAtp )->dFecIni ) .and. Empty( ( dbfCliAtp )->dFecFin ) .and. ( dbfCliAtp )->nTipAtp <= 1

            lSea     := .t.
            exit

         else

            ( dbfCliAtp )->( dbSkip() )

         end if

      end while

   end if

   if !lSea .and. ( dbfCliAtp )->( dbSeek( cCadSea + Space( 20 ) ) )

      while ( ( dbfCliAtp )->cCodCli + ( dbfCliAtp )->cCodArt == cCadSea ) .and.;
            (!( dbfCliAtp )->( eof() ) )

         if Empty( ( dbfCliAtp )->dFecIni ) .and. Empty( ( dbfCliAtp )->dFecFin )

            lSea     := .t.
            exit

         else

            ( dbfCliAtp )->( dbSkip() )

         end if

      end while

   end if

   ( dbfCliAtp )->( OrdSetFocus( nOrd ) )

return ( lSea )

//---------------------------------------------------------------------------//

/*
Devuelve si el cliente tiene autorizaci�n para ventas de credito
*/

FUNCTION lCliChg( cCodCli, dbfClient )

   local lRet     := .f.

   if dbSeekInOrd( cCodCli, "Cod", dbfClient )
      lRet        := ( dbfClient )->lChgPre
   end if

RETURN lRet

//---------------------------------------------------------------------------//

function AddRiesgo( nImpRie, cCodCli, dbfClient )

   local aCliStatus  := aGetStatus( dbfClient, .t. )

   if ( dbfClient )->( DbSeek( cCodCli ) ) .and. dbDialogLock( dbfClient )
      ( dbfClient )->nImpRie  += nImpRie
      ( dbfClient )->nTipCli  := 1
      ( dbfClient )->( dbUnlock() )
   end if

   SetStatus( dbfClient, aCliStatus )

return ( nil )

//---------------------------------------------------------------------------//

function DelRiesgo( nImpRie, cCodCli, dbfClient )

   local aCliStatus  := aGetStatus( dbfClient, .t. )

   if ( dbfClient )->( dbSeek( cCodCli ) )
      if dbDialogLock( dbfClient )
         ( dbfClient )->nImpRie  -= nImpRie
         ( dbfClient )->nTipCli  := 1
         ( dbfClient )->( dbCommit() )
         ( dbfClient )->( dbUnlock() )
      end if
   end if

   SetStatus( dbfClient, aCliStatus )

return ( nil )

//---------------------------------------------------------------------------//

FUNCTION RetClient( cCodCli, dbfClient )

   local oBlock
   local oError
   local lClose   := .f.
	local cText		:= Space( 30 )

   cCodCli        := RJust( cCodCli, "0", RetNumCodCliEmp() )

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfClient )
      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   if ValType( dbfClient ) == "O"
      if dbfClient:Seek( cCodCli )
         cText    := dbfClient:Titulo
      end if
   else
      if ( dbfClient )->( dbSeek( cCodCli ) )
         cText    := ( dbfClient )->Titulo
      end if
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos de clientes" )

   END SEQUENCE
   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfClient )
   end if

RETURN cText

//---------------------------------------------------------------------------//

FUNCTION cClient( oGet, dbfClient, oGet2 )

   local oBlock
   local oError
   local lClose   := .f.
   local lValid   := .f.
	local xValor	:= oGet:varGet()

   if Empty( xValor )
      if IsObject( oGet2 )
			oGet2:cText( "" )
         oGet2:SetColor( 0, CLR_WHITE )
      end if
      return .t.
   elseif at( ".", xValor ) != 0
      xValor      := PntReplace( oGet, "0", RetNumCodCliEmp() )
   else
      xValor      := RJustObj( oGet, "0", RetNumCodCliEmp() )
   end if

   if ( Alltrim( xValor ) == Replicate( "Z", len( Alltrim( xValor ) ) ) )
      return .t.
   end if

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( dbfClient )
      USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE
      lClose      := .t.
   end if

   if dbSeekInOrd( xValor, "Cod", dbfClient )

      if IsObject( oGet )
         oGet:cText( ( dbfClient )->Cod )
      end if

      if IsObject( oGet2 )
         oGet2:cText( ( dbfClient )->Titulo )
         if ( dbfClient )->nColor != 0
            oGet2:SetColor( , ( dbfClient )->nColor )
         end if
      end if

      lValid      := .t.

   else

      msgStop( "Cliente no encontrado", "C�digo buscado : " + xValor )

   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if lClose
      CLOSE ( dbfClient )
   end if

RETURN lValid

//---------------------------------------------------------------------------//

STATIC FUNCTION ActTitle( nKey, nFlags, oGet, nMode, oDlg )

   oGet:Assign()
   oDlg:cTitle( LblTitle( nMode ) + " Cliente : " + Rtrim( oGet:varGet() ) ) // + Chr( nKey )

RETURN NIL

//--------------------------------------------------------------------------//

Static Function lValidNombre( oGet )

   local cNombre  := oGet:VarGet()
   local nRec     := ( dbfClient )->( Recno() )
   local nOrd     := ( dbfClient )->( OrdSetFocus( "Titulo" ) )

   if !Empty( cNombre ) .and. ( dbfClient )->( dbSeek( cNombre ) )
      msgAlert( 'El nombre introducido ya existe en la base de datos' )
   end if

   ( dbfClient )->( dbGoTo( nRec ) )
   ( dbfClient )->( OrdSetFocus( nOrd ) )

Return .t.

//---------------------------------------------------------------------------//

Static Function lValidCif( oGet )

   local cCif     := oGet:VarGet()
   local nRec     := ( dbfClient )->( Recno() )
   local nOrd     := ( dbfClient )->( OrdSetFocus( "Nif" ) )

   if !Empty( cCif ) .and. ( dbfClient )->( dbSeek( cCif ) )
      msgAlert( 'C.I.F / N.I.F. ya existe' )
   end if

   ( dbfClient )->( dbGoTo( nRec ) )
   ( dbfClient )->( OrdSetFocus( nOrd ) )

Return .t.

//---------------------------------------------------------------------------//

Static Function lValidTlf( oGet )

   local cTlf     := oGet:VarGet()
   local nRec     := ( dbfClient )->( Recno() )
   local nOrd     := ( dbfClient )->( OrdSetFocus( "Telefono" ) )

   if !Empty( cTlf ) .and. ( dbfClient )->( dbSeek( cTlf ) )
      msgAlert( 'El t�lefono introducido ya existe en la base de datos' )
   end if

   ( dbfClient )->( dbGoTo( nRec ) )
   ( dbfClient )->( OrdSetFocus( nOrd ) )

Return .t.

//---------------------------------------------------------------------------//

static function BeginTrans( aTmp, nMode )

   local oError
   local oBlock
   local lErrors     := .f.
   local cCodCli     := aTmp[ ( dbfClient )->( fieldpos( "Cod" ) ) ]
   local cCodSubCta  := aTmp[ ( dbfClient )->( fieldpos( "SubCta" ) ) ]

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   cTmpObr           := cGetNewFileName( cPatTmp() + "TmpObr" )
   cTmpBnc           := cGetNewFileName( cPatTmp() + "TmpBnc" )
   cTmpDoc           := cGetNewFileName( cPatTmp() + "TmpDoc" )
   cTmpAtp           := cGetNewFileName( cPatTmp() + "TmpAtp" )
   cTmpCta           := cGetNewFileName( cPatTmp() + "TmpCta" )
   cTmpInc           := cGetNewFileName( cPatTmp() + "TmpInc" )
   cTmpCon           := cGetNewFileName( cPatTmp() + "TmpCon" )

   dbCreate( cTmpCta, aSqlStruct( aItmSubcuenta() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpCta, cCheckArea( "TmpCta", @dbfTmpSubCta ), .f. )

   ( dbfTmpSubCta )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpSubCta )->( OrdCreate( cTmpCta, "dFecha", "dFecha", {|| Field->dFecha } ) )

#ifndef __PDA__
   if nMode != APPD_MODE
      LoadSubCta( cCodSubCta, cRutCnt(), dbfTmpSubCta )
   end if
#endif

   dbCreate( cTmpDoc, aSqlStruct( aCliDoc() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpDoc, cCheckArea( "TmpDoc", @dbfTmpDoc ), .f. )

   ( dbfTmpDoc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpDoc )->( ordCreate( cTmpDoc, "Recno", "Recno()", {|| Recno() } ) )

   dbCreate( cTmpObr, aSqlStruct( aItmObr() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpObr, cCheckArea( "TmpObr", @dbfTmpObr ), .f. )

   ( dbfTmpObr )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpObr )->( ordCreate( cTmpObr, "Recno", "Recno()", {|| Recno() } ) )

   dbCreate( cTmpBnc, aSqlStruct( aCliBnc() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpBnc, cCheckArea( "TmpBnc", @dbfTmpBnc ), .f. )

   ( dbfTmpBnc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpBnc )->( OrdCreate( cTmpBnc, "CCODCLI", "CCODCLI + CENTBNC + CSUCBNC + CDIGBNC + CCTABNC", {|| Field->CCODCLI + Field->CENTBNC + Field->CSUCBNC + Field->CDIGBNC +  Field->CCTABNC } ) )

   dbCreate( cTmpAtp, aSqlStruct( aItmAtp() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpAtp, cCheckArea( "TmpAtp", @dbfTmpAtp ), .f. )

   ( dbfTmpAtp )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
   ( dbfTmpAtp )->( OrdCreate( cTmpAtp, "cCodArt", "CCODART + CCODPR1 + CCODPR2 + CVALPR1 + CVALPR2", {|| Field->CCODART + Field->CCODPR1 + Field->CCODPR2 + Field->CVALPR1 + Field->CVALPR2 } ) )

   ( dbfTmpAtp )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpAtp )->( OrdCreate( cTmpAtp, "cCodFam", "cCodFam", {|| Field->cCodFam } ) )

   ( dbfTmpAtp )->( OrdSetFocus( "cCodArt" ) )

   dbCreate( cTmpInc, aSqlStruct( aCliInc() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpInc, cCheckArea( "TmpInc", @dbfTmpInc ), .f. )

   ( dbfTmpInc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpInc )->( OrdCreate( cTmpInc, "cCodCli", "cCodCli + Dtos( dFecInc )", {|| Field->cCodCli + Dtos( Field->dFecInc ) } ) )

   ( dbfTmpInc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpInc )->( OrdCreate( cTmpInc, "cCodTip", "cCodCli + cCodTip", {|| Field->cCodCli + Field->cCodTip } ) )

   ( dbfTmpInc )->( OrdSetFocus( "cCodCli" ) )

   /*
   Tabla de contactos----------------------------------------------------------
   */

   dbCreate( cTmpCon, aSqlStruct( aItmContacto() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cTmpCon, cCheckArea( "TmpCon", @dbfTmpCon ), .f. )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cCodCli", "cCodCli", {|| Field->cCodCli } ) )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cNomCon", "cNomCon", {|| Field->cNomCon } ) )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cPosCon", "cPosCon", {|| Field->cPosCon } ) )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cTelCon", "cTelCon", {|| Field->cTelCon } ) )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cMovCon", "cMovCon", {|| Field->cMovCon } ) )

   ( dbfTmpCon )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
   ( dbfTmpCon )->( OrdCreate( cTmpCon, "cMaiCon", "cMaiCon", {|| Field->cMaiCon } ) )

   ( dbfTmpCon )->( ordSetFocus( "cCodCli" ) )

   /*
   A�adimos desde el fichero de atipicas---------------------------------------
	*/

   if nMode != APPD_MODE

      ( dbfCliAtp )->( dbGoTop() )

      if ( dbfCliAtp )->( dbSeek( cCodCli ) )
         while ( ( dbfCliAtp )->cCodCli == cCodCli ) .and. ( dbfCliAtp )->( !eof() )
            dbPass( dbfCliAtp, dbfTmpAtp, .t. )
            ( dbfCliAtp )->( dbSkip() )
         end while
      end if

      ( dbfTmpAtp )->( dbGoTop() )

      /*
      A�adimos desde el fichero de documentos
      */

      if ( dbfClientD )->( dbSeek( cCodCli ) )
         while ( ( dbfClientD )->cCodCli == cCodCli ) .and. ( dbfClientD )->( !eof() )
            dbPass( dbfClientD, dbfTmpDoc, .t. )
            ( dbfClientD )->( dbSkip() )
         end while
      end if

      ( dbfTmpDoc )->( dbGoTop() )

      /*
      A�adimos desde el fichero de Obras
      */

      if ( dbfObrasT )->( dbSeek( cCodCli ) )
         while ( ( dbfObrasT )->cCodCli == cCodCli ) .AND. ( dbfObrasT )->( !eof() )
            dbPass( dbfObrasT, dbfTmpObr, .t. )
            ( dbfObrasT )->( dbSkip() )
         end while
      end if

      ( dbfTmpObr )->( dbGoTop() )

      /*
      A�adimos desde el fichero de contactos
      */

      if ( dbfContactos )->( dbSeek( cCodCli ) )
         while ( ( dbfContactos )->cCodCli == cCodCli ) .and. ( dbfContactos )->( !eof() )
            dbPass( dbfContactos, dbfTmpCon, .t. )
            ( dbfContactos )->( dbSkip() )
         end while
      end if

      ( dbfTmpCon )->( dbGoTop() )

      /*
      A�adimos desde el fichero de Bancos
      */

      if ( dbfBanco )->( dbSeek( cCodCli ) )
         while ( ( dbfBanco )->cCodCli == cCodCli ) .AND. ( dbfBanco )->( !eof() )
            dbPass( dbfBanco, dbfTmpBnc, .t. )
            ( dbfBanco )->( dbSkip() )
         end while
      end if

      ( dbfTmpBnc )->( dbGoTop() )

      /*
      A�adimos desde el fichero de incidencias
      */

      if ( dbfCliInc )->( dbSeek( cCodCli ) )
         while ( ( dbfCliInc )->cCodCli == cCodCli ) .and. ( dbfCliInc )->( !eof() )
            dbPass( dbfCliInc, dbfTmpInc, .t. )
            ( dbfCliInc )->( dbSkip() )
         end while
      end if

      ( dbfTmpInc )->( dbGoTop() )

   end if

   RECOVER USING oError

      msgStop( "Imposible crear tablas temporales." + CRLF + ErrorMessage( oError ) )

      KillTrans()

      lErrors        := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

return ( lErrors )

//--------------------------------------------------------------------------//

Static Function KillTrans( oBmpDiv, oBrwBnc, oBrwObr, oBrwCta, oBrwAtp, oBrwInc, oBrwCon )

   if !Empty( oBmpDiv )
      oBmpDiv:end()
   end if

   if !Empty( dbfTmpSubCta ) .and. ( dbfTmpSubCta )->( Used() )
      ( dbfTmpSubCta )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpDoc ) .and. ( dbfTmpDoc )->( Used() )
      ( dbfTmpDoc )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpObr ) .and. ( dbfTmpObr )->( Used() )
      ( dbfTmpObr )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpBnc ) .and. ( dbfTmpBnc )->( Used() )
      ( dbfTmpBnc )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpCon ) .and. ( dbfTmpCon )->( Used() )
      ( dbfTmpCon )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpAtp ) .and. ( dbfTmpAtp )->( Used() )
      ( dbfTmpAtp )->( dbCloseArea() )
   end if
   if !Empty( dbfTmpInc ) .and. ( dbfTmpInc )->( Used() )
      ( dbfTmpInc )->( dbCloseArea() )
   end if

   dbfTmpSubCta   := nil
   dbfTmpDoc      := nil
   dbfTmpObr      := nil
   dbfTmpBnc      := nil
   dbfTmpAtp      := nil
   dbfTmpInc      := nil
   dbfTmpCon      := nil

   dbfErase( cTmpCta )
   dbfErase( cTmpDoc )
   dbfErase( cTmpObr )
   dbfErase( cTmpBnc )
   dbfErase( cTmpAtp )
   dbfErase( cTmpInc )
   dbfErase( cTmpCon )

   if oBrwBnc != nil
      oBrwBnc:CloseData()
   end if

   if oBrwObr != nil
      oBrwObr:CloseData()
   end if

   if oBrwCta != nil
      oBrwCta:CloseData()
   end if

   if oBrwAtp != nil
      oBrwAtp:CloseData()
   end if

   if oBrwInc != nil
      oBrwInc:CloseData()
   end if

   if oBrwCon != nil
      oBrwCon:CloseData()
   end if

Return .t.

//--------------------------------------------------------------------------//

Static Function aItmSubcuenta()

   local aBase := {}

   aAdd( aBase, { "nAsiento",  "N",  6, 0, "Asiento"    } )
   aAdd( aBase, { "dFecha",    "D",  8, 0, "Fecha"      } )
   aAdd( aBase, { "cConcepto", "C", 25, 0, "Concepto"   } )
   aAdd( aBase, { "nDebe",     "N", 16, 2, "Debe"       } )
   aAdd( aBase, { "nHaber",    "N", 16, 2, "Haber"      } )
   aAdd( aBase, { "cDeparta",  "C",  6, 0, "Departa"    } )
   aAdd( aBase, { "nFactura",  "N",  8, 0, "Factura"    } )
   aAdd( aBase, { "nBase",     "N", 16, 2, "Base"       } )
   aAdd( aBase, { "nIva",      "N",  5, 2, "I.V.A"      } )

Return ( aBase )

//--------------------------------------------------------------------------//

static function SavClient( aTmp, aGet, oDlg, dbfClient, oBrw, nMode )

   local cText       := ""
   local cFacAut
   local nVisLun     := ( dbfClient )->nVisLun
   local nVisMar     := ( dbfClient )->nVisMar
   local nVisMie     := ( dbfClient )->nVisMie
   local nVisJue     := ( dbfClient )->nVisJue
   local nVisVie     := ( dbfClient )->nVisVie
   local nVisSab     := ( dbfClient )->nVisSab
   local nVisDom     := ( dbfClient )->nVisDom

   if ( nMode == APPD_MODE .or. nMode == DUPL_MODE )

      if Empty( aTmp[ _COD ] )
         MsgStop( "C�digo no puede estar vacio" )
         return nil
      end if

      if Existe( aTmp[ _COD ], dbfClient, "Cod" )
         MsgStop( "C�digo ya existe " + Rtrim( aTmp[ _COD ] ) )
         return nil
      end if

   end if

   if aTmp[ _LPUBINT ]

      if Empty( aTmp[ _CMEIINT ] )
         MsgStop( "Email no pueden estar vacios" )
         aGet[ _CMEIINT ]:SetFocus()
         return nil
      end if

      if Empty( aTmp[ _CCLAVE ] ) .or. Len( AllTrim( aTmp[ _CCLAVE ] ) ) < 5
         MsgStop( "La contrase�a debe tener al menos 5 caracteres" )
         aGet[ _CCLAVE ]:SetFocus()
         return nil
      end if

   end if

   if !Empty( aTmp[ _CCODREM ] ) .and. ( dbfTmpBnc )->( LastRec() ) == 0
      MsgStop( "Necesita una cuenta bancaria para su cuenta de remesa" )
      return nil
   end if

   /*
   Comprobamos que la tarifa est� entre 1 y 6---------------------------------
   */

   if aTmp[ _NTARIFA ] < 1
      aTmp[ _NTARIFA ]  := 1
   end if

   if aTmp[ _NTARIFA ] < 1 .or. aTmp[ _NTARIFA ] > 6

      MsgStop( "La tarifa a seleccionar debe de estar entre 1 y 6" )

      if !Empty( aGet[ _NTARIFA ] )
         aGet[ _NTARIFA ]:SetFocus()
      end if

      return nil

   end if

   /*
   Comprobamos que el descuento de art�culo est� entre 1 y 6-------------------
   */

   if aTmp[ _NDTOART ] < 0 .or. aTmp[ _NDTOART ] > 6

      MsgStop( "El descuento de art�culo a seleccionar debe de estar entre 0 y 6" )

      if !Empty( aGet[ _NDTOART ] )
         aGet[ _NDTOART ]:SetFocus()
      end if

      return nil

   end if

   if Empty( aTmp[ _TITULO ] )
      cText := Space( 6 ) + "* Nombre" + CRLF
   end if

   if !Empty( cText )
      msginfo( "Los siguientes campo(s) son obligatorios: " + CRLF + cText )
      return nil
   end if

   if Empty( aTmp[ _DOMICILIO ] )
      cText += Space( 6 ) + "* Domicilio" + CRLF
   end if

   if Empty( aTmp[ _POBLACION ] )
      cText += Space( 6 ) + "* Poblaci�n" + CRLF
   end if

   if Empty( aTmp[ _CODPOSTAL ] )
      cText += Space( 6 ) + "* Codigo Postal" + CRLF
   end if

   if Empty( aTmp[ _CMEIINT ] )
      cText += Space( 6 ) + "* Email" + CRLF
   end if

   if Empty( aTmp[ _NIF ] )
      cText += Space( 6 ) + "* N.I.F" + CRLF
   end if

   if Empty( aTmp[ _TELEFONO ] )
      cText += Space( 6 ) + "* Tel�fono" + CRLF
   end if

   if !Empty( cText )
      if !ApoloMsgNoYes( "Son recomendables introducir los siguientes campo(s): " + CRLF + cText + CRLF + " �Desea continuar sin introducirlos?", "Seleccione una opci�n" )
         return nil
      end if
   end if

   /*
   Deshabilitamos la ventana---------------------------------------------------
   */

   CursorWait()

   oDlg:Disable()

#ifndef __PDA__
   oMsgText( "Archivando" )

   oMsgProgress()
#endif

   /*
   Guardamos el array con las facturas autom�ticas-----------------------------
   */

   aTmp[ _MFACAUT ]     := ""

   for each cFacAut in aFacAut
      aTmp[ _MFACAUT ]  += AllTrim( cFacAut ) + ","
   next

   /*
   Valores por defecto---------------------------------------------------------
   */

   aTmp[ _LSNDINT ]     := .t.

   if !Empty( cUsrTik() )
      aTmp[ _CCODUSR ]  := cUsrTik()
   else
      aTmp[ _CCODUSR ]  := cCurUsr()
   end if

   aTmp[ _DFECCHG ]     := GetSysDate()
   aTmp[ _CTIMCHG ]     := Time()

   if !Empty( aGet[ _NCOLOR ] )
      aTmp[ _NCOLOR  ]  := aRgbColor[ Min( Max( aGet[ _NCOLOR ]:nAt, 1 ), len( aRgbColor ) ) ]
   end if

   if !Empty( aGet[ _NMESVAC ] )
      aTmp[ _NMESVAC ]  := aGet[ _NMESVAC ]:nAt
   end if

   if !Empty( aGet[ _NTIPCLI ] )
      aTmp[ _NTIPCLI ]  := aGet[ _NTIPCLI ]:nAt
   end if

   if !Empty( aGet[ _NSBRATP ] )
      aTmp[ _NSBRATP ]  := aGet[ _NSBRATP ]:nAt
   end if

   if !Empty( aGet[ _NTIPRET ] )
      aTmp[ _NTIPRET ]  := aGet[ _NTIPRET ]:nAt
   end if

   if !Empty( oRTF )
      aTmp[ _MOBSERV ]  := oRTF:SaveAsRTF()
   end if

   /*
   Borramos los posibles filtros de la tabla temporal de atipicas--------------
   */

   if !Empty( dbfTmpAtp )
      ( dbfTmpAtp )->( dbClearFilter() )
   end if

   /*
   Limpiamos la tabla de atipicas----------------------------------------------
   */

if !Empty( dbfTmpAtp )

#ifndef __PDA__
   oMsgText( "Eliminando tarifas anteriores cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpAtp )->( LastRec() ) )
#endif

   while ( dbfCliAtp )->( dbSeek( aTmp[ _COD ] ) ) .and. !( dbfCliAtp )->( eof() )
      dbDel( dbfCliAtp )
   end while

#ifndef __PDA__
   oMsgText( "Archivando tarifas cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpAtp )->( LastRec() ) )
#endif

   ( dbfTmpAtp )->( dbGoTop() )
   while ( dbfTmpAtp )->( !eof() )
      dbPass( dbfTmpAtp, dbfCliAtp, .t., aTmp[ _COD ] )
      ( dbfTmpAtp )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   /*
   Limpiamos la tabla de documentos--------------------------------------------
   */

if !Empty( dbfTmpDoc )

#ifndef __PDA__
   oMsgText( "Eliminando documentos anteriores cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpDoc )->( LastRec() ) )
#endif

   while ( dbfClientD )->( dbSeek( aTmp[ _COD ] ) )
      dbDel( dbfClientD )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

#ifndef __PDA__
   oMsgText( "Archivando documentos cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpDoc )->( LastRec() ) )
#endif

   ( dbfTmpDoc )->( dbGoTop() )
   while ( dbfTmpDoc )->( !eof() )
      dbPass( dbfTmpDoc, dbfClientD, .t., aTmp[ _COD ] )
      ( dbfTmpDoc )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   /*
   Limpiamos la tabla de obras-------------------------------------------------
   */

if !Empty( dbfTmpObr )

#ifndef __PDA__
   oMsgText( "Eliminando direcciones anteriores cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpObr )->( LastRec() ) )
#endif

   while ( dbfObrasT )->( dbSeek( aTmp[ _COD ] ) )
      dbDel( dbfObrasT )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

#ifndef __PDA__
   oMsgText( "Archivando direcciones cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpObr )->( LastRec() ) )
#endif

   ( dbfTmpObr )->( dbGoTop() )
   while ( dbfTmpObr )->( !eof() )
      dbPass( dbfTmpObr, dbfObrasT, .t., aTmp[ _COD ] )
      ( dbfTmpObr )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   /*
   Limpiamos la tabla de contactos---------------------------------------------
   */

if !Empty( dbfTmpCon )

#ifndef __PDA__
   oMsgText( "Eliminando contactos anteriores cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpCon )->( LastRec() ) )
#endif

   while ( dbfContactos )->( dbSeek( aTmp[ _COD ] ) )
      dbDel( dbfContactos )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

#ifndef __PDA__
   oMsgText( "Archivando contactos cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpCon )->( LastRec() ) )
#endif

   ( dbfTmpCon )->( dbGoTop() )
   while ( dbfTmpCon )->( !eof() )
      dbPass( dbfTmpCon, dbfContactos, .t., aTmp[ _COD ] )
      ( dbfTmpCon )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   /*
   Limpiamos la tabla de bancos------------------------------------------------
   */

if !Empty( dbfTmpBnc )

#ifndef __PDA__
   oMsgText( "Eliminanado bancos anteriores cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpBnc )->( LastRec() ) )
#endif

   while ( dbfBanco )->( dbSeek( aTmp[ _COD ] ) )
      dbDel( dbfBanco )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

#ifndef __PDA__
   oMsgText( "Archivando bancos cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpBnc )->( LastRec() ) )
#endif

   ( dbfTmpBnc )->( dbGoTop() )
   while !( dbfTmpBnc )->( eof() )
      dbPass( dbfTmpBnc, dbfBanco, .t., aTmp[ _COD ] )
      ( dbfTmpBnc )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   /*
   Limpiamos la tabla de incidencias-------------------------------------------
   */

if !Empty( dbfTmpInc )

#ifndef __PDA__
   oMsgText( "Eliminando incidencias cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpInc )->( LastRec() ) )
#endif

   while ( dbfCliInc )->( dbSeek( aTmp[ _COD ] ) )
      dbDel( dbfCliInc )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

#ifndef __PDA__
   oMsgText( "Archivando incidencias cliente" )
   oMsgProgress():SetRange( 0, ( dbfTmpInc )->( LastRec() ) )
#endif

   ( dbfTmpInc )->( dbGoTop() )
   while !( dbfTmpInc )->( eof() )
      dbPass( dbfTmpInc, dbfCliInc, .t., aTmp[ _COD ] )
      ( dbfTmpInc )->( dbSkip() )
#ifndef __PDA__
      oMsgProgress():DeltaPos( 1 )
#endif
   end while

end if

   //-----------------------------------------------------------------------------

   WinGather( aTmp, aGet, dbfClient, oBrw, nMode )

   if oWndBrw != nil
      oWndBrw:KillProcess()
   end if

#ifndef __PDA__
   oMsgText()

   EndProgress()
#endif

   /*
   Habilitamos la ventana------------------------------------------------------
   */

   oDlg:Enable()
   oDlg:End( IDOK )

   CursorWE()

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function FiltroAtipica( oFiltroAtp, dbfTmpAtp, oBrwAtp )

   if Select( dbfTmpAtp ) != 0

      if oFiltroAtp:nAt <= 1
         ( dbfTmpAtp )->( dbClearFilter() )
      else
         ( dbfTmpAtp )->( dbSetFilter( {|| ( Empty( Field->dFecIni ) .and. Empty( Field->dFecFin ) ) .or. ( Field->dFecIni <= GetSysDate() .and. Field->dFecFin >= GetSysDate() ) }, "( Empty( dFecIni ) .and. Empty( dFecFin ) ) .or. ( dFecIni <= GetSysDate() .and. dFecFin >= GetSysDate() )" ) )

      end if

      ( dbfTmpAtp )->( dbGoTop() )

      oBrwAtp:Refresh()

   end if

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function IsCliAtp( aGet, aTmp, oGet, dbfCliAtp, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oCosto )

	local lReturn	:= .t.
   local cCodArt  := aGet[ _aCCODART ]:VarGet()
   local nPreCom  := 0
   local nPreVta  := 0

   if Empty( cCodArt )
      oGet:cText( "" )
      Return ( .t. )
   end if

   if nMode == APPD_MODE

      if ( dbfArticulo )->( dbSeek( cCodArt ) )

         if !Empty( oGet )
            oGet:cText( ( dbfArticulo )->Nombre )
         end if

         aTmp[ _aCCODPR1 ] := ( dbfArticulo )->cCodPrp1
         aTmp[ _aCCODPR2 ] := ( dbfArticulo )->cCodPrp2

         if !Empty( aTmp[ _aCCODPR1 ] )
            if !Empty( oSayPr1 )
               oSayPr1:SetText( retProp( ( dbfArticulo )->cCodPrp1, dbfPro ) )
            end if
            if !Empty( oSayPr1 )
               oSayPr1:Show()
            end if
            if !Empty( aGet[ _aCVALPR1 ] )
               aGet[ _aCVALPR1 ]:Show()
            end if
            if !Empty( oSayVp1 )
               oSayVp1:Show()
            end if
         else
            if !Empty( oSayPr1 )
               oSayPr1:Hide()
            end if
            if !Empty( aGet[ _aCVALPR1 ] )
               aGet[ _aCVALPR1 ]:Hide()
            end if
            if !Empty( oSayVp1 )
               oSayVp1:Hide()
            end if
         end if

         if !Empty( aTmp[ _aCCODPR2 ] )
            if !Empty( oSayPr2 )
               oSayPr2:SetText( retProp( ( dbfArticulo )->cCodPrp2, dbfPro ) )
            end if
            if !Empty( oSayPr2 )
               oSayPr2:Show()
            end if
            if !Empty( aGet[ _aCVALPR2 ] )
               aGet[ _aCVALPR2 ]:show()
            end if
            if !Empty( oSayVp2 )
               oSayVp2:show()
            end if
         else
            if !Empty( oSayPr2 )
               oSayPr2:hide()
            end if
            if !Empty( aGet[ _aCVALPR2 ] )
               aGet[ _aCVALPR2 ]:hide()
            end if
            if !Empty( oSayVp2 )
               oSayVp2:hide()
            end if
         end if

         /*
         Precio de costo
         */

         nPreCom           := nComPro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], dbfArtDiv )

         if nPreCom == 0
            nPreCom        := nCosto( nil, dbfArticulo, dbfArtKit )
         end if

         if !Empty( oCosto )
            oCosto:cText( nPreCom )
         end if

         /*
         Primer precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 1, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta1
         end if

         if !Empty( aGet[_aNPRCART ] )
            aGet[_aNPRCART ]:cText( nPreVta )
         end if

         /*
         Segundo precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 2, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta2
         end if

         if !Empty( aGet[_aNPRCART2] )
            aGet[_aNPRCART2]:cText( nPreVta )
         end if

         /*
         Tercer precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 3, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta3
         end if

         if !Empty( aGet[_aNPRCART3] )
            aGet[_aNPRCART3]:cText( nPreVta )
         end if

         /*
         Cuarto precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 4, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta4
         end if

         if !Empty( aGet[_aNPRCART4] )
            aGet[_aNPRCART4]:cText( nPreVta )
         end if

         /*
         Quinto precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 5, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta5
         end if

         if !Empty( aGet[_aNPRCART5] )
            aGet[_aNPRCART5]:cText( nPreVta )
         end if

         /*
         Sexto precio de venta
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 6, .f., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVenta6
         end if

         if !Empty( aGet[_aNPRCART6] )
            aGet[_aNPRCART6]:cText( nPreVta )
         end if

         /*
         Primer precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 1, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva1
         end if

         if !Empty( aGet[_aNPREIVA1] )
            aGet[_aNPREIVA1]:cText( nPreVta )
         end if

         /*
         Segundo precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 2, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva2
         end if

         if !Empty( aGet[_aNPREIVA2] )
            aGet[_aNPREIVA2]:cText( nPreVta )
         end if

         /*
         Tercer precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 3, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva3
         end if

         if !Empty( aGet[_aNPREIVA3] )
            aGet[_aNPREIVA3]:cText( nPreVta )
         end if

         /*
         Cuarto precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 4, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva4
         end if

         if !Empty( aGet[_aNPREIVA4] )
            aGet[_aNPREIVA4]:cText( nPreVta )
         end if

         /*
         Quinto precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 5, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva5
         end if

         if !Empty( aGet[_aNPREIVA5] )
            aGet[_aNPREIVA5]:cText( nPreVta )
         end if

         /*
         Sexto precio de venta IGIC incluido
         */

         nPreVta           := nPrePro( cCodArt, aTmp[ _aCCODPR1 ], aTmp[ _aCVALPR1 ], aTmp[ _aCCODPR2 ], aTmp[ _aCVALPR2 ], 6, .t., dbfArtDiv )

         if nPreVta == 0
            nPreVta        := ( dbfArticulo )->pVtaIva6
         end if

         if !Empty( aGet[_aNPREIVA6] )
            aGet[_aNPREIVA6]:cText( nPreVta )
         end if

      else
         MsgStop( "C�digo de art�culo no encontrado" )
         return .f.
      end if

   else

      if ( dbfArticulo )->( dbSeek( cCodArt ) )

         if !Empty( aTmp[ _aCCODPR1 ] )
            aTmp[ _aCCODPR1 ] := ( dbfArticulo )->cCodPrp1
         end if
         if !Empty( aTmp[ _aCCODPR2 ] )
            aTmp[ _aCCODPR2 ] := ( dbfArticulo )->cCodPrp2
         end if

         if !empty( aTmp[ _aCCODPR1 ] )
            if !Empty( oSayPr1 )
               oSayPr1:SetText( retProp( ( dbfArticulo )->cCodPrp1, dbfPro ) )
            end if
            if !Empty( oSayPr1 )
               oSayPr1:show()
            end if
            if !Empty( aGet[ _aCVALPR1 ] )
               aGet[ _aCVALPR1 ]:show()
            end if
            if !Empty( oSayVp1 )
               oSayVp1:show()
            end if
         else
            if !Empty( oSayPr1 )
               oSayPr1:hide()
            end if
            if !Empty( aGet[ _aCVALPR1 ] )
               aGet[ _aCVALPR1 ]:hide()
            end if
            if !Empty( oSayVp1 )
               oSayVp1:hide()
            end if
         end if

         if !empty( aTmp[ _aCCODPR2 ] )
            if !Empty( oSayPr2 )
               oSayPr2:SetText( retProp( ( dbfArticulo )->cCodPrp2, dbfPro ) )
            end if
            if !Empty( oSayPr2 )
               oSayPr2:show()
            end if
            if !Empty( aGet[ _aCVALPR2 ] )
               aGet[ _aCVALPR2 ]:show()
            end if
            if !Empty( oSayVp2 )
               oSayVp2:show()
            end if
         else
            if !Empty( oSayPr2 )
               oSayPr2:hide()
            end if
            if !Empty( aGet[ _aCVALPR2 ] )
               aGet[ _aCVALPR2 ]:hide()
            end if
            if !Empty( oSayVp2 )
               oSayVp2:hide()
            end if
         end if

      end if

   end if

RETURN lReturn

//--------------------------------------------------------------------------//

Static Function lArrayRen( nTipPre, oBrwRen, aTmp, aTmpCli, aGetCli, cCosto )

   local nNetoBase
   local nResultado
   local nCosto
   local nDtoAtpico
   local nSbrAtipico := aGetCli[ _NSBRATP ]:nAt

   aRentabilidad     := {}

   /*
   Seleccionamos el precio que nos elijan--------------------------------------
   */

   do case
      case nTipPre == 1
         nNetoBase   := aTmp[ _aNPRCART ]
      case nTipPre == 2
         nNetoBase   := aTmp[ _aNPRCART2 ]
      case nTipPre == 3
         nNetoBase   := aTmp[ _aNPRCART3 ]
      case nTipPre == 4
         nNetoBase   := aTmp[ _aNPRCART4 ]
      case nTipPre == 5
         nNetoBase   := aTmp[ _aNPRCART5 ]
      case nTipPre == 6
         nNetoBase   := aTmp[ _aNPRCART6 ]
   end case

   /*
   Seleccionamos el precio de costo--------------------------------------------
   */

   if aTmp[ _aLPRCCOM ]
      nCosto         := aTmp[ _aNPRCCOM ]
   else
      nCosto         := cCosto
   end if

   /*Costo*/

   aAdd( aRentabilidad, { "Costo", "", nCosto, .f., .f. } )

   /*Neto Base*/

   aAdd( aRentabilidad, { "Neto base", "", nNetoBase, .f., .f. } )

   /*Dto X*Y*/

   if aTmp[ _aNUNCOFE ] != 0 .and. aTmp[ _aNUNVOFE ] != 0

      if ( aTmp[ _aNUNCOFE ] != 1 .or. aTmp[ _aNUNVOFE ] != 1 )

         nResultado := nNetoBase - ( Div( ( nNetoBase * aTmp[ _aNUNCOFE ] ), aTmp[ _aNUNVOFE ] ) )

         aAdd( aRentabilidad, { Space(3) + "Dto. X*Y", AllTrim( Str( aTmp[ _aNUNVOFE ] ) ) + " * " + AllTrim( Str( aTmp[ _aNUNCOFE ] ) ), - ( nResultado ), .f., .f. } )

         nNetoBase -= nResultado

      end if

   end if

   /*Dto Art*/

   if aTmp[ _aNDTOART ] != 0

      nResultado := ( ( nNetoBase * aTmp[ _aNDTOART ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + "Dto. art.", AllTrim( Str( aTmp[ _aNDTOART ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Dto Lin*/

   if aTmp[ _aNDTODIV ] != 0

      aAdd( aRentabilidad, { Space(3) + "Dto. lineal", Trans( aTmp[ _aNDTODIV ], cPouDiv( cDivEmp(), dbfDiv ) ), - ( aTmp[ _aNDTODIV ] ), .f., .f. } )

      nNetoBase -= aTmp[ _aNDTODIV ]

   end if

   /*Dto Promo*/

   if aTmp[ _aNDPRART ] != 0

      nResultado := ( ( nNetoBase * aTmp[ _aNDPRART ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + "Dto. promo.", AllTrim( Str( aTmp[ _aNDPRART ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Comisi�n agente*/

   if aTmp[ _aNCOMAGE ] != 0

      nResultado := ( ( nNetoBase * aTmp[ _aNCOMAGE ] ) / 100 )

      if aTmp[ _aLCOMAGE ]
         aAdd( aRentabilidad, { Space(3) + "Com. agente", AllTrim( Str( aTmp[ _aNCOMAGE ] ) ) + " %", - ( nResultado ), .f., .f. } )
         nNetoBase -= nResultado
      else
         aAdd( aRentabilidad, { Space(3) + "Com. agente", AllTrim( Str( aTmp[ _aNCOMAGE ] ) ) + " %", nResultado, .f., .f. } )
      end if

   end if

   /*Atipico con la opcion 1*/

   if nSbrAtipico == 1 .and. aTmpCli[ _NDTOATP ] != 0

      nDtoAtpico := ( ( nNetoBase * aTmpCli[ _NDTOATP ] ) / 100 )

   end if

   /*Dto General*/

   if aTmpCli[ _NDTOESP ] != 0

      nResultado := ( ( nNetoBase * aTmpCli[ _NDTOESP ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + AllTrim( aTmpCli[ _CDTOESP ] ), AllTrim( Str( aTmpCli[ _NDTOESP ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Atipico con la opcion 2*/

   if nSbrAtipico == 2 .and. aTmpCli[ _NDTOATP ] != 0

      nDtoAtpico := ( ( nNetoBase * aTmpCli[ _NDTOATP ] ) / 100 )

   end if

   /*Pronto pago*/

   if aTmpCli[ _NDPP ] != 0

      nResultado := ( ( nNetoBase * aTmpCli[ _NDPP ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + AllTRim( aTmpCli[ _CDPP ] ), AllTrim( Str( aTmpCli[ _NDPP ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Atipico con la opcion 3*/

   if nSbrAtipico == 3 .and. aTmpCli[ _NDTOATP ] != 0

      nDtoAtpico := ( ( nNetoBase * aTmpCli[ _NDTOATP ] ) / 100 )

   end if

   /*Definido 1*/

   if !Empty( aTmpCli[ _CDTOUNO ] ) .or. aTmpCli[ _NDTOCNT ] != 0

      nResultado := ( ( nNetoBase * aTmpCli[ _NDTOCNT ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + aTmpCli[ _CDTOUNO ], AllTrim( Str( aTmpCli[ _NDTOCNT ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Atipico con la opcion 4*/

   if nSbrAtipico == 4 .and. aTmpCli[ _NDTOATP ] != 0

      nDtoAtpico := ( ( nNetoBase * aTmpCli[ _NDTOATP ] ) / 100 )

   end if

   /*Definido 2*/

   if !Empty( aTmpCli[ _CDTODOS ] ) .or. aTmpCli[ _NDTORAP ] != 0

      nResultado := ( ( nNetoBase * aTmpCli[ _NDTORAP ] ) / 100 )

      aAdd( aRentabilidad, { Space(3) + aTmpCli[ _CDTODOS ], AllTrim( Str( aTmpCli[ _NDTORAP ] ) ) + " %", - ( nResultado ), .f., .f. } )

      nNetoBase -= nResultado

   end if

   /*Atipico con la opcion 5*/

   if nSbrAtipico == 5 .and. aTmpCli[ _NDTOATP ] != 0

      nDtoAtpico := ( ( nNetoBase * aTmpCli[ _NDTOATP ] ) / 100 )

   end if

   if aTmpCli[ _NDTOATP ] != 0

      /*Neto antes de atipico*/

      aAdd( aRentabilidad, { "Neto sin " + aTmpCli[ _CDTOATP ] , "", nNetoBase, .f., .f. } )

      /*Resultado descuento atipico*/

      aAdd( aRentabilidad, { Space(3) + aTmpCli[ _CDTOATP ], AllTrim( Str( aTmpCli[ _NDTOATP ] ) ) + " %", - ( nDtoAtpico ), .f., .f. } )

      nNetoBase   -= nDtoAtpico

   end if

   /*Neto total*/

   aAdd( aRentabilidad, { "Tarifa neta", "", nNetoBase, .f., .f. } )

   /*Margen und*/

   nResultado := nNetoBase - nCosto

   aAdd( aRentabilidad, { "Margen unidades", "", nResultado, .f., .f. } )

   /*Margen cajas*/

   nResultado := ( nNetoBase - nCosto ) * ( dbfArticulo )->nUniCaja

   aAdd( aRentabilidad, { "Margen cajas", Trans( ( dbfArticulo )->nUniCaja, MasUnd() ), nResultado, .f., .f. } )

   /*Rentabilidad costo*/

   nResultado :=  ( Div( nNetoBase, nCosto ) - 1 ) * 100

   aAdd( aRentabilidad, { "Rent. costo", "", nResultado, .t., .f. } )

   /*Rentabilidad m�nima del art�culo*/

   aAdd( aRentabilidad, { "Rent. m�nima", "", ( dbfArticulo )->nRenMin, .t., if( ( dbfArticulo )->nRenMin > nResultado, .t., .f. ) } )

   /*Ratio capacidad de maniobra*/

   aAdd( aRentabilidad, { "Ratio maniobra", "", nResultado - ( dbfArticulo )->nRenMin, .t., .f. } )

   /*Porcentaje margen de venta*/

   nResultado :=  Div( ( nNetoBase - nCosto ), nNetoBase ) * 100

   aAdd( aRentabilidad, { "% Margen venta", "", nResultado, .t., .f. } )

   /*
   Refrescamos el brwose-------------------------------------------------------
   */

   oBrwRen:nAt       := 1
   oBrwRen:SetArray( aRentabilidad )
   oBrwRen:Refresh()

Return .t.

//---------------------------------------------------------------------------//

Static Function ChangeNaturaleza( aGet, aTmp, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oGetArticulo, oGetFamilia, oCosto, nMode, oSayLabels, lInit )

   DEFAULT lInit  := .f.

   if nMode == APPD_MODE

      if !Empty( oGetArticulo )
         oGetArticulo:cText( "" )
      end if
      if !Empty( oGetFamilia )
         oGetFamilia:cText( "" )
      end if

      if !Empty( oCosto )
         oCosto:cText( 0 )
      end if

      if !Empty( aGet[ _aCCODART  ] )
         aGet[ _aCCODART  ]:cText( Space( 18 ) )
      end if
      if !Empty( aGet[ _aCCODFAM  ] )
         aGet[ _aCCODFAM  ]:cText( Space( 5 ) )
      end if
      if !Empty( aGet[ _aNPRCCOM  ] )
         aGet[ _aNPRCCOM  ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART  ] )
            aGet[ _aNPRCART  ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART2 ] )
            aGet[ _aNPRCART2 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART3 ] )
            aGet[ _aNPRCART3 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART4 ] )
            aGet[ _aNPRCART4 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART5 ] )
            aGet[ _aNPRCART5 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPRCART6 ] )
            aGet[ _aNPRCART6 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA1 ] )
            aGet[ _aNPREIVA1 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA2 ] )
            aGet[ _aNPREIVA2 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA3 ] )
            aGet[ _aNPREIVA3 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA4 ] )
            aGet[ _aNPREIVA4 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA5 ] )
            aGet[ _aNPREIVA5 ]:cText( 0 )
      end if
      if !Empty( aGet[ _aNPREIVA6 ] )
            aGet[ _aNPREIVA6 ]:cText( 0 )
      end if

   end if

   if aGet[ _aNTIPATP ]:nAt == 1

      if !Empty( aGet[ _aCCODART ] )
         aGet[ _aCCODART ]:Show()
      end if
      if !Empty( oGetArticulo )
         oGetArticulo:Show()
      end if

      if !Empty( aGet[ _aCCODFAM ] )
         aGet[ _aCCODFAM ]:Hide()
      end if
      if !Empty( oGetFamilia )
         oGetFamilia:Hide()
      end if

      if !lInit

         if !Empty( oSayPr1 )
            oSayPr1:Hide()
         end if

         if !Empty( oSayPr2 )
            oSayPr2:Hide()
         end if

         if !Empty( oSayVp1 )
            oSayVp1:SetText( Space(10) )
         end if

         if !Empty( oSayVp2 )
            oSayVp2:SetText( Space(10) )
         end if

         if !Empty( oSayVp1 )
            oSayVp1:Hide()
         end if

         if !Empty( oSayVp2 )
            oSayVp2:Hide()
         end if

         if !Empty( aGet[ _aCVALPR1 ] )
            aGet[ _aCVALPR1 ]:cText( Space(10) )
         end if

         if !Empty( aGet[ _aCVALPR2 ] )
            aGet[ _aCVALPR2 ]:cText( Space(10) )
         end if

         if !Empty( aGet[ _aCVALPR1 ] )
            aGet[ _aCVALPR1 ]:Hide()
         end if

         if !Empty( aGet[ _aCVALPR2 ] )
            aGet[ _aCVALPR2 ]:Hide()
         end if

      end if

      if !Empty( oCosto )
         oCosto:Show()
      end if

      if !Empty( aGet[ _aLPRCCOM  ] )
         aGet[ _aLPRCCOM  ]:Show()
      end if

      if !Empty( aGet[ _aNPRCCOM  ] )
         aGet[ _aNPRCCOM  ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART  ] )
          aGet[ _aNPRCART  ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART2 ] )
         aGet[ _aNPRCART2 ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART3 ] )
         aGet[ _aNPRCART3 ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART4 ] )
         aGet[ _aNPRCART4 ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART5 ] )
         aGet[ _aNPRCART5 ]:Show()
      end if

      if !Empty( aGet[ _aNPRCART6 ] )
         aGet[ _aNPRCART6 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA1 ] )
         aGet[ _aNPREIVA1 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA2 ] )
         aGet[ _aNPREIVA2 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA3 ] )
         aGet[ _aNPREIVA3 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA4 ] )
         aGet[ _aNPREIVA4 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA5 ] )
         aGet[ _aNPREIVA5 ]:Show()
      end if

      if !Empty( aGet[ _aNPREIVA6 ] )
         aGet[ _aNPREIVA6 ]:Show()
      end if

      if !Empty( aGet[ _aNDTO1    ] )
         aGet[ _aNDTO1    ]:Show()
      end if

      if !Empty( aGet[ _aNDTO2    ] )
         aGet[ _aNDTO2    ]:Show()
      end if

      if !Empty( aGet[ _aNDTO3    ] )
         aGet[ _aNDTO3    ]:Show()
      end if

      if !Empty( aGet[ _aNDTO4    ] )
         aGet[ _aNDTO4    ]:Show()
      end if

      if !Empty( aGet[ _aNDTO5    ] )
         aGet[ _aNDTO5    ]:Show()
      end if

      if !Empty( aGet[ _aNDTO6    ] )
         aGet[ _aNDTO6    ]:Show()
      end if

#ifndef __PDA__
      if !Empty( oSayLabels )
         aEval( oSayLabels, {|o| o:Show() } )
      end if
#endif

   else

      if !Empty( aGet[ _aCCODART ] )
         aGet[ _aCCODART ]:Hide()
      end if
      if !Empty( oGetArticulo )
         oGetArticulo:Hide()
      end if

      if !Empty( aGet[ _aCCODFAM ] )
         aGet[ _aCCODFAM ]:Show()
      end if
      if !Empty( oGetFamilia )
         oGetFamilia:Show()
      end if

      if !Empty( oSayPr1 )
         oSayPr1:Hide()
      end if
      if !Empty( oSayPr2 )
         oSayPr2:Hide()
      end if

      if !Empty( oSayVp1 )
         oSayVp1:SetText( Space(10) )
      end if
      if !Empty( oSayVp2 )
         oSayVp2:SetText( Space(10) )
      end if

      if !Empty( oSayVp1 )
         oSayVp1:Hide()
      end if
      if !Empty( oSayVp2 )
         oSayVp2:Hide()
      end if

      if !Empty( aGet[ _aCVALPR1 ] )
         aGet[ _aCVALPR1 ]:cText( Space(10) )
      end if
      if !Empty( aGet[ _aCVALPR2 ] )
         aGet[ _aCVALPR2 ]:cText( Space(10) )
      end if

      if !Empty( aGet[ _aCVALPR1 ] )
         aGet[ _aCVALPR1 ]:Hide()
      end if
      if !Empty( aGet[ _aCVALPR2 ] )
         aGet[ _aCVALPR2 ]:Hide()
      end if

      if !Empty( oCosto )
         oCosto:Hide()
      end if

      if !Empty( aGet[ _aLPRCCOM  ] )
         aGet[ _aLPRCCOM  ]:Hide()
      end if

      if !Empty( aGet[ _aNPRCCOM  ] )
         aGet[ _aNPRCCOM  ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART  ] )
         aGet[ _aNPRCART  ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART2 ] )
         aGet[ _aNPRCART2 ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART3 ] )
         aGet[ _aNPRCART3 ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART4 ] )
         aGet[ _aNPRCART4 ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART5 ] )
         aGet[ _aNPRCART5 ]:Hide()
      end if
      if !Empty( aGet[ _aNPRCART6 ] )
         aGet[ _aNPRCART6 ]:Hide()
      end if

      if !Empty( aGet[ _aNPREIVA1 ] )
         aGet[ _aNPREIVA1 ]:Hide()
      end if
      if !Empty( aGet[ _aNPREIVA2 ] )
         aGet[ _aNPREIVA2 ]:Hide()
      end if
      if !Empty( aGet[ _aNPREIVA3 ] )
         aGet[ _aNPREIVA3 ]:Hide()
      end if
      if !Empty( aGet[ _aNPREIVA4 ] )
         aGet[ _aNPREIVA4 ]:Hide()
      end if
      if !Empty( aGet[ _aNPREIVA5 ] )
         aGet[ _aNPREIVA5 ]:Hide()
      end if
      if !Empty( aGet[ _aNPREIVA6 ] )
         aGet[ _aNPREIVA6 ]:Hide()
      end if

      if !Empty( aGet[ _aNDTO1    ] )
         aGet[ _aNDTO1    ]:Hide()
      end if
      if !Empty( aGet[ _aNDTO2    ] )
         aGet[ _aNDTO2    ]:Hide()
      end if
      if !Empty( aGet[ _aNDTO3    ] )
         aGet[ _aNDTO3    ]:Hide()
      end if
      if !Empty( aGet[ _aNDTO4    ] )
         aGet[ _aNDTO4    ]:Hide()
      end if
      if !Empty( aGet[ _aNDTO5    ] )
         aGet[ _aNDTO5    ]:Hide()
      end if
      if !Empty( aGet[ _aNDTO6    ] )
         aGet[ _aNDTO6    ]:Hide()
      end if

#ifndef __PDA__
      if !Empty( oSayLabels )
         aEval( oSayLabels, {|o| o:Hide() } )
      end if
#endif

   end if

Return nil

//---------------------------------------------------------------------------//

static function SaveEdtAtp( aGet, aTmp, dbfTmpAtp, oBrw, oDlg, nMode )

   if aTmp[ _aDFECINI ] > aTmp[ _aDFECFIN ]
      MsgStop( "Fechas no validas" )
      return .f.
   end if

   if nMode == APPD_MODE

      if Empty( aTmp[ _aCCODART ] ) .and. aGet[ _aNTIPATP ]:nAt <= 1
         MsgStop( "C�digo de art�culo no puede estar vac�o" )
         aGet[ _aCCODART ]:SetFocus()
         return .f.
      end if

      if dbSeekAtp( aTmp, dbfTmpAtp, .f. ) .and. aGet[ _aNTIPATP ]:nAt <= 1
         msgStop( "C�digo de art�culo ya en tarifa para el rango de fechas" )
         return nil
      end if

      if Empty( aTmp[ _aCCODFAM ] ) .and. aGet[ _aNTIPATP ]:nAt == 2
         MsgStop( "C�digo de fam�lia no puede estar vac�o" )
         aGet[ _aCCODFAM ]:SetFocus()
         return .f.
      end if

      if dbSeekAtp( aTmp, dbfTmpAtp, .t. ) .and. aGet[ _aNTIPATP ]:nAt == 2
         msgStop( "C�digo de familia ya en tarifa para el rango de fechas" )
         return .f.
      end if

   end if

   /*
   Guardamos los datos en la tabla temporal-----------------------------------
   */

   CursorWait()

   oDlg:Disable()

   aTmp[ _aNTIPATP ]    := aGet[ _aNTIPATP ]:nAt

   WinGather( aTmp, aGet, dbfTmpAtp, oBrw, nMode )

   oDlg:Enable()

   CursorWE()

RETURN ( oDlg:end( IDOK ) )

//--------------------------------------------------------------------------//

Static Function dbSeekAtp( aTmp, dbfTmpAtp, lFam )

   local lSeek := .f.
   local nOrdAnt

   if lFam
      nOrdAnt  := ( dbfTmpAtp )->( OrdSetFocus( "cCodFam" ) )
      if ( dbfTmpAtp )->( dbSeek( aTmp[ _aCCODFAM ] ) )
         if ( dbfTmpAtp )->dFecFin >= aTmp[ _aDFECINI ] .and. !Empty( aTmp[ _aDFECINI ] )
            lSeek := .t.
         end if
      end if
      ( dbfTmpAtp )->( OrdSetFocus( nOrdAnt ) )
   else
      nOrdAnt  := ( dbfTmpAtp )->( OrdSetFocus( "cCodArt" ) )
      if ( dbfTmpAtp )->( dbSeek( aTmp[ _aCCODART ] + aTmp[ _aCCODPR1 ] + aTmp[ _aCCODPR2 ] + aTmp[ _aCVALPR1 ] + aTmp[ _aCVALPR2 ] ) )
         if ( dbfTmpAtp )->dFecFin >= aTmp[ _aDFECINI ] .and. !Empty( aTmp[ _aDFECINI ] )
            lSeek := .t.
         end if
      end if
      ( dbfTmpAtp )->( OrdSetFocus( nOrdAnt ) )
   end if

Return ( lSeek )

//--------------------------------------------------------------------------//

Static Function CalIva( nPrecio, lIvaInc, cTipIva, cCodImp, oGetIva )

   local nIvaPct  := nIva( dbfIva, cTipIva )

   /*
   Despues si tiene impuesto especial qitarlo
   */

   if !Empty( cCodImp ) .and. !Empty( oNewImp )
      nPrecio     += oNewImp:nValImp( cCodImp, .t., nIvaPct )
   end if

	/*
   Calculo del IGIC
	*/

   nPrecio        += ( nPrecio * nIvaPct / 100 )

   if oGetIva != NIL
      oGetIva:cText( nPrecio )
   end if

Return .t.

//----------------------------------------------------------------------------//

Static Function CalBas( nPrecio, lIvaInc, cTipIva, cCodImp, oGetBas )

	local nNewPre
   local nIvaPct  := nIva( dbfIva, cTipIva )

	/*
   Primero es quitar el IGIC
	*/

   nNewPre        := Div( nPrecio, ( 1 + nIvaPct / 100 ) )

   /*
   Despues si tiene impuesto especial qitarlo
   */

   if !Empty( cCodImp ) .and. !Empty( oNewImp )
      nNewPre     -= oNewImp:nValImp( cCodImp, lIvaInc , nIvaPct )
   end if

	/*
	Actualizamos la base
	*/

   oGetBas:cText( nNewPre )

Return .t.

//--------------------------------------------------------------------------//

Function nCalIva( nPrecio, lIvaInc, cTipIva, cCodImp )

   local nIvaPct  := nIva( dbfIva, cTipIva )

   /*
   Despues si tiene impuesto especial qitarlo
   */

   if !Empty( cCodImp ) .and. !Empty( oNewImp )
      nPrecio     += oNewImp:nValImp( cCodImp, .t., nIvaPct )
   end if

	/*
   Calculo del IGIC
	*/

   nPrecio        += ( nPrecio * nIvaPct / 100 )

Return nPrecio

//----------------------------------------------------------------------------//

Function nCalBas( nPrecio, lIvaInc, cTipIva, cCodImp )

	local nNewPre
   local nIvaPct  := nIva( dbfIva, cTipIva )

	/*
   Primero es quitar el IGIC
	*/

   nNewPre        := Div( nPrecio, ( 1 + nIvaPct / 100 ) )

   /*
   Despues si tiene impuesto especial qitarlo
   */

   if !Empty( cCodImp ) .and. !Empty( oNewImp )
      nNewPre     -= oNewImp:nValImp( cCodImp, lIvaInc , nIvaPct )
   end if

Return nNewPre

//--------------------------------------------------------------------------//

#ifndef __PDA__

#include "FastRepH.ch"

Static Function DataReport( oFr, lTemporal )

   /*
   Zona de datos---------------------------------------------------------------
   */

   oFr:ClearDataSets()

   if lTemporal
      oFr:SetWorkArea(  "Clientes",          ( tmpClient )->( Select() ), .f., { FR_RB_FIRST, FR_RE_LAST, 0 } )
   else
      oFr:SetWorkArea(  "Clientes",          ( dbfClient )->( Select() ), .f., { FR_RB_FIRST, FR_RE_LAST, 0 } )
   end if
   oFr:SetFieldAliases( "Clientes",          cItemsToReport( aItmCli() ) )

   oFr:SetWorkArea(     "Documetos",         ( dbfClientD )->( Select() ) )
   oFr:SetFieldAliases( "Documetos",         cItemsToReport( aCliDoc() ) )

   oFr:SetWorkArea(     "Tarifas clientes",  ( dbfCliAtp )->( Select() ) )
   oFr:SetFieldAliases( "Tarifas clientes",  cItemsToReport( aItmAtp() ) )

   oFr:SetWorkArea(     "Direcciones",       ( dbfObrasT )->( Select() ) )
   oFr:SetFieldAliases( "Direcciones",       cItemsToReport( aItmObr() ) )

   oFr:SetWorkArea(     "Contactos",         ( dbfContactos )->( Select() ) )
   oFr:SetFieldAliases( "Contactos",         cItemsToReport( aItmContacto() ) )

   oFr:SetWorkArea(     "Bancos",            ( dbfBanco )->( Select() ) )
   oFr:SetFieldAliases( "Bancos",            cItemsToReport( aCliBnc() ) )

   oFr:SetWorkArea(     "Incidencias",       ( dbfCliInc )->( Select() ) )
   oFr:SetFieldAliases( "Incidencias",       cItemsToReport( aCliInc() ) )

   if lTemporal
      oFr:SetMasterDetail( "Clientes",       "Documentos",        {|| ( tmpClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Tarifas clientes",  {|| ( tmpClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Direcciones",       {|| ( tmpClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Contactos",         {|| ( tmpClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Bancos",            {|| ( tmpClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Incidencias",       {|| ( tmpClient )->Cod } )
   else
      oFr:SetMasterDetail( "Clientes",       "Documentos",        {|| ( dbfClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Tarifas clientes",  {|| ( dbfClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Direcciones",       {|| ( dbfClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Contactos",         {|| ( dbfClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Bancos",            {|| ( dbfClient )->Cod } )
      oFr:SetMasterDetail( "Clientes",       "Incidencias",       {|| ( dbfClient )->Cod } )
   end if

   oFr:SetResyncPair(      "Clientes",       "Documentos" )
   oFr:SetResyncPair(      "Clientes",       "Tarifas clientes" )
   oFr:SetResyncPair(      "Clientes",       "Direcciones" )
   oFr:SetResyncPair(      "Clientes",       "Contactos" )
   oFr:SetResyncPair(      "Clientes",       "Bancos" )
   oFr:SetResyncPair(      "Clientes",       "Incidencias" )

Return nil

//---------------------------------------------------------------------------//

Function DesignReportClient( oFr, dbfDoc )

   local oLabel
   local nRec
   local nOrd
   local lOpen    := .f.
   local lFlag    := .f.

   /*
   Tratamiento para no hacer dos veces el openfiles al editar el documento en imprimir series
   */

   if lOpenFiles
      lFlag       := .t.
      nRec        := ( dbfClient )->( Recno() )
      nOrd        := ( dbfClient )->( OrdSetFocus( "Cod" ) )
   else
      if Openfiles()
         lFlag    := .t.
         lOpen    := .t.
      else
         lFlag    := .f.
      end if
   end if

   if lFlag

      oLabel      := TClienteLabelGenerator()

      if oLabel:lCreateTemporal()

         /*
         Zona de datos------------------------------------------------------------
         */

         DataReport( oFr, .t. )

         /*
         Paginas y bandas---------------------------------------------------------
         */

         if !Empty( ( dbfDoc )->mReport )

            oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

         else

            oFr:AddPage(         "MainPage" )

            oFr:AddBand(         "CabeceraColumnas",  "MainPage",       frxMasterData )
            oFr:SetProperty(     "CabeceraColumnas",  "Top",            200 )
            oFr:SetProperty(     "CabeceraColumnas",  "Height",         100 )
            oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet",        "Clientes" )

         end if

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

         oLabel:DestroyTemporal()

      else

         Return .f.

      end if

   end if

   if !Empty( nRec )
      ( dbfClient )->( dbGoTo( nRec ) )
   end if

   if !Empty( nOrd )
      ( dbfClient )->( OrdSetFocus( nOrd ) )
   end if

   if lOpen
      CloseFiles()
   end if

Return .t.

//---------------------------------------------------------------------------//

Function PrintReportCliente( nDevice, nCopies, cPrinter, dbfDoc )

   local oFr

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

   oFr:SetEventHandler( "Designer", "OnSaveReport", {|| oFr:SaveToBlob( ( dbfDoc )->( Select() ), "mReport" ) } )

   /*
   Zona de datos------------------------------------------------------------
   */

   DataReport( oFr, .t. )

   /*
   Cargar el informe-----------------------------------------------------------
   */

   if !Empty( ( dbfDoc )->mReport )

      oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

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

            oFr:SetProperty(  "PDFExport", "EmbeddedFonts",    .t. )
            oFr:SetProperty(  "PDFExport", "PrintOptimized",   .t. )
            oFr:SetProperty(  "PDFExport", "Outline",          .t. )
            oFr:DoExport(     "PDFExport" )

      end case

   end if

   /*
   Destruye el dise�ador-------------------------------------------------------
   */

   oFr:DestroyFr()

Return .t.

//---------------------------------------------------------------------------//

Static Function lPubInt( nMode, aTmp )

   if nMode != APPD_MODE
      aTmp[ _CCODWEB ]  := 0
   end if

Return ( nil )

//---------------------------------------------------------------------------//
#endif

Static Function lArticuloEnOferta( cCodigoArticulo, cCodigoCliente, cCodigoGrupo )

   local lOferta     := .f.

   if ( dbfOfe )->( dbSeek( cCodigoArticulo ) )

      while ( dbfOfe )->cArtOfe == cCodigoArticulo .and. !( dbfOfe )->( eof() )

			/*
         Comprobamos si esta entre las fechas----------------------------------
			*/

         if ( GetSysDate() >= ( dbfOfe )->dIniOfe .or. Empty( ( dbfOfe )->dIniOfe ) ) .and. ;
            ( GetSysDate() <= ( dbfOfe )->dFinOfe .or. Empty( ( dbfOfe )->dFinOfe ) ) .and. ;
            ( ( dbfOfe )->nCliOfe == 1 .or. ( ( dbfOfe )->nCliOfe == 2 .and. cCodigoCliente == ( dbfOfe )->cCliOfe ) .or. ( ( dbfOfe )->nCliOfe == 3 .and. cCodigoGrupo == ( dbfOfe )->cGrpOfe ) )

            lOferta  := .t.

            exit

         end if

         ( dbfOfe )->( dbSkip() )

      end do

   end if

Return ( lOferta )

//---------------------------------------------------------------------------//

Function nTotalValesCliente( cCodCli, dDesde, dHasta, cTikT, cTikL, cDiv, nYear )

   local nTotal

   DEFAULT cCodCli   := ( dbfClient )->Cod
   DEFAULT cTikT     := dbfTikT
   DEFAULT cTikL     := dbfTikL
   DEFAULT cDiv      := dbfDiv

   nTotal            := nValTik( cCodCli, dDesde, dHasta, cTikT, cTikL, dbfDiv, nYear )

Return ( nTotal )

//---------------------------------------------------------------------------//

static Function ReportingClient()

   oReporting  := TFastVentasClientes():New()
   oReporting:Play()

Return( oReporting )

//---------------------------------------------------------------------------//

FUNCTION BrwBncCli( oGet, oEntBnc, oSucBnc, oDigBnc, oCtaBnc, cCodCli, dbfBancos )

	local oDlg
	local oBrw
   local oFont
   local oBtn
	local oGet1
	local cGet1
   local nOrd        := GetBrwOpt( "BrwBancos" )
	local oCbxOrd
   local aCbxOrd     := { "Nombre", "Cuenta" }
   local cCbxOrd     := "Nombre"
   local nLevel      := nLevelUsr( "01032" )
   local lClose      := .f.

   nOrd              := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd           := aCbxOrd[ nOrd ]

   if Empty( cCodCli )
		MsgStop( "Es necesario codificar un cliente" )
      return .t.
   end if

   if !lExistTable( cPatCli() + "CliBnc.Dbf" )
      MsgStop( 'No existe el fichero de bancos' )
      Return .f.
   end if

   if Empty( dbfBancos )
      USE ( cPatCli() + "CliBnc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIBNC", @dbfBancos ) )
      SET ADSINDEX TO ( cPatCli() + "CliBnc.Cdx" ) ADDITIVE
      lClose      := .t.
   END IF

   ( dbfBancos )->( ordSetFocus( nOrd ) )

   ( dbfBancos )->( OrdScope( 0, cCodCli ) )
   ( dbfBancos )->( OrdScope( 1, cCodCli ) )
   ( dbfBancos )->( dbGoTop() )

   DEFINE DIALOG  oDlg ;
      RESOURCE    "HELPENTRY";
      TITLE       "Seleccionar banco"

      REDEFINE GET oGet1 VAR cGet1;
         ID       104 ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfBancos, nil, cCodCli ) );
         BITMAP   "Find" ;
         OF       oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE(  ( dbfBancos )->( OrdSetFocus( oCbxOrd:nAt ) ),;
                     ( dbfBancos )->( OrdScope( 0, cCodCli ) ),;
                     ( dbfBancos )->( OrdScope( 1, cCodCli ) ),;
                     oBrw:Refresh(),;
                     oGet1:SetFocus() );
			OF 		oDlg

      oBrw                 := TXBrowse():New( oDlg )

      oBrw:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias          := dbfBancos
      oBrw:nMarqueeStyle   := 5

      with object ( oBrw:AddCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cCodCli"
         :bEditValue       := {|| ( dbfBancos )->cCodBnc }
         :nWidth           := 200
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Cuenta"
         :cSortOrder       := "cCtaBnc"
         :bEditValue       := {|| ( dbfBancos )->cEntBnc + "-" + ( dbfBancos )->cSucBnc + "-" + ( dbfBancos )->cDigBnc + "-" + ( dbfBancos )->cCtaBnc }
         :nWidth           := 150
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Domicilio"
         :bEditValue       := {|| ( dbfBancos )->cDirBnc }
         :nWidth           := 120
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Poblaci�n"
         :bEditValue       := {|| ( dbfBancos )->cPobBnc }
         :nWidth           := 100
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "C�digo postal"
         :bEditValue       := {|| ( dbfBancos )->cCPBnc }
         :nWidth           := 40
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Provincia"
         :bEditValue       := {|| ( dbfBancos )->cProBnc }
         :nWidth           := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Tel�fono"
         :bEditValue       := {|| ( dbfBancos )->cTlfBnc }
         :nWidth           := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Fax"
         :bEditValue       := {|| ( dbfBancos )->cFaxBnc }
         :nWidth           := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader          := "Contacto"
         :bEditValue       := {|| ( dbfBancos )->cPContBnc }
         :nWidth           := 140
      end with

      oBrw:bLDblClick      := {|| oDlg:end( IDOK ) }

      oBrw:CreateFromResource( 105 )

		REDEFINE BUTTON ;
         ID       500 ;
         OF       oDlg ;
         WHEN     ( .f. );
         ACTION   ( nil )

		REDEFINE BUTTON ;
         ID       501 ;
         OF       oDlg ;
         WHEN     ( .f. );
         ACTION   ( nil )

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      oGet:cText( ( dbfBancos )->CCODBNC )

      if oEntBnc != NIL
         oEntBnc:cText( ( dbfBancos )->CENTBNC )
      end if

      if oSucBnc != NIL
         oSucBnc:cText( ( dbfBancos )->CSUCBNC )
      end if

      if oDigBnc != NIL
         oDigBnc:cText( ( dbfBancos )->CDIGBNC )
      end if

      if oCtaBnc != NIL
         oCtaBnc:cText( ( dbfBancos )->CCTABNC )
      end if

   end if

   DestroyFastFilter( dbfBancos )

   SetBrwOpt( "BrwBancos", ( dbfBancos )->( OrdNumber() ) )

   if lClose
      ( dbfBancos )->( dbCloseArea() )
   else
      ( dbfBancos )->( OrdSetFocus( nOrd ) )
      ( dbfBancos )->( OrdScope( 0, nil ) )
      ( dbfBancos )->( OrdScope( 1, nil ) )
   end if

	oGet:setFocus()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Function cClientCuenta( cCliente, dbfBncCli )

   local lCloseBnc   := .f.
   local cCuenta     := ""

   if Empty( dbfBncCli )
      USE ( cPatCli() + "CliBnc.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIBNC", @dbfBncCli ) )
      SET ADSINDEX TO ( cPatCli() + "CliBnc.Cdx" ) ADDITIVE
      lCloseBnc      := .t.
   end if

   if dbSeekInOrd( cCliente, "cBncDef", dbfBncCli )
      cCuenta        := ( dbfBncCli )->cEntBnc + ( dbfBncCli )->cSucBnc + ( dbfBncCli )->cDigBnc + ( dbfBncCli )->cCtaBnc
   end if

   if Empty( cCuenta )
      if dbSeekInOrd( cCliente, "cCodCli", dbfBncCli )
         cCuenta     := ( dbfBncCli )->cEntBnc + ( dbfBncCli )->cSucBnc + ( dbfBncCli )->cDigBnc + ( dbfBncCli )->cCtaBnc
      end if
   end if

   cCuenta           := Alltrim( cCuenta )

   if lCloseBnc
      CLOSE ( dbfBncCli )
   end if

Return cCuenta

//---------------------------------------------------------------------------//

/*Paso de datos para Pinturas Mayka*/

/*Function TraspasoMayka()

   local dbfClientes
   local dbfArticulos
   local dbfProveedores
   local oFile
   local cGetFile             := cGetFile( "*.txt", "Selecci�n de fichero" )

   if !Empty( cGetFile )

      /*
      Clientes-----------------------------------------------------------------
      */

      /*USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClientes ) )
      SET ADSINDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

      oFile           := TTxtFile():New( cGetFile )

      oMsgProgress()
      oMsgProgress():SetRange( 0, oFile:nTLines )

      while !oFile:lEoF()

         ( dbfClientes )->( dbAppend() )

         ( dbfClientes )->Cod          := Padl( AllTrim( SubStr( oFile:cLine,  1, 7 ) ), RetNumCodCliEmp(), "0" )
         ( dbfClientes )->Titulo       := SubStr( oFile:cLine,  9, 27 )
         ( dbfClientes )->NbrEst       := SubStr( oFile:cLine,  38, 23 )
         ( dbfClientes )->Domicilio    := SubStr( oFile:cLine,  62, 21 )
         ( dbfClientes )->Poblacion    := SubStr( oFile:cLine,  84, 11 )
         ( dbfClientes )->Provincia    := SubStr( oFile:cLine,  96, 11 )
         ( dbfClientes )->nTarifa      := 1
         ( dbfClientes )->cCodAlm      := "000"

         ( dbfClientes )->( dbUnLock() )

         oFile:Skip()

         oMsgProgress():Deltapos(1)

      end while

      oFile:End()

      CLOSE ( dbfClient )*/

      /*
      Art�culos----------------------------------------------------------------
      */
  /*
      USE ( cPatGrp() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulos ) )
      SET ADSINDEX TO ( cPatGrp() + "ARTICULO.CDX" ) ADDITIVE

      oFile           := TTxtFile():New( cGetFile )

      oMsgProgress()
      oMsgProgress():SetRange( 0, oFile:nTLines )

      while !oFile:lEoF()

         ( dbfArticulos )->( dbAppend() )

         ( dbfArticulos )->Codigo    := SubStr( oFile:cLine,  1, 12 )
         ( dbfArticulos )->Nombre    := SubStr( oFile:cLine,  12, 41 )
         ( dbfArticulos )->lIvaInc   := .t.
         ( dbfArticulos )->TipoIva   := "G"
         //( dbfArticulos )->pVenta1   := Val( AllTrim( SubStr( oFile:cLine,  98, 12 ) ) )
         ( dbfArticulos )->pVtaIva1  := Val( AllTrim( SubStr( oFile:cLine,  98, 12 ) ) )
         ( dbfArticulos )->PCosto    := Val( AllTrim( SubStr( oFile:cLine, 110, 14 ) ) )
         ( dbfArticulos )->MComent   := SubStr( oFile:cLine,  133, 27 )

         ( dbfArticulos )->( dbUnLock() )

         oFile:Skip()

         oMsgProgress():Deltapos(1)

      end while

      oFile:End()

      CLOSE ( dbfArticulos )

      /*
      Proveedores--------------------------------------------------------------
      */

      /*USE ( cPatGrp() + "PROVEE.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PROVEE", @dbfProveedores ) )
      SET ADSINDEX TO ( cPatGrp() + "PROVEE.CDX" ) ADDITIVE

      oFile           := TTxtFile():New( cGetFile )

      oMsgProgress()
      oMsgProgress():SetRange( 0, oFile:nTLines )

      while !oFile:lEoF()

         ( dbfProveedores )->( dbAppend() )

         ( dbfProveedores )->Cod          := Padl( AllTrim( SubStr( oFile:cLine,  1, 7 ) ), RetNumCodPrvEmp(), "0" )
         ( dbfProveedores )->Titulo       := SubStr( oFile:cLine,  7, 32 )
         ( dbfProveedores )->Domicilio    := SubStr( oFile:cLine,  39, 30 )
         ( dbfProveedores )->Poblacion    := SubStr( oFile:cLine,  69, 24 )
         ( dbfProveedores )->Provincia    := SubStr( oFile:cLine,  93, 11 )

         ( dbfProveedores )->( dbUnLock() )

         oFile:Skip()

         oMsgProgress():Deltapos(1)

      end while

      oFile:End()

      CLOSE ( dbfProveedores )*/

    /*  msginfo( "Proceso finalizado" )

   end if

Return nil*/

//---------------------------------------------------------------------------//