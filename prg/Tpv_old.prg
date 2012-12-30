#ifndef __PDA__
   #include "FiveWin.Ch"
   #include "WebCtl.ch"
   #include "Report.ch"
   #include "Xbrowse.ch"
#else
   #include "FWCE.ch"
   REQUEST DBFCDX
#endif

#include "Factu.Ch"
#include "DbInfo.ch"

#define CABECERA                 "1"
#define CUERPO                   "2"
#define PIE                      "3"

#define _MENUITEM_               "01063"

#define NUM_BTN_FAM               7
#define NUM_BTN_ART              19

#define FONT_NAME                "Arial" // "Segoe UI"

/*
Ficheros-----------------------------------------------------------------------
*/

#define _CSERTIK                   1      //   C,     1,     0
#define _CNUMTIK                   2      //   C,     9,     0
#define _CSUFTIK                   3      //   C,     2,     0
#define _CTIPTIK                   4      //   C,     1,     0
#define _CTURTIK                   5      //   C,     6,     0
#define _DFECTIK                   6      //   D,     8,     0
#define _CHORTIK                   7      //   C,     5,     0
#define _CCCJTIK                   8      //   C,     3,     0
#define _CNCJTIK                   9      //   C,     3,     0
#define _CALMTIK                   10     //   C,     3,     0
#define _CCLITIK                   11     //   C,    12,     0
#define _NTARIFA                   12     //   L,     1,     0
#define _CNOMTIK                   13     //   C,    50,     0
#define _CDIRCLI                   14
#define _CPOBCLI                   15
#define _CPRVCLI                   16
#define _NCODPROV                  17
#define _CPOSCLI                   18
#define _CDNICLI                   19
#define _LMODCLI                   20
#define _CFPGTIK                   21     //   C,     2,     0
#define _NCOBTIK                   22     //   N,    13,     3
#define _NCAMTIK                   23     //   N,    13,     3
#define _CDIVTIK                   24     //   C,     3,     0
#define _NVDVTIK                   25     //   N,    10,     3
#define _LCLOTIK                   26     //   L,     1,     0
#define _LSNDDOC                   27     //   L,     1,     0
#define _LPGDTIK                   28     //   L,     1,     0
#define _CRETPOR                   29
#define _CRETMAT                   30
#define _CNUMDOC                   31
#define _CCODAGE                   32     //   C,     3,     0
#define _CCODRUT                   33     //   C,     4,     0
#define _CCODTAR                   34     //   C,     5,     0
#define _CCODOBR                   35     //   C,     3,     0
#define _NCOMAGE                   36     //   N      5,     1
#define _LLIQTIK                   37     //   L      1,     0
#define _CCODPRO                   38     //   C      9,     0, "Codigo de proyecto en contabilidad"} }
#define _LCONTIK                   39     //   L      1,     0
#define _DFECCRE                   40
#define _CTIMCRE                   41
#define _LSELDOC                   42     //   L      1,     0
#define _CVALDOC                   43
#define _CTURVAL                   44
#define _LCNVTIK                   45     //   L      1,     0
#define _CCODDLG                   46     //   C      1,     0
#define _CCODGRP                   47     //   C      1,     0
#define _CCODSALA                  48     //   C      1,     0
#define _CPNTVENTA                 49     //   C      1,     0
#define _LABIERTO                  50     //   L      1,     0
#define _CALIASTIK                 51     //   L      1,     0
#define _NNUMCOM                   52     //   N      3,     0
#define _CALBTIK                   53     //   C     12,     0
#define _CPEDTIK                   54     //   C     12,     0
#define _CPRETIK                   55     //   C     12,     0
#define _CDTOESP                   56
#define _NDTOESP                   57
#define _CDPP                      58
#define _NDPP                      59
#define _NPCTPRM                   60
#define _CTIKVAL                   61     //   C     13,     0
#define _CTLFCLI                   62     //   C     20,     0
#define _LFRETIK                   63
#define _NTOTNET                   64
#define _NTOTIVA                   65
#define _NTOTTIK                   66

#define _CSERTIL                   1      //   C      1      0
#define _CNUMTIL                   2      //   C     10      0
#define _CSUFTIL                   3      //   C      2      0
#define _CTIPTIL                   4      //   C      1      0
#define _CCBATIL                   5      //   C     14      0
#define _CNOMTIL                   6      //   C     20      0
#define _NPVPTIL                   7      //   N     13      3
#define _NUNTTIL                   8      //   N     13      3
#define _NUNDKIT                   9      //   N      5      2
#define _NIVATIL                  10      //   C      3      0
#define _CFAMTIL                  11      //   L      1      0
#define _LOFETIL                  12      //   C     20      0
#define _CCOMTIL                  13      //   C     20      0
#define _CNCMTIL                  14      //   C     13      3
#define _NPCMTIL                  15      //   C      5      0
#define _CFCMTIL                  16      //   L      1      0
#define _LFRETIL                  17
#define _NDTOLIN                  18
#define _CCODPR1                  19
#define _CCODPR2                  20
#define _CVALPR1                  21
#define _CVALPR2                  22
#define _NFACCNV                  23
#define _NDTODIV                  24      //   L      1      0
#define _LTIPACC                  25      //   L      1      0
#define _NCTLSTK                  26      //   N      5      1
#define _CALMLIN                  27
#define _NVALIMP                  28
#define _CCODIMP                  29
#define _NCOSDIV                  30
#define _NNUMLIN                  31
#define _LKITART                  32
#define _LKITCHG                  33
#define _LKITPRC                  34
#define _LIMPLIN                  35
#define _NMESGRT                  36
#define _LCONTROL                 37
#define _MNUMSER                  38
#define _CCODFAM                  39
#define _CGRPFAM                  40
#define _NLOTE                    41
#define _CLOTE                    42
#define _NNUMPGO                  43
#define _CSUFPGO                  44
#define _NNUMMED                  45
#define _NMEDUNO                  46
#define _NMEDDOS                  47
#define _NMEDTRE                  48
#define _CCODINV                  49
#define _NFCMCNV                  50
#define _CCODUSR                  51
#define _LIMPCOM                  52
#define _NIMPCOM1                 53
#define _NIMPCOM2                 54
#define _CCOMENT                  55
#define _CNOMCMD                  56      //   C     20      0
#define _LINPROMO                 57
#define _LARTSERV                 58
#define _CCODTIMP                 59
#define _NORTIMP                  60
#define _CUNIDAD                  61
#define _LDEV                     62
#define _CNUMDEV                  63

#define _NNUMREC                   4
#define _CCODCAJ                   5
#define _DPGOTIK                   6
#define _CTIMTIK                   7
#define _CFPGPGO                   8
#define _NIMPTIK                   9
#define _NDEVTIK                  10
#define _CPGDPOR                  11
#define _CDIVPGO                  12
#define _NVDVPGO                  13
#define _LCONPGO                  15
#define _CCTAPGO                  15
#define _LCLOPGO                  16
#define _LSNDPGO                  17
#define _CTURPGO                  18
#define _CCTAREC                  19

#define _LCOMANDA                 4
#define _LIMP                     5
#define _DFTIKIMP                 8
#define _CHTIKIMP                 9

#ifndef __PDA__

memvar cDbfTik
memvar cDbfTil
memvar cDbfTip
memvar cDbfCli
memvar cDbfUsr
memvar cPouTik
memvar cPorTik
memvar cUndTik
memvar nDouTik
memvar nDorTik
memvar nTotTik
memvar nTotPrm
memvar nTotIvm
memvar aIvaTik
memvar aBrtTik
memvar aBasTik
memvar aImpTik
memvar aIvmTik
memvar nTotBrt
memvar nTotNet
memvar nTotIva
memvar nTotAlb
memvar nTotFac
memvar nTotPax

memvar nTotDtoEsp
memvar nTotDpp

memvar cDbfAlbCliT
memvar cDbfAlbCliL
memvar cDbfFacCliT
memvar cDbfFacCliL

static nLevel
static oWndBrw
static oWndBig
static dbfClient
static dbfUsr
static dbfCodebar
static dbfCajT
static dbfTmpP
static dbfTmpV
static dbfTmpA
static dbfTmpE
static dbfTmpC
static dbfOferta
static dbfTblPro
static dbfFacCliT
static dbfFacCliL
static dbfFacCliP
static dbfAntCliT
static dbfAlbCliT
static dbfAlbCliL
static dbfAlbCliP
static dbfObrasT
static dbfAgent
static dbfTarPreL
static dbfTarPreS
static dbfRuta
static dbfAlm
static dbfDoc
static dbfFlt
static dbfCliAtp
static dbfCajPorta
static dbfAgeCom
static dbfEmp
static dbfArtDiv
static dbfHisMov
static dbfCategoria

static dbfPedCliT
static dbfPedCliL
static dbfPedCliP

static dbfPreCliT
static dbfPreCliL

static oVisor
static oImpresora
static oBalanza
static oInvitacion

static cNewFilP
static cNewFilV
static cNewFilA
static cNewFilE
static cNewFilC
static oBmpVis
static nOldPvp
static lApartado

static oBandera
static oStock
static oCaptura
static oFideliza

static oMetMsg
static nMetMsg
static oFntTot
static oFntEur
static oFntBrw
static oFntNum
static cFilBmp
static aDim
static oBtnIni
static oBtnFam
static oSayFam
static oBtnArt
static oBtnNum
static oSayArt
static oBtnTik
static oBtnAlb
static oBtnFac
static oBtnApt
static oBtnVal
static oBtnDev
static oBtnUp
static oBtnDown
static oGrupoSerie
static oBtnUpSerie
static oBtnDownSerie
static oBtnAdd
static oBtnEdt
static oBtnDel
static oDlgDet
static oBtnTipoVta

static oCopTik
static lCopTik             := .t.
static nCopTik             := 1
static lRegalo             := .f.

static oTotEsp
static oTotDpp

static oRieCli

static oOfficeBar

static aGetTxt
static oGetTxt

static oBrwDet

static oBtnFree
static oSayFree

static oBtnUsuario
static oSayUsuario
static oBtnTarifa
static oBtnEntregar
static oBtnRenombrar
static oBtnPedidos
static oBtnCliente
static oBtnDireccion
static oBtnTelefono

static oTotDiv

static nTotOld

static nSaveMode
static lSave

static oTimerBtn
static oTimer

static cCapCaj
static oNewImp
static oMenu
static nCambioTik          := 0
static nTotalTik           := 0
static cCodArtAnt          := ""
static cCodFamAnt          := ""
static aRecFam             := {}
static lNowAppendLine      := .f.
static aRecArt             := {}
static cOldCodCli          := ""
static cOldCodArt          := ""
static cOldPrpArt          := ""
static oTComandas

static cFiltroCajero       := ""

static lExternal           := .t.
static nNumBtnFam          := NUM_BTN_FAM
static nNumBtnArt          := NUM_BTN_ART
static aTipDoc             := { "Tiket", "Albar�n", "Factura", "Devoluci�n", "Apartado", "Vale", "Pda", "Cheque regalo" }
static bEditT              := { |aTmp, aGet, dbfTikT, oBrw, cTot, nTot, nMode, aNumDoc    | EdtRec( aTmp, aGet, dbfTikT, oBrw, cTot, nTot, nMode, aNumDoc ) }
static bEditB              := { |aTmp, aGet, dbfTikT, oBrw, cTot, nTot, nMode, oWnd       | EdtBig( aTmp, aGet, dbfTikT, oBrw, cTot, nTot, nMode, oWnd ) }
static bEditL              := { |aTmp, aGet, dbfTikL, oBrw, bWhen, bValid, nMode, cNumTik | EdtDet( aTmp, aGet, dbfTikL, oBrw, bWhen, bValid, nMode, cNumTik ) }
static bEditP              := { |aTmp, aGet, dbfTikP, oBrw, bWhen, bValid, nMode, aTmpTik | EdtCob( aTmp, aGet, dbfTikP, oBrw, bWhen, bValid, nMode, aTmpTik ) }
static bEditE              := { |aTmp, aGet, dbfTmpE, oBrw, bWhen, bValid, nMode, aTmpTik | EdtEnt( aTmp, aGet, dbfTmpE, oBrw, bWhen, bValid, nMode, aTmpTik ) }

static oUndMedicion

// #else

static bEdtPdaL      := { |aTmp, aGet, dbfTikL, oBrw, bWhen, bValid, nMode | EdtPdaL( aTmp, aGet, dbfTikL, oBrw, bWhen, bValid, nMode ) }
static nMesa
static nArticulo
static oSayVta
static oSayFPago
static oNumCambio
static cSayVta       :="Sala venta"
static oNumEnt
static cNumEnt       := "0"
static lFilterFav    := .f.
static oSayTik
static nEntCli
static nNumTik
static nZona
static nCurSe
static oCbxSalon
static cZona
static cAlmCtr
static dbfConfig
static nCambioCli

#endif

static dbfTikT
static dbfTikL
static dbfTikP
static dbfIva
static dbfDiv
static dbfFamilia
static dbfArticulo
static dbfTmpL
static dbfKit
static dbfTblCnv
static dbfCount
static dbfImp
static dbfComentariosT
static dbfComentariosL
static dbfAlbPrvT
static dbfAlbPrvL
static dbfFacPrvT
static dbfFacPrvL
static dbfRctPrvT
static dbfRctPrvL
static dbfFacRecT
static dbfFacRecL

static cNewFilL

static oSalaVentas

static lOpenFiles          := .f.

static cPouDiv
static cPorDiv
static nDouDiv
static nDorDiv
static cPicEur
static cPicUnd

static oTxtTot
static oNumTot
static oTxtCom
static oTotCom
static oEurTot

static oDlgTpv

static dbfFPago

static aButtonsPago

static lStopEntCont        := .f.
static lStopEntContLine    := .f.

static lShowBrwLin         := .f.

static lSaveNewTik         := .f.
static lTwoLin             := .f.

static nScreenHorzRes
static nScreenVertRes

//---------------------------------------------------------------------------//

#ifndef __PDA__

//----------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles( cPatEmp, lExt, lTactil )

   local oError
   local oBlock
   local cVisor
   local cCajon
   local cBalanza
   local cImpresora

   if lOpenFiles
      MsgStop( 'Imposible abrir ficheros de tickets de clientes' )
      Return ( .f. )
   end if

   DEFAULT cPatEmp      := cPatEmp()
   DEFAULT lExt         := .f.
   DEFAULT lTactil      := .f.

   lExternal            := lExt

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   lOpenFiles           := .t.

   if !lExistTable( cPatEmp + "TikeT.Dbf" )  .or.;
      !lExistTable( cPatEmp + "TikeL.Dbf" )  .or.;
      !lExistTable( cPatEmp + "TikeP.Dbf" )
      mkTpv()
   end if

   USE ( cPatEmp + "TIKET.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKET", @dbfTikT ) )
   SET INDEX TO ( cPatEmp + "TIKET.CDX" ) ADDITIVE

   USE ( cPatEmp + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTikL ) )
   SET INDEX TO ( cPatEmp + "TIKEL.CDX" ) ADDITIVE

   USE ( cPatEmp + "TIKEP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEP", @dbfTikP ) )
   SET INDEX TO ( cPatEmp + "TIKEP.CDX" ) ADDITIVE

   USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
   SET INDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

   USE ( cPatDat() + "Cajas.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CAJAS", @dbfCajT ) )
   SET INDEX TO ( cPatDat() + "Cajas.Cdx" ) ADDITIVE

   USE ( cPatDat() + "USERS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "USERS", @dbfUsr ) )
   SET INDEX TO ( cPatDat() + "USERS.CDX" ) ADDITIVE

   USE ( cPatArt() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) )
   SET INDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

   USE ( cPatArt() + "ArtCodebar.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CODEBAR", @dbfCodebar ) )
   SET INDEX TO ( cPatArt() + "ArtCodebar.Cdx" ) ADDITIVE

   USE ( cPatArt() + "ARTKIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTTIK", @dbfKit ) )
   SET INDEX TO ( cPatArt() + "ARTKIT.CDX" ) ADDITIVE

   USE ( cPatGrp() + "OFERTA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OFERTA", @dbfOferta ) )
   SET INDEX TO ( cPatGrp() + "OFERTA.CDX" ) ADDITIVE

   USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
   ( dbfFPago )->( ordListAdd( cPatGrp() + "FPago.Cdx" ) )

   USE ( cPatGrp() + "TBLPRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TBLPRO", @dbfTblPro ) )
   SET INDEX TO ( cPatGrp() + "TBLPRO.CDX" ) ADDITIVE

   USE ( cPatGrp() + "FAMILIAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) )
   SET INDEX TO ( cPatGrp() + "FAMILIAS.CDX" ) ADDITIVE

   USE ( cPatEmp + "ALBCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIT", @dbfAlbCliT ) )
   SET INDEX TO ( cPatEmp + "ALBCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp + "ALBCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIL", @dbfAlbCliL ) )
   SET INDEX TO ( cPatEmp + "ALBCLIL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "ALBCLIP.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "ALBCLIP", @dbfAlbCliP ) )
   SET INDEX TO ( cPatEmp() + "ALBCLIP.CDX" ) ADDITIVE

   USE ( cPatEmp + "FACCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIT", @dbfFacCliT ) )
   SET INDEX TO ( cPatEmp + "FACCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp + "FACCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIL", @dbfFacCliL ) )
   SET INDEX TO ( cPatEmp + "FACCLIL.CDX" ) ADDITIVE

   USE ( cPatEmp + "FACCLIP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIP", @dbfFacCliP ) )
   SET INDEX TO ( cPatEmp + "FACCLIP.CDX" ) ADDITIVE

   USE ( cPatEmp + "AntCliT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "AntCliT", @dbfAntCliT ) )
   SET INDEX TO ( cPatEmp + "AntCliT.CDX" ) ADDITIVE

   USE ( cPatCli() + "ObrasT.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "OBRAST", @dbfObrasT ) )
   SET INDEX TO ( cPatCli() + "ObrasT.Cdx" ) ADDITIVE

   USE ( cPatGrp() + "AGENTES.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AGENTES", @dbfAgent ) )
   SET INDEX TO ( cPatGrp() + "AGENTES.CDX" ) ADDITIVE

   USE ( cPatGrp() + "RUTA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "RUTA", @dbfRuta ) )
   SET INDEX TO ( cPatGrp() + "RUTA.CDX" ) ADDITIVE

   USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlm ) )
   SET INDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE

   USE ( cPatArt() + "ARTDIV.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTDIV", @dbfArtDiv ) )
   SET INDEX TO ( cPatArt() + "ARTDIV.CDX" ) ADDITIVE

   USE ( cPatEmp + "TARPREL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TARPREL", @dbfTarPreL ) )
   SET INDEX TO ( cPatEmp + "TARPREL.CDX" ) ADDITIVE

   USE ( cPatEmp + "TARPRES.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TARPRES", @dbfTarPreS ) )
   SET INDEX TO ( cPatEmp + "TARPRES.CDX" ) ADDITIVE

   USE ( cPatEmp + "RDOCUMEN.DBF" ) NEW SHARED VIA ( cDriver() ) ALIAS ( cCheckArea( "RDOCUMEN", @dbfDoc ) )
   SET INDEX TO ( cPatEmp + "RDOCUMEN.CDX" ) ADDITIVE
   SET TAG TO "CTIPO"

   USE ( cPatCli() + "CliAtp.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CLIATP", @dbfCliAtp ) )
   SET INDEX TO ( cPatCli() + "CliAtp.Cdx" ) ADDITIVE

   USE ( cPatEmp + "NCOUNT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "NCOUNT", @dbfCount ) )
   SET INDEX TO ( cPatEmp + "NCOUNT.CDX" ) ADDITIVE

   USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) )
   SET INDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

   USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
   SET INDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

   USE ( cPatDat() + "CAJPORTA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CAJPORTA", @dbfCajPorta ) )
   SET INDEX TO ( cPatDat() + "CAJPORTA.CDX" ) ADDITIVE

   USE ( cPatDat() + "CNFFLT.DBF" ) NEW SHARED VIA ( cDriver() ) ALIAS ( cCheckArea( "CNFFLT", @dbfFlt ) )
   SET INDEX TO ( cPatDat() + "CNFFLT.CDX" ) ADDITIVE

   USE ( cPatGrp() + "AGECOM.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "AGECOM", @dbfAgeCom ) )
   SET INDEX TO ( cPatGrp() + "AGECOM.CDX" ) ADDITIVE

   USE ( cPatDat() + "EMPRESA.DBF" ) NEW SHARED VIA ( cDriver() ) ALIAS ( cCheckArea( "EMPRESA", @dbfEmp ) )
   SET INDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE

   USE ( cPatDat() + "TBLCNV.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TBLCNV", @dbfTblCnv ) )
   SET INDEX TO ( cPatDat() + "TBLCNV.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PEDCLIT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "PEDCLIT", @dbfPedCliT ) )
   SET INDEX TO ( cPatEmp() + "PEDCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PEDCLIL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "PEDCLIL", @dbfPedCliL ) )
   SET INDEX TO ( cPatEmp() + "PEDCLIL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PEDCLIP.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "PEDCLIP", @dbfPedCliP ) )
   SET INDEX TO ( cPatEmp() + "PEDCLIP.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PRECLIT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "PRECLIT", @dbfPreCliT ) )
   SET INDEX TO ( cPatEmp() + "PRECLIT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "PRECLIL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "PRECLIL", @dbfPreCliL ) )
   SET INDEX TO ( cPatEmp() + "PRECLIL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACRECT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "FACRECT", @dbfFacRecT ) )
   SET INDEX TO ( cPatEmp() + "FACRECT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACRECL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "FACRECL", @dbfFacRecL ) )
   SET INDEX TO ( cPatEmp() + "FACRECL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbPrvT ) )
   SET INDEX TO ( cPatEmp() + "ALBPROVT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "ALBPROVL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbPrvL ) )
   SET INDEX TO ( cPatEmp() + "ALBPROVL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACPRVT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacPrvT ) )
   SET INDEX TO ( cPatEmp() + "FACPRVT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACPRVL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacPrvL ) )
   SET INDEX TO ( cPatEmp() + "FACPRVL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "RctPrvT", @dbfRctPrvT ) )
   SET INDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "RctPrvL", @dbfRctPrvL ) )
   SET INDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "HISMOV.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "HISMOV", @dbfHisMov ) )
   SET INDEX TO ( cPatEmp() + "HISMOV.CDX" ) ADDITIVE

   USE ( cPatArt() + "CATEGORIAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CATEGORIA", @dbfCategoria ) )
   SET INDEX TO ( cPatArt() + "CATEGORIAS.CDX" ) ADDITIVE

   oCaptura             := TCaptura():New( cPatDat() )
   oCaptura:OpenFiles()

   oTComandas           := TComandas():Create( cPatArt() )
   oTComandas:OpenFiles()

   oBandera             := TBandera():New()

   oStock               := TStock():Create( cPatGrp() )
   if !oStock:lOpenFiles()
      lOpenFiles        := .f.
   else
      oStock:cKit       := dbfKit

      oStock:cAlbCliT   := dbfAlbCliT
      oStock:cAlbCliL   := dbfAlbCliL
      oStock:cFacCliT   := dbfFacCliT
      oStock:cFacCliL   := dbfFacCliL
      oStock:cFacRecT   := dbfFacRecT
      oStock:cFacRecL   := dbfFacRecL
      oStock:cTikT      := dbfTikT
      oStock:cTikL      := dbfTikL

      oStock:cHisMov    := dbfHisMov

      oStock:cAlbPrvT   := dbfAlbPrvT
      oStock:cAlbPrvL   := dbfAlbPrvL
      oStock:cFacPrvT   := dbfFacPrvT
      oStock:cFacPrvL   := dbfFacPrvL
      oStock:cRctPrvT   := dbfRctPrvT
      oStock:cRctPrvL   := dbfRctPrvL
   end if

   oNewImp              := TNewImp():New( cPatEmp )
   if !oNewImp:OpenFiles()
      lOpenFiles        := .f.
   end if

   cVisor               := cVisorEnCaja( oUser():cCaja(), dbfCajT )
   if !Empty( cVisor )
      oVisor            := TVisor():Create( cVisor )
      if !Empty( oVisor )
         oVisor:Wellcome()
      end if
   end if

   cImpresora           := cImpresoraTicketEnCaja( oUser():cCaja(), dbfCajT )
   if !Empty( cImpresora )
      oImpresora        := TImpresoraTiket():Create( cImpresora )
   end if

   oUndMedicion         := UniMedicion():Create( cPatGrp() )
   if !oUndMedicion:OpenFiles()
      lOpenFiles        := .f.
   end if

   oSalaVentas          := TSalaVenta():New( cPatEmp )
   if !oSalaVentas:OpenFiles()
      lOpenFiles        := .f.
   else
      oSalaVentas:cTikT := dbfTikT
      oSalaVentas:cTikL := dbfTikL
      oSalaVentas:cDiv  := dbfDiv
      oSalaVentas:BuildSala()
   end if

   cBalanza             := cBalanzaEnCaja( oUser():cCaja(), dbfCajT )
   if !Empty( cBalanza )
      oBalanza          := TCommPort():Create( cBalanza )
   end if

   oInvitacion          := TInvitacion():Create( cPatGrp() )
   if !oInvitacion:OpenFiles()
      lOpenFiles        := .f.
   end if

   oFideliza            := TFideliza():CreateInit( cPatArt() )
   if !oFideliza:OpenFiles()
      lOpenFiles        := .f.
   end if

   /*
   Creamos los botones para las formas de pago---------------------------------
   */

   aButtonsPago        := aCreateButtons( dbfFPago )

   /*
   Pictures--------------------------------------------------------------------
   */

   cPouDiv              := cPouDiv( cDivEmp(), dbfDiv )        // Picture de la divisa
   cPorDiv              := cPorDiv( cDivEmp(), dbfDiv )        // Picture de la divisa redondeada
   cPicEur              := cPorDiv( cDivChg(), dbfDiv )        // Picture de la divisa equivalente
   nDouDiv              := nDouDiv( cDivEmp(), dbfDiv )        // .Decimales
   nDorDiv              := nRouDiv( cDivEmp(), dbfDiv )        // Decimales redondeados

   cPicUnd              := MasUnd()

   public nTotTik       := 0
   public nTotPrm       := 0
   public nTotPax       := 0
   public nTotDtoEsp    := 0
   public nTotDpp       := 0
   public nTotBrt       := 0
   public nTotNet       := 0
   public nTotIva       := 0
   public nTotIvm       := 0
   public aBrtTik       := { 0, 0, 0 }
   public aBasTik       := { 0, 0, 0 }
   public aImpTik       := { 0, 0, 0 }
   public aIvaTik       := { nil, nil, nil }
   public aIvmTik       := { 0, 0, 0 }

   nScreenHorzRes       := GetSysMetrics( 0 )
   nScreenVertRes       := GetSysMetrics( 1 )

   /*
   Limitaciones de cajero y cajas--------------------------------------------------------
   */

   if oUser():lFiltroVentas()
      cFiltroCajero    := "Field->cCcjTik == '" + oUser():cCodigo() + "' .and. Field->cNcjTik == '" + oUser():cCaja() + "'"
   end if

   RECOVER USING oError

      lOpenFiles        := .f.

      msgStop( ErrorMessage( oError ), "Imposible abrir las bases de datos de terminal punto de venta" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpenFiles
      CloseFiles()
   end if

RETURN ( lOpenFiles )

//----------------------------------------------------------------------------//

STATIC FUNCTION CloseFiles()

   DestroyFastFilter( dbfTikT, .t., .t. )

   CLOSE ( dbfTikT     )
   CLOSE ( dbfTikL     )
   CLOSE ( dbfTikP     )
   CLOSE ( dbfClient   )
   CLOSE ( dbfCajT     )
   CLOSE ( dbfUsr      )
   CLOSE ( dbfFPago    )
	CLOSE ( dbfArticulo )
   CLOSE ( dbfCodebar  )
   CLOSE ( dbfKit      )
   CLOSE ( dbfCount    )
   CLOSE ( dbfIva      )
   CLOSE ( dbfOferta   )
   CLOSE ( dbfDiv      )
   CLOSE ( dbfTblPro   )
   CLOSE ( dbfFamilia  )
   CLOSE ( dbfCategoria)

   CLOSE ( dbfObrasT   )
   CLOSE ( dbfAgent    )
   CLOSE ( dbfTarPreL  )
   CLOSE ( dbfTarPreS  )
   CLOSE ( dbfRuta     )
   CLOSE ( dbfAlm      )
   CLOSE ( dbfArtDiv   )
   CLOSE ( dbfDoc      )
   CLOSE ( dbfCliAtp   )
   CLOSE ( dbfCajPorta )
   CLOSE ( dbfFlt      )
   CLOSE ( dbfAgeCom   )
   CLOSE ( dbfEmp      )
   CLOSE ( dbfAlbCliP  )
   CLOSE ( dbfTblCnv   )

   CLOSE ( dbfPreCliT  )
   CLOSE ( dbfPreCliL  )
   CLOSE ( dbfPedCliT  )
   CLOSE ( dbfPedCliL  )
   CLOSE ( dbfPedCliP  )
   CLOSE ( dbfAlbCliT  )
   CLOSE ( dbfAlbCliL  )
   CLOSE ( dbfFacCliT  )
   CLOSE ( dbfFacCliL  )
   CLOSE ( dbfFacCliP  )
   CLOSE ( dbfFacRecT  )
   CLOSE ( dbfFacRecL  )

   CLOSE ( dbfAntCliT  )

   CLOSE ( dbfAlbPrvT  )
   CLOSE ( dbfAlbPrvL  )
   CLOSE ( dbfFacPrvT  )
   CLOSE ( dbfFacPrvL  )
   CLOSE ( dbfRctPrvT  )
   CLOSE ( dbfRctPrvL  )

   CLOSE ( dbfHisMov   )

   if !Empty( oCaptura )
      oCaptura:End()
   end if

   if !Empty( oTComandas )
      oTComandas:End()
   end if

   if !Empty( oStock )
      oStock:end()
   end if

   if !Empty( oNewImp )
      oNewImp:End()
   end if

   if !Empty( oVisor )
      oVisor:End()
   end if

   if !Empty( oImpresora )
      oImpresora:End()
   end if

   if !Empty( oBalanza )
      oBalanza:End()
   end if

   if !Empty( oUndMedicion )
      oUndMedicion:end()
   end if

   if !Empty( oSalaVentas )
      oSalaVentas:End()
   end if

   if !Empty( oInvitacion )
      oInvitacion:End()
   end if

   if !Empty( oFideliza )
      oFideliza:End()
   end if

   dbfTikT     := nil
   dbfTikL     := nil
   dbfClient   := nil
   dbfCajT     := nil
   dbfUsr      := nil
   dbfFPago    := nil
   dbfArticulo := nil
   dbfCodebar  := nil
   dbfKit      := nil
   dbfIva      := nil
   dbfCount    := nil
   dbfOferta   := nil
   dbfDiv      := nil
   oBandera    := nil
   dbfTarPreS  := nil
   dbfTarPreL  := nil
   dbfTblPro   := nil
   dbfFamilia  := nil
   dbfAlbCliT  := nil
   dbfAlbCliL  := nil
   dbfFacCliT  := nil
   dbfFacCliL  := nil
   dbfFacCliP  := nil
   dbfObrasT   := nil
   dbfAgent    := nil
   dbfRuta     := nil
   dbfAlm      := nil
   dbfArtDiv   := nil
   dbfDoc      := nil
   dbfCliAtp   := nil
   dbfFlt      := nil
   dbfAgeCom   := nil
   dbfEmp      := nil
   dbfAlbCliP  := nil
   dbfTblCnv   := nil

   dbfPreCliT  := nil
   dbfPreCliL  := nil
   dbfPedCliT  := nil
   dbfPedCliL  := nil
   dbfPedCliP  := nil
   dbfFacRecT  := nil
   dbfFacRecL  := nil

   dbfAlbPrvT  := nil
   dbfAlbPrvL  := nil
   dbfFacPrvT  := nil
   dbfFacPrvL  := nil
   dbfRctPrvT  := nil
   dbfRctPrvL  := nil

   dbfHisMov   := nil

   oStock      := nil
   oCaptura    := nil
   oTComandas  := nil
   oNewImp     := nil
   oVisor      := nil
   oImpresora  := nil
   oSalaVentas := nil
   oInvitacion := nil

   oFideliza   := nil

   oWndBrw     := nil
   oWndBig     := nil

   lOpenFiles  := .f.

   oOfficeBar  := nil

   if lTactilMode() .or. lTpvMode()
      PostQuitMessage()
   end if

Return .t.

//----------------------------------------------------------------------------//

FUNCTION FrontTpv( oMenuItem, oWnd, cCodCli, cCodArt, lEntCon, lExtTpv, aNumDoc )

   local oBtnEur
   local cTitle
   local oSnd
   local oRpl
   local oFlt
   local lEur           := .f.
   local oPrv
   local oImp
   local oDel
   local oRotor

   DEFAULT  oMenuItem   := _MENUITEM_
   DEFAULT  oWnd        := oWnd()
   DEFAULT  lEntCon     := lEntCon()
   DEFAULT  lExtTpv     := .f.
   DEFAULT  aNumDoc     := { "", "", "" }

   nLevel               := nLevelUsr( oMenuItem )
   if nAnd( nLevel, 1 ) != 0
      msgStop( "Acceso no permitido." )
      return .f.
   end if

   /*
   Cerramos todas las ventanas
   */

   if oWnd != nil
      SysRefresh(); oWnd:CloseAll(); SysRefresh()
   end if

   if !OpenFiles()
      return .f.
   end if

   /*
   Compruebo si hay turnos abiertos
   */

   cTitle      := "T.P.V. - Sesi�n : " + Trans( cCurSesion(), "######" ) + " - " + dtoc( date() )

   /*
   Anotamos el movimiento para el navegador
   */

   AddMnuNext( "T.P.V.", ProcName() )

if !lExtTpv

   DEFINE SHELL oWndBrw FROM 0, 0 TO 22, 80 ;
      XBROWSE ;
      TITLE    cTitle ;
      PROMPTS  "N�mero",;
					"Fecha",;
               "Caja",;
               "Cajero",;
               "C�digo",;
               "Nombre",;
               "Sesi�n" ;
      MRU      "Cashier_user1_16";
      BITMAP   "WebTopRed" ;
      ALIAS    ( dbfTikT );
      APPEND   ( TpvAppRec( oWndBrw:oBrw, bEditT, dbfTikT, oWnd, cCodCli, cCodArt, aNumDoc ) );
      DELETE   ( DelTpv( oWndBrw:oBrw, dbfTikT ) );
      ZOOM     ( WinZooRec( oWndBrw:oBrw, bEditT, dbfTikT ) );
      EDIT     ( WinEdtRec( oWndBrw:oBrw, bEditT, dbfTikT ) );
      LEVEL    nLevel ;
      OF       oWnd

else

   DEFINE SHELL oWndBrw FROM 0, 0 TO 22, 80 ;
      XBROWSE ;
      TITLE    cTitle ;
      PROMPTS  "N�mero",;
					"Fecha",;
               "Caja",;
               "Cajero",;
               "C�digo",;
               "Nombre",;
               "Sesi�n" ;
      ALIAS    ( dbfTikT );
      APPEND   ( TpvAppRec( oWndBrw:oBrw, bEditT, dbfTikT, oWnd, cCodCli, cCodArt, aNumDoc ) );
      DELETE   ( DelTpv( oWndBrw:oBrw, dbfTikT ) );
      ZOOM     ( WinZooRec( oWndBrw:oBrw, bEditT, dbfTikT ) );
      EDIT     ( WinEdtRec( oWndBrw:oBrw, bEditT, dbfTikT ) );
      LEVEL    nLevel ;
      BIGSTYLE ;
      OF       oWnd

end if

     oWndBrw:lAutoSeek     := .f.

     oWndBrw:lFechado      := .t.

     oWndBrw:bChgIndex     := {|| if( oUser():lFiltroVentas(), CreateFastFilter( cFiltroCajero, dbfTikT, .f., , cFiltroCajero ), CreateFastFilter( "", dbfTikT, .f. ) ) }

	  oWndBrw:SetYearComboBoxChange( {|| YearComboBoxChange() } )

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n cerrada"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfTikT )->lCloTik }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Zoom16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Cobrado"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| nChkalizer( ( dbfTikT)->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, if( lEur, cDivChg(), cDivEmp() ) ) }
         :nWidth           := 20
         :AddResource( "Bullet_Square_Green_16" )
         :AddResource( "Bullet_Square_Yellow_16" )
         :AddResource( "Bullet_Square_Red_16" )
         :AddResource( "ChgPre16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Contabilizado"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfTikT )->lConTik }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "BmpConta16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Envio"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfTikT )->lSndDoc }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Lbl16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Documento"
         :bEditValue       := {|| aTipTik() }
         :nWidth           := 60
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "N�mero"
         :cSortOrder       := "cNumTik"
         :bEditValue       := {|| ( dbfTikT )->cSerTik + "/" + lTrim( ( dbfTikT )->cNumTik ) + "/" + ( dbfTikT )->cSufTik }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Delegaci�n"
         :bEditValue       := {|| ( dbfTikT )->cCodDlg }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n"
         :cSortOrder       := "cTurTik"
         :bEditValue       := {|| Trans( ( dbfTikT )->cTurTik, "######" ) }
         :nWidth           := 40
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Fecha"
         :cSortOrder       := "dFecTik"
         :bEditValue       := {|| dtoc( ( dbfTikT )->dFecTik ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Hora"
         :bEditValue       := {|| ( dbfTikT )->cHorTik }
         :nWidth           := 40
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Caja"
         :cSortOrder       := "cNcjTik"
         :bEditValue       := {|| ( dbfTikT )->cNcjTik }
         :nWidth           := 40
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Cajero"
         :cSortOrder       := "cCcjTik"
         :bEditValue       := {|| ( dbfTikT )->cCcjTik }
         :nWidth           := 40
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCliTik"
         :bEditValue       := {|| AllTrim( ( dbfTikT )->cCliTik ) }
         :nWidth           := 70
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cNomTik"
         :bEditValue       := {|| AllTrim( ( dbfTikT )->cNomTik ) }
         :nWidth           := 180
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Almac�n"
         :bEditValue       := {|| ( dbfTikT )->cAlmTik }
         :nWidth           := 60
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Base"
         :bEditValue       := {|| ( dbfTikT )->nTotNet }
         :cEditPicture     := cPorDiv( ( dbfTikT )->cDivTik, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "I.V.A."
         :bEditValue       := {|| ( dbfTikT )->nTotIva }
         :cEditPicture     := cPorDiv( ( dbfTikT )->cDivTik, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Total"
         :bEditValue       := {|| ( dbfTikT )->nTotTik }
         :cEditPicture     := cPorDiv( ( dbfTikT )->cDivTik, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Cobrado"
         :bEditValue       := {|| nCobalizer( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Vales"
         :bEditValue       := {|| nTotValTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Anticipos"
         :bEditValue       := {|| nTotAntFacCli( ( dbfTikT )->cNumDoc, dbfAntCliT, dbfIva, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Diferencias"
         :bEditValue       := {|| nDifalizer( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfIva, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( if( lEur, cDivChg(), ( dbfTikT )->cDivTik ), dbfDiv ) }
         :nWidth           := 30
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Documento"
         :bEditValue       := {|| ( dbfTikT )->cNumDoc }
         :nWidth           := 120
         :lHide            := .t.
      end with

   oWndBrw:CreateXFromCode()

if !lExtTpv

    DEFINE BTNSHELL RESOURCE "BUS" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:SearchSetFocus() ) ;
      TOOLTIP  "(B)uscar" ;
      BEGIN GROUP ;
      HOTKEY   "B"

   oWndBrw:AddSeaBar()

end if

   DEFINE BTNSHELL RESOURCE "NEW" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecAdd() );
      TOOLTIP  "(A)�adir";
      HOTKEY   "A";
      BEGIN GROUP ;
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

if !lExtTpv

      DEFINE BTNSHELL RESOURCE "DEL" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( LqdVale( oWndBrw ) );
         TOOLTIP  "Liquidar vale" ;
         FROM     oDel ;
         CLOSED ;
         LEVEL    ACC_DELE

end if

   DEFINE BTNSHELL oPrv RESOURCE "IMP" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( ImpTiket( .f., .f., .t. ) ) ;
      TOOLTIP  "(I)mprimir";
      MESSAGE  "Imprimir tiket" ;
      HOTKEY   "I";
      LEVEL    ACC_IMPR

      DEFINE BTNSHELL RESOURCE "IMP" GROUP OF oWndBrw ;
         NOBORDER ;
         ACTION   ( ImpresionComanda( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik ,,.t. ) ) ;
         TOOLTIP  "Imprimir comanda";
         MESSAGE  "Imprimir comanda" ;
         FROM     oPrv ;
         CLOSED ;
         LEVEL    ACC_IMPR

if lExtTpv

   DEFINE BTNSHELL RESOURCE "UP" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:oBrw:GoUp(), oWndBrw:oBrw:Select(0), oWndBrw:oBrw:Select(1), oWndBrw:oBrw:Refresh() ) ;
      TOOLTIP  "S(u)bir" ;
      HOTKEY   "U"

   DEFINE BTNSHELL RESOURCE "DOWN" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:oBrw:GoDown(), oWndBrw:oBrw:Select(0), oWndBrw:oBrw:Select(1), oWndBrw:oBrw:Refresh() ) ;
      TOOLTIP  "(B)ajar" ;
      HOTKEY   "B"

else

   DEFINE BTNSHELL RESOURCE "SERIE1" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( DlgPrnTicket( oWndBrw:oBrw ) ) ;
      TOOLTIP  "Imp(r)imir series";
      HOTKEY   "R";
      LEVEL    ACC_IMPR

   DEFINE BTNSHELL oImp RESOURCE "PREV1" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( ImpTiket( .t. ) ) ;
      TOOLTIP  "(P)revisualizar";
      MESSAGE  "Previsualizar tiket" ;
      HOTKEY   "P";
      LEVEL    ACC_IMPR

   DEFINE BTNSHELL RESOURCE "NEW" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( WinDupRec( oWndBrw:oBrw, bEditT, dbfTikT ) );
      TOOLTIP  "Ti(k)et a factura";
      HOTKEY   "K";
      LEVEL    ACC_APPD

   if oUser():lAdministrador()

      DEFINE BTNSHELL RESOURCE "CHGSTATE" OF oWndBrw GROUP;
         NOBORDER ;
         ACTION   ContTpv( dbfTikT, oWndBrw:oBrw );
         TOOLTIP  "Cambiar esta(d)o" ;
         HOTKEY   "D";
         LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL RESOURCE "BMPCONTA" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( DlgCntTicket( dbfTikT, dbfTikL, dbfTikP, dbfClient, dbfArticulo, dbfFPago, dbfDiv, oWndBrw ) );
      TOOLTIP  "Co(n)tabilizar" ;
      HOTKEY   "N";
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL oSnd RESOURCE "LBL" OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   lSnd( oWndBrw, dbfTikT ) ;
      TOOLTIP  "En(v)iar" ;
      HOTKEY   "V";
      LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "LBL" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( lSelectAll( oWndBrw, dbfTikT, "lSndDoc", .t., .t., .t. ) );
         TOOLTIP  "Todos" ;
         FROM     oSnd ;
         CLOSED ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "LBL" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( lSelectAll( oWndBrw, dbfTikT, "lSndDoc", .f., .t., .t. ) );
         TOOLTIP  "Ninguno" ;
         FROM     oSnd ;
         CLOSED ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "LBL" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( lSelectAll( oWndBrw, dbfTikT, "lSndDoc", .t., .f., .t. ) );
         TOOLTIP  "Abajo" ;
         FROM     oSnd ;
         CLOSED ;
         LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "CHGPRE" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( EdtCobTik( oWndBrw ) );
      TOOLTIP  "(C)obros";
      HOTKEY   "C";
      LEVEL    ACC_APPD

   DEFINE BTNSHELL oBtnEur RESOURCE "BAL_EURO" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( lEur := !lEur, oWndBrw:Refresh() ) ;
      TOOLTIP  "M(o)neda";
      HOTKEY   "O";

if !oUser():lFiltroVentas()

   DEFINE BTNSHELL oFlt RESOURCE "BFILTER" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( TDlgFlt():New( aItmTik(), dbfTikT, oFlt, .t., oWndBrw ):Resource( TIK_CLI, nil, dbfFlt ) );
      TOOLTIP  "(F)iltrar" ;
      HOTKEY   "F";
      LEVEL    ACC_APPD

   lLoadFiltro( TIK_CLI, aItmTik(), oFlt, oWndBrw, dbfFlt, dbfTikT )

end if

   if oUser():lAdministrador()

      DEFINE BTNSHELL oRpl RESOURCE "BMPCHG" GROUP OF oWndBrw ;
         NOBORDER ;
         MENU     This:Toggle() ;
         ACTION   ( TDlgFlt():New( aItmTik(), dbfTikT ):ChgFields(), oWndBrw:Refresh() ) ;
         TOOLTIP  "Cambiar campos" ;
         LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "BMPCHG" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( TDlgFlt():New( aColTik(), dbfTikL ):ChgFields(), oWndBrw:Refresh() ) ;
            TOOLTIP  "Lineas" ;
            FROM     oRpl ;
            CLOSED ;
            LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL oRotor RESOURCE "ROTOR" GROUP OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( oRotor:Expand() ) ;
      TOOLTIP  "Rotor" ;

      DEFINE BTNSHELL RESOURCE "DOCUMENT" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( Tik2AlbFac( ( dbfTikT )->cTipTik, ( dbfTikT )->cNumDoc ) );
         TOOLTIP  "Visualizar documento" ;
         FROM     oRotor ;
         CLOSED ;

      DEFINE BTNSHELL RESOURCE "USER1_" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( EdtCli( ( dbfTikT )->cCliTik ) );
         TOOLTIP  "Modificar cliente" ;
         FROM     oRotor ;
         CLOSED ;

      DEFINE BTNSHELL RESOURCE "INFO" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( InfCliente( ( dbfTikT )->cCliTik ) );
         TOOLTIP  "Informe cliente" ;
         FROM     oRotor ;
         CLOSED ;

      DEFINE BTNSHELL RESOURCE "WORKER" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( EdtObras( ( dbfTikT )->cCliTik, ( dbfTikT )->cCodObr, dbfObrasT ) );
         TOOLTIP  "Modificar obras" ;
         FROM     oRotor ;
         CLOSED ;

      DEFINE BTNSHELL RESOURCE "DOCUMENT_USER1_" OF oWndBrw ;
         ALLOW    EXIT ;
         ACTION   ( lFacturaAlbaran() ) ;
         TOOLTIP  "Generar factura" ;
         FROM     oRotor ;

   DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( ( cFiltroCajero := "" ), oWndBrw:End() ) ;
      TOOLTIP  "(S)alir";
      HOTKEY   "S"

end if

   ACTIVATE SHELL oWndBrw VALID ( CloseFiles() )

   if !Empty( cCodCli ) .or. !Empty( cCodArt ) .or. lEntCon .or. !Empty( aNumDoc )
      oWndBrw:RecAdd()
      cCodCli  := nil
      cCodArt  := nil
      aNumDoc  := { "", "", "" }
   end if

Return .t.

//----------------------------------------------------------------------------//

Static Function TpvAppRec( oWndBrw, bEditT, dbfTikT, oWnd, cCodCli, cCodArt, aNumDoc )

   while ( WinAppRec( oWndBrw, bEditT, dbfTikT, cCodCli, cCodArt, aNumDoc ) )

      if lStopEntCont

         Return ( .t. )

      end if

   end while

   ( dbfTikT )->( dbGoBottom() )

   oWndBrw:Select( 0 )
   oWndBrw:Select( 1 )

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function ImpTiket( lPrev, lEntrega, lImpMenu, dbfImp, oDatos )

   local oPrnTik
   local nCopClient
   local nNumTik

   DEFAULT lPrev        := .f.
   DEFAULT lEntrega     := .f.
   DEFAULT lImpMenu     := .f.

   if Empty( oDatos )
      oDatos            := TDatosImpresion():Load( dbfCajT )
   end if

   nCopClient           := Max( Retfld( ( dbfTikT )->cCliTik, dbfClient, "CopiasF" ), 1 )

   /*
   Obtenemos el numero de copias que vamos a imprimir
   ----------------------------------------------------------------------------
   */

   if lPrev

      nCopTik           := 1

   else

      if lCopTik

         nCopTik        := nCopiasTipoTicket( ( dbfTikT )->cTipTik, lEntrega, dbfCajT )

         if lImpMenu .and. nCopTik == 0
            nCopTik     := 1
         end if

      end if

   end if

   /*
   Llamamos a la funcion de impresion en cada uno de los casos
   ----------------------------------------------------------------------------
   */

   do case
      case ( dbfTikT )->cTipTik == SAVTIK

         do case
            case ( lRegalo == .t. )

               nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo tickets", oDatos:cFmtTikReg, oDatos:cPrinterTikReg )

               lRegalo  := .f.

            case ( lEntrega == .t. )

               nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo tickets", oDatos:cFmtTikEnt, oDatos:cPrinterTikEnt )

            otherwise

               nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo tickets", oDatos:cFmtTik, oDatos:cPrinterTik )

         end case

      case ( dbfTikT )->cTipTik == SAVAPT

         nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo apartados", oDatos:cFmtApt, oDatos:cPrinterApt )

      case ( dbfTikT )->cTipTik == SAVVAL

         if ( dbfTikT )->lFreTik

            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo cheques regalo", oDatos:cFmtTikChk, oDatos:cPrinterTikChk )

         else

            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo vales", oDatos:cFmtVal, oDatos:cPrinterTikChk )

         end if

      case ( dbfTikT )->cTipTik == SAVDEV

         nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo devoluciones", oDatos:cFmtTikDev, oDatos:cPrinterDev )

      case ( dbfTikT )->cTipTik == SAVALB

         if lImpAlbaranesEnImpresora( ( dbfTikT )->cNcjTik, dbfCajT )

            if lPrev
               VisAlbCli( ( dbfTikT )->cNumDoc, .f., "Imprimiendo albaranes", oDatos:cFmtAlbCaj, oDatos:cPrinterAlbCaj )
            else
               PrnAlbCli( ( dbfTikT )->cNumDoc, .f., "Imprimiendo albaranes", oDatos:cFmtAlbCaj, oDatos:cPrinterAlbCaj )
            end if

         else
            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo albaranes", oDatos:cFmtAlb, oDatos:cPrinterAlb )
         end if

      case ( dbfTikT )->cTipTik == SAVFAC

         if lImpFacturasEnImpresora( ( dbfTikT )->cNcjTik, dbfCajT )

            if lPrev
               VisFacCli( ( dbfTikT )->cNumDoc, .f., "Imprimiendo facturas", oDatos:cFmtFacCaj, oDatos:cPrinterFacCaj )
            else
               PrnFacCli( ( dbfTikT )->cNumDoc, .f., "Imprimiendo facturas", oDatos:cFmtFacCaj, oDatos:cPrinterFacCaj )
            end if

         else
            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo facturas", oDatos:cFmtFac, oDatos:cPrinterFac )
         end if

      case ( dbfTikT )->cTipTik == SAVPDA

         if lEntrega
            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo tickets", oDatos:cFmtEntCaj, oDatos:cPrinterEntCaj )
         else
            nGenTikCli( if( lPrev, IS_SCREEN, IS_PRINTER ), "Imprimiendo tickets", oDatos:cFmtTik, oDatos:cPrinterTik )
         end if

   end case

   /*
   Cambio el estado a imprimido para que el ticket no se vuelva a imprimir-----
   */

   if !Empty( dbfImp )

      nNumTik  := ( dbfImp )->cSerTik + ( dbfImp )->cNumTik + ( dbfImp )->cSufTik

      if dbSeekInOrd( nNumTik, "cComanda", dbfImp )

         if dbLock( dbfImp )
            ( dbfImp )->lImp        := .t.
            ( dbfImp )->dFTikImp    := GetSysDate()
            ( dbfImp )->cHTikImp    := Substr( Time(), 1, 5 )
            ( dbfImp )->( dbUnLock() )
         end if

      end if

   end if

   if !Empty( oWndBrw )
      oWndBrw:Refresh()
   end if

Return nil

//----------------------------------------------------------------------------//

Static Function TpvEdtRec( oWndBrw, bEdit, dbfTikT, oWnd )

   pdaLockSemaphore( dbfTikT )

   WinEdtRec( oWndBrw, bEdit, dbfTikT, , , oWnd )

   pdaUnLockSemaphore( dbfTikT )

   oWndBrw:Select( 0 )
   oWndBrw:Select( 1 )

Return ( .t. )

//----------------------------------------------------------------------------//
//
// Borra tickets
//
FUNCTION DelTpv( oBrw, dbfTikCliT, lMessage )

   local nOrdAlb

   DEFAULT lMessage     := .t.

   /*
   Cambiamos el estado del albar�n del que proviene----------------------------
   */

   if !Empty( ( dbfTikCliT )->cAlbTik )

      if dbSeekInOrd( ( dbfTikCliT )->cAlbTik, "nNumAlb", dbfAlbCliT )

         if dbLock( dbfAlbCliT )

            ( dbfAlbCliT )->lFacturado    := .f.
            ( dbfAlbCliT )->cNumTik       := Space(13)
            ( dbfAlbCliT )->( dbUnLock() )

         end if

      end if

      nOrdAlb  := ( dbfAlbCliL )->( OrdSetFocus( "nNumAlb" ) )

      if ( dbfAlbCliL )->( dbSeek( ( dbfTikCliT )->cAlbTik ) )

         while ( dbfAlbCliL )->cSerAlb + Str( ( dbfAlbCliL )->nNumAlb ) + ( dbfAlbCliL )->cSufAlb == ( dbfTikCliT )->cAlbTik .and. !( dbfAlbCliL )->( Eof() )

            if dbLock( dbfAlbCliL )

               ( dbfAlbCliL )->lFacturado    := .f.
               ( dbfAlbCliL )->( dbUnLock() )

            end if


         ( dbfAlbCliL )->( dbSkip() )

         end while

      end if

      ( dbfAlbCliL )->( OrdSetFocus( nOrdAlb ) )

   end if

   /*
   Cambiamos el estado del pedido del que proviene----------------------------
   */

   if !Empty( ( dbfTikCliT )->cPedTik )

      if dbSeekInOrd( ( dbfTikCliT )->cPedTik, "nNumPed", dbfPedCliT )

         if dbLock( dbfPedCliT )

            ( dbfPedCliT )->nEstado       := 1
            ( dbfPedCliT )->cNumTik       := Space(13)

            ( dbfPedCliT )->( dbUnLock() )

         end if

      end if

      if dbSeekInOrd( ( dbfTikCliT )->cPedTik, "nNumPed", dbfPedCliP )

         while ( dbfPedCliP )->cSerPed + Str( ( dbfPedCliP )->nNumPed ) + ( dbfPedCliP )->cSufPed == ( dbfTikCliT )->cPedTik .and. !( dbfPedCliP )->( eof() )

            if dbLock( dbfPedCliP )
               ( dbfPedCliP )->lPasado    := .f.
               ( dbfPedCliT )->( dbUnLock() )
            end if

            ( dbfPedCliP )->( dbSkip() )

         end while

      end if

   end if

   /*
   Cambiamos el estado del presupuestos del que proviene----------------------------
   */

   if !Empty( ( dbfTikCliT )->cPreTik )

      if dbSeekInOrd( ( dbfTikCliT )->cPreTik, "nNumPre", dbfPreCliT )

         if dbLock( dbfPreCliT )

            ( dbfPreCliT )->lEstado       := .f.
            ( dbfPreCliT )->cNumTik       := Space(13)
            ( dbfPreCliT )->( dbUnLock() )

         end if

      end if

   end if

   WinDelRec( oBrw, dbfTikCliT, TpvDelRec() )

Return ( .t. )

//---------------------------------------------------------------------------//

FUNCTION TpvDelRec()

   local cCodAlm
   local nRecAnt
   local nOrdAnt
   local cCodCli     := ( dbfTikT )->cCliTik
   local cNumTik     := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik
   local cTipDoc     := ( dbfTikT )->cTipTik
   local cNumDoc     := ( dbfTikT )->cNumDoc
   local nTotTik     := nTotTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, nil, nil, .f. )

   /*
   Si el tiket no esta cerrado-------------------------------------------------
   */

   /*if ( dbfTikT )->lCloTik .and. !oUser():lAdministrador()
      if lMessage
         msgStop( "No se pueden eliminar tickets cerrados." )
      end if
      return .t.
   end if*/

   /*
   Eliminar los registros------------------------------------------------------
   */

   //if !lQuestion .or. oUser():lNotConfirmDelete() .or. MsgNoYes( "�Desea eliminar definitivamente este registro?", "Confirme supersi�n" )

      //CursorWait()

      //DelRecno( dbfTikT )

      //oStock:TpvCli( cNumTik, ( dbfTikT )->cAlmTik, .t., cTipDoc == SAVVAL .or. cTipDoc == SAVDEV )

      /*
      Eliminamos las lineas----------------------------------------------------
      */

      while ( dbfTikL )->( dbSeek( cNumTik ) )
         if dbLock( dbfTikL )
            ( dbfTikL )->( dbDelete() )
            ( dbfTikL )->( dbUnLock() )
         end if
      end while

      /*
      Borramos los pagos-------------------------------------------------------
      */

      while ( dbfTikP )->( dbSeek( cNumTik ) )
         // AddRiesgo( nTotUCobTik( dbfTikP ), cCodCli, dbfClient )
         if dbLock( dbfTikP )
            ( dbfTikP )->( dbDelete() )
            ( dbfTikP )->( dbUnLock() )
         end if
      end while

      /*
      Eliminamos los vales-----------------------------------------------------
      */

      nRecAnt     := ( dbfTikT )->( Recno() )
      nOrdAnt     := ( dbfTikT )->( OrdSetFocus( "cDocVal" ) )

      if ( dbfTikT )->( dbSeek( cNumTik ) )
         while ( dbfTikT )->cValDoc == cNumTik .and. !( dbfTikT )->( eof() )
            if dbLock( dbfTikT )
               ( dbfTikT )->lLiqTik := .f.
               ( dbfTikT )->lSndDoc := .t.
               ( dbfTikT )->cTurVal := ""
               ( dbfTikT )->cValDoc := ""
               ( dbfTikT )->( dbUnLock() )
            end if
            ( dbfTikT )->( dbSkip() )
         end while
      end if

      /*
      Reposicionamiento--------------------------------------------------------
      */

      ( dbfTikT )->( dbGoTo( nRecAnt ) )
      ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )

      /*
      Borramos el doc. asociados-----------------------------------------------
      */

      if !Empty( cNumDoc )

         /*
         Localizamos el documento segun su tipo
         */

         do case
         case cTipDoc == SAVALB

            if ( dbfAlbCliT )->( dbSeek( cNumDoc ) )

               cCodAlm  := ( dbfAlbCliT )->cCodAlm
               cNumDoc  := ( dbfAlbCliT )->cSerAlb + Str( ( dbfAlbCliT )->nNumAlb ) + ( dbfAlbCliT )->cSufAlb

               /*
               Eliminamos el albaran-------------------------------------------
               */

               oStock:AlbCli( cNumDoc, cCodAlm, .t., .t., .t. )
               delRecno( dbfAlbCliT )

            end if

         case cTipDoc == SAVFAC

            if ( dbfFacCliT )->( dbSeek( cNumDoc ) )

               cCodAlm  := ( dbfFacCliT )->cCodAlm
               cNumDoc  := ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac

               /*
               Eliminamos la factura
               */

               delRecno( dbfFacCliT )
               oStock:FacCli( cNumDoc, cCodAlm, .t., .t., nil, .t. )

               /*
               Eliminamos los recibos
               */

               while ( dbfFacCliP )->( dbSeek( cNumDoc ) ) .and. !( dbfFacCliP )->( eof() )

                  if dbLock( dbfFacCliP )
                     ( dbfFacCliP )->( dbDelete() )
                     ( dbfFacCliP )->( dbUnLock() )
                  end if

                  ( dbfFacCliP )->( dbSkip() )
               end do

               /*
               Devolvemos los anticipos a su estado anterior-------------------------
               */

               nOrdAnt     := ( dbfAntCliT )->( OrdSetFocus( "cNumDoc" ) )

               if ( dbfAntCliT )->( dbSeek( cNumDoc ) )
                  while ( dbfAntCliT )->cNumDoc == cNumDoc .and. !( dbfAntCliT )->( eof() )
                     if dbLock( dbfAntCliT )
                        ( dbfAntCliT )->lLiquidada := .f.
                        ( dbfAntCliT )->( dbUnLock() )
                     end if

                     ( dbfAntCliT )->( dbSkip() )
                  end while
               end if

               ( dbfAntCliT )->( OrdSetFocus( nOrdAnt ) )

            end if

         end case

      end if

      //CursorWe()

   //end if

   //oBrw:SetFocus()

RETURN .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION EdtRec( aTmp, aGet, dbfTikT, oBrw, cCodCli, cCodArt, nMode, aNumDoc )

   local nOrd
   local oBmpDiv
   local cTitDoc
   local nRieCli           := 0

   aGetTxt                 := Array( 10 )
   oGetTxt                 := Array( 10 )

   nCopTik                 := nCopiasTicketsEnCaja( oUser():cCaja(), dbfCajT )
   lCopTik                 := .t.

   if ( nMode == EDIT_MODE ) .and. ( ( aTmp[ _CTIPTIK ] == SAVDEV ) .or. ( aTmp[ _CTIPTIK ] == SAVVAL ) )
      MsgStop( "No se pueden modificar vales, devoluciones o cheques regalos." )
      return .f.
   end if

   if ( nMode == APPD_MODE .or. nMode == DUPL_MODE ) .and. !lCurSesion()
      MsgStop( "No hay sesiones activas, imposible a�adir documentos" )
      return .f.
   end if

   if nMode == APPD_MODE .and. !Empty( cCodCli )
      aTmp[ _CCLITIK ]     := cCodCli
   end if

   if nMode == APPD_MODE

      if !uFieldEmpresa( "lGetFpg" )
         aTmp[ _CFPGTIK ]  := cDefFpg()
      else
         aTmp[ _CFPGTIK ]  := Space( 2 )
      end if

   end if

   /*
   Tarifa de venta del ticket--------------------------------------------------
   */

   if Empty( aTmp[ _NTARIFA ] )
      aTmp[ _NTARIFA ]     := Max( uFieldEmpresa( "nPreVta" ), 1 )
   end if

   /*
   De ticket a factura---------------------------------------------------------
   */

   if nMode == DUPL_MODE
      cTitDoc              := "Ticket a factura"
   else
      cTitDoc              := LblTitle( nMode ) + aTipTik( aTmp ) + " a clientes"
   end if

   /*
   Tiket a factura----------------------------------------------------------
   */

   if aTmp[ _CTIPTIK ] != SAVTIK .and. nMode == DUPL_MODE
      msgStop( 'Solo se puede pasar a factura los tickets.' )
      return .f.
   end if

   if aTmp[ _LCNVTIK ] .and. nMode == DUPL_MODE
      MsgStop( 'Este ticket ya ha sido convertido a factura.' )
      return .f.
   end if

   /*
   Comprobamos que la caja este abierta----------------------------------------
   */

   if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lMaster()
      msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
      Return .f.
   end if

   /*
   Valores por defecto---------------------------------------------------------
   */

   cCapCaj                 := cCapturaCaja( oUser():cCaja(), dbfCajT )

   if Empty( aTmp[ _CTLFCLI ] )
      aTmp[ _CTLFCLI ]     := RetFld( aTmp[ _CCLITIK ], dbfClient, "Telefono" )
   end if

   /*
   Creamos las fuentes---------------------------------------------------------
   */

   oFntTot                 := TFont():New( FONT_NAME, 14, 54, .f., .t. )
   oFntEur                 := TFont():New( FONT_NAME,  8, 34, .f., .t. )

   /*
   Orden actual----------------------------------------------------------------
   */

   nOrd                 := ( dbfTikT )->( ordSetFocus( 1 ) )

   /*
   Comenzamos las transacciones------------------------------------------------
   */

   if BeginTrans( aTmp, aGet, nMode, .t. )
      Return .f.
   end if

   /*
   Caja de dialogo-------------------------------------------------------------
   */

   DEFINE DIALOG  oDlgTpv RESOURCE "TPVFRONT" TITLE cTitDoc

		/*
		Cliente_________________________________________________________________
		*/

		REDEFINE GET aGet[ _CCLITIK ] VAR aTmp[ _CCLITIK ];
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( loaCli( aGet, aTmp, nMode, oGetTxt[ 9 ] ) );
         PICTURE  "@!" ;
         ID       190 ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwClient( aGet[ _CCLITIK ], aGet[ _CNOMTIK ] ), ::lValid() );
         OF       oDlgTpv

      /*REDEFINE GET oGetTxt[ 9 ] VAR aGetTxt[ 9 ];
         ID       106 ;
         WHEN     ( .f. );
         OF       oDlgTpv */

     REDEFINE GET aGet[ _CTLFCLI ] VAR aTmp[ _CTLFCLI ] ;
         ID       106 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CNOMTIK ] VAR aTmp[ _CNOMTIK ];
         ID       191 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CDNICLI ] VAR aTmp[ _CDNICLI ] ;
         ID       101 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CDIRCLI ] VAR aTmp[ _CDIRCLI ] ;
         ID       102 ;
         BITMAP   "Environnment_View_16" ;
         ON HELP  GoogleMaps( aTmp[ _CDIRCLI ], Rtrim( aTmp[ _CPOBCLI ] ) + Space( 1 ) + Rtrim( aTmp[ _CPRVCLI ] ) ) ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CPOBCLI ] VAR aTmp[ _CPOBCLI ] ;
         ID       104 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CPRVCLI ] VAR aTmp[ _CPRVCLI ] ;
         ID       105 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CPOSCLI ] VAR aTmp[ _CPOSCLI ] ;
         ID       103 ;
         WHEN     ( nMode != ZOOM_MODE .and. ( !aTmp[ _LMODCLI ] .or. oUser():lAdministrador() ) ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _NTARIFA ] VAR aTmp[ _NTARIFA ];
         ID       192 ;
         SPINNER ;
         MIN      1 ;
         MAX      6 ;
         PICTURE  "9" ;
         VALID    ( aTmp[ _NTARIFA ] >= 1 .and. aTmp[ _NTARIFA ] <= 6 ) ;
         WHEN     ( nMode != ZOOM_MODE .and. ( lUsrMaster() .or. oUser():lCambiarPrecio() ) );
         OF       oDlgTpv

      REDEFINE GET oRieCli VAR nRieCli;
         ID       193 ;
         PICTURE  cPorDiv ;
         OF       oDlgTpv

      /*
      Codigo de obra___________________________________________________________
		*/

		REDEFINE GET aGet[_CCODOBR] VAR aTmp[_CCODOBR] ;
         ID       230 ;
         WHEN     ( lObras() .and. nMode != ZOOM_MODE ) ;
         VALID    ( cObras( aGet[ _CCODOBR ], oGetTxt[ 5 ], aTmp[ _CCLITIK ], dbfObrasT ) );
         BITMAP   "LUPA" ;
         ON HELP  ( brwObras( aGet[ _CCODOBR ], oGetTxt[ 5 ], aTmp[ _CCLITIK ], dbfObrasT ) ) ;
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 5 ] VAR aGetTxt[ 5 ] ;
			WHEN 		.F. ;
         ID       231 ;
         OF       oDlgTpv

      /*
      Codigo de Agente_________________________________________________________
		*/

      REDEFINE GET aGet[ _CCODAGE ] VAR aTmp[ _CCODAGE ] ;
         ID       240 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cAgentes( aGet[ _CCODAGE ], dbfAgent, oGetTxt[ 6 ], aGet[ _NCOMAGE ], dbfAgeCom ) );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ _CCODAGE ], oGetTxt[ 6 ] ) );
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 6 ] VAR aGetTxt[ 6  ] ;
         ID       241 ;
			WHEN 		.F.;
         OF       oDlgTpv

		/*
		Almacen__________________________________________________________________
		*/

		REDEFINE GET aGet[ _CALMTIK ] VAR aTmp[ _CALMTIK ];
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cAlmacen( aGet[_CALMTIK], dbfAlm, oGetTxt[ 2 ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( aGet[_CALMTIK], oGetTxt[ 2 ] ) ) ;
			ID 		170 ;
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 2 ] VAR aGetTxt[ 2 ] ;
			ID 		171 ;
			WHEN		.F. ;
         OF       oDlgTpv

      /*
      Formas de Pago___________________________________________________________
		*/

      REDEFINE GET aGet[ _CFPGTIK ] VAR aTmp[ _CFPGTIK ];
         ID       180 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    !Empty( aTmp[ _CFPGTIK ] ) .and. cFpago( aGet[ _CFPGTIK ], dbfFPago, oGetTxt[ 3 ] ) ;
			PICTURE	"@!" ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwFPago( aGet[ _CFPGTIK ], oGetTxt[ 3 ] ) ) ;
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 3 ] VAR aGetTxt[ 3 ] ;
			ID 		181 ;
			WHEN		.F. ;
         OF       oDlgTpv

      /*
		Cajas____________________________________________________________________
		*/

		REDEFINE GET aGet[ _CNCJTIK ] VAR aTmp[ _CNCJTIK ];
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    cCajas( aGet[ _CNCJTIK ], dbfCajT, oGetTxt[ 1 ] ) ;
			ID 		160 ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwCajas( aGet[ _CNCJTIK ], oGetTxt[ 1 ] ) ) ;
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 1 ] VAR aGetTxt[ 1 ] ;
			ID 		161 ;
			WHEN		.F. ;
         OF       oDlgTpv

      /*
      Codigo de Tarifa_________________________________________________________
		*/

      REDEFINE GET aGet[_CCODTAR] VAR aTmp[_CCODTAR] ;
         ID       220 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cTarifa( aGet[_CCODTAR], oGetTxt[ 8 ] ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwTarifa( aGet[_CCODTAR], oGetTxt[ 8 ] ) ) ;
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 8 ] VAR aGetTxt[ 8 ] ;
			WHEN 		.F. ;
         ID       221 ;
         OF       oDlgTpv

      REDEFINE GET aGet[_NCOMAGE] VAR aTmp[_NCOMAGE] ;
			WHEN 		( !Empty( aTmp[_CCODAGE] ) .AND. nMode != ZOOM_MODE ) ;
         SPINNER;
         PICTURE  "@E 99.99" ;
         ID       242 ;
         OF       oDlgTpv

      /*
		Ruta____________________________________________________________________
		*/

      REDEFINE GET aGet[ _CCODRUT ] VAR aTmp[ _CCODRUT ] ;
         ID       250 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cRuta( aGet[ _CCODRUT ], dbfRuta, oGetTxt[ 7 ]) );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwRuta( aGet[_CCODRUT ], dbfRuta, oGetTxt[ 7 ] ) );
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 7 ] VAR aGetTxt[ 7 ];
         ID       251 ;
			WHEN 		.F. ;
         OF       oDlgTpv
      /*
		Moneda__________________________________________________________________
		*/

		REDEFINE GET aGet[ _CDIVTIK ] VAR aTmp[ _CDIVTIK ];
         WHEN     ( nMode == APPD_MODE .AND. ( dbfTmpL )->( LastRec() ) == 0 ) ;
         VALID    ( cDivOut( aGet[ _CDIVTIK ], oBmpDiv, aGet[ _NVDVTIK ], @cPouDiv, nil, nil, nil, nil, nil, nil, dbfDiv, oBandera ) );
         ON CHANGE( lRecTotal( aTmp ) );
			PICTURE	"@!";
			ID 		200 ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwDiv( aGet[ _CDIVTIK ], oBmpDiv, aGet[ _NVDVTIK ], dbfDiv, oBandera ) ) ;
         OF       oDlgTpv

		REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
			ID 		201;
         OF       oDlgTpv

      REDEFINE CHECKBOX oCopTik VAR lCopTik ;
         ID       260 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlgTpv

      REDEFINE GET nCopTik;
         ID       261 ;
         PICTURE  "99" ;
         SPINNER ;
         MIN      0;
         MAX      99;
         VALID    ( nCopTik >= 0 .AND. nCopTik < 99 ) ;
         WHEN     ( !lCopTik );
         ON CHANGE( oCopTik:Click( .f. ):Refresh() );
			COLOR 	CLR_GET ;
         OF       oDlgTpv

		/*
		Detalle de Articulos____________________________________________________
      */

      oBrwDet                 := IXBrowse():New( oDlgTpv )

      oBrwDet:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwDet:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwDet:bChange         := {|| DisImg( ( dbfTmpL )->cCbaTil ) }

      if ( nMode != ZOOM_MODE ) .and. nAnd( nLevel, ACC_EDIT ) != 0
         oBrwDet:bLDblClick   := {|| WinEdtRec( oBrwDet, bEditL, dbfTmpL, , , aTmp ), lRecTotal( aTmp ), aGet[ _CCLITIK ]:SetFocus() }
      end if

      oBrwDet:cAlias          := dbfTmpL

      oBrwDet:nMarqueeStyle   := 6
      oBrwDet:cName           := "TPV.Detalle"

      oBrwDet:CreateFromResource( 210 )

      oCaptura:CreateColumns( cCapCaj, oBrwDet )

      REDEFINE SAY oTxtTot ;
         PROMPT   "Total";
         FONT     oFntEur ;
         COLOR    "G+/N";
			ID 		410 ;
         OF       oDlgTpv

      REDEFINE SAY oNumTot ;
         PROMPT   Trans( 0, cPorDiv );
         FONT     oFntEur ;
         COLOR    "G+/N";
			ID 		420 ;
         OF       oDlgTpv

      /*
      Descuentos________________________________________________________________
      */

      REDEFINE GET aGet[ _CDTOESP ] VAR aTmp[ _CDTOESP ] ;
         ID       710 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _NDTOESP ] VAR aTmp[ _NDTOESP ] ;
         ID       711 ;
         PICTURE  "@ER 999.99%" ;
         VALID    ( lRecTotal( aTmp ) );
         SPINNER;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlgTpv

      REDEFINE GET oTotEsp VAR nTotDtoEsp ;
         ID       712 ;
         PICTURE  "@ER 999.99 �" ;
         WHEN     ( .f. ) ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CDPP ] VAR aTmp[ _CDPP ] ;
         ID       720 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlgTpv

		REDEFINE GET aGet[ _NDPP ] VAR aTmp[ _NDPP ];
         ID       721 ;
         PICTURE  "@ER 999.99%" ;
         VALID    ( lRecTotal( aTmp ) );
         SPINNER;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oDlgTpv

      REDEFINE GET oTotDpp VAR nTotDpp ;
         ID       722 ;
         PICTURE  "@ER 999.99 �" ;
         WHEN     ( .f. ) ;
         OF       oDlgTpv

		/*
      Visor de productos_________________________________________________________________________
      */

      REDEFINE BITMAP oBmpVis ;
         ID       600;
         FILE     cFilBmp ;
         OF       oDlgTpv ;
			ADJUST

      /*
      REDEFINE SAY oDesVis VAR cDesVis;
			FONT		oFntEur ;
			ID 		440 ;
			OF 		oDlg

		REDEFINE SAY oTotVis VAR nTotVis;
			FONT		oFntEur ;
			ID 		450 ;
			OF 		oDlg
		*/

      /*
      Barra de porcentaje______________________________________________________
      */

		REDEFINE METER oMetMsg VAR nMetMsg ;
			ID 		460 ;
			NOPERCENTAGE ;
         OF       oDlgTpv

      oMetMsg:nClrText   := rgb( 128,255,0 )
      oMetMsg:nClrBar    := rgb( 128,255,0 )
      oMetMsg:nClrBText  := rgb( 128,255,0 )

      REDEFINE GET aGet[ _CSERTIK ] VAR aTmp[ _CSERTIK ];
			ID 		100 ;
			COLOR 	CLR_GET ;
         PICTURE  "@!" ;
         SPINNER ;
         ON UP    ( UpSerie( aGet[ _CSERTIK ] ) );
         ON DOWN  ( DwSerie( aGet[ _CSERTIK ] ) );
         WHEN     ( nMode == APPD_MODE );
         VALID    ( aTmp[ _CSERTIK ] >= "A" .AND. aTmp[ _CSERTIK ] <= "Z"  );
         OF       oDlgTpv

         aGet[ _CSERTIK ]:bLostFocus := {|| aTmp[ _CCODPRO ] := cProCnt( aTmp[ _CSERTIK ] ) }

		REDEFINE GET aGet[ _CNUMTIK ] VAR aTmp[ _CNUMTIK ];
			ID 		110 ;
			WHEN		.F. ;
			COLOR 	CLR_GET ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CSUFTIK ] VAR aTmp[ _CSUFTIK ];
         ID       111 ;
			WHEN		.F. ;
			COLOR 	CLR_GET ;
         OF       oDlgTpv

		REDEFINE GET aTmp[ _DFECTIK ];
			ID 		120 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			SPINNER ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _NCOBTIK ] VAR aTmp[ _NCOBTIK ];
         PICTURE  cPorDiv ;
         WHEN     (.f.);
         ID       140 ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _NCAMTIK ] VAR aTmp[ _NCAMTIK ];
         PICTURE  cPorDiv ;
         WHEN     (.f.);
			ID			150 ;
         OF       oDlgTpv

      REDEFINE GET aGet[ _CCCJTIK ] VAR aTmp[ _CCCJTIK ];
         ID       125 ;
         WHEN     ( .f. ) ;
         VALID    ( SetUsuario( aGet[ _CCCJTIK ], oGetTxt[ 10 ], nil, dbfUsr ) );
         OF       oDlgTpv

      REDEFINE GET oGetTxt[ 10 ] VAR aGetTxt[ 10 ] ;
         ID       130 ;
         WHEN     ( .f. ) ;
         OF       oDlgTpv

   oDlgTpv:bStart       := {|| StartEdtRec( aTmp, aGet, nMode, oDlgTpv, oBrw, oBrwDet, aNumDoc, cCodArt ) }

   /*
   Apertura de la caja de dialogo
   */

   if nMode != ZOOM_MODE
      oDlgTpv:AddFastKey( VK_F2, {|| AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur ), aGet[ _CCLITIK ]:SetFocus() } )
      oDlgTpv:AddFastKey( VK_F3, {|| WinEdtRec( oBrwDet, bEditL, dbfTmpL, , , aTmp ), lRecTotal( aTmp ), aGet[ _CCLITIK ]:SetFocus() } )
      oDlgTpv:AddFastKey( VK_F4, {|| WinDelRec( oBrwDet, dbfTmpL, nil, nil, .t. ), lRecTotal( aTmp ) } )
      oDlgTpv:AddFastKey( VK_F5, {|| if( ( ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVTIK .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) ) ), NewTiket( aGet, aTmp, nMode, SAVTIK, .f., oBrw, oBrwDet ), ) } )
      oDlgTpv:AddFastKey( VK_F7, {|| if( ( ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVALB .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) ) ), NewTiket( aGet, aTmp, nMode, SAVALB, .f., oBrw, oBrwDet ), ) } )
      oDlgTpv:AddFastKey( VK_F8, {|| if( ( ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVFAC .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) ) ), NewTiket( aGet, aTmp, nMode, SAVFAC, .f., oBrw, oBrwDet ), ) } )
      oDlgTpv:AddFastKey( VK_F9, {|| if( ( ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) ) ), NewTiket( aGet, aTmp, nMode, SAVAPT, .f., oBrw, oBrwDet ), ) } )
      oDlgTpv:AddFastKey( 65,    {|| if( GetKeyState( VK_CONTROL ), CreateInfoArticulo(), ) } )
   end if

   ACTIVATE DIALOG oDlgTpv ;
         VALID    ( ExitNoSave( nMode, dbfTmpL ) ) ;
         CENTER

   /*
   Limpiamos el Usuario que hemos guardado-------------------------------------
   */

   cDelUsrTik()

   oFntTot:End()
   oFntEur:End()
   oBmpDiv:End()

   /*
   Salida sin grabar-----------------------------------------------------------
   */

   KillTrans()

   if Select( dbfTikT ) != 0
      ( dbfTikT )->( ordSetFocus( nOrd ) )
   end if

RETURN ( oDlgTpv:nResult == IDOK )


//--------------------------------------------------------------------------//

Static Function StartEdtRec( aTmp, aGet, nMode, oDlgTpv, oBrw, oBrwDet, aNumDoc, cCodArt )

   local oBoton
   local oGrupo
   local oCarpeta

   if Empty( oOfficeBar )

      oOfficeBar              := TDotNetBar():New( 0, 0, 1020, 115, oDlgTpv, 1 )
      oOfficeBar:lPaintAll    := .f.
      oOfficeBar:lDisenio     := .f.

      oOfficeBar:SetStyle( 1 )

      oDlgTpv:oTop      := oOfficeBar

      oCarpeta          := TCarpeta():New( oOfficeBar, "T.P.V." )

      oGrupo            := TDotNetGroup():New( oCarpeta, 186, "Lineas", .f. )
         oBtnAdd        := TDotNetButton():New( 60, oGrupo, "New32",                    "A�adir [F2]",         1, {|| AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur ), aGet[ _CCLITIK ]:SetFocus() }, , , .f., .f., .f. )
         oBtnEdt        := TDotNetButton():New( 60, oGrupo, "Edit32",                   "Modificar [F3]",      2, {|| WinEdtRec( oBrwDet, bEditL, dbfTmpL, , , aTmp ), lRecTotal( aTmp ), aGet[ _CCLITIK ]:SetFocus() }, , , .f., .f., .f. )
         oBtnDel        := TDotNetButton():New( 60, oGrupo, "Del32",                    "Eliminar [F4]",       3, {|| WinDelRec( oBrwDet, dbfTmpL, nil, nil, .t. ), lRecTotal( aTmp ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )

      oGrupo            := TDotNetGroup():New( oCarpeta, 376, "Cobros", .f. )
         oBtnTik        := TDotNetButton():New( 60, oGrupo, "Money2_32",                "Cobrar [F5]",         1, {|| NewTiket( aGet, aTmp, nMode, SAVTIK, .f., oBrw, oBrwDet ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnAlb        := TDotNetButton():New( 60, oGrupo, "Document_plain_user1_32",  "Albar�n [F7]",        2, {|| NewTiket( aGet, aTmp, nMode, SAVALB, .f., oBrw, oBrwDet ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnFac        := TDotNetButton():New( 70, oGrupo, "Document_user1_32",        "Factura [F8]",        3, {|| NewTiket( aGet, aTmp, nMode, SAVFAC, .f., oBrw, oBrwDet ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnApt        := TDotNetButton():New( 60, oGrupo, "Cashier_Stop_32",          "Apartar [F9]",        4, {|| NewTiket( aGet, aTmp, nMode, SAVAPT, .f., oBrw, oBrwDet ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnVal        := TDotNetButton():New( 60, oGrupo, "Cashier_Money2_32",        "Cheque regalo",       5, {|| NewTiket( aGet, aTmp, nMode, SAVVAL, .f., oBrw, oBrwDet ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnDev        := TDotNetButton():New( 60, oGrupo, "Cashier_Delete_32",        "Devoluci�n o vale",   6, {|| AsistenteDevolucionTiket( aTmp, aGet, nMode ) }, , {|| nMode == APPD_MODE }, .f., .f., .f. )

      oGrupo            := TDotNetGroup():New( oCarpeta, 126, "Tickets", .f. )
         oBtnUp         := TDotNetButton():New( 60, oGrupo, "Arrow_Up_Blue_Save_32",    "Subir",               1, {|| lCambiaTicket( .t., aTmp, aGet, nMode ), if( !Empty( oBrw ), ( oBrw:Select(0), oBrw:Select(1), oBrw:Refresh() ), ) }, , {|| nMode != ZOOM_MODE }, .f., .f., .f. )
         oBtnDown       := TDotNetButton():New( 60, oGrupo, "Arrow_Down_Blue_Save_32",  "Bajar",               2, {|| lCambiaTicket( .f., aTmp, aGet, nMode ), if( !Empty( oBrw ), ( oBrw:Select(0), oBrw:Select(1), oBrw:Refresh() ), ) }, , , .f., .f., .f. )

      oGrupo            := TDotNetGroup():New( oCarpeta, 66, "Salida", .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "End32",                    "Salida",              1, {|| oDlgTpv:End() }, , , .f., .f., .f. )

      oCarpeta          := TCarpeta():New( oOfficeBar, "Rotor" )

      oGrupo            := TDotNetGroup():New( oCarpeta, 306, "Cobros", .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "User1_32",                 "Modificar cliente",   1, {|| if( !Empty( aTmp[ _CCLITIK ] ), EdtCli( aTmp[ _CCLITIK ] ), MsgStop( "C�digo cliente vac�o" ) ) }, , , .f., .f., .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "Info_32",                  "Informe cliente",     2, {|| if( !Empty( aTmp[ _CCLITIK ] ), InfCliente( aTmp[ _CCLITIK ] ), MsgStop( "C�digo cliente vac�o" ) ) }, , , .f., .f., .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "Worker_32",                "Modificar obras",     3, {|| if( !Empty( aTmp[ _CCLITIK ] ), EdtObras( aTmp[ _CCLITIK ], aTmp[ _CCODOBR ], dbfObrasT ), MsgStop( "No hay obra asociada para el presupuesto" ) ) }, , , .f., .f., .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "Cube_Yellow_32",           "Modificar art�culo",  4, {|| EdtArticulo( ( dbfTmpL )->cCbaTil ) }, , , .f., .f., .f. )
         oBoton         := TDotNetButton():New( 60, oGrupo, "Info_32",                  "Informe art�culo",    5, {|| InfArticulo( ( dbfTmpL )->cCbaTil ) }, , , .f., .f., .f. )

      SetButtonEdtRec( nMode, aTmp )

   end if

   if nMode == DUPL_MODE

      oBtnAdd:lEnabled  := .f.
      oBtnEdt:lEnabled  := .f.
      oBtnDel:lEnabled  := .f.

      oBtnTik:lEnabled  := .f.
      oBtnAlb:lEnabled  := .f.
      oBtnFac:lEnabled  := .t.
      oBtnApt:lEnabled  := .f.
      oBtnVal:lEnabled  := .f.
      oBtnDev:lEnabled  := .f.

      oBtnUp:lEnabled   := .f.
      oBtnDown:lEnabled := .f.

   end if

   if aNumDoc != nil

      do case
         case !Empty( aNumDoc[ 1 ] )

            cPreCli( aTmp, aGet, @aNumDoc[ 1 ], oBrwDet )

            oBtnAdd:lEnabled  := .f.
            oBtnEdt:lEnabled  := .f.
            oBtnDel:lEnabled  := .f.

            oBtnAlb:lEnabled  := .f.
            oBtnFac:lEnabled  := .f.
            oBtnApt:lEnabled  := .f.
            oBtnVal:lEnabled  := .f.
            oBtnDev:lEnabled  := .f.

            oBtnUp:lEnabled   := .f.
            oBtnDown:lEnabled := .f.

         case !Empty( aNumDoc[ 2 ] )

            cPedCli( aTmp, aGet, @aNumDoc[ 2 ], oBrwDet )

            oBtnAdd:lEnabled  := .f.
            oBtnEdt:lEnabled  := .f.
            oBtnDel:lEnabled  := .f.

            oBtnAlb:lEnabled  := .f.
            oBtnFac:lEnabled  := .f.
            oBtnApt:lEnabled  := .f.
            oBtnVal:lEnabled  := .f.
            oBtnDev:lEnabled  := .f.

            oBtnUp:lEnabled   := .f.
            oBtnDown:lEnabled := .f.

         case !Empty( aNumDoc[ 3 ] )

            cAlbCli( aTmp, aGet, @aNumDoc[ 3 ], oBrwDet )

            oBtnAdd:lEnabled  := .f.
            oBtnEdt:lEnabled  := .f.
            oBtnDel:lEnabled  := .f.

            oBtnAlb:lEnabled  := .f.
            oBtnFac:lEnabled  := .f.
            oBtnApt:lEnabled  := .f.
            oBtnVal:lEnabled  := .f.
            oBtnDev:lEnabled  := .f.

            oBtnUp:lEnabled   := .f.
            oBtnDown:lEnabled := .f.

      end case

   end if

   /*
   Ocultamos el bitmap para la imagen de los productos-------------------------
   */

   if !Empty( oBmpVis )
      oBmpVis:Hide()
   end if

   /*
   Comportamiento inicial------------------------------------------------------
   */

   if !Empty( oDlgTpv )
      aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Disable() } )
   end if

   do case
      case nMode == APPD_MODE .and. lRecogerUsuario() .and. !Empty( cCodArt )

         if lGetUsuario( aGet[ _CCCJTIK ], dbfUsr )

            cUsrTik( aGet[ _CCCJTIK ]:VarGet() )

            aGet[ _CCLITIK ]:lValid()

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur, cCodArt )

            aGet[ _CCLITIK ]:SetFocus()

         else

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            oDlgTpv:End()

         end if

      case nMode == APPD_MODE .and. lRecogerUsuario() .and. lEntCon()

         if lGetUsuario( aGet[ _CCCJTIK ], dbfUsr )

            cUsrTik( aGet[ _CCCJTIK ]:VarGet() )

            aGet[ _CCLITIK ]:lValid()

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur )

            aGet[ _CCLITIK ]:SetFocus()

         else

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            oDlgTpv:End()

         end if

      case nMode == APPD_MODE .and. lRecogerUsuario() .and. !lEntCon()

         if lGetUsuario( aGet[ _CCCJTIK ], dbfUsr )

            cUsrTik( aGet[ _CCCJTIK ]:VarGet() )

            aGet[ _CCLITIK ]:lValid()

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            aGet[ _CCLITIK ]:SetFocus()

         else

            if !Empty( oDlgTpv )
               aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
            end if

            oDlgTpv:End()

         end if

      case nMode == APPD_MODE .and. !lRecogerUsuario() .and. lEntCon()

         aGet[ _CCLITIK ]:lValid()

         if !Empty( oDlgTpv )
            aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
         end if

         AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur )

         aGet[ _CCLITIK ]:SetFocus()

      case nMode == APPD_MODE .and. !lRecogerUsuario() .and. !Empty( cCodArt )

         aGet[ _CCLITIK ]:lValid()

         if !Empty( oDlgTpv )
            aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
         end if

         AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur, cCodArt )

         aGet[ _CCLITIK ]:SetFocus()

      otherwise

         aGet[ _CCLITIK ]:lValid()

         if !Empty( oDlgTpv )
            aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
         end if

         lRecTotal( aTmp )

         oBrwDet:SetFocus()

   end case

Return ( nil )

//---------------------------------------------------------------------------//

Static Function StateButtons( lState )

   DEFAULT lState    := .f.

   oBtnAdd:lEnabled  := lState
   oBtnEdt:lEnabled  := lState
   oBtnDel:lEnabled  := lState

   oBtnTik:lEnabled  := lState
   oBtnAlb:lEnabled  := lState
   oBtnFac:lEnabled  := lState
   oBtnApt:lEnabled  := lState
   oBtnVal:lEnabled  := lState
   oBtnDev:lEnabled  := lState

   oBtnAdd:Refresh()
   oBtnEdt:Refresh()
   oBtnDel:Refresh()

   oBtnTik:Refresh()
   oBtnAlb:Refresh()
   oBtnFac:Refresh()
   oBtnApt:Refresh()
   oBtnVal:Refresh()
   oBtnDev:Refresh()

return ( nil )

//---------------------------------------------------------------------------//

Static Function SetButtonEdtRec( nMode, aTmp )

   oBtnAdd:lEnabled  := ( nMode != ZOOM_MODE )
   oBtnEdt:lEnabled  := ( nMode != ZOOM_MODE )
   oBtnDel:lEnabled  := ( nMode != ZOOM_MODE )

   oBtnTik:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVTIK .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )
   oBtnAlb:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVALB .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )
   oBtnFac:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVFAC .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )
   oBtnApt:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )
   oBtnVal:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )
   oBtnDev:lEnabled  := ( nMode == APPD_MODE ) .or. ( ( aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVDEV .or. aTmp[ _CTIPTIK ] == SAVAPT ) .and. ( nMode == EDIT_MODE ) )

Return ( nil )

//---------------------------------------------------------------------------//

Static Function cAlbCli( aTmp, aGet, cNumAlb, oBrwLin )

   local nRecCab
   local nRecLin
   local nOrdCab
   local nOrdLin

   nRecCab     		:= ( dbfAlbCliT )->( Recno() )
   nRecLin     		:= ( dbfAlbCliL )->( Recno() )
   nOrdCab     		:= ( dbfAlbCliT )->( OrdSetFocus( "NNUMALB" ) )
   nOrdLin     		:= ( dbfAlbCliL )->( OrdSetFocus( "NNUMALB" ) )

   /*
   Pasamos las cabeceras-------------------------------------------------------
   */

   if ( dbfAlbCliT )->( dbSeek( cNumAlb ) )

      cOldCodCli     := ( dbfAlbCliT )->cCodCli

      aGet[ _CCCJTIK ]:cText( ( dbfAlbCliT )->cCodUsr )
      aGet[ _CNCJTIK ]:cText( ( dbfAlbCliT )->cCodCaj )
      aGet[ _CALMTIK ]:cText( ( dbfAlbCliT )->cCodAlm )
      aGet[ _NTARIFA ]:cText( ( dbfAlbCliT )->nTarifa )
      aGet[ _CCLITIK ]:cText( ( dbfAlbCliT )->cCodCli )
      aGet[ _CNOMTIK ]:cText( ( dbfAlbCliT )->cNomCli )
      aGet[ _CDIRCLI ]:cText( ( dbfAlbCliT )->cDirCli )
      aGet[ _CTLFCLI ]:cText( ( dbfAlbCliT )->cTlfCli )
      aGet[ _CPOBCLI ]:cText( ( dbfAlbCliT )->cPobCli )
      aGet[ _CPRVCLI ]:cText( ( dbfAlbCliT )->cPrvCli )
      aGet[ _CPOSCLI ]:cText( ( dbfAlbCliT )->cPosCli )
      aGet[ _CDNICLI ]:cText( ( dbfAlbCliT )->cDniCli )
      aGet[ _CFPGTIK ]:cText( ( dbfAlbCliT )->cCodPago )
      aGet[ _CDIVTIK ]:cText( ( dbfAlbCliT )->cDivAlb )
      aGet[ _CCODAGE ]:cText( ( dbfAlbCliT )->cCodAge )
      aGet[ _NCOMAGE ]:cText( ( dbfAlbCliT )->nPctComAge )
      aGet[ _CCODRUT ]:cText( ( dbfAlbCliT )->cCodRut )
      aGet[ _CCODTAR ]:cText( ( dbfAlbCliT )->cCodTar )
      aGet[ _CCODOBR ]:cText( ( dbfAlbCliT )->cCodObr )

      aTmp[ _LMODCLI ]  := .t.
      aTmp[ _CALBTIK ]  := cNumAlb

      aTmp[ _CCODDLG ]  := ( dbfAlbCliT )->cCodDlg
      aTmp[ _CCODGRP ]  := ( dbfAlbCliT )->cCodGrp
      aTmp[ _NVDVTIK ]  := ( dbfAlbCliT )->nVdvAlb

      if ( dbfAlbCliL )->( dbSeek( cNumAlb ) )

         while ( dbfAlbCliL )->cSerAlb + Str( ( dbfAlbCliL )->nNumAlb ) + ( dbfAlbCliL )->cSufAlb == cNumAlb .and. !( dbfAlbCliL )->( Eof() )

            ( dbfTmpL )->( dbAppend() )

            ( dbfTmpL )->cCbaTil    := ( dbfAlbCliL )->cRef
            ( dbfTmpL )->cNomTil    := ( dbfAlbCliL )->cDetalle
            if ( dbfAlbCliT )->lIvaInc
               ( dbfTmpL )->nPvpTil := ( dbfAlbCliL )->nPreUnit
            else
               ( dbfTmpL )->nPvpTil := ( dbfAlbCliL )->nPreUnit + ( ( ( dbfAlbCliL )->nPreUnit * ( dbfAlbCliL )->nIva ) / 100 )
            end if
            ( dbfTmpL )->nUntTil    := ( dbfAlbCliL )->nUniCaja
            ( dbfTmpL )->nUndKit    := ( dbfAlbCliL )->nUndKit
            ( dbfTmpL )->nIvaTil    := ( dbfAlbCliL )->nIva
            ( dbfTmpL )->cFamTil    := ( dbfAlbCliL )->cCodFam
            ( dbfTmpL )->nDtoLin    := ( dbfAlbCliL )->nDto
            ( dbfTmpL )->cCodPr1    := ( dbfAlbCliL )->cCodPr1
            ( dbfTmpL )->cCodPr2    := ( dbfAlbCliL )->cCodPr2
            ( dbfTmpL )->cValPr1    := ( dbfAlbCliL )->cValPr1
            ( dbfTmpL )->cValPr2    := ( dbfAlbCliL )->cValPr2
            ( dbfTmpL )->nFacCnv    := ( dbfAlbCliL )->nFacCnv
            ( dbfTmpL )->nDtoDiv    := ( dbfAlbCliL )->nDtoDiv
            ( dbfTmpL )->nCtlStk    := ( dbfAlbCliL )->nCtlStk
            ( dbfTmpL )->cAlmLin    := ( dbfAlbCliL )->cAlmLin
            ( dbfTmpL )->nValImp    := ( dbfAlbCliL )->nValImp
            ( dbfTmpL )->cCodImp    := ( dbfAlbCliL )->cCodImp
            ( dbfTmpL )->nCosDiv    := ( dbfAlbCliL )->nCosDiv
            ( dbfTmpL )->lKitArt    := ( dbfAlbCliL )->lKitArt
            ( dbfTmpL )->lKitChl    := ( dbfAlbCliL )->lKitChl
            ( dbfTmpL )->lKitPrc    := ( dbfAlbCliL )->lKitPrc
            ( dbfTmpL )->lImpLin    := ( dbfAlbCliL )->lImpLin
            ( dbfTmpL )->lControl   := ( dbfAlbCliL )->lControl
            ( dbfTmpL )->mNumSer    := ( dbfAlbCliL )->mNumSer
            ( dbfTmpL )->cCodFam    := ( dbfAlbCliL )->cCodFam
            ( dbfTmpL )->cGrpFam    := ( dbfAlbCliL )->cGrpFam
            ( dbfTmpL )->nLote      := ( dbfAlbCliL )->nLote
            ( dbfTmpL )->cLote      := ( dbfAlbCliL )->cLote
            ( dbfTmpL )->cCodUsr    := ( dbfAlbCliT )->cCodUsr
            ( dbfTmpL )->nNumLin    := nLastNum( dbfTmpL )

            ( dbfTmpL )->( dbUnLock() )

            ( dbfAlbCliL )->( dbSkip() )

         end while

      end if

   end if

   /*
   Refrescamos el browse y los totales
   */

   lRecTotal( aTmp )

   ( dbfTmpL )->( dbGoTop() )

   oBrwLin:Refresh()

   /*
   Volvemos al orden y al numero de registro que teniamos----------------------
   */

   ( dbfAlbCliT )->( OrdSetFocus( nOrdCab ) )
   ( dbfAlbCliL )->( OrdSetFocus( nOrdLin ) )
   ( dbfAlbCliT )->( dbGoTo( nRecCab ) )
   ( dbfAlbCliL )->( dbGoTo( nRecLin ) )

   cNumAlb            := ""
   lStopEntContLine   := .t.

return .t.

//---------------------------------------------------------------------------//

static function cPedCli( aTmp, aGet, cNumPed, oBrwLin )

   local nRecCab
   local nRecLin
   local nOrdCab
   local nOrdLin

   nRecCab           := ( dbfPedCliT )->( Recno() )
   nRecLin           := ( dbfPedCliL )->( Recno() )
   nOrdCab           := ( dbfPedCliT )->( OrdSetFocus( "NNUMPED" ) )
   nOrdLin           := ( dbfPedCliL )->( OrdSetFocus( "NNUMPED" ) )

   /*
   Pasamos las cabeceras-------------------------------------------------------
   */

   if ( dbfPedCliT )->( dbSeek( cNumPed ) )

      cOldCodCli     := ( dbfPedCliT )->cCodCli

      aGet[ _CCCJTIK ]:cText( ( dbfPedCliT )->cCodUsr )
      aGet[ _CNCJTIK ]:cText( ( dbfPedCliT )->cCodCaj )
      aGet[ _CALMTIK ]:cText( ( dbfPedCliT )->cCodAlm )
      aGet[ _NTARIFA ]:cText( ( dbfPedCliT )->nTarifa )
      aGet[ _CCLITIK ]:cText( ( dbfPedCliT )->cCodCli )
      aGet[ _CNOMTIK ]:cText( ( dbfPedCliT )->cNomCli )
      aGet[ _CDIRCLI ]:cText( ( dbfPedCliT )->cDirCli )
      aGet[ _CTLFCLI ]:cText( ( dbfPedCliT )->cTlfCli )
      aGet[ _CPOBCLI ]:cText( ( dbfPedCliT )->cPobCli )
      aGet[ _CPRVCLI ]:cText( ( dbfPedCliT )->cPrvCli )
      aGet[ _CPOSCLI ]:cText( ( dbfPedCliT )->cPosCli )
      aGet[ _CDNICLI ]:cText( ( dbfPedCliT )->cDniCli )
      aGet[ _CFPGTIK ]:cText( ( dbfPedCliT )->cCodPgo )
      aGet[ _CCODAGE ]:cText( ( dbfPedCliT )->cCodAge )
      aGet[ _NCOMAGE ]:cText( ( dbfPedCliT )->nPctComAge )
      aGet[ _CCODRUT ]:cText( ( dbfPedCliT )->cCodRut )
      aGet[ _CCODTAR ]:cText( ( dbfPedCliT )->cCodTar )
      aGet[ _CCODOBR ]:cText( ( dbfPedCliT )->cCodObr )

      aTmp[ _LMODCLI ]  := .t.
      aTmp[ _CPEDTIK ]  := cNumPed

      aTmp[ _CCODDLG ]  := ( dbfPedCliT )->cCodDlg
      aTmp[ _CCODGRP ]  := ( dbfPedCliT )->cCodGrp
      aTmp[ _CDIVTIK ]  := ( dbfPedCliT )->cDivPed
      aTmp[ _NVDVTIK ]  := ( dbfPedCliT )->nVdvPed

      if ( dbfPedCliL )->( dbSeek( cNumPed ) )

         while ( dbfPedCliL )->cSerPed + Str( ( dbfPedCliL )->nNumPed ) + ( dbfPedCliL )->cSufPed == cNumPed .and. !( dbfPedCliL )->( Eof() )

            ( dbfTmpL )->( dbAppend() )

            ( dbfTmpL )->cCbaTil    := ( dbfPedCliL )->cRef
            ( dbfTmpL )->cNomTil    := ( dbfPedCliL )->cDetalle
            if ( dbfPedCliT )->lIvaInc
               ( dbfTmpL )->nPvpTil := ( dbfPedCliL )->nPreDiv
            else
               ( dbfTmpL )->nPvpTil := ( dbfPedCliL )->nPreDiv + ( ( ( dbfPedCliL )->nPreDiv * ( dbfPedCliL )->nIva ) / 100 )
            end if
            ( dbfTmpL )->nUntTil    := ( dbfPedCliL )->nUniCaja
            ( dbfTmpL )->nUndKit    := ( dbfPedCliL )->nUndKit
            ( dbfTmpL )->nIvaTil    := ( dbfPedCliL )->nIva
            ( dbfTmpL )->cFamTil    := ( dbfPedCliL )->cCodFam
            ( dbfTmpL )->nDtoLin    := ( dbfPedCliL )->nDto
            ( dbfTmpL )->cCodPr1    := ( dbfPedCliL )->cCodPr1
            ( dbfTmpL )->cCodPr2    := ( dbfPedCliL )->cCodPr2
            ( dbfTmpL )->cValPr1    := ( dbfPedCliL )->cValPr1
            ( dbfTmpL )->cValPr2    := ( dbfPedCliL )->cValPr2
            ( dbfTmpL )->nFacCnv    := ( dbfPedCliL )->nFacCnv
            ( dbfTmpL )->nDtoDiv    := ( dbfPedCliL )->nDtoDiv
            ( dbfTmpL )->nCtlStk    := ( dbfPedCliL )->nCtlStk
            ( dbfTmpL )->cAlmLin    := ( dbfPedCliL )->cAlmLin
            ( dbfTmpL )->nValImp    := ( dbfPedCliL )->nValImp
            ( dbfTmpL )->cCodImp    := ( dbfPedCliL )->cCodImp
            ( dbfTmpL )->nCosDiv    := ( dbfPedCliL )->nCosDiv
            ( dbfTmpL )->lKitArt    := ( dbfPedCliL )->lKitArt
            ( dbfTmpL )->lKitChl    := ( dbfPedCliL )->lKitChl
            ( dbfTmpL )->lKitPrc    := ( dbfPedCliL )->lKitPrc
            ( dbfTmpL )->lImpLin    := ( dbfPedCliL )->lImpLin
            ( dbfTmpL )->lControl   := ( dbfPedCliL )->lControl
            ( dbfTmpL )->mNumSer    := ( dbfPedCliL )->mNumSer
            ( dbfTmpL )->cCodFam    := ( dbfPedCliL )->cCodFam
            ( dbfTmpL )->cGrpFam    := ( dbfPedCliL )->cGrpFam
            ( dbfTmpL )->nLote      := ( dbfPedCliL )->nLote
            ( dbfTmpL )->cLote      := ( dbfPedCliL )->cLote
            ( dbfTmpL )->cCodUsr    := ( dbfPedCliT )->cCodUsr
            ( dbfTmpL )->nNumLin    := nLastNum( dbfTmpL )

            ( dbfTmpL )->( dbUnLock() )

            ( dbfPedCliL )->( dbSkip() )

         end while

      end if

      /*
      Pasamos los pagos--------------------------------------------------------
      */

      if ( dbfPedCliP )->( dbSeek( cNumPed ) )

         while ( dbfPedCliP )->cSerPed + Str( ( dbfPedCliP )->nNumPed ) + ( dbfPedCliP )->cSufPed == cNumPed .and. !( dbfPedCliP )->( Eof() )

            if !( dbfPedCliP )->lPasado

               ( dbfTmpP )->( dbAppend() )

               ( dbfTmpP )->cCodCaj    := ( dbfPedCliP )->cCodCaj
               ( dbfTmpP )->dPgoTik    := ( dbfPedCliP )->dEntrega
               ( dbfTmpP )->nImpTik    := ( dbfPedCliP )->nImporte
               ( dbfTmpP )->cDivPgo    := ( dbfPedCliP )->cDivPgo
               ( dbfTmpP )->nVdvPgo    := ( dbfPedCliP )->nVdvPgo
               ( dbfTmpP )->cFpgPgo    := ( dbfPedCliP )->cCodPgo
               ( dbfTmpP )->cTurPgo    := ( dbfPedCliP )->cTurRec

               ( dbfTmpP )->( dbUnLock() )

            end if

            ( dbfPedCliP )->( dbSkip() )

         end while

      end if

   end if

   /*
   Refrescamos el browse y los totales
   */

   lRecTotal( aTmp )

   ( dbfTmpL )->( dbGoTop() )

   oBrwLin:Refresh()

   /*
   Volvemos al orden y al numero de registro que teniamos----------------------
   */

   ( dbfPedCliT )->( OrdSetFocus( nOrdCab ) )
   ( dbfPedCliL )->( OrdSetFocus( nOrdLin ) )
   ( dbfPedCliT )->( dbGoTo( nRecCab ) )
   ( dbfPedCliL )->( dbGoTo( nRecLin ) )

   cNumPed            := ""
   lStopEntContLine   := .t.

return .t.

//---------------------------------------------------------------------------//

static function cPreCli( aTmp, aGet, cNumPre, oBrwLin )

   local nRecCab
   local nRecLin
   local nOrdCab
   local nOrdLin

   nRecCab           := ( dbfPreCliT )->( Recno() )
   nRecLin           := ( dbfPreCliL )->( Recno() )
   nOrdCab           := ( dbfPreCliT )->( OrdSetFocus( "NNUMPRE" ) )
   nOrdLin           := ( dbfPreCliL )->( OrdSetFocus( "NNUMPRE" ) )

   /*
   Pasamos las cabeceras-------------------------------------------------------
   */

   if ( dbfPreCliT )->( dbSeek( cNumPre ) )

      cOldCodCli        := ( dbfPreCliT )->cCodCli

      aGet[ _CCCJTIK ]:cText( ( dbfPreCliT )->cCodUsr )
      aGet[ _CNCJTIK ]:cText( ( dbfPreCliT )->cCodCaj )
      aGet[ _CALMTIK ]:cText( ( dbfPreCliT )->cCodAlm )
      aGet[ _NTARIFA ]:cText( ( dbfPreCliT )->nTarifa )
      aGet[ _CCLITIK ]:cText( ( dbfPreCliT )->cCodCli )
      aGet[ _CNOMTIK ]:cText( ( dbfPreCliT )->cNomCli )
      aGet[ _CDIRCLI ]:cText( ( dbfPreCliT )->cDirCli )
      aGet[ _CPOBCLI ]:cText( ( dbfPreCliT )->cPobCli )
      aGet[ _CTLFCLI ]:cText( ( dbfPreCliT )->cTlfCli )
      aGet[ _CPRVCLI ]:cText( ( dbfPreCliT )->cPrvCli )
      aGet[ _CPOSCLI ]:cText( ( dbfPreCliT )->cPosCli )
      aGet[ _CDNICLI ]:cText( ( dbfPreCliT )->cDniCli )
      aGet[ _CFPGTIK ]:cText( ( dbfPreCliT )->cCodPgo )
      aGet[ _CDIVTIK ]:cText( ( dbfPreCliT )->cDivPre )
      if !Empty ( aGet[ _NVDVTIK ] )
         aGet[ _NVDVTIK ]:cText( ( dbfPreCliT )->nVdvPre )
      end if
      aGet[ _CCODAGE ]:cText( ( dbfPreCliT )->cCodAge )
      aGet[ _NCOMAGE ]:cText( ( dbfPreCliT )->nPctComAge )
      aGet[ _CCODRUT ]:cText( ( dbfPreCliT )->cCodRut )
      aGet[ _CCODTAR ]:cText( ( dbfPreCliT )->cCodTar )
      aGet[ _CCODOBR ]:cText( ( dbfPreCliT )->cCodObr )
      aTmp[ _LMODCLI ]  := .t.
      aTmp[ _CPRETIK ]  := cNumPre
      aTmp[ _CCODDLG ]  := ( dbfPreCliT )->cCodDlg
      aTmp[ _CCODGRP ]  := ( dbfPreCliT )->cCodGrp

      if ( dbfPreCliL )->( dbSeek( cNumPre ) )

         while ( dbfPreCliL )->cSerPre + Str( ( dbfPreCliL )->nNumPre ) + ( dbfPreCliL )->cSufPre == cNumPre .and. !( dbfPreCliL )->( Eof() )

            ( dbfTmpL )->( dbAppend() )

            ( dbfTmpL )->cCbaTil    := ( dbfPreCliL )->cRef
            ( dbfTmpL )->cNomTil    := ( dbfPreCliL )->cDetalle
            if ( dbfAlbCliT )->lIvaInc
               ( dbfTmpL )->nPvpTil := ( dbfPreCliL )->nPreDiv
            else
               ( dbfTmpL )->nPvpTil := ( dbfPreCliL )->nPreDiv + ( ( ( dbfPreCliL )->nPreDiv * ( dbfPreCliL )->nIva ) / 100 )
            end if
            ( dbfTmpL )->nUntTil    := ( dbfPreCliL )->nUniCaja
            ( dbfTmpL )->nUndKit    := ( dbfPreCliL )->nUndKit
            ( dbfTmpL )->nIvaTil    := ( dbfPreCliL )->nIva
            ( dbfTmpL )->cFamTil    := ( dbfPreCliL )->cCodFam
            ( dbfTmpL )->nDtoLin    := ( dbfPreCliL )->nDto
            ( dbfTmpL )->cCodPr1    := ( dbfPreCliL )->cCodPr1
            ( dbfTmpL )->cCodPr2    := ( dbfPreCliL )->cCodPr2
            ( dbfTmpL )->cValPr1    := ( dbfPreCliL )->cValPr1
            ( dbfTmpL )->cValPr2    := ( dbfPreCliL )->cValPr2
            ( dbfTmpL )->nFacCnv    := ( dbfPreCliL )->nFacCnv
            ( dbfTmpL )->nDtoDiv    := ( dbfPreCliL )->nDtoDiv
            ( dbfTmpL )->nCtlStk    := ( dbfPreCliL )->nCtlStk
            ( dbfTmpL )->cAlmLin    := ( dbfPreCliL )->cAlmLin
            ( dbfTmpL )->nValImp    := ( dbfPreCliL )->nValImp
            ( dbfTmpL )->cCodImp    := ( dbfPreCliL )->cCodImp
            ( dbfTmpL )->nCosDiv    := ( dbfPreCliL )->nCosDiv
            ( dbfTmpL )->lKitArt    := ( dbfPreCliL )->lKitArt
            ( dbfTmpL )->lKitChl    := ( dbfPreCliL )->lKitChl
            ( dbfTmpL )->lKitPrc    := ( dbfPreCliL )->lKitPrc
            ( dbfTmpL )->lImpLin    := ( dbfPreCliL )->lImpLin
            ( dbfTmpL )->lControl   := ( dbfPreCliL )->lControl
            ( dbfTmpL )->mNumSer    := ( dbfPreCliL )->mNumSer
            ( dbfTmpL )->cCodFam    := ( dbfPreCliL )->cCodFam
            ( dbfTmpL )->cGrpFam    := ( dbfPreCliL )->cGrpFam
            ( dbfTmpL )->nLote      := ( dbfPreCliL )->nLote
            ( dbfTmpL )->cLote      := ( dbfPreCliL )->cLote
            ( dbfTmpL )->cCodUsr    := ( dbfPreCliT )->cCodUsr
            ( dbfTmpL )->nNumLin    := nLastNum( dbfTmpL )

            ( dbfTmpL )->( dbUnLock() )

            ( dbfPreCliL )->( dbSkip() )

         end while

      end if

   end if

   /*
   Refrescamos el browse y los totales
   */

   lRecTotal( aTmp )

   ( dbfTmpL )->( dbGoTop() )

   oBrwLin:Refresh()

   /*
   Volvemos al orden y al numero de registro que teniamos----------------------
   */

   ( dbfPreCliT )->( OrdSetFocus( nOrdCab ) )
   ( dbfPreCliL )->( OrdSetFocus( nOrdLin ) )
   ( dbfPreCliT )->( dbGoTo( nRecCab ) )
   ( dbfPreCliL )->( dbGoTo( nRecLin ) )

   cNumPre            := ""
   lStopEntContLine   := .t.

return .t.

//---------------------------------------------------------------------------//

/*
Esta funcion graba el tiket despues de pedir el importe por pantalla
*/

Static Function NewTiket( aGet, aTmp, nMode, nSave, lBig, oBrw, oBrwDet )

   local nRec
   local nOrd
   local aTbl
   local nTotTik
   local cAlmTik
   local cTipTik
   local oError
   local oBlock
   local nOrdAlb
   local cNumDoc           := ""
   local nNumTik           := ""
   local cAlbTik           := aTmp[ _CALBTIK ]
   local cPedTik           := aTmp[ _CPEDTIK ]
   local cPreTik           := aTmp[ _CPRETIK ]
   local nValeDiferencia   := 0
   local nValePromocion    := 0
   local lValePromocion    := .f.
   local lValeDiferencia   := .f.

   DEFAULT nSave           := SAVTIK      // Por defecto salvamos como ticket
   DEFAULT lBig            := .f.

   if lSaveNewTik
      Return .t.
   else
      lSaveNewTik          := .t.
   end if

   /*
   Comprobamos la fecha del documento------------------------------------------
   */

   if !lValidaOperacion( aTmp[ _DFECTIK ] )
      lSaveNewTik          := .f.
      Return .f.
   end if

   /*
   Ticket regalo---------------------------------------------------------------
   */

   aTmp[ _LFRETIK ]        := ( nSave == SAVVAL )

   /*
   Matamos el dialogo----------------------------------------------------------
   */

   if !Empty( oDlgDet )
      oDlgDet:nResult      := IDCANCEL
   end if

   /*
   Controles para todo tipo de documentos--------------------------------------
   */

   if ( dbfTmpL )->( OrdKeyCount() ) == 0
      MsgStop( "No puede almacenar un documento sin lineas." )
      lSaveNewTik          := .f.
      return .f.
   end if

   if !Empty( aGet[ _CCLITIK ] ) .and. !( aGet[ _CCLITIK ]:lValid() )
      aGet[ _CCLITIK ]:SetFocus()
      lSaveNewTik          := .f.
      return .f.
   end if

   if !Empty( aGet[ _CALMTIK ] )

      if Empty( aTmp[ _CALMTIK ] )
         aGet[ _CALMTIK ]:SetFocus()
         MsgInfo( "Almac�n no puede estar vacio" )
         lSaveNewTik       := .f.
         return .f.
      end if

      if !( aGet[ _CALMTIK ]:lValid() )
         aGet[ _CALMTIK ]:SetFocus()
         lSaveNewTik       := .f.
         return .f.
      end if

   end if

   if !Empty( aGet[ _CCCJTIK ] ) .and. Empty( aTmp[ _CCCJTIK ] )
      aGet[ _CCCJTIK ]:cText( cCurUsr() )
   end if

   if lRecogerAgentes() .and. !Empty( aGet[ _CCODAGE ] ) .and.  Empty( aTmp[ _CCODAGE ] )
      msgStop( "Agente no puede estar vacio." )
      aGet[ _CCODAGE ]:SetFocus()
      lSaveNewTik         := .f.
      return .f.
   end if

   if lRecogerAgentes() .and. !Empty( aGet[ _CCODAGE ] ) .and. !( aGet[ _CCODAGE ]:lValid() )
      aGet[ _CCODAGE ]:SetFocus()
      lSaveNewTik         := .f.
      return .f.
   end if

   /*
   Requisitos especiales segun el tipo de documento----------------------------
   */

   do case
   case nSave == SAVFAC

      /*
      Estos campos no pueden estar vacios--------------------------------------
      */

      if !Empty( aGet[ _CNOMTIK ] ) .and. Empty( aTmp[ _CNOMTIK ] ) .and. !( "GA" $ oWnd():Cargo )
         msgStop( "Nombre de cliente no puede estar vacio." )
         aGet[ _CCLITIK ]:SetFocus()
         lSaveNewTik         := .f.
         return .f.
      end if

      if Empty( aTmp[ _CDIRCLI ] ) .and. !( "GA" $ oWnd():Cargo )
         msgStop( "Domicilio de cliente no puede estar vacio." )
         lSaveNewTik         := .f.
         return .f.
      end if

      if Empty( aTmp[ _CDNICLI ] ) .and. !( "GA" $ oWnd():Cargo )
         msgStop( "D.N.I. / C.I.F. de cliente no puede estar vacio." )
         lSaveNewTik         := .f.
         return .f.
      end if

      if !lBig

         if Empty( aTmp[ _CFPGTIK ] )
            MsgStop( "Debe de introducir una forma de pago", "Imposible archivar como factura" )
            aGet[ _CFPGTIK ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if !( aGet[ _CFPGTIK ]:lValid() )
            aGet[ _CFPGTIK ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if lObras() .and. !Empty( aGet[ _CCODOBR ] ) .and. Empty( aTmp[ _CCODOBR ] )
            MsgStop( "Debe de introducir una obra", "Imposible archivar como factura" )
            aGet[ _CCODOBR ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if lObras() .and. !Empty( aGet[ _CCODOBR ] ) .and. !( aGet[ _CCODOBR ]:lValid() )
            aGet[ _CCODOBR ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

      end if

   case nSave == SAVALB

      if Empty( aTmp[ _CCLITIK ] )
         msgStop( "C�digo de cliente no puede estar vacio." )
         aGet[ _CCLITIK ]:SetFocus()
         lSaveNewTik         := .f.
         return .f.
      end if

      if !Empty( aGet[ _CCLITIK ] ) .and. lCliBlq( aTmp[ _CCLITIK ], dbfClient )
         msgStop( "Cliente bloqueado, no se pueden realizar operaciones de venta" , "Imposible archivar como albar�n" )
         aGet[ _CCLITIK ]:SetFocus()
         lSaveNewTik         := .f.
         return .f.
      end if

      if !Empty( aGet[ _CCLITIK ] ) .and. !lCliChg( aTmp[ _CCLITIK ], dbfClient )
         msgStop( "Este cliente no tiene autorizaci�n para venta a credito.", "Imposible archivar como albar�n" )
         aGet[ _CCLITIK ]:SetFocus()
         lSaveNewTik         := .f.
         return .f.
      end if

      if !lBig

         if !Empty( aGet[ _CFPGTIK ] ) .and. Empty( aTmp[ _CFPGTIK ] )
            MsgStop( "Debe de introducir una forma de pago", "Imposible archivar como albar�n" )
            aGet[ _CFPGTIK ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if !Empty( aGet[ _CFPGTIK ] ) .and. !( aGet[ _CFPGTIK ]:lValid() )
            aGet[ _CFPGTIK ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if lObras() .and. !Empty( aGet[ _CCODOBR ] ) .and. Empty( aTmp[ _CCODOBR ] )
            MsgStop( "Debe de introducir una obra", "Imposible archivar como albar�n" )
            aGet[ _CCODOBR ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

         if lObras() .and. !Empty( aGet[ _CCODOBR ] ) .and. !( aGet[ _CCODOBR ]:lValid() )
            aGet[ _CCODOBR ]:SetFocus()
            lSaveNewTik         := .f.
            return .f.
         end if

      end if

   end case

   /*
   Inicio de Fidelity----------------------------------------------------------
   */

   if ( nSave != SAVDEV ) .and. ( lFidelity( aGet, aTmp, nMode ) )
      lSaveNewTik         := .f.
      return .f.
   end if

   /*
   Serie del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CSERTIK ] )
      aTmp[ _CSERTIK ]  := "A"
   end if

   /*
   Turno del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CTURTIK ] )
      aTmp[ _CTURTIK ]  := cCurSesion()
   end if

   /*
   Usuario del ticket----------------------------------------------------------
   */

   if Empty( aTmp[ _CCCJTIK ] )
      aTmp[ _CCCJTIK ]  := cCurUsr()
   end if

   /*
   Caja del ticket-------------------------------------------------------------
   */

   if Empty( aTmp[ _CNCJTIK ] )
      aTmp[ _CNCJTIK ]  := oUser():cCaja()
   end if

   /*
   Tarifa de venta del ticket--------------------------------------------------
   */

   if Empty( aTmp[ _NTARIFA ] )
      aTmp[ _NTARIFA ]  := Max( uFieldEmpresa( "nPreVta" ), 1 )
   end if

   /*
   Inicalizamos las variables de importe---------------------------------------
   */

   oTotDiv              := TotalesTPV():Init()

   nTotTik              := nTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )

   aTmp[ _NCAMTIK ]     := 0
   aTmp[ _NCOBTIK ]     := nTotTik

   /*
   Capturanmos el porcentaje de promoci�n--------------------------------------
   */

   aTmp[ _NPCTPRM ]     := oFideliza:nPorcentajePrograma( nTotPrm )

   /*
   Vemos si cumple las condiciones para la promoci�n---------------------------
   */

   lValePromocion       := ( !Retfld( aTmp[ _CCLITIK ], dbfClient, "lExcFid" ) .and. ( aTmp[ _NPCTPRM ] != 0 ) )
   if lValePromocion
      nValePromocion    := nTotPrm * aTmp[ _NPCTPRM ] / 100
   end if

   /*
   Llamada a la funcion del cobro----------------------------------------------
   */

   if lExacto( aTmp ) .or. lCobro( @aTmp, aGet, @nSave, nMode, @lValeDiferencia, @nValeDiferencia, lBig, oDlgTpv )

      /*
      Justo antes de guardar volvemos a comprobar que existan lineas-----------
      */

      if ( dbfTmpL )->( OrdKeyCount() ) == 0
         MsgStop( "No puede almacenar un documento sin lineas." )
         lSaveNewTik         := .f.
         return .f.
      end if

      /*
      Control de errores-------------------------------------------------------
      */

      oBlock            := ErrorBlock( { | oError | Break( oError ) } )
      BEGIN SEQUENCE

         oDlgTpv:Disable()

         /*
         Archivamos el tipo de venta que se ha realizado--------------------------
         */

         aTmp[ _CTIPTIK ]     := nSave
         aTmp[ _DFECCRE ]     := Date()
         aTmp[ _CTIMCRE ]     := SubStr( Time(), 1, 5 )
         aTmp[ _LABIERTO]     := .f.

         /*
         Grabamos el tiket--------------------------------------------------------
         */

         do case
         case nMode == APPD_MODE

            /*
            Obtenemos el nuevo numero del Tiket-----------------------------------
            */

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Obtenemos el nuevo n�mero'
               oMetMsg:Refresh()
            end if

            aTmp[ _CNUMTIK ]  := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
            aTmp[ _CSUFTIK ]  := RetSufEmp()
            nNumTik           := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]

            /*
            Fechas y horas de creacon del tiket-----------------------------------
            */

            aTmp[ _CHORTIK ]  := Substr( Time(), 1, 5 )
            aTmp[ _LCLOTIK ]  := .f.

         case nMode == EDIT_MODE

            nNumTik           := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
            cNumDoc           := aTmp[ _CNUMDOC ]

            /*
            Borramos todos los registros anteriores----------------------------------
            */

            oStock:TpvCli( nNumTik, aTmp[ _CALMTIK ], .t., aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVDEV )

            /*
            Eliminamos las lineas----------------------------------------------
            */

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Eliminando lineas'
               oMetMsg:Refresh()
            end if

            while ( dbfTikL )->( dbSeek( nNumTik ) )
               if dbLock( dbfTikL )
                  ( dbfTikL )->( dbDelete() )
                  ( dbfTikL )->( dbUnLock() )
               end if
            end while

            /*
            Eliminamos los pagos-----------------------------------------------
            */

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Eliminando pagos'
               oMetMsg:Refresh()
            end if

            while ( dbfTikP )->( dbSeek( nNumTik ) )

               if dbLock( dbfTikP )
                  ( dbfTikP )->( dbDelete() )
                  ( dbfTikP )->( dbUnLock() )
               end if

            end while

            /*
            Eliminamos los vales ----------------------------------------------
            */

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Eliminando vales'
               oMetMsg:Refresh()
            end if

            nOrd  := ( dbfTikT )->( OrdSetFocus( "cDocVal" ) )
            nRec  := ( dbfTikT )->( Recno() )

            while ( dbfTikT )->( dbSeek( nNumTik ) ) .and. !( dbfTikT )->( eof() )
               if dbLock( dbfTikT )
                  ( dbfTikT )->lLiqTik       := .f.
                  ( dbfTikT )->lSndDoc       := .t.
                  ( dbfTikT )->cValDoc       := ""
                  ( dbfTikT )->cTurVal       := ""
                  ( dbfTikT )->( dbUnLock() )
               end if
            end while

            ( dbfTikT )->( OrdSetFocus( nOrd ) )
            ( dbfTikT )->( dbGoTo( nRec ) )

            /*
            Quitamos las marcas desde el fichero de Tiket----------------------
            */

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Eliminando anticipos'
               oMetMsg:Refresh()
            end if

            if !Empty( cNumDoc )

            nRec  := ( dbfAntCliT )->( Recno() )
            nOrd  := ( dbfAntCliT )->( OrdSetFocus( "cNumDoc" ) )

            while ( dbfAntCliT )->( dbSeek( cNumDoc ) ) .and. !( dbfAntCliT )->( eof() )
               if dbLock( dbfAntCliT )
                  ( dbfAntCliT )->lLiquidada := .f.
                  ( dbfAntCliT )->dLiquidada := Ctod( "" )
                  ( dbfAntCliT )->cTurLiq    := ""
                  ( dbfAntCliT )->cCajLiq    := ""
                  ( dbfAntCliT )->cNumDoc    := ""
                  ( dbfAntCliT )->( dbUnLock() )
               end if
            end while

            ( dbfAntCliT )->( OrdSetFocus( nOrd ) )
            ( dbfAntCliT )->( dbGoTo( nRec ) )

            end if

         end case

         /*
         Anotamos los pagos-------------------------------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText        := 'Anotando los pagos'
            oMetMsg:Refresh()
         end if

         if ( oTotDiv:lValeMayorTotal() )

            if ( aTmp[ _NCOBTIK ] != 0 ) // .and. nSave != SAVVAL )

               if dbAppe( dbfTmpP )
                  ( dbfTmpP )->cTurPgo    := cCurSesion()
                  ( dbfTmpP )->dPgoTik    := GetSysDate()
                  ( dbfTmpP )->cTimTik    := SubStr( Time(), 1, 5 )
                  ( dbfTmpP )->cCodCaj    := oUser():cCaja()
                  ( dbfTmpP )->cFpgPgo    := aTmp[ _CFPGTIK ]
                  ( dbfTmpP )->cSerTik    := aTmp[ _CSERTIK ]
                  ( dbfTmpP )->cNumTik    := aTmp[ _CNUMTIK ]
                  ( dbfTmpP )->cSufTik    := aTmp[ _CSUFTIK ]
                  ( dbfTmpP )->nImpTik    := aTmp[ _NCOBTIK ]
                  ( dbfTmpP )->cDivPgo    := aTmp[ _CDIVTIK ]
                  ( dbfTmpP )->nVdvPgo    := aTmp[ _NVDVTIK ]
                  ( dbfTmpP )->nDevTik    := Max( aTmp[ _NCAMTIK ], 0 )
               else
                  MsgStop( "No se ha podido a�adir el registro de pago" )
               end if

            end if

         end if

         /*
         Guardamos los cambios para posteriores-----------------------------------
         */

         nCambioTik           := aTmp[ _NCAMTIK ]

         /*
         Antes de guardar, si venimos de un albar�n, cambiamos el estado al albar�n
         */

         if !Empty( aTmp[ _CALBTIK ] )

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Estado albar�n'
               oMetMsg:Refresh()
            end if

            if dbSeekInOrd( aTmp[ _CALBTIK ], "nNumAlb", dbfAlbCliT )

               if dbLock( dbfAlbCliT )
                  ( dbfAlbCliT )->lFacturado    := .t.
                  ( dbfAlbCliT )->cNumTik       := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
                  ( dbfAlbCliT )->( dbUnLock() )
               end if

            end if

            nOrdAlb           := ( dbfAlbCliL )->( OrdSetFocus( "nNumAlb" ) )

            if ( dbfAlbCliL )->( dbSeek( aTmp[ _CALBTIK ] ) )

               while ( dbfAlbCliL )->cSerAlb + Str( ( dbfAlbCliL )->nNumAlb ) + ( dbfAlbCliL )->cSufAlb == aTmp[ _CALBTIK ] .and. !( dbfAlbCliL )->( Eof() )

                  if dbLock( dbfAlbCliL )
                     ( dbfAlbCliL )->lFacturado    := .t.
                     ( dbfAlbCliL )->( dbUnLock() )
                  end if

                  ( dbfAlbCliL )->( dbSkip() )

               end while

            end if

            ( dbfAlbCliL )->( OrdSetFocus( nOrdAlb ) )

         end if

         /*
         Antes de guardar, si venimos de un pedido, cambiamos el estado al pedido
         */

         if !Empty( aTmp[ _CPEDTIK ] )

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Estado pedido'
               oMetMsg:Refresh()
            end if

            if dbSeekInOrd( aTmp[ _CPEDTIK ], "nNumPed", dbfPedCliT )

               if dbLock( dbfPedCliT )
                  ( dbfPedCliT )->nEstado       := 3
                  ( dbfPedCliT )->cNumTik       := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
                  ( dbfPedCliT )->( dbUnLock() )
               end if

            end if

         end if

         /*
         Antes de guardar, si venimos de un presupuesto, cambiamos el estado al presupuesto
         */

         if !Empty( aTmp[ _CPRETIK ] )

            if !Empty( oMetMsg )
               oMetMsg:cText     := 'Estado presupuesto'
               oMetMsg:Refresh()
            end if

            if dbSeekInOrd( aTmp[ _CPRETIK ], "nNumPre", dbfPreCliT )

               if dbLock( dbfPreCliT )
                  ( dbfPreCliT )->lEstado       := .t.
                  ( dbfPreCliT )->cNumTik       := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
                  ( dbfPreCliT )->( dbUnLock() )
               end if

            end if

         end if

         /*
         Guardamos el tipo como albaranes-----------------------------------------
         */

         do case
            case nMode == DUPL_MODE

               SavTik2Neg( aTmp, aGet, nMode, nSave )
               SavTik2Fac( aTmp, aGet, nMode, nSave, nTotTik )

            case nSave == SAVALB

               SavTik2Alb( aTmp, aGet, nMode, nSave )

            case nSave == SAVFAC

               SavTik2Fac( aTmp, aGet, nMode, nSave, nTotTik )

            otherwise

               SavTik2Tik( aTmp, aGet, nMode, nSave )

         end case

         /*
         Actualizamos el stock-------------------------------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText              := 'Actualizando stocks'
            oMetMsg:Refresh()
         end if

         oStock:TpvCli( nNumTik, aTmp[ _CALMTIK ], .f., aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVDEV )

         /*
         Anotamos los vales ------------------------------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText              := 'Archivando vales'
            oMetMsg:Refresh()
         end if

         nRec                          := ( dbfTikT )->( Recno() )

         ( dbfTmpV )->( dbGoTop() )
         while !( dbfTmpV )->( eof() )
            if ( dbfTikT )->( dbSeek( ( dbfTmpV )->cSerTik + ( dbfTmpV )->cNumTik + ( dbfTmpV )->cSufTik ) )
               if dbLock( dbfTikT )
                  ( dbfTikT )->lLiqTik := .t.
                  ( dbfTikT )->lSndDoc := .t.
                  ( dbfTikT )->cValDoc := nNumTik
                  ( dbfTikT )->cTurVal := cCurSesion()
                  ( dbfTikT )->( dbUnLock() )
               end if
            end if
            ( dbfTmpV )->( dbSkip() )
         end while

         ( dbfTikT )->( dbGoTo( nRec ) )

         /*
         Ahora escribimos en el fichero definitivo los anticipos------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText                    := 'Archivando anticipos'
            oMetMsg:Refresh()
         end if

         ( dbfTmpA )->( dbGoTop() )
         while !( dbfTmpA )->( eof() )
            if ( dbfAntCliT )->( dbSeek( ( dbfTmpA )->cSerAnt + Str( ( dbfTmpA )->nNumAnt ) + ( dbfTmpA )->cSufAnt ) )
               if dbLock( dbfAntCliT )
                  ( dbfAntCliT )->cNumDoc    := ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac, 9 ) + ( dbfFacCliT )->cSufFac
                  ( dbfAntCliT )->lLiquidada := .t.
                  ( dbfAntCliT )->dLiquidada := GetSysDate()
                  ( dbfAntCliT )->cTurLiq    := cCurSesion()
                  ( dbfAntCliT )->cCajLiq    := oUser():cCaja()
                  ( dbfAntCliT )->( dbUnLock() )
               end if
            end if
            ( dbfTmpA )->( dbSkip() )
         end While

         /*
         Escribe los datos pendientes---------------------------------------------
         */

         dbCommitAll()

         /*
         Chequeo de los pago------------------------------------------------------
         */

         if ( dbfTikT )->cTipTik == SAVFAC

            if dbLock( dbfFacCliT )
               ( dbfFacCliT )->lSndDoc       := .t.
               ( dbfFacCliT )->( dbUnLock() )
            end if

            /*
            Generar los pagos de las facturas-------------------------------------
            */

            GenPgoFacCli( ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfClient, dbfFPago, dbfDiv, dbfIva, EDIT_MODE )

            /*
            Estado de la factura-----------------------------------------------
            */

            ChkLqdFacCli( nil, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfIva, dbfDiv )

         end if

         /*
         Apertura de la caja---------------------------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText        := 'Abriendo la caja'
            oMetMsg:Refresh()
         end if

         if ( dbfTikT )->cTipTik != SAVALB
            oUser():OpenCajon()
         end if

         /*
         Imprimir el registro--------------------------------------------------
         */

         if lCopTik // .and. nCopTik != 0  //Comprobamos que hayamos pulsado el bot�n de aceptar e imprimir
            ImpTiket( .f. )
         end if

         /*
         Imprimimos la comanda-------------------------------------------------
         */

         if lBig
            ImpresionComanda( nNumTik )
         end if

         /*
         Generamos el vale por la diferencia si nos lo piden-------------------
         */

         if lValeDiferencia .and. nMode == APPD_MODE

            if ( nSave != SAVVAL ) .or. ( nSave != SAVDEV  )

               if !Empty( oMetMsg )
                  oMetMsg:cText     := 'Generando vales'
                  oMetMsg:Refresh()
               end if

               /*
               Obtenemos el nuevo numero del vale---------------------------------
               */

               aTmp              := dbScatter( dbfTikT )

               aTmp[ _DFECTIK ]  := dFecMaxVale( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT  )
               aTmp[ _CNUMTIK ]  := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
               aTmp[ _CSUFTIK ]  := RetSufEmp()
               aTmp[ _CHORTIK ]  := Substr( Time(), 1, 5 )
               aTmp[ _DFECCRE ]  := Date()
               aTmp[ _CTIMCRE ]  := SubStr( Time(), 1, 5 )
               aTmp[ _CTIPTIK ]  := SAVVAL
               aTmp[ _LCLOTIK ]  := .f.
               aTmp[ _NTOTNET ]  := nValeDiferencia
               aTmp[ _NTOTTIK ]  := nValeDiferencia

               dbGather( aTmp, dbfTikT, .t. )

               /*
               Guardamos las lineas del tiket----------------------------------------
               */

               aTbl              := dbBlankRec( dbfTmpL )

               aTbl[ _CSERTIL ]  := aTmp[ _CSERTIK ]
               aTbl[ _CNUMTIL ]  := aTmp[ _CNUMTIK ]
               aTbl[ _CSUFTIL ]  := aTmp[ _CSUFTIK ]
               aTbl[ _CNOMTIL ]  := "Vale por diferencias"
               aTbl[ _NUNTTIL ]  := 1
               aTbl[ _NNUMLIN ]  := 1
               aTbl[ _NPVPTIL ]  := nValeDiferencia

               dbGather( aTbl, dbfTikL, .t. )

               if lCopTik
                  ImpTiket( .f. )
               end if

            end if

         end if

            /*
            Generamos el vale por promoci�n si nos lo piden--------------------
            */

            if ( lValePromocion ) .and. ( nValePromocion > 0 ) .and. ( nMode == APPD_MODE ) .and. ( nSave != SAVVAL )

               if !Empty( oMetMsg )
                  oMetMsg:cText     := 'Generando vales'
                  oMetMsg:Refresh()
               end if

               /*
               Obtenemos el nuevo numero del vale------------------------------
               */

               aTmp                 := dbScatter( dbfTikT )

               aTmp[ _CNUMTIK ]     := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
               aTmp[ _CSUFTIK ]     := RetSufEmp()
               aTmp[ _CHORTIK ]     := Substr( Time(), 1, 5 )
               aTmp[ _DFECCRE ]     := Date()
               aTmp[ _CTIMCRE ]     := SubStr( Time(), 1, 5 )
               aTmp[ _CTIPTIK ]     := SAVVAL
               aTmp[ _CTIKVAL ]     := nNumTik
               aTmp[ _LCLOTIK ]     := .f.

               if ( nSave == SAVDEV )
                  aTmp[ _NTOTNET ]  := - nValePromocion
                  aTmp[ _NTOTTIK ]  := - nValePromocion
               else
                  aTmp[ _NTOTNET ]  := nValePromocion
                  aTmp[ _NTOTTIK ]  := nValePromocion
               endif

               dbGather( aTmp, dbfTikT, .t. )

               /*
               Guardamos las lineas del tiket----------------------------------------
               */

               aTbl                 := dbBlankRec( dbfTmpL )

               aTbl[ _CSERTIL ]     := aTmp[ _CSERTIK ]
               aTbl[ _CNUMTIL ]     := aTmp[ _CNUMTIK ]
               aTbl[ _CSUFTIL ]     := aTmp[ _CSUFTIK ]
               aTbl[ _CTIPTIK ]     := SAVVAL
               aTbl[ _NUNTTIL ]     := 1
               aTbl[ _NNUMLIN ]     := 1
               aTbl[ _CNOMTIL ]     := "Vale por promoci�n"

               if ( nSave == SAVDEV )
                  aTbl[ _NPVPTIL ]  := - nValePromocion
               else
                  aTbl[ _NPVPTIL ]  := nValePromocion
               endif

               dbGather( aTbl, dbfTikL, .t. )

               if lCopTik // .and. nCopTik != 0  //Comprobamos que hayamos pulsado el bot�n de aceptar e imprimir
                  ImpTiket( .f. )
               end if

            end if

         // end if

         /*
         Modo para el proximo ticket----------------------------------------------
         */

         nSaveMode                  := APPD_MODE

         /*
         Cerrando-----------------------------------------------------------------
         */

         oDlgTpv:Enable()
         oDlgTpv:AEvalWhen()

         /*
         Cerrando el control de errores-------------------------------------------
         */

      RECOVER USING oError

         msgStop( "Error en la grabaci�n del ticket" + CRLF + ErrorMessage( oError ) )

      END SEQUENCE

      ErrorBlock( oBlock )

      /*
      Preparados para un nuevo registro----------------------------------------
      */

      if ( lBig ) .or. ( lEntCon() .and. ( nMode == APPD_MODE ) .and. ( Empty( cAlbTik ) .and. Empty( cPedTik ) .and. Empty( cPreTik ) ) )

         if !Empty( oMetMsg )
            oMetMsg:cText     := 'Inicializado entorno'
            oMetMsg:Refresh()
         end if

         if BeginTrans( aTmp, aGet, nMode, .t. )
            lSaveNewTik    := .f.
            Return nil
         end if

         /*
         Validamos los controles-----------------------------------------------
         */

         if !Empty( aGet[ _CCLITIK ] )
            aGet[ _CCLITIK ]:lValid()
         end if

         /*
         Tarifa de venta del ticket--------------------------------------------
         */

         if Empty( aTmp[ _NTARIFA ] )
            aTmp[ _NTARIFA ]  := Max( uFieldEmpresa( "nPreVta" ), 1 )
         end if

         if Empty( aTmp[ _NTARIFA ] ) .and. !Empty( RetFld( cDefCli(), dbfClient, "nTarifa" ) )
            aTmp[ _NTARIFA ]  := RetFld( cDefCli(), dbfClient, "nTarifa" )
         end if

         /*
         Articulos de inicio---------------------------------------------------
         */

         if !Empty( oBtnIni )
            oBtnIni:Click()
         end if

         /*
         Informacion del cambio anterior----------------------------------------
         */

         if oTxtTot != nil
            oTxtTot:SetText( "Cambio" )
         end if

         if oNumTot != nil .and. cPorDiv != nil
            oNumTot:SetText( Trans( nCambioTik, cPorDiv ) )
         end if

         /*
         Ejecutamos del nuevo el bStart----------------------------------------
         */

         if lBig
            StartEdtBig( aTmp, aGet, oDlgTpv, oBrwDet, nMode )
         else
            StartEdtRec( aTmp, aGet, nMode, oDlgTpv, oBrw, oBrwDet )
         end if

      else

         oDlgTpv:bValid    := {|| .t. }
         lSaveNewTik       := .f.

         oDlgTpv:end( IDOK )

      end if

      lStopEntCont         := !( Empty( cAlbTik ) .and. Empty( cPedTik ) .and. Empty( cPreTik ) )

      /*
      Imprimimos en el visor---------------------------------------------------
      */

      if oVisor != nil
         oVisor:SetBufferLine( { "Total: ",  Trans( nTotTik, cPorDiv ) },     1 )
         oVisor:SetBufferLine( { "Cambio: ", Trans( nCambioTik, cPorDiv ) },  2 )
         oVisor:WriteBufferLine()
      end if

   end if

   if lSaveNewTik
      lSaveNewTik    := .f.
   end if

Return Nil

//---------------------------------------------------------------------------//

Function ImpresionComanda( nNumTik, dbfImp, lCopia )

   local nPos
   local nOrdTikL
   local nRecTikL
   local aImp              := {}
   local nImpresora        := 0
   local cPrinter          := ""
   local cFormato          := ""
   local lCreateTemporal   := .f.

   DEFAULT lCopia          := .f.

   CursorWait()

   /*
   Creamos las tablas temporales si no la tenemos abiertas---------------------
   */

   if Empty( dbfTmpC )

      cNewFilC          := cGetNewFileName( cPatTmp() + "TikC" )

      dbCreate( cNewFilC, aSqlStruct( aColTik() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilC, cCheckArea( "TikC", @dbfTmpC ), .f. )
      if !NetErr()
         ( dbfTmpC )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpC )->( OrdCreate( cNewFilC, "CNUMTIL", "CSERTIL + CNUMTIL + CSUFTIL", {|| Field->cSerTil + Field->cNumTil + Field->cSufTil } ) )
      end if

      lCreateTemporal   := .t.

   else

      ( dbfTmpC )->( __dbZap() )

   end if

   /*
   Guaradamos la posicion del orden--------------------------------------------
   */

   nRecTikL          := ( dbfTikL )->( Recno() )

   if dbSeekInOrd( nNumTik, "cNumTil", dbfTikL )

      while ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == nNumTik .and. !( dbfTikL )->( Eof() )

         if lCopia .or. !( dbfTikL )->lImpCom

            /*
            Impresora Uno------------------------------------------------------
            */

            if ( dbfTikL )->nImpCom1 >= 1 .and. ( dbfTikL )->nImpCom1 <= 3

               if aScan( aImp, ( dbfTikL )->nImpCom1 ) == 0
                  aAdd( aImp, ( dbfTikL )->nImpCom1 )
               end if

            end if

            /*
            Impresora Dos------------------------------------------------------
            */

            if ( dbfTikL )->nImpCom2 >= 1 .and. ( dbfTikL )->nImpCom2 <= 3

               if aScan( aImp, ( dbfTikL )->nImpCom2 ) == 0
                  aAdd( aImp, ( dbfTikL )->nImpCom2 )
               end if

            end if

         end if

         /*
         A�adimos desde el fichero de lineas-----------------------------------
         */

         dbPass( dbfTikL, dbfTmpC, .t. )

         /*
         Siguiente linea-------------------------------------------------------
         */

         ( dbfTikL )->( dbSkip() )

      end while

   end if

   nOrdTikL          := ( dbfTikL )->( ordSetFocus( "nOrTImp" ) )

   /*
   Impimimos la comanda por las impresoras deseadas----------------------------
   */

   for nPos := 1 to len( aImp )

      /*
      Filtramos para que solo entren las comandas no impresas------------------
      */

      if lCopia
         ( dbfTmpC )->( dbSetFilter( {|| Field->nImpCom1 == aImp[ nPos ] .or. Field->nImpCom2 == aImp[ nPos ] }, "Field->nImpCom1 == aImp[ nPos ] .or. Field->nImpCom2 == aImp[ nPos ]" ) )
      else
         ( dbfTmpC )->( dbSetFilter( {|| !Field->lImpCom .and. ( Field->nImpCom1 == aImp[ nPos ] .or. Field->nImpCom2 == aImp[ nPos ] ) }, "!lField->ImpCom .and. ( Field->nImpCom1 == aImp[ nPos ] .or. Field->nImpCom2 == aImp[ nPos ] )" ) )
      end if

      /*
      Esto lo kitamos despues

      ( dbfTikL )->( dbGoTop() )

      while !( dbfTikL )->( Eof() )

         ( dbfTikL )->( dbSkip() )

      end while

      ( dbfTikL )->( dbGoTop() )
      */

      /*
      Imprimimos la comanda por la impresora correspondiente-------------------
      */

      if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )

         cPrinter := cPrinterComanda( oUser():cCaja(), dbfCajT, aImp[ nPos ] )
         cFormato := cFormatoComandaEnCaja( oUser():cCaja(), dbfCajT )

         if !Empty( cPrinter )
            GenTikCli( IS_PRINTER, "Imprimiendo comanda", cFormato, cPrinter, .t. )
         end if

      end if

      /*
      Destruimos el filtro-----------------------------------------------------
      */

      ( dbfTikL )->( dbClearFilter() )

   next

   ( dbfTikL )->( ordSetFocus( nOrdTikL ) )

   /*
   Ponemos la marca para saber que el producto est� imprimido------------------
   */

   if dbSeekInOrd( nNumTik, "cNumTil", dbfTikL )

      while ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == nNumTik .and. !( dbfTikL )->( Eof() )

         if dbLock( dbfTikL )
            ( dbfTikL )->lImpCom    := .t.
            ( dbfTikL )->( dbUnLock() )
         end if

         ( dbfTikL )->( dbSkip() )

      end while

   end if

   ( dbfTikL )->( dbGoTo( nRecTikL ) )

   /*
   Log de impresiones----------------------------------------------------------
   */

   if !Empty( dbfImp )

      if dbSeekInOrd( nNumTik, "cNumTil", dbfImp )

         while ( dbfImp )->cSerTik + ( dbfImp )->cNumTik + ( dbfImp )->cSufTik == nNumTik .and. ( dbfImp )->lComanda .and. !( dbfImp )->( Eof() )

            if dbLock( dbfImp )
               ( dbfImp )->lImp        := .t.
               ( dbfImp )->dFTikImp    := GetSysDate()
               ( dbfImp )->cHTikImp    := Substr( Time(), 1, 5 )
               ( dbfImp )->( dbUnLock() )
            end if

            ( dbfImp )->( dbSkip() )

         end while

      end if

   end if

   /*
   Matamos la temporal---------------------------------------------------------
   */

   if lCreateTemporal

      if !Empty( dbfTmpC ) .and. ( dbfTmpC )->( Used() )
         ( dbfTmpC )->( dbCloseArea() )
      end if

      dbfErase( cNewFilC )

      dbfTmpC  := nil

   end if

   CursorWE()

return ( .t. )

//---------------------------------------------------------------------------//

FUNCTION nTotUTpv( uTmpL, nDec, nVdv, nPrc )

   local nCalculo    := 0

   DEFAULT uTmpL     := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nVdv      := 1
   DEFAULT nPrc      := 0

   if ValType( uTmpL ) == "C"

      if nPrc == 0 .or. nPrc == 1
         nCalculo    += ( uTmpL )->nPvpTil
      end if

      if nPrc == 0 .or. nPrc == 2
         nCalculo    += ( uTmpL )->nPcmTil     // Precio combinado
      end if

      nCalculo       -= ( uTmpL )->nDtoDiv     // Descuentos unitarios

   else

      if nPrc == 0 .or. nPrc == 1
         nCalculo    += uTmpL:nPvpTil
      end if

      if nPrc == 0 .or. nPrc == 2
         nCalculo    += uTmpL:nPcmTil     // Precio combinado
      end if

      nCalculo       -= uTmpL:nDtoDiv     // Descuentos unitarios

   end if

   if nVdv != 0
      nCalculo       := nCalculo / nVdv
   end if

RETURN ( round( nCalculo, nDec ) )

//--------------------------------------------------------------------------//

Function nIvaUTpv( uTmpL, nDec, nVdv, nPrc )

   local nCalculo := 0

   DEFAULT uTmpL  := dbfTikL
   DEFAULT nDec   := nDouDiv()
   DEFAULT nVdv   := 1
   DEFAULT nPrc   := 0

   nCalculo       := nTotUTpv( uTmpL, nDec, nVdv, nPrc )

   do case
      case ValType( uTmpL ) == "C"
         nCalculo -= Round( nCalculo / ( 1 + ( uTmpL )->nIvaTil / 100 ), nDec )

      case ValType( uTmpL ) == "O"
         nCalculo -= Round( nCalculo / ( 1 + uTmpL:nIvaTil / 100 ), nDec )

   end case

   if nVdv != 0
      nCalculo    := nCalculo / nVdv
   end if

Return ( Round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

Function nImpUTpv( uTikT, uTikL, nDec, nVdv, cPouDiv, nPrc )

   local nCalculo

   DEFAULT uTikT     := dbfTikT
   DEFAULT uTikL     := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nVdv      := 1
   DEFAULT nPrc      := 0

   nCalculo          := nTotUTpv( uTikL, nDec, nVdv, nPrc )

   do case
      case Valtype( uTikL ) == "C"

         if ( uTikL )->nDtoLin != 0
            nCalculo -= ( uTikL )->nDtoLin * nCalculo / 100  // Dto porcentual
         end if

         if ( uTikL )->nIvaTil != 0
            nCalculo -= Round( nCalculo / ( 100 / ( uTikL )->nIvaTil + 1 ), nDec )
         end if

         if ( uTikT )->cTipTik == SAVDEV
            nCalculo := - nCalculo
         end if

      case Valtype( uTikL ) == "O"

         if uTikL:nDtoLin != 0
            nCalculo -= uTikL:nDtoLin * nCalculo / 100  // Dto porcentual
         end if

         if uTikL:nIvaTil != 0
            nCalculo -= Round( nCalculo / ( 100 / uTikL:nIvaTil + 1 ), nDec )
         end if

         if uTikT:cTipTik == SAVDEV
            nCalculo := - nCalculo
         end if

   end case

Return ( if( cPouDiv != nil, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

Function nDtoUTpv( dbfTmpL, nDec, nVdv )

   local nCalculo

   DEFAULT dbfTmpL   := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nVdv      := 1

   nCalculo          := ( dbfTmpL )->nDtoDiv

   if nVdv != 0
      nCalculo       := nCalculo / nVdv
   end if

Return ( round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

Function nTotFacCnvTikTpv( uDbf, lCombinado )

   local nTotUnd

   DEFAULT uDbf         := dbfTikL
   DEFAULT lCombinado   := .f.

   do case
      case ValType( uDbf ) == "A"

         if !lCombinado
            nTotUnd  := uDbf[ _NUNTTIL ] / NotCero( uDbf[ _NFACCNV ] )
         else
            nTotUnd  := uDbf[ _NUNTTIL ] / NotCero( uDbf[ _NFCMCNV ] )
         end if

      case ValType( uDbf ) == "C"

         if !lCombinado
            nTotUnd  := ( uDbf )->nUntTil / NotCero( ( uDbf )->nFacCnv )
         else
            nTotUnd  := ( uDbf )->nUntTil / NotCero( ( uDbf )->nFcmCnv )
         end if

      otherwise

         if !lCombinado
            nTotUnd  := uDbf:nUntTil / NotCero( uDbf:nFacCnv )
         else
            nTotUnd  := uDbf:nUntTil / NotCero( uDbf:nFcmCnv )
         end if

   end case

Return ( nTotUnd )

//---------------------------------------------------------------------------//

Function nIvaLTpv( cTikT, cTikL, nDec, nRou, nVdv, nPrc )

   local nCalculo    := 0

   DEFAULT cTikT     := dbfTikT
   DEFAULT cTikL     := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nRou      := nRouDiv()
   DEFAULT nVdv      := 1
   DEFAULT nPrc      := 0

   do case
      case ValType( cTikL ) == "C"

         if ( cTikL )->nIvaTil != 0

            if Empty( nPrc ) .or. nPrc == 1
               nCalculo += nTotLUno( cTikL, nDec, nRou, nVdv )
            end if

            if Empty( nPrc ) .or. nPrc == 2
               nCalculo += nTotLDos( cTikL, nDec, nRou, nVdv )
            end if

            nCalculo    -= Round( nCalculo / ( 1 + ( cTikL )->nIvaTil / 100 ), nDec )

         end if

      case ValType( cTikL ) == "O"

         if cTikL:nIvaTil != 0

            if Empty( nPrc ) .or. nPrc == 1
               nCalculo += nTotLUno( cTikL:cAlias, nDec, nRou, nVdv )
            end if

            if Empty( nPrc ) .or. nPrc == 2
               nCalculo += nTotLDos( cTikL:cAlias, nDec, nRou, nVdv )
            end if

            nCalculo    -= Round( nCalculo / ( 1 + ( cTikL:cAlias )->nIvaTil / 100 ), nDec )

         end if

   end case

   do case
      case Valtype( cTikT ) == "C" .and. ( cTikT )->cTipTik == SAVDEV
         nCalculo    := - nCalculo

      case Valtype( cTikT ) == "O" .and. cTikT:cTipTik == SAVDEV
         nCalculo    := - nCalculo

   end case

   if nCalculo != 0 .and. nVdv != 0
      nCalculo       := nCalculo / nVdv
   end if

Return ( Round( nCalculo, nRou ) )

//---------------------------------------------------------------------------//

/*
Devuelve el precio linea
*/

Function nNetLTpv( dbfTmpL, nDec, nRou, nVdv )

   local nCalculo    := 0

   DEFAULT dbfTmpL   := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nRou      := nRouDiv()
   DEFAULT nVdv      := 1

   nCalculo          := nTotLTpv( dbfTmpL, nDec, nRou, nVdv )

   if ( dbfTmpL )->nIvaTil != 0
      nCalculo       := nCalculo / ( ( ( dbfTmpL )->nIvaTil / 100 ) + 1 )
   end if

Return ( Round( nCalculo, nRou ) )

//---------------------------------------------------------------------------//

Static Function EdtCobTik( oWndBrw, lBig )

   local nOrd
   local nRec
   local aTmp
   local aGet
   local oBlock
   local oError
   local cSerAlb
   local cNumAlb
   local cSufAlb
   local cNumTik
   local cNumDoc
   local cCodCli
   local nOrdAnt
   local nDifVale    := 0
   local lGenVale    := .f.

   DEFAULT lBig      := .f.

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   aTmp              := dbScatter( dbfTikT )
   aGet              := Array( ( dbfTikT )->( fCount() ) )
   cNumTik           := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik
   cCodCli           := ( dbfTikT )->cCliTik
   cNumDoc           := ( dbfTikT )->cNumDoc
   nOrdAnt           := ( dbfTikT )->( OrdSetFocus( "cNumTik" ) )

   nCopTik           := nCopiasTicketsEnCaja( oUser():cCaja(), dbfCajT )

   /*
   Objeto de totales-----------------------------------------------------------
   */

   oTotDiv           := TotalesTPV():Init()

   /*
   Crear la base de datos local para los pagos del ticket----------------------
   */

   cNewFilP          := cGetNewFileName( cPatTmp() + "TikP"  )
   dbCreate( cNewFilP, aSqlStruct( aPgoTik() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFilP, cCheckArea( "TikP", @dbfTmpP ), .f. )

   /*
   Crear la base de datos local para los vales del ticket----------------------
   */

   cNewFilV          := cGetNewFileName( cPatTmp() + "TikV"  )
   dbCreate( cNewFilV, aSqlStruct( aItmTik() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFilV, cCheckArea( "TikV", @dbfTmpV ), .f. )

   /*
   Crear la base de datos local para los anticipos de clientes-----------------
   */

   cNewFilA          := cGetNewFileName( cPatTmp() + "TikA"  )
   dbCreate( cNewFilA, aSqlStruct( aItmAntCli() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFilA, cCheckArea( "TikA", @dbfTmpA ), .f. )

   /*
   Crear la base de datos local para las entregas a cuenta de albaranes--------
   */

   cNewFilE          := cGetNewFileName( cPatTmp() + "TikE"  )
   dbCreate( cNewFilE, aSqlStruct( aItmAlbPgo() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFilE, cCheckArea( "TikE", @dbfTmpE ), .f. )

   do case
   case ( dbfTikT )->cTipTik == SAVALB // Como albaran

      aTmp[ _NCOBTIK ]  := nTotAlbCli( cNumDoc, dbfAlbCliT, dbfAlbCliL, dbfIva, dbfDiv, nil, nil, .f. )

      /*
      Importamos las entregas a cuenta-----------------------------------------
      */

      nRec              := ( dbfAlbCliP )->( Recno() )
      nOrd              := ( dbfAlbCliP )->( OrdSetFocus( "NNUMALB" ) )

      if ( dbfAlbCliP )->( dbSeek( ( dbfTikT )->cNumDoc ) )
         while ( ( dbfAlbCliP )->cSerAlb + Str( ( dbfAlbCliP )->nNumAlb ) + ( dbfAlbCliP )->cSufAlb ) == cNumDoc .and. !( dbfAlbCliP )->( eof() )
            dbPass( dbfAlbCliP, dbfTmpE, .t. )
            ( dbfAlbCliP )->( dbSkip() )
         end while
      end if
      ( dbfTmpE )->( dbGoTop() )

      ( dbfAlbCliP )->( OrdSetFocus( nOrd ) )
      ( dbfAlbCliP )->( dbGoTo( nRec ) )

   case ( dbfTikT )->cTipTik == SAVFAC // Como factura

      aTmp[ _NCOBTIK ]  := nTotFacCli( cNumDoc, dbfFacCliT, dbfFacCliL, dbfIva, dbfDiv, dbfFacCliP, nil, nil, nil, .f. )

      /*
      Importamos los pagos--------------------------------------------------------
      */

      if ( dbfFacCliP )->( dbSeek( cNumDoc ) )
         while ( dbfFacCliP )->cSerie + Str( ( dbfFacCliP )->nNumFac ) + ( dbfFacCliP )->cSufFac == cNumDoc .and. !( dbfFacCliP )->( eof() )
            if ( dbfFacCliP )->lCobrado
               ( dbfTmpP )->( dbAppend() )
               ( dbfTmpP )->cCodCaj    := ( dbfFacCliP )->cCodCaj
               ( dbfTmpP )->dPgoTik    := ( dbfFacCliP )->dEntrada
               ( dbfTmpP )->nImpTik    := ( dbfFacCliP )->nImporte
               ( dbfTmpP )->cDivPgo    := ( dbfFacCliP )->cDivPgo
               ( dbfTmpP )->nVdvPgo    := ( dbfFacCliP )->nVdvPgo
               ( dbfTmpP )->cPgdPor    := ( dbfFacCliP )->cPgdoPor
               ( dbfTmpP )->cTurPgo    := ( dbfFacCliP )->cTurRec
               ( dbfTmpP )->cCtaRec    := ( dbfFacCliP )->cCtaRec
               ( dbfTmpP )->cFpgPgo    := ( dbfFacCliP )->cCodPgo
            end if
            ( dbfFacCliP )->( dbSkip() )
         end while
      end if

      ( dbfTmpP )->( dbGoTop() )

      /*
      A�adimos desde el fichero de Anticipos-----------------------------------
      */

      nRec  := ( dbfAntCliT )->( Recno() )
      nOrd  := ( dbfAntCliT )->( OrdSetFocus( "cNumDoc" ) )

      if ( dbfAntCliT )->( dbSeek( cNumDoc ) )
         while ( dbfAntCliT )->cNumDoc == cNumDoc .and. !( dbfAntCliT )->( eof() )
            dbPass( dbfAntCliT, dbfTmpA, .t. )
            ( dbfAntCliT )->( dbSkip() )
         end while
      end if
      ( dbfTmpA )->( dbGoTop() )

      ( dbfAntCliT )->( OrdSetFocus( nOrd ) )
      ( dbfAntCliT )->( dbGoTo( nRec ) )

   otherwise

      aTmp[ _NCOBTIK ]  := nTotTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, nil, nil, .f. )

      /*
      A�adimos desde el fichero de PAGOS---------------------------------------
      */

      if ( dbfTikP )->( dbSeek( cNumTik ) )
         while ( ( dbfTikP )->cSerTik + ( dbfTikP )->cNumTik + ( dbfTikP )->cSufTik == cNumTik .and. !( dbfTikP )->( eof() ) )
            dbPass( dbfTikP, dbfTmpP, .t. )
            ( dbfTikP )->( dbSkip() )
         end while
      end If

      ( dbfTmpP )->( dbGoTop() )

      /*
      A�adimos desde los vales----------------------------------------------
      */

      nRec     := ( dbfTikT )->( Recno() )
      nOrd     := ( dbfTikT )->( OrdSetFocus( "cDocVal" ) )

      if ( dbfTikT )->( dbSeek( cNumTik ) )
         while ( dbfTikT )->cValDoc == cNumTik .and. !( dbfTikT )->( eof() )
            dbPass( dbfTikT, dbfTmpV, .t. )
            ( dbfTikT )->( dbSkip() )
         end while
      end if

      ( dbfTikT )->( dbGoTo( nRec ) )
      ( dbfTikT )->( OrdSetFocus( nOrd ) )

      ( dbfTmpV )->( dbGoTop() )

   end case

   /*
   Llamada a la caja del cobro-------------------------------------------------
   */

   if lCobro( @aTmp, aGet, aTmp[ _CTIPTIK ], EDIT_MODE, @lGenVale, @nDifVale, lBig )

      /*
      Anotamos los pagos----------------------------------------------------------
      */

      if ( oTotDiv:lValeMayorTotal() )

         if aTmp[ _NCOBTIK ] != 0

            if dbAppe( dbfTmpP )
               ( dbfTmpP )->cCtaRec    := cCtaCob()
               ( dbfTmpP )->cTurPgo    := cCurSesion()
               ( dbfTmpP )->dPgoTik    := GetSysDate()
               ( dbfTmpP )->cTimTik    := SubStr( Time(), 1, 5 )
               ( dbfTmpP )->cCodCaj    := oUser():cCaja()
               ( dbfTmpP )->cFpgPgo    := aTmp[ _CFPGTIK ]
               ( dbfTmpP )->cSerTik    := aTmp[ _CSERTIK ]
               ( dbfTmpP )->cNumTik    := aTmp[ _CNUMTIK ]
               ( dbfTmpP )->cSufTik    := aTmp[ _CSUFTIK ]
               ( dbfTmpP )->nImpTik    := aTmp[ _NCOBTIK ]
               ( dbfTmpP )->cDivPgo    := aTmp[ _CDIVTIK ]
               ( dbfTmpP )->nVdvPgo    := aTmp[ _NVDVTIK ]
               ( dbfTmpP )->nDevTik    := Max( aTmp[ _NCAMTIK ], 0 )
            else
               MsgStop( "No se ha podido a�adir el registro de pago" )
            end if

         end if

      end if

      do case
      case ( dbfTikT )->cTipTik == SAVTIK .or. ( dbfTikT )->cTipTik == SAVDEV .or. ( dbfTikT )->cTipTik == SAVAPT // Como tiket

         /*
         Eliminamos los pagos--------------------------------------------------
         */

         while ( dbfTikP )->( dbSeek( cNumTik ) )
            if dbLock( dbfTikP )
               ( dbfTikP )->( dbDelete() )
               ( dbfTikP )->( dbUnLock() )
            end if
         end while

         /*
         Ahora escribimos en el fichero definitivo los pagos-------------------
         */

         ( dbfTmpP )->( dbGoTop() )
         while !( dbfTmpP )->( eof() )
            dbPass( dbfTmpP, dbfTikP, .t. )
            ( dbfTmpP )->( dbSkip() )
         end while

         /*
         Eliminamos los vales ----------------------------------------------------')
         */

         nOrd  := ( dbfTikT )->( OrdSetFocus( "cDocVal" ) )
         nRec  := ( dbfTikT )->( Recno() )

         while ( dbfTikT )->( dbSeek( cNumTik ) ) .and. !( dbfTikT )->( eof() )
            if dbLock( dbfTikT )
               ( dbfTikT )->lLiqTik := .f.
               ( dbfTikT )->lSndDoc := .t.
               ( dbfTikT )->cValDoc := ""
               ( dbfTikT )->cTurVal := ""
               ( dbfTikT )->( dbUnLock() )
            end if
         end while

         ( dbfTikT )->( OrdSetFocus( nOrd ) )
         ( dbfTikT )->( dbGoTo( nRec ) )

         /*
         Anotamos los vales ------------------------------------------------------
         */

         nRec  := ( dbfTikT )->( Recno() )

         ( dbfTmpV )->( dbGoTop() )
         while !( dbfTmpV )->( eof() )
            if ( dbfTikT )->( dbSeek( ( dbfTmpV )->cSerTik + ( dbfTmpV )->cNumTik + ( dbfTmpV )->cSufTik ) )
               if dbLock( dbfTikT )
                  ( dbfTikT )->lLiqTik := .t.
                  ( dbfTikT )->lSndDoc := .t.
                  ( dbfTikT )->cValDoc := cNumTik
                  ( dbfTikT )->cTurVal := cCurSesion()
                  ( dbfTikT )->( dbUnLock() )
               end if
            end if
            ( dbfTmpV )->( dbSkip() )
         end while

         ( dbfTikT )->( dbGoTo( nRec ) )

      case ( dbfTikT )->cTipTik == SAVFAC // Como factura

         cSerAlb     := SubStr( cNumDoc, 1, 1 )
         cNumAlb     := Val( SubStr( cNumDoc, 2, 9 ) )
         cSufAlb     := SubStr( cNumDoc, 11, 2 )

         while ( dbfFacCliP )->( dbSeek( cNumDoc ) ) .and. !( dbfFacCliP )->( eof() )
            if dbLock( dbfFacCliP )
               ( dbfFacCliP )->( dbDelete() )
               ( dbfFacCliP )->( dbUnLock() )
            end if
         end while

         /*
         Trasbase de nuevos pagos----------------------------------------------
         */

         ( dbfTmpP )->( dbGoTop() )
         while !( dbfTmpP )->( eof() )

            if dbAppe( dbfFacCliP )
               ( dbfFacCliP )->cSerie     := cSerAlb
               ( dbfFacCliP )->nNumFac    := cNumAlb
               ( dbfFacCliP )->cSufFac    := cSufAlb
               ( dbfFacCliP )->lCobrado   := .t.
               ( dbfFacCliP )->cCodCaj    := oUser():cCaja()
               ( dbfFacCliP )->cCodCli    := cCodCli
               ( dbfFacCliP )->dPreCob    := GetSysDate()
               ( dbfFacCliP )->nNumRec    := ( dbfTmpP )->( Recno() )
               ( dbfFacCliP )->dEntrada   := ( dbfTmpP )->dPgoTik
               ( dbfFacCliP )->cDivPgo    := ( dbfTmpP )->cDivPgo
               ( dbfFacCliP )->nVdvPgo    := ( dbfTmpP )->nVdvPgo
               ( dbfFacCliP )->cPgdoPor   := ( dbfTmpP )->cPgdPor
               ( dbfFacCliP )->nImporte   := nTotUCobTik( dbfTmpP )
               ( dbfFacCliP )->( dbUnLock() )
            end if

            ( dbfTmpP )->( dbSkip() )

         end while

         /*
         Quitamos los anticipos anteriores-------------------------------------
         */

         nRec  := ( dbfAntCliT )->( Recno() )
         nOrd  := ( dbfAntCliT )->( OrdSetFocus( "cNumDoc" ) )

         While ( dbfAntCliT )->( dbSeek( cNumDoc ) ) .and. !( dbfAntCliT )->( eof() )
            if dbLock( dbfAntCliT )
               ( dbfAntCliT )->lLiquidada := .f.
               ( dbfAntCliT )->dLiquidada := Ctod("")
               ( dbfAntCliT )->cTurLiq    := ""
               ( dbfAntCliT )->cCajLiq    := ""
               ( dbfAntCliT )->cNumDoc    := ""
               ( dbfAntCliT )->( dbUnLock() )
            end if
         End While

         ( dbfAntCliT )->( OrdSetFocus( nOrd ) )
         ( dbfAntCliT )->( dbGoTo( nRec ) )

         /*
         Ahora escribimos en el fichero definitivo los nuevos anticipos--------
         */

         ( dbfTmpA )->( dbGoTop() )
         while !( dbfTmpA )->( eof() )
            if ( dbfAntCliT )->( dbSeek( ( dbfTmpA )->cSerAnt + Str( ( dbfTmpA )->nNumAnt ) + ( dbfTmpA )->cSufAnt ) )
               if dbLock( dbfAntCliT )
                  ( dbfAntCliT )->lLiquidada := .t.
                  ( dbfAntCliT )->lSndDoc    := .t.
                  ( dbfAntCliT )->cNumDoc    := cNumDoc
                  ( dbfAntCliT )->dLiquidada := GetSysDate()
                  ( dbfAntCliT )->cTurLiq    := cCurSesion()
                  ( dbfAntCliT )->cCajLiq    := oUser():cCaja()
                  ( dbfAntCliT )->( dbUnLock() )
               end if
            end if
            ( dbfTmpA )->( dbSkip() )
         end while

         if dbLock( dbfFacCliT )
            ( dbfFacCliT )->lSndDoc          := .t.
            ( dbfFacCliT )->( dbUnLock() )
         end if

         /*
         Chequeamos el estado de la factura------------------------------------------
         */

         ChkLqdFacCli( nil, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfIva, dbfDiv )

      case ( dbfTikT )->cTipTik == SAVALB // Como albaran

         cSerAlb     := SubStr( cNumDoc, 1, 1 )
         cNumAlb     := Val( SubStr( cNumDoc, 2, 9 ) )
         cSufAlb     := SubStr( cNumDoc, 11, 2 )

         /*
         Rollback de los pagos-------------------------------------------------------
         */

         while ( dbfAlbCliP )->( dbSeek( cNumDoc ) ) .and. !( dbfAlbCliP )->( eof() )
            if dbLock( dbfAlbCliP )
               ( dbfAlbCliP )->( dbDelete() )
               ( dbfAlbCliP )->( dbUnLock() )
            end if
         end while

         /*
         Trasbase de nuevos pagos----------------------------------------------------
         */

         ( dbfTmpE )->( dbGoTop() )

         while !( dbfTmpE )->( eof() )

            ( dbfAlbCliP )->( dbAppend() )

            ( dbfAlbCliP )->cSerAlb    := cSerAlb
            ( dbfAlbCliP )->nNumAlb    := cNumAlb
            ( dbfAlbCliP )->cSufAlb    := cSufAlb
            ( dbfAlbCliP )->nNumRec    := ( dbfTmpE )->nNumRec
            ( dbfAlbCliP )->cCodCaj    := ( dbfTmpE )->cCodCaj
            ( dbfAlbCliP )->cTurRec    := ( dbfTmpE )->cTurRec
            ( dbfAlbCliP )->cCodCli    := ( dbfTmpE )->cCodCli
            ( dbfAlbCliP )->dEntrega   := ( dbfTmpE )->dEntrega
            ( dbfAlbCliP )->nImporte   := ( dbfTmpE )->nImporte
            ( dbfAlbCliP )->cDescrip   := ( dbfTmpE )->cDescrip
            ( dbfAlbCliP )->cPgdoPor   := ( dbfTmpE )->cPgdoPor
            ( dbfAlbCliP )->cDivPgo    := ( dbfTmpE )->cDivPgo
            ( dbfAlbCliP )->nVdvPgo    := ( dbfTmpE )->nVdvPgo
            ( dbfAlbCliP )->cCodAge    := ( dbfTmpE )->cCodAge
            ( dbfAlbCliP )->cCodPgo    := ( dbfTmpE )->cCodPgo
            ( dbfAlbCliP )->lPasado    := ( dbfTmpE )->lPasado
            ( dbfAlbCliP )->lCloPgo    := .f.

            ( dbfAlbCliP )->( dbUnLock() )

            ( dbfTmpE )->( dbSkip() )

         end while

      End Case

      /*
      Apertura de la caja------------------------------------------------------------
		*/

      if ( dbfTikT )->cTipTik != SAVALB
         oUser():OpenCajon()
      end if

      /*
      Guardamos los cambios en la cabercera del tiket--------------------------------
      */

      dbGather( aTmp, dbfTikT )

   end if

   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )

   RECOVER USING oError

      msgStop( "Imposible realizar pagos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( dbfTmpP ) .and. ( dbfTmpP )->( Used() )
      ( dbfTmpP )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpV ) .and. ( dbfTmpV )->( Used() )
      ( dbfTmpV )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpA ) .and. ( dbfTmpA )->( Used() )
      ( dbfTmpA )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpE ) .and. ( dbfTmpE )->( Used() )
      ( dbfTmpE )->( dbCloseArea() )
   end if

   dbfErase( cNewFilP )
   dbfErase( cNewFilV )
   dbfErase( cNewFilA )
   dbfErase( cNewFilE )

   if !Empty( oWndBrw )
      oWndBrw:oBrw:DrawSelect()
   end if

return nil

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//
// Guarda el ticket

Static Function TmpTiket( aTmp, aGet, nMode, lClean, lImprimirComanda )

   local oError
   local oBlock
   local nRecno
   local cNumDoc           		:= ""
   local nNumTik           	  	:= ""
   local nOrdAlb

   DEFAULT lClean          		:= .t.
   DEFAULT lImprimirComanda	  	:= .t.

   /*
   Vemos si tenemos lineas que guardar-----------------------------------------
   */

   if ( dbfTmpL )->( LastRec() ) == 0
      return .t.
   end if

   /*
   Comprobamos la fecha del documento------------------------------------------
   */

   if !lValidaOperacion( aTmp[ _DFECTIK ] )
      Return .f.
   end if

   if !Empty( aGet[ _CCLITIK ] ) .and. !aGet[ _CCLITIK ]:lValid()
      aGet[ _CCLITIK ]:SetFocus()
      return .f.
   end if

   if !Empty( aGet[ _CALMTIK ] )

      if Empty( aTmp[ _CALMTIK ] )
         aGet[ _CALMTIK ]:SetFocus()
         MsgInfo( "Almac�n no puede estar vacio" )
         return .f.
      end if

      if !( aGet[ _CALMTIK ]:lValid() )
         aGet[ _CALMTIK ]:SetFocus()
         return .f.
      end if

   end if

   /*
   Comprobamos que si el ticket es un generico y no tiene alias----------------
   */

   if !Empty( oSalaVentas )                         .and.;
      Empty( aTmp[ _CCODSALA ] )                    .and.;
      AllTrim( aTmp[ _CPNTVENTA ] ) == "Gen�rico"   .and.;
      Empty( aTmp[ _CALIASTIK ] )

      MsgStop( "No puede guardar un ticket gen�rico sin asignarle un alias." )

      RenombrarUbicacion( aTmp, aGet )

      return .f.

   end if

   /*
   Comprobamos que si el ticket es un para llevar y no tiene cliente-----------
   */

   if !Empty( oSalaVentas )                         .and.;
      Empty( aTmp[ _CCODSALA ] )                    .and.;
      AllTrim( aTmp[ _CPNTVENTA ] ) == "Llevar"     .and.;
      Empty( aTmp[ _CCLITIK ] )

      MsgStop( "No puede guardar un ticket para llevar sin asignarle un cliente." )

      return .f.

   end if

   /*
   Parar timer de impresi�n pda------------------------------------------------
   */

   StopAutoImp()

   /*
   Serie por defecto-----------------------------------------------------------
   */

   if Empty( aTmp[ _CSERTIK ] )
      aTmp[ _CSERTIK ]     := "A"
   end if

   /*
   Turno del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CTURTIK ] )
      aTmp[ _CTURTIK ]     := cCurSesion()
   end if

   if Empty( aTmp[ _CTIPTIK ] )
      aTmp[ _CTIPTIK ]     := SAVTIK
   end if

   if Empty( aTmp[ _DFECCRE ] )
      aTmp[ _DFECCRE ]     := Date()
   end if

   if Empty( aTmp[ _CTIMCRE ] )
      aTmp[ _CTIMCRE ]     := SubStr( Time(), 1, 5 )
   end if

   /*
   Inicializamos las variables de importe---------------------------------------
   */

   nTotTik                 := nTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )
   nTotPax                 := nTotTik / NotCero( aTmp[ _NNUMCOM ] )

   aTmp[ _NCAMTIK ]        := 0
   aTmp[ _NCOBTIK ]        := nTotTik

   /*
   Control de errores-------------------------------------------------------
   */

   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      oDlgTpv:Disable()

      /*
      Archivamos el tipo de venta que se ha realizado--------------------------
      */

		/*
      Grabamos el tiket--------------------------------------------------------
		*/

      do case
      case nMode == APPD_MODE

         /*
         Obtenemos el nuevo numero del Tiket-----------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText           := 'Obtenemos el nuevo n�mero'
            oMetMsg:Refresh()
         end if

         aTmp[ _CNUMTIK ]           := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
         aTmp[ _CSUFTIK ]           := RetSufEmp()
         nNumTik                    := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]

         /*
         Fechas y horas de creacon del tiket-----------------------------------
         */

         aTmp[ _CHORTIK ]           := Substr( Time(), 1, 5 )
         aTmp[ _LCLOTIK ]           := .f.

         if !Empty( oSalaVentas ) .and. IsTrue( oSalaVentas:lPuntosVenta )
            aTmp[ _CCODSALA   ]     := oSalaVentas:cSelectedSala
            aTmp[ _CPNTVENTA  ]     := oSalaVentas:cSelectedPunto
            aTmp[ _NTARIFA    ]     := oSalaVentas:nSelectedPrecio
         end if

      case nMode == EDIT_MODE

         nNumTik                    := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
         cNumDoc                    := aTmp[ _CNUMDOC ]

         /*
         Nos posicionamos en el registro a guardar-----------------------------
         */

         if !( dbfTikT )->( dbSeek( nNumTik ) )
            if !Empty( oMetMsg )
               oMetMsg:cText  := 'Ticket no encontrado'
               oMetMsg:Refresh()
            end if
         end if

         /*
         Borramos todos los registros anteriores----------------------------------
         */

         oStock:TpvCli( nNumTik, aTmp[ _CALMTIK ], .t., aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVDEV )

         /*
         Eliminamos las lineas----------------------------------------------------
         */

         if !Empty( oMetMsg )
            oMetMsg:cText     := 'Eliminando lineas'
            oMetMsg:Refresh()
         end if

         while dbSeekInOrd( nNumTik, "cNumTil", dbfTikL )
            if dbLock( dbfTikL )
               ( dbfTikL )->( dbDelete() )
               ( dbfTikL )->( dbUnLock() )
            end if
         end while

      end case

      /*
      Guardamos el tipo como tiket---------------------------------------------
      */

      if !Empty( oMetMsg )
         oMetMsg:cText        := 'Archivando lineas'
         oMetMsg:SetTotal( ( dbfTmpL )->( LastRec() ) )
      end if

      nRecno               := ( dbfTmpL )->( Recno() )

      ( dbfTmpL )->( dbGoTop() )
      while !( dbfTmpL )->( eof() )

         if !Empty( oMetMsg )
            oMetMsg:Set( ( dbfTmpL )->( Recno() ) )
         end if

         dbPass( dbfTmpL, dbfTikL, .t., aTmp[ _CSERTIK ], aTmp[ _CNUMTIK ], aTmp[ _CSUFTIK ] )

         ( dbfTmpL )->( dbSkip() )

      end while

      ( dbfTmpL )->( dbGoTo( nRecno ) )


      /*
      Escribimos definitivamente en el disco-----------------------------------
      */

      if !Empty( oMetMsg )
         oMetMsg:Set( 0 )
         oMetMsg:cText        := 'Archivando ticket'
         oMetMsg:Refresh()
      end if

      WinGather( aTmp, aGet, dbfTikT, nil, nMode, nil, lClean )

      /*
      Imprimimos la comanda----------------------------------------------------
      */

      if lImprimirComanda
         ImpresionComanda( nNumTik )
      end if

      /*
      Actualizamos el stock----------------------------------------------------
      */

      if !Empty( oMetMsg )
         oMetMsg:cText        := 'Actualizando stocks'
         oMetMsg:Refresh()
      end if

      oStock:TpvCli( nNumTik, aTmp[ _CALMTIK ], .f., aTmp[ _CTIPTIK ] == SAVVAL .or. aTmp[ _CTIPTIK ] == SAVDEV )

      /*
      Escribe los datos pendientes---------------------------------------------
      */

      dbCommitAll()

		/*
      Cerrando-----------------------------------------------------------------
		*/

      oDlgTpv:Enable()
      oDlgTpv:aEvalWhen()

   /*
   Cerrando el control de errores----------------------------------------------
   */

   RECOVER USING oError

      msgStop( "Error en la grabaci�n del ticket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Reactivamos de nuevo el timer para las impresi�nes de pda-------------------
   */

   StartAutoImp()

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function DlgPrnTicket( oBrw )

   local oDlg
   local oSelTik
   local nSelTik     := 1
   local nOrdAnt     := ( dbfTikT )->( OrdSetFocus( 1 ) )
   local nRecAnt     := ( dbfTikT )->( RecNo() )
   local oSerDes
   local cSerDes     := ( dbfTikT )->cSerTik
   local cNumDes     := Val( ( dbfTikT )->cNumTik )
   local cSufDes     := ( dbfTikT )->cSufTik
   local oSerHas
   local cSerHas     := ( dbfTikT )->cSerTik
   local cNumHas     := Val( ( dbfTikT )->cNumTik )
   local cSufHas     := ( dbfTikT )->cSufTik
   local dFecDes     := ( dbfTikT )->dFecTik
   local dFecHas     := ( dbfTikT )->dFecTik
   local lInvOrden   := .f.

   local oDatos      := TDatosImpresion():Load( dbfCajT )

   DEFINE DIALOG oDlg RESOURCE "PRNTICKET"

		REDEFINE RADIO oSelTik VAR nSelTik ;
			ID 		101, 102 ;
			ON CHANGE( ( dbfTikT )->( OrdSetFocus( nSelTik ) ) );
			OF 		oDlg

      REDEFINE GET oSerDes VAR cSerDes;
			ID 		110 ;
			WHEN 		( nSelTik == 1 ) ;
         SPINNER ;
         ON UP    ( UpSerie( oSerDes ) );
         ON DOWN  ( DwSerie( oSerDes ) );
         VALID    ( cSerDes >= "A" .AND. cSerDes <= "Z"  );
         OF       oDlg

		REDEFINE GET cNumDes;
			ID 		120 ;
         WHEN     ( nSelTik == 1 ) ;
         PICTURE  "9999999999" ;
         SPINNER ;
			OF 		oDlg

		REDEFINE GET cSufDes;
			ID 		130 ;
			WHEN 		( nSelTik == 1 ) ;
			OF 		oDlg

      REDEFINE GET oSerHas VAR cSerHas;
			ID 		140 ;
         COLOR    CLR_GET ;
         SPINNER ;
         ON UP    ( UpSerie( oSerHas ) );
         ON DOWN  ( DwSerie( oSerHas ) );
         WHEN     ( nSelTik == 1 ) ;
         VALID    ( cSerHas >= "A" .AND. cSerHas <= "Z"  );
         OF       oDlg

		REDEFINE GET cNumHas;
			ID 		150 ;
			WHEN 		( nSelTik == 1 ) ;
         PICTURE  "9999999999" ;
         SPINNER ;
         OF       oDlg

		REDEFINE GET cSufHas;
			ID 		160 ;
         WHEN     ( nSelTik == 1 ) ;
			OF 		oDlg

		REDEFINE GET dFecDes;
			ID 		170 ;
			WHEN 		( nSelTik == 2 ) ;
			OF 		oDlg

		REDEFINE GET dFecHas;
			ID 		180 ;
			WHEN 		( nSelTik == 2 ) ;
			OF 		oDlg

      /*
      Formato e impresora para tiket
      */

      REDEFINE GET oDatos:oFmtTik VAR oDatos:cFmtTik ;
         ID       251 ;
         VALID    ( cDocumento( oDatos:oFmtTik, oDatos:oSayFmtTik, dbfDoc ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwDocumento( oDatos:oFmtTik, oDatos:oSayFmtTik, "TK" ) ) ;
         OF       oDlg

      REDEFINE GET oDatos:oSayFmtTik VAR oDatos:cSayFmtTik ;
         ID       252 ;
         WHEN     ( .f. );
         OF       oDlg

      REDEFINE GET oDatos:oPrinterTik VAR oDatos:cPrinterTik;
         WHEN     ( .f. ) ;
         ID       253 ;
         OF       oDlg

      TBtnBmp():ReDefine( 254, "Printer_preferences_16",,,,,{|| PrinterPreferences( oDatos:oPrinterTik ) }, oDlg, .f., , .f.,  )

      TBtnBmp():ReDefine( 255, "Printer_pencil_16",,,,,{|| EdtDocumento( oDatos:cFmtTik ) }, oDlg, .f., , .f.,  )

      /*
      Formato e impresora para el vale
      */

      REDEFINE GET oDatos:oFmtVal VAR oDatos:cFmtVal ;
         ID       261 ;
         VALID    ( cDocumento( oDatos:oFmtVal, oDatos:oSayFmtVal, dbfDoc ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwDocumento( oDatos:oFmtVal, oDatos:oSayFmtVal, "TK" ) ) ;
         OF       oDlg

      REDEFINE GET oDatos:oSayFmtVal VAR oDatos:cSayFmtVal ;
         ID       262 ;
         WHEN     ( .f. );
         OF       oDlg

      REDEFINE GET oDatos:oPrinterVal VAR oDatos:cPrinterVal;
         WHEN     ( .f. ) ;
         ID       263 ;
         OF       oDlg

      TBtnBmp():ReDefine( 264, "Printer_preferences_16",,,,,{|| PrinterPreferences( oDatos:oPrinterVal ) }, oDlg, .f., , .f.,  )

      TBtnBmp():ReDefine( 265, "Printer_pencil_16",,,,,{|| EdtDocumento( oDatos:cFmtVal ) }, oDlg, .f., , .f.,  )

      /*
      Formato e impresora para albaranes
      */

      REDEFINE GET oDatos:oFmtAlb VAR oDatos:cFmtAlb ;
         ID       191 ;
         VALID    ( cDocumento( oDatos:oFmtAlb, oDatos:oSayFmtAlb, dbfDoc ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwDocumento( oDatos:oFmtAlb, oDatos:oSayFmtAlb, "TK" ) ) ;
         OF       oDlg

      REDEFINE GET oDatos:oSayFmtAlb VAR oDatos:cSayFmtAlb ;
         ID       192 ;
         WHEN     ( .f. );
         OF       oDlg

      REDEFINE GET oDatos:oPrinterAlb VAR oDatos:cPrinterAlb;
         WHEN     ( .f. ) ;
         ID       193 ;
         OF       oDlg

      TBtnBmp():ReDefine( 194, "Printer_preferences_16",,,,,{|| PrinterPreferences( oDatos:oPrinterAlb ) }, oDlg, .f., , .f.,  )

      TBtnBmp():ReDefine( 195, "Printer_pencil_16",,,,,{|| EdtDocumento( oDatos:cFmtAlb ) }, oDlg, .f., , .f.,  )

      /*
      Formato e impresora para facturas
      */

      REDEFINE GET oDatos:oFmtFac VAR oDatos:cFmtFac ;
         ID       201 ;
         VALID    ( cDocumento( oDatos:oFmtFac, oDatos:oSayFmtFac, dbfDoc ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwDocumento( oDatos:oFmtAlb, oDatos:oSayFmtFac, "TK" ) ) ;
         OF       oDlg

      REDEFINE GET oDatos:oSayFmtFac VAR oDatos:cSayFmtFac ;
         ID       202 ;
         WHEN     ( .f. );
         OF       oDlg

      REDEFINE GET oDatos:oPrinterFac VAR oDatos:cPrinterFac;
         WHEN     ( .f. ) ;
         ID       203 ;
         OF       oDlg

      TBtnBmp():ReDefine( 204, "Printer_preferences_16",,,,,{|| PrinterPreferences( oDatos:oPrinterFac ) }, oDlg, .f., , .f.,  )

      TBtnBmp():ReDefine( 205, "Printer_pencil_16",,,,,{|| EdtDocumento( oDatos:cFmtFac ) }, oDlg, .f., , .f.,  )


      REDEFINE CHECKBOX lInvOrden ;
         ID       500 ;
         OF       oDlg

      REDEFINE BUTTON ;
			ID 		505 ;
			OF 		oDlg ;
         ACTION   (  PrnSerTik( nSelTik, cSerDes + Str( cNumDes ) + cSufDes, cSerHas + Str( cNumHas ) + cSufHas, dFecDes, dFecHas, oDlg, lInvOrden, oDatos ),;
                     oDlg:End( IDOK ) )

		REDEFINE BUTTON ;
			ID 		510 ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| PrnSerTik( nSelTik, cSerDes + Str( cNumDes ) + cSufDes, cSerHas + Str( cNumHas ) + cSufHas, dFecDes, dFecHas, oDlg, lInvOrden, oDatos ), oDlg:End( IDOK ) } )

   oDlg:bStart := { || oSerDes:SetFocus() }

   ACTIVATE DIALOG oDlg CENTER

	( dbfTikT )->( OrdSetFocus( nOrdAnt ) )
	( dbfTikT )->( dbGoTo( nRecAnt ) )

	oBrw:refresh()

Return ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

/*
Imprime los tickets desde un punto a otro
*/

Static Function PrnSerTik( nSelTik, cNumDes, cNumHas, dFecDes, dFecHas, oDlg, lInvOrden, oDatos )

   local oBlock
   local oError
   local nOrdAnt
   local uNumDes
   local uNumHas
   local nRecAnt

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   nRecAnt           := ( dbfTikT )->( RecNo() )

   DEFAULT nSelTik   := 1
   DEFAULT cNumDes   := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik
   DEFAULT cNumHas   := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik

   if nSelTik == 1
      nOrdAnt        := ( dbfTikT )->( OrdSetFocus( "cNumTik" ) )
      uNumDes        := cNumDes
      uNumHas        := cNumHas
   else
      nOrdAnt        := ( dbfTikT )->( OrdSetFocus( "dFecTik" ) )
      uNumDes        := dFecDes
      uNumHas        := dFecHas
   end if

   if !Empty( oDlg )
      oDlg:Disable()
   end if

   if !lInvOrden

      if ( dbfTikT )->( dbSeek( uNumDes, .t. ) )

         while !( dbfTikT )->( eof())                    .AND.;
               ( dbfTikT )->( OrdKeyVal() ) >= uNumDes   .AND.;
               ( dbfTikT )->( OrdKeyVal() ) <= uNumHas

            ImpTiket( , , .t., , oDatos )

            ( dbfTikT )->( dbSkip() )

         end while

      end if

   else

      if ( dbfTikT )->( dbSeek( uNumHas ) )

         while ( dbfTikT )->( OrdKeyVal() ) >= uNumDes   .and.;
               ( dbfTikT )->( OrdKeyVal() ) <= uNumHas   .and.;
               !( dbfTikT )->( Bof() )

            ImpTiket( , , .t., , oDatos )

            ( dbfTikT )->( dbSkip( -1 ) )

         end while

      end if

   end if

   if !Empty( oDlg )
      oDlg:Enable()
   end if

   ( dbfTikT )->( dbGoTo( nRecAnt ) )
   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )

   RECOVER USING oError

   msgStop( "Error al imprimir series de tickets.")

   END SEQUENCE

   ErrorBlock( oBlock )

Return nil

//----------------------------------------------------------------------------//

FUNCTION nTotComTik( cNumTik, dbfTikT, dbfTikL, nDouDiv, nDorDiv )

   local nTotal      := 0
   local nRecno      := ( dbfTikL )->( RecNo() )

   if ( dbfTikL )->( dbSeek( cNumTik ) )

      while ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == cNumTik .AND. !( dbfTikL )->( eof() )

         if !( dbfTikL )->lFreTil .or. ( dbfTikT )->cTipTik == SAVDEV

            nTotal   += nTotLTpv( dbfTikL, nDouDiv, nDorDiv ) * ( dbfTikT )->nComAge

         end if

         ( dbftikl )->( dbskip(1) )

      end while

   end if

   ( dbfTikL )->( dbGoTo( nRecno ) )

   /*
   Total en la moneda de documento
   */

   nTotal            := Round( nTotal, nDorDiv )

Return ( nTotal )

//----------------------------------------------------------------------------//

Function aTotTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, aTmp, cDivRet, lPic, lExcCnt )

   nTotTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, aTmp, cDivRet, lPic, lExcCnt )

Return ( { nTotNet, nTotIva, nTotTik, nTotIvm, aIvaTik, aBasTik, aImpTik, aIvmTik } )

//---------------------------------------------------------------------------//

Static Function bButtonsPago( cCodPago, oGetPago )

Return ( {|| oGetPago:cText( cCodPago ), oGetPago:lValid() } )

Static Function bButtonsGrad( oButton )

   oButton:bClrGrad  := { | lInvert |  If( lInvert .or. oButton:lBtnDown, ;
                                       { { 1/3, nRGB( 255, 253, 222 ), nRGB( 255, 231, 151 ) }, ;
                                       { 2/3, nRGB( 255, 215,  84 ), nRGB( 255, 233, 162 ) }  ;
                                       }, ;
                                       { { 1/2, nRGB( 219, 230, 244 ), nRGB( 207-50, 221-25, 255 ) }, ;
                                       { 1/2, nRGB( 201-50, 217-25, 255 ), nRGB( 231, 242, 255 ) }  ;
                                       } ) }

Return ( nil )

//--------------------------------------------------------------------------//
// Devuelve el total de cobrado en un tiket
//

Function nTotLCobTik( dbfTikP, dbfDiv, cDivRet, lPic )

   local cPorDiv
   local nDorDiv
   local cCodDiv
   local nTotal      := 0

   DEFAULT lPic      := .f.

   do case
      case Valtype( dbfTikP ) == "C"
         cCodDiv     := ( dbfTikP )->cDivPgo
      case Valtype( dbfTikP ) == "O"
         cCodDiv     := dbfTikP:cDivPgo
   end case

   cPorDiv           := cPorDiv( cCodDiv, dbfDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, dbfDiv ) // Decimales de redondeo

   nTotal            := nTotUCobTik( dbfTikP, nDorDiv )

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, dbfDiv ) // Picture de la divisa redondeada
      nTotal         := nCnv2Div( nTotal, cCodDiv, cDivRet, dbfDiv )
   end if



   if lPic
      nTotal         := Trans( nTotal, cPorDiv )
   end if

Return ( nTotal )

//----------------------------------------------------------------------------//
/*
Total en vales de un ticket para impresion
*/

Function nImpValTik( cNumTik, cTikT, cTikL, cDiv, cDivRet )

   local cPorDiv
   local nDorDiv
   local nOrdAnt
   local cCodDiv
   local nRecAnt
   local nLinAnt
   local nTotTik      := 0

   DEFAULT cTikT     := dbfTikT
   DEFAULT cDiv      := dbfDiv
   DEFAULT cNumTik   := ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik

   USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @cTikL ) )
   SET INDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE

   cCodDiv           := ( cTikT )->cDivTik
   nRecAnt           := ( cTikT )->( Recno() )
   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo

   nOrdAnt           := ( cTikT )->( OrdSetFocus( "cTikVal" ) )

   if ( cTikT )->( dbSeek( cNumTik ) )

      while ( cTikT )->cTikVal == cNumTik .and. !( cTikT )->( eof() )

         nTotTik     += nTotTik( ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik, cTikT, cTikL, cDiv, nil, cDivRet, .f. )

         ( cTikT )->( dbSkip() )

      end while

   end if

   ( cTikT )->( OrdSetFocus( nOrdAnt ) )

   /*
   Reposicionamiento-----------------------------------------------------------
   */

   ( cTikT )->( dbGoTo( nRecAnt ) )
   ( cTikT )->( OrdSetFocus( nOrdAnt ) )

   ( cTikL )->( dbCloseArea() )

   /*
   El total de los vales siempre debe de ser positivo--------------------------
   */

   nTotTik            := Abs( Round( nTotTik, nDorDiv ) )

   /*
   Otras divisas---------------------------------------------------------------
   */

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
      nTotTik        := nCnv2Div( nTotTik, cCodDiv, cDivRet, cDiv )
   end if

Return ( nTotTik )

//----------------------------------------------------------------------------//

/*
Total acumulado en vales
*/

Function nImpValCli( cCliTik, cTikT, cTikL, cDiv, cDivRet )

   local cPorDiv
   local nDorDiv
   local nOrdAnt
   local cCodDiv
   local nRecAnt
   local nLinAnt
   local nTotTik      := 0

   DEFAULT cTikT     := dbfTikT
   DEFAULT cDiv      := dbfDiv
   DEFAULT cCliTik   := ( cTikT )->cCliTik

   USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @cTikL ) )
   SET INDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE

   cCodDiv           := ( cTikT )->cDivTik
   nRecAnt           := ( cTikT )->( Recno() )
   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo

   nOrdAnt           := ( cTikT )->( OrdSetFocus( "cCliVal" ) )
   if ( cTikT )->( dbSeek( cCliTik ) )

      while ( cTikT )->cCliTik == cCliTik .and. !( cTikT )->( eof() )

         nTotTik     += nTotTik( ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik, cTikT, cTikL, cDiv, nil, cDivRet, .f. )

         ( cTikT )->( dbSkip() )

      end while

   end if

   ( cTikT )->( OrdSetFocus( nOrdAnt ) )

   /*
   Reposicionamiento-----------------------------------------------------------
   */

   ( cTikT )->( dbGoTo( nRecAnt ) )
   ( cTikT )->( OrdSetFocus( nOrdAnt ) )

   ( cTikL )->( dbCloseArea() )

   /*
   El total de los vales siempre debe de ser positivo--------------------------
   */

   nTotTik            := Abs( Round( nTotTik, nDorDiv ) )

   /*
   Otras divisas---------------------------------------------------------------
   */

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
      nTotTik        := nCnv2Div( nTotTik, cCodDiv, cDivRet, cDiv )
   end if

Return ( nTotTik )

//----------------------------------------------------------------------------//

/*
Total vales de un ticket
*/

Function nTotValTik( cNumTik, cTikT, cTikL, cDiv, cDivRet, lPic )

   local cPorDiv
   local nDorDiv
   local nOrdAnt
   local cCodDiv
   local nRecAnt
   local nTotal      := 0

   DEFAULT cTikT     := dbfTikT
   DEFAULT cTikL     := dbfTikL
   DEFAULT cDiv      := dbfDiv
   DEFAULT lPic      := .f.
   DEFAULT cNumTik   := ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik

   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo

   cCodDiv           := ( cTikT )->cDivTik

   nRecAnt           := ( cTikT )->( Recno() )
   nOrdAnt           := ( cTikT )->( OrdSetFocus( "cDocVal" ) )

   if ( cTikT )->( dbSeek( cNumTik ) )

      while ( cTikT )->cValDoc == cNumTik .and. !( cTikT )->( eof() )

         nTotal      += nTotTik( ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik )

         ( cTikT )->( dbSkip() )

      end while

   end if

   ( cTikT )->( OrdSetFocus( nOrdAnt ) )
   ( cTikT )->( dbGoTo( nRecAnt ) )

   /*
   El total de los vales siempre debe de ser positivo--------------------------
   */

   nTotal            := Abs( Round( nTotal, nDorDiv ) )

   /*
   Otras divisas---------------------------------------------------------------
   */

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
      nTotal         := nCnv2Div( nTotal, cCodDiv, cDivRet, cDiv )
   end if

Return ( if( lPic, Trans( nTotal, cPorDiv ), nTotal ) )

//---------------------------------------------------------------------------//

/*
Total vales de un ticket para informes
*/

Function nTotValTikInfo( cNumTik, cTikT, cDiv, cDivRet, lPic )

   local cPorDiv
   local nDorDiv
   local nOrdAnt
   local cCodDiv
   local nRecAnt
   local nTotal      := 0
   local dbfTmpTikL

   DEFAULT cTikT     := dbfTikT
   DEFAULT cDiv      := dbfDiv
   DEFAULT lPic      := .f.
   DEFAULT cNumTik   := ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik

   /*
   Abrimos la tabla de las lineas porque el informe las va a tener con un scope
   */

   USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTmpTikL ) )
   SET INDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE
   ( dbfTmpTikL )->( OrdSetFocus( "cNumTil" ) )

   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo

   cCodDiv           := ( cTikT )->cDivTik

   nRecAnt           := ( cTikT )->( Recno() )
   nOrdAnt           := ( cTikT )->( OrdSetFocus( "cDocVal" ) )

   if ( cTikT )->( dbSeek( cNumTik ) )

      while ( cTikT )->cValDoc == cNumTik .and. !( cTikT )->( eof() )

         nTotal      += nTotTik( ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik, cTikT, dbfTmpTikL )

         ( cTikT )->( dbSkip() )

      end while

   end if

   ( cTikT )->( OrdSetFocus( nOrdAnt ) )
   ( cTikT )->( dbGoTo( nRecAnt ) )

   /*
   El total de los vales siempre debe de ser positivo--------------------------
   */

   nTotal            := Abs( Round( nTotal, nDorDiv ) )

   /*
   Otras divisas---------------------------------------------------------------
   */

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
      nTotal         := nCnv2Div( nTotal, cCodDiv, cDivRet, cDiv )
   end if

   /*
   Cerramos la tabla de lineas-------------------------------------------------
   */

   CLOSE ( dbfTmpTikL )

   dbfTmpTikL           := nil

Return ( if( lPic, Trans( nTotal, cPorDiv ), nTotal ) )

//----------------------------------------------------------------------------//

Function nTmpValTik( cTikT, cTikL, cDiv, cDivRet, lPic )

   local cPorDiv
   local nDorDiv
   local nOrdAnt
   local nTotal      := 0
   local cCodDiv     := ( cTikT )->cDivTik
   local nRecAnt     := ( cTikT )->( Recno() )

   DEFAULT cTikT     := dbfTikT
   DEFAULT cTikL     := dbfTikL
   DEFAULT cDiv      := dbfDiv
   DEFAULT lPic      := .f.

   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo

   ( cTikT )->( dbGoTop() )
   while !( cTikT )->( eof() )
      nTotal      += nTotTik( ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik, cTikT, cTikL, cDiv, nil, cDivRet, .f. )
      ( cTikT )->( dbSkip() )
   end while

   /*
   Reposicionamiento-----------------------------------------------------------
   */

   ( cTikT )->( dbGoTo( nRecAnt ) )

   /*
   El total de los vales siempre debe de ser positivo--------------------------
   */

   nTotal            := Abs( Round( nTotal, nDorDiv ) )

   /*
   Otras divisas---------------------------------------------------------------
   */

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
      nTotal         := nCnv2Div( nTotal, cCodDiv, cDivRet, cDiv )
   end if

Return ( if( lPic, Trans( nTotal, cPorDiv ), nTotal ) )

//----------------------------------------------------------------------------//


Static function BeginTrans( aTmp, aGet, nMode, lNewFile )

   local oError
   local oBlock
   local nRecAnt
   local nOrdAnt
   local lErrors        := .f.
   local cNumTik        := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
   local cSerCli

   DEFAULT lNewFile     := .t.

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   if Empty( aTmp[ _CDIVTIK ] )
      aTmp[ _CDIVTIK ]  := cDivEmp()
   end if

   /*
   Pictures--------------------------------------------------------------------
   */

   cPouDiv              := cPouDiv( aTmp[ _CDIVTIK ], dbfDiv )       // Picture de la divisa
   cPorDiv              := cPorDiv( aTmp[ _CDIVTIK ], dbfDiv )       // Picture de la divisa redondeada
   nDouDiv              := nDouDiv( aTmp[ _CDIVTIK ], dbfDiv )       // Decimales
   nDorDiv              := nRouDiv( aTmp[ _CDIVTIK ], dbfDiv )       // Decimales redondeados
   cPicEur              := cPorDiv( cDivChg(),        dbfDiv )       // Picture de la divisa equivalente

   /*
   Variable para saber si han a�adido lineas ----------------------------------
   */

   lNowAppendLine       := .f.

   /*
   Crear la base de datos local para las lineas de detalle---------------------
   */

   if lNewFile

      ( dbfTmpL )->( dbCloseArea() )
      ( dbfTmpP )->( dbCloseArea() )
      ( dbfTmpV )->( dbCloseArea() )
      ( dbfTmpA )->( dbCloseArea() )
      ( dbfTmpE )->( dbCloseArea() )
      ( dbfTmpC )->( dbCloseArea() )

      if !Empty( cNewFilL )
         dbfErase( cNewFilL )
      end if

      if !Empty( cNewFilP )
         dbfErase( cNewFilP )
      end if

      if !Empty( cNewFilV )
         dbfErase( cNewFilV )
      end if

      if !Empty( cNewFilA )
         dbfErase( cNewFilA )
      end if

      if !Empty( cNewFilE )
         dbfErase( cNewFilE )
      end if

      if !Empty( cNewFilC )
         dbfErase( cNewFilC )
      end if

      /*
      Crear la base de datos local para las lineas del ticket------------------
		*/

      cNewFilL       := cGetNewFileName( cPatTmp() + "TikL" )
      dbCreate( cNewFilL, aSqlStruct( aColTik() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilL, cCheckArea( "TikL", @dbfTmpL ), .f. )
      if !NetErr()
         ( dbfTmpL )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpL )->( OrdCreate( cNewFilL, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
      end if

      /*
      Crear la base de datos local para los pagos del ticket-------------------
		*/

      cNewFilP       := cGetNewFileName( cPatTmp() + "TikP" )
      dbCreate( cNewFilP, aSqlStruct( aPgoTik() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilP, cCheckArea( "TikP", @dbfTmpP ), .f. )
      if !NetErr()
         ( dbfTmpP )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpP )->( OrdCreate( cNewFilP, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
      end if

      /*
      Crear la base de datos local para los vales del ticket-------------------
      */

      cNewFilV       := cGetNewFileName( cPatTmp() + "TikV"  )
      dbCreate( cNewFilV, aSqlStruct( aItmTik() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilV, cCheckArea( "TikV", @dbfTmpV ), .f. )
      if !NetErr()
         ( dbfTmpV )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpV )->( OrdCreate( cNewFilV, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
      end if

      /*
      Crear la base de datos local para los anticipos del ticket---------------
      */

      cNewFilA       := cGetNewFileName( cPatTmp() + "TikA"  )
      dbCreate( cNewFilA, aSqlStruct( aItmAntCli() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilA, cCheckArea( "TikA", @dbfTmpA ), .f. )
      if !NetErr()
         ( dbfTmpA )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpA )->( OrdCreate( cNewFilA, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
      end if

      /*
      Crear la base de datos local para las entregas a cuenta de albaranes-----
      */

      cNewFilE       := cGetNewFileName( cPatTmp() + "TikE"  )
      dbCreate( cNewFilE, aSqlStruct( aItmAlbPgo() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilE, cCheckArea( "TikE", @dbfTmpE ), .f. )
      if !NetErr()
         ( dbfTmpE )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpE )->( OrdCreate( cNewFilE, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
      end if

      /*
      Crear la base de datos local para las lineas de comandas-----------------
      */

      cNewFilC       := cGetNewFileName( cPatTmp() + "TikC" )
      dbCreate( cNewFilC, aSqlStruct( aColTik() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFilC, cCheckArea( "TikC", @dbfTmpC ), .f. )
      if !NetErr()
         ( dbfTmpC )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpC )->( OrdCreate( cNewFilC, "CNUMTIL", "CSERTIL + CNUMTIL + CSUFTIL", {|| Field->cSerTil + Field->cNumTil + Field->cSufTil } ) )
      end if

   else

      ( dbfTmpL )->( __dbZap() )
      ( dbfTmpP )->( __dbZap() )
      ( dbfTmpV )->( __dbZap() )
      ( dbfTmpA )->( __dbZap() )
      ( dbfTmpE )->( __dbZap() )
      ( dbfTmpC )->( __dbZap() )

      ( dbfTmpL )->( dbGoTop() )
      ( dbfTmpP )->( dbGoTop() )
      ( dbfTmpV )->( dbGoTop() )
      ( dbfTmpA )->( dbGoTop() )
      ( dbfTmpE )->( dbGoTop() )
      ( dbfTmpC )->( dbGoTop() )

   end if

   do case
   case nMode == APPD_MODE

      lApartado                        := .f.

      /*
      Cargando los valores por defecto-----------------------------------------
		*/

      aTmp[ _LSNDDOC    ]              := .t.
      aTmp[ _LABIERTO   ]              := .t.
      aTmp[ _LPGDTIK    ]              := .f.
      aTmp[ _LCLOTIK    ]              := .f.
      aTmp[ _CTIPTIK    ]              := SAVTIK
      aTmp[ _CTURTIK    ]              := cCurSesion()
      aTmp[ _CSUFTIK    ]              := RetSufEmp()
      aTmp[ _DFECCRE    ]              := Date()
      aTmp[ _CTIMCRE    ]              := SubStr( Time(), 1, 5 )
      aTmp[ _DFECTIK    ]              := GetSysDate()
      aTmp[ _CALIASTIK  ]              := ""
      aTmp[ _CCODSALA   ]              := ""
      aTmp[ _CPNTVENTA  ]              := ""
      aTmp[ _CCLITIK    ]              := cDefCli()
      aTmp[ _CNOMTIK    ]              := RetFld( cDefCli(), dbfClient, "Titulo" )
      aTmp[ _CDIRCLI    ]              := RetFld( cDefCli(), dbfClient, "Domicilio" )
      aTmp[ _CPOBCLI    ]              := RetFld( cDefCli(), dbfClient, "Poblacion" )
      aTmp[ _CPRVCLI    ]              := RetFld( cDefCli(), dbfClient, "Provincia" )
      aTmp[ _CPOSCLI    ]              := RetFld( cDefCli(), dbfClient, "CodPostal" )
      aTmp[ _CDNICLI    ]              := RetFld( cDefCli(), dbfClient, "Nif" )

      if !Empty( RetFld( cDefCli(), dbfClient, "nTarifa" ) )
         if !Empty( aGet[ _NTARIFA ] )
            aGet[ _NTARIFA ]:cText( RetFld( cDefCli(), dbfClient, "nTarifa" ) )
         else
            aTmp[ _NTARIFA ]           := RetFld( cDefCli(), dbfClient, "nTarifa" )
         end if
      else
         aTmp[ _NTARIFA    ]           := Max( uFieldEmpresa( "nPreVta" ), 1 )
      end if

      if !Empty( aGet[ _CCLITIK ] )
         aGet[ _CCLITIK ]:cText( cDefCli() )
      end if

      if !Empty( aGet[ _CNOMTIK ] )
         aGet[ _CNOMTIK ]:cText( RetFld( cDefCli(), dbfClient, "Titulo" ) )
      end if

      cSerCli                 := RetFld( cDefCli(), dbfClient, "Serie" )

      if !Empty( aGet[ _CSERTIK ] )
         if Empty( cSerCli )
            aGet[ _CSERTIK ]:cText( cNewSer( "NTIKCLI", dbfCount ) )
         else
            aGet[ _CSERTIK ]:cText( cSerCli )
         end if
      else
         if Empty( cSerCli )
            aTmp[ _CSERTIK ]  := cNewSer( "NTIKCLI", dbfCount )
         else
            aTmp[ _CSERTIK ]  := cSerCli
         end if
      end if

      if !Empty( oGrupoSerie )
         oGrupoSerie:cPrompt  := "Serie: " + aTmp[ _CSERTIK ]
      end if

      if !Empty( aGet[ _CNCJTIK ] )
         aGet[ _CNCJTIK ]:cText( oUser():cCaja() )
      else
         aTmp[ _CNCJTIK ]     := oUser():cCaja()
      end if

      if !Empty( aGet[ _CALMTIK ] )
         aGet[ _CALMTIK ]:cText( oUser():cAlmacen() )
      else
         aTmp[ _CALMTIK ]     := oUser():cAlmacen()
      end if

      if !Empty( aGet[ _CCCJTIK ] )
         aGet[ _CCCJTIK ]:cText( cCurUsr() )
      else
         aTmp[ _CCCJTIK ]     := cCurUsr()
      end if

      if !Empty( aGet[ _CCODPRO ] )
         aGet[ _CCODPRO ]:cText( cProCnt() )
      else
         aTmp[ _CCODPRO ]     := cProCnt()
      end if

      if !Empty( aGet[ _CCODDLG ] )
         aGet[ _CCODDLG ]:cText( RetFld( cCurUsr(), dbfUsr, "cCodDlg" ) )
      else
         aTmp[ _CCODDLG ]     := RetFld( cCurUsr(), dbfUsr, "cCodDlg" )
      end if

      aTmp[ _NNUMCOM    ]     := 0

      if !Empty( aGet[ _CDTOESP ] )
         aGet[ _CDTOESP ]:cText( Padr( "General", 50 ) )
      else
         aTmp[ _CDTOESP ]     := Padr( "General", 50 )
      end if

      if !Empty( aGet[ _NDTOESP ] )
         aGet[ _NDTOESP ]:cText( 0 )
      else
         aTmp[ _NDTOESP ]     := 0
      end if

      if !Empty( aGet[ _CDPP ] )
         aGet[ _CDPP    ]:cText( Padr( "Pronto pago", 50 ) )
      else
         aTmp[ _CDPP    ]     := Padr( "Pronto pago", 50 )
      end if

      if !Empty( aGet[ _NDPP ] )
         aGet[ _NDPP    ]:cText( 0 )
      else
         aTmp[ _NDPP    ]     := 0
      end if

      if !Empty( oTotEsp )
         oTotEsp:cText( 0 )
      end if

      if !Empty( oTotDpp )
         oTotDpp:cText( 0 )
      end if

      /*
      Colocamos los valores de la sala-----------------------------------------
      */

      if !Empty( oSalaVentas ) .and. IsFalse( oSalaVentas:lPuntosVenta )
         aTmp[ _CCODSALA   ]           := oSalaVentas:cSelectedSala
         aTmp[ _CPNTVENTA  ]           := oSalaVentas:cSelectedPunto
         aTmp[ _NTARIFA    ]           := oSalaVentas:nSelectedPrecio
      end if

      if !Empty( oBtnTipoVta )
         oBtnTipoVta:cPrompt           := "Ticket"
         oBtnTipoVta:cxBmp             := "Cashier_user1_32"
      end if

   case nMode == EDIT_MODE .or. nMode == ZOOM_MODE .or. nMode == DUPL_MODE

      if nMode == DUPL_MODE
         aTmp[ _CTURTIK ]              := cCurSesion()
      end if

      lApartado                        := ( aTmp[ _CTIPTIK ] == SAVAPT .or. aTmp[ _CTIPTIK ] == SAVTIK )

      aTmp[ _LSNDDOC ]                 := .t.

      if ( dbfTikT )->cTipTik == SAVALB

         LoaAlb2Tik()

         /*
         A�adimos desde el fichero de entregas a cuenta------------------------
         */

         nRecAnt  := ( dbfAlbCliP )->( Recno() )
         nOrdAnt  := ( dbfAlbCliP )->( OrdSetFocus( "NNUMALB" ) )

         if ( dbfAlbCliP )->( dbSeek( ( dbfTikT )->cNumDoc ) )
            while ( ( dbfAlbCliP )->cSerAlb + Str( ( dbfAlbCliP )->nNumAlb ) + ( dbfAlbCliP )->cSufAlb ) == ( dbfTikT )->cNumDoc .and. !( dbfAlbCliP )->( eof() )
               dbPass( dbfAlbCliP, dbfTmpE, .t. )
               ( dbfAlbCliP )->( dbSkip() )
            end while
         end if
         ( dbfTmpE )->( dbGoTop() )

         ( dbfAlbCliP )->( OrdSetFocus( nOrdAnt ) )
         ( dbfAlbCliP )->( dbGoTo( nRecAnt ) )

      elseif ( dbfTikT )->cTipTik == SAVFAC

         if ( dbfFacCliL )->( dbSeek( ( dbfTikT )->cNumDoc ) )
            while ( ( dbfFacCliL )->cSerie + Str( ( dbfFacCliL )->nNumFac ) + ( dbfFacCliL )->cSufFac == ( dbfTikT )->cNumDoc .and. !( dbfFacCliL )->( eof() ) )

               ( dbfTmpL )->( dbAppend() )
               ( dbfTmpL )->cCbaTil    := ( dbfFacCliL )->cRef
               ( dbfTmpL )->cNomTil    := ( dbfFacCliL )->cDetalle
               ( dbfTmpL )->nPvpTil    := ( dbfFacCliL )->nPreUnit // ( ( dbfFacCliL )->NPREUNIT * ( dbfFacCliL )->NIVA / 100 ) + ( dbfFacCliL )->NPREUNIT
               ( dbfTmpL )->nDtoLin    := ( dbfFacCliL )->nDto
               ( dbfTmpL )->nIvaTil    := ( dbfFacCliL )->nIva
               ( dbfTmpL )->cCodPr1    := ( dbfFacCliL )->cCodPr1
               ( dbfTmpL )->cCodPr2    := ( dbfFacCliL )->cCodPr2
               ( dbfTmpL )->cValPr1    := ( dbfFacCliL )->cValPr1
               ( dbfTmpL )->cValPr2    := ( dbfFacCliL )->cValPr2
               ( dbfTmpL )->nFacCnv    := ( dbfFacCliL )->nFacCnv
               ( dbfTmpL )->nDtoDiv    := ( dbfFacCliL )->nDtoDiv
               ( dbfTmpL )->nCtlStk    := ( dbfFacCliL )->nCtlStk
               ( dbfTmpL )->nValImp    := ( dbfFacCliL )->nValImp
               ( dbfTmpL )->cCodImp    := ( dbfFacCliL )->cCodImp
               ( dbfTmpL )->mNumSer    := ( dbfFacCliL )->mNumSer
               ( dbfTmpL )->nUntTil    := nTotNFacCli( dbfFacCliL )
               ( dbfTmpL )->( dbUnLock() )

               ( dbfFacCliL )->( dbSkip() )

            end while
         end if
         ( dbfTmpL )->( dbGoTop() )

         /*
         Importamos los pagos--------------------------------------------------------
         */

         if ( dbfFacCliP )->( dbSeek( ( dbfTikT )->cNumDoc ) )

            while ( dbfFacCliP )->cSerie + Str( ( dbfFacCliP )->nNumFac ) + ( dbfFacCliP )->cSufFac == ( dbfTikT )->cNumDoc .and. !( dbfFacCliP )->( eof() )

               if ( dbfFacCliP )->lCobrado
                  ( dbfTmpP )->( dbAppend() )
                  ( dbfTmpP )->cCodCaj    := ( dbfFacCliP )->cCodCaj
                  ( dbfTmpP )->dPgoTik    := ( dbfFacCliP )->dEntrada
                  ( dbfTmpP )->nImpTik    := ( dbfFacCliP )->nImporte
                  ( dbfTmpP )->cDivPgo    := ( dbfFacCliP )->cDivPgo
                  ( dbfTmpP )->nVdvPgo    := ( dbfFacCliP )->nVdvPgo
                  ( dbfTmpP )->cPgdPor    := ( dbfFacCliP )->cPgdoPor
                  ( dbfTmpP )->cTurPgo    := ( dbfFacCliP )->cTurRec
                  ( dbfTmpP )->cCtaRec    := ( dbfFacCliP )->cCtaRec
                  ( dbfTmpP )->cFpgPgo    := ( dbfFacCliP )->cCodPgo
               end if

               ( dbfFacCliP )->( dbSkip() )

            end while

         end if

         /*
         A�adimos desde el fichero de Anticipos-----------------------------------
         */

         nRecAnt  := ( dbfAntCliT )->( Recno() )
         nOrdAnt  := ( dbfAntCliT )->( OrdSetFocus( "cNumDoc" ) )

         if ( dbfAntCliT )->( dbSeek( ( dbfTikT )->cNumDoc ) )
            while ( dbfAntCliT )->cNumDoc == ( dbfTikT )->cNumDoc .and. !( dbfAntCliT )->( eof() )
               dbPass( dbfAntCliT, dbfTmpA, .t. )
               ( dbfAntCliT )->( dbSkip() )
            end while
         end if
         ( dbfTmpA )->( dbGoTop() )

         ( dbfAntCliT )->( OrdSetFocus( nOrdAnt ) )
         ( dbfAntCliT )->( dbGoTo( nRecAnt ) )

      else

         /*
         A�adimos desde el fichero de lineas-----------------------------------
         */

         if ( dbfTikL )->( dbSeek( cNumTik ) )
            while ( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == cNumTik .AND. !( dbfTikL )->( eof() ) )
               dbPass( dbfTikL, dbfTmpL, .t. )
               ( dbfTikL )->( dbSkip() )
            end while
         end if

         ( dbfTmpL )->( dbGoTop() )

         /*
         A�adimos desde el fichero de PAGOS---------------------------------------
         */

         if ( dbfTikP )->( dbSeek( cNumTik ) )
            while ( ( dbfTikP )->cSerTik + ( dbfTikP )->cNumTik + ( dbfTikP )->cSufTik == cNumTik .AND. !( dbfTikP )->( eof() ) )
               dbPass( dbfTikP, dbfTmpP, .t. )
               ( dbfTikP )->( dbSkip() )
            end while
         end if

         ( dbfTmpP )->( dbGoTop() )

         /*
         A�adimos desde los vales----------------------------------------------
         */

         nRecAnt     := ( dbfTikT )->( Recno() )
         nOrdAnt     := ( dbfTikT )->( OrdSetFocus( "cDocVal" ) )

         if ( dbfTikT )->( dbSeek( cNumTik ) )
            while ( dbfTikT )->cValDoc == cNumTik .and. !( dbfTikT )->( eof() )
               dbPass( dbfTikT, dbfTmpV, .t. )
               ( dbfTikT )->( dbSkip() )
            end while
         end if

         ( dbfTikT )->( dbGoTo( nRecAnt ) )
         ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )

         ( dbfTmpV )->( dbGoTop() )

         /*
         Creamos un ponto de venta---------------------------------------------
         */

         oSalaVentas:SetSalaVta( aTmp, dbfTikT )

      end if

   end case

   /*
   Desabilitamos los botones de up y down para el caso del tactil--------------
   */

   if !Empty( oBtnUp ) .and. !Empty( oBtnDown )
      oBtnUp:lEnabled   := ( nMode == EDIT_MODE .or. nMode == ZOOM_MODE )
      oBtnDown:lEnabled := ( nMode == EDIT_MODE .or. nMode == ZOOM_MODE )
   end if

   /*
   Cargamos valores en la OfficeBar para el caso del t�ctil--------------------
   */

   cTextoOfficeBar( aTmp )

   /*
   Este valor los guaradamos para detectar los posibles cambios----------------
   */

   cOldCodCli           := aTmp[ _CCLITIK ]

   /*
   Etiquetas-------------------------------------------------------------------
   */

   if !Empty( aGetTxt )
      aGetTxt[ 1 ]      := RetFld( aTmp[ _CNCJTIK ], dbfCajT )
      aGetTxt[ 2 ]      := RetFld( aTmp[ _CALMTIK ], dbfAlm )
      aGetTxt[ 3 ]      := RetFld( aTmp[ _CFPGTIK ], dbfFPago )
      aGetTxt[ 5 ]      := RetFld( aTmp[ _CCLITIK ] + aTmp[ _CCODOBR ], dbfObrasT, "cNomObr" )
      aGetTxt[ 6 ]      := RetFld( aTmp[ _CCODAGE ], dbfAgent )
      aGetTxt[ 7 ]      := RetFld( aTmp[ _CCODRUT ], dbfRuta )
      aGetTxt[ 8 ]      := RetFld( aTmp[ _CCODTAR ], dbfTarPreS )
      aGetTxt[ 9 ]      := RetFld( aTmp[ _CCLITIK ], dbfClient,   "Telefono" )
      aGetTxt[ 10]      := RetFld( aTmp[ _CCCJTIK ], dbfUsr,      "cNbrUse" )
   end if

   if oRieCli != nil
      GetRiesgo( aTmp[ _CCLITIK ], dbfClient, oRieCli )
   end if

   /*
   Marca para saber si el tiket se guardo previamente--------------------------
   */

   lSave                := .f.

   /*
   if !Empty( ( dbfUsr )->cImagen )
      oBmpVis:LoadBmp( cFileBmpName( ( dbfUsr )->cImagen ) )
   end if
   */

   /*
   Refrescamos el browse-------------------------------------------------------
   */

   if !Empty( oBrwDet )
      oBrwDet:Refresh()
   end if

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible crear tablas temporales." )

      KillTrans()

      lErrors     := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lErrors )

//---------------------------------------------------------------------------//

Static Function KillTrans( oBrwPgo, oBrwVal )

   if !Empty( dbfTmpL ) .and. ( dbfTmpL )->( Used() )
      ( dbfTmpL )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpP ) .and. ( dbfTmpP )->( Used() )
      ( dbfTmpP )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpV ) .and. ( dbfTmpV )->( Used() )
      ( dbfTmpV )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpA ) .and. ( dbfTmpA )->( Used() )
      ( dbfTmpA )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpE ) .and. ( dbfTmpE )->( Used() )
      ( dbfTmpE )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpC ) .and. ( dbfTmpC )->( Used() )
      ( dbfTmpC )->( dbCloseArea() )
   end if

   dbfErase( cNewFilL )
   dbfErase( cNewFilP )
   dbfErase( cNewFilV )
   dbfErase( cNewFilA )
   dbfErase( cNewFilE )
   dbfErase( cNewFilC )

   oOfficeBar  := nil

   dbfTmpL     := nil
   dbfTmpP     := nil
   dbfTmpV     := nil
   dbfTmpA     := nil
   dbfTmpE     := nil
   dbfTmpC     := nil

Return .T.

//---------------------------------------------------------------------------//

Static Function ClickOnBrowse( nRow, aTmp, aGet, oBrwDet )

   local nBrwHeight

   nBrwHeight        := oBrwDet:HeaderHeight() + ( oBrwDet:nRowHeight * oBrwDet:nDataRows )

   if !( nRow < nBrwHeight )

      AppDetRec( oBrwDet, bEditL, aTmp, cPorDiv, cPicEur )

      aGet[ _CCLITIK ]:SetFocus()

   end if

Return ( .t. )

//---------------------------------------------------------------------------//

#else

Static Function BeginTrans( aTmp, aGet, nMode )

   local oError
   local oBlock
   local nRecAnt
   local nOrdAnt
   local lErrors        := .f.
   local cNumTik        := ""

   if nMode != APPD_MODE
      cNumTik           := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
   end if

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   /*
   Crear la base de datos local para las lineas de detalle---------------------
   */

   ( dbfTmpL )->( dbCloseArea() )

   if !Empty( cNewFilL )
      dbfErase( cNewFilL )
   end if

   cNewFilL       := cGetNewFileName( cPatTmp() + "TikL" )
   dbCreate( cNewFilL, aSqlStruct( aColTik() ), cLocalDriver() )
   dbUseArea( .t., cLocalDriver(), cNewFilL, cCheckArea( "TikL", @dbfTmpL ), .f. )
   if !NetErr()
      ( dbfTmpL )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfTmpL )->( OrdCreate( cNewFilL, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
   end if

   /*
   A�adimos desde el fichero de lineas-----------------------------------
   */

   if ( dbfTikL )->( dbSeek( cNumTik ) )
      while ( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == cNumTik .AND. !( dbfTikL )->( eof() ) )
         dbPass( dbfTikL, dbfTmpL, .t. )
         ( dbfTikL )->( dbSkip() )
      end while
   end if

   ( dbfTmpL )->( dbGoTop() )

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible crear tablas temporales." )

      KillTrans()

      lErrors     := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lErrors )

//---------------------------------------------------------------------------//

Static Function KillTrans()

   if !Empty( dbfTmpL ) .and. ( dbfTmpL )->( Used() )
      ( dbfTmpL )->( dbCloseArea() )
   end if

   dbfErase( cNewFilL )

Return .T.

//---------------------------------------------------------------------------//

#endif

//---------------------------------------------------------------------------//

#ifndef __PDA__

/*
Funcion Auxiliar para A�adir lineas de detalle
*/

STATIC FUNCTION AppDetRec( oBrw, bEditL, aTmp, cPorDiv, cPicEur, cCodArt )

   SysRefresh()

   if lStopEntContLine
      lStopEntContLine  := .f.
      return ( lRecTotal( aTmp ) )
   end if

   if Empty( aTmp[ _NTARIFA ] )
      aTmp[ _NTARIFA ]  := Max( uFieldEmpresa( "nPreVta" ), 1 )
   end if

   /*
   Variable para saber si han a�adido lineas ----------------------------------
   */

   lNowAppendLine       := .t.

   while WinAppRec( oBrw, bEditL, dbfTmpL, , cCodArt, aTmp )

      sysrefresh()

      if !Empty( cCodArt )
         cCodArt        := nil
      end if

      sysrefresh()

   end while

RETURN ( lRecTotal( aTmp ) )

//--------------------------------------------------------------------------//
/*
Edita las lineas de detalle
*/

STATIC FUNCTION EdtDet( aTmp, aGet, dbfTmpL, oBrw, bWhen, cCodArt, nMode, aTik )

   local n
   local oCol
   local aPos
	local oBtn
   local lTwo              := .f.
   local nTop
   local nLeft
   local nWidth
   local nHeight
   local oBtnSer
   local oGetTotal
	local nGetTotal			:= 0
   local lMsgVta           := .f.
   local lNotVta           := .f.
   local cName
   local nCaptura

   /*
   Posiones donde colocar el dialogo y valores por defecto---------------------
   */

   if nMode == APPD_MODE

      if !Empty( oBrw )
         oBrw:GoBottom()
      end if

      aTmp[ _NUNTTIL ]     := 1
      aTmp[ _NMEDUNO ]     := 0
      aTmp[ _NMEDDOS ]     := 0
      aTmp[ _NMEDTRE ]     := 0
      aTmp[ _CNUMTIL ]     := aTik[ _CNUMTIK ]
      aTmp[ _CALMLIN ]     := aTik[ _CALMTIK ]
      aTmp[ _NNUMLIN ]     := nLastNum( dbfTmpL )
      aTmp[ _NIVATIL ]     := nIva( dbfIva, cDefIva() )

      if ( dbfTmpL )->( eof() )
         nTop              := ( ( oBrw:nRowSel - 1 ) * oBrw:nRowHeight ) + oBrw:HeaderHeight() - 1
      else
         nTop              := ( ( oBrw:nRowSel ) * oBrw:nRowHeight ) + oBrw:HeaderHeight() - 1
      end if

      if !Empty( cCodArt )
         aTmp[ _CCBATIL ]  := cCodArt
      end if

   else

      nTop                 := ( ( oBrw:nRowSel - 1 ) * oBrw:nRowHeight ) + oBrw:HeaderHeight() - 1

   end if

   /*
   Calculamos las posiones-----------------------------------------------------
   */

   nLeft                   := 25

   aPos                    := { nTop, nLeft }
   aPos                    := ClientToScreen( oBrw:hWnd, aPos )

   nTop                    := aPos[ 1 ]
   nLeft                   := aPos[ 2 ]
   nHeight                 := oBrw:nRowHeight + nTop
   nWidth                  := oBrw:BrwWidth() + nLeft - 15

   /*
   Este valor los guaradamos para detectar los posibles cambios----------------
   */

   cOldCodArt              := aTmp[ _CCBATIL ]
   cOldPrpArt              := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]

   /*
   Caja de dialogo-------------------------------------------------------------
   */

   DEFINE DIALOG  oDlgDet ;
      FROM        nTop, nLeft TO nHeight, nWidth ;
      STYLE       nOR( WS_VISIBLE, WS_POPUP, 4 ) ;
      OF          oBrw ;
      PIXEL ;

      for each oCol in oBrw:aCols

         cName       := oCol:Cargo[ 1 ]
         nCaptura    := oCol:Cargo[ 2 ]

         do case
            case cName == "C�digo del art�culo"

               @ 0, 0 GET  aGet[ _CCBATIL ] VAR aTmp[ _CCBATIL ] ;
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           WHEN     ( nMode == APPD_MODE ) ;
                           BITMAP   "LUPA" ;
                           PICTURE  "@!" ;
                           OF       oDlgDet

               aGet[ _CCBATIL ]:bLostFocus         := {|| LoaArt( aGet, aTmp, oBrw, oGetTotal, aTik, lTwo, nMode, oDlgDet, @lMsgVta, @lNotVta ) }
               aGet[ _CCBATIL ]:bHelp              := {|| SetLostFocusOff(), BrwArticulo( aGet[ _CCBATIL ], aGet[ _CNOMTIL ] ), SetLostFocusOn() }
               aGet[ _CCBATIL ]:bValid             := {|| lCodigoArticulo( aGet, aTmp, .t. ) }

               do case
               case nCaptura == 1
                  aGet[ _CCBATIL ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _CCBATIL ]:bValid          := {|| lCodigoArticulo( aGet, aTmp, .t. ) }
               case nCaptura == 3
                  aGet[ _CCBATIL ]:lNeedGetFocus   := .t.
               end if

               aGet[ _CCBATIL ]:Cargo              := "C�digo del art�culo"

            case cName == "Unidades"

               @ 0, 0 GET  aGet[ _NUNTTIL ] VAR aTmp[ _NUNTTIL ] ;
                           NOBORDER ;
                           PICTURE  cPicUnd ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NUNTTIL ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NUNTTIL ]:bValid          := {|| !Empty( aTmp[ _NUNTTIL ] ) }
               case nCaptura == 3
                  aGet[ _NUNTTIL ]:lNeedGetFocus   := .t.
               end if

               aGet[ _NUNTTIL ]:Cargo              := "Unidades"

            case cName == "Medici�n 1"

               @ 0, 0 GET  aGet[ _NMEDUNO ] VAR aTmp[ _NMEDUNO ] ;
                           NOBORDER ;
                           PICTURE  cPicUnd ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NMEDUNO ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NMEDUNO ]:bValid          := {|| .t. }
               case nCaptura == 3
                  aGet[ _NMEDUNO ]:lNeedGetFocus   := .t.
               end if

               aGet[ _NMEDUNO ]:Cargo              := "Medici�n 1"

            case cName == "Medici�n 2"

               @ 0, 0 GET  aGet[ _NMEDDOS ] VAR aTmp[ _NMEDDOS ] ;
                           NOBORDER ;
                           PICTURE  cPicUnd ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NMEDDOS ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NMEDDOS ]:bValid          := {|| .t. }
               case nCaptura == 3
                  aGet[ _NMEDDOS ]:lNeedGetFocus   := .t.
               end if

               aGet[ _NMEDDOS ]:Cargo              := "Medici�n 2"

            case cName == "Medici�n 3"

               @ 0, 0 GET  aGet[ _NMEDTRE ] VAR aTmp[ _NMEDTRE ] ;
                           NOBORDER ;
                           PICTURE  cPicUnd ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NMEDTRE ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NMEDTRE ]:bValid          := {|| .t. }
               case nCaptura == 3
                  aGet[ _NMEDTRE ]:lNeedGetFocus   := .t.
               end if

               aGet[ _NMEDTRE ]:Cargo              := "Medici�n 3"

            case cName == "Propiedad 1"

               @ 0, 0 GET  aGet[ _CVALPR1 ] VAR aTmp[ _CVALPR1 ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           PICTURE  "@!" ;
                           WHEN     ( !Empty( aTmp[ _CCODPR1 ] ) .and. lUsePrp1() ) ;
                           VALID    ( if( lPrpAct( aTmp[ _CVALPR1 ], nil, aTmp[ _CCODPR1 ], dbfTblPro ),;
                                          LoaArt( aGet, aTmp, oBrw, oGetTotal, aTik, lTwo, nMode, oDlgDet, @lMsgVta, @lNotVta ),;
                                          .f. ) );
                           BITMAP   "LUPA" ;
                           OF       oDlgDet

               aGet[ _CVALPR1 ]:bHelp              := {|| SetLostFocusOff(), brwPrpAct( aGet[ _CVALPR1 ], nil, aTmp[ _CCODPR1 ] ), SetLostFocusOn() }

               do case
               case nCaptura == 1
                  aGet[ _CVALPR1 ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _CVALPR1 ]:bWhen           := {|| .t. } //!Empty( aTmp[ _CCODPR1 ] ) }
               case nCaptura == 3
                  aGet[ _CVALPR1 ]:lNeedGetFocus   := .t.
               end case

            case cName == "Propiedad 2"

               @ 0, 0 GET  aGet[ _CVALPR2 ] VAR aTmp[ _CVALPR2 ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           PICTURE  "@!" ;
                           WHEN     ( !Empty( aTmp[ _CCODPR2 ] ) .and. lUsePrp2() ) ;
                           VALID    ( if( lPrpAct( aTmp[ _CVALPR2 ], nil, aTmp[ _CCODPR2 ], dbfTblPro ),;
                                          LoaArt( aGet, aTmp, oBrw, oGetTotal, aTik, lTwo, nMode, oDlgDet, @lMsgVta, @lNotVta ),;
                                          .f. ) );
                           BITMAP   "LUPA" ;
                           OF       oDlgDet

               aGet[ _CVALPR2 ]:bHelp              := {|| SetLostFocusOff(), brwPrpAct( aGet[ _CVALPR2 ], nil, aTmp[ _CCODPR2 ] ), SetLostFocusOn() }

               do case
               case nCaptura == 1
                  aGet[ _CVALPR2 ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _CVALPR2 ]:bWhen           := {|| .t. } // !Empty( aTmp[ _CCODPR2 ] ) }
               case nCaptura == 3
                  aGet[ _CVALPR2 ]:lNeedGetFocus   := .t.
               end case

            case cName == "Lote"

               @ 0, 0 GET  aGet[ _CLOTE ] VAR aTmp[ _CLOTE ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           RIGHT ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _CLOTE ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _CLOTE ]:bWhen           := {|| !Empty( aTmp[ _CLOTE ] ) }
               case nCaptura == 3
                  aGet[ _CLOTE ]:lNeedGetFocus   := .t.
               end case

            case cName == "Detalle"

               @ 0, 0 GET  aGet[ _CNOMTIL ] VAR aTmp[ _CNOMTIL ] ;
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           WHEN     ( lModDes() ) ;
                           VALID    ( .t. );
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _CNOMTIL ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _CNOMTIL ]:bWhen           := {|| lModDes() .or. Empty( aTmp[ _CNOMTIL ] ) }
               case nCaptura == 3
                  aGet[ _CNOMTIL ]:lNeedGetFocus   := .t.
               end case

            case cName == "Importe"

               @ 0, 0 GET  aGet[ _NPVPTIL ] VAR aTmp[ _NPVPTIL ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           PICTURE  cPouDiv ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NPVPTIL ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NPVPTIL ]:bWhen           := {|| Empty( aTmp[ _NPVPTIL ] ) }
               case nCaptura == 3
                  aGet[ _NPVPTIL ]:lNeedGetFocus   := .t.
               end if

            case cName == "Descuento lineal"

               @ 0, 0 GET  aGet[ _NDTODIV ] VAR aTmp[ _NDTODIV ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           PICTURE  cPouDiv ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           COLOR    Rgb( 255, 0, 0 ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NDTODIV ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NDTODIV ]:bWhen           := {|| Empty( aTmp[ _NDTODIV ] ) }
               case nCaptura == 3
                  aGet[ _NDTODIV ]:lNeedGetFocus   := .t.
               end if

            case cName == "Descuento porcentual"

               @ 0, 0 GET  aGet[ _NDTOLIN ] VAR aTmp[ _NDTOLIN ];
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           PICTURE  "@E 999.99" ;
                           RIGHT ;
                           ON CHANGE( lCalcDeta( aTmp, oGetTotal ) ) ;
                           OF       oDlgDet

               do case
               case nCaptura == 1
                  aGet[ _NDTOLIN ]:bWhen           := {|| .f. }
               case nCaptura == 2
                  aGet[ _NDTOLIN ]:bWhen           := {|| Empty( aTmp[ _NDTOLIN ] ) }
               case nCaptura == 3
                  aGet[ _NDTOLIN ]:lNeedGetFocus   := .t.
               end if

            case cName == "Total"

               @ 0, 0 GET  oGetTotal VAR nGetTotal;
                           NOBORDER ;
                           FONT     oBrw:oFont ;
                           WHEN     .f. ;
                           PICTURE  cPorDiv ;
                           RIGHT ;
                           OF       oDlgDet

            case cName == "N�mero de serie"

               @ 0, 0 BUTTON oBtnSer ;
                           PROMPT   ( "&Series" );
                           FONT     oBrw:oFont ;
                           ACTION   ( SetLostFocusOff(), aTmp[ _MNUMSER ] := EdtNumSer( aTmp[ _MNUMSER ], aTmp[ _NUNTTIL ], nMode ),SetLostFocusOn() ) ;
                           OF       oDlgDet

            case cName == "Promoci�n"

               @ 0, 0 BITMAP aGet[ _LINPROMO ] ;
                           RESOURCE "Star_Red_16";
                           NOBORDER ;
                           SIZE     16, 16 ;
                           OF       oDlgDet

               aGet[ _LINPROMO ]:lTransparent   := .t.

            case cName == "N�mero de l�nea"

               @ 0, 0 GET  aGet[ _NNUMLIN ] VAR aTmp[ _NNUMLIN ];
                           NOBORDER ;
                           WHEN     .f. ;
                           FONT     oBrw:oFont ;
                           PICTURE  "9999" ;
                           RIGHT ;
                           OF       oDlgDet

         end case

      next

      // Botones ocultos__________________________________________________________

      @ 0, 0 BUTTON  oBtn ;
                     PROMPT   ( if( nMode == APPD_MODE, "&A", "&M" ) );
                     FONT     oBrw:oFont ;
                     WHEN     ( nMode != ZOOM_MODE ) ;
                     ACTION   ( SavLine( aTmp, aGet, dbfTmpL, oBrw, aTik, oGetTotal, lTwo, nMode, oBtn, cPorDiv, cPicEur, lMsgVta, lNotVta, cCodArt, oBtnSer ) ) ;
                     OF       oDlgDet

      oDlgDet:AddFastKey( VK_F11, {|| GetPesoBalanza( aGet, oBtn ) } )

      oDlgDet:bKeyDown        := { | nKey | EdtDetKeyDown( nKey, aGet, oDlgDet, oBtn ) }
      oDlgDet:bStart          := { || SetDlgMode( oDlgDet, aTmp, aGet, nMode, oBrw, oBtn, nTop, nLeft, nHeight, nWidth ) }

      oDlgDet:bLostFocus      := { || DlgLostFocus( nMode, aTmp ) }

      SetLostFocusOn()

   oDlgDet:Activate( , , , .f., , .t. )

   oBrw:SetFocus()
   oBrw:Refresh()

RETURN ( oDlgDet:nResult == IDOK )

//-------------------------------------------------------------------------//

static function SetDlgMode( oDlg, aTmp, aGet, nMode, oBrw, oBtn ) // , nTop, nLeft, nHeight, nWidth )

   local n
   local oCtl
   local nRow
   local nCol
   local nWidth
   local nHeight
   local nGWidth  := 25

   // oDlg:Move( nTop, nLeft, nWidth + nHeight, nHeight )

   for n := 1 to len( oDlg:aControls ) - 1

      nRow        := 3 //( ( oBrw:nRowSel - 1 ) * oBrw:nRowHeight ) // + oBrw:HeaderHeight() + 4
      nCol        := oBrw:aCols[ n ]:nDisplayCol - 25
      nWidth      := oBrw:aCols[ n ]:nWidth - 2
      nHeight     := oBrw:nRowHeight - 4

      nGWidth     += oBrw:aCols[ n ]:nWidth - 1

      oDlg:aControls[ n ]:Move( nRow, nCol, nWidth, nHeight, .t. )

   next

   oBtn:Move( nRow, nGWidth, nHeight + 4, nHeight + 4, .t. )

   if Empty( aTmp[ _NPVPTIL ] ) .or. oUser():lAdministrador() .or. oUser():lCambiarPrecio()
      if( !Empty( aGet[ _NPVPTIL ] ), aGet[ _NPVPTIL ]:HardEnable(), )
      if( !Empty( aGet[ _NDTODIV ] ), aGet[ _NDTODIV ]:HardEnable(), )
      if( !Empty( aGet[ _NDTOLIN ] ), aGet[ _NDTOLIN ]:HardEnable(), )
   else
      if( !Empty( aGet[ _NPVPTIL ] ), aGet[ _NPVPTIL ]:HardDisable(), )
      if( !Empty( aGet[ _NDTODIV ] ), aGet[ _NDTODIV ]:HardDisable(), )
      if( !Empty( aGet[ _NDTOLIN ] ), aGet[ _NDTOLIN ]:HardDisable(), )
   end if

   if !Empty( aGet[ _LINPROMO ] )

      if aTmp[ _LINPROMO ]
         aGet[ _LINPROMO ]:Show()
      else
         aGet[ _LINPROMO ]:Hide()
      end if

   end if

   /*
   Control de capturas---------------------------------------------------------
   */

   for each oCtl in oDlg:aControls

      if !Empty( oCtl ) .and. oCtl:ClassName == "TGETHLP"

         if Empty( oCtl:bWhen ) .or. Eval( oCtl:bWhen )

            if oCtl:lNeedGetFocus .and. !oCtl:lGotFocus

               oCtl:SetFocus()

               Return .t.

            end if

         end if

      end if

   next

return .t.

//------------------------------------------------------------------------//
/*
Calcula totales en las lineas de Detalle
*/

Static Function lCalcDeta( aTmp, oTotal )

   local nCalculo := aTmp[ _NPVPTIL ]
   nCalculo       *= aTmp[ _NUNTTIL ]

	IF aTmp[ _NDTOLIN ] != 0
		nCalculo 	-= nCalculo * aTmp[ _NDTOLIN ] / 100
	END IF

   nCalculo       -= aTmp[ _NDTODIV ]

	oTotal:cText( nCalculo )

Return .T.

//-------------------------------------------------------------------------//

Static Function EdtDetKeyDown( nKey, aGet, oDlg, oBtn )

   do case
      case nKey == VK_ESCAPE

         oDlg:End()

      case nKey == VK_RETURN

         oBtn:Click()

      case nKey == VK_F5

         if !Empty( aGet[ _CCBATIL ]:VarGet() )

            Eval( oBtn:bAction )

         else

            oDlg:End()

            if !Empty( oBtnTik:bWhen ) .and. Eval( oBtnTik:bWhen )
               Eval( oBtnTik:bAction )
            end if

         end if

      case nKey == VK_F7

         if !Empty( aGet[ _CCBATIL ]:VarGet() )

            Eval( oBtn:bAction )

         else

            oDlg:End()

            if !Empty( oBtnAlb:bWhen ) .and. Eval( oBtnAlb:bWhen )
               Eval( oBtnAlb:bAction )
            end if

         end if

      case nKey == VK_F8

         if !Empty( aGet[ _CCBATIL ]:VarGet() )

            Eval( oBtn:bAction )

         else

            oDlg:End()

            if !Empty( oBtnFac:bWhen ) .and. Eval( oBtnFac:bWhen )
               Eval( oBtnFac:bAction )
            end if

         end if

      case nKey == VK_F9

         if !Empty( aGet[ _CCBATIL ]:VarGet() )

            Eval( oBtn:bAction )

         else

            oDlg:End()

            if !Empty( oBtnApt:bWhen ) .and. Eval( oBtnApt:bWhen )
               Eval( oBtnApt:bAction )
            end if

         end if

      case nKey == 65 .and. GetKeyState( VK_CONTROL )

         SetLostFocusOff()
         CreateInfoArticulo()
         SetLostFocusOn()

   end case

Return nil

//-------------------------------------------------------------------------//

/*
Archiva la linea de TPV
*/

STATIC FUNCTION SavLine( aTmp, aGet, dbfTmpL, oBrw, aTik, oGetTotal, lTwo, nMode, oBtn, cPorDiv, cPicEur, lMsgVta, lNotVta, cCodArt, oBtnSer )

   local lOk
   local oCtl
   local aClo
   local aXbYStr
   local nStockActual

   aClo                 := aClone( aTmp )

   /*
   Esto es para las validaciones-----------------------------------------------
   */

   oBtn:SetFocus()

   /*
   Comprobamos todas las lineas de detalle tengan precio y unidades------------
	*/

   if !Empty( aGet[ _NPVPTIL ] )
      aGet[ _NPVPTIL ]:Refresh()
   end if

   if !Empty( aGet[ _NUNTTIL ] )
      aGet[ _NUNTTIL ]:Refresh()
   end if

   /*
   Control de capturas---------------------------------------------------------
   */

   for each oCtl in oDlgDet:aControls

      if !Empty( oCtl ) .and. oCtl:ClassName == "TGETHLP"

         if Empty( oCtl:bWhen ) .or. Eval( oCtl:bWhen )

            if oCtl:lNeedGetFocus .and. !oCtl:lGotFocus

               SetLostFocusOff()
               msgWait( "Campo obligatorio", "Info", 0 )
               SetLostFocusOn()

               oCtl:SetFocus()

               Return .f.

            end if

         end if

      end if

   next

   /*
   Control de vacios-----------------------------------------------------------
   */

   if Empty( aTmp[ _NUNTTIL ] )
      aGet[ _NUNTTIL ]:SetFocus()
      return .f.
   end if

   if !lCodigoArticulo( aGet, aTmp, .f. )
      aGet[ _CCBATIL ]:SetFocus()
      return .f.
   end if

   /*
   Comprobamos si tiene que introducir n�meros de serie------------------------
   */

   if nMode == APPD_MODE                                 .and.;
      RetFld( aTmp[ _CCBATIL ], dbfArticulo, "lNumSer" ) .and.;
      Empty( aTmp[ _MNUMSER ] )                          .and.;
      !Empty( oBtnSer )

      MsgStop( "Tiene que introducir n�meros de serie para este art�culo." )
      oBtnSer:Click()
      Return .f.

   end if

   if lTwo .and. empty( aTmp[_CNCMTIL ] )

      SetLostFocusOff()
      msgWait( "Introduzca art�culo combinado", "Stop", 0 )
      SetLostFocusOn()

      aGet[ _CNCMTIL ]:setFocus()

      return .f.

   end if

   if !Empty( aTmp[ _CCODPR1 ] ) .and. lUsePrp1() .and. Empty( aTmp[ _CVALPR1 ] ) .and. !Empty( aGet[ _CVALPR1 ] )

      SetLostFocusOff()
      MsgBeepStop( "Primera propiedad no puede estar vacia", "Aviso del sistema" )
      SetLostFocusOn()

      aGet[ _CVALPR1 ]:SetFocus()

      return .f.

   end if

   if !Empty( aTmp[ _CCODPR2 ] ) .and. lUsePrp2() .and. Empty( aTmp[ _CVALPR2 ] ) .and. !Empty( aGet[ _CVALPR2 ] )

      SetLostFocusOff()
      MsgBeepStop( "Segunda propiedad no puede estar vacia", "Aviso del sistema" )
      SetLostFocusOn()

      aGet[ _CVALPR2 ]:SetFocus()

      return .f.

   end if

   /*
   Precios vacios--------------------------------------------------------------
   */

   if Empty( aTmp[ _NPVPTIL ] )

      if !lPermitirVentaSinValorar( aTmp[ _CCBATIL ], dbfArticulo, dbfFamilia )

         if lUsrMaster()

            SetLostFocusOff()
            lOk   := msgYesNo( "Precio igual a cero, �desea continuar con la venta?" )
            SetLostFocusOn()

            if !lOk
               aGet[ _NPVPTIL ]:SetFocus()
               return .f.
            end if

         else

            aGet[ _NPVPTIL ]:SetFocus()
            return .f.

         end if

      else

         SetLostFocusOff()
         lOk   := msgYesNo( "Precio igual a cero, �desea continuar con la venta?" )
         SetLostFocusOn()

         if !lOk
            aGet[ _NPVPTIL ]:SetFocus()
            return .f.
         end if

      end if

   end if

   /*
   Decuentos-------------------------------------------------------------------
   */

   if ( aTmp[ _NPVPTIL ] > 0 ) .and. ( aTmp[ _NPVPTIL ] - aTmp[ _NDTODIV ] <= 0 )

      SetLostFocusOff()
      MsgBeepStop( "Descuento lineal mayor o igual que precio unitario" )
      SetLostFocusOn()

      aGet[ _NDTODIV ]:SetFocus()

      return .f.

   end if

   /*
   Stock actual----------------------------------------------------------------
   */

   if lNotVta .or. lMsgVta

      nStockActual   := oStock:nStockActualCalculado( aTmp[ _CCBATIL ], aTik[ _CALMTIK ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ] )
      nStockActual   -= nVentasPrevias( aTmp[ _CCBATIL ], dbfTmpL, nMode )

      if ( nStockActual - aTmp[ _NUNTTIL ] ) < 0

         if lNotVta

            SetLostFocusOff()
            MsgStop( "No hay stock suficiente, tenemos " + Alltrim( Trans( nStockActual, MasUnd() ) ) + " unidad(es) disponible(s) en almac�n " + aTik[ _CALMTIK ] + "." )
            SetLostFocusOn()

            return .f.

         end if

         if lMsgVta

            SetLostFocusOff()
            lOk   := MsgYesNo( "No hay stock suficiente, tenemos " + Alltrim( Trans( nStockActual, MasUnd() ) ) + " unidad(es) disponible(s) en almac�n " + aTik[ _CALMTIK ] + ".", "�Continuar con la venta?" )
            SetLostFocusOn()

            if !lOk
               return .f.
            end if

         end if

      end if

   end if

   /*
   Casos especiles para combustibles-------------------------------------------
   */

   lStdChange( aTmp, aGet )

   /*
   Imprimo en el visor el nombre y precio del art�culo-------------------------
   */

   if oVisor != nil
      oVisor:SetBufferLine( { aTmp[ _CNOMTIL ], Trans( aTmp[ _NPVPTIL ], cPouDiv ) }, 1 )
   end if

   /*
   Chequeamos las ofertas X * Y------------------------------------------------
   */

   if nMode == APPD_MODE

      aXbYStr        := nXbYAtipica( aTmp[ _CCBATIL ], aTik[ _CCLITIK ], 1, aTmp[ _NUNTTIL ], aTik[ _DFECTIK ], dbfCliAtp )
      if aXbYStr[ 1 ] == 0
         aXbYStr     := nXbYOferta( aTmp[ _CCBATIL ], aTik[ _CCLITIK ], aTik[ _CCODGRP ], 1, aTmp[ _NUNTTIL ], aTik[ _DFECTIK ], dbfOferta )
      end if

      /*
      si tenemos q reagalar unidades-------------------------------------------
      */

      if aXbYStr[ 1 ] != 0 .and. aXbYStr[ 2 ] != 0

         if aXbYStr[ 1 ] == 2

            if aTmp[ _NUNTTIL ] < 0
               aTmp[ _NUNTTIL ]  += aXbYStr[ 2 ]
            else
               aTmp[ _NUNTTIL ]  -= aXbYStr[ 2 ]
            end if

            aClo                 := aClone( aTmp )

            WinGather( aTmp, nil, dbfTmpL, nil, nMode, nil, .f. )

            AppendKit( aClo, aTik )

            if aTmp[ _NUNTTIL ] < 0
               aTmp[ _NUNTTIL ]  := -( aXbYStr[ 2 ] )
            else
               aTmp[ _NUNTTIL ]  := aXbYStr[ 2 ]
            end if

            aTmp[ _NPVPTIL ]     := 0

            aClo                 := aClone( aTmp )

            WinGather( aTmp, aGet, dbfTmpL, nil, nMode )

            AppendKit( aClo, aTik )

         end if

      else

         /*
         Comprobamos que el registro ya exista en la base de datos----------------
         */

         if lIsCode( aTmp, dbfTmpL, oBrw )

            aGet[ _CCBATIL ]:cText( Space( 14 ) )
            aGet[ _CNOMTIL ]:cText( Space( 250 ) )
            aGet[ _NPVPTIL ]:cText( 0 )
            aGet[ _NUNTTIL ]:cText( 0 )

         else

            /*
            A�adimos el registro a la base de datos----------------------------
            */

            WinGather( aTmp, aGet, dbfTmpL, nil, nMode )

            AppendKit( aClo, aTik )

         end if

      end if

   else

      /*
      Modificamos el registro a la base de datos----------------------------------
      */

      WinGather( aTmp, aGet, dbfTmpL, nil, nMode )

   end if

   cOldCodArt           := ""

   oGetTotal:cText( 0 )

   /*
   Calculamos el total del tiket-----------------------------------------------
   */

   lRecTotal( aTik )

   if oVisor != nil
      oVisor:SetBufferLine( { "Total", Trans( nTotTik, cPorDiv ) }, 2 )
      oVisor:WriteBufferLine()
   end if

   /*
   Pos to the end--------------------------------------------------------------
	*/

   if !Empty( oDlgDet )
      SetLostFocusOff()
      oDlgDet:End( IDOK )
      SetLostFocusOn()
   end if

   /*
   Refresh de tickets----------------------------------------------------------
	*/

   oBrw:Refresh( .t. )

RETURN ( .t. )

//---------------------------------------------------------------------------//

STATIC FUNCTION lCodigoArticulo( aGet, aTmp, lMessage, oDlg )

   local lCodArt        := .t.
   local cValPr1        := ""
   local cValPr2        := ""
   local cCodArt        := aGet[ _CCBATIL ]:VarGet()

   DEFAULT lMessage     := .t.

   if Empty( cCodArt )
      if lRetCodArt()
         return .f.
      else
         return .t.
      end if
   end if

   /*
   Primero buscamos por codigos de barra---------------------------------------
   */

   cCodArt              := cSeekCodebar( cCodArt, dbfCodebar, dbfArticulo )

   /*
   Ahora buscamos por el codigo interno----------------------------------------
   */

	if !aSeekProp( cCodArt, cValPr1, cValPr2, dbfArticulo, dbfTblPro )

      if lMessage

         SetLostFocusOff()
         MsgBeepStop( "Art�culo con c�digo " + Rtrim( cCodArt ) + " no encontrado" )
         SetLostFocusOn()

      end if

      lCodArt           := .f.

	else

      aGet[ _CCBATIL ]:cText( cCodArt )

      lCodArt           := .t.

	end if

Return ( lCodArt )

//-------------------------------------------------------------------------//
/*
Esta funci�n recoge los articulos del Escaner y los valida
*/

STATIC FUNCTION LoaArt( aGet, aTmp, oBrw, oGetTotal, aTik, lTwo, nMode, oDlg, lNotVta )

   local lOk         := .t.
   local nTotal      := 0
   local cCodFam
   local cPrpArt
   local nImpOfe
   local nCosPro
   local nPrePro     := 0
   local cValPr1     := ""
   local cValPr2     := ""
   local cGrpCli     := RetFld( aTik[ _CCLITIK ], dbfClient, "CCODGRP" )
   local cCodArt     := aGet[ _CCBATIL ]:cText()
   local nNumDto     := 0
   local nDtoLin     := 0

   if Empty( cCodArt )
      if lRetCodArt()
         //MsgStop( "No se pueden a�adir lineas sin codificar" )
         return .f.
      else
         return .t.
      end if
   end if

   /*
   Precio anterior-------------------------------------------------------------
   */

   nOldPvp           := 0

   /*
   Primero buscamos por codigos de barra---------------------------------------
   */

   cCodArt           := cSeekCodebar( cCodArt, dbfCodebar, dbfArticulo )

   /*
   Ahora buscamos por el codigo interno----------------------------------------
   */

   if aSeekProp( @cCodArt, @cValPr1, @cValPr2, dbfArticulo, dbfTblPro )

      if ( dbfArticulo )->lObs
         MsgStop( "Art�culo catalogado como obsoleto" )
         return .f.
      end if

      if nMode == APPD_MODE

         aGet[ _CCBATIL ]:cText( cCodArt )

         /*
         Rellenamos el nombre del articulo-------------------------------------
         */

         if Empty( aTmp[ _CNOMTIL ] )

            if !Empty( ( dbfArticulo)->cDesTik )
               aGet[ _CNOMTIL ]:cText( ( dbfArticulo )->cDesTik )
            else
               aGet[ _CNOMTIL ]:cText( ( dbfArticulo )->Nombre  )
            end if

         end if

         /*
         Texto para la comanda-------------------------------------------------
         */

         if ( dbfArticulo )->lMosCom .and. !Empty( ( dbfArticulo )->mComent )
            MsgStop( Trim( ( dbfArticulo )->mComent ) )
         end if

         /*
         Texto para la comanda-------------------------------------------------
         */

         if !Empty( ( dbfArticulo )->cDesCmd )
            aTmp[ _CNOMCMD ]                 := ( dbfArticulo )->cDesCmd
         else
            aTmp[ _CNOMCMD ]                 := aTmp[ _CNOMTIL ]
         end if

         /*
         Familia del art�culo--------------------------------------------------
         */

         aTmp[ _CFAMTIL ]                    := ( dbfArticulo )->Familia

         /*
         Tipos de acceso-------------------------------------------------------
         */

         aTmp[ _LTIPACC ]                    := ( dbfArticulo )->lTipAcc

         if !Empty( aGet[ _NPVPTIL ] )
            aGet[ _NPVPTIL ]:lNeedGetFocus   := aTmp[ _LTIPACC ]
         end if

         lNotVta                             := ( dbfArticulo )->lNotVta

         /*
         Tratamientos kits-----------------------------------------------------
         */

         if ( dbfArticulo )->lKitArt

            aTmp[ _LKITART ]     := ( dbfArticulo )->lKitArt                        // Marcamos como padre del kit
            aTmp[ _LIMPLIN ]     := lImprimirCompuesto( ( dbfArticulo )->Codigo, dbfArticulo ) // 1 Todos, 2 Compuesto
            aTmp[ _LKITPRC ]     := lPreciosCompuestos( ( dbfArticulo )->Codigo, dbfArticulo ) // 1 Todos, 2 Compuesto

            if lStockCompuestos( ( dbfArticulo )->Codigo, dbfArticulo )
               aTmp[ _NCTLSTK ]  := ( dbfArticulo )->nCtlStock
            else
               aTmp[ _NCTLSTK ]  := STOCK_NO_CONTROLAR // No controlar Stock
            end if

         else

            aTmp[ _LIMPLIN ]     := .f.
            aTmp[ _NCTLSTK ]     := ( dbfArticulo )->nCtlStock

         end if

         /*
         Buscamos la familia del articulo y anotamos las propiedades
         */

         aTmp[ _CCODPR1 ]        := ( dbfArticulo )->cCodPrp1
         aTmp[ _CCODPR2 ]        := ( dbfArticulo )->cCodPrp2

         if !Empty( aTmp[ _CCODPR1 ] ) .and. !Empty( aGet[ _CVALPR1 ] )

            if !Empty( cValPr1 )
               aGet[ _CVALPR1 ]:cText( cCodPrp( aTmp[ _CCODPR1 ], cValPr1, dbfTblPro ) )
            end if

            if lUsePrp1()
               aGet[ _CVALPR1 ]:Show()
            else
               aGet[ _CVALPR1 ]:Hide()
            end if

         end if

         if !empty( aTmp[ _CCODPR2 ] ) .and. !Empty( aGet[ _CVALPR2 ] )

            if !Empty( cValPr2 )
               aGet[ _CVALPR2 ]:cText( cCodPrp( aTmp[ _CCODPR2 ], cValPr2, dbfTblPro ) )
            end if

            if lUsePrp2()
               aGet[ _CVALPR2 ]:Show()
            else
               aGet[ _CVALPR2 ]:Hide()
            end if

         end if

         /*
         Obtenemos la familia y los codigos de familia
         */

         cCodFam              := ( dbfArticulo )->Familia
         if !Empty( cCodFam )
            aTmp[ _CCODFAM ]  := cCodFam
            aTmp[ _CGRPFAM ]  := cGruFam( cCodFam, dbfFamilia )
         end if

         /*
         Obtenemos el Tipo de IVA-------------------------------------------------
         */

         aTmp[ _NIVATIL ]     := nIva( dbfIva, ( dbfArticulo )->TipoIva )

         /*
         Recogemos los impuestos especiales---------------------------------------
         */

         if !Empty( ( dbfArticulo )->cCodImp )
            aTmp[ _CCODIMP ]  := ( dbfArticulo )->cCodImp
            aTmp[ _NVALIMP ]  := oNewImp:nValImp( ( dbfArticulo )->cCodImp, .t., aTmp[ _NIVATIL ] )
         end if

         /*
         Recogemos el factor de conversi�n-------------------------------------
         */

         if !Empty( ( dbfArticulo )->CFACCNV ) .and. ( dbfTblCnv )->( dbSeek( ( dbfArticulo )->CFACCNV ) )
            aTmp[ _NFACCNV ]  := ( dbfTblCnv )->nFacCnv
         end if

      else

         if ( cOldCodArt != cCodArt )

            aGet[ _CCBATIL ]:cText( cCodArt )

            if !empty( ( dbfArticulo)->cDesTik )
               aGet[ _CNOMTIL ]:cText( ( dbfArticulo )->cDesTik )
            else
               aGet[ _CNOMTIL ]:cText( ( dbfArticulo )->Nombre  )
            end if

            /*
            Familia del art�culo
            */

            aTmp[ _CFAMTIL ]        := ( dbfArticulo )->Familia
            aTmp[ _LTIPACC ]        := ( dbfArticulo )->lTipAcc

            lNotVta                 := ( dbfArticulo )->lNotVta

            /*
            Tratamientos kits-----------------------------------------------------
            */

            if ( dbfArticulo )->lKitArt
               aTmp[ _LKITART ]     := ( dbfArticulo )->lKitArt                        // Marcamos como padre del kit
               aTmp[ _LIMPLIN ]     := lImprimirCompuesto( ( dbfArticulo )->Codigo, dbfArticulo ) // 1 Todos, 2 Compuesto
               aTmp[ _LKITPRC ]     := lPreciosCompuestos( ( dbfArticulo )->Codigo, dbfArticulo ) // 1 Todos, 2 Compuesto
               if lStockCompuestos( ( dbfArticulo )->Codigo, dbfArticulo )
                  aTmp[ _NCTLSTK ]  := ( dbfArticulo )->nCtlStock
               else
                  aTmp[ _NCTLSTK ]  := STOCK_NO_CONTROLAR // No controlar Stock
               end if
            else
               aTmp[ _LIMPLIN ]     := .f.
               aTmp[ _NCTLSTK ]     := ( dbfArticulo )->nCtlStock
            end if

            /*
            Buscamos la familia del articulo y anotamos las propiedades
            */

            if dbSeekInOrd( ( dbfArticulo )->Familia, "cCodFam", dbfFamilia )
               aTmp[ _CCODPR1 ]     := ( dbfArticulo )->cCodPrp1
               aTmp[ _CCODPR2 ]     := ( dbfArticulo )->cCodPrp2
            else
               aTmp[ _CCODPR1 ]     := Space( 10 )
               aTmp[ _CCODPR2 ]     := Space( 10 )
            end if

            if !empty( aTmp[ _CCODPR1 ] ) .and. !Empty( aGet[ _CVALPR1 ] )
               if lUsePrp1()
                  aGet[ _CVALPR1 ]:Show()
               else
                  aGet[ _CVALPR1 ]:Hide()
               end if
            end if

            if !empty( aTmp[ _CCODPR2 ] ) .and. !Empty( aGet[ _CVALPR2 ] )
               if lUsePrp2()
                  aGet[ _CVALPR2 ]:Show()
               else
                  aGet[ _CVALPR2 ]:Hide()
               end if
            end if

            /*
            Obtenemos la familia y los codigos de familia----------------------
            */

            cCodFam  := RetFamArt( cCodArt, dbfArticulo )
            if !Empty( cCodFam )
               aTmp[ _CCODFAM ]  := cCodFam
               aTmp[ _CGRPFAM ]  := cGruFam( cCodFam, dbfFamilia )
            end if

            /*
            Obtenemos el Tipo de IVA-------------------------------------------
            */

            aTmp[ _NIVATIL ]     := nIva( dbfIva, ( dbfArticulo )->TipoIva )

            /*
            Recogemos los impuestos especiales---------------------------------
            */

            if !Empty( ( dbfArticulo )->cCodImp )
               aTmp[ _CCODIMP ]  := ( dbfArticulo )->cCodImp
               aTmp[ _NVALIMP ]  := oNewImp:nValImp( ( dbfArticulo )->cCodImp, .t., aTmp[ _NIVATIL ] )
            end if

         end if

      end if

      /*
      He terminado de meter todo lo que no son precios ahora es cuando meter� los precios con todas las opciones posibles
      */

      cPrpArt                    := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]

      if ( cOldCodArt != cCodArt ) .or. ( cPrpArt != cOldPrpArt )

         /*
         Obtenemos el precio del art�culo
         */

         if nMode == APPD_MODE
            cCodFam        := RetFamArt( cCodArt, dbfArticulo )
         else
            cCodFam        := aTmp[_CCODFAM]
         end if

         /*
         Cargamos los costos------------------------------------------------
         */

         nCosPro           := nCosPro( cCodArt, aTmp[ _CCODPR1 ], aTmp[ _CVALPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR2 ], dbfArtDiv )

         //Cargamos los valores por defecto de las unidades de medicion

         aTmp[ ( dbfTikL )->( FieldPos( "cUnidad" ) ) ]           := ( dbfArticulo )->cUnidad

         if oUndMedicion:oDbf:Seek( ( dbfArticulo )->cUnidad )

            if !Empty( oUndMedicion:oDbf:cTextoDim1 )
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:cText( ( dbfArticulo )->nLngArt )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:Show()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]  := ( dbfArticulo )->nLngArt
               end if
            else
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:Hide()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]  := 0
               end if
            end if

            if !Empty( oUndMedicion:oDbf:cTextoDim2 )
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:cText( ( dbfArticulo )->nAltArt )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:Show()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]  := ( dbfArticulo )->nAltArt
               end if
            else
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:Hide()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]  := 0
               end if
            end if

            if !Empty( oUndMedicion:oDbf:cTextoDim3 )
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:cText( ( dbfArticulo )->nAncArt )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:Show()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]  := ( dbfArticulo )->nAncArt
               end if
            else
               if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ] )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
                  aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:Hide()
               else
                  aTmp[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]  := 0
               end if
            end if

         else

            if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ] )
               aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
               aGet[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]:Hide()
            else
               aTmp[ ( dbfTikL )->( fieldpos( "nMedUno" ) ) ]  := 0
            end if

            if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ] )
               aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
               aGet[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]:Hide()
            else
               aTmp[ ( dbfTikL )->( fieldpos( "nMedDos" ) ) ]  := 0
            end if

            if !Empty( aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ] )
               aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
               aGet[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]:Hide()
            else
               aTmp[ ( dbfTikL )->( fieldpos( "nMedTre" ) ) ]  := 0
            end if

         end if

         if ( IsMuebles() )

            if nCosPro == 0
               nCosPro        := nCalculoPuntos( ( dbfArticulo )->pCosto, ( dbfArticulo )->nPuntos, ( dbfArticulo )->nDtoPnt, 0 )
            end if

         else

            if nCosPro == 0
               nCosPro        := nCosto( nil, dbfArticulo, dbfKit )
            end if

         end if

         if aGet[ _NCOSDIV ] != nil
            aGet[ _NCOSDIV ]:cText( nCosPro )
         else
            aTmp[ _NCOSDIV ]  := nCosPro
         end if

         nPrePro              := nPrePro( cCodArt, aTmp[ _CCODPR1 ], aTmp[ _CVALPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR2 ], aTik[ _NTARIFA ], .t., dbfArtDiv, dbfTarPreL, aTik[_CCODTAR] )

         if nPrePro == 0

            nTotal            := nRetPreArt( aTik[ _NTARIFA ], aTik[ _CDIVTIK ], .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, .t. )

            if nTotal != 0
               nOldPvp        := nTotal
               aGet[ _NPVPTIL ]:cText( nTotal )
               oGetTotal:cText( aTmp[ _NPVPTIL ] * aTmp[ _NUNTTIL ] )
            end if

         else

            aGet[_NPVPTIL]:cText( nPrePro )

         end if

         /*
         Descuento de art�culo----------------------------------------------
         */

         nNumDto              := RetFld( aTik[ _CCLITIK ], dbfClient, "nDtoArt" )

         if nNumDto != 0

            do case
               case nNumDto == 1
                  nDtoLin     := ( dbfArticulo )->nDtoArt1

               case nNumDto == 2
                  nDtoLin     := ( dbfArticulo )->nDtoArt2

               case nNumDto == 3
                  nDtoLin     := ( dbfArticulo )->nDtoArt3

               case nNumDto == 4
                  nDtoLin     := ( dbfArticulo )->nDtoArt4

               case nNumDto == 5
                  nDtoLin     := ( dbfArticulo )->nDtoArt5

               case nNumDto == 6
                  nDtoLin     := ( dbfArticulo )->nDtoArt6

            end case

            if nDtoLin != 0

               if !Empty( aGet[ _NDTOLIN ] )
                  aGet[ _NDTOLIN ]:cText( nDtoLin )
               end if

            end if

         end if

         /*
         Vemos si hay descuentos en las familias-------------------------------
         */

         if nDtoLin == 0
            if !Empty( aGet[ _NDTOLIN ] )
               aGet[ _NDTOLIN ]:cText( nDescuentoFamilia( cCodFam, dbfFamilia ) )
            else
               aTmp[ _NDTOLIN ]  := nDescuentoFamilia( cCodFam, dbfFamilia )
            end if
         end if

         /*
         Comprobamos si hay promociones por fidelizacion-----------------------------
         */

         aTmp[ _LINPROMO ]    := oFideliza:InPrograma( aTmp[ _CCBATIL ], aTik[ _DFECTIK ], dbfArticulo )

         if !Empty( aGet[ _LINPROMO ] )
            if aTmp[ _LINPROMO ]
               aGet[ _LINPROMO ]:Show()
            else
               aGet[ _LINPROMO ]:Hide()
            end if
         end if

         /*
         Chequeamos situaciones especiales-------------------------------------
         */

         //--Atipicas de clientes por articulos--//

         do case
         case  lSeekAtpArt( aTik[ _CCLITIK ] + cCodArt, aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ], aTik[ _DFECTIK ], dbfCliAtp ) .and. ;
               ( dbfCliAtp )->lAplFac

            nImpOfe     := nImpAtp( aTik[ _NTARIFA ], dbfCliAtp, aGet[ _NPVPTIL ], aTmp[ _NIVATIL ] )
            if nImpOfe  != 0
               aGet[ _NPVPTIL ]:cText( nImpOfe )
            end if

            /*
            Descuentos por tarifas de precios----------------------------------
            */

            nImpOfe     := nDtoAtp( aTik[ _NTARIFA ], dbfCliAtp )
            if nImpOfe  != 0
               if !Empty( aGet[ _NDTOLIN ] )
                  aGet[ _NDTOLIN ]:cText( nImpOfe )
               else
                  aTmp[ _NDTOLIN ]     := nImpOfe
               end if
            end if

            if ( dbfCliAtp )->nDtoDiv != 0
               if !Empty( aGet[ _NDTODIV ] )
                  aGet[ _NDTODIV ]:cText( ( dbfCliAtp )->nDtoDiv )
               else
                  aTmp[ _NDTODIV ]     := ( dbfCliAtp )->nDtoDiv
               end if
            end if

         /*
         Atipicas de clientes por familias-------------------------------------
         */

         case  lSeekAtpFam( aTik[ _CCLITIK ] + cCodFam, aTik[ _DFECTIK ], dbfCliAtp ) .and. ;
               ( dbfCliAtp )->lAplFac

            if ( dbfCliAtp )->nDtoArt != 0
               if !Empty( aGet[ _NDTOLIN ] )
                  aGet[ _NDTOLIN ]:cText( ( dbfCliAtp )->nDtoArt )
               else
                  aTmp[ _NDTOLIN ]     := ( dbfCliAtp )->nDtoArt
               end if
            end if

            if ( dbfCliAtp )->nDtoDiv != 0
               if !Empty( aGet[ _NDTODIV ] )
                  aGet[ _NDTODIV ]:cText( ( dbfCliAtp )->nDtoDiv )
               else
                  aTmp[ _NDTODIV ]     := ( dbfCliAtp )->nDtoDiv
               end if
            end if

         //--Tarifas de precios--//

         case !Empty( aTik[ _CCODTAR ] )

            //--Precio--//

            nImpOfe     := RetPrcTar( cCodArt, aTik[ _CCODTAR ], aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], dbfTarPreL, aTik[ _NTARIFA ] )
            if nImpOfe  != 0
               aGet[ _NPVPTIL ]:cText( nImpOfe + ( ( nImpOfe * aTmp[ _NIVATIL ] ) / 100 ) )
            end if

            //--Descuento porcentual--//

            nImpOfe     := RetPctTar( cCodArt, cCodFam, aTik[ _CCODTAR ], aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], dbfTarPreL )
            if nImpOfe  != 0
               aGet[_NDTOLIN ]:cText( nImpOfe )
            end if

            //--Descuento lineal--//

            nImpOfe     := RetLinTar( cCodArt, cCodFam, aTik[ _CCODTAR ], aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], dbfTarPreL )
            if nImpOfe  != 0
               aGet[ _NDTODIV ]:cText( nImpOfe )
            end if

         end case

         //--Comprobamos si hay una oferta--//

         nTotal      := nImpOferta( cCodArt, aTik[ _CCLITIK ], cGrpCli, aTmp[ _NUNTTIL ], aTik[ _DFECTIK ], dbfOferta, aTik[ _NTARIFA ], .t., aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[_CVALPR1], aTmp[_CVALPR2] )
         if nTotal   != 0
            aGet[ _NPVPTIL ]:cText( nTotal )
         end if

         //--Descuento promocion--//

         nTotal      := nDtoOferta( cCodArt, aTik[ _CCLITIK ], cGrpCli, aTmp[ _NUNTTIL ], aTik[ _DFECTIK ], dbfOferta, aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ] )
         if nTotal   != 0
            aGet[ _NDTOLIN ]:cText( nTotal )
         end if

         //--Buscamos si existen descuentos lineales en las ofertas--//

         nImpOfe     := nDtoLineal( cCodArt, aTik[ _CCLITIK ], cGrpCli, aTmp[ _NUNTTIL ], aTik[ _DFECTIK ], dbfOferta, aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR1 ], aTmp[_CVALPR2] )
         if nImpOfe  != 0
            if !Empty( aGet[ _NDTODIV ] )
               aGet[ _NDTODIV ]:cText( nImpOfe )
            else
               aTmp[ _NDTODIV ]     := nImpOfe
            end if
         end if

      end if

      cOldCodArt  := cCodArt
      cOldPrpArt  := cPrpArt

      if Empty( aTmp[ _NPVPTIL ] ) .or. lUsrMaster() .or. oUser():lCambiarPrecio()
         if( !Empty( aGet[ _NPVPTIL ] ), aGet[ _NPVPTIL ]:HardEnable(), )
         if( !Empty( aGet[ _NDTODIV ] ), aGet[ _NDTODIV ]:HardEnable(), )
         if( !Empty( aGet[ _NDTOLIN ] ), aGet[ _NDTOLIN ]:HardEnable(), )
      else
         if( !Empty( aGet[ _NPVPTIL ] ), aGet[ _NPVPTIL ]:HardDisable(), )
         if( !Empty( aGet[ _NDTODIV ] ), aGet[ _NDTODIV ]:HardDisable(), )
         if( !Empty( aGet[ _NDTOLIN ] ), aGet[ _NDTOLIN ]:HardDisable(), )
      end if

   else

      Return .f.

   end if

Return .t.

//-------------------------------------------------------------------------//

Static Function lExacto( aTmp )

   local lImporteExacto := lImporteExacto()

   if lImporteExacto
      aTmp[ _NCOBTIK ]  -= nTotCobTik( nil, dbfTmpP, dbfDiv, cDivEmp() )
      aTmp[ _NCOBTIK ]  -= nTmpValTik( dbfTmpV, dbfTikL, dbfDiv, cDivEmp() )
      aTmp[ _NCOBTIK ]  -= nTotAntFacCli( nil, dbfTmpA, dbfIva, dbfDiv, cDivEmp() )
   end if

Return ( lImporteExacto )

//-------------------------------------------------------------------------//

Static Function ClickButtonsPago( oBtnPago, aGet )

   aEval( aButtonsPago, {|o| o:oButton:lBtnDown := .f., o:oButton:Refresh() } )

   oBtnPago:lBtnDown := .t.

   aGet[ _CFPGTIK ]:cText( oBtnPago:Cargo )
   aGet[ _CFPGTIK ]:lValid()

Return ( nil ) // {|| , oBtnPago:oButton:lBtnDown := .t.,  } )

//-------------------------------------------------------------------------//

Static Function ClickButtonsMode( aTmp )

   do case
      case aTmp[ _CTIPTIK ] == SAVTIK

         aTmp[ _CTIPTIK ]        := SAVFAC
         oBtnTipoVta:cPrompt     := "Factura"
         oBtnTipoVta:cxBmp       := "Document_user1_32"

      case aTmp[ _CTIPTIK ] == SAVFAC

         if uFieldEmpresa( "lIncAlbTct" )
            aTmp[ _CTIPTIK ]     := SAVALB
            oBtnTipoVta:cPrompt  := "Albar�n"
            oBtnTipoVta:cxBmp    := "Document_plain_user1_32"
         else
            aTmp[ _CTIPTIK ]     := SAVTIK
            oBtnTipoVta:cPrompt  := "Ticket"
            oBtnTipoVta:cxBmp    := "Cashier_user1_32"
         end if

      case aTmp[ _CTIPTIK ] == SAVALB

         aTmp[ _CTIPTIK ]        := SAVTIK
         oBtnTipoVta:cPrompt     := "Ticket"
         oBtnTipoVta:cxBmp       := "Cashier_user1_32"

   end case

Return ( nil )

//-------------------------------------------------------------------------//

/*
Cobra un tiket
*/

STATIC FUNCTION lCobro( aTmp, aGet, nSave, nMode, lGenVale, nDifVale, lBig, oDlgTpv )

   local n
   local oDlg
   local oBtnTop
   local oBtnDwn
   local oBtnAceptar
   local oBtnAceptarImprimir
   local oBtnAceptarRegalo
   local oBtnCancelar
   local oBtnCalculator
   local oBrwPgo
   local oBrwVal
   local oGetTxt
   local cGetTxt
   local oFntDlg           := TFont():New( FONT_NAME, 12, 32, .F., .T.,  )
   local aBtnCob           := Array( 8 )
   local aSay              := Array( 3 )
   local aGetCob           := Array( 5 )
   local lIntClk           := .t.
   local aBtnFormaPago     := Array( 5 )
   local aSayFormaPago     := Array( 5 )
   local oBmpTitulo
   local oSayTitulo
   local cImageTitle
   local cTextTitle        := ""
   local lWhen

   DEFAULT nSave           := SAVTIK
   DEFAULT nMode           := EDIT_MODE
   DEFAULT lBig            := .f.

   lWhen                   := ( nSave != SAVDEV .and. nSave != SAVVAL ) .or. ( nMode == APPD_MODE )

   /*
   Desabilitamos la caja de detras---------------------------------------------
   */

   if !Empty( oDlgTpv )
      aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Disable() } )
   end if

   if Empty( oTotDiv )
      oTotDiv              := TotalesTPV():Init()
   end if

   oTotDiv:nTotal          := aTmp[ _NCOBTIK ]

   if Empty( aTmp[ _CCLITIK ] )
      aTmp[ _CCLITIK ]     := cDefCli()
   end if

   if nMode == APPD_MODE
      if !uFieldEmpresa( "lGetFpg" )
         aTmp[ _CFPGTIK ]  := cDefFpg()
      else
         aTmp[ _CFPGTIK ]  := Space( 2 )
      end if
   end if

   cGetTxt                 := cNbrFPago( aTmp[ _CFPGTIK ], dbfFPago )

   /*
   Reposicionamiento de los pagos----------------------------------------------
   */

   if nMode == DUPL_MODE
      ( dbfTmpP )->( __dbZap() )
   end if

   ( dbfTmpP )->( dbGoTop() )

   /*
   Seleccionamos el color del dialogo dependiendo del tipo de archivar---------
   */

   do case
      case nSave == SAVTIK
         cImageTitle    := "Cashier_businessman2_48_alpha"
         cTextTitle     := "El documento actual se cobrar� y guardar� como un ticket de cliente."
      case nSave == SAVALB
         cImageTitle    := "Document_plain_businessman2_48_alpha"
         cTextTitle     := "El documento actual se guardar� como un albaran de cliente."
      case nSave == SAVFAC
         cImageTitle    := "Document_businessman2_48_alpha"
         cTextTitle     := "El documento actual se guardar� como una factura de cliente."
      case nSave == SAVDEV
         cImageTitle    := "Cashier_delete_48_alpha"
         cTextTitle     := "El documento actual se guardar� como una devoluci�n a cliente."
      case nSave == SAVVAL .and. !aTmp[ _LFRETIK ]
         cImageTitle    := "Cashier_delete_48_alpha"
         cTextTitle     := "El documento actual se guardar� como un vale a cliente."
      case nSave == SAVVAL .and. aTmp[ _LFRETIK ]
         cImageTitle    := "Cashier_box_new_48_alpha"
         cTextTitle     := "El documento actual se guardar� como un cheque regalo."
      case nSave == SAVAPT
         cImageTitle    := "Cashier_delete_48_alpha"
         cTextTitle     := "El documento actual se guardar� como un apartado."
   end case

   if lBig
      if oUser():lUsrZur()
         DEFINE DIALOG oDlg RESOURCE "BIG_COBRO_LEFT"
      else
         DEFINE DIALOG oDlg RESOURCE "BIG_COBRO_RIGHT"
      end if
   else
      DEFINE DIALOG oDlg RESOURCE "COBROTPV"
   end if

   /*
   Banner del t�tulo-----------------------------------------------------------
   */

   REDEFINE BITMAP oBmpTitulo RESOURCE ( cImageTitle )   ID 500 OF oDlg

   REDEFINE SAY oSayTitulo PROMPT ( cTextTitle )         ID 510 OF oDlg

   REDEFINE SAY aSay[ 1 ] ID 910 OF oDlg
   REDEFINE SAY aSay[ 2 ] ID 911 OF oDlg
   REDEFINE SAY aSay[ 3 ] ID 912 OF oDlg

   /*
   Forma de pago---------------------------------------------------------------
   */

   if lBig

      REDEFINE GET aGet[ _CFPGTIK ] VAR aTmp[ _CFPGTIK ] ;
         ID       120 ;
         WHEN     ( lWhen ) ;
         VALID    cFpago( aGet[ _CFPGTIK ], dbfFPago, oGetTxt ) ;
         FONT     oFntDlg ;
         OF       oDlg

         aGet[ _CFPGTIK ]:bHelp  := {|| BrwPgoTactil( aGet[ _CFPGTIK ], dbfFPago, oGetTxt ) }

      REDEFINE GET oGetTxt VAR cGetTxt ;
         ID       121 ;
         FONT     oFntDlg ;
         OF       oDlg

      else

      REDEFINE GET aGet[ _CFPGTIK ] VAR aTmp[ _CFPGTIK ] ;
         ID       120 ;
         BITMAP   "LUPA" ;
         WHEN     ( lWhen ) ;
         VALID    cFpago( aGet[ _CFPGTIK ], dbfFPago, oGetTxt ) ;
         FONT     oFntDlg ;
         OF       oDlg

         aGet[ _CFPGTIK ]:bHelp  := {|| BrwFPago( aGet[ _CFPGTIK ], oGetTxt ) }

      REDEFINE GET oGetTxt VAR cGetTxt ;
         ID       121 ;
         FONT     oFntDlg ;
         OF       oDlg

      end if

      /*
      Botones de formas de pago------------------------------------------------
      */

      for n := 1 to len( aButtonsPago )

         aButtonsPago[ n ]:oButton        := ApoloBtnBmp():Redefine( ( 600 + n ), aButtonsPago[ n ]:cBigResource, , , , , {|o| ClickButtonsPago( o, aGet ) }, oDlg, , , .f., .f., aButtonsPago[ n ]:cText, , , , .t., "TOP", .t., , , .f., )
         aButtonsPago[ n ]:oButton:Cargo  := aButtonsPago[ n ]:cCode
         aButtonsPago[ n ]:oButton:bWhen  := {|| ( lWhen ) }

         if aButtonsPago[ n ]:oButton:Cargo == aTmp[ _CFPGTIK ]
            aButtonsPago[ n ]:oButton:lBtnDown := .t.
         end if

      next

      /*
      Totales__________________________________________________________________
		*/

      REDEFINE SAY oTotDiv:oTotal ;
         VAR      oTotDiv:nTotal ;
         ID       150 ;
			FONT 		oFntDlg ;
         PICTURE  cPorDiv ;
         OF       oDlg

      /*
      Total entregado__________________________________________________________
		*/

      REDEFINE SAY oTotDiv:oEntregado ;
         VAR      oTotDiv:nEntregado ;
         ID       160 ;
			FONT 		oFntDlg ;
         PICTURE  cPorDiv ;
         OF       oDlg

      /*
      Monedas y billetes__________________________________________________________________
		*/

      REDEFINE BUTTONBMP ;
         ID       800 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         BITMAP   "Img500Euros" ;
         ACTION   ( ClkMoneda( 500, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) )

      REDEFINE BUTTONBMP ;
         ID       801 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         BITMAP   "Img200Euros" ;
         ACTION   ( ClkMoneda( 200, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) )

      REDEFINE BUTTONBMP ;
         BITMAP   "Img100EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 100, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       802;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img50EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 50, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       803;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img20EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 20, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       804;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img10EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 10, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       805;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img5EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 5, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       806;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img2EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 2, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       807;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img1EURO" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 1, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       808;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img50CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.50, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       809;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img20CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.20, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       810;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img10CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.10, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       811;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img5CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.05, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       812;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img2CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.02, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       813;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img1CENT" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0.01, oTotDiv:oCobrado, @lIntClk ), ChkCobro( aTmp ) ) ;
         ID       814;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         BITMAP   "Img0EUROS" ;
         WHEN     ( lWhen ) ;
         ACTION   ( ClkMoneda( 0, oTotDiv:oCobrado, .t. ), ChkCobro( aTmp ) ) ;
         ID       815;
         OF       oDlg

      /*
      Cobrado en divisas__________________________________________________________________
      */

      REDEFINE GET oTotDiv:oCobrado ;
         VAR      oTotDiv:nCobrado ;
         ID       170 ;
         FONT     oFntDlg ;
         PICTURE  cPorDiv ;
         WHEN     ( lWhen ) ;
         VALID    ( ChkCobro( aTmp, oTotDiv ) ) ;
         OF       oDlg

      REDEFINE BUTTONBMP oBtnCalculator ;
         ID       220 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         BITMAP   "Calculator_32" ;
         ACTION   ( Calculadora( 0, oTotDiv:oCobrado ), ChkCobro( aTmp ) )

      /*
      Cambio en divisas del cambio____________________________________________
		*/

      REDEFINE SAY oTotDiv:oCambio ;
         VAR      oTotDiv:nCambio ;
         ID       180 ;
			FONT 		oFntDlg ;
         PICTURE  cPorDiv ;
         OF       oDlg

      /*
      Botones__________________________________________________________________
      */

      oBtnAceptarRegalo    := ApoloBtnBmp():Redefine( 553, "Package_New_Disk_Green_32", , , , , {|| if( lValidaCobro( aGet, @aTmp, @lGenVale, @nDifVale, nSave, oDlg ), ( lCopTik := .t., lRegalo := .t., oDlg:end( IDOK ) ), ) }, oDlg, , {|| lWhen }, .f., .f., "Aceptar y ticket regalo", , , , .t., "TOP", .t., , , .f. )
      oBtnAceptarImprimir  := ApoloBtnBmp():Redefine( IDOK, "Printer2_Disk_Green_32", , , , ,   {|| if( lValidaCobro( aGet, @aTmp, @lGenVale, @nDifVale, nSave, oDlg ), ( lCopTik := .t., oDlg:end( IDOK ) ), ) }, oDlg, , {|| lWhen }, .f., .f., "Aceptar e imprimir [F6]", ,,, .t., "TOP", .t., , , .f. )
      oBtnAceptar          := ApoloBtnBmp():Redefine( 552, "Check2_32", , , , ,                 {|| if( lValidaCobro( aGet, @aTmp, @lGenVale, @nDifVale, nSave, oDlg ), ( lCopTik := .f., oDlg:end( IDOK ) ), ) }, oDlg, , {|| lWhen }, .f., .f., "Aceptar sin imprimir [F5]", ,,, .t., "TOP", .t., , , .f. )
      oBtnCancelar         := ApoloBtnBmp():Redefine( IDCANCEL, "Del32", , , , ,                {|| oDlg:end() }, oDlg, , , .f., .f., "Cancelar", , , , .t., "TOP", .t., , , .f. )

      /*
      Pagos
		------------------------------------------------------------------------
		*/

   if !lBig

      if nSave == SAVALB

         /*
         Entregas a cuentas en albaranes de clientes---------------------------
         */

         REDEFINE BUTTON aBtnCob[ 1 ];
            ID       300 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   ( WinAppRec( oBrwPgo, bEditE, dbfTmpE, , , aTmp ) )

         REDEFINE BUTTON aBtnCob[ 2 ];
            ID       301 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   ( WinEdtRec( oBrwPgo, bEditE, dbfTmpE, , , aTmp ) )

         REDEFINE BUTTON aBtnCob[ 3 ];
            ID       302 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   ( if( ( dbfTmpE )->lCloPgo .and. !oUser():lAdministrador(), MsgStop( "Solo pueden eliminar las entregas cerradas los administradores." ), dbDelRec( oBrwPgo, dbfTmpE ) ) )

         REDEFINE BUTTON aBtnCob[ 6 ];
            ID       303 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   ( PrnEntAlbCli( ( dbfTmpE )->cSerAlb + Str( ( dbfTmpE )->nNumAlb ) + ( dbfTmpE )->cSufAlb + Str( ( dbfTmpE )->nNumRec ), .f., dbfTmpE ) )

         oBrwPgo                 := IXBrowse():New( oDlg )

         oBrwPgo:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
         oBrwPgo:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

         if ( lWhen )
            oBrwPgo:bLDblClick   := {|| WinEdtRec( oBrwPgo, bEditE, dbfTmpE, , aTmp ) }
         end if

         oBrwPgo:cAlias          := dbfTmpE
         oBrwPgo:nMarqueeStyle   := 5
         oBrwPgo:cName           := "Pagos.TPV"

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Cerrado"
            :nHeadBmpNo       := 3
            :bEditValue       := {|| ( dbfTmpE )->lCloPgo }
            :nWidth           := 20
            :SetCheck( { "Sel16", "Nil16" } )
            :AddResource( "Zoom16" )
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( ( dbfTmpE )->dEntrega ) }
            :nWidth           := 80
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Sesi�n"
            :bEditValue       := {|| ( dbfTmpE )->cTurRec }
            :nWidth           := 40
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Caja"
            :bEditValue       := {|| ( dbfTmpE )->cCodCaj }
            :nWidth           := 40
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Pago"
            :bEditValue       := {|| ( dbfTmpE )->cCodPgo }
            :nWidth           := 40
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| ( dbfTmpE )->cDescrip }
            :nWidth           := 100
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Importe"
            :bEditValue       := {|| nEntAlbCli( dbfTmpE, dbfDiv, cDivEmp(), .t. ) }
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         oBrwPgo:CreateFromResource( 310 )

      else

         REDEFINE BUTTON aBtnCob[ 1 ];
            ID       300 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   (  if( !( dbfTmpP )->lCloPgo,;
                        ( WinAppRec( oBrwPgo, bEditP, dbfTmpP, , , aTmp ), CalImpCob( aTmp ) ),;
                        ( MsgStop( "Pago cerrado" ) ) ) )

         REDEFINE BUTTON aBtnCob[ 2 ];
            ID       301 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   (  if( !( dbfTmpP )->lCloPgo,;
                        ( WinEdtRec( oBrwPgo, bEditP, dbfTmpP, , , aTmp ), CalImpCob( aTmp ) ),;
                        ( MsgStop( "Pago cerrado" ) ) ) )

         REDEFINE BUTTON aBtnCob[ 3 ];
            ID       302 ;
            OF       oDlg;
            WHEN     ( lWhen ) ;
            ACTION   (  if( !( dbfTmpP )->lCloPgo,;
                        ( DbDelRec( oBrwPgo, dbfTmpP ), CalImpCob( aTmp ) ),;
                        ( MsgStop( "Pago cerrado" ) ) ) )

         REDEFINE BUTTON aBtnCob[ 6 ];
            ID       303 ;
            OF       oDlg;
            ACTION   ( nil )

         oBrwPgo                 := IXBrowse():New( oDlg )

         oBrwPgo:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
         oBrwPgo:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

         if ( lWhen )
            oBrwPgo:bLDblClick   := {|| if( !( dbfTmpP )->lCloPgo, ( WinEdtRec( oBrwPgo, bEditP, dbfTmpP, , , aTmp ), CalImpCob( aTmp ) ), ( MsgStop( "Pago cerrado" ) ) ) }
         end if

         oBrwPgo:cAlias          := dbfTmpP
         oBrwPgo:nMarqueeStyle   := 5
         oBrwPgo:cName           := "Pagos.TPV"

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Cerrado"
            :nHeadBmpNo       := 3
            :bEditValue       := {|| ( dbfTmpP )->lCloPgo }
            :nWidth           := 20
            :SetCheck( { "Sel16", "Nil16" } )
            :AddResource( "Zoom16" )
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( ( dbfTmpP )->dPgoTik ) }
            :nWidth           := 80
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Sesi�n"
            :bEditValue       := {|| ( dbfTmpP )->cTurPgo }
            :nWidth           := 50
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Caja"
            :bEditValue       := {|| ( dbfTmpP )->cCodCaj }
            :nWidth           := 40
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Pago"
            :bEditValue       := {|| ( dbfTmpP )->cFpgPgo }
            :nWidth           := 40
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| ( dbfTmpP )->cPgdPor }
            :nWidth           := 100
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Importe"
            :bEditValue       := {|| ( dbfTmpP )->nImpTik }
            :cEditPicture     := cPorDiv
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Devoluci�n"
            :bEditValue       := {|| ( dbfTmpP )->nDevTik }
            :cEditPicture     := cPorDiv
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         oBrwPgo:CreateFromResource( 310 )

      end if

      do case
      case nSave == SAVTIK

      TGroup():ReDefine( 900, "Vales", oDlg )

      REDEFINE BUTTON aBtnCob[ 4 ];
         ID       320 ;
         OF       oDlg;
         WHEN     ( lWhen ) ;
         ACTION   ( BrwVale( dbfTikT, dbfTikL, dbfIva, dbfDiv, dbfTmpV, oBrwVal, .f., aTmp ), CalImpCob( aTmp ) )

      REDEFINE BUTTON aBtnCob[ 5 ];
         ID       321 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( WinDelRec( oBrwVal, dbfTmpV, nil, nil, .t. ), CalImpCob( aTmp ) )

      REDEFINE BUTTON aBtnCob[ 7 ];
         ID       322 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( GetVale( oBrwVal, aTmp ), CalImpCob( aTmp ) )

      REDEFINE BUTTON aBtnCob[ 8 ];
         ID       323 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( BrwVale( dbfTikT, dbfTikL, dbfIva, dbfDiv, dbfTmpV, oBrwVal, .t., aTmp ), CalImpCob( aTmp ) )

      oBrwVal                 := IXBrowse():New( oDlg )

      oBrwVal:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwVal:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwVal:cAlias          := dbfTmpV
      oBrwVal:nMarqueeStyle   := 6
      oBrwVal:cName           := "Vales.TPV"

      with object ( oBrwVal:AddCol() )
         :cHeader          := "N�mero"
         :bEditValue       := {|| ( dbfTmpV )->cSerTik + "/" + lTrim( ( dbfTmpV )->cNumTik ) + "/" + ( dbfTmpV )->cSufTik  }
         :nWidth           := 60
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Fecha"
         :bEditValue       := {|| Dtoc( ( dbfTmpV )->dFecTik ) }
         :nWidth           := 70
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Sesi�n"
         :bEditValue       := {|| ( dbfTmpV )->cTurTik }
         :nWidth           := 50
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| ( dbfTmpV )->cCliTik }
         :nWidth           := 60
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Nombre"
         :bEditValue       := {|| ( dbfTmpV )->cNomTik }
         :nWidth           := 140
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Caja"
         :bEditValue       := {|| ( dbfTmpV )->cCcjTik }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Almac�n"
         :bEditValue       := {|| ( dbfTmpV )->cAlmTik }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Importe"
         :bEditValue       := {|| nTotalizer( ( dbfTmpV )->cSerTik + ( dbfTmpV )->cNumTik + ( dbfTmpV )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cDivEmp(), .t. ) }
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( ( dbfTmpV )->cDivTik, dbfDiv )}
         :nWidth           := 20
      end with

      oBrwVal:CreateFromResource( 330 )

      case nSave == SAVFAC

      TGroup():ReDefine( 900, "Anticipos", oDlg )

      REDEFINE BUTTON aBtnCob[ 4 ];
         ID       320 ;
         OF       oDlg;
         WHEN     ( lWhen ) ;
         ACTION   ( BrwAntCli( nil, dbfAntCliT, dbfIva, dbfDiv, dbfTmpA, oBrwVal ), CalImpCob( aTmp ) )

      REDEFINE BUTTON aBtnCob[ 5 ];
         ID       321 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( WinDelRec( oBrwVal, dbfTmpA, nil, nil, .t. ), CalImpCob( aTmp ) )

      oBrwVal                 := IXBrowse():New( oDlg )

      oBrwVal:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwVal:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwVal:cAlias          := dbfTmpA
      oBrwVal:nMarqueeStyle   := 5
      oBrwVal:cName           := "Anticipos.TPV"

      with object ( oBrwVal:AddCol() )
         :cHeader          := "N�mero"
         :bEditValue       := {|| ( dbfTmpA )->cSerAnt + "/" + lTrim( Str( ( dbfTmpA )->nNumAnt ) ) + "/" + ( dbfTmpA )->cSufAnt }
         :nWidth           := 80
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Fecha"
         :bEditValue       := {|| Dtoc( ( dbfTmpA )->dFecAnt ) }
         :nWidth           := 80
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Sesi�n"
         :bEditValue       := {|| ( dbfTmpA )->cTurAnt }
         :nWidth           := 50
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "C�digo"
         :bEditValue       := {|| ( dbfTmpA )->cCodCli }
         :nWidth           := 80
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Nombre"
         :bEditValue       := {|| ( dbfTmpA )->cNomCli }
         :nWidth           := 180
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Caja"
         :bEditValue       := {|| ( dbfTmpA )->cCodCaj }
         :nWidth           := 40
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Almac�n"
         :bEditValue       := {|| ( dbfTmpA )->cCodAlm }
         :nWidth           := 40
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Importe"
         :bEditValue       := {|| nTotAntCli( dbfTmpA, dbfIva, dbfDiv, nil, cDivEmp(), .t. ) }
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oBrwVal:AddCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( ( dbfTmpA )->cDivAnt, dbfDiv ) }
         :nWidth           := 20
      end with

      oBrwVal:CreateFromResource( 330 )

      otherwise

      REDEFINE BUTTON aBtnCob[ 4 ];
         ID       320 ;
         OF       oDlg;
         WHEN     ( lWhen ) ;
         ACTION   ( nil )

      REDEFINE BUTTON aBtnCob[ 5 ];
         ID       321 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( nil )

      REDEFINE BUTTON aBtnCob[ 7 ];
         ID       322 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( nil )

      REDEFINE BUTTON aBtnCob[ 8 ];
         ID       323 ;
         OF       oDlg ;
         WHEN     ( lWhen ) ;
         ACTION   ( nil )

      REDEFINE LISTBOX oBrwVal ;
         FIELDS   "";
         HEAD     "";
         ID       330 ;
			OF 		oDlg

      end case

   end if

   oDlg:bStart    := {|| StartCobro( aTmp, aGet, aGetCob, aBtnCob, aSay, oBtnTop, oBtnDwn, oBrwPgo, oBrwVal, oBtnCalculator, nSave, nMode, lBig ) }

   oDlg:AddFastKey( VK_F5, {|| if( !Empty( oBtnAceptar ), oBtnAceptar:Click(), ) } )
   oDlg:AddFastKey( VK_F6, {|| if( !Empty( oBtnAceptarImprimir ), oBtnAceptarImprimir:Click(), ) } )

   ACTIVATE DIALOG oDlg CENTER

   /*
   Habilitamos los controles---------------------------------------------------
   */

   if !Empty( oDlgTpv )
      aEval( oDlgTpv:aControls, { | oCtrl | oCtrl:Enable() } )
   end if

   oFntDlg:end()

   if oBmpTitulo != nil
      oBmpTitulo:end()
   end if

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function StartCobro( aTmp, aGet, aGetCob, aBtnCob, aSay, oBtnTop, oBtnDwn, oBrwPgo, oBrwVal, oBtnCalculator, nSave, nMode, lBig )

   local oBtn

   CalImpCob( aTmp )

   ChkCobro( aTmp )

   /*
   Set controles de la ventana de cobros---------------------------------------
   */

   if aGetCob[ 2 ] != nil
      aGetCob[ 2 ]:lValid()
   end if

   if aGetCob[ 3 ] != nil
      aGetCob[ 3 ]:lValid()
   end if

   if !lBig

      do case
      case ( nSave == SAVVAL .and. aTmp[ _LFRETIK ] )  // Cheque regalo

         if !Empty( oBrwVal )
            oBrwVal:Hide()
         end if

         if !Empty( aBtnCob[ 4 ] )
            aBtnCob[ 4 ]:Hide()
         end if

         if !Empty( aBtnCob[ 5 ] )
            aBtnCob[ 5 ]:Hide()
         end if

         if !Empty( aBtnCob[ 6 ] )
            aBtnCob[ 6 ]:Hide()
         end if

         if !Empty( aBtnCob[ 7 ] )
            aBtnCob[ 7 ]:Hide()
         end if

         if !Empty( aBtnCob[ 8 ] )
            aBtnCob[ 8 ]:Hide()
         end if

      case ( nSave == SAVALB ) .or. ( nSave == SAVVAL .and. !aTmp[ _LFRETIK ] ) .or. ( nSave == SAVDEV ) .or. ( nSave == SAVAPT )

         oTotDiv:oEntregado:Hide()
         oTotDiv:oCobrado:Hide()
         oTotDiv:oCambio:Hide()

         if !Empty( aBtnCob[ 4 ] )
            aBtnCob[ 4 ]:Hide()
         end if

         if !Empty( aBtnCob[ 5 ] )
            aBtnCob[ 5 ]:Hide()
         end if

         if !Empty( aBtnCob[ 6 ] )
            if nSave == SAVALB
               aBtnCob[ 6 ]:Show()
            else
               aBtnCob[ 6 ]:Hide()
            end if
         end if

         if !Empty( aBtnCob[ 7 ] )
            aBtnCob[ 7 ]:Hide()
         end if

         if !Empty( aBtnCob[ 8 ] )
            aBtnCob[ 8 ]:Hide()
         end if

         aSay[ 1 ]:Hide()
         aSay[ 2 ]:Hide()
         aSay[ 3 ]:Hide()

         if !Empty( aGetCob[ 1 ] )
            aGetCob[ 1 ]:SetFocus()
         end if

         if !Empty( oBrwVal )
            oBrwVal:Hide()
         end if

         if !Empty( oBtnCalculator )
            oBtnCalculator:Hide()
         end if

      case nSave == SAVFAC

         if !Empty( aGetCob[ 1 ] )
            aGetCob[ 1 ]:SetFocus()
         end if

         if !Empty( aBtnCob[ 6 ] )
            aBtnCob[ 6 ]:Hide()
         end if

      end case

      /*
      Botones en funcion del mode-------------------------------------------------
      */

      if nMode != APPD_MODE

         if oBtnTop != nil
            oBtnTop:Hide()
         end if

         if oBtnDwn != nil
            oBtnDwn:Hide()
         end if

         if nSave != SAVALB .and. !Empty( aBtnCob[ 6 ] )
            aBtnCob[ 6 ]:Hide()
         end if

      end if

   end if

   /*
   Botones de formas de pago---------------------------------------------------
   */

   for each oBtn in aButtonsPago

      if !Empty( oBtn:oButton )
         oBtn:oButton:Show()
      end if

      if !Empty( oBtn:oSay )
         oBtn:oSay:Show()
      end if

   next

   if !lBig

      /*
      Valid del codigo de cliente-------------------------------------------------
      */

      if !Empty( aGet[ _CCLITIK ] )
         aGet[ _CCLITIK ]:lValid()
      end if

   end if

Return .t.

//---------------------------------------------------------------------------//

Static Function lValidaCobro( aGet, aTmp, lGenVale, nDifVale, nSave, oDlg )

   local nTotalVale

   /*
   Chequeamos la forma de pago para que no est� vac�a--------------------------
   */

   if Empty( aTmp[ _CFPGTIK ] )
      msgStop( "Tiene que seleccionar una forma de pago" )
      aGet[ _CFPGTIK ]:SetFocus()
      Return .f.
   end if

   /*
   Desabilitamos los controles para los m�s r�pidos----------------------------
   */

   aEval( oDlg:aControls, {| o | o:Disable() } )

   /*
   Checkea los valores de los cobros-------------------------------------------
   */

   ChkCobro( aTmp )

   /*
   Diferencias-----------------------------------------------------------------
   */

   nTotalVale              := nTmpValTik( dbfTmpV, dbfTikL, dbfDiv, cDivEmp() )
   nDifVale                := nTotalVale - oTotDiv:nTotal

   /*
   El tiket ya no esta abierto-------------------------------------------------
   */

   aTmp[ _LABIERTO ]       := .f.

   /*
   Cambio y salvar como factura------------------------------------------------
   */

   if lNegativo( oTotDiv:nCambio ) .and. ( nSave == SAVTIK .or. nSave == SAVFAC .or. ( nSave == SAVVAL .and. aTmp[ _LFRETIK ] ) )
      if !MsgBeepYesNo( "�Desea vender a credito al cliente " + CRLF + Rtrim( aTmp[ _CNOMTIK ] ) + "?", "Importe insuficiente" )
         aEval( oDlg:aControls, {| o | o:Enable() } )
         return .f.
      else
         aTmp[ _LPGDTIK ]  := .f.
      end if
   else
      aTmp[ _LPGDTIK ]     := .t.
   end if

   /*
   Vamos a detectar si el importe de los vales es superior al tiket------------
   */

   if nTotalVale > 0 .and. nDifVale > 0
      if MsgBeepYesNo( "�Desea generar un vale por la diferencia?", "Importe de vale excede el total" )
         lGenVale          := .t.
      end if
   end if

   aTmp[ _NCOBTIK ]        := oTotDiv:nCobrado
   aTmp[ _NCAMTIK ]        := oTotDiv:nCambio

   /*
   Habilitamos de nuevo los controles para los m�s r�pidos---------------------
   */

   aEval( oDlg:aControls, {| o | o:Enable() } )

return .t.

//----------------------------------------------------------------------------//

static function CalImpCob( aTmp )

   oTotDiv:nCobrado           := nTotCobTik( nil, dbfTmpP, dbfDiv, cDivEmp() )
   oTotDiv:nVale              := nTmpValTik( dbfTmpV, dbfTikL, dbfDiv, cDivEmp() )
   oTotDiv:nAnticipo          := nTotAntFacCli( nil, dbfTmpA, dbfIva, dbfDiv, cDivEmp() )
   oTotDiv:nEntregado         := ( oTotDiv:nCobrado + oTotDiv:nVale + oTotDiv:nAnticipo )
   oTotDiv:nCobrado           := ( oTotDiv:nTotal - oTotDiv:nEntregado )
   oTotDiv:nCambio            := - ( oTotDiv:nTotal - oTotDiv:nEntregado - oTotDiv:nCobrado )

   if !Empty( oTotDiv:oEntregado )
      oTotDiv:oEntregado:Refresh()
   end if

   if !Empty( oTotDiv:oCobrado )
      oTotDiv:oCobrado:Refresh()
   end if

   if !Empty( oTotDiv:oCambio )
      oTotDiv:oCambio:Refresh()
   end if

return .t.

//-------------------------------------------------------------------------//

static function ChkCobro( aTmp )

   oTotDiv:nCambio            := - ( oTotDiv:nTotal - oTotDiv:nEntregado - oTotDiv:nCobrado )

   if !Empty( oTotDiv:oCobrado )
      oTotDiv:oCobrado:Refresh()
   end if

   if !Empty( oTotDiv:oCambio )
      oTotDiv:oCambio:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

/*
Colocamos las teclas rapidas

Static Function lCobroKeyDown( nKey, oBtnAceptarImprimir, oBtnAceptar )

   do case
   case nKey == VK_F5
      oBtnAceptarImprimir:Click()
   case nKey == VK_F6
      oBtnAceptar:Click()
   end case

Return Nil
*/

//--------------------------------------------------------------------------//

Static Function BrwVale( dbfTikT, dbfTikL, dbfIva, dbfDiv, dbfTmpV, oBrwVal, lCliente, aTmp )

   local oDlg
	local oBrw
   local aGet1
	local cGet1
   local dbfVal
   local lError         := .f.
   local oError
   local oBlock
   local cNewFil
   local oCbxOrd
   local oBtnSelect
   local oBtnUnSelect
   local cCbxOrd        := "N�mero"
   local aCbxOrd        := { 'N�mero', 'C�digo cliente', 'Nombre cliente' }
   local cCodCliente    := aTmp[ _CCLITIK ]
   local cText          := ""
   local nRecAnt        := ( dbfTikT )->( RecNo() )
   local nOrdAnt        := ( dbfTikT )->( OrdSetFocus( "cCliVal" ) )

   DEFAULT lCliente     := .f.

   /*
   Creamos un temporal para trabajar con el temporal---------------------------
   */

   cNewFil              := cGetNewFileName( cPatTmp() + "TikT" )

   dbCreate( cNewFil, aSqlStruct( aItmTik() ), cLocalDriver() )

   dbUseArea( .t., cLocalDriver(), cNewFil, cCheckArea( "TikT", @dbfVal ), .f. )
   if !NetErr()
      ( dbfVal )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfVal )->( OrdCreate( cNewFil, "cNumTik", "cSerTik + cNumTik + cSufTik", {|| Field->cSerTik + Field->cNumTik + Field->cSufTik } ) )

      ( dbfVal )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfVal )->( OrdCreate( cNewFil, "cCliTik", "cCliTik", {|| Field->cCliTik } ) )

      ( dbfVal )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfVal )->( OrdCreate( cNewFil, "cNomTik", "cNomTik", {|| Field->cNomTik } ) )
   end if

   /*
   Pasamos los datos a la temporal---------------------------------------------
   */

   ( dbfTikT )->( dbGoTop() )

   if !lCliente

      while !( dbfTikT )->( eof() )
         dbPass( dbfTikT, dbfVal, .t. )
         ( dbfTikT )->( dbSkip() )
      end while

   else

      if ( dbfTikT )->( dbSeek( cCodCliente ) )
         while ( dbfTikT )->cCliTik == cCodCliente .and. !( dbfTikT )->( eof() )
            dbPass( dbfTikT, dbfVal, .t. )
            ( dbfTikT )->( dbSkip() )
         end while
      end if

   end if

   /*
   Seleccionamos los q traiga del temporal-------------------------------------
   */

   ( dbfVal  )->( ordSetFocus( "cNumTik" ) )
   ( dbfTmpV )->( dbGoTop() )

   while !( dbfTmpV )->( eof() )
      if ( dbfVal )->( dbSeek( ( dbfTmpV )->cSerTik + ( dbfTmpV )->cNumTik + ( dbfTmpV )->cSufTik ) )
        ( dbfVal )->lSelDoc   := .t.
      end if
      ( dbfTmpV )->( dbSkip() )
   end while

   ( dbfVal  )->( ordSetFocus( "cNumTik" ) )
   ( dbfVal  )->( dbGoTop() )

   /*
   Posicinamiento--------------------------------------------------------------
   */

   DEFINE DIALOG oDlg RESOURCE "HelpEntry" TITLE 'Seleccionar vales'

      REDEFINE GET aGet1 ;
         VAR      cGet1;
			ID 		104 ;
			PICTURE	"@!" ;
         ON CHANGE( AutoSeek( nKey, nFlags, Self, oBrw, dbfVal, .t. ) );
         VALID    ( OrdClearScope( oBrw, dbfVal ) );
         COLOR    CLR_GET ;
			OF 		oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( CambiarOrd( oBrw, oCbxOrd, dbfVal ) );
         OF       oDlg

      oBrw                    := IXBrowse():New( oDlg )

      oBrw:bClrSel            := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus       := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias             := dbfVal
      oBrw:cName              := "Vale detalle"
      oBrw:bLDblClick         := {|| if( dbLock( dbfVal ), ( ( dbfVal )->lSelDoc := !( dbfVal )->lSelDoc, ( dbfVal )->( dbUnLock() ) ), ), oBrw:DrawSelect() }

      oBrw:nMarqueeStyle      := 5

      with object ( oBrw:AddCol() )
         :cHeader             := "Se. Seleccionado"
         :bStrData            := {|| "" }
         :bEditValue          := {|| ( dbfVal )->lSelDoc }
         :nWidth              := 20
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "N�mero"
         :cSortOrder          := "cLiqVal"
         :bEditValue          := {|| ( dbfVal )->cSerTik + "/" + AllTrim( ( dbfVal )->cNumTik ) + "/" + ( dbfVal )->cSufTik }
         :nWidth              := 70
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Fecha"
         :bEditValue          := {|| Dtoc( ( dbfVal )->dFecTik ) }
         :nWidth              := 70
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "C�digo cliente"
         :bEditValue          := {|| Rtrim( ( dbfVal )->cCliTik ) }
         :cSortOrder          := "cCliVal"
         :nWidth              := 75
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Nombre cliente"
         :bEditValue          := {|| AllTrim( ( dbfVal )->cNomTik ) }
         :cSortOrder          := "cNomVal"
         :nWidth              := 150
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Importe "
         :bEditValue          := {|| nTotalizer( ( dbfVal )->cSerTik + ( dbfVal )->cNumTik + ( dbfVal )->cSufTik, dbfVal, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cDivEmp(), .t. ) }
         :nWidth              := 85
         :nDataStrAlign       := 1
         :nHeadStrAlign       := 1
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Div."
         :bEditValue          := {|| cSimDiv( ( dbfVal )->cDivTik, dbfDiv ) }
         :nWidth              := 30
         :nDataStrAlign       := 1
         :nHeadStrAlign       := 1
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Sesi�n"
         :bEditValue          := {|| ( dbfVal )->cTurTik + "/" + ( dbfVal )->cSufTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Hora"
         :bEditValue          := {|| ( dbfVal )->cHorTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Caja"
         :bEditValue          := {|| ( dbfVal )->cNcjTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Cajero"
         :bEditValue          := {|| ( dbfVal )->cCcjTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Almac�n"
         :bEditValue          := {|| ( dbfVal )->cAlmTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      oBrw:CreateFromResource( 105 )

      REDEFINE BUTTON oBtnSelect;
			ID 		500 ;
			OF 		oDlg ;
         ACTION   ( ( dbfVal )->lSelDoc := .t., oBrw:DrawSelect() )

      REDEFINE BUTTON oBtnUnSelect ;
			ID 		501 ;
			OF 		oDlg ;
         ACTION   ( ( dbfVal )->lSelDoc := .f., oBrw:DrawSelect() )

		REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:end( IDOK ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5,       {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,   {|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg ;
         CENTER ;
         ON INIT  ( SetWindowText( oBtnSelect:hWnd, "&Seleccionar" ), SetWindowText( oBtnUnSelect:hWnd, "&Deseleccionar" ), oBrw:Load() )

   /*
   Guardamos los vales en el array---------------------------------------------
   */

   if oDlg:nResult == IDOK

      ( dbfTmpV )->( __dbZap() )

      ( dbfVal )->( dbGoTop() )
      while !( dbfVal )->( Eof() )

         if ( dbfVal )->lSelDoc

            if ( dbfVal )->dFecTik + uFieldEmpresa( "nDiaVale" ) > GetSysDate()
               lError   := .t.
               cText    += Space( 6 ) + "El vale " + ( dbfVal )->cSerTik + "/" +  AllTrim( ( dbfVal )->cNumTik ) + " no ha alcanzado la fecha para su liqidaci�n." + CRLF
            end if

            if ( dbfVal )->cCliTik != cCodCliente
               lError   := .t.
               cText    += Space( 6 ) + "El vale " + ( dbfVal )->cSerTik + "/" +  AllTrim( ( dbfVal )->cNumTik ) + " no pertenece al mismo cliente que el ticket." + CRLF
            endif

            if !lError
               dbPass( dbfVal, dbfTmpV, .t. )
            end if

         end if

         ( dbfVal )->( dbSkip() )

      end while

      ( dbfVal )->( dbGoTop() )

      if !Empty( cText )
         MsgStop( "Atenci�n : " +  CRLF + cText )
      end if

   end if

   /*
   Repos-----------------------------------------------------------------------
   */

   if !Empty( cNewFil ) .and. ( cNewFil )->( Used() )
      ( cNewFil )->( dbCloseArea() )
   end if

   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )
   ( dbfTikT )->( dbGoTo( nRecAnt ) )

   dbfErase( cNewFil )

   if oBrwVal != nil
      oBrwVal:Refresh()
   end if

RETURN ( oDlg:nResult == IDOK )

//-------------------------------------------------------------------------//

STATIC FUNCTION CambiarOrd( oBrw, oCbx, dbfTikT )

   local nOrd  := oCbx:nAt

   do case
      case ( nOrd == 1 )
         ( dbfTikT )->( OrdSetFocus( "cLiqVal" ) )

      case ( nOrd == 2 )
         ( dbfTikT )->( OrdSetFocus( "cCliVal" ) )

      case ( nOrd == 3 )
         ( dbfTikT )->( OrdSetFocus( "cNomVal" ) )

   end case

   oBrw:GoTop()

Return nil

//---------------------------------------------------------------------------//

/*
Estudia el cambio de precios
*/

STATIC FUNCTION lStdChange( aTmp, aGet )

   /*
   Detectamos el cambio de precio
   */

   if nOldPvp != aTmp[ _NPVPTIL ]

      /*
      Si le tipo de articulo es de acceso a preciso----------------------------
      */

      if aTmp[ _LTIPACC ] .and. !Empty( nOldPvp )
         aGet[ _NUNTTIL ]:cText( aTmp[ _NPVPTIL ] / nOldPvp )
         aGet[ _NPVPTIL ]:cText( nOldPvp )
      end if

   end if

RETURN .T.

//---------------------------------------------------------------------------//

/*
Comprueba si existen codigos repetidos
*/

STATIC FUNCTION lIsCode( aTmp, dbfTmpL, oBrw )

	local lReturn	:= .f.
   local nRecno   := ( dbfTmpL )->( RecNo() )

   /*
   Si el de tipo kit nos vamos-------------------------------------------------
   */

   if ( dbfKit )->( dbSeek( aTmp[ _CCBATIL ] ) )
      Return ( lReturn )
   end if

   /*
   Buscamos codigos iguales----------------------------------------------------
   */

   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )

      /*
      Comprobamos que el codigo y el precio sean iguales y que no sean ofertas-
      */

      if ( dbfTmpL )->cCbaTil == aTmp[ _CCBATIL ]                    .and. ;
         ( dbfTmpL )->cComTil == aTmp[ _CCOMTIL ]                    .and. ;
         ( dbfTmpL )->cCodPr1 == aTmp[ _CCODPR1 ]                    .and. ;
         ( dbfTmpL )->cValPr1 == aTmp[ _CVALPR1 ]                    .and. ;
         ( dbfTmpL )->cCodPr2 == aTmp[ _CCODPR2 ]                    .and. ;
         ( dbfTmpL )->cValPr2 == aTmp[ _CVALPR2 ]                    .and. ;
         ( dbfTmpL )->nPvpTil == aTmp[ _NPVPTIL ]                    .and. ;
         ( dbfTmpL )->nDtoLin == aTmp[ _NDTOLIN ]                    .and. ;
         Rtrim( ( dbfTmpL )->cNomTil ) == Rtrim( aTmp[ _CNOMTIL ] )

         /*
         Sumamos------------------------------------------------------------
         */

         ( dbfTmpL )->nUntTil += aTmp[ _NUNTTIL ]

         /*
         Tomamos el valor de retorno y saliendo-----------------------------
         */

         lReturn  := .t.

         exit

      end if

      ( dbfTmpL )->( dbSkip() )

   end while

   ( dbfTmpL )->( dbGoTo( nRecno ) )

   if oBrw != nil
      oBrw:Refresh()
   end if

Return ( lReturn )

//-------------------------------------------------------------------------//

STATIC FUNCTION nVentasPrevias( cCodArt, dbfTmpL, nMode )

   local nRecno         := ( dbfTmpL )->( RecNo() )
   local nVentasPrevias := 0

   if nMode == APPD_MODE

      /*
		Buscamos codigos iguales
		*/

      ( dbfTmpL )->( dbGoTop() )
      while !( dbfTmpL )->( eof() )

			/*
         Comprobamos que el codigo y el precio sean iguales y que no sean ofertas
         */

         if ( dbfTmpL )->cCbaTil == cCodArt
            nVentasPrevias += ( dbfTmpL )->nUntTil
         end if

         ( dbfTmpL )->( dbSkip() )

      end while

   end if

   ( dbfTmpL )->( dbGoTo( nRecno ) )

RETURN ( nVentasPrevias )

//-------------------------------------------------------------------------//

/*
Esta funci�n chequea las ofertas, devuelve .t. si existen ofertas
*/

STATIC FUNCTION lChkOfe( aTmp, aTik, dbfTmpL, oBrw )

	local lOfe		:= .f.
	local dFecTik	:= aTik[ _DFECTIK ]
   local nRecno   := ( dbfTmpL )->( RecNo() )

   ( dbfTmpL )->( dbGoTop() )

   WHILE !( dbfTmpL )->( eof() )

		/*
		Si ya tiene oferta, pasamos
		*/

      IF !( dbfTmpL )->LOFETIL

			/*
			Buscamos ofertas
			*/

         IF lIsOfe( dFecTik, aTmp, dbfTmpL, dbfOferta )

				/*
				Comprobamos que la oferta ya exista en pantalla
				*/

				lOfe := .t.

			END IF

		END IF

      ( dbfTmpL )->( dbSkip() )

	END WHILE

   ( dbfTmpL )->( dbGoTo( nRecno ) )

	oBrw:refresh()

RETURN lOfe

//-------------------------------------------------------------------------//

/*
Devuelve el precio de un producto este de oferta
*/

STATIC FUNCTION lIsOfe( dFecOfe, aTmp, dbfTemp, dbfOferta )

	local lPreOfe	:= .f.
   local cCodArt  := ( dbfTmpL )->cCbaTil
   local nUntArt  := ( dbfTmpL )->nUntTil

	/*
	Primero buscar si existe el articulo en la oferta
	*/

   if ( dbfOferta )->( dbSeek( cCodArt ) )

      while ( dbfOferta )->cArtOfe == cCodArt .and. !( dbfOferta )->( eof() )

			/*
			Comprobamos si esta entre las fechas
			*/

         if ( dFecOfe >= ( dbfOferta )->dIniOfe .OR. empty( ( dbfOferta )->dIniOfe ) ) .AND. ;
            ( dFecOfe <= ( dbfOferta )->dFinOfe .OR. empty( ( dbfOferta )->dFinOfe ) )

				/*
				Comprobamos que no vayamos a vender mas articulos que los del lote
				*/

            if ( dbfOferta )->nMaxOfe == 0                                 .or. ;
               nUntArt + ( dbfOferta )->nUdvOfe > ( dbfOferta )->nMaxOfe

					/*
					Comprobamos el numero de unidades a vender es igual a de la oferta
					o si al dividirlo devuelve un numero de resto 0 tendremos un
					multiplo de la oferta
					*/

               if mod( nUntArt, ( dbfOferta )->nUnvOfe ) == 0

						/*
						Cambiamos las unidades por el numero de unidades a vender
						entre los de la oferta
						Recogemos el precio de la oferta
						*/

                  ( dbfTmpL )->cNomTil  := ( dbfOferta )->CDESOFE
                  ( dbfTmpL )->nUntTil  := nUntArt / ( dbfOferta )->NUNVOFE
                  ( dbfTmpL )->nPvpTil  := ( dbfOferta )->nPreIva1
                  ( dbfTmpL )->lOfeTil  := .t.

                  lPreOfe               := .t.

						EXIT

               end if

            end if

         end if

		( dbfOferta )->( dbSkip() )

      end do

   end if

RETURN lPreOfe

//---------------------------------------------------------------------------//

/*
Comprueba si existen codigos repetidos despues de aplicar ofertas
*/

STATIC FUNCTION lIsOfeYet( dbfTmpL, oBrw )

	local aTmp
	local nRecIni
   local nRecFin  := ( dbfTmpL )->( recno() )

   ( dbfTmpL )->( dbGoTop() )

   while !( dbfTmpL )->( eof() ) .and. ( dbfTmpL )->( lastrec() ) > 1

      nRecIni  := ( dbfTmpL )->( RecNo() )
      aTmp     := dbScatter( dbfTmpL )
      ( dbfTmpL )->( dbSkip(1) )

      while !( dbfTmpL )->( eof() )

         /*
         Comprobamos que el codigo y el precio sean iguales
         */

         IF ( dbfTmpL )->cCbaTil == aTmp[ _CCBATIL ] .and. ;
            ( dbfTmpL )->cNomTil == aTmp[ _CNOMTIL ] .and. ;
            ( dbfTmpL )->nPvpTil == aTmp[ _NPVPTIL ] .and. ;
            ( dbfTmpL )->lFreTil == aTmp[ _LFRETIL ]

            /*
            Suma, Elimina el actual y Escribe en disco
            */

            aTmp[ _NUNTTIL ] += ( dbfTmpL )->NUNTTIL
            delRecno( dbfTmpL, oBrw )
            dbGather( aTmp, dbfTmpL )

         END IF

         ( dbfTmpL )->( dbSkip() )

      END WHILE

      ( dbfTmpL )->( dbGoTo( ++nRecIni ) )

	END WHILE

   ( dbfTmpL )->( dbGoTo( nRecFin ) )

RETURN NIL

//-------------------------------------------------------------------------//

/*
Cambia el picture de la divisa
*/

STATIC FUNCTION ChgDiv( cCodDiv, dbfDiv, oNumTot )

   cPouDiv              := cPouDiv( cCodDiv, dbfDiv )

   if oNumTot != nil
		oNumTot:cPicture	:= cPouDiv
		oNumTot:refresh()
   end if

   if oBrwDet != nil
		oBrwDet:refresh()
   end if

RETURN .T.

//--------------------------------------------------------------------------//

/*
Devuelve la fecha de un tiket
*/

FUNCTION dFecTik( cNumTik, uTikT )

   local dDate    := ctod( "" )

   if ValType( uTikT ) == "C"

      if ( uTikT )->( dbSeek( cNumTik ) )
         dDate    := ( uTikT )->dFecTik
      end if

   else

      if uTikT:Seek( cNumTik )
         dDate    := uTikT:dFecTik
      end if

   end if

RETURN dDate

//--------------------------------------------------------------------------//
/*
STATIC FUNCTION DisVis( PriLin, SecLin, cFilBmp )

   DEFAULT PriLin    := "Gracias por su visita"
   DEFAULT SecLin    := 0
   DEFAULT cFilBmp   := ""

	oDesVis:SetText( PriLin )
   oTotVis:SetText( SecLin )

   cFilBmp           := rtrim( cFilBmp )

   IF file( cFilBmp )
      oBmpVis:LoadBmp( cFilBmp )
   ELSE
      oBmpVis:LoadBmp( bmpEmp )
   END IF

RETURN NIL
*/
//---------------------------------------------------------------------------//

/*
Devuelve el precio de un producto en tikets
*/

function nPreTpv( uTmp, dbfTmpL )

   local nDec
   local nVdv
   local nCalculo := 0

   if valtype( uTmp ) == "A"
      nDec     := nDouDiv( uTmp[ _CDIVTIK ], dbfDiv )
      nVdv     := uTmp[ _NVDVTIK ]
   else
      nDec     := nDouDiv( ( uTmp )->cDivTik, dbfDiv )
      nVdv     := ( uTmp )->nVdvTik
   end if

   if !( dbfTmpL )->lFreTil

      nCalculo := ( dbfTmpL )->nPvpTil                       // Precio
      nCalculo -= ( dbfTmpL )->nDtoDiv                       // Dto Lineal
      nCalculo -= ( dbfTmpL )->nDtoLin * nCalculo / 100      // Dto porcentual
      nCalculo += ( dbfTmpL )->nPcmTil                       // Precio de combinado

      if nVdv != 0
         nCalculo    := Round( nCalculo / nVdv, nDec )
      end if

   end if

RETURN ( nCalculo )

//--------------------------------------------------------------------------//
//
// Devuelve el total de la venta en Facturas de un clientes determinado
//

function nVtaTik( cCodCli, dDesde, dHasta, dbfTikT, dbfTikL, dbfIva, dbfDiv )

   local nCon     := 0
   local aSta     := aGetStatus( dbfTikT )

   /*
   Facturas a Clientes -------------------------------------------------------
   */

   if ( dbfTikT )->( dbSeek( cCodCli ) )

      while ( dbfTikT )->cCliTik = cCodCli .and. !( dbfTikT )->( Eof() )

         if ( dDesde == nil .or. ( dbfTikT )->dFecTik >= dDesde ) .and.;
            ( dHasta == nil .or. ( dbfTikT )->dFecTik <= dHasta )

            if ( dbfTikT )->cTipTik == SAVTIK

               nCon  += nTotTik( ( dbfTikT )->cSerTik + (dbfTikT)->cNumTik + (dbfTikT)->cSufTik, dbfTikT, dbfTikL, dbfDiv, nil, cDivEmp(), .f. )

            elseif ( dbfTikT )->cTipTik == SAVDEV

               nCon  -= nTotTik( ( dbfTikT )->cSerTik + (dbfTikT)->cNumTik + (dbfTikT)->cSufTik, dbfTikT, dbfTikL, dbfDiv, nil, cDivEmp(), .f. )

            end if

         end if

         ( dbfTikT )->( dbSkip() )

         SysRefresh()

      end while

   end if

   SetStatus( dbfTikT, aSta )

return nCon

//----------------------------------------------------------------------------//

function nPdtTik( cCodCli, dDesde, dHasta, dbfTikT, dbfTikL, dbfTikP, dbfIva, dbfDiv )

   local nCon     := 0
   local aSta     := aGetStatus( dbfTikT )

   /*
   Facturas a Clientes -------------------------------------------------------
   */

   if ( dbfTikT )->( dbSeek( cCodCli ) )

      while ( dbfTikT )->cCliTik = cCodCli .and. !( dbfTikT )->( Eof() )

         if !( dbfTikT )->lLiqTik                                 .and.;
            ( dDesde == nil .or. ( dbfTikT )->dFecTik >= dDesde ) .and.;
            ( dHasta == nil .or. ( dbfTikT )->dFecTik <= dHasta )

            if ( dbfTikT )->cTipTik == SAVTIK

               nCon  += nTotTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, nil, cDivEmp(), .f. )
               nCon  -= nTotCobTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikP, dbfDiv, cDivEmp() )

            elseif ( dbfTikT )->cTipTik == SAVDEV

               nCon  -= nTotTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, nil, cDivEmp(), .f. )
               nCon  += nTotCobTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikP, dbfDiv, cDivEmp() )

            end if

         end if

         ( dbfTikT )->( dbSkip() )

         SysRefresh()

      end while

   end if

   SetStatus( dbfTikT, aSta )

return nCon

//----------------------------------------------------------------------------//
//
// Devuelve el total de cobros en tickets de un clientes determinado
//

function nCobTik( cCodCli, dDesde, dHasta, dbfTikT, dbfTikP, dbfIva, dbfDiv, nYear )

   local nCon     := 0
   local aSta     := aGetStatus( dbfTikT )

   ( dbfTikT )->( OrdSetFocus( "CCLITIK" ) )

   /*
   Facturas a Clientes -------------------------------------------------------
   */

   if ( dbfTikT )->( dbSeek( cCodCli ) )

      while ( dbfTikT )->cCliTik = cCodCli .and. !( dbfTikT )->( Eof() )

         if ( dDesde == nil .or. ( dbfTikT )->dFecTik >= dDesde ) .and.;
            ( dHasta == nil .or. ( dbfTikT )->dFecTik <= dHasta ) .and.;
            ( nYear == nil .or. Year( ( dbfTikT )->dFecTik ) == nYear )

            if ( dbfTikT )->cTipTik == SAVTIK

               nCon  += nTotCobTik( ( dbfTikT )->cSerTik + (dbfTikT)->cNumTik + (dbfTikT)->cSufTik, dbfTikP, dbfDiv, cDivEmp() )

            elseif ( dbfTikT )->cTipTik == SAVDEV

               nCon  -= nTotCobTik( ( dbfTikT )->cSerTik + (dbfTikT)->cNumTik + (dbfTikT)->cSufTik, dbfTikP, dbfDiv, cDivEmp() )

            end if

         end if

         ( dbfTikT )->( dbSkip() )

         SysRefresh()

      end while

   end if

   SetStatus( dbfTikT, aSta )

return nCon

//----------------------------------------------------------------------------//

FUNCTION TactilTpv( oMenuItem, oWnd, lTactil )

   local nLevel
   local oBtnEur
   local cTitle
   local lEur           := .f.

   DEFAULT  oMenuItem   := "01041"
   DEFAULT  oWnd        := oWnd()
   DEFAULT  lTactil     := .f.

   SetAutoImp()

   if oWndBig == nil

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

      if !OpenFiles( , , .t. )
         return nil
      end if

      /*
      Anotamos el movimiento para el navegador
      */

      AddMnuNext( "T.P.V. T�ctil", ProcName() )

      cTitle            := "T.P.V. T�ctil - Sesi�n : " + Trans( cCurSesion(), "######" ) + " - " + dtoc( date() )

      DEFINE SHELL oWndBig FROM 0, 0 TO 22, 80 ;
         XBROWSE ;
         TITLE    cTitle ;
         PROMPTS  "N�mero",;
                  "Fecha",;
                  "Cajero/a",;
                  "Cliente",;
                  "Matr�cula",;
                  "Sesi�n" ;
         ALIAS    ( dbfTikT );
         APPEND   ( TpvAppRec( oWndBig:oBrw, bEditB, dbfTikT, oWnd ) );
         DELETE   ( DelTpv( oWndBig:oBrw, dbfTikT ) );
         EDIT     ( TpvEdtRec( oWndBig:oBrw, bEditB, dbfTikT, oWnd ) );
         LEVEL    nLevel ;
         BIGSTYLE ;
         OF       oWnd

      oWndBig:lAutoSeek    := .f.

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Cerrado"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfTikT )->lCloTik }
         :nWidth           := 24
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Zoom16" )
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Estado"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| if( ( dbfTikT )->lAbierto, 1, if( !( dbfTikT )->lPgdTik, 2, 3 ) ) }
         :nWidth           := 24
         :AddResource( "Bullet_Square_Red_16" )
         :AddResource( "Bullet_Square_Yellow_16" )
         :AddResource( "Bullet_Square_Green_16" )
         :AddResource( "trafficlight_on_16" )
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Documento"
         :bEditValue       := {|| aTipTik() }
         :nWidth           := 55
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "N�mero"
         :bEditValue       := {|| ( dbfTikT )->cSerTik + "/" + ltrim( ( dbfTikT )->cNumTik ) + "/" + ( dbfTikT )->cSufTik }
         :nWidth           := 80
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Fecha"
         :bEditValue       := {|| dtoc( ( dbfTikT )->dFecTik ) }
         :nWidth           := 70
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Sesi�n"
         :bEditValue       := {|| Trans( ( dbfTikT )->cTurTik, "######" ) }
         :nWidth           := 40
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Hora"
         :bEditValue       := {|| ( dbfTikT )->cHorTik }
         :nWidth           := 40
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Caja"
         :bEditValue       := {|| ( dbfTikT )->cNcjTik }
         :nWidth           := 40
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Cajero"
         :bEditValue       := {|| ( dbfTikT )->cCcjTik }
         :nWidth           := 50
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Sala"
         :bEditValue       := {|| ( dbfTikT )->cCodSala }
         :nWidth           := 40
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Punto de venta"
         :bEditValue       := {|| ( dbfTikT )->cPntVenta }
         :nWidth           := 80
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Cliente"
         :bEditValue       := {|| Rtrim( ( dbfTikT )->cCliTik ) + Space( 1 ) + ( dbfTikT )->cNomTik }
         :nWidth           := 160
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Alias"
         :bEditValue       := {|| ( dbfTikT )->cAliasTik }
         :nWidth           := 70
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Total"
         :bEditValue       := {|| nTotalizer( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( ( dbfTikT )->cDivTik, dbfDiv ) }
         :nWidth           := 30
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Cobrado"
         :bEditValue       := {|| nTotCobTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikP, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBig:AddXCol() )
         :cHeader          := "Vale"
         :bEditValue       := {|| nTotValTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, if( lEur, cDivChg(), cDivEmp() ), .t. ) }
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      oWndBig:cHtmlHelp    := "Tickets t�ctil"

      oWndBig:CreateXFromCode()

      if !lTactil
         oWndBig:AddSeaBar()
      end if

      DEFINE BTNSHELL RESOURCE "NEW" OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:RecAdd(), oWndBig:oBrw:Refresh() );
			TOOLTIP 	"(A)�adir";
         HOTKEY   "A";
         LEVEL    ACC_APPD

      DEFINE BTNSHELL RESOURCE "EDIT" OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:RecEdit() );
			TOOLTIP 	"(M)odificar";
         HOTKEY   "M";
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "ZOOM" OF oWndBig ;
			NOBORDER ;
         ACTION   ( WinZooRec( oWndBig:oBrw, bEditB, dbfTikT ) );
			TOOLTIP 	"(Z)oom";
         HOTKEY   "Z";
         LEVEL    ACC_ZOOM

      DEFINE BTNSHELL RESOURCE "DEL" OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:RecDel() );
			TOOLTIP 	"(E)liminar";
         HOTKEY   "E";
         LEVEL    ACC_DELE

      DEFINE BTNSHELL oBtnEur RESOURCE "BAL_EURO" OF oWndBig ;
			NOBORDER ;
         ACTION   ( lEur := !lEur, SetHeadEuro( lEur, oWndBig ), SetHeadEuro( lEur, oWndBig, "Cobrado" ) ) ;
         TOOLTIP  "M(o)neda";
         HOTKEY   "O";
         LEVEL    ACC_ZOOM

      DEFINE BTNSHELL RESOURCE "IMP" GROUP OF oWndBig ;
			NOBORDER ;
         ACTION   ( ImpTiket( .f. ) );
         TOOLTIP  "(I)mprimir" ;
         HOTKEY   "I";
         LEVEL    ACC_IMPR

      DEFINE BTNSHELL RESOURCE "Money2_" OF oWndBig ;
         NOBORDER ;
         ACTION   ( EdtCobTik( oWndBig, .t. ) );
         TOOLTIP  "(C)obros";
         HOTKEY   "C";
         LEVEL    ACC_APPD

if !lTactilMode()

      DEFINE BTNSHELL RESOURCE "User1_" OF oWndBig ;
         NOBORDER ;
         ACTION   ( CuentasClientes( oWndBig:oBrw ) );
         TOOLTIP  "C(t)a. cliente";
         HOTKEY   "T";
         LEVEL    ACC_APPD

endif

      DEFINE BTNSHELL RESOURCE "UP" GROUP OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:oBrw:GoUp() ) ;
         TOOLTIP  "S(u)bir" ;
         HOTKEY   "U"

      DEFINE BTNSHELL RESOURCE "DOWN" GROUP OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:oBrw:GoDown() ) ;
         TOOLTIP  "(B)ajar" ;
         HOTKEY   "B"

if !lTactilMode()

      DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBig ;
			NOBORDER ;
         ACTION   ( oWndBig:end() ) ;
			TOOLTIP 	"(S)alir";
			HOTKEY   "S"
end if

      ACTIVATE SHELL oWndBig VALID ( CloseFiles() )

   else

      oWndBig:setFocus()

   end if

   if lEntCon()
      oWndBig:RecAdd()
   end if

Return Nil

//----------------------------------------------------------------------------//

Function oWndTactil()

Return oWndBrw

//----------------------------------------------------------------------------//

Static Function EdtBig( aTmp, aGet, dbfTikT, oBrw, cTot, nTot, nMode, oWnd )

   local n
   local cOrdFam
   local cTipTik
   local nOrdArt
   local cSayCcj
   local oBtnAcc
   local aGetArt
   local aTmpArt
   local cDialog
   local lLowResolution := .f.

   if !( nScreenHorzRes >= 1024 )
      MsgStop( __GSTROTOR__ + Space( 1 ) + __GSTVERSION__ + "t�ctil solo permite resoluciones de 1024 o superiores" )
      Return .f.
   end if

   if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lMaster()
      msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
      Return .f.
   end if

   if !lFamInTpv( dbfFamilia )
      MsgStop( "No hay familias de art�culos seleccionadas para trabajar con el TPV t�ctil" )
      return .f.
   end if

   if nMode == APPD_MODE .and. !lCurSesion()
      MsgStop( "No hay sesiones activas, imposible a�adir documentos" )
      return .f.
   end if

   oBtnAcc              := Array( 9 )
   aGetArt              := Array( ( dbfTikL )->( fCount() ) )
   aTmpArt              := dbBlankRec( dbfTikL )
   aTmpArt[ _NUNTTIL ]  := ""

   /*
   Modo especial para las tarifas----------------------------------------------
   */

   nSaveMode            := nMode

   /*
   Comienza la transaccion-----------------------------------------------------
   */

   if BeginTrans( aTmp, aGet, nMode, .t. )
      Return .f.
   end if

   cSayCcj              := Capitalize( RetFld( aTmp[ _CCCJTIK ], dbfUsr ) )

   /*
   Tikect ya utilizado---------------------------------------------------------
   */

   if aTmp[ _LCLOTIK ] .and. nMode == EDIT_MODE
      msgStop( "No se pueden modificar tickets cerrados." )
      Return .f.
   end if

   /*
   Posicionamos en el tag de las familias--------------------------------------
   */

   cOrdFam              := ( dbfFamilia  )->( OrdSetFocus( "nPosTpv" ) )

   if uFieldEmpresa( "lOrdNomTpv" )
      nOrdArt           := ( dbfArticulo )->( OrdSetFocus( "nNomTpv" ) )
   else
      nOrdArt           := ( dbfArticulo )->( OrdSetFocus( "nPosTpv" ) )
   end if

   oFntBrw              := TFont():New( FONT_NAME, 0, 18, .f., .f. )
   oFntTot              := TFont():New( FONT_NAME, 0, 12, .f., .f. )
   oFntEur              := TFont():New( FONT_NAME, 0, 34, .f., .t. )
   oFntNum              := TFont():New( FONT_NAME, 0, 46, .f., .t. )

   cTipTik              := aTipTik( aTmp )     // Tipo de tickets

   do case
      case nScreenHorzRes >= 1024 .and. nScreenVertRes >= 600 .and. nScreenVertRes < 768 .and. oUser():lUsrZur()
         cDialog        := "Big_Tpv_Left_1024x600"
         nNumBtnFam     :=  5
         nNumBtnArt     := 14
         lLowResolution := .t.
      case nScreenHorzRes >= 1024 .and. nScreenVertRes >= 600 .and. nScreenVertRes < 768 .and. !oUser():lUsrZur()
         cDialog        := "Big_Tpv_Right_1024x600"
         nNumBtnFam     :=  5
         nNumBtnArt     := 14
         lLowResolution := .t.
      case nScreenHorzRes >= 1024 .and. nScreenVertRes >= 768 .and. oUser():lUsrZur()
         cDialog        := "Big_Tpv_Left_1024x768"
         nNumBtnFam     :=  7
         nNumBtnArt     := 19
      case nScreenHorzRes >= 1024 .and. nScreenVertRes >= 768 .and. !oUser():lUsrZur()
         cDialog        := "Big_Tpv_Right_1024x768"
         nNumBtnFam     :=  7
         nNumBtnArt     := 19
      otherwise
         cDialog        := "Big_Tpv_Right_1024x768"
         nNumBtnFam     :=  7
         nNumBtnArt     := 19
   end case

   /*
   Inicializaci�n--------------------------------------------------------------
   */

   oBtnFam              := Array( nNumBtnFam )
   oSayFam              := Array( nNumBtnFam )
   oBtnArt              := Array( nNumBtnArt )
   oSayArt              := Array( nNumBtnArt )
   oBtnNum              := Array( 16 )

   /*
   Caja de dialogo-------------------------------------------------------------
   */

   DEFINE DIALOG  oDlgTpv ;
      RESOURCE    ( cDialog ) ;
      STYLE       nOR( DS_MODALFRAME, WS_POPUP, WS_CAPTION, WS_CLIPCHILDREN )

      /*
      Botones de las unidades_________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 1 ] ;
         ID       101 ;
         OF       oDlgTpv ;
         ACTION   ( KeyChar( "1", aTmpArt, aGetArt ) ) ;
         PROMPT   "1" ;

      oBtnNum[ 1 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 2 ] ;
         ID       102 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "2", aTmpArt, aGetArt ) );
         PROMPT   "2" ;

      oBtnNum[ 2 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 3 ] ;
         ID       103 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "3", aTmpArt, aGetArt ) );
         PROMPT   "3" ;

      oBtnNum[ 3 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 4 ] ;
         ID       104 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "4", aTmpArt, aGetArt ) );
         PROMPT   "4" ;

      oBtnNum[ 4 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 5 ] ;
         ID       105 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "5", aTmpArt, aGetArt ) );
         PROMPT   "5" ;

      oBtnNum[ 5 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 6 ] ;
         ID       106 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "6", aTmpArt, aGetArt ) );
         PROMPT   "6" ;

      oBtnNum[ 6 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 7 ] ;
         ID       107 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "7", aTmpArt, aGetArt ) );
         PROMPT   "7" ;

      oBtnNum[ 7 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 8 ] ;
         ID       108 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "8", aTmpArt, aGetArt ) );
         PROMPT   "8" ;

      oBtnNum[ 8 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 9 ] ;
         ID       109 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "9", aTmpArt, aGetArt ) );
         PROMPT   "9" ;

      oBtnNum[ 9 ]:oFont   := oFntNum

      REDEFINE BUTTON oBtnNum[ 10 ] ;
         ID       110 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "0", aTmpArt, aGetArt ) );
         PROMPT   "0" ;

      oBtnNum[ 10 ]:oFont  := oFntNum

      /*
      Boton de puesta a cero___________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 11 ] ;
         ID       111 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "C", aTmpArt, aGetArt ) );
         PROMPT   "C" ;

      oBtnNum[ 11 ]:oFont  := oFntNum

      /*
      Boton de punto decimal___________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 12 ] ;
         ID       112 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( ".", aTmpArt, aGetArt ) );
         PROMPT   "," ;

      oBtnNum[ 12 ]:oFont  := oFntNum

      /*
      Boton de +_______________________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 13 ] ;
         ID       113 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "=", aTmpArt, aGetArt ), oBrwDet:Refresh(), lRecTotal( aTmp ) );
         PROMPT   "=" ;

      oBtnNum[ 13 ]:oFont  := oFntNum

      /*
      Boton de -_______________________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 14 ] ;
         ID       114 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "-", aTmpArt, aGetArt ) );
         PROMPT   "-" ;

      oBtnNum[ 14 ]:oFont  := oFntNum

      /*
      Boton de *_______________________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 15 ] ;
         ID       115 ;
         OF       oDlgTpv;
         ACTION   ( KeyChar( "*", aTmpArt, aGetArt ), oBrwDet:Refresh(), lRecTotal( aTmp ) );
         PROMPT   "x" ;

      oBtnNum[ 15 ]:oFont  := oFntNum

      /*
      Boton de Con_______________________________________________________________
      */

      REDEFINE BUTTON oBtnNum[ 16 ] ;
         ID       116 ;
         OF       oDlgTpv;
         ACTION   ( lCombinado( ( dbfArticulo )->Codigo, aGetArt, aTmpArt, aTmp ) );
         PROMPT   "Cn" ;

      oBtnNum[ 16 ]:oFont  := oFntNum

      /*
      Familias de botones______________________________________________________
      */

      REDEFINE BUTTONBMP oBtnIni ;
         ID       501 ;
         OF       oDlgTpv;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "Star_Yellow_64" ;
         ACTION   loaIni( .f., .t., aGetArt, aTmpArt, aTmp ) ;

      for n := 1 to nNumBtnFam

      REDEFINE BUTTONBMP oBtnFam[ n ] ;
         ID       ( 201 + n ) ;
         OF       oDlgTpv;
         WHEN     ( nMode != ZOOM_MODE ) ;

      oBtnFam[ n ]:lTransparent  := .f.
      oBtnFam[ n ]:oFont   	  	 := oFntBrw

      REDEFINE SAY oSayFam[ n ] ;
         PROMPT   "";
         ID       ( 251 + n );
         OF       oDlgTpv

      next

      /*
      Boton de descipcion libre------------------------------------------------
      */

      REDEFINE BUTTONBMP oBtnFree ;
         ID       ( 301 ) ;
         OF       oDlgTpv ;
         BITMAP   "FREE_BULLET_86" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( addFreeProduct(), lRecTotal( aTmp ) );

      REDEFINE SAY oSayFree ;
         PROMPT   "Libre";
         ID       ( 801 );
         OF       oDlgTpv

      /*
      Articulos de botones______________________________________________________
      */

      for n := 1 to len( oBtnArt )

      REDEFINE BUTTONBMP oBtnArt[ n ] ;
         ID       ( 301 + n ) ;
         OF       oDlgTpv ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   Msginfo( "" ) ;

      oBtnArt[ n ]:lTransparent := .f.
      oBtnArt[ n ]:oFont   	  	:= oFntBrw

      REDEFINE SAY oSayArt[ n ] ;
         PROMPT   "";
         ID       ( 801 + n );
         OF       oDlgTpv

      next

		/*
		Detalle de Articulos____________________________________________________
		*/

      oBrwDet                    := TXBrowse():New( oDlgTpv )

      oBrwDet:bClrSel            := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwDet:bClrSelFocus       := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwDet:cAlias             := dbfTmpL

      oBrwDet:nMarqueeStyle      := 6

      with object ( oBrwDet:AddCol() )
         :cHeader                := "Inv."
         :bStrData               := {|| "" }
         :bEditValue             := {|| !Empty( ( dbfTmpL )->cCodInv ) }
         :nWidth                 := 16
         :SetCheck( { "Sel16", "Nil16" } )
      end with

      with object ( oBrwDet:AddCol() )
         :cHeader                := "Und."
         :bEditValue             := {|| AllTrim( Trans( ( dbfTmpL )->nUntTil, cPicUnd ) ) }
         :nWidth                 := 30
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
      end with

      with object ( oBrwDet:AddCol() )
         :cHeader                := "Detalle"
         :bEditValue             := {|| if( Empty( ( dbfTmpL )->cComent ), Rtrim( ( dbfTmpL )->cNomTil ) + if( !Empty( ( dbfTmpL )->cNcmTil ), " con " + ( dbfTmpL )->cNcmTil, "" ), "[*] " + Rtrim( ( dbfTmpL )->cNomTil ) + if( !Empty( ( dbfTmpL )->cNcmTil ), " con " + ( dbfTmpL )->cNcmTil, "" )) }
         :nWidth                 := 150
      end with

      with object ( oBrwDet:AddCol() )
         :cHeader                := "%Dto"
         :bEditValue             := {|| Trans( ( dbfTmpL )->nDtoLin, "@EZ 999.99" ) }
         :nWidth                 := 35
      end with

      with object ( oBrwDet:AddCol() )
         :cHeader                := "Total"
         :bEditValue             := {|| AllTrim( Trans( nTotLTpv( dbfTmpL, nDouDiv, nDorDiv ), cPorDiv ) ) }
         :nWidth                 := 60
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
      end with

      oBrwDet:CreateFromResource( 400 )

      oBrwDet:lHScroll           := .f.
      oBrwDet:lVScroll           := .f.
      oBrwDet:lRecordSelector    := .f.

   /*
   Botones para las lineas-----------------------------------------------------
   */

   REDEFINE BUTTONBMP ;
      ID       700;
      OF       oDlgTpv ;
      BITMAP   "Up32" ;
      ACTION   ( oBrwDet:GoUp(), oBrwDet:Select( 0 ), oBrwDet:Select( 1 ) ) ;

   REDEFINE BUTTONBMP ;
      ID       710;
      OF       oDlgTpv ;
      BITMAP   "Down32" ;
      ACTION   ( oBrwDet:GoDown(), oBrwDet:Select( 0 ), oBrwDet:Select( 1 )  ) ;

   REDEFINE BUTTONBMP ;
      ID       720 ;
      OF       oDlgTpv ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      ACTION   ( WinDelRec( oBrwDet, dbfTmpL, nil, nil, .t. ), lRecTotal( aTmp ) );
      BITMAP   "Garbage_Empty_32" ;

   REDEFINE BUTTONBMP ;
      ID       730 ;
      OF       oDlgTpv ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      ACTION   ( CrearDescuento( dbfTmpL, oBrwDet ), lRecTotal( aTmp ) );
      BITMAP   "Percent_32" ;

   REDEFINE BUTTONBMP ;
      ID       740 ;
      OF       oDlgTpv ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      ACTION   ( CrearInvitacion( dbfTmpL, oBrwDet ), lRecTotal( aTmp ) );
      BITMAP   "Masks_32" ;

   REDEFINE BUTTONBMP ;
      ID       750 ;
      OF       oDlgTpv ;
      WHEN     ( nMode != ZOOM_MODE ) ;
      ACTION   ( ComentariosTPV( aGetArt, aTmpArt, dbfTmpL ), oBrwDet:Refresh() );
      BITMAP   "Message_32" ;

      //ComentariosTPV( aGet, aTmp, dbfTmpL )
   /*
   Totales---------------------------------------------------------------------
   */

      oTxtTot     := TSay():ReDefine( 630, {|| "Total" }, oDlgTpv, , "G+/N", , .f., oFntEur )
      oNumTot     := TSay():ReDefine( 620, {|| Trans( nTotTik, cPorDiv ) }, oDlgTpv, , "G+/N", , .f., oFntEur )

      if !lLowResolution
         oTxtCom  := TSay():ReDefine( 640, {|| "Comensales: " + AllTrim( Str( aTmp[ _NNUMCOM ] ) ) }, oDlgTpv, , "G+/N", , .f., oFntTot )
         oTotCom  := TSay():ReDefine( 650, {|| AllTrim( Trans( nTotPax, cPorDiv ) ) + " pax." }, oDlgTpv, , "G+/N", , .f., oFntTot )
      end if

   /*
   Unidades--------------------------------------------------------------------
   */

      REDEFINE GET aGetArt[ _NUNTTIL ] VAR aTmpArt[ _NUNTTIL ];
         ID       600 ;
         FONT     oFntEur ;
         WHEN     ( nMode != ZOOM_MODE );
         OF       oDlgTpv

   /*
   Barra de porcentaje______________________________________________________
   */
      if !lLowResolution
         oMetMsg  := TMeter():ReDefine( 460, { | u | If( pCount() == 0, nMetMsg, nMetMsg := u ) },, oDlgTpv, .f.,,, .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )
      end if
   /*
   Apertura de la caja de dialogo----------------------------------------------
   */

   oDlgTpv:bStart := {|| StartEdtBig( aTmp, aGet, oDlgTpv, oBrwDet, nMode ), cTextoOfficeBar( aTmp ) }

   oDlgTpv:AddFastKey( 65, {|| if( GetKeyState( VK_CONTROL ), CreateInfoArticulo(), ) } )

   ACTIVATE DIALOG oDlgTpv ;
      ON INIT     ( LoaFam( .t., .t., aGetArt, aTmpArt, aTmp, nMode ) ) ;
      VALID       ( lValidDlgTpv( aTmp, aGet, nSaveMode ) ) ;
      CENTER

   oFntBrw:End()
   oFntTot:End()
   oFntEur:End()
   oFntNum:End()

   ( dbfFamilia  )->( OrdSetFocus( cOrdFam ) )
   ( dbfArticulo )->( OrdSetFocus( nOrdArt ) )

   /*
   Paramos el timer de recepcion de pedidos------------------------------------
   */

   lStopAvisoPedidos()

   /*
   Destruimos los objetos------------------------------------------------------
   */

   oBtnIni        := nil
   oBtnFam        := nil
   oSayFam        := nil
   oBtnArt        := nil
   oSayArt        := nil
   oBtnNum        := nil

   aTmp           := nil

   oBtnPedidos    := nil

   /*
   Salida sin grabar-----------------------------------------------------------
   */

   KillTrans()

   /*
   Escribe los datos pendientes------------------------------------------------
   */

   dbCommitAll()

Return ( oDlgTpv:nResult == IDOK )

//---------------------------------------------------------------------------//

/*
Static Function ComprobarUsuario()

   local cCodUser    := oUser():cCodigo()

   if dbSeekInOrd( cCodUser, "CCODUSE", dbfUsr )

      if ( dbfUsr )->nGrpUse  != 1

         return .f.

      end if

   end if

Return .t.
*/

//---------------------------------------------------------------------------//

Static Function lValidDlgTpv( aTmp, aGet, nSaveMode )

   local lValid      := .t.

   if ( dbfTmpL )->( LastRec() ) == 0  .or.;
      MsgYesNo( "�Desea guardar el ticket antes de salir?", "Selecciona una opci�n" )

      lValid         :=  TmpTiket( aTmp, aGet, nSaveMode, .f. )

   end if

Return lValid

//---------------------------------------------------------------------------//

Static Function StartEdtBig( aTmp, aGet, oDlgTpv, oBrwDet, nMode )

   local oBoton
   local oGrupo
   local oCarpeta

   if Empty( oOfficeBar )

      oOfficeBar           := TDotNetBar():New( 0, 0, 1020, 120, oDlgTpv, 1 )
      oOfficeBar:lPaintAll := .f.
      oOfficeBar:lDisenio  := .f.

      oOfficeBar:SetStyle( 1 )

      oDlgTpv:oTop         := oOfficeBar

      oCarpeta             := TCarpeta():New( oOfficeBar, "Inicio" )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Salones", .f. )
         oBtnTarifa        := TDotNetButton():New( 60, oGrupo, "Cup_32",                   "Gen�rico",         1, {|| GetSalaVenta( aTmp, aGet ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Otros", .f. )
         oBtnUsuario       := TDotNetButton():New( 60, oGrupo, "Security_Agent_32",        "Cambiar usuario",  1, {|| SelBigUser( aTmp, aGet, dbfUsr ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 366, "Acciones", .f. )
         oBtnRenombrar     := TDotNetButton():New( 60, oGrupo, "Note_Edit_32",             "Alias",            1, {|| RenombrarUbicacion( aTmp, aGet ) }, , {|| ( dbfTmpL )->( LastRec() ) > 0 }, .f., .f., .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "Note_Add_32",              "Nuevo ticket",     2, {|| GetNuevaVenta( aTmp, aGet ) }, , , .f., .f., .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "Note_Delete_32",           "Pendiente cobro",  3, {|| GetSalaVenta( aTmp, aGet, .t. ) }, , , .f., .f., .f. )
         oBtnEntregar      := TDotNetButton():New( 60, oGrupo, "Printer_32",               "Entregar nota",    4, {|| ClickEntrega( aTmp, aGet, oDlgTpv ) }, , , .f., .f., .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "printer_comanda_32",       "Copia comanda",    5, {|| if( GuardaVenta( aTmp, aGet ),ImpresionComanda( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ] , ,.t. ), ) }, , , .f., .f., .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "Diskdrive_32",             "Caj�n",            6, {|| oUser():OpenCajon() }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Cobrar", .f., , "" )
         oBoton            := TDotNetButton():New( 60, oGrupo, "Money2_32",                "Cobrar",           1, {|| NewTiket( aGet, aTmp, nSaveMode, aTmp[ _CTIPTIK ], .t. ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Ubicaci�n", .f., , "" )
         oBoton            := TDotNetButton():New(  60, oGrupo, "Media_stop_replace2_32",  "Cambiar ubicaci�n",1, {|| GetSalaVenta( aTmp, aGet, .f. ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 226, "Datos de cliente", .f., , "" )
         oBtnCliente       := TDotNetButton():New( 220, oGrupo, "User1_16",                "...",              1, {|| lSeleccionaCliente( aTmp ) }, , , .f., .f., .f. )
         oBtnDireccion     := TDotNetButton():New( 220, oGrupo, "Home_16",                 "...",              1, {|| lSeleccionaCliente( aTmp ) }, , , .f., .f., .f. )
         oBtnTelefono      := TDotNetButton():New( 220, oGrupo, "Mobilephone3_16",         "...",              1, {|| lSeleccionaCliente( aTmp ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Salida", .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "End32",                    "Salida",           1, {|| oDlgTpv:End() }, , , .f., .f., .f. )

      /*
      Segunda pesta�a de tpv tactil
      */

      oCarpeta             := TCarpeta():New( oOfficeBar, "Otros" )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Tipo venta", .f. )
         oBtnTipoVta       := TDotNetButton():New( 60, oGrupo, "Cashier_user1_32",         "Ticket",           1, {|| ClickButtonsMode( aTmp ) }, , , .f., .f., .f. )

      oGrupoSerie          := TDotNetGroup():New( oCarpeta, 126, "Serie: " + aTmp[ _CSERTIK ], .f. )
         oBtnUpSerie       := TDotNetButton():New( 60, oGrupoSerie, "Up32",                "Subir",            1, {|| lCambiaSerie( aTmp, .t., oGrupoSerie ) }, , {|| ( nMode == APPD_MODE ) }, .f., .f., .f. )
         oBtnDownSerie     := TDotNetButton():New( 60, oGrupoSerie, "Down32",              "Bajar",            2, {|| lCambiaSerie( aTmp, .f., oGrupoSerie ) }, , {|| ( nMode == APPD_MODE ) }, .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Otros", .f. )
         oBoton            := TDotNetButton():New( 60, oGrupo, "Users1_32",                "Comensales",       1, {|| lNumeroComensales( aTmp ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 126, "Ticket", .f. )
         oBtnUp            := TDotNetButton():New( 60, oGrupo, "Arrow_Up_Blue_Save_32",    "Subir",            1, {|| lCambiaTicket( .t., aTmp, aGet, nMode ) }, , , .f., .f., .f. )
         oBtnDown          := TDotNetButton():New( 60, oGrupo, "Arrow_Down_Blue_Save_32",  "Bajar",            2, {|| lCambiaTicket( .f., aTmp, aGet, nMode ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Pedidos", .f., , "" )
         oBoton            := TDotNetButton():New(  60, oGrupo, "SndInt32",                "Pedidos en l�nea", 1, {|| ProcesaPedidosWeb( aTmp ) }, , , .f., .f., .f. )

   end if

   /*
   Comprobamos desabilitar los botones de up and down

   if nSaveMode == APPD_MODE
      oBtnUp:lEnabled   := .f.
      oBtnDown:lEnabled := .f.
   else
      oBtnUp:lEnabled   := .t.
      oBtnDown:lEnabled := .t.
   end if
   */

   /*
   Comprobamos desabilitar los botones de la serie-----------------------------
   */

   oBtnUpSerie:lEnabled   := ( nMode == APPD_MODE )
   oBtnDownSerie:lEnabled := ( nMode == APPD_MODE )

   /*
   Llamamos al cargo-----------------------------------------------------------
   */

   CargoEdtBig( aTmp, aGet, oDlgTpv )

   /*
   Ventana maximizada----------------------------------------------------------
   */

   //oDlgTpv:Maximize()

Return ( nil )

//---------------------------------------------------------------------------//

Static Function CargoEdtBig( aTmp, aGet, oDlgTpv )

   /*
   Otras acciones--------------------------------------------------------------
   */

   if nSaveMode == APPD_MODE

      if lRecogerUsuario()
         if !SelBigUser( aTmp, aGet, dbfUsr )
            oDlgTpv:end()
            Return nil
         end if
      else
         SetBigUser( aTmp, aGet )
      end if

      if IsTrue( oSalaVentas:lPuntosVenta )

         SysRefresh()

         if uFieldEmpresa( "lShowSala" )
            GetSalaVenta( aTmp, aGet )
         else
            SetSalaVenta( aTmp, aGet )
         end if

      end if

   else

      SetBigUser( aTmp, aGet )

   end if

   /*
   Boton-----------------------------------------------------------------------
   */

   oSalaVentas:ConfigButton( oBtnTarifa, oBtnRenombrar )

   /*
   Titulo de la ventana--------------------------------------------------------
   */

   cTitleDialog( aTmp )

   /*
   Recalculo-------------------------------------------------------------------
   */

   lRecTotal( aTmp )

Return ( nil )

//---------------------------------------------------------------------------//

Static Function SetSalaVenta( aTmp, aGet )

   local oError
   local oBlock

   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   /*
   Guarda la venta actual---------------------------------------------------
   */

   if GuardaVenta( aTmp, aGet )

      /*
      Ponemos el boton generico------------------------------------------------
      */

      oSalaVentas:InitSala()

      /*
      Damos loa valores al tiket actual----------------------------------------
      */

      if Empty( oSalaVentas:cSelectedPunto )
         oSalaVentas:cSelectedPunto  := "Gen�rico"
      end if

      aTmp[ _CCODSALA   ]     := oSalaVentas:cSelectedSala
      aTmp[ _CPNTVENTA  ]     := oSalaVentas:cSelectedPunto
      aTmp[ _NTARIFA    ]     := oSalaVentas:nSelectedPrecio

      /*
      Pintamos los botones-----------------------------------------------------
      */

      oSalaVentas:ConfigButton( oBtnTarifa, oBtnRenombrar )

      /*
      Titulo de la ventana--------------------------------------------------------
      */

      cTitleDialog( aTmp )

   end if

   RECOVER USING oError

      msgStop( "Error al asignar la salas de venta" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function GetNuevaVenta( aTmp, aGet )

   /*
   Guarda la venta actual------------------------------------------------------
   */

   if GuardaVenta( aTmp, aGet )

      /*
      Nuevo registro--------------------------------------------------------------
      */

      if !BeginTrans( aTmp, aGet, APPD_MODE, .t. )

         nSaveMode            := APPD_MODE

         /*
         Articulos de inicio------------------------------------------------------
         */

         if !Empty( oBtnIni )
            oBtnIni:Click()
         end if

         /*
         Ejecutamos del nuevo el bStart-------------------------------------------
         */

         if uFieldEmpresa( "lShowSala" )
            GetSalaVenta( aTmp, aGet )
         else
            SetSalaVenta( aTmp, aGet )
         end if

         lRecTotal( aTmp )

      end if


      /*
      Titulo de la ventana--------------------------------------------------------
      */

      cTitleDialog( aTmp )

   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function GuardaVenta( aTmp, aGet, lImpresionComanda )

   local lValid      := .t.

   /*
   Vamos a comprobar q hay algo q guardar--------------------------------------
   */

   if ( dbfTmpL )->( LastRec() ) != 0

      lValid      	:= TmpTiket( aTmp, aGet, nSaveMode, .f., lImpresionComanda )

      if lValid
         nSaveMode   := EDIT_MODE
      end if

   end if

Return ( lValid )

//---------------------------------------------------------------------------//

Static Function GetTiketPendiente( aTmp, aGet )

   /*
   Guarda la venta actual------------------------------------------------------
   */

   if GuardaVenta( aTmp, aGet )

      /*
      Muestra el bot�n------------------------------------------------------------
      */

      if oSalaVentas:Tikets( oBtnTarifa, oBtnRenombrar )

         if dbSeekInOrd( oSalaVentas:cSelectedTiket(), "cNumTik", dbfTikT )

            // aTmp                    := dbScatter( dbfTikT )

            aScatter( dbfTikT, aTmp )

            if BeginTrans( aTmp, aGet, EDIT_MODE, .t. )
               Return .f.
            end if

            nSaveMode               := EDIT_MODE

            lRecTotal( aTmp )

         end if

         /*
         Titulo de la ventana--------------------------------------------------------
         */

         cTitleDialog( aTmp )

      end if

   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function cTitleDialog( aTmp )

   /*
   Titulo de la ventana--------------------------------------------------------
   */

   oDlgTpv:cTitle             := LblTitle( nSaveMode ) + "tickets a clientes "

   if !Empty( aTmp[ _CNUMTIK ] )
      oDlgTpv:cTitle          += Space( 1 )
      oDlgTpv:cTitle          += "[ Ticket : " + aTmp[ _CSERTIK ] + "/" + Alltrim( aTmp[ _CNUMTIK ] ) + "/" + Alltrim( aTmp[ _CSUFTIK ] ) + "]"
   end if

   if !Empty( oSalaVentas )

      oDlgTpv:cTitle          += Space( 1 )
      oDlgTpv:cTitle          += "[ Precio : " + oSalaVentas:cTextoPrecio() + "]"

      if !Empty( oSalaVentas:cSelectedPunto )


         if !Empty( oSalaVentas:cTextoSala() )
            oDlgTpv:cTitle    += Space( 1 )
            oDlgTpv:cTitle    += "[ Sala : " + oSalaVentas:cTextoSala() + "]"
         end if

         if !Empty( oSalaVentas:GetSelectedTexto() )
            oDlgTpv:cTitle    += Space( 1 )
            oDlgTpv:cTitle    += "[ Punto : " + Alltrim( oSalaVentas:GetSelectedTexto() ) + "]"
         end if

      end if

   end if

   if !Empty( aTmp[ _CALIASTIK ] )
      oDlgTpv:cTitle          += Space( 1 )
      oDlgTpv:cTitle          += "[ Alias : " + Rtrim( aTmp[ _CALIASTIK ] ) + "]"
   end if

   oDlgTpv:Refresh()

Return ( nil )

//---------------------------------------------------------------------------//

Static Function KeyChar( cKey, aTmpArt, aGetArt )

   do case
      case At( cKey, "0123456789" ) > 0
         aTmpArt[ _NUNTTIL ]     += cKey

      case cKey == "." .and. !( At( ".", aTmpArt[ _NUNTTIL ] ) > 0 )
         aTmpArt[ _NUNTTIL ]     += cKey

      case cKey == "-"
         if !( At( "-", aTmpArt[ _NUNTTIL ] ) > 0 )
            aTmpArt[ _NUNTTIL ]  := cKey + aTmpArt[ _NUNTTIL ]
         else
            aTmpArt[ _NUNTTIL ]  := StrTran( aTmpArt[ _NUNTTIL ], "-", "" )
         end if

      case cKey == "C"
         aTmpArt[ _NUNTTIL ]     := ""

      /*
      Multiplicamos por el numero de unidades q nos marquen--------------------
      */

      case cKey == "*"
         if !Empty( aTmpArt[ _NUNTTIL ] )
         if ( dbfTmpL )->( LastRec() ) != 0
            ( dbfTmpL )->nUntTil := Val( aTmpArt[ _NUNTTIL ] )
         end if
         aTmpArt[ _NUNTTIL ]     := ""
         end if

      /*
      Asignamos el nuevo precio------------------------------------------------
      */

      case cKey == "="
         if ( dbfTmpL )->( LastRec() ) != 0
            ( dbfTmpL )->nPvpTil := Val( aTmpArt[ _NUNTTIL ] )
         end if
         aTmpArt[ _NUNTTIL ]     := ""

   end case

   aGetArt[ _NUNTTIL ]:cText( aTmpArt[ _NUNTTIL ] )

return ( nil )

//--------------------------------------------------------------------------//

Static Function loaFam( lAvance, lRepos, aGetArt, aTmpArt, aTmp, nMode )

   local n                 := 1
   local nNumeroFamilias   := 0

   DEFAULT lAvance         := .t.
   DEFAULT lRepos          := .f.

   // Ocultamos los botones----------------------------------------------------

   aEval( oBtnFam, {|o| o:Hide() } )
   aEval( oSayFam, {|o| o:Hide() } )

   // Si estamos en modo zoom no podemos mostrar las familias------------------

   if nMode == ZOOM_MODE
      return nil
   end if

   // Posicionamiento al inicio------------------------------------------------

   if lRepos

      ( dbfFamilia )->( dbGoTop() )

      aRecFam              := {}
      aAdd( aRecFam, ( dbfFamilia )->( Recno() ) )

   end if

   // Retroceso----------------------------------------------------------------

   if ( !lRepos .and. !lAvance )

      aDel( aRecFam, len( aRecFam ), .t. )
      ( dbfFamilia )->( dbGoTo( aRecFam[ len( aRecFam ) ] ) )

   end if

   // Avance-------------------------------------------------------------------

   if ( !lRepos .and. lAvance )

      if ( dbfFamilia )->( Recno() ) != 0 .and. aScan( aRecFam, ( dbfFamilia )->( Recno() ) ) == 0
         aAdd( aRecFam, ( dbfFamilia )->( Recno() ) )
      end if

   end if

   // Nos piden avanzar montamos el boton anterior------------------------------

   if ( !lRepos .and. lAvance ) .or. ( !lRepos .and. !lAvance .and. len( aRecFam ) > 1 )

      oBtnFam[ n ]:ReLoadBitmap( "AnteriorFamilia" )
      oBtnFam[ n ]:Cargo               := .t.
      oBtnFam[ n ]:bAction             := {|| loaFam( .f., .f., aGetArt, aTmpArt, aTmp, nMode ) }
      oBtnFam[ n ]:bRClicked           := nil
      oBtnFam[ n ]:lTransparent        := .t.
      oBtnFam[ n ]:Show()

	  SetWindowText( oBtnFam[ n ]:hWnd, "" )

      oSayFam[ n ]:SetText( "Anterior" )
      oSayFam[ n ]:Show()

      n++

   end if

   // Montamos las familias----------------------------------------------------

   nNumeroFamilias         := nNumeroFamilias()

   while n <= nNumeroFamilias // ( nNumBtnFam - 1 )

      if !( dbfFamilia )->( eof() )

         if File( cFileBmpName( ( dbfFamilia )->cImgBtn ) )

            oBtnFam[ n ]:ReLoadBitmap( cFileBmpName( ( dbfFamilia )->cImgBtn ) )

         	oSayFam[ n ]:Show()
         	oSayFam[ n ]:SetText( Rtrim( ( dbfFamilia )->cNomFam ) )

			SetWindowText( oBtnFam[ n ]:hWnd, "" )

         else

			oBtnFam[ n ]:HideBitmap()

         	oSayFam[ n ]:Hide()
         	oSayFam[ n ]:SetText( Rtrim( ( dbfFamilia )->cNomFam ) )

			SetWindowText( oBtnFam[ n ]:hWnd, Rtrim( ( dbfFamilia )->cNomFam ) )

            /*
            if ( dbfFamilia )->nColBtn != 0
               oBtnFam[ n ]:SetColor( 0, ( dbfFamilia )->nColBtn )
            else
               oBtnFam[ n ]:SetColor( 0, GetSysColor( COLOR_BTNFACE ) )
            end if
            */

		 end if


         oBtnFam[ n ]:Show()
         oBtnFam[ n ]:Cargo            := .f.
         oBtnFam[ n ]:bAction          := bLoaPrd( ( dbfFamilia )->cCodFam, aGetArt, aTmpArt, aTmp )
         oBtnFam[ n ]:bRClicked        := bEdtFam( ( dbfFamilia )->cCodFam )
         oBtnFam[ n ]:lTransparent     := .f.

         ( dbfFamilia )->( dbSkip() )

      end if

      n++

   end while

   if lMostrarFamilias()

      oSayFam[ n ]:SetText( "Siguiente" )
      oSayFam[ n ]:Show()

      oBtnFam[ n ]:ReLoadBitmap( "SiguienteFamilia" )
      oBtnFam[ n ]:Cargo               := .t.
      oBtnFam[ n ]:lTransparent        := .t.
      oBtnFam[ n ]:bAction             := {|| loaFam( .t., .f., aGetArt, aTmpArt, aTmp, nMode ) }
      oBtnFam[ n ]:Show()

   end if

   /*
   Buscamos la primera familia de la nueva situaci�n---------------------------
   */

   if lRepos

      if !Empty( oBtnIni:bAction )
         Eval( oBtnIni:bAction, oBtnIni )
      end if

   else

      for n := 1 to len( oBtnFam )

         if !oBtnFam[ n ]:Cargo

            if !Empty( oBtnFam[ n ]:bAction )
               Eval( oBtnFam[ n ]:bAction, oBtnFam[ n ] )
            end if

            exit

         end if

      next

   end if

Return ( nil )

//--------------------------------------------------------------------------//

Static Function loaIni( lAvance, lInit, aGetArt, aTmpArt, aTmp )

   local n           := 1
   local nOrd        := ( dbfArticulo )->( OrdSetFocus( "nPosTcl" ) )

   DEFAULT lAvance   := .t.
   DEFAULT lInit     := .f.

   /*
   Liberamos todos los botones
   */

   if lInit

      ( dbfArticulo )->( dbGoTop() )

      aRecArt        := {}
      aAdd( aRecArt, ( dbfArticulo )->( Recno() ) )

   else

      if !lAvance

         aDel( aRecArt, len( aRecArt ), .t. )
         ( dbfArticulo )->( dbGoTo( aRecArt[ len( aRecArt  ) ] ) )

      else

         aAdd( aRecArt, ( dbfArticulo )->( Recno() ) )

      end if

   end if

   SysRefresh()

   if ( !lInit .and. len( aRecArt ) > 1 )

      oSayArt[ n ]:SetText( "Anterior" )
      oSayArt[ n ]:Show()

      oBtnArt[ n ]:ReLoadBitmap( "AnteriorArticulo" )
      oBtnArt[ n ]:Cargo         := .t.
      oBtnArt[ n ]:bAction       := {|| loaIni( .f., .f., aGetArt, aTmpArt, aTmp ) }
      oBtnArt[ n ]:bRClicked     := nil
      oBtnArt[ n ]:lTransparent  := .t.
      oBtnArt[ n ]:Show()

	  SetWindowText( oBtnArt[ n ]:hWnd, "" )

      n++

   end if

   while n <= nNumBtnArt - 1

      while !( dbfArticulo )->( eof() ) .and. n <= nNumBtnArt - 1

         if ( dbfArticulo )->nPosTcl != 0 .and. ( dbfArticulo )->lIncTcl

            if File( cFileBmpName( ( dbfArticulo )->cImagen ) )

				oBtnArt[ n ]:ReLoadBitmap( cFileBmpName( ( dbfArticulo )->cImagen ) )

            	oSayArt[ n ]:SetText( if( !Empty( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->Nombre ) ) )
           		oSayArt[ n ]:SetColor( oDlgTpv:nClrText, oDlgTpv:nClrPane )

				oSayArt[ n ]:Show()

            else

				SetWindowText( oBtnArt[ n ]:hWnd, if( !Empty( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->Nombre ) ) )
               	oBtnArt[ n ]:HideBitmap()

				/*
            	oSayArt[ n ]:SetText( "" )
				oSayArt[ n ]:SetColor( Rgb( 255, 0, 0 ), Rgb( 255, 0, 0 ) )
				*/

				oSayArt[ n ]:Hide()

            end if

            oBtnArt[ n ]:Show()
            oBtnArt[ n ]:bAction          := bAddPrd( ( dbfArticulo )->Codigo, aGetArt, aTmpArt, aTmp )
            oBtnArt[ n ]:bRClicked        := bEdtPrd( ( dbfArticulo )->Codigo )

            n++

         end if

         ( dbfArticulo )->( dbSkip() )

      end while

      if n <= nNumBtnArt - 1
         oSayArt[ n ]:Hide()
         oBtnArt[ n ]:Hide()
         oBtnArt[ n ]:bAction    := nil
         n++
      end if

   end while

   if !( dbfArticulo )->( eof() )

      oBtnArt[ n ]:ReLoadBitmap( "SiguienteArticulo" )
      oBtnArt[ n ]:bAction       := {|| loaIni( .t., .f., aGetArt, aTmpArt, aTmp ) }
      oBtnArt[ n ]:lTransparent  := .t.
      oBtnArt[ n ]:Show()

      oSayArt[ n ]:SetText( "Siguiente" )
      oSayArt[ n ]:Show()

   else

      oBtnArt[ n ]:Hide()
      oBtnArt[ n ]:bAction       := nil

      oSayArt[ n ]:Hide()

   end if

   ( dbfArticulo )->( OrdSetFocus( nOrd ) )

   SysRefresh()

Return ( nil )

//--------------------------------------------------------------------------//

Static Function bLoaPrd( cCodFam, aGetArt, aTmpArt, aTmp )

Return ( {|Self| loaPrd( cCodFam, .t., .t., aGetArt, aTmpArt, aTmp ) } )

//--------------------------------------------------------------------------//
//
// Cargo productos de la familia
//

Static Function loaPrd( cCodFam, lAvance, lInit, aGetArt, aTmpArt, aTmp )

   local n           := 1

   DEFAULT lAvance   := .t.
   DEFAULT lInit     := .f.

   /*
   Liberamos todos los botones-------------------------------------------------
   */

   if lInit

      if uFieldEmpresa( "lOrdNomTpv" )

         if dbSeekInOrd( cCodFam, "nNomTpv", dbfArticulo )

            aRecArt     := {}
            aAdd( aRecArt, ( dbfArticulo )->( Recno() ) )

         end if

      else

         if dbSeekInOrd( cCodFam, "nPosTpv", dbfArticulo )

            aRecArt     := {}
            aAdd( aRecArt, ( dbfArticulo )->( Recno() ) )

         end if

      end if

   else

      if !lAvance

         aDel( aRecArt, len( aRecArt ), .t. )

         ( dbfArticulo )->( dbGoTo( aRecArt[ len( aRecArt  ) ] ) )

      else

         aAdd( aRecArt, ( dbfArticulo )->( Recno() ) )

      end if

   end if

   SysRefresh()

   if ( !lInit .and. len( aRecArt ) > 1 )

      oBtnArt[ n ]:ReLoadBitmap( "AnteriorArticulo" )
      oBtnArt[ n ]:bAction       := {|| loaPrd( cCodFam, .f., .f., aGetArt, aTmpArt, aTmp ) }
      oBtnArt[ n ]:lTransparent  := .t.
      oBtnArt[ n ]:Cargo         := .t.
      oBtnArt[ n ]:bRClicked     := nil

	  SetWindowText( oBtnArt[ n ]:hWnd, "" )

      oBtnArt[ n ]:Show()

      oSayArt[ n ]:SetText( "Anterior" )
      oSayArt[ n ]:Show()

      n++

   end if

   while n <= nNumBtnArt - 1

      if ( dbfArticulo )->Familia == cCodFam .and. !( dbfArticulo )->( eof() )

         if ( dbfArticulo )->lIncTcl

            if File( cFileBmpName( ( dbfArticulo )->cImagen ) )

               oBtnArt[ n ]:ReLoadBitmap( cFileBmpName( ( dbfArticulo )->cImagen ) )

               SetWindowText( oBtnArt[ n ]:hWnd, "" )

            	oSayArt[ n ]:SetText( if( !Empty( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->Nombre ) ) )
            	oSayArt[ n ]:Show()

            else

			   	oBtnArt[ n ]:HideBitmap()

               SetWindowText( oBtnArt[ n ]:hWnd, if( !Empty( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->cDesTcl ), Rtrim( ( dbfArticulo )->Nombre ) ) )

            	oSayArt[ n ]:SetText( "" )
            	oSayArt[ n ]:Hide()

            end if

            oBtnArt[ n ]:Show()
            oBtnArt[ n ]:bAction       := bAddPrd( ( dbfArticulo )->Codigo, aGetArt, aTmpArt, aTmp )
            oBtnArt[ n ]:bRClicked     := bEdtPrd( ( dbfArticulo )->Codigo )

            n++

         end if

         ( dbfArticulo )->( dbSkip() )

      else

         oSayArt[ n ]:Hide()

         oBtnArt[ n ]:Hide()
         oBtnArt[ n ]:bAction          := nil

         n++

      end if

   end while

   if ( dbfArticulo )->Familia == cCodFam .and. !( dbfArticulo )->( eof() )

      oBtnArt[ n ]:ReLoadBitmap( "SiguienteArticulo" )
      oBtnArt[ n ]:bAction             := {|| loaPrd( cCodFam, .t., .f., aGetArt, aTmpArt, aTmp ) }
      oBtnArt[ n ]:lTransparent        := .t.

	  SetWindowText( oBtnArt[ n ]:hWnd, "" )

      oBtnArt[ n ]:Show()

      oSayArt[ n ]:SetText( "Siguiente" )
      oSayArt[ n ]:Show()


   else

      oSayArt[ n ]:Hide()

      oBtnArt[ n ]:bAction             := nil
      oBtnArt[ n ]:Hide()

   end if

   SysRefresh()

return ( nil )

//--------------------------------------------------------------------------//

static function bAddPrd( cCodArt, aGetArt, aTmpArt, aTmp )

return ( {|Self| AddPrd( cCodArt, aGetArt, aTmpArt, aTmp ), lRecTotal( aTmp ) } )

//--------------------------------------------------------------------------//

static function bEdtPrd( cCodArt )

return ( {|| EdtArticulo( cCodArt ) } )

//--------------------------------------------------------------------------//

static function bEdtFam( cCodFam )

return ( {|| EdtFamilia( cCodFam ) } )

//--------------------------------------------------------------------------//

static function AddPrd( cCodArt, aGetArt, aTmpArt, aTmp )

   local cCodFam
   local cCodTImp
   local lAcum                   := .f.
   local aArtSta                 := aGetStatus( dbfArticulo )
   local aFamSta                 := aGetStatus( dbfFamilia  )


   if Empty( cCodArt )
      return .t.
   end if

   /*
   Primero buscamos por codigos de barra---------------------------------------
   */

   ( dbfArticulo )->( ordSetFocus( "CodeBar" ) )

   if ( dbfArticulo )->( dbSeek( cCodArt ) )
      cCodArt                    := ( dbfArticulo )->Codigo
   end if

   ( dbfArticulo )->( ordSetFocus( "Codigo" ) )

   /*
   Ahora buscamos por el codigo interno----------------------------------------
   */

   if ( dbfArticulo )->( dbSeek( cCodArt ) )

      if !lTwoLin

         aTmpArt[ _CCBATIL ]     := cCodArt

         if !Empty( ( dbfArticulo )->cDesTik )
            aTmpArt[ _CNOMTIL ]  := ( dbfArticulo )->cDesTik
         else
            aTmpArt[ _CNOMTIL ]  := ( dbfArticulo )->Nombre
         end if

         /*
         Texto para la comanda-------------------------------------------------
         */

         if !Empty( ( dbfArticulo )->cDesCmd )
            aTmpArt[ _CNOMCMD ]  := ( dbfArticulo )->cDesCmd
         else
            aTmpArt[ _CNOMCMD ]  := aTmpArt[ _CNOMTIL ]
         end if

         /*
         Nos quedamos con el art�culo para los combinados----------------------
         */

         cCodArtAnt              := cCodArt

         /*
         Familia del art�culo--------------------------------------------------
         */

         aTmpArt[ _CFAMTIL ]     := ( dbfArticulo )->Familia
         aTmpArt[ _LTIPACC ]     := ( dbfArticulo )->lTipAcc
         aTmpArt[ _NCTLSTK ]     := ( dbfArticulo )->nCtlStock

         /*
         Obtenemos la familia y los codigos de familia-------------------------
         */

         cCodFam                 := ( dbfArticulo )->Familia
         if !Empty( cCodFam )
            aTmpArt[ _CCODFAM ]  := cCodFam
            aTmpArt[ _CGRPFAM ]  := cGruFam( cCodFam, dbfFamilia )

            /*
            Buscamos la familia del articulo y anotamos las propiedades--------
            */

            if dbSeekInOrd( cCodFam, "cCodFam", dbfFamilia )

               lAcum                := ( dbfFamilia )->lAcum

               aTmpArt[ _CCODPR1 ]  := ( dbfArticulo )->cCodPrp1
               aTmpArt[ _CCODPR2 ]  := ( dbfArticulo )->cCodPrp2

               cCodTImp             := ( dbfFamilia  )->cCodImp

            else
               aTmpArt[ _CCODPR1 ]  := Space( 10 )
               aTmpArt[ _CCODPR2 ]  := Space( 10 )
            end if

            if !Empty( cCodTImp ) .and. oTComandas:oDbf:SeekInOrd( cCodTImp, "cCodigo" )

               aTmpArt[ _CCODTIMP ] := cCodTImp
               aTmpArt[ _NORTIMP  ] := oTComandas:oDbf:nOrden

            else

               aTmpArt[ _NORTIMP ]  := 0

            end if

         end if

         /*
         Guardamos las impresoras de comandas en las lineas--------------------
         */

         aTmpArt[ _NIMPCOM1 ]    := ( dbfArticulo )->nImpCom1 - 1
         aTmpArt[ _NIMPCOM2 ]    := ( dbfArticulo )->nImpCom2 - 1

         /*
         Obtenemos el Tipo de IVA
         */

         aTmpArt[ _NIVATIL ]     := nIva( dbfIva, ( dbfArticulo )->TipoIva )
         aTmpArt[ _NPVPTIL ]     := nRetPreArt( aTmp[ _NTARIFA ], cDivEmp(), .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, .t. )

         /*
         Obtenemos el factor de conversion-------------------------------------------
         */

         if !Empty( ( dbfArticulo )->cFacCnv ) .and. ( dbfTblCnv )->( dbSeek( ( dbfArticulo )->cFacCnv ) )
            aTmpArt[ _NFACCNV ]     := ( dbfTblCnv )->nFacCnv
         end if

         /*
         Obtenemos el numero de unidades---------------------------------------------
         */

         if !Empty( aTmpArt[ _NUNTTIL ] )

            if ValType( aTmpArt[ _NUNTTIL ] ) == "C"
               aTmpArt[ _NUNTTIL ]  := Val( aTmpArt[ _NUNTTIL ] )
            end if

         else

            aTmpArt[ _NUNTTIL ]     := 1

         end if

         aTmpArt[ _CALMLIN ]        := oUser():cAlmacen()

         /*
         Imprimo en el visor el nombre y precio del art�culo-------------------
         */

         if oVisor != nil
            oVisor:SetBufferLine( { aTmpArt[ _CNOMTIL ], Trans( aTmpArt[ _NPVPTIL ], cPouDiv ) }, 1 )
         end if

         /*
         Si el articulo no esta en la lista lo agregamos-----------------------
         */

         aTmpArt[ _NNUMLIN ]        := nLastNum( dbfTmpL )

         if lAcum
            WinGather( aTmpArt, aGetArt, dbfTmpL, oBrwDet, APPD_MODE, nil, .t. )
         else
            if !lIsCode( aTmpArt, dbfTmpL, oBrwDet )
               WinGather( aTmpArt, aGetArt, dbfTmpL, oBrwDet, APPD_MODE, nil, .t. )
            end if
         end if

      else

         aTmpArt                    := dbScatter( dbfTmpL )
         aTmpArt[ _CCOMTIL ]        := cCodArt

         if !Empty( ( dbfArticulo )->cDesTik )
            aTmpArt[ _CNCMTIL ]     := ( dbfArticulo )->cDesTik
         else
            aTmpArt[ _CNCMTIL ]     := ( dbfArticulo )->Nombre
         end if

         /*
         Factor de conversion
         ----------------------------------------------------------------------
         */

         if !Empty( ( dbfArticulo )->cFacCnv ) .and. ( dbfTblCnv )->( dbSeek( ( dbfArticulo )->cFacCnv ) )
            aTmpArt[ _NFCMCNV ]     := ( dbfTblCnv )->NFACCNV
         end if

         /*
         Familia del art�culo
         */

         aTmpArt[ _CFCMTIL ]        := ( dbfArticulo )->Familia

         /*
         Importe de los productos----------------------------------------------
         */

         aTmpArt[ _NPCMTIL ]     := nRetPreArt( oSalaVentas:nSelectedCombinado, cDivEmp(), .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, uFieldEmpresa( "LBUSIMP" ) )
         aTmpArt[ _NPVPTIL ]     := cRetPreArt( aTmpArt[ _CCBATIL ], oSalaVentas:nSelectedCombinado, cDivEmp(), .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, .t. )

         lTwoLin                 := .f.

         /*
         Imprimo en el visor el nombre y precio del art�culo-------------------
         */

         if oVisor != nil
            oVisor:Say( aTmpArt[ _CNOMTIL ], Trans( aTmpArt[ _NPVPTIL ], cPouDiv ) )
         end if

         WinGather( aTmpArt, aGetArt, dbfTmpL, oBrwDet, EDIT_MODE, nil, .t. )

         /*
         si combinamos con una familia volvemos al origen----------------------
         */

         if !Empty( cCodFamAnt )
            loaPrd( cCodFamAnt, .t., .t., aGetArt, aTmpArt, aTmp )
         end if

         /*
         Limpiamos los valores usados para combinar----------------------------
         */

         cCodArtAnt              := ""
         cCodFamAnt              := ""

      end if

      /*
      Cargamos los valores por defecto de nuevo--------------------------------
      */

      aGetArt[ _NUNTTIL ]:cText( "" )
      aTmpArt[ _NPVPTIL ]        := 0

      /*
      Pintamos el buffer-------------------------------------------------------
      */

      if ( dbfFamilia )->lMostrar
         ComentariosTPV( aGetArt, aTmpArt, dbfTmpL )
         oBrwDet:Refresh()
      end if

      if oVisor != nil
         oVisor:SetBufferLine( { "Total", Trans( nTotTik, cPorDiv ) }, 2 )
         oVisor:WriteBufferLine()
      end if

   else

      MsgBeepStop( "Art�culo no encontrado" )

   end if

   /*
   Retomamos el estado del la base de datos------------------------------------
   */

   SetStatus( dbfArticulo, aArtSta )
   SetStatus( dbfFamilia,  aFamSta )

return ( nil )

//--------------------------------------------------------------------------//

Static Function EdtCob( aTmp, aGet, dbfTikP, oBrw, bWhen, bValid, nMode, aTmpTik )

	local oDlg
   local oSay
   local cSay
   local oBmpDiv
   local cImpDiv
   local oGetCaj
   local cGetCaj
   local oGetFpg
   local cGetFpg
   local oGetSubCta
   local cGetSubCta

   if nMode == APPD_MODE
      aTmp[ _NVDVPGO ]  := 1
      aTmp[ _CDIVPGO ]  := cDivEmp()
      aTmp[ _CFPGPGO ]  := cDefFpg()
      aTmp[ _CTURPGO ]  := cCurSesion()
      aTmp[ _CCODCAJ ]  := oUser():cCaja()
   end if

   cImpDiv              := cPorDiv( aTmp[ _CDIVPGO ], dbfDiv )
   cGetCaj              := RetFld( aTmp[ _CCODCAJ ], dbfCajT, "cNomCaj" )
   cGetFpg              := RetFld( aTmp[ _CFPGPGO ], dbfFPago )
   cSay                 := Num2Text( aTmp[ _NIMPTIK ] )

   DEFINE DIALOG oDlg RESOURCE "PgoTiket"

      REDEFINE GET aGet[ _CTURPGO ] VAR aTmp[ _CTURPGO ] ;
         ID       90 ;
         WHEN     ( .f. ) ;
			OF 		oDlg

      REDEFINE GET aGet[ _DPGOTIK ] VAR aTmp[ _DPGOTIK ] ;
			ID 		100 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  aGet[ _DPGOTIK ]:cText( Calendario( aTmp[ _DPGOTIK ] ) ) ;
         BITMAP   "LUPA" ;
			OF 		oDlg

      REDEFINE GET aGet[ _CPGDPOR ] VAR aTmp[ _CPGDPOR ] ;
         ID       110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
			OF 		oDlg

      /*
      Forma de pago____________________________________________________________
		*/

      REDEFINE GET aGet[ _CFPGPGO ] VAR aTmp[ _CFPGPGO ] ;
         ID       160 ;
         VALID    cFpago( aGet[ _CFPGPGO ], dbfFPago, oGetFpg ) ;
         BITMAP   "LUPA" ;
         OF       oDlg
      aGet[ _CFPGPGO ]:bHelp  := {|| BrwFPago( aGet[ _CFPGPGO ], oGetFpg, .f. ) }

      REDEFINE GET oGetFpg VAR cGetFpg ;
         ID       161 ;
         WHEN     .f.;
         OF       oDlg

      /*
		Cajas____________________________________________________________________
		*/

      REDEFINE GET aGet[ _CCODCAJ ] VAR aTmp[ _CCODCAJ ];
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    cCajas( aGet[ _CCODCAJ ], dbfCajT, oGetCaj ) ;
         ID       280 ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwCajas( aGet[ _CCODCAJ ], oGetCaj ) ) ;
         OF       oDlg

      REDEFINE GET oGetCaj VAR cGetCaj ;
         ID       281 ;
         WHEN     .f. ;
         OF       oDlg

      REDEFINE GET aGet[ _CDIVPGO ] VAR aTmp[ _CDIVPGO ];
         VALID    (  cDivOut( aGet[ _CDIVPGO ], oBmpDiv, aGet[ _NVDVPGO ], nil, nil, @cImpDiv, nil, nil, nil, nil, dbfDiv, oBandera ),;
                     aGet[ _NIMPTIK ]:SetPicture( cImpDiv ), .t. );
         PICTURE  "@!";
         ID       120 ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         ON HELP  BrwDiv( aGet[ _CDIVPGO ], oBmpDiv, aGet[ _NVDVPGO ], dbfDiv, oBandera ) ;
         OF       oDlg

		REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
         ID       121;
         OF       oDlg

      REDEFINE GET aGet[ _NVDVPGO ] VAR aTmp[ _NVDVPGO ];
			WHEN		( .F. ) ;
         ID       122 ;
         PICTURE  "@E 999,999.9999" ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ _NIMPTIK ] VAR aTmp[ _NIMPTIK ] ;
         ID       130 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oSay:SetText( Num2Text( aTmp[ _NIMPTIK ] ) ), .t. ) ;
         COLOR    CLR_GET ;
         PICTURE  ( cPorDiv ) ;
			OF 		oDlg

      REDEFINE SAY oSay VAR cSay ;
         ID       140 ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ _CCTAREC ] VAR aTmp[ _CCTAREC ] ;
         ID       150 ;
			COLOR 	CLR_GET ;
         PICTURE  ( Replicate( "X", RetLenSubCta() + 3 ) ) ;
			WHEN 		( RetLenSubCta() != 0 .AND. nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwChkSubCta( aGet[ _CCTAREC ], oGetSubCta ) ) ;
         VALID    ( MkSubCta( aGet[ _CCTAREC ], { aTmp[ _CCTAREC ] }, oGetSubCta ) );
         OF       oDlg

		REDEFINE GET oGetSubCta VAR cGetSubCta ;
         ID       151 ;
			COLOR 	CLR_GET ;
			WHEN 		.F. ;
         OF       oDlg

		REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( WinGather( aTmp, aGet, dbfTmpP, oBrw, nMode ), oDlg:end( IDOK ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

      oDlg:AddFastKey( VK_F5, {|| WinGather( aTmp, aGet, dbfTmpP, oBrw, nMode ), oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg ;
         CENTER ;
         ON INIT  ( aGet[ _CDIVPGO ]:lValid(), aGet[ _CCTAREC ]:lValid() )

   oBmpDiv:end()

Return ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

Static Function loaCli( aGet, aTmp, nMode, oTelefonoClient, oMailClient )

   local lValid      := .f.
   local cNewCodCli  := aGet[ _CCLITIK ]:VarGet()
   local lChgCodCli  := ( Empty( cOldCodCli ) .or. AllTrim( cOldCodCli ) != AllTrim( cNewCodCli ) )

   if Empty( cNewCodCli )
      Return .t.
   end if

   if At( ".", cNewCodCli ) != 0
      cNewCodCli     := PntReplace( aGet[ _CCLITIK ], "0", RetNumCodCliEmp() )
   else
      cNewCodCli     := Rjust( cNewCodCli, "0", RetNumCodCliEmp() )
   end if

   if ( dbfClient )->( dbSeek( cNewCodCli ) )

      if ( dbfClient )->lBlqCli
         msgStop( "Cliente bloqueado, no se pueden realizar operaciones de venta" )
         return .f.
      end if

      /*
      Calculo del reisgo del cliente
      */

      if oRieCli != nil
         GetRiesgo( cNewCodCli, dbfClient, oRieCli )
      end if

      if ( lChgCodCli )
         aTmp[ _LMODCLI ]  := ( dbfClient )->lModDat
      end if

      aGet[ _CCLITIK ]:cText( ( dbfClient )->Cod )

      if Empty( aGet[ _NTARIFA ]:varGet() ) .or. lChgCodCli
         aGet[ _NTARIFA ]:cText( ( dbfClient )->nTarifa )
      end if

      if ( dbfClient )->nColor != 0
         aGet[ _CNOMTIK ]:SetColor( , ( dbfClient )->nColor )
      end if

      if lChgCodCli
         aGet[ _CNOMTIK ]:cText( ( dbfClient )->Titulo  )
      end if

      if Empty( aGet[ _CDIRCLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CDIRCLI ]:cText( ( dbfClient )->Domicilio )
      end if

      if Empty( aGet[ _CPOBCLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CPOBCLI ]:cText( ( dbfClient )->Poblacion )
      end if

      if Empty( aGet[ _CTLFCLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CTLFCLI ]:cText( ( dbfClient )->Telefono )
      end if

      if Empty( aGet[ _CPRVCLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CPRVCLI ]:cText( ( dbfClient )->Provincia )
      end if

      if Empty( aGet[ _CPOSCLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CPOSCLI ]:cText( ( dbfClient )->CodPostal )
      end if

      if Empty( aGet[ _CDNICLI ]:varGet() ) .or. lChgCodCli
         aGet[ _CDNICLI ]:cText( ( dbfClient )->Nif )
      end if

      if Empty( aTmp[ _CCODGRP ] ) .or. lChgCodCli
         aTmp[ _CCODGRP ]  := ( dbfClient )->cCodGrp
      end if

      if oTelefonoClient != nil
         oTelefonoClient:SetText( ( dbfClient )->Telefono )
      end if

      if oMailClient != nil
         oMailClient:SetText( ( dbfClient )->cMeiInt )
      end if

      /*
      Descuentos desde la ficha de cliente----------------------------------
      */

      if lChgCodCli

         if !Empty( aGet[ _CDTOESP ] )
            aGet[ _CDTOESP ]:cText( ( dbfClient )->cDtoEsp )
         else
            aTmp[ _CDTOESP ]  := ( dbfClient )->cDtoEsp
         end if

         if !Empty( aGet[ _NDTOESP ] )
            aGet[ _NDTOESP ]:cText( ( dbfClient )->nDtoEsp )
         else
            aTmp[ _NDTOESP ]  := ( dbfClient )->nDtoEsp
         end if

         if !Empty( aGet[ _CDPP    ] )
            aGet[ _CDPP    ]:cText( ( dbfClient )->cDpp )
         else
            aTmp[ _CDPP    ]  := ( dbfClient )->cDpp
         end if

         if !Empty( aGet[ _NDPP    ] )
            aGet[ _NDPP    ]:cText( ( dbfClient )->nDpp )
         else
            aTmp[ _NDPP    ]  := ( dbfClient )->nDpp
         end if

      end if

      /*
      Solo si el ticket es nuevo-----------------------------------------------
      */

      if nMode == APPD_MODE

         //if Empty( aTmp[ _CSERTIK ] ) .and.
         if !Empty( ( dbfClient )->Serie ) .and. lChgCodCli
            aGet[ _CSERTIK ]:cText( ( dbfClient )->Serie )
         end if

         if Empty( aGet[ _CALMTIK ]:varGet() ) .and. lChgCodCli .and. !Empty( ( dbfClient )->cCodAlm )
            aGet[ _CALMTIK ]:cText( ( dbfClient )->cCodAlm )
            aGet[ _CALMTIK ]:lValid()
         end if

         if ( Empty( aGet[ _CCODTAR ]:varGet() ) .or. lChgCodCli ) .and. !Empty( ( dbfClient )->cCodTar )
            aGet[ _CCODTAR ]:cText( ( dbfClient )->cCodTar )
            aGet[ _CCODTAR ]:lValid()
         end if

         if ( Empty( aGet[ _CFPGTIK ]:varGet() ) .or. lChgCodCli ) .and. !Empty( ( dbfClient )->CodPago )
            if !uFieldEmpresa( "lGetFpg" )
               aGet[ _CFPGTIK ]:cText( ( dbfClient)->CodPago )
            end if
            aGet[ _CFPGTIK ]:lValid()
         end if

         if ( Empty( aGet[ _CCODAGE ]:varGet() ) .or. lChgCodCli ) .and. !Empty( ( dbfClient )->cAgente )
            aGet[ _CCODAGE ]:cText( (dbfClient)->cAgente )
            aGet[ _CCODAGE ]:lValid()
         end if

         if ( Empty( aGet[ _CCODRUT ]:varGet() ) .or. lChgCodCli ) .and. !Empty( ( dbfClient )->cCodRut )
            aGet[ _CCODRUT ]:cText( ( dbfClient)->cCodRut )
            aGet[ _CCODRUT ]:lValid()
         end if

      end if

      if ( dbfClient )->lMosCom .and. !Empty( ( dbfClient )->mComent ) .and. lChgCodCli
         MsgStop( Trim( ( dbfClient )->mComent ) )
      end if

      if lObras() .and. Empty( aTmp[ _CCODOBR ] ) .and. lChgCodCli
         msgWait( "Introduzca la obra", "Info", 0 )
         aGet[ _CCODOBR ]:SetFocus()
      end if

      cOldCodCli     := cNewCodCli
      lValid         := .t.

   else

		msgStop( "Cliente no encontrado" )

   end if

   /*
   Recalculamos el ticket por si el nuevo cliente tiene descuentos-------------
   */

   if lChgCodCli
      lRecTotal( aTmp )
   end if

Return lValid

//----------------------------------------------------------------------------//

static function TPadl( cExp, n )

return Padl( AllTrim( cExp ), n )

//----------------------------------------------------------------------------//

function SavTik2Alb( aTik, aGet, nMode, nSave )

   local nNewAlbCli
   local cSerTik                 := aTik [ _CSERTIK ]
   local cNumTik                 := aTik [ _CNUMTIK ]
   local cSufTik                 := aTik [ _CSUFTIK ]
   local aTotal

   if nMode == APPD_MODE .or. lApartado

      /*
      Nuevo numero del Albaran-------------------------------------------------
      */

      cNumTik                    := nNewDoc( aTik[ _CSERTIK ], dbfAlbCliT, "NALBCLI", , dbfCount )
      cSufTik                    := RetSufEmp()

      ( dbfAlbCliT )->( dbAppend() )

      ( dbfAlbCliT )->cSerAlb    := cSerTik
      ( dbfAlbCliT )->nNumAlb    := cNumTik
      ( dbfAlbCliT )->cSufAlb    := cSufTik
      ( dbfAlbCliT )->dFecCre    := aTik[ _DFECCRE ]
      ( dbfAlbCliT )->cTimCre    := aTik[ _CTIMCRE ]
      ( dbfAlbCliT )->dFecAlb    := aTik[ _DFECTIK ]
      ( dbfAlbCliT )->cCodUsr    := aTik[ _CCCJTIK ]
      ( dbfAlbCliT )->cTurAlb    := cCurSesion()
      ( dbfAlbCliT )->cNumDoc    := cSerTik + Str( cNumTik ) + cSufTik

      ( dbfAlbCliT )->( dbUnLock() )

      /*
      Punteros entre documentos---------------------------------------------------
      */

      aTik[ _CNUMDOC ]           := cSerTik + Str( cNumTik ) + cSufTik

   else

      /*
      Posicionamos en el albaran existente
      */

      cSerTik     := SubStr( aTik[ _CNUMDOC ], 1, 1 )
      cNumTik     := Val( SubStr( aTik[ _CNUMDOC ], 2, 9 ) )
      cSufTik     := SubStr( aTik[ _CNUMDOC ], 11, 2 )

      if !( dbfAlbCliT )->( dbSeek( aTik[ _CNUMDOC ] ) )

         ( dbfAlbCliT )->( dbAppend() )
         ( dbfAlbCliT )->cSerAlb    := cSerTik
         ( dbfAlbCliT )->nNumAlb    := cNumTik
         ( dbfAlbCliT )->cSufAlb    := cSufTik
         ( dbfAlbCliT )->dFecCre    := aTik[ _DFECCRE ]
         ( dbfAlbCliT )->cTimCre    := aTik[ _CTIMCRE ]
         ( dbfAlbCliT )->cTurAlb    := aTik[ _CTURTIK ]
         ( dbfAlbCliT )->( dbUnLock() )

      end if

      /*
      Rollback de los stocks
      */

      oStock:AlbCli( ( dbfAlbCliT )->cSerAlb + Str( ( dbfAlbCliT )->nNumAlb ) + ( dbfAlbCliT )->cSufAlb, ( dbfAlbCliT )->cCodAlm, .t., .t., .t. )

   end if

   /*
   Cabecera del albaran--------------------------------------------------------
   */

   if dbLock( dbfAlbCliT )

      ( dbfAlbCliT )->lFacturado    := .f.
      ( dbfAlbCliT )->lSndDoc       := .t.
      ( dbfAlbCliT )->lIvaInc       := .t.
      ( dbfAlbCliT )->cCodCli       := aTik[ _CCLITIK ]
      ( dbfAlbCliT )->cCodAlm       := aTik[ _CALMTIK ]
      ( dbfAlbCliT )->cCodCaj       := aTik[ _CNCJTIK ]
      ( dbfAlbCliT )->cNomCli       := aTik[ _CNOMTIK ]
      ( dbfAlbCliT )->cCodPago      := aTik[ _CFPGTIK ]
      ( dbfAlbCliT )->CDIVALB       := aTik[ _CDIVTIK ]
      ( dbfAlbCliT )->NVDVALB       := aTik[ _NVDVTIK ]
      ( dbfAlbCliT )->CRETMAT       := aTik[ _CRETMAT ]
      ( dbfAlbCliT )->CCODAGE       := aTik[ _CCODAGE ]
      ( dbfAlbCliT )->CCODRUT       := aTik[ _CCODRUT ]
      ( dbfAlbCliT )->CCODTAR       := aTik[ _CCODTAR ]
      ( dbfAlbCliT )->CCODOBR       := aTik[ _CCODOBR ]
      ( dbfAlbCliT )->NPCTCOMAGE    := aTik[ _NCOMAGE ]

      if Empty( ( dbfAlbCliT )->cTurAlb )
         ( dbfAlbCliT )->cTurAlb    := cCurSesion()
      end if

      /*
      Obtenemos los datos del cliente---------------------------------------------
      */

      ( dbfAlbCliT )->cDirCli       := aTik[ _CDIRCLI ]
      ( dbfAlbCliT )->cPobCli       := aTik[ _CPOBCLI ]
      ( dbfAlbCliT )->cPrvCli       := aTik[ _CPRVCLI ]
      ( dbfAlbCliT )->cPosCli       := aTik[ _CPOSCLI ]
      ( dbfAlbCliT )->cDniCli       := aTik[ _CDNICLI ]

      ( dbfAlbCliT )->( dbUnLock() )

   end if

   /*
   Ahora pasamos las lineas de detalle-----------------------------------------
   */

   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )

      ( dbfAlbCliL )->( dbAppend() )
      ( dbfAlbCliL )->CSERALB    := ( dbfAlbCliT )->CSERALB
      ( dbfAlbCliL )->NNUMALB    := ( dbfAlbCliT )->NNUMALB
      ( dbfAlbCliL )->CSUFALB    := ( dbfAlbCliT )->CSUFALB
      ( dbfAlbCliL )->CREF       := ( dbfTmpL    )->CCBATIL
      ( dbfAlbCliL )->CDETALLE   := ( dbfTmpL    )->CNOMTIL
      ( dbfAlbCliL )->NPREUNIT   := ( dbfTmpL    )->NPVPTIL //Round( ( dbfTmpL )->NPVPTIL / ( 1 + ( ( dbfTmpL )->NIVATIL / 100 ) ), nDouDiv )
      ( dbfAlbCliL )->NDTO       := ( dbfTmpL    )->NDTOLIN
      ( dbfAlbCliL )->NIVA       := ( dbfTmpL    )->NIVATIL
      ( dbfAlbCliL )->NUNICAJA   := ( dbfTmpL    )->NUNTTIL
      ( dbfAlbCliL )->CCODPR1    := ( dbfTmpL    )->CCODPR1
      ( dbfAlbCliL )->CCODPR2    := ( dbfTmpL    )->CCODPR2
      ( dbfAlbCliL )->CVALPR1    := ( dbfTmpL    )->CVALPR1
      ( dbfAlbCliL )->CVALPR2    := ( dbfTmpL    )->CVALPR2
      ( dbfAlbCliL )->NFACCNV    := ( dbfTmpL    )->NFACCNV
      ( dbfAlbCliL )->NDTODIV    := ( dbfTmpL    )->NDTODIV
      ( dbfAlbCliL )->nCtlStk    := ( dbfTmpL    )->nCtlStk
      ( dbfAlbCliL )->nValImp    := ( dbfTmpL    )->nValImp
      ( dbfAlbCliL )->cCodImp    := ( dbfTmpL    )->cCodImp
      ( dbfAlbCliL )->lKitChl    := ( dbfTmpL    )->lKitChl
      ( dbfAlbCliL )->lKitArt    := ( dbfTmpL    )->lKitArt
      ( dbfAlbCliL )->lKitPrc    := ( dbfTmpL    )->lKitPrc
      ( dbfAlbCliL )->mNumSer    := ( dbfTmpL    )->mNumSer
      ( dbfAlbCliL )->lIvaLin    := .t.
      ( dbfAlbCliL )->( dbUnLock() )

      ( dbfTmpL )->( dbSkip() )

   end while

   oStock:AlbCli( ( dbfAlbCliT )->cSerAlb + Str( ( dbfAlbCliT )->nNumAlb ) + ( dbfAlbCliT )->cSufAlb, ( dbfAlbCliT )->cCodAlm, .f., .f., .t. )

   /*
   Rollback de los pagos-------------------------------------------------------
   */

   while ( dbfAlbCliP )->( dbSeek( ( dbfAlbCliT )->cSerAlb + Str( ( dbfAlbCliT )->nNumAlb ) + ( dbfAlbCliT )->cSufAlb ) ) .and. !( dbfAlbCliP )->( eof() )

      if dbLock( dbfAlbCliP )
         ( dbfAlbCliP )->( dbDelete() )
         ( dbfAlbCliP )->( dbUnLock() )
      end if

      ( dbfAlbCliP )->( dbSkip() )

   end while

   /*
   Trasbase de nuevos pagos----------------------------------------------------
   */

   ( dbfTmpE )->( dbGoTop() )

   while !( dbfTmpE )->( eof() )

      ( dbfAlbCliP )->( dbAppend() )

      ( dbfAlbCliP )->cSerAlb    := cSerTik
      ( dbfAlbCliP )->nNumAlb    := cNumTik
      ( dbfAlbCliP )->cSufAlb    := cSufTik
      ( dbfAlbCliP )->nNumRec    := ( dbfTmpE )->nNumRec
      ( dbfAlbCliP )->cCodCaj    := ( dbfTmpE )->cCodCaj
      ( dbfAlbCliP )->cTurRec    := ( dbfTmpE )->cTurRec
      ( dbfAlbCliP )->cCodCli    := ( dbfTmpE )->cCodCli
      ( dbfAlbCliP )->dEntrega   := ( dbfTmpE )->dEntrega
      ( dbfAlbCliP )->nImporte   := ( dbfTmpE )->nImporte
      ( dbfAlbCliP )->cDescrip   := ( dbfTmpE )->cDescrip
      ( dbfAlbCliP )->cPgdoPor   := ( dbfTmpE )->cPgdoPor
      ( dbfAlbCliP )->cDivPgo    := ( dbfTmpE )->cDivPgo
      ( dbfAlbCliP )->nVdvPgo    := ( dbfTmpE )->nVdvPgo
      ( dbfAlbCliP )->cCodAge    := ( dbfTmpE )->cCodAge
      ( dbfAlbCliP )->cCodPgo    := ( dbfTmpE )->cCodPgo
      ( dbfAlbCliP )->lCloPgo    := .f.
      ( dbfAlbCliP )->lPasado    := ( dbfTmpE )->lPasado

      ( dbfAlbCliP )->( dbUnLock() )

      ( dbfTmpE )->( dbSkip() )

   end while

   /*
   Rellenamos los campos de los totales----------------------------------------
   */

   aTotal            := aTotAlbCli( aTik[ _CNUMDOC ], dbfAlbCliT, dbfAlbCliL, dbfIva, dbfDiv )

   aTik[ _NTOTNET ]  := aTotal[1]
   aTik[ _NTOTIVA ]  := aTotal[2]
   aTik[ _NTOTTIK ]  := aTotal[4]

   if dbLock( dbfAlbCliT )
      ( dbfAlbCliT )->nTotNet    := aTotal[1]
      ( dbfAlbCliT )->nTotIva    := aTotal[2]
      ( dbfAlbCliT )->nTotReq    := aTotal[3]
      ( dbfAlbCliT )->nTotAlb    := aTotal[4]
      ( dbfAlbCliT )->( dbUnLock() )
   end if

   /*
   Escribimos definitivamente en el disco--------------------------------------
   */

   WinGather( aTik, aGet, dbfTikT, oBrwDet, nMode, nil, .t. )

return ( nNewAlbCli )

//----------------------------------------------------------------------------//

Function nTotalizer( cNumTik, cTikT, cTikL, cTikP, cAlbCliT, cAlbCliL, cFacCliT, cFacCliL, cFacCliP, cIva, cDiv, cCodDiv, lPic )

   local uTotal
   local aTotal         := {}

   DEFAULT cTikT        := dbfTikT
   DEFAULT cTikL        := dbfTikL
   DEFAULT cTikP        := dbfTikP
   DEFAULT cAlbCliT     := dbfAlbCliT
   DEFAULT cAlbCliL     := dbfAlbCliL
   DEFAULT cFacCliT     := dbfFacCliT
   DEFAULT cFacCliL     := dbfFacCliL
   DEFAULT cFacCliP     := dbfFacCliP
   DEFAULT cIva         := dbfIva
   DEFAULT cDiv         := dbfDiv
   DEFAULT cNumTik      := ( cTikT )->cSerTik + ( cTikT )->cNumTik + ( cTikT )->cSufTik
   DEFAULT lPic         := .t.

   public nTotAlb       := 0
   public nTotFac       := 0
   public aBrtTik       := { 0, 0, 0 }
   public aBasTik       := { 0, 0, 0 }
   public aImpTik       := { 0, 0, 0 }
   public aIvaTik       := { nil, nil, nil }
   public aIvmTik       := { 0, 0, 0 }

   uTotal               := if( lPic, "0", 0 )

   do case
      case ( cTikT )->cTipTik == SAVALB // Como albaran

         if ( cAlbCliT )->( dbSeek( ( cTikT )->cNumDoc ) )

            aTotal      := aTotAlbCli( ( cTikT )->cNumDoc, cAlbCliT, cAlbCliL, cIva, cDiv )

            uTotal      := aTotal[ 4 ]
            nTotAlb     := uTotal

            aBrtTik     := { aTotal[ 8 ][ 1, 1 ], aTotal[ 8 ][ 2, 1 ], aTotal[ 8 ][ 3, 1 ] }
            aBasTik     := { aTotal[ 8 ][ 1, 2 ], aTotal[ 8 ][ 2, 2 ], aTotal[ 8 ][ 3, 2 ] }
            aImpTik     := { aTotal[ 8 ][ 1, 8 ], aTotal[ 8 ][ 2, 8 ], aTotal[ 8 ][ 3, 8 ] }
            aIvaTik     := { aTotal[ 8 ][ 1, 3 ], aTotal[ 8 ][ 2, 3 ], aTotal[ 8 ][ 3, 3 ] }
            aIvmTik     := { aTotal[ 8 ][ 1, 6 ], aTotal[ 8 ][ 2, 6 ], aTotal[ 8 ][ 3, 6 ] }

         end if

      case ( cTikT )->cTipTik == SAVFAC // Como factura

         if ( cFacCliT )->( dbSeek( ( cTikT )->cNumDoc ) )

            aTotal      := aTotFacCli( ( cTikT )->cNumDoc, cFacCliT, cFacCliL, cIva, cDiv, cFacCliP )

            uTotal      := aTotal[ 4 ]
            nTotFac     := uTotal

            aBrtTik     := { aTotal[ 8 ][ 1, 1 ], aTotal[ 8 ][ 2, 1 ], aTotal[ 8 ][ 3, 1 ] }
            aBasTik     := { aTotal[ 8 ][ 1, 2 ], aTotal[ 8 ][ 2, 2 ], aTotal[ 8 ][ 3, 2 ] }
            aImpTik     := { aTotal[ 8 ][ 1, 8 ], aTotal[ 8 ][ 2, 8 ], aTotal[ 8 ][ 3, 8 ] }
            aIvaTik     := { aTotal[ 8 ][ 1, 3 ], aTotal[ 8 ][ 2, 3 ], aTotal[ 8 ][ 3, 3 ] }
            aIvmTik     := { aTotal[ 8 ][ 1, 6 ], aTotal[ 8 ][ 2, 6 ], aTotal[ 8 ][ 3, 6 ] }

         end if

      otherwise

         uTotal         := nTotTik( cNumTik, cTikT, cTikL, cDiv, nil, cCodDiv, lPic )

         // nTotVal        := nTotValTik( cNumTik, cTikT, cTikL, cDiv, cCodDiv )

   end case

return ( uTotal )

//----------------------------------------------------------------------------//

Static Function nChkalizer( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cCodDiv )

   local nPgo     := 1
   local aStatus  := aGetStatus( dbfTikT, .t. )
   local nRec     := ( dbfFacCliT )->( RecNo() )
   local nOrdAnt  := ( dbfFacCliT )->( OrdSetFocus( "NNUMFAC" ) )

   If ( dbfTikT )->( dbSeek( cNumTik ) )

      Do Case
      Case ( dbfTikT )->cTipTik == SAVALB // Como albaran

         if RetFld( ( dbfTikT )->cNumDoc, dbfAlbCliT, "lFacturado" )
            nPgo  := 1
         else
            nPgo  := 3
         end if

      Case ( dbfTikT )->cTipTik == SAVFAC // Como factura

         if ( dbfFacCliT )->( dbSeek( ( dbfTikT )->cNumDoc ) )
            nPgo  := nChkPagFacCli( ( dbfTikT )->cNumDoc, dbfFacCliT, dbfFacCliP )
         else
            nPgo  := 3
         end if

      Case ( dbfTikT )->cTipTik == SAVVAL // Como Vale

         nPgo     := if( ( dbfTikT )->lLiqTik, 1, 3 )

      Otherwise

         nPgo     := nChkPagTik( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfIva, dbfDiv )

      End Case

   End if

   ( dbfFacCliT )->( OrdSetFocus( nOrdAnt ) )
   ( dbfFacCliT )->( dbGoTo( nRec ) )

   SetStatus( dbfTikT, aStatus )

Return ( nPgo )

//----------------------------------------------------------------------------//

Function nCobalizer( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cCodDiv, lPic )

   local nPgo     := if( lPic, "", 0 )
   local aStatus  := aGetStatus( dbfTikT, .t. )

   If ( dbfTikT )->( dbSeek( cNumTik ) )

      Do Case
      Case ( dbfTikT )->cTipTik == SAVFAC // Como factura

         nPgo     := nPagFacCli( ( dbfTikT )->cNumDoc, dbfFacCliT, dbfFacCliP, dbfIva, dbfDiv, cCodDiv, .t., lPic )

      Case  ( dbfTikT )->cTipTik == SAVTIK .or.;
            ( dbfTikT )->cTipTik == SAVDEV .or.;
            ( dbfTikT )->cTipTik == SAVAPT .or.;
            ( dbfTikT )->cTipTik == SAVVAL

         nPgo     := nTotCobTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikP, dbfDiv, cCodDiv, lPic )

      End Case

   End if

   SetStatus( dbfTikT, aStatus )

Return ( nPgo )

//----------------------------------------------------------------------------//

Function nDifalizer( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfAntCliT, dbfIva, dbfDiv, cCodDiv, lPic )

   local cPorDiv  := cPorDiv( cCodDiv, dbfDiv ) // Picture de la divisa redondeada
   local nTot     := nTotalizer( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cCodDiv, .f. )
   nTot           -= nCobalizer( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cCodDiv, .f. )
   nTot           -= nTotValTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, cCodDiv, .f. )
   nTot           -= nTotAntFacCli( ( dbfTikT )->cNumDoc, dbfAntCliT, dbfIva, dbfDiv, cCodDiv, .f. )

Return ( if( lPic, Trans( nTot, cPorDiv ), nTot ) )

//---------------------------------------------------------------------------//

static function LoaAlb2Tik()

   if ( dbfAlbCliL )->( DbSeek( ( dbfTikT )->cNumDoc ) )
      while ( ( dbfAlbCliL )->CSERALB + Str( ( dbfAlbCliL )->NNUMALB ) + ( dbfAlbCliL )->CSUFALB == ( dbfTikT )->cNumDoc .and. !( dbfAlbCliL )->( eof() ) )

         ( dbfTmpL )->( dbAppend() )
         ( dbfTmpL )->cCbaTil    := ( dbfAlbCliL )->CREF
         ( dbfTmpL )->cNomTil    := ( dbfAlbCliL )->CDETALLE
         ( dbfTmpL )->nPvpTil    := ( dbfAlbCliL )->NPREUNIT // ( ( dbfAlbCliL )->NPREUNIT * ( dbfAlbCliL )->NIVA / 100 ) + ( dbfAlbCliL )->NPREUNIT
         ( dbfTmpL )->nDtoLin    := ( dbfAlbCliL )->NDTO
         ( dbfTmpL )->nIvaTil    := ( dbfAlbCliL )->NIVA
         ( dbfTmpL )->nUntTil    := If( ( dbfAlbCliL )->NCANENT != 0, ( dbfAlbCliL )->NCANENT, 1 ) * ( dbfAlbCliL )->NUNICAJA
         ( dbfTmpL )->cCodPr1    := ( dbfAlbCliL )->CCODPR1
         ( dbfTmpL )->cCodPr2    := ( dbfAlbCliL )->CCODPR2
         ( dbfTmpL )->cValPr1    := ( dbfAlbCliL )->CVALPR1
         ( dbfTmpL )->cValPr2    := ( dbfAlbCliL )->CVALPR2
         ( dbfTmpL )->nFacCnv    := ( dbfAlbCliL )->NFACCNV
         ( dbfTmpL )->nDtoDiv    := ( dbfAlbCliL )->NDTODIV // * ( dbfAlbCliL )->NIVA / 100 ) + ( dbfAlbCliL )->NDTODIV
         ( dbfTmpL )->nCtlStk    := ( dbfAlbCliL )->nCtlStk
         ( dbfTmpL )->nValImp    := ( dbfAlbCliL )->nValImp
         ( dbfTmpL )->cCodImp    := ( dbfAlbCliL )->cCodImp
         ( dbfTmpL )->mNumSer    := ( dbfAlbCliL )->mNumSer
         ( dbfTmpL )->( dbRUnLock() )

         ( dbfAlbCliL )->( dbSkip() )

      end while
   end if
  ( dbfTmpL )->( dbGoTop() )

return nil

//---------------------------------------------------------------------------//

function SavTik2Fac( aTik, aGet, nMode, nSave, nTotal )

   local nNumRec                 := 0
   local cSerFacCli
   local nNewFacCli
   local cSufFacCli
   local cCliFacCli
   local cNomFacCli
   local cCliTik                 := aTik[ _CCLITIK ]
   local aTotal

   if nMode == DUPL_MODE
      aTik[ _CNUMTIK ]           := Str( nNewDoc( aTik[ _CSERTIK ], dbfTikT, "NTIKCLI", 10, dbfCount ), 10 )
      aTik[ _CSUFTIK ]           := RetSufEmp()
      aTik[ _DFECTIK ]           := GetSysDate()
      aTik[ _LSNDDOC ]           := .t.
      aTik[ _LCLOTIK ]           := .f.
   end if

   if nMode == APPD_MODE .or. nMode == DUPL_MODE .or. lApartado

      /*
      Nuevo numero de la Nueva Factura-----------------------------------------
      */

      cSerFacCli                 := aTik[ _CSERTIK ]
      nNewFacCli                 := nNewDoc( aTik [ _CSERTIK ], dbfFacCliT, "NFACCLI", , dbfCount )
      cSufFacCli                 := RetSufEmp()
      cCliFacCli                 := aTik[ _CCLITIK ]
      cNomFacCli                 := aTik[ _CNOMTIK ]

      ( dbfFacCliT )->( dbAppend() )
      ( dbfFacCliT )->cSerie     := cSerFacCli
      ( dbfFacCliT )->nNumFac    := nNewFacCli
      ( dbfFacCliT )->cSufFac    := cSufFacCli
      ( dbfFacCliT )->cTurFac    := cCurSesion()
      ( dbfFacCliT )->dFecCre    := aTik[ _DFECCRE ]
      ( dbfFacCliT )->cTimCre    := aTik[ _CTIMCRE ]
      ( dbfFacCliT )->dFecFac    := aTik[ _DFECTIK ]
      ( dbfFacCliT )->cCodUsr    := aTik[ _CCCJTIK ]
      ( dbfFacCliT )->cNumDoc    := aTik[ _CSERTIK ] + aTik[ _CNUMTIK ] + aTik[ _CSUFTIK ]
      ( dbfFacCliT )->( dbUnLock() )

      /*
      Punteros entre documentos------------------------------------------------
      */

      aTik[ _CNUMDOC ]           := aTik[ _CSERTIK ] + Str( nNewFacCli ) + aTik[ _CSUFTIK ]

   else

      cSerFacCli                 := ( dbfFacCliT )->cSerie
      nNewFacCli                 := ( dbfFacCliT )->nNumFac
      cSufFacCli                 := ( dbfFacCliT )->cSufFac
      cCliFacCli                 := aTik[ _CCLITIK ]
      cNomFacCli                 := aTik[ _CNOMTIK ]

      /*
      Posicionamos en el factura existente-------------------------------------
      */

      if ( dbfFacCliT )->( dbSeek( aTik[ _CNUMDOC ] ) )

         /*
         Rollback de los stocks------------------------------------------------
         */

         if dbLock( dbfFacCliT )
            oStock:FacCli( ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac, ( dbfFacCliT )->cCodAlm, .t., .t., .t. )
            ( dbfFacCliT )->( dbUnLock() )
         end if

      else

         MsgStop( "No se encuentra documento asociado" )
         return nil

      end if

   end if

   /*
   Bloqueamos para escribir en la factura--------------------------------------
   */

   if dbLock( dbfFacCliT )

      if Empty( ( dbfFacCliT )->dFecFac )
         ( dbfFacCliT )->dFecFac    := aTik[ _DFECTIK ]
      end if

      ( dbfFacCliT )->cCodAlm       := aTik[ _CALMTIK ]
      ( dbfFacCliT )->cCodCaj       := aTik[ _CNCJTIK ]
      ( dbfFacCliT )->cCodCli       := aTik[ _CCLITIK ]
      ( dbfFacCliT )->cNomCli       := aTik[ _CNOMTIK ]
      ( dbfFacCliT )->cDirCli       := aTik[ _CDIRCLI ]
      ( dbfFacCliT )->cPobCli       := aTik[ _CPOBCLI ]
      ( dbfFacCliT )->cPrvCli       := aTik[ _CPRVCLI ]
      ( dbfFacCliT )->cPosCli       := aTik[ _CPOSCLI ]
      ( dbfFacCliT )->cDniCli       := aTik[ _CDNICLI ]
      ( dbfFacCliT )->cCodPago      := aTik[ _CFPGTIK ]
      ( dbfFacCliT )->cDivFac       := aTik[ _CDIVTIK ]
      ( dbfFacCliT )->nVdvFac       := aTik[ _NVDVTIK ]
      ( dbfFacCliT )->cRetMat       := aTik[ _CRETMAT ]
      ( dbfFacCliT )->cCodAge       := aTik[ _CCODAGE ]
      ( dbfFacCliT )->cCodRut       := aTik[ _CCODRUT ]
      ( dbfFacCliT )->cCodTar       := aTik[ _CCODTAR ]
      ( dbfFacCliT )->cCodObr       := aTik[ _CCODOBR ]
      ( dbfFacCliT )->nPctComAge    := aTik[ _NCOMAGE ]
      ( dbfFacCliT )->lSndDoc       := .t.
      ( dbfFacCliT )->lIvaInc       := .t.

      ( dbfFacCliT )->( dbUnLock() )

   end if

   /*
   Ahora pasamos las lineas de detalle-----------------------------------------
   */

   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )

      ( dbfFacCliL )->( dbAppend() )
      ( dbfFacCliL )->cSerie     := cSerFacCli
      ( dbfFacCliL )->nNumFac    := nNewFacCli
      ( dbfFacCliL )->cSufFac    := cSufFacCli
      ( dbfFacCliL )->cRef       := ( dbfTmpL    )->cCbaTil
      ( dbfFacCliL )->cDetalle   := ( dbfTmpL    )->cNomTil
      ( dbfFacCliL )->nPreUnit   := ( dbfTmpL    )->nPvpTil // Round( ( dbfTmpL )->NPVPTIL / ( 1 + ( ( dbfTmpL )->NIVATIL / 100 ) ), nDouDiv )
      ( dbfFacCliL )->nDto       := ( dbfTmpL    )->nDtoLin
      ( dbfFacCliL )->nIva       := ( dbfTmpL    )->nIvaTil
      ( dbfFacCliL )->nUniCaja   := ( dbfTmpL    )->nUntTil
      ( dbfFacCliL )->cCodPr1    := ( dbfTmpL    )->cCodPr1
      ( dbfFacCliL )->cCodPr2    := ( dbfTmpL    )->cCodPr2
      ( dbfFacCliL )->cValPr1    := ( dbfTmpL    )->cValPr1
      ( dbfFacCliL )->cValPr2    := ( dbfTmpL    )->cValPr2
      ( dbfFacCliL )->nFacCnv    := ( dbfTmpL    )->nFacCnv
      ( dbfFacCliL )->nDtoDiv    := ( dbfTmpL    )->nDtoDiv
      ( dbfFacCliL )->nCtlStk    := ( dbfTmpL    )->nCtlStk
      ( dbfFacCliL )->nValImp    := ( dbfTmpL    )->nValImp
      ( dbfFacCliL )->cCodImp    := ( dbfTmpL    )->cCodImp
      ( dbfFacCliL )->lKitPrc    := ( dbfTmpL    )->lKitPrc
      ( dbfFacCliL )->lKitArt    := ( dbfTmpL    )->lKitArt
      ( dbfFacCliL )->lKitChl    := ( dbfTmpL    )->lKitChl
      ( dbfFacCliL )->mNumSer    := ( dbfTmpL    )->mNumSer
      ( dbfFacCliL )->lIvaLin    := .t.
      ( dbfFacCliL )->( dbUnLock() )

      ( dbfTmpL )->( dbSkip() )

   end while

   oStock:FacCli( ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac, ( dbfFacCliT )->cCodAlm, .f., .f., .t. )

   /*
   Rollback de los pagos-------------------------------------------------------
   */

   while ( dbfFacCliP )->( dbSeek( ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac ) ) .and. !( dbfFacCliP )->( eof() )

      // addRiesgo( ( dbfFacCliP )->nImporte, cCliTik, dbfClient )

      if dbLock( dbfFacCliP )
         ( dbfFacCliP )->( dbDelete() )
         ( dbfFacCliP )->( dbUnLock() )
      end if

      ( dbfFacCliP )->( dbSkip() )

   end while

   /*
   Trasbase de nuevos pagos----------------------------------------------------
   */

   ( dbfTmpP )->( dbGoTop() )
   while !( dbfTmpP )->( eof() )

      ( dbfFacCliP )->( dbAppend() )

      ( dbfFacCliP )->lCobrado   := .t. // ( RetFld( aTik[ _CFPGTIK ], dbfFPago, "nCobRec" ) == 1 )
      ( dbfFacCliP )->cSerie     := cSerFacCli
      ( dbfFacCliP )->nNumFac    := nNewFacCli
      ( dbfFacCliP )->cSufFac    := cSufFacCli
      ( dbfFacCliP )->nNumRec    := ++nNumRec
      ( dbfFacCliP )->cCodCli    := cCliFacCli
      ( dbfFacCliP )->cNomCli    := cNomFacCli
      ( dbfFacCliP )->cCodCaj    := oUser():cCaja()
      ( dbfFacCliP )->dFecCre    := GetSysDate()
      ( dbfFacCliP )->cHorCre    := SubStr( Time(), 1, 5 )
      ( dbfFacCliP )->dPreCob    := aTik[ _DFECTIK ]
      ( dbfFacCliP )->dFecVto    := aTik[ _DFECTIK ]
      ( dbfFacCliP )->cCodPgo    := aTik[ _CFPGTIK ]
      ( dbfFacCliP )->dEntrada   := ( dbfTmpP )->dPgoTik
      ( dbfFacCliP )->cDivPgo    := ( dbfTmpP )->cDivPgo
      ( dbfFacCliP )->nVdvPgo    := ( dbfTmpP )->nVdvPgo
      ( dbfFacCliP )->cPgdoPor   := ( dbfTmpP )->cPgdPor
      ( dbfFacCliP )->cTurRec    := ( dbfTmpP )->cTurPgo
      ( dbfFacCliP )->cCtaRec    := ( dbfTmpP )->cCtaRec
      ( dbfFacCliP )->nImporte   := nTotUCobTik( dbfTmpP )

      ( dbfFacCliP )->( dbUnLock() )

      ( dbfTmpP )->( dbSkip() )

      // delRiesgo( ( dbfFacCliP )->nImporte, cCliTik, dbfClient )

      nTotal                     -= ( dbfFacCliP )->nImporte

   end while

   /*
   Guardamos los valores para los totales--------------------------------------
   */

   aTotal            := aTotFacCli( aTik[ _CNUMDOC ], dbfFacCliT, dbfFacCliL, dbfIva, dbfDiv, dbfFacCliP, dbfAntCliT )

   aTik[ _NTOTNET ]  := aTotal[1]
   aTik[ _NTOTIVA ]  := aTotal[2]
   aTik[ _NTOTTIK ]  := aTotal[4]

   if dbLock( dbfFacCliT )
      ( dbfFacCliT )->nTotNet    := aTotal[1]
      ( dbfFacCliT )->nTotIva    := aTotal[2]
      ( dbfFacCliT )->nTotReq    := aTotal[3]
      ( dbfFacCliT )->nTotFac    := aTotal[4]
      ( dbfFacCliT )->( dbUnLock() )
   end if


   /*
   Escribimos definitivamente en el disco--------------------------------------
   */

   WinGather( aTik, aGet, dbfTikT, oBrwDet, nMode, nil, .t. )

return ( nNewFacCli )

//---------------------------------------------------------------------------//

Static Function SavTik2Neg( aTmp, aGet, nMode, nSave )

   local aTbl
   local cNumTik

   /*
   Marca para que no se pueda volver a convertir-------------------------------
   */

   if dbDialogLock( dbfTikT )
      ( dbfTikT )->lCnvTik := .t.
      ( dbfTikT )->lSndDoc := .t.
      ( dbfTikT )->( dbUnLock() )
   end if

   /*
   Vamos a copiar el registro actual-------------------------------------------
   */

   aTbl                    := dbScatter( dbfTikT )
   cNumTik                 := Str( nNewDoc( aTbl[ _CSERTIK ], dbfTikT, "NTIKCLI", 10, dbfCount ), 10 )
   aTbl[ _CTURTIK ]        := cCurSesion()
   aTbl[ _CNUMTIK ]        := cNumTik
   aTbl[ _CSUFTIK ]        := RetSufEmp()
   aTbl[ _CTIPTIK ]        := SAVTIK
   aTbl[ _DFECTIK ]        := GetSysDate()
   aTbl[ _LSNDDOC ]        := .t.
   aTbl[ _LCLOTIK ]        := .f.

   dbGather( aTbl, dbfTikT, .t. )

   /*
   Guardamos las lineas del tiket----------------------------------------------
   */

   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )
      aTbl                 := dbScatter( dbfTmpL )
      aTbl[ _CNUMTIL ]     := cNumTik
      aTbl[ _CSUFTIL ]     := RetSufEmp()
      aTbl[ _NUNTTIL ]     := - aTbl[ _NUNTTIL ]

      dbGather( aTbl, dbfTikL, .t. )
      ( dbfTmpL )->( dbSkip() )
   end while
   ( dbfTmpL )->( dbGoTop() )

   /*
   Ahora escribimos en el fichero definitivo los pagos-------------------------
   */

   ( dbfTmpP )->( dbGoTop() )
   while !( dbfTmpP )->( eof() )
      aTbl                 := dbScatter( dbfTmpP )
      aTbl[ _CNUMTIK ]     := cNumTik
      aTbl[ _NIMPTIK ]     := - ( aTbl[ _NIMPTIK ] - aTbl[ _NDEVTIK ] )

      dbGather( aTbl, dbfTikP, .t. )
      ( dbfTmpP )->( dbSkip() )
   end while
   ( dbfTmpP )->( dbGoTop() )

Return nil

//---------------------------------------------------------------------------//

Static Function SavTik2Tik( aTmp, aGet, nMode, nSave, nNumDev )

   local nRec
   local aTotal

   /*
   Guardamos el tipo como tiket---------------------------------------
   */

   if !Empty( oMetMsg )
      oMetMsg:cText           := 'Archivando lineas'
      oMetMsg:Refresh()
   end if

   nRec                    := ( dbfTmpL )->( Recno() )
   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )
      dbPass( dbfTmpL, dbfTikL, .t., aTmp[ _CSERTIK ], aTmp[ _CNUMTIK ], aTmp[ _CSUFTIK ], aTmp[ _CTIPTIK ] )
      ( dbfTmpL )->( dbSkip() )
   end while
   ( dbfTmpL )->( dbGoTo( nRec ) )

   /*
   Ahora escribimos en el fichero definitivo los pagos-------------------------
   */
   if !Empty( oMetMsg )
      oMetMsg:cText           := 'Archivando pagos'
      oMetMsg:Refresh()
   end if

   ( dbfTmpP )->( dbGoTop() )
   while !( dbfTmpP )->( eof() )
      dbPass( dbfTmpP, dbfTikP, .t., aTmp[ _CSERTIK ], aTmp[ _CNUMTIK ], aTmp[ _CSUFTIK ] )
      ( dbfTmpP )->( dbSkip() )
   end while

   /*
   Escribimos definitivamente en el disco--------------------------------------
   */
   if !Empty( oMetMsg )
      oMetMsg:cText           := 'Archivando ticket'
      oMetMsg:Refresh()
   end if
   /*
   No quitar-------------------------------------------------------------------
   */

   SysRefresh()

   /*
   Rellenamos los campos de totales--------------------------------------------
   */

   aTotal            := aTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )

   aTmp[ _NTOTNET ]  := aTotal[1]
   aTmp[ _NTOTIVA ]  := aTotal[2]
   aTmp[ _NTOTTIK ]  := aTotal[3]

   /*
   Guardamos el registro definitivamente---------------------------------------
   */

   WinGather( aTmp, nil, dbfTikT, nil, nMode )

Return nil

//---------------------------------------------------------------------------//

/*
Selecciona los tikets para su envio
*/

FUNCTION SndTikCli( lMark, dbfTikT, dbfFacCliT, dbfAlbCliT )

   /*
   Marcamos el tiket
   */

   if dbDialogLock( dbfTikT )
      ( dbfTikT )->lSndDoc := lMark
      ( dbfTikT )->( dbRUnLock() )
   end if

   /*
   Marcamos los documentos asociados
   */

   do case
   case ( dbfTikT )->cTipTik == SAVFAC

      if ( dbfFacCliT )->( dbSeek( ( dbfTikT )->cNumDoc ) )

         if dbDialogLock( dbfFacCliT )
            ( dbfFacCliT )->lSndDoc := lMark
            ( dbfFacCliT )->( dbRUnLock() )
         end if

      end if

   case ( dbfTikT )->cTipTik == SAVALB

      if ( dbfAlbCliT )->( dbSeek( ( dbfTikT )->cNumDoc ) )

         if dbDialogLock( dbfAlbCliT )
            ( dbfAlbCliT )->lSndDoc := lMark
            ( dbfAlbCliT )->( dbRUnLock() )
         end if

      end if

   end case

Return nil

//---------------------------------------------------------------------------//

Static Function nChkPagTik( cNumTik, dbfTikT, dbfTikL, dbfTikP, dbfIva, dbfDiv )

   local nTot
   local nCob
   local nBmp     := 1

   if !( dbfTikT )->lPgdTik

      nTot        := nTotTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, nil, cDivEmp(), .f. )
      nCob        := nTotCobTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikP, dbfDiv, cDivEmp(), .f. )
      nCob        += nTotValTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, cDivEmp(), .f. )

      do case
      case !lMayorIgual( nTot, nCob )
         nBmp     := 1
      case ( nCob > 0 )
         nBmp     := 2
      otherwise
         nBmp     := 3
      end case

   end if

return ( nBmp )

//--------------------------------------------------------------------------//

function cTipTik( cNumTik, uTikCliT )

   local cTipTik  := SAVTIK

   if ValType( uTikCliT ) == "C"

      if ( uTikCliT )->( dbSeek( cNumTik ) )
         cTipTik  := ( uTikCliT )->cTipTik
      end if

   else

      if uTikCliT:Seek( cNumTik )
         cTipTik  := uTikCliT:cTipTik
      end if

   end if

return ( cTipTik )

//--------------------------------------------------------------------------//

FUNCTION nImpLTpv( uTikT, uTikL, nDec, nRou, nVdv, cPouDiv, nPrc )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nRou   := 0
   DEFAULT nVdv   := 1
   DEFAULT nPrc   := 0

   nCalculo       := nTotLTpv( uTikL, nDec, nRou, nVdv, nPrc )

   do case
      case Valtype( uTikL ) == "C"
         if ( uTikL )->nIvaTil != 0
         nCalculo -= Round( nCalculo / ( 100 / ( uTikL )->nIvaTil + 1 ), nDec )
         end if
      case Valtype( uTikL ) == "O"
         if uTikL:nIvaTil != 0
         nCalculo -= Round( nCalculo / ( 100 / uTikL:nIvaTil + 1 ), nDec )
         end if
   end case

   do case
      case Valtype( uTikT ) == "C" .and. ( uTikT )->cTipTik == SAVDEV
         nCalculo := - nCalculo
      case Valtype( uTikT ) == "O" .and. uTikT:cTipTik == SAVDEV
         nCalculo := - nCalculo
   end case

RETURN ( if( cPouDiv != NIL, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

function nTotDTikCli( cCodArt, dbfTikCliT, dbfTikCliL, cCodAlm )

   local nTotVta  := 0
   local nRecno   := ( dbfTikCliL )->( Recno() )
   local cTipTik  := cTipTik( ( dbfTikCliL )->cSerTil + ( dbfTikCliL )->cNumTil + ( dbfTikCliL )->cSufTil, dbfTikCliT )

   if ( dbfTikCliL )->( dbSeek( cCodArt ) )

      while ( dbfTikCliL )->cCbaTil == cCodArt .and. !( dbfTikCliL )->( eof() )

         if cCodAlm != nil
            if ( dbfTikCliT )->cAlmTik == cCodAlm
               if cTipTik == SAVTIK
                  nTotVta  += ( dbfTikCliL )->nUntTil
               elseif cTipTik == SAVDEV
                  nTotVta  -= ( dbfTikCliL )->nUntTil
               end if
            end if
         else
            if cTipTik == SAVTIK
               nTotVta  += ( dbfTikCliL )->nUntTil
            elseif cTipTik == SAVDEV
               nTotVta  -= ( dbfTikCliL )->nUntTil
            end if
         end if

         ( dbfTikCliL )->( dbSkip() )

      end while

   end if

   ( dbfTikCliL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//---------------------------------------------------------------------------//
//
// Devuelve el total de la venta en albaranes de clientes de un articulo
//

function nTotVTikCli( cCodArt, dbfTikCliT, dbfTikCliL, nDec, nDor )

   local nTotVta  := 0
   local nRecno   := ( dbfTikCliL )->( Recno() )
   local cTipTik  := cTipTik( ( dbfTikCliL )->cSerTil + ( dbfTikCliL )->cNumTil + ( dbfTikCliL )->cSufTil, dbfTikCliT )

   if ( dbfTikCliL )->( dbSeek( cCodArt ) )

      while ( dbfTikCliL )->cCbaTil == cCodArt .and. !( dbfTikCliL )->( eof() )

         if cTipTik == SAVTIK
            nTotVta  += nTotLTpv( dbfTikCliL, nDec, nDor )
         elseif cTipTik == SAVDEV
            nTotVta  -= nTotLTpv( dbfTikCliL, nDec, nDor )
         end if

         ( dbfTikCliL )->( dbSkip() )

      end while

   end if

   ( dbfTikCliL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//--------------------------------------------------------------------------//

static function nCopiasTipoTicket( cTipTik, lEntrega, dbfCajT )

   local nCopies  := 1

   do case
      case cTipTik == SAVTIK

        do case
            case ( lRegalo == .t. )
               nCopies := nCopiasTicketsRegaloEnCaja( oUser():cCaja(), dbfCajT )

            case ( lEntrega == .t. )
               nCopies := nCopiasEntregasEnCaja( oUser():cCaja(), dbfCajT )

            otherwise
               nCopies := nCopiasTicketsEnCaja( oUser():cCaja(), dbfCajT )

         end case

      case cTipTik == SAVVAL
         nCopies := nCopiasValesEnCaja( oUser():cCaja(), dbfCajT )

      case cTipTik == SAVDEV
         nCopies := nCopiasDevolucionesEnCaja( oUser():cCaja(), dbfCajT )

      case cTipTik == SAVALB
         nCopies := nCopiasAlbaranesEnCaja( oUser():cCaja(), dbfCajT )

      case cTipTik == SAVFAC
         nCopies := nCopiasFacturasEnCaja( oUser():cCaja(), dbfCajT )

   end case

return nCopies

//--------------------------------------------------------------------------//

static function ClkMoneda( nImporte, oGet, lInit )

   local nVal  := oGet:VarGet()

   if lInit
      nVal     := nImporte
      lInit    := .f.
   else
      nVal     += nImporte
   end if

   oGet:cText( nVal )

return nil

//--------------------------------------------------------------------------//
/*
Edita tikets de clientes desde fuera
*/

Function aTipTik( uTikT )

   local nTipTik

   DEFAULT uTikT        := dbfTikT

   do case
      case Valtype( uTikT ) == "C"

         if ( dbfTikT )->lFreTik
            nTipTik     := Len( aTipDoc )
         else
            nTipTik     := Val( ( dbfTikT )->cTipTik )
            nTipTik     := Min( Max( nTipTik, 1 ), ( Len( aTipDoc ) - 1 ) )
         end if

      case Valtype( uTikT ) == "A"

         if uTikT[ _LFRETIK ]
            nTipTik     := Len( aTipDoc )
         else
            nTipTik     := Val( uTikT[ _CTIPTIK ] )
            nTipTik     := Min( Max( nTipTik, 1 ), ( Len( aTipDoc ) - 1 ) )
         end if

   end case

Return ( aTipDoc[ nTipTik ] )

//----------------------------------------------------------------------------//

static function DisImg( cCodArt )

   local cFilBmp     := RetImg( cCodArt, dbfArticulo )

   cFilBmp           := cFileBmpName( cFilBmp )

   if file( cFilBmp )
      oBmpVis:Show()
      oBmpVis:ReLoad( , cFilBmp )
   else
      oBmpVis:Hide()
   end if

return ( .t. )

//---------------------------------------------------------------------------//

Static Function SelBigUser( aTmp, aGet, dbfUsr )

   if BrwBigUser( dbfUsr )

      SetBigUser( aTmp, aGet )

      Return .t.

   end if

Return .f.

//---------------------------------------------------------------------------//

Static Function SetBigUser( aTmp, aGet )

   aTmp[ _CCCJTIK ]  := oUser():cCodigo()

   if !Empty( oUser():cImagen() )
      oBtnUsuario:cBmp( cFileBmpName( oUser():cImagen() ) )
   else
      oBtnUsuario:cBmp( if( oUser():lAdministrador(), "Security_Agent_32", "Dude4_32" ) )
   end if

   oBtnUsuario:cCaption( Capitalize( oUser():cNombre() ) )

Return .t.

//---------------------------------------------------------------------------//

FUNCTION Tik2AlbFac( nTipTik, cNumDoc )

do case
   case nTipTik == "2"
      EdtAlbCli( cNumDoc )
   case nTipTik == "3"
      EdtFacCli( cNumDoc )
   otherwise
      msginfo( "No hay documento asociado", cNumDoc )
end case

return nil

//---------------------------------------------------------------------------//

STATIC FUNCTION ContTpv( dbfTikT, oBrw )

   local oDlg
   local oSerIni
   local oSerFin
   local nRecno      := ( dbfTikT )->( recno() )
   local nOrdAnt     := ( dbfTikT )->( OrdSetFocus(1) )
   local cSerIni     := ( dbfTikT )->cSerTik
   local cSerFin     := ( dbfTikT )->cSerTik
   local nDocIni     := Val( ( dbfTikT )->cNumTik )
   local nDocFin     := Val( ( dbfTikT )->cNumTik )
   local cSufIni     := ( dbfTikT )->cSufTik
   local cSufFin     := ( dbfTikT )->cSufTik
   local oChk1
   local lChk1       := .t.

   DEFINE DIALOG oDlg RESOURCE "CONTPV"

   REDEFINE GET oSerIni VAR cSerIni ;
      ID       100 ;
      PICTURE  "@!" ;
      SPINNER ;
      ON UP    ( UpSerie( oSerIni ) );
      ON DOWN  ( DwSerie( oSerIni ) );
      VALID    ( cSerIni >= "A" .and. cSerIni <= "Z" );
      UPDATE ;
      OF       oDlg

   REDEFINE GET oSerFin VAR cSerFin ;
      ID       110 ;
      PICTURE  "@!" ;
      SPINNER ;
      ON UP    ( UpSerie( oSerFin ) );
      ON DOWN  ( DwSerie( oSerFin ) );
      VALID    ( cSerFin >= "A" .and. cSerFin <= "Z" );
      UPDATE ;
      OF       oDlg

   REDEFINE GET nDocIni;
      ID       120 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      COLOR    CLR_GET ;
		OF 		oDlg

   REDEFINE GET nDocFin;
      ID       130 ;
		PICTURE 	"999999999" ;
      SPINNER ;
		COLOR 	CLR_GET ;
		OF 		oDlg

   REDEFINE GET cSufIni ;
      ID       140 ;
      PICTURE  "##" ;
      COLOR    CLR_GET ;
		OF 		oDlg

   REDEFINE GET cSufFin ;
      ID       150 ;
      PICTURE  "##" ;
      COLOR    CLR_GET ;
		OF 		oDlg

   REDEFINE CHECKBOX oChk1 VAR lChk1;
      ID       160 ;
      OF       oDlg

   REDEFINE BUTTON ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   ( oDlg:end( IDOK ) )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      CANCEL ;
      ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| oDlg:end( IDOK ) } )
   oDlg:bStart := { || oSerIni:SetFocus() }

	ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      ( dbfTikT )->( dbGoTop())
      ( dbfTikT )->( ordSetFocus( 1 ) )

      ( dbfTikT )->( dbSeek( cSerIni + Str( nDocIni, 10 ) + cSufIni, .t. ) )

      while (dbfTikT)->cSerTik + (dbfTikT)->cNumTik + (dbfTikT)->cSufTik <= cSerFin + Str( nDocFin, 10 ) + cSufFin .and. !(dbfTikT)->( eof() )

         if lChk1

            if ( dbfTikT )->( dbRLock() )
               ( dbfTikT )->lConTik := .t.
               ( dbfTikT )->( dbUnlock() )
            end if

         else

            if ( dbfTikT )->( dbRLock() )
               ( dbfTikT )->lConTik := .f.
               ( dbfTikT )->( dbUnlock() )
            end if

         end if

      ( dbfTikT )->( dbSkip() )

      end while

   end if

   ( dbfTikT )->( ordSetFocus( nOrdAnt ) )
   ( dbfTikT )->( dbGoTo( nRecNo ) )

   oBrw:Refresh()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Function NameToField( cName )

   local cField   := {|| "" }

   cName          := AllTrim( cName )

   do case
      case cName == "C�digo del art�culo"
         cField   := {|| ( dbfTmpL )->cCbaTil }
      case cName == "Unidades"
         cField   := {|| nTotNTpv( dbfTmpL, cPicUnd ) }
      case cName == "Propiedad 1"
         cField   := {|| If( lUsePrp1(), ( dbfTmpL )->cValPr1, '' ) }
      case cName == "Propiedad 2"
         cField   := {|| If( lUsePrp2(), ( dbfTmpL )->cValPr2, '' ) }
      case cName == "Lote"
         cField   := {|| ( dbfTmpL )->cLote }
      case cName == "Medici�n 1"
         cField   := {|| Trans( ( dbfTmpL )->nMedUno, MasUnd() ) }
      case cName == "Medici�n 2"
         cField   := {|| Trans( ( dbfTmpL )->nMedDos, MasUnd() ) }
      case cName == "Medici�n 3"
         cField   := {|| Trans( ( dbfTmpL )->nMedTre, MasUnd() ) }
      case cName == "Detalle"
         cField   := {|| Rtrim( ( dbfTmpL )->cNomTil ) }
      case cName == "Importe"
         cField   := {|| Trans( ( dbfTmpL )->nPvpTil, cPouDiv ) }
      case cName == "Descuento lineal"
         cField   := {|| Trans( nDtoUTpv( dbfTmpL, nDouDiv ), cPouDiv ) }
      case cName == "Descuento porcentual"
         cField   := {|| Trans( ( dbfTmpL )->nDtoLin, "@E 999.99" ) }
      case cName == "Total"
         cField   := {|| Trans( nTotLTpv( dbfTmpL, nDouDiv, nDorDiv ), cPorDiv ) }
      case cName == "N�mero de serie"
         cField   := {|| ( dbfTmpL )->mNumSer }
      case cName == "Promoci�n"
         cField   := {|| ( dbfTmpL )->lInPromo }
      case cName == "N�mero de l�nea"
         cField   := {|| Trans( ( dbfTmpL )->nNumLin, "9999" ) }
   end case

RETURN ( cField )

//---------------------------------------------------------------------------//

STATIC FUNCTION DelSerie( oWndBrw )

	local oDlg
   local oSerIni
   local oSerFin
   local oTxtDel
   local nTxtDel     := 0
   local nRecno      := ( dbfTikT )->( Recno() )
   local nOrdAnt     := ( dbfTikT )->( OrdSetFocus( 1 ) )
   local oDesde      := TDesdeHasta():Init( ( dbfTikT )->cSerTik, Val( ( dbfTikT )->cNumTik ), ( dbfTikT )->cSufTik, GetSysDate() )
   local lCancel     := .f.
   local oBtnAceptar
   local oBtnCancel

   DEFINE DIALOG oDlg ;
      RESOURCE "DELSERDOC" ;
      TITLE    "Eliminar series de tickets" ;
      OF       oWndBrw

   REDEFINE RADIO oDesde:nRadio ;
      ID       90, 91 ;
      OF       oDlg

   REDEFINE GET oSerIni VAR oDesde:cSerieInicio ;
      ID       100 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerIni ) );
      ON DOWN  ( DwSerie( oSerIni ) );
      WHEN     ( oDesde:nRadio == 1 );
      VALID    ( oDesde:cSerieInicio >= "A" .and. oDesde:cSerieInicio <= "Z"  );
      OF       oDlg

   REDEFINE GET oSerFin VAR oDesde:cSerieFin ;
      ID       110 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerFin ) );
      ON DOWN  ( DwSerie( oSerFin ) );
      WHEN     ( oDesde:nRadio == 1 );
      VALID    ( oDesde:cSerieFin >= "A" .and. oDesde:cSerieFin <= "Z"  );
      OF       oDlg

   REDEFINE GET oDesde:nNumeroInicio ;
      ID       120 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( oDesde:nRadio == 1 );
      OF       oDlg

   REDEFINE GET oDesde:nNumeroFin ;
      ID       130 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( oDesde:nRadio == 1 );
      OF       oDlg

   REDEFINE GET oDesde:cSufijoInicio ;
      ID       140 ;
      PICTURE  "##" ;
      WHEN     ( oDesde:nRadio == 1 );
      OF       oDlg

   REDEFINE GET oDesde:cSufijoFin ;
      ID       150 ;
      PICTURE  "##" ;
      WHEN     ( oDesde:nRadio == 1 );
      OF       oDlg

   REDEFINE GET oDesde:dFechaInicio ;
      ID       170 ;
      SPINNER ;
      WHEN     ( oDesde:nRadio == 2 );
      OF       oDlg

   REDEFINE GET oDesde:dFechaFin ;
      ID       180 ;
      SPINNER ;
      WHEN     ( oDesde:nRadio == 2 );
      OF       oDlg

   REDEFINE BUTTON oBtnAceptar ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   ( DelStart( oDesde, oDlg, oBtnAceptar, oBtnCancel, oTxtDel, @lCancel ) )

   REDEFINE BUTTON oBtnCancel ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      CANCEL ;
      ACTION   ( lCancel := .t., oDlg:end() )

   REDEFINE METER oTxtDel VAR nTxtDel ;
      ID       160 ;
      NOPERCENTAGE ;
      TOTAL    ( dbfTikT )->( OrdKeyCount() ) ;
      OF       oDlg

   ACTIVATE DIALOG oDlg CENTER VALID ( lCancel )

   ( dbfTikT )->( dbGoTo( nRecNo ) )
   ( dbfTikT )->( ordSetFocus( nOrdAnt ) )

   oWndBrw:SetFocus()
   oWndBrw:Refresh()

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION DelStart( oDesde, oDlg, oBtnAceptar, oBtnCancel, oTxtDel, lCancel )

   local nOrd
   local nDeleted       := 0
   local nProcesed      := 0

   oBtnAceptar:Hide()
   oBtnCancel:bAction   := {|| lCancel := .t. }

   if oDesde:nRadio == 1

      nOrd              := ( dbfTikT )->( OrdSetFocus( "nNumTik" ) )

      ( dbfTikT )->( dbSeek( oDesde:cNumeroInicio(), .t. ) )
      while !lCancel .and. !( dbfTikT )->( eof() )

         if ( dbfTikT )->cSerTik >= oDesde:cSerieInicio              .and.;
            ( dbfTikT )->cSerTik <= oDesde:cSerieFin                 .and.;
            ( dbfTikT )->cNumTik >= Str( oDesde:nNumeroInicio, 10 )  .and.;
            ( dbfTikT )->cNumTik <= Str( oDesde:nNumeroFin, 10 )     .and.;
            ( dbfTikT )->cSufTik >= oDesde:cSufijoInicio             .and.;
            ( dbfTikT )->cSufTik <= oDesde:cSufijoFin

            ++nDeleted

            oTxtDel:cText  := "Eliminando : " + ( dbfTikT )->cSerTik + "/" + Alltrim( ( dbfTikT )->cNumTik ) + "/" + ( dbfTikT )->cSufTik

            DelTpv( nil, dbfTikT )

         else

            ( dbfTikT )->( dbSkip() )

         end if

         ++nProcesed

         oTxtDel:Set( nProcesed )

      end do

      ( dbfTikT )->( OrdSetFocus( nOrd ) )

   else

      nOrd                 := ( dbfTikT )->( OrdSetFocus( "dFecTik" ) )

      ( dbfTikT )->( dbSeek( oDesde:dFechaInicio, .t. ) )
      while !lCancel .and. ( dbfTikT )->dFecTik <= oDesde:dFechaFin .and. !( dbfTikT )->( eof() )

         if ( dbfTikT )->dFecTik >= oDesde:dFechaInicio  .and.;
            ( dbfTikT )->dFecTik <= oDesde:dFechaFin

            ++nDeleted

            oTxtDel:cText  := "Eliminando : " + ( dbfTikT )->cSerTik + "/" + Alltrim( ( dbfTikT )->cNumTik ) + "/" + ( dbfTikT )->cSufTik

            DelTpv( nil, dbfTikT )

            //TpvDelRec( nil, .f., .f. )

         else

            ( dbfTikT )->( dbSkip() )

         end if

         ++nProcesed

         oTxtDel:Set( nProcesed )

      end do

      ( dbfTikT )->( OrdSetFocus( nOrd ) )

   end if

   lCancel              := .t.

   oBtnAceptar:Show()

   if lCancel
      msgStop( "Total de registros borrados : " + Str( nDeleted ), "Proceso cancelado" )
   else
      msgInfo( "Total de registros borrados : " + Str( nDeleted ), "Proceso finalizado" )
   end if

RETURN ( oDlg:End() )

//---------------------------------------------------------------------------//

STATIC FUNCTION LqdVale( oWndBrw )

   if ( dbfTikT )->cTipTik == SAVVAL

      if !( dbfTikT )->lLiqTik

         if dbLock( dbfTikT )
            ( dbfTikT )->lLiqTik := .t.
            ( dbfTikT )->( dbUnLock() )
         end if

      else

         msgStop( "Este documento ya est� liquidado." )

      end if

   else

      msgStop( "Este documento no se almacen� como vale." )

   end if

   oWndBrw:SetFocus()
   oWndBrw:Refresh()

RETURN NIL

//--------------------------------------------------------------------------//

FUNCTION AppTikCli( cCodCli, cCodArt, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( nil, nil, cCodCli, cCodArt )
         oWndBrw:RecAdd()
      end if

   else

      if OpenFiles( nil, .t. )
         WinAppRec( nil, bEditT, dbfTikT, cCodCli, cCodArt )
         CloseFiles()
      end if

   end if

Return .t.

//--------------------------------------------------------------------------//

FUNCTION InitTikCli( nNumTik )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
      nTotTik()
      WinEdtRec( nil, bEditT, dbfTikT )
   else
      MsgStop( "No se encuentra ticket" )
   end if

Return .t.

//---------------------------------------------------------------------------//
/*
Edita tikets de clientes desde fuera
*/

FUNCTION EdtTikCli( nNumTik, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( , , , , .f. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            oWndBrw:RecEdit()
         else
            MsgStop( "No se encuentra ticket" )
         end if
      end if

   else

      if OpenFiles( nil, .t. )

         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )

            nTotTik()

            WinEdtRec( nil, bEditT, dbfTikT )
         else
            MsgStop( "No se encuentra ticket" )
         end if

         CloseFiles()

      end if

   end if

Return .t.

//--------------------------------------------------------------------------//
/*
Visualiza factura de clientes desde fuera
*/

FUNCTION ZooTikCli( nNumTik, lOpenBrowse  )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( , , , , .f. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            oWndBrw:RecZoom()
         else
            MsgStop( "No se encuentra ticket" )
         end if
      end if

   else

      if OpenFiles( nil, .t. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            nTotTik()
            WinZooRec( nil, bEditT, dbfTikT )
         else
            MsgStop( "No se encuentra ticket" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//--------------------------------------------------------------------------//
/*
Elimina factura de clientes desde fuera
*/

FUNCTION DelTikCli( nNumTik, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( , , , , .f. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            //oWndBrw:RecDel()
            DelTpv( oWndBrw:oBrw, dbfTikT )
         else
            MsgStop( "No se encuentra ticket" )
         end if
      end if

   else

      if OpenFiles( nil, .t. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            nTotTik()
            //TpvDelRec()
            DelTpv( nil, dbfTikT )
         else
            MsgStop( "No se encuentra ticket" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//--------------------------------------------------------------------------//
/*
Imprime Tiktura de clientes desde fuera
*/

FUNCTION PrnTikCli( nNumTik, lOpenBrowse  )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( , , , , .f. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            ImpTiket( .f. )
         else
            MsgStop( "No se encuentra ticket" )
         end if
      end if

   else

      if OpenFiles( nil, .t. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            nTotTik()
            ImpTiket( .f. )
         else
            MsgStop( "No se encuentra ticket" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//--------------------------------------------------------------------------//
/*
Imprime Tiktura de clientes desde fuera
*/

FUNCTION VisTikCli( nNumTik, lOpenBrowse  )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if FrontTpv( , , , , .f. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            ImpTiket( .t. )
         else
            MsgStop( "No se encuentra ticket" )
         end if
      end if

   else

      if OpenFiles( nil, .t. )
         if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            nTotTik()
            ImpTiket( .t. )
         else
            MsgStop( "No se encuentra ticket" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//---------------------------------------------------------------------------//

Function EdtCobTikCli( nNumTik, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   Sysrefresh()

   if OpenFiles( nil, .t. )
      if dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
         EdtCobTik()
      else
         MsgStop( "No se encuentra ticket" )
      end if
      CloseFiles()
   end if

   Sysrefresh()

Return .t.

//--------------------------------------------------------------------------//

static function lFacturaAlbaran()

   if ( dbfTikT )->cTipTik == SAVALB
      if !RetFld( ( dbfTikT )->cNumDoc, dbfAlbCliT, "lFacturado" )
         FactCli( nil, nil, nil, nil, nil, { nil, nil, ( dbfTikT )->cNumDoc, nil } )
      else
         msgStop( "El albar�n ya ha sido facturado" )
      end if
   else
      msgStop( "S�lo se pueden generar facturas desde albaranes" )
   end if

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function Recalcula( aTmp )

   local nRec

   /*
   Recalcula los precios-------------------------------------------------------
   */

   nRec        := ( dbfTmpL )->( Recno() )

   ( dbfTmpL )->( dbGoTop() )
   while !( dbfTmpL )->( eof() )

      if lValLine( dbfTmpL ) .and. !( dbfTmpL )->lFreTil

         if dbSeekInOrd( ( dbfTmpL )->cCbaTil, "CodeBar", dbfArticulo ) .or.;
            dbSeekInOrd( ( dbfTmpL )->cCbaTil, "Codigo", dbfArticulo )

            ( dbfTmpL )->nPvpTil    := nRetPreArt( aTmp[ _NTARIFA ], aTmp[ _CDIVTIK ], .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, .t. )

         end if

      end if

      (  dbfTmpL )->( dbskip() )

   end while

   ( dbfTmpL )->( dbGoTo( nRec ) )

   lRecTotal( aTmp )

   oBrwDet:Refresh()

Return .t.

//---------------------------------------------------------------------------//

Static Function AppendKit( uTmpLin, aTik )

   local cCodArt
   local cSerTil
   local cNumTil
   local cSufTil
   local cAlmLin
   local nUntTil
   local nIvaTil
   local nNumLin

   if ValType( uTmpLin ) == "A"
      cCodArt                       := uTmpLin[ _CCBATIL ]
      cSerTil                       := uTmpLin[ _CSERTIL ]
      cNumTil                       := uTmpLin[ _CNUMTIL ]
      cSufTil                       := uTmpLin[ _CSUFTIL ]
      nNumLin                       := uTmpLin[ _NNUMLIN ]
      cAlmLin                       := uTmpLin[ _CALMLIN ]
      nUntTil                       := uTmpLin[ _NUNTTIL ]
      nIvaTil                       := uTmpLin[ _NIVATIL ]
   else
      cCodArt                       := ( uTmpLin )->cCbaTil
      cSerTil                       := ( uTmpLin )->cSerTil
      cNumTil                       := ( uTmpLin )->cNumTil
      cSufTil                       := ( uTmpLin )->cSufTil
      nNumLin                       := ( uTmpLin )->nNumLin
      cAlmLin                       := ( uTmpLin )->cAlmLin
      nUntTil                       := ( uTmpLin )->nUntTil
      nIvaTil                       := ( uTmpLin )->nIvaTil
   end if

   if  ( dbfKit )->( dbSeek( cCodArt ) )

      while ( dbfKit )->cCodKit == cCodArt .and. !( dbfKit )->( eof() )

         if ( dbfArticulo )->( dbSeek( ( dbfKit )->cRefKit ) )

            ( dbfTmpL )->( dbAppend() )

            ( dbfTmpL )->cSerTil    := cSerTil
            ( dbfTmpL )->cNumTil    := cNumTil
            ( dbfTmpL )->cSufTil    := cSufTil
            ( dbfTmpL )->nNumLin    := nNumLin
            ( dbfTmpL )->cAlmLin    := cAlmLin
            ( dbfTmpL )->nUntTil    := nUntTil * ( dbfKit )->nUndKit

            ( dbfTmpL )->cCbaTil    := ( dbfKit      )->cRefKit
            ( dbfTmpL )->cNomTil    := ( dbfArticulo )->Nombre
            ( dbfTmpL )->cFamTil    := ( dbfArticulo )->Familia
            ( dbfTmpL )->lTipAcc    := ( dbfArticulo )->lTipAcc
            ( dbfTmpL )->nCtlStk    := ( dbfArticulo )->nCtlStock
            ( dbfTmpL )->cCodImp    := ( dbfArticulo )->cCodImp
            ( dbfTmpL )->nMesGrt    := ( dbfarticulo )->nMesGrt

            ( dbfTmpL )->nValImp    := oNewImp:nValImp( ( dbfArticulo )->cCodImp, .t., nIvaTil )
            ( dbfTmpL )->nCosDiv    := nCosto( nil, dbfArticulo, dbfKit )

            /*
            Estudio de los tipos de IVA si el padre el cero todos cero------
            */

            if !Empty( nIvaTil )
               ( dbfTmpL )->nIvaTil := nIva( dbfIva, ( dbfArticulo )->TipoIva )
            else
               ( dbfTmpL )->nIvaTil := 0
            end if

            /*
            Propiedades de los kits-----------------------------------------
            */

            ( dbfTmpL )->lKitChl    := !lKitAsociado( cCodArt, dbfArticulo )
            ( dbfTmpL )->lImpLin    := lImprimirComponente( cCodArt, dbfArticulo )   // 1 Todos, 2 Compuesto, 3 Componentes
            ( dbfTmpL )->lKitPrc    := lPreciosComponentes( cCodArt, dbfArticulo )   // 1 Todos, 2 Compuesto, 3 Componentes

            if ( dbfTmpL )->lKitPrc
               ( dbfTmpL )->nPvpTil := nRetPreArt( aTik[ _NTARIFA ], aTik[ _CDIVTIK ], .t., dbfArticulo, dbfDiv, dbfKit, dbfIva, .t. )
            end if

            if lStockComponentes( cCodArt, dbfArticulo )
               ( dbfTmpL )->nCtlStk := ( dbfArticulo )->nCtlStock
            else
               ( dbfTmpL )->nCtlstk := STOCK_NO_CONTROLAR // No controlar Stock
            end if

            if ( dbfArticulo )->lKitArt
               AppendKit( dbfTmpL, aTik )
            end if

         end if

         ( dbfKit )->( dbSkip() )

      end while

   end if

Return ( nil )

//---------------------------------------------------------------------------//

FUNCTION nTotValLiq( cNumTik, dbfTikT, dbfTikL, dbfDiv, aTmp, cDivRet, lPic, lExcCnt )

   local nRec  := ( dbfTikT )->( Recno() )

   local nTik  := nTotTik( cNumTik, dbfTikT, dbfTikL, dbfDiv, aTmp, cDivRet, lPic, lExcCnt )
   local nVal  := nTotTik( ( dbfTikT )->cValDoc, dbfTikT, dbfTikL, dbfDiv, aTmp, cDivRet, lPic, lExcCnt )

   ( dbfTikT )->( dbGoTo( nRec ) )

Return ( Min( nTik, nVal ) )

//---------------------------------------------------------------------------//

FUNCTION IsTpv( cPath )

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "TIKET.DBF" )
      dbCreate( cPath + "TIKET.DBF", aSqlStruct( aItmTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEL.DBF" )
      dbCreate( cPath + "TIKEL.DBF", aSqlStruct( aColTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEP.DBF" )
      dbCreate( cPath + "TIKEP.DBF", aSqlStruct( aPgoTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEC.DBF" )
      dbCreate( cPath + "TIKEC.DBF", aSqlStruct( aPgoCli() ), cDriver() )
   end if

   if !lExistIndex( cPath + "TIKET.Cdx" ) .or. ;
      !lExistIndex( cPath + "TIKEL.Cdx" ) .or. ;
      !lExistIndex( cPath + "TIKEP.Cdx" ) .or. ;
      !lExistIndex( cPath + "TIKEC.Cdx" )

      rxTpv( cPath )

   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function ClickEntrega( aTmp, aGet, oDlgTpv )

   /*
   Vamos a comprobar q hay algo q guardar--------------------------------------
   */

   if ( dbfTmpL )->( LastRec() ) != 0

      aTmp[ _LABIERTO ] := .f.

      /*
      Guardamos el tiket de manera normal--------------------------------------
      */

      if GuardaVenta( aTmp, aGet, .f. )

         /*
         Paramos a la ventana-----------------------------------------------------
         */

         oDlgTpv:Disable()

         /*
         Proceso de impresion-----------------------------------------------------
         */

         ImpTiket( .f., .t. )

         /*
         Ponemos en marcha la ventana---------------------------------------------
         */

         oDlgTpv:Enable()

         /*
         Titulo de la ventana-----------------------------------------------------
         */

         cTitleDialog( aTmp )

      end if

   end if

Return ( nil )

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS TotalesTPV

   Method Init()

   Method lValeMayorTotal()   Inline   ( ( ::nVale <= ::nTotal ) .or. ( ::nTotal < 0 ) )

   Data  nTotal
   Data  nEntregado
   Data  nCobrado
   Data  nVale
   Data  nAnticipo
   Data  nCobradoDivisa
   Data  nCambio

   Data  oTotal
   Data  oEntregado
   Data  oCobrado
   Data  oCobradoDivisa
   Data  oCambio

END CLASS

Method Init() CLASS TotalesTPV

   ::nTotal             := 0
   ::nCobrado           := 0
   ::nVale              := 0
   ::nAnticipo          := 0
   ::nEntregado         := 0
   ::nCobrado           := 0
   ::nCobradoDivisa     := 0
   ::nCambio            := 0

   ::oTotal             := nil
   ::oEntregado         := nil
   ::oCobrado           := nil
   ::oCobradoDivisa     := nil
   ::oCambio            := nil

Return ( Self )

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS TTiketsClientesSenderReciver FROM TSenderReciverItem

   Method CreateData()

   Method RestoreData()

   Method SendData()

   Method ReciveData()

   Method Process()

END CLASS

//----------------------------------------------------------------------------//

Method CreateData() CLASS TTiketsClientesSenderReciver

   local lSnd        := .f.
   local dbfTikT
   local dbfTikL
   local dbfTikP
   local tmpTikT
   local tmpTikL
   local tmpTikP
   local cFileName   := "TikCli" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   ::oSender:SetText( "Enviando tikets de clientes" )

   USE ( cPatEmp() + "TIKET.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKET", @dbfTikT ) )
   SET INDEX TO ( cPatEmp() + "TIKET.CDX" ) ADDITIVE
   SET TAG TO "lSndDoc"

   USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTikL ) )
   SET INDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "TIKEP.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKEP", @dbfTikP ) )
   SET INDEX TO ( cPatEmp() + "TIKEP.CDX" ) ADDITIVE

   /*
   Creamos todas las bases de datos relacionadas con Articulos
   */

   MkTpv( cPatSnd() )

   USE ( cPatSnd() + "TIKET.DBF" ) NEW VIA ( cDriver() )ALIAS ( cCheckArea( "TIKET", @tmpTikT ) )
   SET INDEX TO ( cPatSnd() + "TIKET.CDX" ) ADDITIVE

   USE ( cPatSnd() + "TIKEL.DBF" ) NEW VIA ( cDriver() )ALIAS ( cCheckArea( "TIKEL", @tmpTikL ) )
   SET INDEX TO ( cPatSnd() + "TIKEL.CDX" ) ADDITIVE

   USE ( cPatSnd() + "TIKEP.DBF" ) NEW VIA ( cDriver() )ALIAS ( cCheckArea( "TIKEP", @tmpTikP ) )
   SET INDEX TO ( cPatSnd() + "TIKEP.CDX" ) ADDITIVE

   if !Empty( ::oSender:oMtr )
      ::oSender:oMtr:nTotal := ( dbfTikT )->( OrdKeyCount() )
   end if

   if ( dbfTikT )->( dbSeek( .t. ) )

      while ( dbfTikT )->lSndDoc .and. !( dbfTikT )->( eof() )

         lSnd  := .t.

         dbPass( dbfTikT, tmpTikT, .t. )
         ::oSender:SetText( ( dbfTikT )->cSerTik + "/" + AllTrim( ( dbfTikT )->cNumTik ) + "/" + AllTrim( ( dbfTikT )->cSufTik ) + "; " + Dtoc( ( dbfTikT )->dFecTik ) + "; " + AllTrim( ( dbfTikT )->cCliTik ) + "; " + ( dbfTikT )->cNomTik )

         /*
         Lineas de detalle
         */

         if ( dbfTikL )->( dbSeek( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik ) )
            while ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik == ( dbfTikL )->CSERTIL + ( dbfTikL )->CNUMTIL + ( dbfTikL )->CSUFTIL .AND. !( dbfTikL )->( eof() )
               dbPass( dbfTikL, tmpTikL, .t. )
               ( dbfTikL )->( dbSkip() )
            end do
         end if

         /*
         Lineas de pago
         */

         if ( dbfTikP )->( dbSeek( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik ) )
            while ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik == ( dbfTikP )->cSerTik + ( dbfTikP )->cNumTik + ( dbfTikP )->cSufTik .AND. !( dbfTikP )->( eof() )
               dbPass( dbfTikP, tmpTikP, .t. )
               ( dbfTikP )->( dbSkip() )
            end do
         end if

         ( dbfTikT )->( dbSkip() )

         if !Empty( ::oSender:oMtr )
            ::oSender:oMtr:Set( ( dbfTikT )->( OrdKeyNo() ) )
         end if

      end do

   end if

   /*
   Cerrar ficheros temporales--------------------------------------------------
   */

   CLOSE ( tmpTikT )
   CLOSE ( tmpTikL )
   CLOSE ( tmpTikP )
   CLOSE ( dbfTikT )
   CLOSE ( dbfTikL )
   CLOSE ( dbfTikP )

   if lSnd

      ::oSender:SetText( "Comprimiendo tikets de clientes" )

      if ::oSender:lZipData( cFileName )
         ::oSender:SetText( "Ficheros comprimidos" )
      else
         ::oSender:SetText( "ERROR al crear fichero comprimido" )
      end if

   else

      ::oSender:SetText( "No hay registros tikets para enviar" )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method RestoreData() CLASS TTiketsClientesSenderReciver

   local dbfTikT

   if ::lSuccesfullSend

      /*
      Retorna el valor anterior---------------------------------------------------
      */

      USE ( cPatEmp() + "TIKET.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKET", @dbfTikT ) )
      SET INDEX TO ( cPatEmp() + "TIKET.CDX" ) ADDITIVE
      ( dbfTikT )->( OrdSetFocus( "lSndDoc" ) )

      while ( dbfTikT )->( dbSeek( .t. ) ) .and. !( dbfTikT )->( eof() )
         if ( dbfTikT )->( dbRLock() )
            ( dbfTikT )->lSndDoc := .f.
            ( dbfTikT )->( dbRUnlock() )
         end if
      end do

      CLOSE ( dbfTikT )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method SendData() CLASS TTiketsClientesSenderReciver

   local cFileName   := "TikCli" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   if file( cPatOut() + cFileName )

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

Method ReciveData() CLASS TTiketsClientesSenderReciver

   local n
   local aExt        := aRetDlgEmp()

   /*
   Recibirlo de internet
   */

   ::oSender:SetText( "Recibiendo tikets de clientes" )

   for n := 1 to len( aExt )
      ftpGetFiles( "TikCli*." + aExt[ n ], cPatIn(), 2000, ::oSender )
   next

   ::oSender:SetText( "Tickets de clientes recibidos" )

Return Self

//----------------------------------------------------------------------------//

Method Process() CLASS TTiketsClientesSenderReciver

   local m
   local oStock
   local tmpTikT
   local tmpTikL
   local tmpTikP
   local dbfDiv
   local dbfTikT
   local dbfTikL
   local dbfTikP
   local dbfClient
   local nTotTik
   local nTotTikOld
   local nTotTikNew
   local oBlock
   local oError
   local aFiles      := Directory( cPatIn() + "TikCli*.*" )

   /*
   Recibirlo de internet
   */

   ::oSender:SetText( "Importando tikets de clientes" )

   for m := 1 TO len( aFiles )

      ::oSender:SetText( "Procesando fichero : " + aFiles[ m, 1 ] )

      /*oBlock         := ErrorBlock( { | oError | Break( oError ) } )

      BEGIN SEQUENCE*/

      /*
      descomprimimos el fichero------------------------------------------------
      */

      if ::oSender:lUnZipData( cPatIn() + aFiles[ m, 1 ] )

         /*
         Ficheros temporales
         */

         if lExistTable( cPatSnd() + "TIKET.DBF" ) .and.;
            lExistTable( cPatSnd() + "TIKEL.DBF" ) .and.;
            lExistTable( cPatSnd() + "TIKEP.DBF" )

            USE ( cPatEmp() + "TIKET.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKET", @dbfTikT ) )
            SET INDEX TO ( cPatEmp() + "TIKET.CDX" ) ADDITIVE

            USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTikL ) )
            SET INDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE

            USE ( cPatEmp() + "TIKEP.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKEP", @dbfTikP ) )
            SET INDEX TO ( cPatEmp() + "TIKEP.CDX" ) ADDITIVE

            USE ( cPatCli() + "CLIENT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "CLIENT", @dbfClient ) )
            SET INDEX TO ( cPatCli() + "CLIENT.CDX" ) ADDITIVE

            USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
            SET INDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

            USE ( cPatSnd() + "TIKET.DBF" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "TIKET", @tmpTikT ) )
            SET INDEX TO ( cPatSnd() + "TIKET.CDX" ) ADDITIVE

            USE ( cPatSnd() + "TIKEL.DBF" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "TIKEL", @tmpTikL ) )
            SET INDEX TO ( cPatSnd() + "TIKEL.CDX" ) ADDITIVE

            USE ( cPatSnd() + "TIKEP.DBF" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "TIKEP", @tmpTikP ) )
            SET INDEX TO ( cPatSnd() + "TIKEP.CDX" ) ADDITIVE

            oStock            := TStock():New()
            oStock:cTikT      := dbfTikT
            oStock:cTikL      := dbfTikL

            if !Empty( ::oSender:oMtr )
               ::oSender:oMtr:nTotal := ( tmpTikT )->( lastrec() )
            end if

            while !( tmpTikT )->( eof() )

               if lValidaOperacion( ( tmpTikT )->dFecTik, .f. )

                  /*
                  Si existe el tiket lo reemplazamos------------------------------
                  */

                  if ( dbfTikT )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )

                     dbPass( tmpTikT, dbfTikT, .f. )

                     ::oSender:SetText( "Reemplazado : " + ( dbfTikT )->cSerTik + "/" + AllTrim( ( dbfTikT )->cNumTik ) + "/" + AllTrim( ( dbfTikT )->cSufTik ) + "; " + Dtoc( ( dbfTikT )->dFecTik ) + "; " + AllTrim( ( dbfTikT )->cCliTik ) + "; " + ( dbfTikT )->cNomTik )

                     /*
                     Rollback de articulos y stocks-------------------------------
                     */

                     //oStock:TpvCli( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik, ( tmpTikT )->cAlmTik, .t. )

                     //nTotTikNew := nTotTik( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik, tmpTikT, tmpTikL, dbfDiv )
                     //nTotTikOld := nTotTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv )

                     // AddRiesgo( nTotTikNew - nTotTikOld, ( dbfTikT )->cCliTik, dbfClient )

                     /*
                     Eliminamos las lineas----------------------------------------
                     */

                     while ( dbfTikL )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )
                        if dbLock( dbfTikL )
                           ( dbfTikL )->( dbDelete() )
                           ( dbfTikL )->( dbUnLock() )
                        end if
                     end while

                     /*
                     Borramos los pagos----------------------------------------------------
                     */

                     while ( dbfTikP )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )

                        if dbLock( dbfTikP )
                           ( dbfTikP )->( dbDelete() )
                           ( dbfTikP )->( dbUnLock() )
                        end if
                     end while

                  else

                     dbPass( tmpTikT, dbfTikT, .t. )
                     ::oSender:SetText( "A�adido : " + ( dbfTikT )->cSerTik + "/" + AllTrim( ( dbfTikT )->cNumTik ) + "/" + AllTrim( ( dbfTikT )->cSufTik ) + "; " + Dtoc( ( dbfTikT )->dFecTik ) + "; " + AllTrim( ( dbfTikT )->cCliTik ) + "; " + ( dbfTikT )->cNomTik )

                     //nTotTik := nTotTik( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik, tmpTikT, tmpTikL, dbfDiv )

                     // AddRiesgo( nTotTik, ( tmpTikT )->cCliTik, dbfClient )

                  end if

                  /*
                  Ahora vamos a borrar las lineas
                  */

                  while ( dbfTikL )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )
                     if ( dbfTikL )->( dbRLock() )
                        ( dbfTikL )->( dbDelete() )
                     end if
                  end while

                  /*
                  Ahora vamos con las lienas de detalle
                  */

                  if ( tmpTikL )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )
                     while ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik == ( tmpTikL )->cSerTil + ( tmpTikL )->cNumTil + ( tmpTikL )->cSufTil .and. !( tmpTikL )->( eof() )
                        dbPass( tmpTikL, dbfTikL, .t. )
                        ( tmpTikL )->( dbSkip() )
                     end do
                  end if

                  /*
                  Comprobamos si existen pago y los eliminamos
                  */

                  while ( dbfTikP )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )
                     // AddRiesgo( nTotUCobTik( dbfTikP ), ( tmpTikT )->cCliTik, dbfClient )
                     if ( dbfTikP )->( dbRLock() )
                        ( dbfTikP )->( dbDelete() )
                     end if
                  end while

                  /*
                  Trasbase de nuevos pagos
                  */

                  if ( tmpTikP )->( dbSeek( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik ) )
                     while ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik == ( tmpTikP )->cSerTik + ( tmpTikP )->cNumTik + ( tmpTikP )->cSufTik .and. !( tmpTikP )->( eof() )
                        dbPass( tmpTikP, dbfTikP, .t. )
                        // DelRiesgo( nTotUCobTik( tmpTikP ), ( tmpTikT )->cCliTik, dbfClient )
                        ( tmpTikP )->( dbSkip() )
                     end do
                  end if

                  /*
                  Actualizamos los Stocks
                  */

                  //oStock:TpvCli( ( tmpTikT )->cSerTik + ( tmpTikT )->cNumTik + ( tmpTikT )->cSufTik, ( tmpTikT )->cAlmTik, .f. )

               end if

               ( tmpTikT )->( dbSkip() )

               if !Empty( ::oSender:oMtr )
                  ::oSender:oMtr:Set( ( tmpTikT )->( OrdKeyNo() ) )
               end if

               SysRefresh()

            end do

            if !Empty( ::oSender:oMtr )
               ::oSender:oMtr:nTotal := ( tmpTikT )->( lastrec() )
            end if

            /*
            Finalizando--------------------------------------------------------------
            */

            CLOSE ( dbfTikT   )
            CLOSE ( dbfTikL   )
            CLOSE ( dbfTikP   )
            CLOSE ( dbfClient )
            CLOSE ( dbfDiv    )
            CLOSE ( tmpTikT   )
            CLOSE ( tmpTikL   )
            CLOSE ( tmpTikP   )

            oStock:end()

            fErase( cPatSnd() + "TikeT.Dbf" )
            fErase( cPatSnd() + "TikeL.Dbf" )
            fErase( cPatSnd() + "TikeP.Dbf" )

            ::oSender:AppendFileRecive( aFiles[ m, 1 ] )

         else

            ::oSender:SetText( "Faltan ficheros" )

            if !lExistTable( cPatSnd() + "TikeT.Dbf" )
               ::oSender:SetText( "Falta " + cPatSnd() + "TikeT.Dbf" )
            end if

            if !lExistTable( cPatSnd() + "TikeL.Dbf" )
               ::oSender:SetText( "Falta " + cPatSnd() + "TikeL.Dbf" )
            end if

            if !lExistTable( cPatSnd() + "TikeP.Dbf" )
               ::oSender:SetText( "Falta " + cPatSnd() + "TikeP.Dbf" )
            end if

         end if

      end if

      /*RECOVER USING oError

         CLOSE ( dbfTikT   )
         CLOSE ( dbfTikL   )
         CLOSE ( dbfTikP   )
         CLOSE ( dbfClient )
         CLOSE ( dbfDiv    )
         CLOSE ( tmpTikT   )
         CLOSE ( tmpTikL   )
         CLOSE ( tmpTikP   )

         ::oSender:SetText( "Error procesando fichero " + aFiles[ m, 1 ] )
         ::oSender:SetText( ErrorMessage( oError ) )

      END SEQUENCE

      ErrorBlock( oBlock )*/

   next

Return Self

//----------------------------------------------------------------------------//

Static Function GenTikCli( nDevice, cCaption, cCodDoc, cPrinter, lComanda )

   local oDevice

   if ( dbfTikT )->( Lastrec() ) == 0
      return nil
   end if

   DEFAULT nDevice      := IS_PRINTER
   DEFAULT cCaption     := "Imprimiendo tickets a clientes"
   DEFAULT cCodDoc      := cFormatoTicketEnCaja( oUser():cCaja(), dbfCajT )
   DEFAULT cPrinter     := cWindowsPrinterEnCaja( oUser():cCaja(), dbfCajT )
   DEFAULT lComanda     := .f.

   if Empty( cCodDoc )
      cCodDoc           := cFormatoTicketEnCaja( oUser():cCaja(), dbfCajT )
   end if

   if !lExisteDocumento( cCodDoc, dbfDoc )
      return nil
   end if

   /*
   Si el documento es de tipo visual-------------------------------------------
   */

   PrintReportTikCli( nDevice, 1, cPrinter, lComanda )

   /*
   Codigo de corte de papel----------------------------------------------------
   */
   //cCortePapelEnCaja( oUser():cCaja(), dbfCajT )

Return .f.

//----------------------------------------------------------------------------//

Static Function nGenTikCli( nDevice, cCaption, cCodDoc, cPrinter )

   local nImpYet     := 0

   While nImpYet < nCopTik

      if nImpYet < 1 .or. msgYesNo( "�Desea imprimir el tiket N�" + Str( nImpYet + 1, 2 ) + "?", "Elija una opci�n" )

         GenTikCli( nDevice, cCaption, cCodDoc, cPrinter )

      end if

      ++nImpYet

   end do

return nil

//----------------------------------------------------------------------------//

#include "FastRepH.ch"

Static Function DataReport( oFr, lComanda )

   DEFAULT lComanda := .f.

   /*
   Zona de datos------------------------------------------------------------
   */

   oFr:ClearDataSets()

   oFr:SetWorkArea(     "Tickets", ( dbfTikT )->( Select() ), .f., { FR_RB_CURRENT, FR_RB_CURRENT, 0 } )
   oFr:SetFieldAliases( "Tickets", cItemsToReport( aItmTik() ) )

   if lComanda
      oFr:SetWorkArea(  "Lineas de tickets", ( dbfTmpC )->( Select() ) )
   else
      oFr:SetWorkArea(  "Lineas de tickets", ( dbfTikL )->( Select() ) )
   end if
   oFr:SetFieldAliases( "Lineas de tickets", cItemsToReport( aColTik() ) )

   oFr:SetWorkArea(     "Lineas de albaranes", ( dbfAlbCliL )->( Select() ) )
   oFr:SetFieldAliases( "Lineas de albaranes", cItemsToReport( aColAlbCli() ) )

   oFr:SetWorkArea(     "Lineas de facturas", ( dbfFacCliL )->( Select() ) )
   oFr:SetFieldAliases( "Lineas de facturas", cItemsToReport( aColFacCli() ) )

   oFr:SetWorkArea(     "Pagos de tickets", ( dbfTikP )->( Select() ) )
   oFr:SetFieldAliases( "Pagos de tickets", cItemsToReport( aPgoTik() ) )

   oFr:SetWorkArea(     "Empresa", ( dbfEmp )->( Select() ) )
   oFr:SetFieldAliases( "Empresa", cItemsToReport( aItmEmp() ) )

   oFr:SetWorkArea(     "Clientes", ( dbfClient )->( Select() ) )
   oFr:SetFieldAliases( "Clientes", cItemsToReport( aItmCli() ) )

   oFr:SetWorkArea(     "Obras", ( dbfObrasT )->( Select() ) )
   oFr:SetFieldAliases( "Obras",  cItemsToReport( aItmObr() ) )

   oFr:SetWorkArea(     "Almacenes", ( dbfAlm )->( Select() ) )
   oFr:SetFieldAliases( "Almacenes", cItemsToReport( aItmAlm() ) )

   oFr:SetWorkArea(     "Rutas", ( dbfRuta )->( Select() ) )
   oFr:SetFieldAliases( "Rutas", cItemsToReport( aItmRut() ) )

   oFr:SetWorkArea(     "Agentes", ( dbfAgent )->( Select() ) )
   oFr:SetFieldAliases( "Agentes", cItemsToReport( aItmAge() ) )

   oFr:SetWorkArea(     "Formas de pago", ( dbfFpago )->( Select() ) )
   oFr:SetFieldAliases( "Formas de pago", cItemsToReport( aItmFPago() ) )

   oFr:SetWorkArea(     "Usuarios", ( dbfUsr )->( Select() ) )
   oFr:SetFieldAliases( "Usuarios", cItemsToReport( aItmUsr() ) )

   oFr:SetWorkArea(     "Art�culos", ( dbfArticulo )->( Select() ) )
   oFr:SetFieldAliases( "Art�culos", cItemsToReport( aItmArt() ) )

   oFr:SetWorkArea(     "Familias", ( dbfFamilia )->( Select() ) )
   oFr:SetFieldAliases( "Familias", cItemsToReport( aItmFam() ) )

   oFr:SetWorkArea(     "Sala venta", oSalaVentas:oDbf:nArea )
   oFr:SetFieldAliases( "Sala venta", cObjectsToReport( oSalaVentas:oDbf ) )

   oFr:SetWorkArea(     "Orden comanda", oTComandas:oDbf:nArea )
   oFr:SetFieldAliases( "Orden comanda", cObjectsToReport( oTComandas:oDbf ) )

   oFr:SetWorkArea(     "Unidades de medici�n",  oUndMedicion:Select() )
   oFr:SetFieldAliases( "Unidades de medici�n",  cObjectsToReport( oUndMedicion:oDbf ) )

   oFr:SetWorkArea(     "Categor�as", ( dbfCategoria )->( Select() ) )
   oFr:SetFieldAliases( "Categor�as", cItemsToReport( aItmCategoria() ) )

   //------------------------------------------------------------------------//

   oFr:SetMasterDetail( "Tickets", "Lineas de tickets",  {|| ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik } )
   oFr:SetMasterDetail( "Tickets", "Lineas de albaranes",{|| ( dbfTikT )->cNumDoc } )
   oFr:SetMasterDetail( "Tickets", "Lineas de facturas", {|| ( dbfTikT )->cNumDoc } )
   oFr:SetMasterDetail( "Tickets", "Pagos de tickets",   {|| ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik } )
   oFr:SetMasterDetail( "Tickets", "Empresa",            {|| cCodigoEmpresaEnUso() } )
   oFr:SetMasterDetail( "Tickets", "Clientes",           {|| ( dbfTikT )->cCliTik } )
   oFr:SetMasterDetail( "Tickets", "Obras",              {|| ( dbfTikT )->cCliTik + ( dbfTikT )->cCodObr } )
   oFr:SetMasterDetail( "Tickets", "Almacen",            {|| ( dbfTikT )->cAlmTik } )
   oFr:SetMasterDetail( "Tickets", "Rutas",              {|| ( dbfTikT )->cCodRut } )
   oFr:SetMasterDetail( "Tickets", "Agentes",            {|| ( dbfTikT )->cCodAge } )
   oFr:SetMasterDetail( "Tickets", "Formas de pago",     {|| ( dbfTikT )->cFpgTik } )
   oFr:SetMasterDetail( "Tickets", "Usuarios",           {|| ( dbfTikT )->cCcjTik } )
   oFr:SetMasterDetail( "Tickets", "SalaVenta",          {|| ( dbfTikT )->cCodSala } )

   oFr:SetMasterDetail( "Lineas de tickets", "Art�culos",            {|| ( dbfTikL )->cCbaTil } )
   oFr:SetMasterDetail( "Lineas de tickets", "Familia",              {|| ( dbfTikL )->cFamTil } )
   oFr:SetMasterDetail( "Lineas de tickets", "Orden comanda",        {|| ( dbfTikL )->cCodTImp } )
   oFr:SetMasterDetail( "Lineas de tickets", "Unidades de medici�n", {|| ( dbfTikL )->cUnidad } )
   oFr:SetMasterDetail( "Lineas de tickets", "Categor�as",           {|| RetFld( ( dbfTikL )->cCbaTil, dbfArticulo, "cCodCate" ) } )

   //------------------------------------------------------------------------//

   oFr:SetResyncPair(   "Tickets", "Lineas de tickets" )
   oFr:SetResyncPair(   "Tickets", "Lineas de albaranes" )
   oFr:SetResyncPair(   "Tickets", "Lineas de facturas" )
   oFr:SetResyncPair(   "Tickets", "Pagos de tickets" )
   oFr:SetResyncPair(   "Tickets", "Empresa" )
   oFr:SetResyncPair(   "Tickets", "Clientes" )
   oFr:SetResyncPair(   "Tickets", "Obras" )
   oFr:SetResyncPair(   "Tickets", "Almacenes" )
   oFr:SetResyncPair(   "Tickets", "Rutas" )
   oFr:SetResyncPair(   "Tickets", "Agentes" )
   oFr:SetResyncPair(   "Tickets", "Formas de pago" )
   oFr:SetResyncPair(   "Tickets", "Usuarios" )
   oFr:SetResyncPair(   "Tickets", "SalaVenta" )

   oFr:SetResyncPair(   "Lineas de tickets", "Art�culos" )
   oFr:SetResyncPair(   "Lineas de tickets", "Familias" )
   oFr:SetResyncPair(   "Lineas de tickets", "Orden comanda" )
   oFr:SetResyncPair(   "Lineas de tickets", "Unidades de medici�n" )
   oFr:SetResyncPair(   "Lineas de tickets", "Categor�as" )

Return nil

//---------------------------------------------------------------------------//

Static Function VariableReport( oFr )

   /*
   Creaci�n de variables----------------------------------------------------
   */

   oFr:AddVariable(     "Tickets",             "Total ticket",                      "GetHbVar('nTotTik')" )
   oFr:AddVariable(     "Tickets",             "Total bruto",                       "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Tickets",             "Total neto",                        "GetHbVar('nTotNet')" )
   oFr:AddVariable(     "Tickets",             "Total IVA",                         "GetHbVar('nTotIva')" )
   oFr:AddVariable(     "Tickets",             "Total IVM",                         "GetHbVar('nTotIvm')" )
   oFr:AddVariable(     "Tickets",             "Total albar�n",                     "GetHbVar('nTotAlb')" )
   oFr:AddVariable(     "Tickets",             "Total factura",                     "GetHbVar('nTotFac')" )
   oFr:AddVariable(     "Tickets",             "Precio por pax.",                   "GetHbVar('nTotPax')" )
   oFr:AddVariable(     "Tickets",             "Total descuento general",           "GetHbVar('nTotDtoEsp')" )
   oFr:AddVariable(     "Tickets",             "Total descuento pronto pago",       "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Tickets",             "Bruto primer tipo de IVA",          "GetHbArrayVar('aBrtTik',1)" )
   oFr:AddVariable(     "Tickets",             "Bruto segundo tipo de IVA",         "GetHbArrayVar('aBrtTik',2)" )
   oFr:AddVariable(     "Tickets",             "Bruto tercer tipo de IVA",          "GetHbArrayVar('aBrtTik',3)" )
   oFr:AddVariable(     "Tickets",             "Base primer tipo de IVA",           "GetHbArrayVar('aBasTik',1)" )
   oFr:AddVariable(     "Tickets",             "Base segundo tipo de IVA",          "GetHbArrayVar('aBasTik',2)" )
   oFr:AddVariable(     "Tickets",             "Base tercer tipo de IVA",           "GetHbArrayVar('aBasTik',3)" )
   oFr:AddVariable(     "Tickets",             "Porcentaje primer tipo IVA",        "GetHbArrayVar('aIvaTik',1)" )
   oFr:AddVariable(     "Tickets",             "Porcentaje segundo tipo IVA",       "GetHbArrayVar('aIvaTik',2)" )
   oFr:AddVariable(     "Tickets",             "Porcentaje tercer tipo IVA",        "GetHbArrayVar('aIvaTik',3)" )
   oFr:AddVariable(     "Tickets",             "Importe primer tipo IVA",           "GetHbArrayVar('aImpTik',1)" )
   oFr:AddVariable(     "Tickets",             "Importe segundo tipo IVA",          "GetHbArrayVar('aImpTik',2)" )
   oFr:AddVariable(     "Tickets",             "Importe tercer tipo IVA",           "GetHbArrayVar('aImpTik',3)" )
   oFr:AddVariable(     "Tickets",             "Importe primer tipo IVMH",          "GetHbArrayVar('aIvmTik',1)" )
   oFr:AddVariable(     "Tickets",             "Importe segundo tipo IVMH",         "GetHbArrayVar('aIvmTik',2)" )
   oFr:AddVariable(     "Tickets",             "Importe tercer tipo IVMH",          "GetHbArrayVar('aIvmTik',3)" )

   oFr:AddVariable(     "Tickets",             "Total vale en compra",              "CallHbFunc('nImpValTik')" )
   oFr:AddVariable(     "Tickets",             "Total vales acumulados cliente",    "CallHbFunc('nImpValCli')" )
   oFr:AddVariable(     "Tickets",             "Total entregas a cuenta",           "CallHbFunc('nTotalEntregado')" )
   oFr:AddVariable(     "Tickets",             "Total vales liquidados en compra",  "CallHbFunc('nTotValTikInfo')" )

   oFr:AddVariable(     "Lineas de tickets",   "Total unidades art�culo",                       "CallHbFunc('nTotNTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Total unidades de comandas",                    "CallHbFunc('nTotNComandas')" )
   oFr:AddVariable(     "Lineas de tickets",   "Precio unitario del art�culo",                  "CallHbFunc('nTotUTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Precio unitario con descuentos",                "CallHbFunc('nNetLTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Importe descuento l�nea del factura",           "CallHbFunc('nDtoUTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Total IVA l�nea de factura",                    "CallHbFunc('nIvaLTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Total IVMH l�nea de factura",                   "CallHbFunc('nIvmLTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Total l�nea de factura",                        "CallHbFunc('nTotLTpv')" )
   oFr:AddVariable(     "Lineas de tickets",   "Detalle del art�culo para comanda",             "CallHbFunc('cTpvDesCmd')" )

   oFr:AddVariable(     "Lineas de albaranes", "Detalle del art�culo del albar�n",              "CallHbFunc('cTpvDesAlbCli')"  )
   oFr:AddVariable(     "Lineas de albaranes", "Total unidades art�culo del albar�n",           "CallHbFunc('nTpvTotNAlbCli')" )
   oFr:AddVariable(     "Lineas de albaranes", "Precio unitario del art�culo del albar�n",      "CallHbFunc('nTpvTotUAlbCli')" )
   oFr:AddVariable(     "Lineas de albaranes", "Total l�nea de albar�n",                        "CallHbFunc('nTpvTotLAlbCli')" )

   oFr:AddVariable(     "Lineas de facturas",  "Detalle del art�culo de la factura",            "CallHbFunc('cTpvDesFacCli')" )
   oFr:AddVariable(     "Lineas de facturas",  "Total unidades art�culo de la factura",         "CallHbFunc('nTpvTotNFacCli')" )
   oFr:AddVariable(     "Lineas de facturas",  "Precio unitario del art�culo de la factura",    "CallHbFunc('nTpvTotUFacCli')" )
   oFr:AddVariable(     "Lineas de facturas",  "Total l�nea de factura.",                       "CallHbFunc('nTpvTotLFacCli')" )

Return nil

//---------------------------------------------------------------------------//

Function DesignReportTikCli( oFr, dbfDoc )

   local lCloseFiles := !lOpenFiles

   if lOpenFiles .or. OpenFiles()

      /*
      Zona de datos------------------------------------------------------------
      */

      DataReport( oFr )

      /*
      Paginas y bandas---------------------------------------------------------
      */

      if !Empty( ( dbfDoc )->mReport )

         oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      else

         oFr:SetProperty(     "Report",            "ScriptLanguage", "PascalScript" )
         oFr:SetProperty(     "Report.ScriptText", "Text",;
                                                + ;
                                                "procedure DetalleOnMasterDetail(Sender: TfrxComponent);"   + Chr(13) + Chr(10) + ;
                                                "begin"                                                     + Chr(13) + Chr(10) + ;
                                                "CallHbFunc('nTotalizer');"                                 + Chr(13) + Chr(10) + ;
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
         oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet", "Tickets" )

         oFr:AddBand(         "DetalleColumnas",   "MainPage", frxDetailData  )
         oFr:SetProperty(     "DetalleColumnas",   "Top", 230 )
         oFr:SetProperty(     "DetalleColumnas",   "Height", 28 )
         oFr:SetObjProperty(  "DetalleColumnas",   "DataSet", "Lineas de Tickets" )
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

      if lCloseFiles
         CloseFiles()
      end if

   else

      return .f.

   end if

Return .t.

//---------------------------------------------------------------------------//

Function PrintReportTikCli( nDevice, nCopies, cPrinter, lComanda )

   local oFr

   DEFAULT nDevice      := IS_SCREEN
   DEFAULT nCopies      := 1
   DEFAULT cPrinter     := PrnGetName()
   DEFAULT lComanda     := .f.

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

   DataReport( oFr, lComanda )

   /*
   Cargar el informe-----------------------------------------------------------
   */

   if !Empty( ( dbfDoc )->mReport )

      oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

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
/*
Funciones que llaman a funciones de albaranes y facturas
creadas para que se puedan llamar desde fuera, ya que
para los formatos no podemos llamarlas con par�metros.
*/

function cTpvDesAlbCli()
return cDesAlbCli( dbfAlbCliL )

//---------------------------------------------------------------------------//

function nTpvTotNAlbCli()
return nTotNAlbCli( dbfAlbCliL )

//---------------------------------------------------------------------------//

function nTpvTotUAlbCli()
return nTotUAlbCli( dbfAlbCliL )

//---------------------------------------------------------------------------//

function nTpvTotLAlbCli()
return nTotLAlbCli( dbfAlbCliL )

//---------------------------------------------------------------------------//

function cTpvDesFacCli()
return cDesFacCli( dbfFacCliL )

//---------------------------------------------------------------------------//

function nTpvTotNFacCli()
return nTotNFacCli( dbfFacCliL )

//---------------------------------------------------------------------------//

function nTpvTotUFacCli()
return nTotUFacCli( dbfFacCliL )

//---------------------------------------------------------------------------//

function nTpvTotLFacCli()
return nTotLFacCli( dbfFacCliL )

//---------------------------------------------------------------------------//

function cTpvDesCmd( cTikL )

   local cReturn     := ""

   DEFAULT cTikL     := dbfTikL

   if !Empty( ( cTikL )->cNomCmd )
      cReturn        := Rtrim( ( cTikL )->cNomCmd )
   else
      cReturn        := Rtrim( ( cTikL )->cNomTil )
   end if

RETURN ( cReturn )

//---------------------------------------------------------------------------//

Static Function nNumeroFamilias()

   local nRegistrosMostrar := ( dbfFamilia )->( ordKeyCount() )
   nRegistrosMostrar       -= ( dbfFamilia )->( ordKeyNo() )
   nRegistrosMostrar++

   // Si tenemos ya boton anterior necesitamos un boton mas--------------------

   if len( aRecFam ) > 1
      nRegistrosMostrar++
   end if

   // Si deseamos mostrar mas botones q espacios tenemos lo corregimos---------

   if nRegistrosMostrar > nNumBtnFam
      nRegistrosMostrar    := nNumBtnFam - 1
   end if

Return ( nRegistrosMostrar )

//---------------------------------------------------------------------------//

Static Function lMostrarFamilias()

   local lMostrarFamilias  := .f.
   local nRegistrosMostrar := 0

   if ( dbfFamilia )->( ordKeyNo() ) != 0
      lMostrarFamilias     := ( ( dbfFamilia )->( ordKeyCount() ) - ( dbfFamilia )->( ordKeyNo() ) > 0 )
   end if

Return ( lMostrarFamilias )

//---------------------------------------------------------------------------//

Static Function AddFreeProduct()

   local oDlg
   local oFnt              := TFont():New( FONT_NAME, 12, 32, .f., .t. )
   local oGetDescripcion
   local cGetDescripcion   := Space( 100 )
   local oGetUnidades
   local nGetUnidades      := 1
   local oGetImporte
   local nGetImporte       := 0

   DEFINE DIALOG oDlg RESOURCE "Libre" FONT oFnt

      REDEFINE GET oGetDescripcion ;
         VAR      cGetDescripcion ;
         ID       100 ;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         ID       110 ;
         OF       oDlg ;
         BITMAP   "Keyboard2_32" ;
         ACTION   ( VirtualKey( .f., oGetDescripcion ) )

      REDEFINE GET oGetUnidades ;
         VAR      nGetUnidades ;
         PICTURE  cPicUnd ;
         ID       120 ;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         ID       130 ;
         OF       oDlg ;
         BITMAP   "Calculator_32" ;
         ACTION   ( Calculadora( 0, oGetUnidades ) )

      REDEFINE GET oGetImporte ;
         VAR      nGetImporte ;
         PICTURE  cPorDiv ;
         ID       140 ;
         OF       oDlg

      REDEFINE BUTTONBMP ;
         ID       150 ;
         OF       oDlg ;
         BITMAP   "Calculator_32" ;
         ACTION   ( Calculadora( 0, oGetImporte ) )

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( lValidAddFreeProduct( oGetDescripcion, oDlg ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         ACTION   ( oDlg:End() )

   ACTIVATE DIALOG oDlg CENTER

   if ( oDlg:nResult == IDOK )

      ( dbfTmpL )->( dbAppend() )
      if !( dbfTmpL )->( NetErr() )
         ( dbfTmpL )->cNomTil := cGetDescripcion
         ( dbfTmpL )->nUntTil := nGetUnidades
         ( dbfTmpL )->nPvpTil := nGetImporte
         ( dbfTmpL )->nIvaTil := nIva( dbfIva, cDefIva() )
         ( dbfTmpL )->cAlmLin := oUser():cAlmacen()
      end if

      if !Empty( oBrwDet )
         oBrwDet:Refresh()
      end if

   end if

   oFnt:End()

Return ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function lValidAddFreeProduct( oGetDescripcion, oDlg )

   if Empty( oGetDescripcion:VarGet() )
      MsgStop( "Descripci�n no puede estar vacia" )
      Return .f.
   end if

   oDlg:End( IDOK )

Return .t.

//---------------------------------------------------------------------------//

Static Function RenombrarUbicacion( aTmp, aGet )

   local cNombreUbicacion  := VirtualKey( .f., aTmp[ _CALIASTIK ], "Asignar alias" )

   if !Empty( cNombreUbicacion )

      aTmp[ _CALIASTIK ]   := cNombreUbicacion

      cTitleDialog( aTmp )

   end if

Return .t.

//---------------------------------------------------------------------------//

Static Function EdtEnt( aTmp, aGet, dbfTmpE, oBrw, bWhen, bValid, nMode, aTmpTik )

   local oDlg
   local oBmpDiv
   local cPorDiv

   DEFAULT aTmpTik   := dbScatter( dbfTikT )

   do case
      case nMode == APPD_MODE

         aTmp[ ( dbfTmpE )->( FieldPos( "cTurRec" ) ) ]   := cCurSesion()
         aTmp[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ]   := oUser():cCaja()
         aTmp[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ]   := aTmpTik[ _CCLITIK ]
         aTmp[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ]   := aTmpTik[ _CCODAGE ]
         aTmp[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ]   := aTmpTik[ _CDIVTIK ]
         aTmp[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ]   := aTmpTik[ _CFPGTIK ]

      case nMode == EDIT_MODE

         if aTmp[ ( dbfTmpE )->( FieldPos( "lCloPgo" ) ) ] .and. !oUser():lAdministrador()
            msgStop( "Solo pueden modificar las entregas cerradas los administradores." )
            return .f.
         end if

   end case

   cPorDiv           := cPorDiv(aTmp[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ], dbfDiv )

   DEFINE DIALOG oDlg RESOURCE "ENTREGAS" TITLE LblTitle( nMode ) + "entrega a cuenta"

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "nImporte" ) ) ];
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "nImporte" ) ) ] ;
         ID       160 ;
         PICTURE  ( cPorDiv ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ];
         WHEN     ( .f. ) ;
         VALID    ( cDivOut( aGet[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ], oBmpDiv, aGet[ ( dbfTmpE )->( FieldPos( "nVdvPgo" ) ) ], nil, nil, @cPorDiv, nil, nil, nil, nil, dbfDiv, oBandera ) );
         PICTURE  "@!";
         ID       150 ;
         BITMAP   "LUPA" ;
         ON HELP  BrwDiv( aGet[ ( dbfTmpE )->( FieldPos( "cDivPgo" ) ) ], oBmpDiv, aGet[ ( dbfTmpE )->( FieldPos( "nVdvPgo" ) ) ], dbfDiv, oBandera ) ;
         OF       oDlg

      REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
         ID       151;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ] ;
         ID       180 ;
         IDTEXT   181 ;
         COLOR    CLR_GET ;
			PICTURE  "@!" ;
         VALID    ( cFPago( aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ], dbfFPago, aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ]:oHelpText ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwFPago( aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ], aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ]:oHelpText ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "dEntrega" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "dEntrega" ) ) ] ;
         ID       100 ;
         SPINNER ;
         ON HELP  aGet[ ( dbfTmpE )->( FieldPos( "dEntrega" ) ) ]:cText( Calendario( aTmp[ ( dbfTmpE )->( FieldPos( "dEntrega" ) ) ] ) ) ;
         BITMAP   "LUPA" ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ] ;
         ID       110 ;
         IDTEXT   111 ;
         VALID    ( cClient( aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ], dbfClient, aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ]:oHelpText ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwClient( aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ], aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ]:oHelpText ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ];
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ] ;
         ID       120 ;
         IDTEXT   121 ;
         VALID    ( cAgentes( aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ], dbfAgent, aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ]:oHelpText ) );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAgentes( aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ], aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ]:oHelpText ) );
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cDescrip" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cDescrip" ) ) ] ;
         ID       130 ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cPgdoPor" ) ) ];
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cPgdoPor" ) ) ] ;
         ID       140 ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ] ;
         VAR      aTmp[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ];
         ID       170 ;
         IDTEXT   171 ;
         VALID    cCajas( aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ], dbfCajT, aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ]:oHelpText ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwCajas( aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ], aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ]:oHelpText ) ) ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ValidEdtEnt( aTmp, aGet, oBrw, oDlg, nMode, dbfTmpE ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:End() )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| ValidEdtEnt( aTmp, aGet, oBrw, oDlg, nMode, dbfTmpE ) } )
   end if

   oDlg:bStart    := {|| StartRec( aGet, aTmp ) }

   ACTIVATE DIALOG oDlg CENTER

   oBandera:End()
   oBmpDiv:End()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function ValidEdtEnt( aTmp, aGet, oBrw, oDlg, nMode, dbfTmpE )

   if nMode == APPD_MODE
      aTmp[ ( dbfTmpE )->( FieldPos( "nNumRec" ) ) ]   := ( dbfTmpE )->( RecNo() ) + 1
   end if

   WinGather( aTmp, aGet, dbfTmpE, oBrw, nMode )

   oDlg:End( IDOK )

Return .t.

//---------------------------------------------------------------------------//

static function StartRec( aGet, aTmp )

   aGet[ ( dbfTmpE )->( FieldPos( "nImporte" ) ) ]:SetFocus()

   aGet[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ]:oHelpText:cText( RetFld( aTmp[ ( dbfTmpE )->( FieldPos( "cCodPgo" ) ) ], dbfFPago, "cDesPago" ) )
   aGet[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ]:oHelpText:cText( RetFld( aTmp[ ( dbfTmpE )->( FieldPos( "cCodCli" ) ) ], dbfClient, "Titulo" ) )
   aGet[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ]:oHelpText:cText( RetFld( aTmp[ ( dbfTmpE )->( FieldPos( "cCodCaj" ) ) ], dbfCajT, "cNomCaj" ) )
   aGet[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ]:oHelpText:cText( cNbrAgent( aTmp[ ( dbfTmpE )->( FieldPos( "cCodAge" ) ) ], dbfAgent ) )

return .t.

//---------------------------------------------------------------------------//

Static Function CrearDescuento( dbfTmpL, oBrwDet )

   local oDlg
   local nRec
   local oBtnUnaLinea
   local oBtnTodasLineas
   local oGetPorcentaje
   local nGetPorcentaje := 10
   local oFnt           := TFont():New( FONT_NAME, 14, 46, .f., .t. )

   DEFINE DIALOG oDlg RESOURCE "DTO_TCT"

      oBtnUnaLinea      := TBtnBmp():ReDefine( 100, "Row_32",,,,,{|| oBtnUnaLinea:GoDown(), oBtnTodasLineas:GoUp() }, oDlg, .f., , .f. )

      oBtnTodasLineas   := TBtnBmp():ReDefine( 110, "Row_All_32",,,,,{|| oBtnUnaLinea:GoUp(), oBtnTodasLineas:GoDown() }, oDlg, .f., , .f. )

      REDEFINE BUTTON ;
         ID       200 ;
         OF       oDlg ;
         ACTION   ( oGetPorcentaje:cText( 10 ) )

      REDEFINE BUTTON ;
         ID       210 ;
         OF       oDlg ;
         ACTION   ( oGetPorcentaje:cText( 20 ) )

      REDEFINE BUTTON ;
         ID       220 ;
         OF       oDlg ;
         ACTION   ( oGetPorcentaje:cText( 30 ) )

      REDEFINE BUTTON ;
         ID       230 ;
         OF       oDlg ;
         ACTION   ( oGetPorcentaje:cText( 40 ) )

      REDEFINE BUTTON ;
         ID       240 ;
         OF       oDlg ;
         ACTION   ( oGetPorcentaje:cText( 50 ) )

      REDEFINE BUTTONBMP ;
         ID       300 ;
         OF       oDlg ;
         BITMAP   "Navigate_Plus_32" ;
         ACTION   ( oGetPorcentaje++ )

      REDEFINE BUTTONBMP ;
         ID       310 ;
         OF       oDlg ;
         BITMAP   "Navigate_Minus_32" ;
         ACTION   ( oGetPorcentaje-- )

      REDEFINE GET oGetPorcentaje ;
         VAR      nGetPorcentaje ;
         ID       320 ;
         FONT     oFnt ;
         SPINNER ;
         MIN      0 ;
         MAX      100 ;
         PICTURE  "@E 999.99";
         OF       oDlg ;

   oDlg:bStart    := {|| oBtnUnaLinea:GoDown() }

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      if oBtnUnaLinea:lPressed

         ( dbfTmpL )->nDtoLin := nGetPorcentaje

      else

         nRec     := ( dbfTmpL )->( Recno() )

         ( dbfTmpL )->( dbGoTop() )
         while !( dbfTmpL )->( Eof() )
            ( dbfTmpL )->nDtoLin := nGetPorcentaje
            ( dbfTmpL )->( dbSkip() )
         end while

         ( dbfTmpL )->( dbGoTo( nRec ) )

      end if

   end if

   oFnt:end()

   if !Empty( oBrwDet )
      oBrwDet:Refresh()
   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function CrearInvitacion( dbfTmpL, oBrwDet )

   local oDlg
   local nRec
   local oBtnUnaLinea
   local oBtnTodasLineas
   local oBtnCancel
   local oImgInv
   local oLstInv

   DEFINE DIALOG oDlg RESOURCE "INV_TCT"

      oBtnTodasLineas   := TBtnBmp():ReDefine( 100, "Row_All_32",,,,,{|| oBtnUnaLinea:GoUp(), oBtnTodasLineas:GoDown() }, oDlg, .f., , .f. )

      oBtnUnaLinea      := TBtnBmp():ReDefine( 110, "Row_32",,,,,{|| oBtnUnaLinea:GoDown(), oBtnTodasLineas:GoUp() }, oDlg, .f., , .f. )

      oImgInv           := TImageList():New( 48, 48 )
      oLstInv           := TListView():Redefine( 120, oDlg )
      oLstInv:nOption   := 0
      oLstInv:bClick    := {| nOpt | EndInvitacion( nOpt, oLstInv, oBtnUnaLinea, dbfTmpL, oInvitacion:oDbf:cAlias, oDlg ) }

      REDEFINE BUTTONBMP oBtnCancel ;
         ID       550 ;
         OF       oDlg ;
         BITMAP   "Delete2_48" ;
         ACTION   ( oDlg:End() )

      oDlg:bStart       := {|| oBtnTodasLineas:GoDown() }

   ACTIVATE DIALOG oDlg ;
      ON INIT     ( InitInvitaciones( oDlg, oImgInv, oLstInv ) ) ;
      CENTER

   if !Empty( oBrwDet )
      oBrwDet:Refresh()
   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function EndInvitacion( nOpt, oLstInv, oBtnUnaLinea, dbfTmpL, dbfInv, oDlg )

   local nRec

   if nOpt == 0

      msgStop( "Debe seleccionar una opci�n v�lida." )

   else

      if ( dbfInv )->( OrdKeyGoTo( nOpt ) )

         if oBtnUnaLinea:lPressed

            if ( dbfInv )->lPreInv
               ( dbfTmpL )->nPvpTil    := ( dbfInv )->nPreInv
            else
               ( dbfTmpL )->nPvpTil    := 0
            end if

            ( dbfTmpL )->nPcmTil       := 0
            ( dbfTmpL )->cCodInv       := ( dbfInv )->cCodInv

         else

            nRec     := ( dbfTmpL )->( Recno() )

            ( dbfTmpL )->( dbGoTop() )
            while !( dbfTmpL )->( Eof() )

               if ( dbfInv )->lPreInv
                  ( dbfTmpL )->nPvpTil := ( dbfInv )->nPreInv
               else
                  ( dbfTmpL )->nPvpTil := 0
               end if

               ( dbfTmpL )->nPcmTil    := 0
               ( dbfTmpL )->cCodInv    := ( dbfInv )->cCodInv
               ( dbfTmpL )->( dbSkip() )
            end while

            ( dbfTmpL )->( dbGoTo( nRec ) )

         end if

      end if

      oDlg:End( IDOK )

   end if

return ( .t. )

//---------------------------------------------------------------------------//

Function InitInvitaciones( oDlg, oImgInv, oLstInv )

   local nInvi := 0

   if !Empty( oImgInv ) .and. !Empty( oLstInv ) .and. !Empty( oInvitacion )

      oInvitacion:oDbf:GoTop()

      while !oInvitacion:oDbf:Eof()

         oLstInv:SetImageList( oImgInv )

         oImgInv:AddMasked( TBitmap():Define( oInvitacion:cBigResource() ), Rgb( 255, 0, 255 ) )

         oLstInv:InsertItem( nInvi, Capitalize( oInvitacion:oDbf:cNomInv ) )

         oInvitacion:oDbf:Skip()

         nInvi++

      end while

   end if

RETURN ( nil )

//---------------------------------------------------------------------------//

Static Function GetPesoBalanza( aGet, oBtn )

   local nGetFocus   := GetFocus()

   if !Empty( oBalanza )
      aGet[ _NUNTTIL ]:cText( oBalanza:nPeso() )
   end if

   if !Empty( nGetFocus )
      SendMessage( nGetFocus, FM_CLICK, 0, 0 )
   end if

   oBtn:Click()

Return nil

//---------------------------------------------------------------------------//

function lCombinado( cCodArt, aGetArt, aTmpArt, aTmp )

   local nRecArt
   local nRecFam

   lTwoLin              := !lTwoLin

   if lTwoLin

      nRecArt           := ( dbfArticulo )->( Recno() )
      nRecFam           := ( dbfFamilia )->( Recno() )

      if dbSeekInOrd( cCodArtAnt, "Codigo", dbfArticulo )

         if dbSeekInOrd( ( dbfArticulo )->Familia, "cCodFam", dbfFamilia ) .and. !Empty( ( dbfFamilia )->cFamCmb )

            cCodFamAnt  := ( dbfArticulo )->Familia

            loaPrd( ( dbfFamilia )->cFamCmb, .t., .t., aGetArt, aTmpArt, aTmp )

         end if

      end if

      ( dbfArticulo )->( dbGoTo( nRecArt ) )
      ( dbfFamilia )->( dbGoTo( nRecFam ) )

   end if

return .t.

//---------------------------------------------------------------------------//

Function SynTikCli( cPath )

   local oBlock
   local oError
   local aTotTik
   local aTotAlb
   local aTotFac

   DEFAULT cPath     := cPatEmp()

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   USE ( cPath + "TIKET.DBF" )         NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "TIKET", @dbfTikT ) ) EXCLUSIVE
   SET INDEX TO ( cPath + "TIKET.CDX" ) ADDITIVE

   USE ( cPath + "TIKEL.DBF" )         NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "TIKEL", @dbfTikL ) ) EXCLUSIVE
   SET INDEX TO ( cPath + "TIKEL.CDX" ) ADDITIVE

   USE ( cPath + "TIKEP.DBF" )         NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "TIKEP", @dbfTikP ) ) EXCLUSIVE
   SET INDEX TO ( cPath + "TIKEP.CDX" ) ADDITIVE

   USE ( cPatGrp() + "FAMILIAS.DBF" )  NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) ) EXCLUSIVE
   SET INDEX TO ( cPatGrp() + "FAMILIAS.CDX" ) ADDITIVE

   USE ( cPatArt() + "ARTICULO.DBF" )  NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) ) EXCLUSIVE
   SET INDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

   USE ( cPatDat() + "TBLCNV.DBF" ) NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "TBLCNV", @dbfTblCnv ) ) EXCLUSIVE
   SET INDEX TO ( cPatDat() + "TBLCNV.CDX" ) ADDITIVE

   USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) ) EXCLUSIVE
   SET INDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIT", @dbfFacCliT ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "FACCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIL", @dbfFacCliL ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "FACCLIL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FACCLIP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIP", @dbfFacCliP ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "FACCLIP.CDX" ) ADDITIVE

   USE ( cPatEmp() + "AntCliT.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "AntCliT", @dbfAntCliT ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "AntCliT.CDX" ) ADDITIVE

   USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) ) EXCLUSIVE
   SET INDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

   USE ( cPatEmp() + "ALBCLIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIT", @dbfAlbCliT ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "ALBCLIT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "ALBCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIL", @dbfAlbCliL ) ) EXCLUSIVE
   SET INDEX TO ( cPatEmp() + "ALBCLIL.CDX" ) ADDITIVE

   /*
   Cabeceras-------------------------------------------------------------------
   */

   while !( dbfTikT )->( eof() )

      if Empty( ( dbfTikT )->cNcjTik )
         ( dbfTikT )->cNcjTik := "000"
      end if

      /*
      Rellenamos los campos de totales-----------------------------------------
      */

      do case
         case ( dbfTikT )->cTipTik == SAVALB

            if dbSeekInOrd( ( dbfTikT )->cNumDoc, "nNumAlb", dbfAlbCliT )

               aTotAlb  := aTotAlbCli( ( dbfAlbCliT )->cSerAlb + Str( ( dbfAlbCliT )->nNumAlb ) + ( dbfAlbCliT )->cSufAlb, dbfAlbCliT, dbfAlbCliL, dbfIva, dbfDiv, ( dbfAlbCliT )->cDivAlb )

               if ( ( dbfTikT )->nTotNet != aTotAlb[1] .or. ( dbfTikT )->nTotIva != aTotAlb[2] .or. ( dbfTikT )->nTotTik != aTotAlb[4] )

                  ( dbfTikT )->nTotNet := aTotAlb[1]
                  ( dbfTikT )->nTotIva := aTotAlb[2]
                  ( dbfTikT )->nTotTik := aTotAlb[4]

               end if

            end if

         case ( dbfTikT )->cTipTik == SAVFAC

            if dbSeekInOrd( ( dbfTikT )->cNumDoc, "NNUMFAC", dbfFacCliT )

               aTotFac  := aTotFacCli( ( dbfFacCliT )->cSerie + Str( ( dbfFacCliT )->nNumFac ) + ( dbfFacCliT )->cSufFac, dbfFacCliT, dbfFacCliL, dbfIva, dbfDiv, dbfFacCliP, dbfAntCliT, ( dbfFacCliT )->cDivFac )

               if ( dbfTikT )->nTotNet != aTotFac[1] .or. ( dbfTikT )->nTotIva != aTotFac[2] .or. ( dbfTikT )->nTotTik != aTotFac[4]

                  ( dbfTikT )->nTotNet := aTotFac[1]
                  ( dbfTikT )->nTotIva := aTotFac[2]
                  ( dbfTikT )->nTotTik := aTotFac[4]

               end if

            end if

         otherwise

            aTotTik     := aTotTik( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfDiv, , ( dbfTikT )->cDivTik )

            if ( dbfTikT )->nTotNet != aTotTik[1] .or. ( dbfTikT )->nTotIva != aTotTik[2] .or. ( dbfTikT )->nTotTik != aTotTik[3]

               ( dbfTikT )->nTotNet    := aTotTik[1]
               ( dbfTikT )->nTotIva    := aTotTik[2]
               ( dbfTikT )->nTotTik    := aTotTik[3]

            end if

      end case

      ( dbfTikT )->( dbSkip() )

   end while

   /*
   Pagos-------------------------------------------------------------------
   */

   while !( dbfTikP )->( eof() )

      if Empty( ( dbfTikP )->cCodCaj )
         ( dbfTikP )->cCodCaj := "000"
      end if

      ( dbfTikP )->( dbSkip() )

   end while

   /*
   Lineas-------------------------------------------------------------------
   */

   while !( dbfTikL )->( eof() )

      if !( dbfTikT )->( dbSeek( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil ) )

         ( dbfTikL )->( dbDelete() )

      else

         if !Empty( ( dbfTikL )->cCbaTil ) .and. Empty( ( dbfTikL )->cCodFam )
            ( dbfTikL )->cCodFam := RetFamArt( ( dbfTikL )->cCbaTil, dbfArticulo )
         end if

         if !Empty( ( dbfTikL )->cCbaTil ) .and. !Empty( ( dbfTikL )->cCodFam )
            ( dbfTikL )->cGrpFam := cGruFam( ( dbfTikL )->cCodFam, dbfFamilia )
         end if

         if Empty( ( dbfTikL )->cLote ) .and. !Empty( ( dbfTikL )->nLote )
            ( dbfTikL )->cLote   := AllTrim( Str( ( dbfTikL )->nLote ) )
         end if

         if Empty( ( dbfTikL )->cAlmLin ) .or. ( dbfTikL )->cAlmLin != ( dbfTikT )->cAlmTik
            ( dbfTikL )->cAlmLin := ( dbfTikT )->cAlmTik
         end if

         ( dbfTikL )->cTipTil    := ( dbfTikT )->cTipTik

         if ( dbfTikL )->nFacCnv == 0

            if ( dbfArticulo )->( dbSeek( ( dbfTikL )->cCbaTil ) )

               if ( dbfArticulo )->lFacCnv
                  ( dbfTikL )->nFacCnv := RetFld( ( dbfArticulo )->cFacCnv, dbfTblCnv, "NFACCNV" )
               end if

            end if

         end if

      end if

      ( dbfTikL )->( dbSkip() )

      SysRefresh()

   end while

   RECOVER USING oError

      msgStop( "Imposible sincronizar tickets de clientes" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( dbfTikT ) .and. ( dbfTikT )->( Used() )
      ( dbfTikT )->( dbCloseArea() )
   end if

   if !Empty( dbfTikL ) .and. ( dbfTikL )->( Used() )
      ( dbfTikL )->( dbCloseArea() )
   end if

   if !Empty( dbfTikP ) .and. ( dbfTikP )->( Used() )
      ( dbfTikP )->( dbCloseArea() )
   end if

   if !Empty( dbfFamilia ) .and. ( dbfFamilia )->( Used() )
      ( dbfFamilia )->( dbCloseArea() )
   end if

   if !Empty( dbfArticulo ) .and. ( dbfArticulo )->( Used() )
      ( dbfArticulo )->( dbCloseArea() )
   end if

   if !Empty( dbfTblCnv ) .and. ( dbfTblCnv )->( Used() )
      ( dbfTblCnv )->( dbCloseArea() )
   end if

   if !Empty( dbfDiv ) .and. ( dbfDiv )->( Used() )
      ( dbfDiv )->( dbCloseArea() )
   end if

   if !Empty( dbfFacCliT ) .and. ( dbfFacCliT )->( Used() )
      ( dbfFacCliT )->( dbCloseArea() )
   end if

   if !Empty( dbfFacCliL ) .and. ( dbfFacCliL )->( Used() )
      ( dbfFacCliL )->( dbCloseArea() )
   end if

   if !Empty( dbfFacCliP ) .and. ( dbfFacCliP )->( Used() )
      ( dbfFacCliP )->( dbCloseArea() )
   end if

   if !Empty( dbfAntCliT ) .and. ( dbfAntCliT )->( Used() )
      ( dbfAntCliT )->( dbCloseArea() )
   end if

   if !Empty( dbfIva ) .and. ( dbfIva )->( Used() )
      ( dbfIva )->( dbCloseArea() )
   end if

   if !Empty( dbfAlbCliT ) .and. ( dbfAlbCliT )->( Used() )
      ( dbfAlbCliT )->( dbCloseArea() )
   end if

   if !Empty( dbfAlbCliL ) .and. ( dbfAlbCliL )->( Used() )
      ( dbfAlbCliL )->( dbCloseArea() )
   end if

return nil

//---------------------------------------------------------------------------//

Function lStartAvisoPedidos()

   if !Empty( oBtnPedidos )

      lStopAvisoPedidos()
      oTimerBtn               := TTimer():New( 900, {|| lSelectedButton() }, )
      oTimerBtn:Activate()

   end if

return .t.

//---------------------------------------------------------------------------//

Function lStopAvisoPedidos()

   if !Empty( oTimerBtn )

      oTimerBtn:End()
      oTimerBtn               := nil

   endif

return .t.

//---------------------------------------------------------------------------//

Function lSelectedButton()

   if !Empty( oBtnPedidos )
      oBtnPedidos:lSelected   := !oBtnPedidos:lSelected
      oBtnPedidos:Refresh()
   end if

return .t.

//---------------------------------------------------------------------------//

Function ProcesaPedidosWeb( aTmp )

   local cNumeroPedido

   if ( dbfTmpL )->( LastRec() ) != 0
      msgstop( "Existe una venta en curso, concluya la venta antes de continuar." )
      return nil
   end if

   cNumeroPedido  := MuestraPedidosWeb( oBtnPedidos )

   if !Empty( cNumeroPedido )

      // Traspaso de cabeceras de pedidos a ticket--------------------------------

      if ( dbfPedCLiT )->( dbSeek( cNumeroPedido ) )

         aTmp[ _CCLITIK ]  := ( dbfPedCliT )->cCodCli
         aTmp[ _NTARIFA ]  := ( dbfPedCliT )->nTarifa
         aTmp[ _CNOMTIK ]  := ( dbfPedCliT )->cNomCli
         aTmp[ _CDIRCLI ]  := ( dbfPedCliT )->cDirCli
         aTmp[ _CPOBCLI ]  := ( dbfPedCliT )->cPobCli
         aTmp[ _CPRVCLI ]  := ( dbfPedCliT )->cPrvCli
         aTmp[ _CPOSCLI ]  := ( dbfPedCliT )->cPosCli
         aTmp[ _CDNICLI ]  := ( dbfPedCliT )->cDniCli

      end if

      // Traspaso de lineas de pedidos a ticket--------------------------------

      if ( dbfPedCLiL )->( dbSeek( cNumeroPedido ) )

         while ( dbfPedCLiL )->cSerPed + Str( ( dbfPedCLiL )->nNumPed ) + ( dbfPedCLiL )->cSufPed == cNumeroPedido .and. !( dbfPedCLiL )->( eof() )

            ( dbfTmpL )->( dbAppend() )

            ( dbfTmpL )->cCbaTil    := ( dbfPedCliL )->cRef
            ( dbfTmpL )->cNomTil    := ( dbfPedCliL )->cDetalle
            ( dbfTmpL )->nPvpTil    := ( dbfPedCliL )->nPreDiv
            ( dbfTmpL )->nUntTil    := ( dbfPedCliL )->nCanPed
            ( dbfTmpL )->nUndKit    := ( dbfPedCliL )->nUndKit
            ( dbfTmpL )->nIvaTil    := ( dbfPedCliL )->nIva
            ( dbfTmpL )->cFamTil    := ( dbfPedCliL )->cCodFam
            ( dbfTmpL )->nDtoLin    := ( dbfPedCliL )->nDto
            ( dbfTmpL )->nDtoDiv    := ( dbfPedCliL )->nDtoDiv
            ( dbfTmpL )->cCodPr1    := ( dbfPedCliL )->cCodPr1
            ( dbfTmpL )->cCodPr2    := ( dbfPedCliL )->cCodPr2
            ( dbfTmpL )->cValPr1    := ( dbfPedCliL )->cValPr1
            ( dbfTmpL )->cValPr2    := ( dbfPedCliL )->cValPr2
            ( dbfTmpL )->cAlmLin    := ( dbfPedCliL )->cAlmLin
            ( dbfTmpL )->nValImp    := ( dbfPedCliL )->nValImp
            ( dbfTmpL )->cCodImp    := ( dbfPedCliL )->cCodImp
            ( dbfTmpL )->nNumLin    := ( dbfPedCliL )->nNumLin
            ( dbfTmpL )->lKitArt    := ( dbfPedCliL )->lKitArt
            ( dbfTmpL )->lKitChl    := ( dbfPedCliL )->lKitChl
            ( dbfTmpL )->cCodFam    := ( dbfPedCliL )->cCodFam
            ( dbfTmpL )->cGrpFam    := ( dbfPedCliL )->cGrpFam
            ( dbfTmpL )->nLote      := ( dbfPedCliL )->nLote
            ( dbfTmpL )->nNumMed    := ( dbfPedCliL )->nNumMed
            ( dbfTmpL )->nMedUno    := ( dbfPedCliL )->nMedUno
            ( dbfTmpL )->nMedDos    := ( dbfPedCliL )->nMedDos
            ( dbfTmpL )->nMedTre    := ( dbfPedCliL )->nMedTre

            ( dbfTmpL )->nImpCom1   := Retfld( ( dbfPedCliL )->cRef, dbfArticulo, "nImpCom1" ) - 1
            ( dbfTmpL )->nImpCom2   := Retfld( ( dbfPedCliL )->cRef, dbfArticulo, "nImpCom2" ) - 1

            ( dbfPedCLiL )->( dbSkip() )

         end while

      end if

      oBrwDet:Refresh()

      lRecTotal( aTmp )

   end if

Return nil

//---------------------------------------------------------------------------//

Function ComentariosTPV( aGet, aTmp, dbfTmpL )

   local oError
   local oBlock
   local oGetComentario
   local cGetComentario
   local oCbxOrd
   local cNumPed
   local obrwComentarios
   local obrwLineasComentarios
   local oDlgComentarios
   local dbfComentariosT
   local dbfComentariosL
   local oFntDlg

   if ( dbfTmpL )->( LastRec() ) == 0
      MsgStop( "No puede a�adir un comentario." )
      return .f.
   end if

   oFntDlg              := TFont():New( FONT_NAME, 12, 32, .F., .T.,  )

   cGetComentario       := ( dbfTmpL )->cComent

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      USE ( cPatEmp() + "COMENTARIOST.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "COMENTARIOST", @dbfComentariosT ) )
      SET INDEX TO ( cPatEmp() + "COMENTARIOST.CDX" ) ADDITIVE
      ( dbfComentariosT )->( OrdSetFocus( "cCodigo" ) )

      USE ( cPatEmp() + "COMENTARIOSL.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "COMENTARIOSL", @dbfComentariosL ) )
      SET INDEX TO ( cPatEmp() + "COMENTARIOSL.CDX" ) ADDITIVE
      ( dbfComentariosL )->( OrdSetFocus( "cCodDes" ) )

      DEFINE DIALOG oDlgComentarios RESOURCE "COMENTARIOS_TPV"

      REDEFINE GET oGetComentario VAR cGetComentario ;
         ID       150;
         FONT     oFntDlg ;
         OF       oDlgComentarios

      REDEFINE BUTTONBMP ;
         ID       160 ;
         OF       oDlgComentarios ;
         BITMAP   "Keyboard2_32" ;
         ACTION   ( VirtualKey( .f., oGetComentario ) )

      REDEFINE BUTTONBMP ;
         ID       170 ;
         OF       oDlgComentarios ;
         BITMAP   "Up32" ;
         ACTION   ( obrwComentarios:Select( 0 ), oBrwComentarios:GoUp(), obrwComentarios:Select( 1 ) )

      REDEFINE BUTTONBMP ;
         ID       171 ;
         OF       oDlgComentarios ;
         BITMAP   "Down32" ;
         ACTION   ( obrwComentarios:Select( 0 ), oBrwComentarios:GoDown(), obrwComentarios:Select( 1 ) )

      REDEFINE BUTTONBMP ;
         ID       180 ;
         OF       oDlgComentarios ;
         BITMAP   "arrow_up_blue" ;
         ACTION   ( oBrwLineasComentarios:Select( 0 ), oBrwLineasComentarios:GoUp(), oBrwLineasComentarios:Select( 1 ) )

      REDEFINE BUTTONBMP ;
         ID       181 ;
         OF       oDlgComentarios ;
         BITMAP   "arrow_down_blue" ;
         ACTION   (oBrwLineasComentarios:Select( 0 ), oBrwLineasComentarios:GoDown(), oBrwLineasComentarios:Select( 1 ) )

      REDEFINE BUTTONBMP ;
         ID       IDOK ;
         OF       oDlgComentarios ;
         ACTION   ( EndComentario( oDlgComentarios, dbfTmpL, oGetComentario ) )

      REDEFINE BUTTONBMP ;
         ID       IDCANCEL ;
         OF       oDlgComentarios ;
         ACTION   ( oDlgComentarios:End() )

      oBrwComentarios                  := IXBrowse():New( oDlgComentarios )

      obrwComentarios:bClrSel          := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      obrwComentarios:bClrSelFocus     := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      obrwComentarios:cAlias           := dbfComentariosT
      obrwComentarios:nMarqueeStyle    := 6
      obrwComentarios:cName            := "Comentarios de art�culos"
      obrwComentarios:nRowHeight       := 40
      oBrwComentarios:lHeader          := .f.
      oBrwComentarios:lHScroll         := .f.

      obrwComentarios:CreateFromResource( 100 )

      obrwComentarios:bChange         := {|| ChangeComentarios( dbfComentariosT, dbfComentariosL, oBrwLineasComentarios ) }

      with object ( oBrwComentarios:AddCol() )
         :cSortOrder       := "cCodigo"
         :bEditValue       := {|| ( dbfComentariosT )->cDescri }
      end with

      oBrwLineasComentarios                  := IXBrowse():New( oDlgComentarios )

      oBrwLineasComentarios:bClrSel          := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwLineasComentarios:bClrSelFocus     := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwLineasComentarios:cAlias           := dbfComentariosL
      oBrwLineasComentarios:nMarqueeStyle    := 6
      oBrwLineasComentarios:cName            := "Lineas comentarios de art�culos"
      oBrwLineasComentarios:nRowHeight       := 40
      oBrwLineasComentarios:lHeader          := .f.
      oBrwLineasComentarios:lHScroll         := .f.

      oBrwLineasComentarios:CreateFromResource( 110 )

      with object ( oBrwLineasComentarios:AddCol() )
         :bEditValue          := {|| ( dbfComentariosL )->cDescri }
      end with

      oBrwLineasComentarios:bLClicked := {|| ChangeLineasComentarios( oGetComentario, dbfComentariosL ) }

      ACTIVATE DIALOG oDlgComentarios CENTER

   RECOVER USING oError

      msgStop( 'Imposible abrir ficheros de comentarios de art�culos' + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE ( dbfComentariosT )
   CLOSE ( dbfComentariosL )

Return ( nil )

//---------------------------------------------------------------------------//

static function cTextoOfficeBar( aTmp )

   local uValor

   if !Empty( oBtnCliente )

      uValor         := AllTrim( RetFld( aTmp[ _CCLITIK ], dbfClient, "Titulo" ) )

      oBtnCliente:cCaption( if( !Empty( uValor ), uValor, "..." ) )

   end if

   if !Empty( oBtnDireccion )

      uValor         := AllTrim( RetFld( aTmp[ _CCLITIK ], dbfClient, "Domicilio" ) )

      oBtnDireccion:cCaption( if( !Empty( uValor ), uValor, "..." ) )

   end if

   if !Empty( oBtnTelefono )

      uValor         := AllTrim( RetFld( aTmp[ _CCLITIK ], dbfClient, "Telefono" ) ) + Space( 1 ) + AllTrim( RetFld( aTmp[ _CCLITIK ], dbfClient, "cMeiInt" ) )

      oBtnTelefono:cCaption( if( !Empty( uValor ), uValor, "..." ) )

   end if

Return nil

//---------------------------------------------------------------------------//

Static Function lSeleccionaCliente( aTmp )

   local cCliente       := BrwCliTactil( nil, nil, nil, .t. )

   aTmp[ _CCLITIK  ]    := cCliente

   aTmp[ _CNOMTIK  ]    := RetFld( cCliente, dbfClient, "Titulo" )
   aTmp[ _CDIRCLI  ]    := RetFld( cCliente, dbfClient, "Domicilio" )
   aTmp[ _CPOBCLI  ]    := RetFld( cCliente, dbfClient, "Poblacion" )
   aTmp[ _CPRVCLI  ]    := RetFld( cCliente, dbfClient, "Provincia" )
   aTmp[ _CPOSCLI  ]    := RetFld( cCliente, dbfClient, "CodPostal" )
   aTmp[ _CDNICLI  ]    := RetFld( cCliente, dbfClient, "Nif" )
   aTmp[ _NTARIFA  ]    := Max( RetFld( cCliente, dbfClient, "nTarifa" ), 1 )

   cTextoOfficeBar( aTmp )

Return .t.

//---------------------------------------------------------------------------//

static function lNumeroComensales( aTmp )

   aTmp[ _NNUMCOM ]  := nVirtualNumKey( "Users1_32", "N�mero comensales" )

   lRecTotal( aTmp )

Return .t.

//---------------------------------------------------------------------------//

Static Function lCambiaTicket( lSubir, aTmp, aGet, nMode )

   local oError
   local oBlock

   /*
   Comprobamos que no sea ni el primer registro ni el �ltimo-------------------
   */

   if lSubir

      if ( dbfTikT )->( OrdKeyno() ) == 1
         MsgStop( "Ya estas en el primer registro" )
         return nil
      end if

   else

      if ( dbfTikT )->( OrdKeyno() ) == ( dbfTikT )->( OrdKeyCount() )
         MsgStop( "Ya estas en el �ltimo registro" )
         return nil
      end if

   end if
   /*
   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE
   */
   nSaveMode         := EDIT_MODE

   /*
   Guarda la venta actual------------------------------------------------------
   */

   if GuardaVenta( aTmp, aGet )

      /*
      Subo o bajo un registro--------------------------------------------------
      */

      if lSubir
         ( dbfTikT )->( dbSkip( -1 ) )
      else
         ( dbfTikT )->( dbSkip() )
      end if

      /*
      Abrimos el ticket seleccionado-------------------------------------------
      */

      aScatter( dbfTikT, aTmp )

      BeginTrans( aTmp, aGet, nMode )

      /*
      Botones de la officebar--------------------------------------------------
      */

      if lTactilMode()
         oSalaVentas:ConfigButton( oBtnTarifa, oBtnRenombrar )
      end if

      /*
      Titulo de la ventana-----------------------------------------------------
      */

      cTitleDialog( aTmp )

      /*
      Botones de la ventana de tpv---------------------------------------------
      */

      SetButtonEdtRec( nSaveMode, aTmp )

      /*
      Recalculamos el total----------------------------------------------------
      */

      lRecTotal( aTmp )

      /*
      Cargamos y refrescamos datos del cliente------------------------------
      */

      cOldCodCli        := ""

      if !Empty( aGet[ _CCLITIK ] )
         aGet[ _CCLITIK ]:SetFocus()
         aGet[ _CCLITIK ]:lValid()
      end if

   end if
   /*
   RECOVER USING oError

      msgStop( "Error al cambiar de ticket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )
   */
Return .t.

//---------------------------------------------------------------------------//

Static Function lCambiaSerie( aTmp, lSubir, oGrupoSerie )

   if lSubir
      aTmp[ _CSERTIK ]        := cUpSerie( aTmp[ _CSERTIK ] )
      oGrupoSerie:cPrompt     := "Serie: " + aTmp[ _CSERTIK ]
   else
      aTmp[ _CSERTIK ]        := cDwSerie( aTmp[ _CSERTIK ] )
      oGrupoSerie:cPrompt     := "Serie: " + aTmp[ _CSERTIK ]
   end if

Return .t.

//---------------------------------------------------------------------------//

Function ImprimirTiketPda()

   local nTikT
   local nNumTik
   local dbfImp
   local oError
   local oBlock
   local lError      := .f.
   local lCloseFiles := .f.
   local lOpen

   CursorWait()

   StopAutoImp()

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "TIKETIMP.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TIKETIMP", @dbfImp ) )
   SET INDEX TO ( cPatEmp() + "TIKETIMP.CDX" ) ADDITIVE

   ( dbfImp )->( OrdSetFocus( "CIMPTIK" ) )

   ( dbfImp )->( dbGoTop() )

   if ( dbfImp )->( OrdKeyNo() ) != 0

      if lOpenFiles
         nTikT          := ( dbfTikT )->( Recno() )
      else
         if OpenFiles()
            lCloseFiles := .t.
         else
            lError      := .t.
         end if
      end if

      if !lError

         ( dbfImp )->( dbGoTop() )
         while !( dbfImp )->( eof() )

            if ( dbfImp )->lComanda
               ImpresionComanda( ( dbfImp )->cSerTik + ( dbfImp )->cNumTik + ( dbfImp )->cSufTik, dbfImp )
            else
               nNumTik := ( dbfImp )->cSerTik + ( dbfImp )->cNumTik + ( dbfImp )->cSufTik
               if dbSeekInOrd( nNumTik, "CNUMTIK", dbfTikT )
                  ImpTiket( , , , dbfImp )
               end if
            end if

            SysRefresh()

            ( dbfImp )->( dbSkip() )

            SysRefresh()

         end while

      end if

      if lCloseFiles
         CloseFiles()
      else
         ( dbfTikT )->( dbGoTo( nTikT ) )
      end if

   end if

   RECOVER USING oError

      msgStop( "Error al imprimir ticket desde pda" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Cierro las tablas-----------------------------------------------------------
   */

   CLOSE ( dbfImp )

   dbfImp      := nil

   /*
   Reactivo el timer-----------------------------------------------------------
   */

   StartAutoImp()

   CursorWE()

Return nil

//---------------------------------------------------------------------------//

Function SetAutoImp()

   local nSecondTime

   if Empty( oTimer )

      nSecondTime    := uFieldEmpresa( "nTiempoImp", 0 )

      if nSecondTime != 0
         oTimer      := TTimer():New( nSecondTime * 1000, {|| ImprimirTiketPda() } )
         oTimer:Activate()
      end if

   end if

Return nil

//---------------------------------------------------------------------------//

Function KillAutoImp()

   if !Empty( oTimer )
      oTimer:End()
   end if

   oTimer         := nil

Return( nil )

//---------------------------------------------------------------------------//

Function StartAutoImp()

   if !Empty( oTimer )
      oTimer:Activate()
   end if

Return( nil )

//---------------------------------------------------------------------------//

Function StopAutoImp()

   if !Empty( oTimer )
      oTimer:DeActivate()
   end if

Return( nil )

//---------------------------------------------------------------------------//

Function pdaTicket()

   local oBlock
   local oError

   if !OpenFiles() // pdaOpenFiles()
      return nil
   end if

   if Empty( nZona )
      PdaZona()
   end if

   if Empty( nCurSe )
      pdaSesion()
   end if

   if IsTrue( oSalaVentas:lPuntosVenta )

      while !IsNil( pdaGetSalaVenta() )

         if !Empty( oSalaVentas:cSelectedTiket )

            EdtPda( oSalaVentas:cSelectedTiket, EDIT_MODE )

         else

            EdtPda( nil, APPD_MODE )

         end if

      end while

   end if

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   CloseFiles() // pdaCloseFiles()

   RECOVER USING oError

      msgStop( "Imposible abrir tikects" )

   END SEQUENCE

   ErrorBlock( oBlock )

   // Restauramos la ventana---------------------------------------------------

   oWnd():Show()

Return Nil

//---------------------------------------------------------------------------//

Function pdaAbrirTablas()

   local oError
   local oBlock
   local cPcName     := AllTrim( cNombrePC() ) + "Emp" + Alltrim( cCodigoEmpresa() ) + "\"
   local lOpenFile   := .t.

   cPatPc( cPcName )

   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      dbUseArea( .t., cDriver(), cPatPc() + "TIKET.Dbf", cCheckArea( "TIKET", @dbfTikT ), .t. )
      ( dbfTikT )->( ordListAdd( cPatPc() + "TIKET.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "TIKEL.Dbf", cCheckArea( "TIKEL", @dbfTikL ), .t. )
      ( dbfTikL )->( ordListAdd( cPatPc() + "TIKEL.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "TIKEP.Dbf", cCheckArea( "TIKEP", @dbfTikP ), .t. )
      ( dbfTikP )->( ordListAdd( cPatPc() + "TIKEP.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "NCOUNT.Dbf", cCheckArea( "DBFCOUNT", @dbfCount ), .t. )
      ( dbfCount )->( ordListAdd( cPatPc() + "NCOUNT.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "TIKETIMP.Dbf", cCheckArea( "TIKETIMP", @dbfImp ), .t. )
      ( dbfImp )->( ordListAdd( cPatPc() + "TIKETIMP.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "COMENTARIOST.Dbf", cCheckArea( "COMENTARIOST", @dbfComentariosT ), .t. )
      ( dbfComentariosT )->( ordListAdd( cPatPc() + "COMENTARIOST.Cdx" ) )

      dbUseArea( .t., cDriver(), cPatPc() + "COMENTARIOSL.Dbf", cCheckArea( "COMENTARIOSL", @dbfComentariosL ), .t. )
      ( dbfComentariosL )->( ordListAdd( cPatPc() + "COMENTARIOSL.Cdx" ) )
      ( dbfComentariosL )->( OrdSetFocus( "cCodDes" ) )

   RECOVER USING oError

      lOpenFile   := .f.

      pdaCerrarTablas()

      msgStop( "Error de conexi�n con pc." + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return lOpenFile

//---------------------------------------------------------------------------//

Function pdaCerrarTablas()

   if( !Empty( dbfTikT         ), ( dbfTikT           )->( dbCloseArea() ), )
   if( !Empty( dbfTikL         ), ( dbfTikL           )->( dbCloseArea() ), )
   if( !Empty( dbfTikP         ), ( dbfTikP           )->( dbCloseArea() ), )
   if( !Empty( dbfDiv          ), ( dbfDiv            )->( dbCloseArea() ), )
   if( !Empty( dbfKit          ), ( dbfKit            )->( dbCloseArea() ), )
   if( !Empty( dbfImp          ), ( dbfImp            )->( dbCloseArea() ), )
   if( !Empty( dbfComentariosT ), ( dbfComentariosT   )->( dbCloseArea() ), )
   if( !Empty( dbfComentariosL ), ( dbfComentariosL   )->( dbCloseArea() ), )

   dbfTikT           := nil
   dbfTikL           := nil
   dbfTikP           := nil
   dbfDiv            := nil
   dbfKit            := nil
   dbfImp            := nil
   dbfComentariosT   := nil
   dbfComentariosL   := nil

Return Nil



//---------------------------------------------------------------------------//

Static Function pdaOpenFiles()

   local oError
   local oBlock
   local cPcName     := AllTrim( cNombrePC() ) + "Emp" + Alltrim( cCodigoEmpresa() ) + "\"
   local cPatEmp     := cPatEmp()

   if pdaAbrirTablas()

      oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
      BEGIN SEQUENCE

         lOpenFiles           := .t.

         USE ( cPatGrp() + "FAMILIAS.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) )
         SET INDEX TO ( cPatGrp() + "FAMILIAS.Cdx" ) ADDITIVE

         USE ( cPatArt() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) )
         SET INDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

         USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
         ( dbfFPago )->( ordListAdd( cPatGrp() + "FPago.Cdx" ) )

         USE ( cPatDat() + "TBLCNV.DBF" ) NEW VIA ( cDriver() )SHARED ALIAS ( cCheckArea( "TBLCNV", @dbfTblCnv ) )
         SET INDEX TO ( cPatDat() + "TBLCNV.CDX" ) ADDITIVE

         USE ( cPatEmp + "NCOUNT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "NCOUNT", @dbfCount ) )
         SET INDEX TO ( cPatEmp + "NCOUNT.CDX" ) ADDITIVE

         USE ( cPatGrp() + "CONFIG.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CONFIG", @dbfConfig ) )
         SET INDEX TO ( cPatGrp() + "CONFIG.CDX" ) ADDITIVE


         oSalaVentas          := TSalaVenta():New( cPatEmp() )
         if !oSalaVentas:OpenFiles()
            lOpenFiles        := .f.
         else
            oSalaVentas:cTikT := dbfTikT
            oSalaVentas:cTikL := dbfTikL
            oSalaVentas:cDiv  := dbfDiv
            oSalaVentas:BuildSala()
         end if

         //LLenamos los pictures de la divisa

         cPouDiv              := cPouDiv( cDivEmp(), dbfDiv )        // Picture de la divisa
         cPorDiv              := cPorDiv( cDivEmp(), dbfDiv )        // Picture de la divisa redondeada
         cPicEur              := cPorDiv( cDivChg(), dbfDiv )        // Picture de la divisa equivalente
         nDouDiv              := nDouDiv( cDivEmp(), dbfDiv )        // .Decimales
         nDorDiv              := nRouDiv( cDivEmp(), dbfDiv )        // Decimales redondeados

         cPicUnd              := MasUnd()

      RECOVER USING oError

         lOpenFiles           := .f.

         msgStop( "Error al conectar con el pc " + CRLF + ErrorMessage( oError ) )

      END SEQUENCE

      ErrorBlock( oBlock )

      pdaCerrarTablas()

      if !lOpenFiles
         pdaCloseFiles()
      end if

      else

         msginfo("Error de conexion con el pc, Reintente")

      end if

RETURN ( lOpenFiles )

//----------------------------------------------------------------------------//

Static Function pdaCloseFiles()

   if( !Empty( dbfFamilia        ), ( dbfFamilia         )->( dbCloseArea() ), )
   if( !Empty( dbfArticulo       ), ( dbfArticulo        )->( dbCloseArea() ), )
   if( !Empty( dbfTblCnv         ), ( dbfTblCnv          )->( dbCloseArea() ), )
   if( !Empty( dbfCount          ), ( dbfCount           )->( dbCloseArea() ), )
   if( !Empty( dbfFPago          ), ( dbfFPago           )->( dbCloseArea() ), )
   if( !Empty( dbfConfig         ), ( dbfConfig          )->( dbCloseArea() ), )

   if !Empty( oSalaVentas )
      oSalaVentas:end()
   end if

   dbfFamilia        := nil
   dbfArticulo       := nil
   dbfTblCnv         := nil
   dbfCount          := nil
   dbfFPago          := nil
   dbfConfig         := nil

   oSalaVentas       := nil

   lOpenFiles        := .f.

Return .T.

//---------------------------------------------------------------------------//

Static Function EdtPda( cNumTik, nMode )

   local aTmp
   local aGet
   local oBrwLin
   local oBrwFamilia
   local oBrwArticulo
   local oBtnSalon
   local oBtnSuma
   local oBtnResta
   local oBtnFavoritos
   local oBtnShow
   local oFntTot
   local oFntTit
   local oFntArt
   local oError
   local oBlock
   local nOrdArt
   local nOrdFam
   local aDbfBmp           := {  LoadBitmap( GetResources(), "Sel16" ) }
   local oTitArt
   local oTitPrc
   local lOpen             := .t.

   if !pdaAbrirTablas()
      Return .f.
   end if

   /*
   Cargamos los campos de la tabal en el array---------------------------------
   */

   do case
      case nMode == APPD_MODE

         aTmp              := dbBlankRec( dbfTikT )

      case nMode == EDIT_MODE

         if dbSeekInOrd( cNumTik, "cNumTik", dbfTikT )

            if !pdaIsLockSemaphore( dbfTikT )
               aTmp        := dbScatter( dbfTikT )
            else
               msgInfo( "El ticket est� actualmente bloqueado", cNumTik )
               lOpen       := .f.
            end if

         else

            lOpen          := .f.

         end if

   end case

   if lOpen

      aGet                 := Array( ( dbfTikT )->( fCount() ) )

      if BeginTrans( aTmp, aGet, nMode )
         lOpen             := .f.
      end if

   end if

   /*
   Cierro las tablas con el pc-------------------------------------------------
   */

   pdaCerrarTablas()

   if !lOpen
      oWnd():Show()
      return .f.
   end if

   nOrdFam                 := ( dbfFamilia  )->( OrdSetFocus( "cNomFam" ) )
   nOrdArt                 := ( dbfArticulo )->( OrdSetFocus( "nPosTpv" ) )

   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   if nMode == APPD_MODE

      aTmp[ _CCODSALA  ]   := oSalaVentas:cSelectedSala
      aTmp[ _CPNTVENTA ]   := oSalaVentas:cSelectedPunto
      aTmp[ _NTARIFA   ]   := oSalaVentas:nTarifa

   end if

   oFntTot                 := TFont():New( FONT_NAME,     7, 24, .f., .t. )
   oFntTit                 := TFont():New( "Verdana",     7, 14, .f., .t. )
   oFntArt                 := TFont():New( "SYSTEM_FONT", 7, 12, .f., .f. )

   lShowBrwLin             := .f.

   DEFINE DIALOG oDlgTpv RESOURCE "TIKET_PDA_01"

   REDEFINE BTNBMP oBtnSalon ;
      ID       203 ;
      OF       oDlgTpv ;
      FILE     ( cPatBmp() + "libre_16.bmp" ) ;
      NOBORDER ;
      ACTION   ( PdaBtnLibre( aTmp, oBrwLin, oFntTit ) )

      oBtnSalon:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE BTNBMP oBtnShow ;
      ID       204 ;
      OF       oDlgTpv ;
      FONT     oFntTit;
      NOBORDER ;
      ACTION   ( PdaShowBrwLin( oBtnShow, oBtnSalon, oNumTot, oBrwLin, oBrwFamilia, oBrwArticulo, !lShowBrwLin, oTitArt, oTitPrc ), lRecTotal( aTmp ) )

      oBtnShow:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE SAY oNumTot ;
      PROMPT   Trans( 0, cPorDiv );
      FONT     oFntTot ;
      COLOR    "N";
      ID       210 ;
      OF       oDlgTpv

      oNumTot:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE SAY oTitArt ;
      PROMPT   "" ;
      FONT     oFntArt ;
      ID       205 ;
      OF       oDlgTpv

      oTitArt:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE SAY oTitPrc ;
      PROMPT   "" ;
      FONT     oFntArt ;
      ID       206 ;
      OF       oDlgTpv

      oTitPrc:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE LISTBOX oBrwLin ;
      FIELDS ;
               if( ( dbfTmpL )->lArtServ,  aDbfBmp[ 1 ], ),;
               AllTrim( Trans( ( dbfTmpL )->nUntTil, cPicUnd ) ),;
               if( Empty( ( dbfTmpL )->cComent ), Upper( Rtrim( ( dbfTmpL )->cNomTil ) ),"[*] " + Upper( Rtrim( ( dbfTmpL )->cNomTil ) ) ),;
               AllTrim( Trans( nTotLTpv( dbfTmpL, nDouDiv, nDorDiv ), cPorDiv ) );
      HEAD;
               "S",;
               "Und",;
               "Detalle",;
               "Total";
      FIELDSIZES ;
               15,;
               30,;
               140,;
               70;
      ALIAS    ( dbfTmpL );
      ID       100 ;
      OF       oDlgTpv

   oBrwLin:aJustify     := { .f., .t., .f., .t. }
   oBrwLin:lSingleLine  := .t.
   oBrwLin:bLDblClick   := {|| ArticuloServido( oBrwLin, dbfTmpL ) }

   REDEFINE LISTBOX oBrwFamilia ;
      FIELDS ;
                Upper( ( dbfFamilia )->cNomFam ) ;
      HEAD;
               "Familias";
      FIELDSIZES ;
               50 ;
      ALIAS    ( dbfFamilia );
      ID       110 ;
      OF       oDlgTpv

   oBrwFamilia:GoTop()
   oBrwFamilia:bChange     := {|| ChangeFamilias( oBrwArticulo ) }
   oBrwFamilia:bLClicked   := {|| ChangeFamilias( oBrwArticulo ) }
   oBrwFamilia:lSingleLine := .t.

   REDEFINE LISTBOX oBrwArticulo ;
      FIELDS ;
               Upper( ( dbfArticulo )->Nombre );
      HEAD;
               "Art�culos";
      FIELDSIZES ;
               90;
      ALIAS    ( dbfArticulo );
      ID       120 ;
      OF       oDlgTpv

   oBrwArticulo:lSingleLine   := .t.
   oBrwArticulo:bLDblClick    := {|| WinAppRec( oBrwLin, bEdtPdaL, dbfTmpL, aTmp, .f. ) , ComprobarFamilia( dbfTmpL, oFntTit, oBrwLin, cNumTik, oTitArt, oTitPrc ) }

   oDlgTpv:bStart             := {|| cTitleSalaVenta( nil, oBtnShow ), PdaShowBrwLin( oBtnShow, oBtnSalon, oNumTot, oBrwLin, oBrwFamilia, oBrwArticulo, .f., oTitArt, oTitPrc ), lRecTotal( aTmp ) }

   ACTIVATE DIALOG oDlgTpv ;
      ON INIT ( pdaMenuEdtRec( aTmp, aGet, nMode, oFntTit, dbfTmpL, oBrwLin, oNumTot, oBrwArticulo, cNumTik, oTitArt, oTitPrc ), LoadFavoritos( oBrwArticulo ) )

   /*
   Matamos las tablas temporales-----------------------------------------------
   */

   KillTrans()

   oFntTot:end()
   oFntTit:end()
   oFntArt:End()

   ( dbfFamilia  )->( OrdSetFocus( nOrdFam ) )
   ( dbfArticulo )->( OrdSetFocus( nOrdArt ) )

   /*
   Restauramos la ventana------------------------------------------------------
   */

   oWnd():Show()

   RECOVER USING oError

      msgStop( "Error al montar ventana de tiket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

return ( oDlgTpv:nResult == IDOK )

//---------------------------------------------------------------------------//

static function PdaShowBrwLin( oBtnShow, oBtnSalon, oNumTot, oBrwLin, oBrwFamilia, oBrwArticulo, lShow, oTitArt, oTitPrc )

   if lShow
      oBrwLin:Show()
      oBrwFamilia:Hide()
      oBrwArticulo:Hide()
      oTitArt:Hide()
      oTitPrc:Hide()
      oBtnShow:SetColor( 0, nRGB( 63, 240, 254 )  )
      oBtnSalon:SetColor( 0, nRGB( 63, 240, 254 )  )
      oNumTot:SetColor( 0, nRGB( 63, 240, 254 )  )
      lShowBrwLin    := .t.
   else
      oBrwLin:Hide()
      oBrwFamilia:Show()
      oBrwArticulo:Show()
      oTitArt:Show()
      oTitPrc:Show()
      oBtnShow:SetColor( 0, nRGB( 255, 255, 255 )  )
      oBtnSalon:SetColor( 0, nRGB( 255, 255, 255 )  )
      oNumTot:SetColor( 0, nRGB( 255, 255, 255 )  )
      lShowBrwLin    := .f.
   end if

   oBtnShow:Refresh()
   oBtnSalon:Refresh()
   oNumTot:Refresh()

return .t.

//---------------------------------------------------------------------------//

Static Function pdaMenuEdtRec( aTmp, aGet, nMode, oFntTit, dbfTmpL, oBrwLin, oNumTot, oBrwArticulo, cNumTik, oTitArt, oTitPrc )

   local oMenu

   /*

   DEFINE MENU oMenu ;
      RESOURCE 600 ;
      BITMAPS  140 ;    // bitmap resources ID
      IMAGES   15       // number of images in the bitmap

      REDEFINE MENUITEM;
               ID       610;
               OF       oMenu;
               ACTION   ( if( PdaNewTiket( aTmp, aGet, nMode ), oDlgTpv:End( IDOK ), ) )


      REDEFINE MENUITEM;
               ID       620;
               OF       oMenu;
               ACTION   ( LoadFavoritos( oBrwArticulo ) ) // ACTION   ( pdaCombinado( oBrwFamilia, oBrwArticulo ) )

      REDEFINE MENUITEM;
               ID       630;
               OF       oMenu;
               ACTION   ( if( !lShowBrwLin, ( WinAppRec( oBrwLin, bEdtPdaL, dbfTmpL, aTmp, .f. ) , ComprobarFamilia( dbfTmpL, oFntTit, oBrwLin, cNumTik, oTitArt, oTitPrc ) ), ) )

      REDEFINE MENUITEM;
               ID       640;
               OF       oMenu;
               ACTION   ( if( !lShowBrwLin, WinAppRec( oBrwLin, bEdtPdaL, dbfTmpL, aTmp, .t. ), ) )

      REDEFINE MENUITEM;
               ID       650;
               OF       oMenu;
               ACTION   ( pdaComentario( oFntTit, dbfTmpL ) )

      REDEFINE MENUITEM;
               ID       660;
               OF       oMenu;
               ACTION   ( if( PdaNewTiket( aTmp, aGet, nMode, .f., .t. ), oDlgTpv:End( IDOK ), ) )

      REDEFINE MENUITEM;
               ID       670;
               OF       oMenu;
               ACTION   ( if( PdaNewTiket( aTmp, aGet, nMode, .f.,, .t. ), oDlgTpv:End( IDOK ), ) )

      REDEFINE MENUITEM ;
               ID       680 ;
               OF       oMenu ;
               ACTION   ( oDlgTpv:End() )

   oDlgTpv:SetMenu( oMenu )
   */

Return oMenu

//---------------------------------------------------------------------------//

function pdaCombinado( oBrwFamilia ) // cCodArt, aGetArt, aTmpArt, aTmp )

   local nRecArt
   local nRecFam

   lTwoLin              := !lTwoLin

   if lTwoLin

      nRecArt           := ( dbfArticulo )->( Recno() )
      nRecFam           := ( dbfFamilia )->( Recno() )

      if dbSeekInOrd( cCodArtAnt, "Codigo", dbfArticulo )

         if dbSeekInOrd( ( dbfArticulo )->Familia, "cCodFam", dbfFamilia ) .and. !Empty( ( dbfFamilia )->cFamCmb )

            cCodFamAnt  := ( dbfArticulo )->Familia

            msginfo( "combinar con " + ( dbfFamilia )->cFamCmb )

         end if

      end if

      ( dbfArticulo )->( dbGoTo( nRecArt ) )
      ( dbfFamilia )->( dbGoTo( nRecFam ) )

   end if

return .t.

//---------------------------------------------------------------------------//
/*
Funcion para lanzar la ventana de comentarios si la familia selecionada esta marcada para ello
*/

static Function ComprobarFamilia( dbfTmpL, oFntTit, oBrwLin, cNumTik, oTitArt, oTitPrc )

   oBrwLin:GoBottom()

   if ( dbfFamilia )->lMostrar

      pdaComentario( oFntTit, dbfTmpL, cNumTik)

   end if

   /*
   Informamos del �ltimo art�culo vendido--------------------------------------
   */

   if !Empty( oTitArt )
      oTitArt:SetText( if( Empty( ( dbfTmpL )->cComent ), Upper( Rtrim( ( dbfTmpL )->cNomTil ) ),"[*] " + Upper( Rtrim( ( dbfTmpL )->cNomTil ) ) ) )
   end if

   if !Empty( oTitPrc )
      oTitPrc:SetText( AllTrim( Trans( nTotLTpv( dbfTmpL, nDouDiv, nDorDiv ), cPorDiv ) ) )
   end if

Return nil

//---------------------------------------------------------------------------//
/*
   Funci�n para poner un comentario a un articulo
*/
//---------------------------------------------------------------------------//

Static Function pdaComentario( oFntTit, dbfTmpL )

   local oDlg
   local oBrwComentariosT
   local oBrwComentariosL
   local oGetComentario
   local cGetComentario

   if ( dbfTmpL )->( LastRec() ) == 0
      MsgStop( "No puede a�adir un comentario." )
      return .f.
   end if

   /*
   Abrimos las tablas del pc---------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if

   cGetComentario       := ( dbfTmpL )->cComent

   DEFINE DIALOG oDlg RESOURCE "COMENTARIOS"

      REDEFINE GET oGetComentario VAR cGetComentario;
         ID       300 ;
         COLOR    "N/W*" ;
         Font     oFntTit ;
         OF       oDlg

      REDEFINE LISTBOX oBrwComentariosT ;
         FIELDS ;
               Upper( ( dbfComentariosT )->cDescri ) ;
         HEAD;
         "Tipos de comentarios";
         FIELDSIZES ;
            50 ;
         ALIAS    ( dbfComentariosT );
         ID       100 ;
         OF       oDlg
      oBrwComentariosT:GoTop()
      oBrwComentariosT:bChange      := {|| ChangeComentarios( , ,oBrwComentariosL ) }
      oBrwComentariosT:lSingleLine  := .t.

      REDEFINE LISTBOX oBrwComentariosL ;
         FIELDS ;
               Upper( ( dbfComentariosL )->cDescri );
         HEAD;
               "Comentarios";
         FIELDSIZES ;
               90;
         ALIAS    ( dbfComentariosL );
         ID       110 ;
         OF       oDlg

      oBrwComentariosL:bLDblClick      := {|| changelineasComentarios( oGetComentario ) }
      oBrwComentariosL:lSingleLine     := .t.

   oDlg:bStart                      := {|| changeComentarios( , ,oBrwComentariosL ) }

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuComentarios( oDlg, dbfTmpL, oGetComentario ) )

    pdaCerrarTablas()

Return .t.

//---------------------------------------------------------------------------//

Static function pdaMenuComentarios( oDlg, dbfTmpL, oGetComentario )

   local oMenu
   /*
   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( EndComentario( oDlg, dbfTmpL, oGetComentario ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )
   */
Return oMenu

//---------------------------------------------------------------------------//
/*
   Funcion para crear el articulo libre
*/
//---------------------------------------------------------------------------//

Static Function PdaBtnLibre( aTmp, oBrwLin, oFntTit )

   local oDlg
   local oSayTit
   local oGetNombre
   local cGetNombre     := Space( 100 )
   local oGetUnidades
   local nGetUnidades   := 1
   local oGetPrecio
   local nGetPrecio     := 0
   local oGetTotal
   local nGetTotal      := 0
   local oBtn
   local oSayTot
   local oFont
   local cPinDiv

   cPinDiv              := cPinDiv( cDivEmp(), dbfDiv )

   DEFINE DIALOG oDlg RESOURCE "ARTICULO_LIBRE"

   REDEFINE SAY oSayTit ;
      ID       130 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   REDEFINE BTNBMP oBtn ;
      ID       140 ;
      OF       oDlg ;
      FILE     ( cPatBmp() + "Libre.bmp" ) ;
      NOBORDER ;
      ACTION   ( nil )

      oBtn:SetColor( 0, nRGB( 255, 255, 255 )  )

   REDEFINE GET oGetNombre VAR cGetNombre ;
      ID       100 ;
      OF       oDlg

   REDEFINE GET oGetUnidades VAR nGetUnidades ;
      ID       110 ;
      PICTURE  "99" ;
      OF       oDlg

   REDEFINE GET oGetPrecio VAR nGetPrecio ;
      ID       120 ;
      PICTURE  ( cPinDiv );
      OF       oDlg

   REDEFINE SAY oSayTot ;
      ID       150 ;
      COLOR    "N/W*" ;
      PICTURE  ( cPinDiv );
      FONT     oFont ;
      OF       oDlg

   oGetPrecio:bChange       := {|| pdaCalculartotal( oGetUnidades, oGetPrecio, oSayTot ) }

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuBtnLibre( oDlg, oGetNombre, oGetUnidades, oGetPrecio, oBrwLin, aTmp  ) )

Return nil

//---------------------------------------------------------------------------//

Static function pdaMenuBtnLibre( oDlg, oGetNombre, oGetUnidades, oGetPrecio, oBrwLin, aTmp )

   local oMenu
   /*
   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( GuardarBtnLibre( oDlg, oGetNombre, oGetUnidades, oGetPrecio, oBrwLin, aTmp  ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )
   */
Return oMenu

//---------------------------------------------------------------------------//

Static Function GuardarBtnLibre( oDlg, oGetNombre, oGetUnidades, oGetPrecio, oBrwLin, aTmp )

   local cNombre     := oGetNombre:VarGet()
   local nUnidades   := oGetUnidades:VarGet()
   local nPrecio     := oGetPrecio:VarGet()

   if !Empty( cNombre )

      ( dbfTmpL )->( dbAppend() )
      if !( dbfTmpL )->( NetErr() )
         ( dbfTmpL )->cNomTil := cNombre
         ( dbfTmpL )->nUntTil := nUnidades
         ( dbfTmpL )->nPvpTil := nPrecio
      end if

      lRecTotal( aTmp )

      oBrwLin:Refresh()

      oDlg:End()

   else

      msginfo("No puede almacenar un articulo sin nombre")

   end if

Return nil

//---------------------------------------------------------------------------//

static function pdaCalcularTotal( oGetUnidades, oGetPrecio, oSayTot )

   local nUnidades   := oGetUnidades:VarGet()
   local nPrecio     := oGetPrecio:VarGet()
   local nTotal      := nUnidades * nPrecio

   oSayTot:SetText( nTotal )

Return nil

//---------------------------------------------------------------------------//
/*
   Funcion que guarda la zona de trabajo por defecto
*/
//---------------------------------------------------------------------------//

function pdaZona()

   local oDlg
   local oCbxSalon
   local cCbxSalon   := "1"
   local aCbxSalon   := {}
   local sSala

   for each sSala in oSalaVentas:aSalas
      aAdd( aCbxSalon, sSala:cDescripcion )
   next

   DEFINE DIALOG oDlg RESOURCE "ZONA"

   REDEFINE COMBOBOX oCbxSalon ;
      VAR      cCbxSalon ;
      ID       120 ;
      ITEMS    aCbxSalon ;
      OF       oDlg

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuZona( oDlg, oCbxSalon, aCbxSalon ) )

Return Nil

//---------------------------------------------------------------------------//

function pdaMenuZona( oDlg, oCbxSalon, aCbxSalon )

   local oMenu
   /*
   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( cPdaZona( aCbxSalon[ oCbxSalon:nat ] ), oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )
   */
Return oMenu

//---------------------------------------------------------------------------//

function cPdaZona( cNombre )

   if Empty( cZona )
      cZona    := cNombre
   end if

Return cZona

//---------------------------------------------------------------------------//
/*
Funcion que guarda la sesi�n que tenemos abierta
*/
//---------------------------------------------------------------------------//

Function pdaSesion()

Return Nil

//---------------------------------------------------------------------------//
/*
Esta funcion graba el tiket
*/
//---------------------------------------------------------------------------//

Static Function pdaNewTiket( aTmp, aGet, nMode, lEmpty, lNota, lCobrar )

   local nRec
   local oError
   local oBlock
   local cNumDoc
   local nNumTik           := ""
   local nSave             := SAVPDA      // Por defecto salvamos como ticket

   DEFAULT lEmpty          := .t.
   DEFAULT lNota           := .f.
   DEFAULT lCobrar         := .f.

    /*
   Controles para todo tipo de documentos--------------------------------------
   */

   if ( dbfTmpL )->( LastRec() ) == 0
      MsgStop( "No puede almacenar un documento sin lineas." )
      return .f.
   end if

   if !Empty( aGet[ _CALMTIK ] )

      if Empty( aTmp[ _CALMTIK ] )
         aGet[ _CALMTIK ]:SetFocus()
         MsgInfo( "Almac�n no puede estar vacio" )
         return .f.
      end if

   end if

   /*
   Serie del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CSERTIK ] )
      aTmp[ _CSERTIK ]  := "A"
   end if

   /*
   Turno del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CTURTIK ] )
      aTmp[ _CTURTIK ]  := cCurSesion()
   end if

   /*
   Cajero del ticket------------------------------------------------------------
   */

   if Empty( aTmp[ _CCCJTIK ] )
      aTmp[ _CCCJTIK ]   := ( dbfConfig )->cCodCajero
   end if

   /*
   Caja del ticket------------------------------------------------------------
   */
   if Empty( aTmp[ _CNCJTIK ] )
      aTmp[ _CNCJTIK ]  := ( dbfConfig )->cCodCaja
   end if

   /*
   Almacen del ticket------------------------------------------------------------
   */
   if Empty( aTmp[ _CALMTIK ] )
      aTmp[ _CALMTIK ]  := ( dbfConfig )->cCodAlm
   end if


   /*
   Abrimos las tablas del pc---------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if

   /*
   Control de errores----------------------------------------------------------
   */

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      oDlgTpv:Disable()

      /*
      Archivamos el tipo de venta que se ha realizado--------------------------
      */
      aTmp[ _CTIPTIK   ]      := nSave
      aTmp[ _DFECCRE   ]      := Date()
      aTmp[ _CTIMCRE   ]      := SubStr( Time(), 1, 5 )

      if lEmpty
         aTmp[ _LABIERTO  ]   := .t.
      else
         aTmp[ _LABIERTO  ]   := .f.
      endif

      /*
      Grabamos el tiket--------------------------------------------------------
      */
      do case
         case nMode == APPD_MODE

         /*
         Obtenemos el nuevo numero del Tiket-----------------------------------
         */

         aTmp[ _CNUMTIK ]  := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
         aTmp[ _CSUFTIK ]  := RetSufEmp()
         nNumTik           := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]

         /*
         Fechas y horas de creacon del tiket-----------------------------------
         */

         aTmp[ _CHORTIK ]  := Substr( Time(), 1, 5 )
         aTmp[ _LCLOTIK ]  := .f.

      case nMode == EDIT_MODE

         nNumTik           := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]
         cNumDoc           := aTmp[ _CNUMDOC ]

         /*
         Eliminamos las lineas-------------------------------------------------
         */

         while ( dbfTikL )->( dbSeek( nNumTik ) )
            if dbLock( dbfTikL )
               ( dbfTikL )->( dbDelete() )
               ( dbfTikL )->( dbUnLock() )
            end if
         end while

         if !dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
            MsgStop( "N�mero de ticket " + Rtrim( nNumTik ) + " no encontrado" )
         end if

      end case

      /*
      Guardamos el tipo como tiket---------------------------------------------
      */

      nRec                    := ( dbfTmpL )->( Recno() )
      ( dbfTmpL )->( dbGoTop() )
      while !( dbfTmpL )->( eof() )
         dbPass( dbfTmpL, dbfTikL, .t., aTmp[ _CSERTIK ], aTmp[ _CNUMTIK ], aTmp[ _CSUFTIK ], aTmp[ _CTIPTIK ] )
         ( dbfTmpL )->( dbSkip() )
      end while
      ( dbfTmpL )->( dbGoTo( nRec ) )

      /*
      No quitar----------------------------------------------------------------
      */

      SysRefresh()

      WinGather( aTmp, aGet, dbfTikT, nil, nMode, nil, lEmpty )

      /*
      Escribe los datos pendientes---------------------------------------------
      */

      dbCommitAll()

   /*
   Cerrando el control de errores----------------------------------------------
   */

   RECOVER USING oError

      msgStop( "Error en la grabaci�n del ticket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Cierro las tablas-----------------------------------------------------------
   */

   pdaCerrarTablas()

   /*
   Imprimimos la comanda-------------------------------------------------------
   */

   pdaImpresionComanda( nNumTik, aTmp )

   /*
   Cerrando--------------------------------------------------------------------
   */

   oDlgTpv:Enable()

   /*
   Impresion-------------------------------------------------------------------
   */

   if lNota
      pdaNotaTiket( aTmp, aGet, nMode, nNumTik )
   end if

   if lCobrar
      pdaCobrarTiket( aTmp, aGet, nMode )
   end if

Return .t.

//---------------------------------------------------------------------------//

Static Function PdaNotaTiket( aTmp, aGet, nMode, nNumTik )

   local oBlock
   local oError

   /*
   Control de errores----------------------------------------------------------
   */

   oBlock            := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      oDlgTpv:Disable()

      /*
      Imprimimos la comanda----------------------------------------------------
      */

      pdaImpresionTicket( nNumTik )

      /*
      Cerrando-----------------------------------------------------------------
      */

      oDlgTpv:Enable()

      /*
      Cerrando el control de errores-------------------------------------------
      */

   RECOVER USING oError

      msgStop( "Error al guardar tiket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Cerramos las tablas del pc---------------------------------------------------
   */

Return .t.

//---------------------------------------------------------------------------//

Static Function PdaCobrarTiket( aTmp, aGet, nMode )

   local oDlg
   local oFntTot
   local oFntTit
   local oCbxOrd
   local n
   local oSayTitulo

   /*
   Abrimos las tablas del pc---------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if

   nEntCli           := nTotCobTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikP, dbfDiv )
   oBtnNum           := Array( 16 )
   aButtonsPago      := aCreateButtons( dbfFPago )

   /*
   Cerramos las tablas del pc--------------------------------------------------
   */

   pdaCerrarTablas()

   cNumEnt           := "0"
   oFntTot           := TFont():New( FONT_NAME,  7, 24, .f., .t. )
   oFntTit           := TFont():New( "Verdana",  7, 14, .f., .t. )

   /*
   Control de errores----------------------------------------------------------
   */

  DEFINE DIALOG oDlg RESOURCE "COBRO_TICKET"

   /*
   Sala y mesa del ticket------------------------------------------------------
   */

   REDEFINE SAY oSayVta ;
      PROMPT   cSayVta ;
      ID       140 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   /*
   Btn con las formas de pago--------------------------------------------------
   */

   for n := 1 to len( aButtonsPago )

      REDEFINE BTNBMP aButtonsPago[ n ]:oButton ;
         ID       ( 300 + n ) ;
         OF       oDlg ;
         FILE     ( cImageBtn( aButtonsPago[ n ]:cCode ) ) ;
         NOBORDER ;
         ACTION   ( nil )

         aButtonsPago[ n ]:oButton:SetColor( 0, nRGB( 255, 255, 255 )  )

         aButtonsPago[ n ]:oButton:bAction   := bPdaButtonsPago( aButtonsPago[ n ]:cCode, aButtonsPago[ n ]:cText, aTmp )

   next

   REDEFINE SAY oSayFPago ;
      PROMPT   "Contado" ;
      ID       150 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   /*
   Totales---------------------------------------------------------------------
   */

   REDEFINE SAY oSayTitulo ;
      PROMPT   "Total" ;
      ID       401 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   REDEFINE SAY oSayTitulo ;
      PROMPT   "A Cuenta" ;
      ID       402 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   REDEFINE SAY oSayTitulo ;
      PROMPT   "Entregado" ;
      ID       403 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   REDEFINE SAY oSayTitulo ;
      PROMPT   "Cambio" ;
      ID       404 ;
      COLOR    "N/W*" ;
      FONT     oFntTit ;
      OF       oDlg

   REDEFINE SAY oNumTot ;
      PROMPT   Trans( 0, cPorDiv );
      ID       110 ;
      COLOR    "G+/N" ;
      FONT     oFntTot ;
      OF       oDlg

   REDEFINE SAY oNumEnt ;
      PROMPT   Trans( nEntCli, cPorDiv );
      ID       160 ;
      COLOR    "G+/N" ;
      FONT     oFntTot ;
      OF       oDlg

   REDEFINE SAY oNumEnt ;
      PROMPT   Trans( 0, cPorDiv );
      ID       120 ;
      COLOR    "G+/N" ;
      FONT     oFntTot ;
      OF       oDlg

   REDEFINE SAY oNumCambio ;
      PROMPT   Trans( 0, cPorDiv ) ;
      ID       130 ;
      COLOR    "R+/N" ;
      FONT     oFntTot ;
      OF       oDlg

   /*
   Botones de las unidades-----------------------------------------------------
   */

   REDEFINE BUTTON oBtnNum[ 1 ] ;
      ID       201 ;
      OF       oDlg ;
      ACTION   ( pdaEntregando( "1", aTmp ) ) ;
      PROMPT   "1" ;

   oBtnNum[ 1 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 2 ] ;
      ID       202 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "2", aTmp ) );
      PROMPT   "2" ;

   oBtnNum[ 2 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 3 ] ;
      ID       203 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "3", aTmp ) );
      PROMPT   "3" ;

   oBtnNum[ 3 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 4 ] ;
      ID       204 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "4", aTmp ) );
      PROMPT   "4" ;

   oBtnNum[ 4 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 5 ] ;
      ID       205 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "5", aTmp ) );
      PROMPT   "5" ;

   oBtnNum[ 5 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 6 ] ;
      ID       206 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "6", aTmp ) );
      PROMPT   "6" ;

   oBtnNum[ 6 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 7 ] ;
      ID       207 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "7", aTmp ) );
      PROMPT   "7" ;

   oBtnNum[ 7 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 8 ] ;
      ID       208 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "8", aTmp ) );
      PROMPT   "8" ;

   oBtnNum[ 8 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 9 ] ;
      ID       209 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "9", aTmp ) );
      PROMPT   "9" ;

   oBtnNum[ 9 ]:oFont   := oFntTot

   REDEFINE BUTTON oBtnNum[ 10 ] ;
      ID       210 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "0", aTmp ) );
      PROMPT   "0" ;

   oBtnNum[ 10 ]:oFont  := oFntTot

   /*
   Boton de punto decimail-----------------------------------------------------
   */

   REDEFINE BUTTON oBtnNum[ 11 ] ;
      ID       211 ;
      OF       oDlg ;
      ACTION   ( pdaEntregando( ".", aTmp ) );
      PROMPT   "," ;

   oBtnNum[ 11 ]:oFont  := oFntTot

   /*
   Boton de puesta a cero------------------------------------------------------
   */

   REDEFINE BUTTON oBtnNum[ 12 ] ;
      ID       212 ;
      OF       oDlg;
      ACTION   ( pdaEntregando( "C", aTmp ) );
      PROMPT   "C" ;

   oBtnNum[ 12 ]:oFont  := oFntTot

   oDlg:bStart    := {|| cTitleSalaVenta( oSayVta ), lRecTotal( aTmp ), pdaStarCobro( aButtonsPago ) }

   ACTIVATE DIALOG oDlg ;
      ON INIT ( pdaMenuCobro( aTmp, aGet, nMode, oDlg ) )

Return nil

//---------------------------------------------------------------------------//

Static Function pdaMenuCobro( aTmp, aGet, nMode, oDlg )

   local oMenu
   /*
   DEFINE MENU oMenu ;
      RESOURCE 100 ;
      BITMAPS  10 ; // bitmaps resoruces ID
      IMAGES   3     // number of images in the bitmap

      REDEFINE MENUITEM ID 110 OF oMenu ACTION ( pdaCobro( aTmp, aGet, nMode ), oDlg:End( IDOK ) )

      REDEFINE MENUITEM ID 120 OF oMenu ACTION ( oDlg:End( IDCANCEL ) )

   oDlg:SetMenu( oMenu )
   */
Return oMenu

//---------------------------------------------------------------------------//

Static Function pdaStarCobro( aButtonsPago )

   local oBtn

   for each oBtn in aButtonsPago
      if !Empty( oBtn:oButton )
         oBtn:oButton:Show()
      end if
   next

Return nil

//---------------------------------------------------------------------------//

Static Function pdaImpresionTicket( nNumTik )

   /*
   Abrimos las tablas del pc---------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if

   if dbSeekInOrd( nNumTik, "CNUMTIK", dbfTikT )

      if dbAppe( dbfImp )

         ( dbfImp )->cSerTik          := ( dbfTikT )->cSerTik
         ( dbfImp )->cNumTik          := ( dbfTikT )->cNumTik
         ( dbfImp )->cSufTik          := ( dbfTikT )->cSufTik
         ( dbfImp )->lComanda         := .f.
         ( dbfImp )->lImp             := .f.
         ( dbfImp )->dFectik          := GetSysDate()
         ( dbfImp )->cHorTik          := Substr( Time(), 1, 5 )

         ( dbfImp )->( dbUnLock() )

      end if

   end if

   pdaCerrarTablas()

Return .t.

//---------------------------------------------------------------------------//

Static Function pdaImpresionComanda( nNumTik, aTmp )

   /*
   Abrimos las tablas del pc---------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if

   /*
   Me posiciono en el tiket deseado
   */

   if dbSeekInOrd( nNumTik, "CNUMTIK", dbfTikT )

      if dbAppe( dbfImp )

         ( dbfImp )->cSerTik          := ( dbfTikT )->cSerTik
         ( dbfImp )->cNumTik          := ( dbfTikT )->cNumTik
         ( dbfImp )->cSufTik          := ( dbfTikT )->cSufTik
         ( dbfImp )->dFectik          := GetSysDate()
         ( dbfImp )->cHorTik          := Substr( Time(), 1, 5 )
         ( dbfImp )->lComanda         := .t.
         ( dbfImp )->lImp             := .f.

         ( dbfImp )->( dbUnLock() )

      end if

   end if

   /*
   Cerramos las tablas del pc---------------------------------------------------
   */

   pdaCerrarTablas()

Return .t.

//---------------------------------------------------------------------------//

Static Function pdaCobro( aTmp, aGet, nMode )

   local oBlock
   local oError
   local nTotal
   local nCobro         := Val( cNumEnt )
   local nNumTik        := aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ]

   if Empty( aTmp[ _CFPGTIK ] )
      aTmp[ _CFPGTIK ]  := "00"
   end if

   /*
   Abrimos las tablas con el pc------------------------------------------------
   */

   if !pdaAbrirTablas()
      return .f.
   end if


   if !dbSeekInOrd( nNumTik, "cNumTik", dbfTikT )
      return .f.
   end if

   oBlock               := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

      /*
      Cambiamos el logico de pago--------------------------------------------------
      */

      nTotal            := nTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )

      if nTotal <= Val( cNumEnt ) + nEntCli
         aTmp[ _LPGDTIK  ]          := .t.
         aTmp[ _LABIERTO ]          := .f.
      end if

      aTmp[ _NCOBTIK  ]             := nCobro

      if ( nCobro != 0 )

         if dbAppe( dbfTikP )

            ( dbfTikP )->cTurPgo    := cCurSesion()
            ( dbfTikP )->dPgoTik    := GetSysDate()
            ( dbfTikP )->cTimTik    := SubStr( Time(), 1, 5 )
            ( dbfTikP )->cCodCaj    := oUser():cCaja()
            ( dbfTikP )->cFpgPgo    := aTmp[ _CFPGTIK ]
            ( dbfTikP )->cSerTik    := aTmp[ _CSERTIK ]
            ( dbfTikP )->cNumTik    := aTmp[ _CNUMTIK ]
            ( dbfTikP )->cSufTik    := aTmp[ _CSUFTIK ]
            ( dbfTikP )->nImpTik    := aTmp[ _NCOBTIK ]
            ( dbfTikP )->cDivPgo    := aTmp[ _CDIVTIK ]
            ( dbfTikP )->nVdvPgo    := aTmp[ _NVDVTIK ]
            ( dbfTikP )->nDevTik    := Max( nCambioCli , 0 )

            ( dbfTikP )->( dbUnLock() )

         else

            MsgStop( "No se ha podido a�adir el registro de pago" )

         end if

      end if

      /*
      No quitar----------------------------------------------------------------
      */

      SysRefresh()

      WinGather( aTmp, aGet, dbfTikT, nil, nMode )

      /*
      Escribe los datos pendientes---------------------------------------------
      */

      dbCommitAll()

      /*
      Cerrando el control de errores-------------------------------------------
      */

   RECOVER USING oError

      msgStop( "Error al guardar tiket" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   /*
   Imprimimos el ticket--------------------------------------------------------
   */

   pdaImpresionTicket( nNumTik )

   /*
   Cerramos las tablas del pc--------------------------------------------------
   */

   pdaCerrarTablas()

return .t.

//---------------------------------------------------------------------------//

Static Function ChangeFamilias( oBrwArticulo )

   ( dbfArticulo )->( OrdSetFocus( "CFAMNOM" ) )
   ( dbfArticulo )->( OrdScope( 0, ( dbfFamilia )->cCodFam ) )
   ( dbfArticulo )->( OrdScope( 1, ( dbfFamilia )->cCodFam ) )
   ( dbfArticulo )->( dbGoTop() )

   oBrwArticulo:GoTop()
   oBrwArticulo:Refresh()

RETURN ( nil )

//---------------------------------------------------------------------------//

Static Function LoadFavoritos( oBrwArticulo )

   ( dbfArticulo )->( OrdSetFocus( "nPosTcl" ) )
   ( dbfArticulo )->( dbGoTop() )

   oBrwArticulo:Refresh()

RETURN ( nil )

//---------------------------------------------------------------------------//

Static Function cTitleSalaVenta( oSayVta, oBtnShow )

   if !Empty( oSalaVentas )

      if!Empty( oSayVta )
         oSayVta:SetText( AllTrim( oSalaVentas:cTextoSala() ) + " " + AllTrim( oSalaVentas:cSelectedPunto ) )
      end if

      if !Empty( oBtnShow )
         oBtnShow:cCaption := AllTrim( oSalaVentas:cTextoSala() ) + " " + AllTrim( oSalaVentas:cSelectedPunto )
         oBtnShow:Refresh()
      end if

   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function bpdaButtonsPago( cCode, cText, aTmp )

Return ( {|| aTmp[ _CFPGTIK ] := cCode, oSayFPago:SetText( AllTrim( cText ) ) } )

//---------------------------------------------------------------------------//

Static Function cImageBtn( cCode )

   local cBtnImagen

   do case
      case cCode == "00"
         cBtnImagen  := cPatBmp() + "money2.bmp"
      case cCode == "01"
         cBtnImagen  := cPatBmp() + "cobros_pendientes.bmp"
      case cCode == "02"
         cBtnImagen  := cPatBmp() + "moneybag_24.bmp"
      case cCode == "03"
         cBtnImagen  := cPatBmp() + "percent_24.bmp"
      case cCode == "04"
         cBtnImagen  := cPatBmp() + "shoppingbasket_24.bmp"
   end case

Return cBtnImagen

//---------------------------------------------------------------------------//

Static Function pdaEntregando( nValor, aTmp )

   local nCambio
   local nTotal

   if nValor == "C"
      cNumEnt     := "0"
      nCambio     := 0
   else
      cNumEnt     += nValor

      nTotal      := nTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )

      nCambio     := Val( cNumEnt ) + nEntCli  - nTotal

   end if

   oNumEnt:SetText( Trans( Val( cNumEnt ), cPorDiv ) )
   oNumCambio:SetText( Trans( nCambio, cPorDiv ) )

   nCambioCli     := nCambio

Return nil

//---------------------------------------------------------------------------//

static function EdtPdaL( aTmp, aGet, dbfTmpL, oBrw, aTmpHead, lNegative, nMode )

   DEFAULT lNegative := .f.

   /*
   Metemos los valores de la linea, ya que estamos posicionados
   */

   aTmp[ _CTIPTIL ]     := aTmpHead[ _CTIPTIK ]
   aTmp[ _CALMLIN ]     := aTmpHead[ _CALMTIK ]
   aTmp[ _CCODUSR  ]    := aTmpHead[ _CCCJTIK ]

   aTmp[ _CCBATIL ]     := ( dbfArticulo )->Codigo
   aTmp[ _CNOMTIL ]     := ( dbfArticulo )->Nombre

   if !Empty( ( dbfArticulo )->cDesCmd )
      aTmp[ _CNOMCMD ]  := ( dbfArticulo )->cDesCmd
   else
      aTmp[ _CNOMCMD ]  := ( dbfArticulo )->Nombre
   end if

   aTmp[ _NPVPTIL ]     := nRetPreArt( aTmpHead[ _NTARIFA ], aTmpHead[ _CDIVTIK ], .t., dbfArticulo, dbfDiv, dbfKit, dbfIva )
   if lNegative
      aTmp[ _NUNTTIL ]  := -1
   else
      aTmp[ _NUNTTIL ]  := 1
   end if

   aTmp[ _NUNDKIT ]     := 0
   aTmp[ _NIVATIL ]     := nIva( dbfIva, ( dbfArticulo )->TipoIva )
   aTmp[ _LOFETIL ]     := .f.
   aTmp[ _CCODPR1 ]     := Space( 10 )
   aTmp[ _CCODPR2 ]     := Space( 10 )
   aTmp[ _CVALPR1 ]     := Space( 10 )
   aTmp[ _CVALPR2 ]     := Space( 10 )

   if ( dbfArticulo )->lFacCnv
      aTmp[ _NFACCNV ]  := RetFld( ( dbfArticulo )->cFacCnv, dbfTblCnv, "NFACCNV" )
   end if

   aTmp[ _NCTLSTK ]     := ( dbfArticulo )->nCtlStock
   aTmp[ _NCOSDIV ]     := ( dbfArticulo )->pCosto
   aTmp[ _NNUMLIN ]     := 1     //Tenemos que hacer un autoincremental
   aTmp[ _LKITART ]     := .f.
   aTmp[ _LKITCHG ]     := .f.
   aTmp[ _LKITPRC ]     := .f.
   aTmp[ _LIMPLIN ]     := .f.
   aTmp[ _NMESGRT ]     := ( dbfArticulo )->nMesGrt
   aTmp[ _LCONTROL]     := .f.
   aTmp[ _CCODFAM ]     := ( dbfArticulo )->Familia
   aTmp[ _CGRPFAM ]     := RetFld( ( dbfArticulo )->Familia, dbfFamilia, "CCODGRP" )

   if ( dbfArticulo )->lLote
      aTmp[ _CLOTE ]    := ( dbfArticulo )->cLote
   end if

   aTmp[ _LIMPCOM ]     := .f.

   if ( dbfArticulo )->nImpCom1 == 0
      aTmp[ _NIMPCOM1 ] := ( dbfArticulo )->nImpCom1
   else
      aTmp[ _NIMPCOM1 ] := ( dbfArticulo )->nImpCom1 - 1
   end if

   if ( dbfArticulo )->nImpCom2 == 0
      aTmp[ _NIMPCOM2 ] := ( dbfArticulo )->nImpCom2
   else
      aTmp[ _NIMPCOM2 ] := ( dbfArticulo )->nImpCom2 - 1
   end if

   /*
   Guardamos el registro en la tabla temporal----------------------------------
   */

   WinGather( aTmp, , dbfTmpL, , nMode )

   lRecTotal( aTmpHead )

return nil

//---------------------------------------------------------------------------//

#endif

//---------------------------------------------------------------------------//

#ifndef __PDA__

//---------------------------------------------------------------------------//

Static Function GetSalaVenta( aTmp, aGet, lPuntosLibres )

   local oError
   local oBlock

   // DEFAULT lPuntosLibres   := .f.

   oBlock                  := ErrorBlock( { | oError | Break( oError ) } )
   BEGIN SEQUENCE

   /*
   Guarda la venta actual---------------------------------------------------
   */

   if GuardaVenta( aTmp, aGet )

      /*
      Muestra el boton---------------------------------------------------------
      */

      if oSalaVentas:Sala( oBtnTarifa, lPuntosLibres, dbfTikT )

         do case
            case IsFalse( oSalaVentas:lPuntosVenta )

            /*
            Si el punto seleccionado no esta vacio y es distinto del actual y no existen ventas en ese punto
            */

            if !Empty( oSalaVentas:cSelectedSala ) // .and. ( aTmp[ _CCODSALA ] != oSalaVentas:cSelectedSala )

               aTmp[ _CCODSALA   ]           := oSalaVentas:cSelectedSala
               aTmp[ _NTARIFA    ]           := oSalaVentas:nSelectedPrecio

               if ( dbfTmpL )->( LastRec() ) != 0

                  Recalcula( aTmp )

                  TmpTiket( aTmp, aGet, nSaveMode, .f. )

               end if

            end if

         case IsTrue( oSalaVentas:lPuntosVenta )

            if IsFalse( lPuntosLibres )

               if !Empty( oSalaVentas:cSelected() )

                  if MsgYesNo( "�Desea cambiar la ubicaci�n actual a la sala " + Alltrim( oSalaVentas:cSelectedSala ) + ", " + Alltrim( oSalaVentas:cSelectedPunto ) + " ?" )

                     aTmp[ _CCODSALA   ]        := oSalaVentas:cSelectedSala
                     aTmp[ _CPNTVENTA  ]        := oSalaVentas:cSelectedPunto

                  end if

               end if

            else

               /*
               Si el punto seleccionado no esta vacio y es distinto del actual y no existen ventas en ese punto
               */

               if !Empty( oSalaVentas:cSelected() )

                  if !Empty( oSalaVentas:cSelectedTicket() ) .and. ( dbSeekInOrd( oSalaVentas:cSelectedTicket(), "cNumTik", dbfTikT ) )

                     aScatter( dbfTikT, aTmp )

                     if !BeginTrans( aTmp, aGet, EDIT_MODE, .t. )
                        nSaveMode               := EDIT_MODE
                     end if

                  else

                     aScatter( dbfTikT, aTmp )

                     if !BeginTrans( aTmp, aGet, APPD_MODE, .t. )
                        nSaveMode               := APPD_MODE
                     end if

                  end if

               else

                  aScatter( dbfTikT, aTmp )

                  if !BeginTrans( aTmp, aGet, APPD_MODE, .t. )
                     nSaveMode                  := APPD_MODE
                  end if

               end if

               aTmp[ _CCODSALA   ]              := oSalaVentas:cSelectedSala
               aTmp[ _CPNTVENTA  ]              := oSalaVentas:cSelectedPunto
               aTmp[ _NTARIFA    ]              := oSalaVentas:nSelectedPrecio

            end if

         end case

         /*
         Pintamos los botones--------------------------------------------------------
         */

         oSalaVentas:ConfigButton( oBtnTarifa, oBtnRenombrar )

         /*
         Titulo de la ventana--------------------------------------------------------
         */

         cTitleDialog( aTmp )

         /*
         Recalculamos el total-------------------------------------------------
         */

         lRecTotal( aTmp )

      end if

   end if

   RECOVER USING oError

      msgStop( "Error al montar la salas de venta" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( .t. )

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

Static Function pdaGetSalaVenta( lPuntosLibres )

   DEFAULT lPuntosLibres   := .f.

      if oSalaVentas:Sala( , lPuntosLibres, dbfTikT )

         if IsFalse( oSalaVentas:lPuntosVenta ) .or. Empty( oSalaVentas:cSelected() )

            Return nil

         end if

      else

         Return nil

      end if

Return ( oSalaVentas )

//---------------------------------------------------------------------------//
#endif
//---------------------------------------------------------------------------//

FUNCTION mkTpv( cPath, lAppend, cPathOld, oMeter )

	local dbfTikT
	local dbfTikL
   local dbfTikP
   local dbfTikC
   local dbfImp
   local oldTikT
   local oldTikL
   local oldTikP
   local oldTikC
   local oldImp

   DEFAULT lAppend   := .f.
   DEFAULT cPath     := cPatEmp()

   if oMeter != nil
		oMeter:cText	:= "Generando Bases"
      SysRefresh()
   end if

   if !lExistTable( cPath + "TIKET.DBF" )
      dbCreate( cPath + "TIKET.DBF", aSqlStruct( aItmTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEL.DBF" )
      dbCreate( cPath + "TIKEL.DBF", aSqlStruct( aColTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEP.DBF" )
      dbCreate( cPath + "TIKEP.DBF", aSqlStruct( aPgoTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEC.DBF" )
      dbCreate( cPath + "TIKEC.DBF", aSqlStruct( aPgoCli() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKETIMP.DBF" )
      dbCreate( cPath + "TIKETIMP.DBF", aSqlStruct( aImpTik() ), cDriver() )
   end if

   rxTpv( cPath, oMeter )

   if lAppend .and. lIsDir( cPathOld )

      dbUseArea( .t., cDriver(), cPath + "Tiket.Dbf", cCheckArea( "TIKET",  @dbfTikT ), .f. )
      ( dbfTikT )->( ordListAdd( cPath + "Tiket.Cdx" ) )
      ( dbfTikT )->( ordSetFocus( "cLiqVal" ) )

      dbUseArea( .t., cDriver(), cPath + "Tikel.Dbf", cCheckArea( "TIKETL", @dbfTikL ), .f. )
      ( dbfTikL )->( ordListAdd( cPath + "Tikel.Cdx" ) )

      dbUseArea( .t., cDriver(), cPath + "Tikep.Dbf", cCheckArea( "TIKETP", @dbfTikP ), .f. )
      ( dbfTikP )->( ordListAdd( cPath + "Tikep.Cdx" ) )

      dbUseArea( .t., cDriver(), cPath + "TikeC.Dbf", cCheckArea( "TiketC", @dbfTikC ), .f. )
      ( dbfTikC )->( ordListAdd( cPath + "TikeC.Cdx" ) )

      dbUseArea( .t., cDriver(), cPathOld + "Tiket.Dbf", cCheckArea( "TIKET",  @oldTikT ), .f. )
      ( oldTikT )->( ordListAdd( cPathOld + "Tiket.Cdx" ) )
      ( oldTikT )->( ordSetFocus( "cLiqVal" ) )

      dbUseArea( .t., cDriver(), cPathOld + "TikeL.Dbf", cCheckArea( "TIKETL", @oldTikL ), .f. )
      ( oldTikL )->( ordListAdd( cPathOld + "TikeL.Cdx" ) )

      dbUseArea( .t., cDriver(), cPathOld + "TikeP.Dbf", cCheckArea( "TIKETP", @oldTikP ), .f. )
      ( oldTikP )->( ordListAdd( cPathOld + "TikeP.Cdx" ) )

      dbUseArea( .t., cDriver(), cPathOld + "TikeC.Dbf", cCheckArea( "TiketC", @oldTikC ), .f. )
      ( oldTikC )->( ordListAdd( cPathOld + "TikeC.Cdx" ) )

      dbUseArea( .t., cDriver(), cPathOld + "TiketImp.Dbf", cCheckArea( "TiketImp", @oldImp ), .f. )
      ( oldImp )->( ordListAdd( cPath + "TiketImp.Cdx" ) )

      ( oldTikT )->( dbGoTop() )
      while !( oldTikT )->( eof() )

         dbCopy( oldTikT, dbfTikT, .t. )

         if ( oldTikL )->( dbSeek( ( oldTikT )->cSerTik + ( oldTikT )->cNumTik + ( oldTikT )->cSufTik ) )
            while ( oldTikL )->cSerTil + ( oldTikL )->cNumTil + ( oldTikL )->cSufTil == ( oldTikT )->cSerTik + ( oldTikT )->cNumTik + ( oldTikT )->cSufTik .and. !( oldTikL )->( eof() )
               dbCopy( oldTikL, dbfTikL, .t. )
               ( oldTikL )->( dbSkip() )
            end while
         end if

         if ( oldTikP )->( dbSeek( ( oldTikT )->cSerTik + ( oldTikT )->cNumTik + ( oldTikT )->cSufTik ) )
            while ( oldTikP )->cSerTik + ( oldTikP )->cNumTik + ( oldTikP )->cSufTik == ( oldTikT )->cSerTik + ( oldTikT )->cNumTik + ( oldTikT )->cSufTik .and. !( oldTikP )->( eof() )
               dbCopy( oldTikP, dbfTikP, .t. )
               ( oldTikP )->( dbSkip() )
            end while
         end if

         ( oldTikT )->( dbSkip() )

      end while

      /*
      Pagos de clientes--------------------------------------------------------
      */

      ( oldTikC )->( dbGoTop() )
      while !( oldTikC )->( eof() )
         dbCopy( oldTikC, dbfTikC, .t. )
         ( oldTikC )->( dbSkip() )
      end while

      /*
      Reemplaza la antigua sesion----------------------------------------------
      */

      ( dbfTikT )->( dbEval( {|| ( dbfTikT )->cTurTik := Space( 6 ) },,,,, .f. ) )

      /*
      Cerramos las bases de datos----------------------------------------------
      */

      CLOSE( dbfTikT )
      CLOSE( dbfTikL )
      CLOSE( dbfTikP )
      CLOSE( dbfTikC )
      CLOSE( dbfImp  )

      CLOSE( oldTikT )
      CLOSE( oldTikL )
      CLOSE( oldTikP )
      CLOSE( oldTikC )
      CLOSE( oldImp  )

   end if

Return nil

//--------------------------------------------------------------------------//

FUNCTION rxTpv( cPath, oMeter )

	local dbfTikT
	local dbfTikL
   local dbfTikP
   local dbfTikC
   local dbfImp

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "TIKET.DBF" )
      dbCreate( cPath + "TIKET.DBF", aSqlStruct( aItmTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEL.DBF" )
      dbCreate( cPath + "TIKEL.DBF", aSqlStruct( aColTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEP.DBF" )
      dbCreate( cPath + "TIKEP.DBF", aSqlStruct( aPgoTik() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKEC.DBF" )
      dbCreate( cPath + "TIKEC.DBF", aSqlStruct( aPgoCli() ), cDriver() )
   end if

   if !lExistTable( cPath + "TIKETIMP.DBF" )
      dbCreate( cPath + "TIKETIMP.DBF", aSqlStruct( aImpTik() ), cDriver() )
   end if

   fEraseIndex( cPath + "TikeT.Cdx" )

   fEraseIndex( cPath + "TikeL.Cdx" )

   fEraseIndex( cPath + "TikeP.Cdx" )

   fEraseIndex( cPath + "TikeC.Cdx" )

   fEraseIndex( cPath + "TiketImp.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "TIKET.DBF", cCheckArea( "TIKET", @dbfTikT ), .f. )

   if !( dbfTikT )->( neterr() )
      ( dbfTikT )->( __dbPack() )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CNUMTIK", "CSERTIK + CNUMTIK + CSUFTIK", {|| Field->cSerTik + Field->cNumTik + Field->cSufTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "DFECTIK", "DFECTIK", {|| Field->DFECTIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CCLITIK", "CCLITIK", {|| Field->CCLITIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CNOMTIK", "CNOMTIK", {|| Field->CNOMTIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CNCJTIK", "CCCJTIK", {|| Field->CNCJTIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CCCJTIK", "CCCJTIK", {|| Field->CCCJTIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CRETMAT", "CRETMAT", {|| Field->CRETMAT } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. !Empty( cTurTik )", {||!Deleted() .and. !Empty( Field->cTurTik ) }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CTURTIK", "CTURTIK + CSUFTIK + CNCJTIK", {|| Field->CTURTIK + Field->cSufTik + Field->CNCJTIK } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted() }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CNUMDOC", "CNUMDOC", {|| Field->CNUMDOC } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted() }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "LSNDDOC", "LSNDDOC", {|| Field->LSNDDOC } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted()", {||!Deleted() }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cCodUsr", "cCcjTik + Dtos( dFecCre ) + cTimCre", {|| Field->cCcjTik + Dtos( Field->dFecCre ) + Field->cTimCre } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. cTipTik == '6'", {||!Deleted() .and. Field->cTipTik == '6'}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CDOCVAL", "cValDoc", {|| Field->cValDoc } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. cTipTik == '6'", {||!Deleted() .and. Field->cTipTik == '6'}  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "CNUMVAL", "cSerTik + cNumTik + cSufTik", {|| Field->cSerTik + Field->cNumTik + Field->cSufTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. cTipTik == '6' .and. !lLiqTik", {||!Deleted() .and. Field->cTipTik == '6' .and. !Field->lLiqTik }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cLiqVal", "cSerTik + cNumTik + cSufTik", {|| Field->cSerTik + Field->cNumTik + Field->cSufTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. lLiqTik", {|| !Deleted() .and. Field->lLiqTik }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cTurVal", "cTurVal + cSufTik + cNcjTik", {|| Field->cTurVal + Field->cSufTik + Field->cNcjTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. ( cTipTik == '1' .or. cTipTik == '7' ) .and. !lPgdTik .and. !lCloTik", {|| !Deleted() .and. Field->cTipTik == '1' .and. !Field->lPgdTik .and. !Field->lCloTik } ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cCodSal", "cCodSala + cPntVenta", {|| Field->cCodSala + Field->cPntVenta } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted().and. cTipTik == '6' .and. !lLiqTik", {|| !Deleted() .and. Field->cTipTik == '6' .and. !Field->lLiqTik }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cCliVal", "cCliTik", {|| Field->cCliTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted().and. cTipTik == '6' .and. !lLiqTik", {|| !Deleted() .and. Field->cTipTik == '6' .and. !Field->lLiqTik }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cNomVal", "cNomTik", {|| Field->cNomTik } ) )

      ( dbfTikT )->( ordCondSet( "!Deleted() .and. cTipTik == '6' .and. !lLiqTik", {|| !Deleted() .and. Field->cTipTik == '6' .and. !Field->lLiqTik }  ) )
      ( dbfTikT )->( ordCreate( cPath + "TIKET.CDX", "cTikVal", "cTikVal", {|| Field->cTikVal } ) )

      ( dbfTikT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de tikets" )
   end if

   dbUseArea( .t., cDriver(), cPath + "TIKEL.DBF", cCheckArea( "TIKEL", @dbfTikL ), .f. )

   if !( dbfTikL )->( neterr() )
      ( dbfTikL )->( __dbPack() )

      ( dbfTikL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CNUMTIL", "CSERTIL + CNUMTIL + CSUFTIL", {|| Field->CSERTIL + Field->CNUMTIL + Field->CSUFTIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CCBATIL", "CCBATIL", {|| Field->CCBATIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CCOMTIL", "CCOMTIL", {|| Field->CCOMTIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted() .and. cTipTil != '2' .and. cTipTil != '3'", {||!Deleted() .and. Field->cTipTil != '2' .and. Field->cTipTil != '3' } ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CSTKFAST", "CCBATIL", {|| Field->CCBATIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted() .and. cTipTil != '2' .and. cTipTil != '3'", {||!Deleted() .and. Field->cTipTil != '2' .and. Field->cTipTil != '3' } ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CSTKCOM", "CCOMTIL", {|| Field->CCOMTIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted() .and. cTipTil == '6' ", {||!Deleted()  .and. Field->cTipTil == '6' } ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "cTikVal", "CSERTIL + CNUMTIL + CSUFTIL", {|| Field->CSERTIL + Field->CNUMTIL + Field->CSUFTIL } ) )

      ( dbfTikL )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "nOrTImp", "nOrTImp", {|| Field->nOrTImp } ) )

      ( dbfTikL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikL )->( ordCreate( cPath + "TIKEL.CDX", "CNUMCBA", "CSERTIL + CNUMTIL + CSUFTIL + CCBATIL", {|| Field->CSERTIL + Field->CNUMTIL + Field->CSUFTIL + Field->CCBATIL } ) )

      ( dbfTikL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikL )->( ordCreate( cPath + "TikeL.Cdx", "cNumDev", "cNumDev + Str( nNumLin )", {|| Field->cNumDev + Str( Field->nNumLin ) } ) )

      ( dbfTikL )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de tikets" )
   end if

   dbUseArea( .t., cDriver(), cPath + "TIKEP.DBF", cCheckArea( "TIKEP", @dbfTikP ), .f. )
   if !( dbfTikP )->( neterr() )
      ( dbfTikP )->( __dbPack() )

      ( dbfTikP )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikP )->( ordCreate( cPath + "TIKEP.CDX", "CNUMTIK", "CSERTIK + CNUMTIK + CSUFTIK", {|| Field->cSerTik + Field->cNumTik + Field->cSufTik } ) )

      ( dbfTikP )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikP )->( ordCreate( cPath + "TIKEP.CDX", "DPGOTIK", "DPGOTIK", {|| Field->DPGOTIK } ) )

      ( dbfTikP )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikP )->( ordCreate( cPath + "TIKEP.CDX", "CTURPGO", "cTurPgo + cSufTik + cCodCaj", {|| Field->cTurPgo + Field->cSufTik + Field->cCodCaj } ) )

      ( dbfTikP )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfTikP )->( ordCreate( cPath + "TIKEP.CDX", "cFpgPgo", "cFpgPgo", {|| Field->cFpgPgo } ) )

      ( dbfTikP )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
      ( dbfTikP )->( ordCreate( cPath + "TIKEP.CDX", "NNUMPGO", "Str( nNumPgo ) + cSufPgo", {|| Str( Field->nNumPgo ) + Field->cSufPgo } ) )

      ( dbfTikP )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de tikets" )
   end if

   dbUseArea( .t., cDriver(), cPath + "TIKEC.DBF", cCheckArea( "TIKEC", @dbfTikC ), .f. )
   if !( dbfTikC )->( neterr() )

      ( dbfTikC )->( __dbPack() )

      ( dbfTikC )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
      ( dbfTikC )->( ordCreate( cPath + "TIKEC.CDX", "nNumPgo", "Str( nNumPgo ) + cSufPgo", {|| Str( Field->nNumPgo ) + Field->cSufPgo } ) )

      ( dbfTikC )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
      ( dbfTikC )->( ordCreate( cPath + "TIKEC.CDX", "cCodCli", "cCodCli", {|| Field->cCodCli } ) )

      ( dbfTikC )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de tikets" )
   end if

  dbUseArea( .t., cDriver(), cPath + "TIKETIMP.DBF", cCheckArea( "TIKETIMP", @dbfImp ), .f. )
   if !( dbfImp )->( neterr() )
      ( dbfImp )->( __dbPack() )

      ( dbfImp )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfImp )->( ordCreate( cPath + "TIKETIMP.CDX", "CNUMTIL", "CSERTIK + CNUMTIK + CSUFTIK", {|| Field->CSERTIK + Field->CNUMTIK + Field->CSUFTIK } ) )

      ( dbfImp )->( ordCondSet( "!Deleted() .AND. !LIMP ", {||!Deleted() .AND. !Field->LIMP } ) )
      ( dbfImp )->( ordCreate( cPath + "TIKETIMP.CDX", "CIMPTIK", "CSERTIK + CNUMTIK + CSUFTIK", {|| Field->CSERTIK + Field->CNUMTIK + Field->CSUFTIK } ) )

      ( dbfImp )->( ordCondSet( "!Deleted() .AND. !LIMP .AND. !LCOMANDA", {||!Deleted() .AND. !Field->LIMP .AND. !Field->LCOMANDA } ) )
      ( dbfImp )->( ordCreate( cPath + "TIKETIMP.CDX", "CCOMANDA", "CSERTIK + CNUMTIK + CSUFTIK", {|| Field->CSERTIK + Field->CNUMTIK + Field->CSUFTIK } ) )

      ( dbfImp )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de Impresion" )
   end if

RETURN NIL

//---------------------------------------------------------------------------//

function aPgoTik()

   local aPgoTik  := {}

   aAdd( aPgoTik, { "cSerTik",  "C",      1,     0, "Serie del tiket"            } )
   aAdd( aPgoTik, { "cNumTik",  "C",     10,     0, "N�mero del tiket"           } )
   aAdd( aPgoTik, { "cSufTik",  "C",      2,     0, "Sufijo del tiket"           } )
   aAdd( aPgoTik, { "nNumRec",  "N",      2,     0, "N�mero de orden del pago"   } )
   aAdd( aPgoTik, { "cCodCaj",  "C",      3,     0, "C�digo de caja"             } )
   aAdd( aPgoTik, { "dPgoTik",  "D",      8,     0, "Fecha del pago"             } )
   aAdd( aPgoTik, { "cTimTik",  "C",      5,     0, "Hora del pago"              } )
   aAdd( aPgoTik, { "cFpgPgo",  "C",      2,     0, "Forma de pago del recibo"   } )
   aAdd( aPgoTik, { "nImpTik",  "N",     16,     6, "Importe del pago"           } )
   aAdd( aPgoTik, { "nDevTik",  "N",     16,     6, "Importe de la devoluci�n"   } )
   aAdd( aPgoTik, { "cPgdPor",  "C",     50,     0, "Pagado por"                 } )
   aAdd( aPgoTik, { "cDivPgo",  "C",      3,     0, "Divisa de pago"             } )
   aAdd( aPgoTik, { "nVdvPgo",  "N",     16,     6, "Valor de la divisa"         } )
   aAdd( aPgoTik, { "lConPgo",  "L",      1,     0, "Pago contabilizado (S/N)"   } )
   aAdd( aPgoTik, { "cCtaPgo",  "C",     12,     0, "Cuenta de pago"             } )
   aAdd( aPgoTik, { "lCloPgo",  "L",      1,     0, "Pago cerrado (S/N)"         } )
   aAdd( aPgoTik, { "lSndPgo",  "L",      1,     0, "Enviar documento"           } )
   aAdd( aPgoTik, { "cTurPgo",  "C",      6,     0, "Sesi�n del pago"            } )
   aAdd( aPgoTik, { "cCtaRec",  "C",     12,     0, "Cuenta de contabilidad"     } )
   aAdd( aPgoTik, { "nNumPgo",  "N",      9,     0, "N�mero pago cliente"        } )
   aAdd( aPgoTik, { "cSufPgo",  "C",      2,     0, "Sufijo pago cliente"        } )

RETURN ( aPgoTik )

//---------------------------------------------------------------------------//

function aPgoCli()

   local aPgoCli  := {}

   aAdd( aPgoCli, { "nNumPgo",  "N",      9,     0, "Pago cliente.N�mero"                    } )
   aAdd( aPgoCli, { "cSufPgo",  "C",      2,     0, "Pago cliente.Sufijo"                    } )
   aAdd( aPgoCli, { "cCodCaj",  "C",      3,     0, "Pago cliente.N�mero de caja"            } )
   aAdd( aPgoCli, { "dPgoTik",  "D",      8,     0, "Pago cliente.Fecha del pago"            } )
   aAdd( aPgoCli, { "cFpgPgo",  "C",      2,     0, "Pago cliente.Forma de pago del recibo"  } )
   aAdd( aPgoCli, { "nImpPgo",  "N",     16,     6, "Pago cliente.Importe del pago"          } )
   aAdd( aPgoCli, { "nDevPgo",  "N",     16,     6, "Pago cliente.Importe de la devoluci�n"  } )
   aAdd( aPgoCli, { "nTotPgo",  "N",     16,     6, "Pago cliente.Total importe pago"        } )
   aAdd( aPgoCli, { "cCodCli",  "C",     12,     0, "Pago cliente.C�digo cliente"            } )
   aAdd( aPgoCli, { "cDivPgo",  "C",      3,     0, "Pago cliente.Divisa de pago"            } )
   aAdd( aPgoCli, { "nVdvPgo",  "N",     16,     6, "Pago cliente.Valor de la divisa"        } )
   aAdd( aPgoCli, { "lCloPgo",  "L",      1,     0, "Pago cliente.Pago cerrado (S/N)"        } )
   aAdd( aPgoCli, { "cCtaRec",  "C",     12,     0, "Pago cliente.Cuenta de contabilidad"    } )
   aAdd( aPgoCli, { "cTurPgo",  "C",      6,     0, "Pago cliente.Sesi�n"                    } )

RETURN ( aPgoCli )

//---------------------------------------------------------------------------//

function aItmTik()

   local aItmTik  := {}

   aAdd( aItmTik , { "cSerTik",  "C",      1,     0, "Serie del tiket" }                                       )
   aAdd( aItmTik , { "cNumTik",  "C",     10,     0, "N�mero del tiket" }                                      )
   aAdd( aItmTik , { "cSufTik",  "C",      2,     0, "Sufijo del tiket" }                                      )
   aAdd( aItmTik , { "cTipTik",  "C",      1,     0, "Tipo del documento" }           )
   aAdd( aItmTik , { "cTurTik",  "C",      6,     0, "Sesi�n del tiket" }                                      )
   aAdd( aItmTik , { "dFecTik",  "D",      8,     0, "Fecha del tiket" }                                       )
   aAdd( aItmTik , { "cHorTik",  "C",      5,     0, "Hora del tiket" }                                        )
   aAdd( aItmTik , { "cCcjTik",  "C",      3,     0, "C�digo del cajero" }                                     )
   aAdd( aItmTik , { "cNcjTik",  "C",      3,     0, "C�digo de caja" }                                        )
   aAdd( aItmTik , { "cAlmTik",  "C",      3,     0, "C�digo del almac�n" }                                    )
   aAdd( aItmTik , { "cCliTik",  "C",     12,     0, "C�digo del cliente" }                                    )
   aAdd( aItmTik , { "nTarifa",  "N",      1,     0, "Tarifa de precios" }                                     )
   aAdd( aItmTik , { "cNomTik",  "C",     80,     0, "Nombre del cliente" }                                    )
   aAdd( aItmTik , { "cDirCli",  "C",    100,     0, "Domicilio del cliente" }                                 )
   aAdd( aItmTik , { "cPobCli",  "C",     35,     0, "Poblaci�n del cliente" }                                 )
   aAdd( aItmTik , { "cPrvCli",  "C",     20,     0, "Provincia del cliente" }                                 )
   aAdd( aItmTik , { "nCodProv", "N",      2,     0, "N�mero de provincia cliente" }                           )
   aAdd( aItmTik , { "cPosCli",  "C",     15,     0, "C�digo postal del cliente" }                             )
   aAdd( aItmTik , { "cDniCli",  "C",     15,     0, "DNI/Cif del cliente" }                                   )
   aAdd( aItmTik , { "lModCli",  "L",      1,     0, "L�gico de modificar datos del cliente" }                 )
   aAdd( aItmTik , { "cFpgTik",  "C",      2,     0, "Forma de pago del tiket" }                               )
   aAdd( aItmTik , { "nCobTik",  "N",     16,     6, "Importe cobrado" }                                       )
   aAdd( aItmTik , { "nCamTik",  "N",     16,     6, "Devoluci�n" }                                            )
   aAdd( aItmTik , { "cDivTik",  "C",      3,     0, "C�digo de la divisa" }                                   )
   aAdd( aItmTik , { "nVdvTik",  "N",     10,     3, "Valor de la divisa" }                                    )
   aAdd( aItmTik , { "lCloTik",  "L",      1,     0, "L�gico de cerrado" }                                     )
   aAdd( aItmTik , { "lSndDoc",  "L",      1,     0, "L�gico de enviado" }                                     )
   aAdd( aItmTik , { "lPgdTik",  "L",      1,     0, "L�gico de pagado" }                                      )
   aAdd( aItmTik , { "cRetPor",  "C",    100,     0, "Retirado por" }                                          )
   aAdd( aItmTik , { "cRetMat",  "C",     20,     0, "Matr�cula" }                                             )
   aAdd( aItmTik , { "cNumDoc",  "C",     12,     0, "N�mero del documento" }                                  )
   aAdd( aItmTik , { "cCodAge",  "C",      3,     0, "C�digo del agente" }                                     )
   aAdd( aItmTik , { "cCodRut",  "C",      4,     0, "C�digo de la ruta" }                                     )
   aAdd( aItmTik , { "cCodTar",  "C",      5,     0, "C�digo de la tarifa" }                                   )
   aAdd( aItmTik , { "cCodObr",  "C",     10,     0, "C�digo de la obra" }                                     )
   aAdd( aItmTik , { "nComAge",  "N",      6,     2, "Porcentaje de comisi�n del agente" }                     )
   aAdd( aItmTik , { "lLiqTik",  "L",      1,     0, "Tiket liquidado" }                                       )
   aAdd( aItmTik , { "cCodPro",  "C",      9,     0, "C�digo de proyecto en contabilidad"}                     )
   aAdd( aItmTik , { "lConTik",  "L",      1,     0, "Tiket contabilizado" }                                   )
   aAdd( aItmTik , { "dFecCre",  "D",      8,     0, "Fecha de creaci�n del documento" }                       )
   aAdd( aItmTik , { "cTimCre",  "C",      5,     0, "Hora de creaci�n del documento" }                        )
   aAdd( aItmTik , { "lSelDoc",  "L",      1,     0, "" }                                                      )
   aAdd( aItmTik , { "cValDoc",  "C",     13,     0, "N�mero del vale relacionado" }                           )
   aAdd( aItmTik , { "cTurVal",  "C",      6,     0, "Turno de la liquidaci�n del vale" }                      )
   aAdd( aItmTik , { "lCnvTik",  "L",      1,     0, "L�gico para tiket convertido a factura" }                )
   aAdd( aItmTik , { "cCodDlg",  "C",      2,     0, "C�digo delegaci�n" }                                     )
   aAdd( aItmTik , { "cCodGrp",  "C",      4,     0, "C�digo de grupo de cliente" }                            )
   aAdd( aItmTik , { "cCodSala", "C",      3,     0, "C�digo de sala" }                                        )
   aAdd( aItmTik , { "cPntVenta","C",     30,     0, "Punto de venta" }                                        )
   aAdd( aItmTik , { "lAbierto", "L",      1,     0, "L�gico de ticket abierto" }                              )
   aAdd( aItmTik , { "cAliasTik","C",     80,     0, "Alias del tiket" }                                       )
   aAdd( aItmTik , { "nNumCom",  "N",      2,     0, "N�mero de comensales" }                                  )
   aAdd( aItmTik , { "cAlbTik",  "C",     12,     0, "N�mero del albar�n del que proviene" }                   )
   aAdd( aItmTik , { "cPedTik",  "C",     12,     0, "N�mero del pedido del que proviene " }                   )
   aAdd( aItmTik , { "cPreTik",  "C",     12,     0, "N�mero del presupuesto del que proviene" }               )
   aAdd( aItmTik , { "cDtoEsp",  "C",     50,     0, "Descripci�n de porcentaje de descuento especial" }       )
   aAdd( aItmTik , { "nDtoEsp",  "N",      6,     2, "Porcentaje de descuento especial" }                      )
   aAdd( aItmTik , { "cDpp",     "C",     50,     0, "Descripci�n de porcentaje de descuento por pronto pago" })
   aAdd( aItmTik , { "nDpp",     "N",      6,     2, "Porcentaje de descuento por pronto pago" }               )
   aAdd( aItmTik , { "nPctPrm",  "N",      6,     2, "Porcentaje de promoci�n por fidelizaci�n" }              )
   aAdd( aItmTik , { "cTikVal",  "C",     13,     0, "Numero del tiket de quien se genero el vale" }           )
   aAdd( aItmTik , { "cTlfCli",  "C",     20,     0, "Tel�fono del cliente" }                                  )
   aAdd( aItmTik , { "lFreTik",  "L",      1,     0, "Ticket regalo" }                                         )
   aAdd( aItmTik , { "nTotNet",  "N",     16,     6, "Total neto" }                                            )
   aAdd( aItmTik , { "nTotIva",  "N",     16,     6, "Total iva" }                                             )
   aAdd( aItmTik , { "nTotTik",  "N",     16,     6, "Total ticket" }                                          )

return ( aItmTik )

//---------------------------------------------------------------------------//

function aColTik()

   local aColTik  :={}

   aAdd( aColTik, { "cSerTil",  "C",      1,     0, "Serie del tiket",                    "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cNumTil",  "C",     10,     0, "N�mero del tiket",                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cSufTil",  "C",      2,     0, "Sufijo del tiket",                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cTipTil",  "C",      1,     0, "Tipo de documento",                  "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCbaTil",  "C",     18,     0, "C�digo del barras del producto",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cNomTil",  "C",    250,     0, "Nombre del producto",                "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nPvpTil",  "N",     16,     6, "Precio de venta del producto",       "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nUntTil",  "N",     16,     6, "Unidades vendidas del producto",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nUndKit",  "N",     16,     6, "Unidades productos kit",             "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nIvaTil",  "N",      5,     2, "Porcentaje de IVA del producto",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cFamTil",  "C",      5,     0, "Fam�lia la que pertenece el producto", "",                "", "( cDbfCol )" } )
   aAdd( aColTik, { "lOfeTil",  "L",      1,     0, "Oferta ya aplicada",                 "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cComTil",  "C",     18,     0, "C�digo de barras de combinado",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cNcmTil",  "C",    100,     0, "Nombre del producto combinado",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nPcmTil",  "N",     16,     6, "Precio de venta del producto combinado", "",              "", "( cDbfCol )" } )
   aAdd( aColTik, { "cFcmTil",  "C",      5,     0, "Familia la que pertenece el producto combinado", "",      "", "( cDbfCol )" } )
   aAdd( aColTik, { "lFreTil",  "L",      1,     0, "Lineas sin cargo",                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nDtoLin",  "N",      6,     2, "Descuento en linea",                 "'@E 999.9'",        "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodPr1",  "C",     10,     0, "C�digo de la primera propiedad",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodPr2",  "C",     10,     0, "C�digo de la segunda propiedad",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cValPr1",  "C",     10,     0, "Valor de la primera propiedad",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cValPr2",  "C",     10,     0, "Valor de la segunda propiedad",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nFacCnv",  "N",     16,     6, "Factor de conversi�n",               "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nDtoDiv",  "N",     16,     6, "Descuento lineal de la compra",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lTipAcc",  "L",      1,     0, "",                                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nCtlStk",  "N",      1,     0, "",                                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cAlmLin",  "C",      3,     0, "C�digo de almac�n en l�nea",         "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nValImp",  "N",     16,     6, "Importe del impuesto",               "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodImp",  "C",      3,     0, "C�digo de IVMH",                     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nCosDiv",  "N",     16,     6, "Precio de costo",                    "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nNumLin",  "N",      4,     0, "N�mero de la l�nea",                 "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lKitArt",  "L",      1,     0, "L�nea con escandallo",               "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lKitChl",  "L",      1,     0, "L�nea pertenciente a escandallo",    "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lKitPrc",  "L",      1,     0, "",                                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lImpLin",  "L",      1,     0, "Imprimir l�nea",                     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nMesGrt",  "N",      2,     0, "Meses de garant�a",                  "'99'",              "", "( cDbfCol )" } )
   aAdd( aColTik, { "lControl", "L",      1,     0, "",                                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "mNumSer",  "M",     10,     0, "",                                   "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodFam",  "C",     16,     0, "C�digo de familia",                  "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cGrpFam",  "C",      3,     0, "C�digo del grupo de familia",        "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nLote",    "N",      9,     0, "",                                   "@Z 999999999",      "", "( cDbfCol )" } )
   aAdd( aColTik, { "cLote",    "C",     12,     0, "N�mero de lote",                     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nNumPgo",  "N",      9,     0, "N�mero pago cliente",                "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cSufPgo",  "C",      2,     0, "Sufijo pago cliente",                "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nNumMed",  "N",      1,     0, "N�mero de mediciones",               "MasUnd()",          "", "( cDbfCol )" } )
   aAdd( aColTik, { "nMedUno",  "N",     16,     6, "Primera unidad de medici�n",         "MasUnd()",          "", "( cDbfCol )" } )
   aAdd( aColTik, { "nMedDos",  "N",     16,     6, "Segunda unidad de medici�n",         "MasUnd()",          "", "( cDbfCol )" } )
   aAdd( aColTik, { "nMedTre",  "N",     16,     6, "Tercera unidad de medici�n",         "MasUnd()",          "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodInv",  "C",      2,     0, "C�digo invitaci�n",                  "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nFcmCnv",  "N",     16,     6, "Factor de conversion para convinados","",                 "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodUsr",  "C",      3,     0, "C�digo de usuario",                  "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lImpCom",  "L",      1,     0, "L�gico para comanda impresa",        "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nImpCom1", "N",      1,     0, "Primera impresora comanda",          "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nImpCom2", "N",      1,     0, "Segunda impresora comanda",          "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cComent",  "C",    254,     0, "Comentario para el art�culo",        "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cNomCmd",  "M",     10,     0, "Comentario para la comanda",         "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lInPromo", "L",      1,     0, "L�gico para linea en promoci�n",     "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "lArtServ", "L",      1,     0, "L�gico para art�culo servido",       "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cCodTImp", "C",      3,     0, "Codigo de tipo de comanda",          "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "nOrTImp",  "N",      1,     0, "Orden de impresi�n tipo de comanda", "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cUnidad",  "C",      2,     0, "Unidades de venta",                  "" ,                 "", "( cDbfCol )" } )
   aAdd( aColTik, { "lDev",     "L",      1,     0, "L�gico para art�culo devuelto",      "",                  "", "( cDbfCol )" } )
   aAdd( aColTik, { "cNumDev",  "C",     13,     0, "N�mero de devoluci�n o vale",        "",                  "", "( cDbfCol )" } )

Return ( aColTik )

//---------------------------------------------------------------------------//

function aImpTik()

   local aImpTik  := {}

   aAdd( aImpTik, { "cSerTik",      "C",      1,     0, "Serie del tiket"                        } )
   aAdd( aImpTik, { "cNumTik",      "C",     10,     0, "N�mero del tiket"                       } )
   aAdd( aImpTik, { "cSufTik",      "C",      2,     0, "Sufijo del tiket"                       } )
   aAdd( aImpTik, { "lComanda",     "L",      1,     0, "L�gio de comanda"                       } )
   aAdd( aImpTik, { "lImp",         "L",      1,     0, "L�gico de imprimido"                    } )
   aAdd( aImpTik, { "dFecTik",      "D",      8,     0, "Fecha mandado a impresion"              } )
   aAdd( aImpTik, { "cHorTik",      "C",      5,     0, "Hora mandado a impresion"               } )
   aAdd( aImpTik, { "dFTikImp",     "D",      8,     0, "Fecha de impresion"                     } )
   aAdd( aImpTik, { "cHTikImp",     "C",      5,     0, "Hora de impresion"                      } )

RETURN ( aImpTik )

//---------------------------------------------------------------------------//

#ifndef __PDA__

FUNCTION nTotTik( cNumTik, cTikT, cTikL, cDiv, aTmp, cDivRet, lPic, lExcCnt )

   local bCond
   local nRecLin
   local nDouDiv
   local cCodDiv
   local nVdvDiv
   local cTipTik
   local nOrdAnt
   local nTotLin        := 0
   local nBasLin        := 0
   local nBrtLin        := 0
   local nIvmLin        := 0
   local nNumCom        := 0
   local nDtoEsp        := 0
   local nDpp           := 0
   local nDescuentoEsp  := 0
   local nDescuentoPp   := 0

   DEFAULT cTikT        := dbfTikT
   DEFAULT cTikL        := dbfTikL
   DEFAULT cDiv         := dbfDiv
   DEFAULT cNumTik      := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik
   DEFAULT lPic         := .f.

   public nTotTik       := 0
   public nTotPrm       := 0
   public nTotPax       := 0
   public nTotDtoEsp    := 0
   public nTotDpp       := 0
   public nTotNet       := 0
   public nTotIva       := 0
   public nTotIvm       := 0
   public aBrtTik       := { 0, 0, 0 }
   public aBasTik       := { 0, 0, 0 }
   public aImpTik       := { 0, 0, 0 }
   public aIvaTik       := { nil, nil, nil }
   public aIvmTik       := { 0, 0, 0 }

   nRecLin              := ( cTikL )->( Recno() )

   if aTmp != nil
      cCodDiv           := aTmp[ _CDIVTIK ]
      nVdvDiv           := aTmp[ _NVDVTIK ]
      cTipTik           := aTmp[ _CTIPTIK ]
      nNumCom           := aTmp[ _NNUMCOM ]
      nDtoEsp           := aTmp[ _NDTOESP ]
      nDpp              := aTmp[ _NDPP    ]
      bCond             := {|| !( cTikL )->( eof() ) }
      ( cTikL )->( dbGoTop() )
   else
      cCodDiv           := ( cTikT )->cDivTik
      nVdvDiv           := ( cTikT )->nVdvTik
      cTipTik           := ( cTikT )->cTipTik
      nNumCom           := ( cTikT )->nNumCom
      nDtoEsp           := ( cTikT )->nDtoEsp
      nDpp              := ( cTikT )->nDpp
      bCond             := {|| ( cTikL )->cSerTil + ( cTikL )->cNumTil + ( cTikL )->cSufTil == cNumTik .AND. !( cTikL )->( eof() ) }
      nOrdAnt           := ( cTikL )->( OrdSetFocus( "cNumTil" ) )
      ( cTikL )->( dbSeek( cNumTik ) )
   end if

   nDouDiv              := nDouDiv( cCodDiv, cDiv )
   nDorDiv              := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo
   cPorDiv              := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada

   while Eval( bCond )

      if lValLine( cTikL ) .and. !( cTikL )->lFreTil

         if ( lExcCnt == nil                                .or.;    // Entran todos
            ( lExcCnt .and. ( cTikL )->nCtlStk != 2 )       .or.;    // Articulos sin contadores
            (!lExcCnt .and. ( cTikL )->nCtlStk == 2 ) )              // Articulos con contadores

            nTotLin           := nTotLTpv( cTikL, nDouDiv, nDorDiv )

            if nDtoEsp != 0
               nDescuentoEsp  := ( nTotLin * nDtoEsp ) / 100
            else
               nDescuentoEsp  := 0
            end if

            if nDpp != 0
               nDescuentoPp   := ( nTotLin * nDpp ) / 100
            else
               nDescuentoPp   := 0
            end if

            nBasLin           := nTotLin - nDescuentoEsp - nDescuentoPp
            nIvmLin           := nIvmLTpv( cTikL, nDouDiv, nDorDiv )

            if ( cTikL )->nIvaTil != 0
               nBasLin        := nTotLin / ( 1 + ( ( cTikL )->nIvaTil / 100 ) )
            else
               nBasLin        := nTotLin
            end if

            do case
            case aIvaTik[ 1 ] == nil .or. aIvaTik[ 1 ] == ( cTikL )->nIvaTil

               aIvaTik[ 1 ]   := ( cTikL )->nIvaTil
               aBrtTik[ 1 ]   += nTotLin
               aBasTik[ 1 ]   += nBasLin
               aImpTik[ 1 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 1 ]   += nIvmLin

            case aIvaTik[ 2 ] == nil .or. aIvaTik[ 2 ] == ( cTikL )->nIvaTil

               aIvaTik[ 2 ]   := ( cTikL )->nIvaTil
               aBrtTik[ 2 ]   += nTotLin
               aBasTik[ 2 ]   += nBasLin
               aImpTik[ 2 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 2 ]   += nIvmLin

            case aIvaTik[ 3 ] == nil .or. aIvaTik[ 3 ] == ( cTikL )->nIvaTil

               aIvaTik[ 3 ]   := ( cTikL )->nIvaTil
               aBrtTik[ 3 ]   += nTotLin
               aBasTik[ 3 ]   += nBasLin
               aImpTik[ 3 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 3 ]   += nIvmLin

            end case

            nTotTik           += nTotLin
            nTotDtoEsp        += nDescuentoEsp
            nTotDpp           += nDescuentoPp

            if ( cTikL )->lInPromo
               nTotPrm        += nTotLin - nDescuentoEsp - nDescuentoPp
            end if

         end if

      end if

      ( cTikl )->( dbskip() )

   end while

   nTotBrt         := aBrtTik[ 1 ] + aBrtTik[ 2 ] + aBrtTik[ 3 ]
   nTotNet         := aBasTik[ 1 ] + aBasTik[ 2 ] + aBasTik[ 3 ]
   nTotIva         := aImpTik[ 1 ] + aImpTik[ 2 ] + aImpTik[ 3 ]
   nTotIvm         := aIvmTik[ 1 ] + aIvmTik[ 2 ] + aIvmTik[ 3 ]

   /*
   Quitamos los descuentos al total--------------------------------------------
   */

   nTotTik         -= nTotDtoEsp
   nTotTik         -= nTotDpp

   /*
   Total por persona-----------------------------------------------------------
   */

   nTotPax         := nTotTik / NotCero( nNumCom )

   /*
   Total con redondeo----------------------------------------------------------
   */

   nTotTik         := Round( nTotTik, nDorDiv )

   /*
   Si nos piden q devolvamos el valor en distinta divisa
   */

   /*
   if cDivRet != nil .and. cDivRet != cCodDiv
      nTotNet      := nCnv2Div( nTotNet, cCodDiv, cDivRet, cDiv )
      nTotIva      := nCnv2Div( nTotIva, cCodDiv, cDivRet, cDiv )
      nTotIvm      := nCnv2Div( nTotIvm, cCodDiv, cDivRet, cDiv )
      nTotTik      := nCnv2Div( nTotTik, cCodDiv, cDivRet, cDiv )
      nTotPax      := nCnv2Div( nTotPax, cCodDiv, cDivRet, cDiv )
      cPorDiv      := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
   end if
   */

   /*
   Reposicionamiento-----------------------------------------------------------
   */

   if !Empty( nOrdAnt )
      ( cTikL )->( OrdSetFocus( nOrdAnt ) )
   end if

   ( cTikL )->( dbGoTo( nRecLin ) )

RETURN ( if( lPic, Trans( nTotTik, cPorDiv ), nTotTik ) )

#else

FUNCTION nTotTik( cNumTik, cTikT, cTikL, cDiv, aTmp, cDivRet, lPic, lExcCnt )

   local bCond
   local nRecLin
   local nDouDiv
   local cCodDiv
   local nVdvDiv
   local cTipTik
   local nOrdAnt
   local nTotLin     := 0
   local nBasLin     := 0
   local nIvmLin     := 0
   local nNumCom     := 0

   DEFAULT cTikT     := dbfTikT
   DEFAULT cTikL     := dbfTikL
   DEFAULT cDiv      := dbfDiv
   DEFAULT cNumTik   := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik
   DEFAULT lPic      := .f.

   public nTotTik    := 0
   public nTotPax    := 0
   public nTotNet    := 0
   public nTotIva    := 0
   public nTotIvm    := 0
   public aBasTik    := { 0, 0, 0 }
   public aImpTik    := { 0, 0, 0 }
   public aIvaTik    := { nil, nil, nil }
   public aIvmTik    := { 0, 0, 0 }

   nRecLin           := ( cTikL )->( Recno() )

   if aTmp != nil
      cCodDiv        := aTmp[ _CDIVTIK ]
      nVdvDiv        := aTmp[ _NVDVTIK ]
      cTipTik        := aTmp[ _CTIPTIK ]
      nNumCom        := aTmp[ _NNUMCOM ]
      bCond          := {|| !( cTikL )->( eof() ) }
      ( cTikL )->( dbGoTop() )
   else
      cCodDiv        := ( cTikT )->cDivTik
      nVdvDiv        := ( cTikT )->nVdvTik
      cTipTik        := ( cTikT )->cTipTik
      nNumCom        := ( cTikT )->nNumCom
      bCond          := {|| ( cTikL )->cSerTil + ( cTikL )->cNumTil + ( cTikL )->cSufTil == cNumTik .AND. !( cTikL )->( eof() ) }
      nOrdAnt        := ( cTikL )->( OrdSetFocus( "cNumTil" ) )
      ( cTikL )->( dbSeek( cNumTik ) )
   end if

   nDouDiv           := nDouDiv( cCodDiv, cDiv )
   nDorDiv           := nRouDiv( cCodDiv, cDiv ) // Decimales de redondeo
   cPorDiv           := cPorDiv( cCodDiv, cDiv ) // Picture de la divisa redondeada

   while Eval( bCond )

      if lValLine( cTikL ) .and. !( cTikL )->lFreTil

         if ( lExcCnt == nil                                .or.;    // Entran todos
            ( lExcCnt .and. ( cTikL )->nCtlStk != 2 )       .or.;    // Articulos sin contadores
            (!lExcCnt .and. ( cTikL )->nCtlStk == 2 ) )              // Articulos con contadores

            nTotLin     := nTotLTpv( cTikL, nDouDiv, nDorDiv )
            nIvmLin     := nIvmLTpv( cTikL, nDouDiv, nDorDiv )

            if ( cTikL )->nIvaTil != 0
               nBasLin  := nTotLin / ( 1 + ( ( cTikL )->nIvaTil / 100 ) )
            end if

            do case
            case aIvaTik[ 1 ] == nil .or. aIvaTik[ 1 ] == ( cTikL )->nIvaTil

               aIvaTik[ 1 ]   := ( cTikL )->nIvaTil
               aBasTik[ 1 ]   += nBasLin
               aImpTik[ 1 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 1 ]   += nIvmLin

            case aIvaTik[ 2 ] == nil .or. aIvaTik[ 2 ] == ( cTikL )->nIvaTil

               aIvaTik[ 2 ]   := ( cTikL )->nIvaTil
               aBasTik[ 2 ]   += nBasLin
               aImpTik[ 2 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 2 ]   += nIvmLin

            case aIvaTik[ 3 ] == nil .or. aIvaTik[ 3 ] == ( cTikL )->nIvaTil

               aIvaTik[ 3 ]   := ( cTikL )->nIvaTil
               aBasTik[ 3 ]   += nBasLin
               aImpTik[ 3 ]   += ( nTotLin - nBasLin )
               aIvmTik[ 3 ]   += nIvmLin

            end case

            nTotTik           += nTotLin

         end if

      end if

      ( cTikl )->( dbskip() )

   end while


   nTotNet         := aBasTik[ 1 ] + aBasTik[ 2 ] + aBasTik[ 3 ]
   nTotIva         := aImpTik[ 1 ] + aImpTik[ 2 ] + aImpTik[ 3 ]
   nTotIvm         := aIvmTik[ 1 ] + aIvmTik[ 2 ] + aIvmTik[ 3 ]

   /*
   Total en la moneda de documento---------------------------------------------
   */

   nTotPax         := nTotTik / NotCero( nNumCom )
   nTotTik         := Round( nTotTik, nDorDiv )

   /*
   Si nos piden q devolvamos el valor en distinta divisa
   */

   /*
   if cDivRet != nil .and. cDivRet != cCodDiv
      nTotNet      := nCnv2Div( nTotNet, cCodDiv, cDivRet, cDiv )
      nTotIva      := nCnv2Div( nTotIva, cCodDiv, cDivRet, cDiv )
      nTotIvm      := nCnv2Div( nTotIvm, cCodDiv, cDivRet, cDiv )
      nTotTik      := nCnv2Div( nTotTik, cCodDiv, cDivRet, cDiv )
      nTotPax      := nCnv2Div( nTotPax, cCodDiv, cDivRet, cDiv )
      cPorDiv      := cPorDiv( cDivRet, cDiv ) // Picture de la divisa redondeada
   end if

   /*
   Reposicionamiento-----------------------------------------------------------
   */

   if !Empty( nOrdAnt )
      ( cTikL )->( OrdSetFocus( nOrdAnt ) )
   end if

   ( cTikL )->( dbGoTo( nRecLin ) )

RETURN ( if( lPic, Trans( nTotTik, cPorDiv ), nTotTik ) )

#endif

//---------------------------------------------------------------------------//
/*
Devuelve el precio linea
*/

FUNCTION nIvmLTpv( dbfTmpL, nDec, nRou, nVdv )

   local nCalculo    := 0

   DEFAULT dbfTmpL   := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nRou      := nRouDiv()
   DEFAULT nVdv      := 1

   /*
   Siempre q el ticket no sea gratis
   */

   if !( dbfTmpL )->lFreTil
      nCalculo       := ( dbfTmpL )->nValImp                   // Importe del nuevo impuesto
      nCalculo       *= nTotNTpv( dbfTmpL )                    // Unidades
   end if

   if nVdv != 0
      nCalculo       := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nRou ) )

//--------------------------------------------------------------------------//

/*
Devuelve el precio linea
*/

FUNCTION nTotLTpv( uTmpL, nDec, nRouDec, nVdv )

   local nCalculo := nTotLUno( uTmpL, nDec, nRouDec, nVdv )
   nCalculo       += nTotLDos( uTmpL, nDec, nRouDec, nVdv )

RETURN ( nCalculo )

//---------------------------------------------------------------------------//

Function nTotLDos( uTmpL, nDec, nRouDec, nVdv )

   local nCalculo    := 0

   DEFAULT uTmpL     := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nRouDec   := nRouDiv()
   DEFAULT nVdv      := 0

   /*
   Siempre q el ticket no sea gratis
   */

   do case
   case ValType( uTmpL ) == "C"

      if !( uTmpL )->lFreTil

         nCalculo    := Round( ( uTmpL )->nPcmTil, nDec )    // Precio
         nCalculo    *= nTotNTpv( uTmpL )                    // Unidades

      end if

   otherwise

      if !uTmpL:lFreTil

         nCalculo    := Round( uTmpL:nPcmTil, nDec )    // Precio
         nCalculo    *= nTotNTpv( uTmpL )                    // Unidades

      end if

   end case

   if nVdv != 0
      nCalculo       := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nRouDec ) )

//---------------------------------------------------------------------------//

Function nTotLUno( uTmpL, nDec, nRouDec, nVdv )

   local nCalculo    := 0

   DEFAULT uTmpL     := dbfTikL
   DEFAULT nDec      := nDouDiv()
   DEFAULT nRouDec   := nRouDiv()
   DEFAULT nVdv      := 0

   /*
   Siempre q el ticket no sea gratis
   */

   do case
   case ValType( uTmpL ) == "C"

      if !( uTmpL )->lFreTil

         nCalculo       := Round( ( uTmpL )->nPvpTil, nDec )    // Precio

         if ( uTmpL )->nDtoLin != 0
            nCalculo    -= ( uTmpL )->nDtoLin * nCalculo / 100  // Dto porcentual
         end if

         nCalculo       *= nTotNTpv( uTmpL )                    // Unidades

         nCalculo       -= Round( ( uTmpL )->nDtoDiv, nDec )    // Dto Lineal

      end if

   otherwise

      if !uTmpL:lFreTil

         nCalculo       := Round( uTmpL:nPvpTil, nDec )    // Precio

         if uTmpL:nDtoLin != 0
            nCalculo    -= uTmpL:nDtoLin * nCalculo / 100  // Dto porcentual
         end if

         nCalculo       *= nTotNTpv( uTmpL )                    // Unidades

         nCalculo       -= Round( uTmpL:nDtoDiv, nDec )    // Dto Lineal

      end if

   end case

   if nVdv != 0
      nCalculo          := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nRouDec ) )

//---------------------------------------------------------------------------//
/*
Devuelve las unidades de una linea
*/

FUNCTION nTotNTpv( uTmpL, cMasUnd )

   local nTotNTpv

   DEFAULT uTmpL  := dbfTikL

   do case
   case ValType( uTmpL ) == "A"
      nTotNTpv    := uTmpL[ _NUNTTIL ]
      nTotNTpv    *= NotCero( uTmpL[ _NUNDKIT ] )

   case ValType( uTmpL ) == "C"
      nTotNTpv    := ( uTmpL )->nUntTil
      nTotNTpv    *= NotCero( ( uTmpL )->nUndKit )

   otherwise
      nTotnTpv    := uTmpL:nUntTil
      nTotnTpv    *= NotCero( uTmpL:nUndKit )

   end case

RETURN ( if( cMasUnd != nil, Trans( nTotNTpv, cMasUnd ), nTotNTpv ) )

//---------------------------------------------------------------------------//
/*
Devuelve las unidades de una linea en las comandas
*/

FUNCTION nTotNComandas()

   local nTotNTpv    := 0

   if !Empty( dbfTmpC )
      nTotNTpv       := ( dbfTmpC )->nUntTil
      nTotNTpv       *= NotCero( ( dbfTmpC )->nUndKit )
   else
      nTotNTpv       := ( dbfTikL )->nUntTil
      nTotNTpv       *= NotCero( ( dbfTikL )->nUndKit )
   end if

RETURN ( nTotNTpv )

//----------------------------------------------------------------------------//
/*
Recalcula el total
*/

STATIC FUNCTION lRecTotal( aTmp )

   local nTotal

   nTotal         := nTotTik( aTmp[ _CSERTIK ] + aTmp[ _CNUMTIK ] + aTmp[ _CSUFTIK ], dbfTikT, dbfTmpL, dbfDiv, aTmp, nil, .f. )

#ifndef __PDA__

   if oTotEsp != nil
      oTotEsp:Refresh()
   end if

   if oTotDpp != nil
      oTotDpp:Refresh()
   end if

#endif

   if oNumTot != NIL
      oNumTot:SetText( Trans( nTotal, cPorDiv ) )
   end if

   if oEurTot != NIL
      oEurTot:SetText( Trans( nCnv2Div( nTotal, aTmp[ _CDIVTIK ], cDivChg(), dbfDiv ), cPicEur ) )
   end if

   if oTxtTot != NIL
      oTxtTot:SetText( "Total" )
   end if

   if oTxtCom != nil
      oTxtCom:SetText( "Comensales: " + AllTrim( Str( aTmp[ _NNUMCOM ] ) ) )
   end if

   if oTotCom != nil
      oTotCom:SetText( AllTrim( Trans( nTotal / NotCero( aTmp[ _NNUMCOM ] ), cPorDiv ) ) + " pax." )
   end if

RETURN .T.

//--------------------------------------------------------------------------//
// Devuelve el total de cobrado en un tiket
//

Function nTotCobTik( cNumTik, dbfTikP, dbfDiv, cDivRet, lPic )

   local bCon
   local cPorDiv
   local nDorDiv
   local nTotal      := 0
   local cCodDiv     := ( dbfTikP )->cDivPgo
   local aSta        := aGetStatus( dbfTikP, .t. )

   DEFAULT lPic      := .f.

   if cNumTik == nil
      bCon           := {|| !( dbfTikP )->( eof() ) }
      ( dbfTikP )->( dbGoTop() )
   else
      bCon           := {|| ( dbfTikP )->cSerTik + ( dbfTikP )->cNumTik + ( dbfTikP )->cSufTik == cNumTik .and. !( dbfTikP )->( eof() ) }
      ( dbfTikP )->( dbSeek( cNumTik ) )
   end if

   cPorDiv           := cPorDiv( cCodDiv, dbfDiv ) // Picture de la divisa redondeada
   nDorDiv           := nRouDiv( cCodDiv, dbfDiv ) // Decimales de redondeo

   while Eval( bCon )
      nTotal         += nTotUCobTik( dbfTikP, nDorDiv )
      ( dbfTikP )->( dbSkip() )
   end while

   nTotal            := Round( nTotal, nDorDiv )

   SetStatus( dbfTikP, aSta )

   if cDivRet != nil .and. cCodDiv != cDivRet
      cPorDiv        := cPorDiv( cDivRet, dbfDiv ) // Picture de la divisa redondeada
      nTotal         := nCnv2Div( nTotal, cCodDiv, cDivRet, dbfDiv )
   end if

Return ( if( lPic, Trans( nTotal, cPorDiv ), nTotal ) )

//----------------------------------------------------------------------------//

Function nTotUCobTik( dbfTikP, nDorDiv, nVdv )

   local nTotCob  := 0

   DEFAULT nVdv   := 1

   do case
      case ValType( dbfTikP ) == "C"
         nTotCob  := ( dbfTikP )->nImpTik - ( dbfTikP )->nDevTik
      case ValType( dbfTikP ) == "O"
         nTotCob  := dbfTikP:nImpTik - dbfTikP:nDevTik
   end case

   if nDorDiv != nil
      nTotCob     := Round( nTotCob, nDorDiv )
   end if

   if nVdv != 0
      nTotCob     := nTotCob / nVdv
   end if

Return ( nTotCob )

//----------------------------------------------------------------------------//

Static Function ChangeComentarios( cComentariosT, cComentariosL, oBrwLineasComentarios )

   DEFAULT cComentariosT     := dbfComentariosT
   DEFAULT cComentariosL     := dbfComentariosL

   /*
   Creamos un OrdSCope por arriba y por abajo----------------------------------
	*/

   ( cComentariosL )->( OrdScope( 0, ( cComentariosT )->cCodigo ) )
   ( cComentariosL )->( OrdScope( 1, ( cComentariosT )->cCodigo ) )

   /*
   Refrescos en pantalla-------------------------------------------------------
   */

   obrwLineasComentarios:GoTop()
   obrwLineasComentarios:Refresh( .t. )

return nil

//---------------------------------------------------------------------------//

Static Function ChangeLineasComentarios( oGetComentario, cComentariosL )

   local cText := AllTrim( oGetComentario:VarGet() )

   DEFAULT cComentariosL     := dbfComentariosL

   if Empty( cText )
      cText := AllTrim( ( cComentariosL )->cDescri )
   else
      cText += ", " + AllTrim( ( cComentariosL )->cDescri )
   end if

   oGetComentario:cText( cText )

Return ( nil )

//----------------------------------------------------------------------------//

Static Function EndComentario( oDlg, dbfTmpL, oGetComentario )

   local cText             := oGetComentario:VarGet()

   if dbLock( dbfTmpL )
      ( dbfTmpL )->cComent := AllTrim( cText )
      ( dbfTmpL )->( dbUnLock() )
   end if

   oDlg:End( IDOK )

return ( nil )

//---------------------------------------------------------------------------//

Static Function YearComboBoxChange()

    if oWndBrw:oWndBar:lAllYearComboBox()
      DestroyFastFilter( dbfTikT )
		CreateFastFilter( "", dbfTikT, .f., , , "all" )
	 else
		DestroyFastFilter( dbfTikT )
		CreateFastFilter( "Year( Field->dFecTik ) == " + oWndBrw:oWndBar:cYearComboBox(), dbfTikT, .f., , , "Year( Field->dFecTik ) == " + oWndBrw:oWndBar:cYearComboBox() )
	 end if

	 ( dbfTikT )->( dbGoTop() )

	 oWndBrw:Refresh()

Return nil

//---------------------------------------------------------------------------//

FUNCTION cUpSerie( cSer )

   local nAsc
   local cChr

   if Empty( cSer ) .or. cSer < "A"
      cSer     := "A"
      nAsc     := Asc( cSer )
   else
      nAsc     := Asc( cSer ) + 1
   end if

   cChr        := Chr( nAsc )

   if cChr > "Z"
      cChr     := "Z"
   end if

return cChr

//---------------------------------------------------------------------------//

FUNCTION cDwSerie( cSer )

   local nAsc
   local cChr
   local cSerie

   nAsc        := Asc( cSer ) - 1
   cChr        := Chr( nAsc )

   if cChr < "A"
      cChr     := "A"
   end if

return cChr

//---------------------------------------------------------------------------//

Static Function SetLostFocusOn()

   oDlgDet:Cargo           := .t.

Return ( .t. )

//----------------------------------------------------------------------------//

Static Function SetLostFocusOff()

   oDlgDet:Cargo           := .f.

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function DlgLostFocus( nMode, aTmp )

   if IsLogic( oDlgDet:Cargo ) .and. ( oDlgDet:Cargo )

      if ( nMode != APPD_MODE ) .or. ( Empty( aTmp[ _CCBATIL ] ) .and. Empty( aTmp[ _CNOMTIL ] ) )

         oDlgDet:End()

      end if

   end if

Return ( .t. )

//---------------------------------------------------------------------------//

#ifndef __PDA__

Static Function lFidelity( aGet, aTmp, nMode )

   local oDlg

   if !uFieldEmpresa( "lFidelity" )
      return .f.
   end if

   if nMode != APPD_MODE
      return .f.
   end if

   if !Empty( aTmp[ _CCLITIK ] ) .and. ( aTmp[ _CCLITIK ] != cDefCli() )
      return .f.
   end if

   oDlg  := TDialog():New( , , , , , "Fidelity" )

      TBitmap():ReDefine( 700, "FidelizacionClientes", , oDlg )

      ApoloBtnBmp():Redefine( 500, "Id_Card_32", , , , , {|| oDlg:end( IDOK ), if( !Empty( aGet[ _CCLITIK ] ), aGet[ _CCLITIK ]:SetFocus(), ) }, oDlg, , , .f., .f., "Si. [ F5 ]", ,,, .t., "TOP", .t., , , .f., )

      ApoloBtnBmp():Redefine( 510, "Id_Card_Delete_32", , , , , {|| oDlg:end( IDOK ), appCli( .f. ) }, oDlg, , , .f., .f., "No, pero deseo tenerla. [ F6 ]", ,,, .t., "TOP", .t., , , .f., )

      ApoloBtnBmp():Redefine( IDCANCEL, "Del32", , , , , {|| oDlg:end() }, oDlg, , , .f., .f., "Gracias, en otra ocasi�n. [ ESC ]", ,,, .t., "TOP", .t., , , .f., )

      oDlg:AddFastKey( VK_F5, {|| oDlg:end( IDOK ), aGet[ _CCLITIK ]:SetFocus()} )
      oDlg:AddFastKey( VK_F6, {|| oDlg:end( IDOK ), appCli( .f. ) } )

   oDlg:Activate( , , , .t. )

Return ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function GetVale( oBrwVal, aTmp )

   local oDlg
   local oGet
   local lError   := .f.
   local cGet     := Space( 13 )
   local cCodCli  := aTmp[ _CCLITIK ]
   local nRecAnt  := ( dbfTikT )->( RecNo() )
   local nOrdAnt  := ( dbfTikT )->( OrdSetFocus( "cLiqVal" ) )
   local cTyp     := ( dbfTikT )->( dbOrderInfo( DBOI_KEYTYPE ) )
   local nRec     := ( dbfTmpV )->( RecNo() )

   DEFINE DIALOG oDlg RESOURCE "GetVale"

      REDEFINE GET oGet ;
         VAR      cGet ;
         ID       110 ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       ( IDOK ) ;
         OF       oDlg ;
         ACTION   oDlg:end( IDOK )

   ACTIVATE DIALOG oDlg CENTER

   if oDlg:nResult == IDOK

      if lBigSeek( nil, Upper( cGet ), dbfTikT, cTyp )

         /*
         Comprobamos q no este incluida en la tabla de vales-------------------
         */

         ( dbfTmpV )->( __dbLocate( {|| ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik == ( dbfTmpV )->cSerTik + ( dbfTmpV )->cNumTik + ( dbfTmpV )->cSufTik } ) )

         if !( dbfTmpV )->( Found() )

            if ( dbfTikT )->dFecTik + uFieldEmpresa( "nDiaVale" ) > GetSysDate()
               lError   := .t.
               MsgStop( "El vale introducido no han alcanzado la fecha para su liquidaci�n." )
            end if

            if ( dbfTikT )->cCliTik != cCodCli
               lError   := .t.
               MsgStop( "El vale introducido pertenece a otro cliente." )
            end if

            if !lError

               dbPass( dbfTikT, dbfTmpV, .t. )

               if dbLock( dbfTikT )
                  ( dbfTikT )->lSelDoc := .f.
                  ( dbfTikT )->( dbUnLock() )
               end if

            end if

         else

            MsgStop( "Vale ya incorporado." )

         end if

      else

         MsgStop( "Vale no encontrado." )

      end if

   end if

   /*
   Repos-----------------------------------------------------------------------
   */

   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )
   ( dbfTikT )->( dbGoTo( nRecAnt ) )

   ( dbfTmpV )->( dbGoTo( nRec ) )

   /*
   Refresh---------------------------------------------------------------------
   */

   if oBrwVal != nil
      oBrwVal:Refresh()
   end if

Return .f.

//---------------------------------------------------------------------------//

Function EINFTDIAACTUACIONES()

Return nil

//---------------------------------------------------------------------------//

Static Function AsistenteDevolucionTiket( aTmp, aGet, nMode )

   local o
   local oDlg
   local oBmp
   local dbfTmp
   local oBrwDev
   local oNumero
   local cNumero
   local cNewFil
   local nTotSel

   nTotSel        := 0
   cNewFilL       := cGetNewFileName( cPatTmp() + "TikL" )

   dbCreate( cNewFilL, aSqlStruct( aColTik() ), cLocalDriver() )

   dbUseArea( .t., cLocalDriver(), cNewFilL, cCheckArea( "TikL", @dbfTmp ), .f. )
   if !NetErr()
      ( dbfTmp )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
      ( dbfTmp )->( OrdCreate( cNewFilL, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )
   end if

   DEFINE DIALOG oDlg RESOURCE "ASSVALEDEVOLUCION"

      REDEFINE BITMAP oBmp ;
         ID          500 ;
         RESOURCE    "Cashier_delete_48_alpha" ;
         TRANSPARENT ;
         OF          oDlg

      REDEFINE GET oNumero VAR cNumero ;
         ID          100 ;
         PICTURE     "@!" ;
         BITMAP      "LUPA" ;
         VALID       ( ValidaDevolucionTiket( oNumero, oBrwDev, aTmp, aGet, oDlg, dbfTmp ) ) ;
         ON HELP     ( BrwTikCli( oNumero ) ) ;
         OF          oDlg ;

      /*
		Detalle de Articulos____________________________________________________
		*/

      oBrwDev                    := TXBrowse():New( oDlg )

      oBrwDev:lFooter            := .t.
      oBrwDev:bClrStd            := {|| if( ( dbfTmp )->nUntTil > 0, { CLR_BLACK, GetSysColor( COLOR_WINDOW ) }, { CLR_GRAY, GetSysColor( COLOR_WINDOW ) } ) }
      oBrwDev:bClrSel            := {|| if( ( dbfTmp )->nUntTil > 0, { CLR_BLACK, Rgb( 229, 229, 229 ) }, { CLR_GRAY, Rgb( 229, 229, 229 ) } ) }
      oBrwDev:bClrSelFocus       := {|| if( ( dbfTmp )->nUntTil > 0, { CLR_BLACK, Rgb( 167, 205, 240 ) }, { CLR_GRAY, Rgb( 167, 205, 240 ) } ) }
      oBrwDev:Cargo              := {}
      oBrwDev:nMarqueeStyle      := 5

      oBrwDev:cAlias             := dbfTmp

      with object ( oBrwDev:AddCol() )
         :cHeader                := ""
         :bEditValue             := {|| aScan( oBrwDev:Cargo, Eval( oBrwDev:bBookMark ) ) > 0 }
         :nWidth                 := 20
         :SetCheck( { "Sel16", "Nil16" }, {|| SelectLinea( @nTotSel, dbfTmp, oBrwDev ) } )
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "C�digo"
         :bEditValue             := {|| ( dbfTmp )->cCbaTil }
         :nWidth                 := 60
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Und."
         :bEditValue             := {|| ( dbfTmp )->nUntTil }
         :cEditPicture           := cPicUnd
         :nWidth                 := 40
         :nEditType              := 1
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
         :bOnPostEdit            := {|o,x| if( x <= ( dbfTmp )->nUntTil .and. x > 0, ( dbfTmp )->nUntTil := x, ) }
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Prp. 1"
         :bEditValue             := {|| ( dbfTmp )->cValPr1 }
         :nWidth                 := 35
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Prp. 2"
         :bEditValue             := {|| ( dbfTmp )->cValPr2 }
         :nWidth                 := 35
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Lote"
         :bEditValue             := {|| ( dbfTmp )->cLote }
         :nWidth                 := 40
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Detalle"
         :bEditValue             := {|| Rtrim( ( dbfTmp )->cNomTil ) }
         :nWidth                 := 180
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Total"
         :bEditValue             := {|| Trans( nTotLTpv( dbfTmp, nDouDiv, nDorDiv ), cPorDiv ) }
         :nWidth                 := 80
         :bFooter                := {|| Trans( nTotSel, cPorDiv ) }
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
         :nFootStrAlign          := AL_RIGHT
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "Dto. lineal"
         :bEditValue             := {|| Trans( nDtoUTpv( dbfTmpL, nDouDiv ), cPouDiv ) }
         :nWidth                 := 60
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
      end with

      with object ( oBrwDev:AddCol() )
         :cHeader                := "%Dto"
         :bEditValue             := {|| Trans( ( dbfTmp )->nDtoLin, "@EZ 999.99" ) }
         :nWidth                 := 35
         :nDataStrAlign          := AL_RIGHT
         :nHeadStrAlign          := AL_RIGHT
      end with

      oBrwDev:CreateFromResource( 110 )

      oBrwDev:lHScroll           := .t.
      oBrwDev:lVScroll           := .t.
      oBrwDev:lRecordSelector    := .t.

      REDEFINE BUTTON ;
         ID       120 ;
			OF 		oDlg ;
         ACTION   ( SelectLinea( @nTotSel, dbfTmp, oBrwDev ) )

      /*
      Botones de formas de pago------------------------------------------------
      */

      for each o in ( aButtonsPago )
         o:oButton         := ApoloBtnBmp():Redefine( ( 600 + hb_EnumIndex() ), o:cBigResource, , , , , {|o| FinalizaDevolucionTicket( o, aTmp, aGet, dbfTmp, oNumero, oBrwDev, oDlg ) }, oDlg, , , .f., .f., "Devoluci�n " + Rtrim( o:cText ), , , , .t., "TOP", .t., , , .f. )
         o:oButton:Cargo   := o:cCode
      next

      ApoloBtnBmp():Redefine( IDOK, "Document_delete_32", , , , , {|| FinalizaDevolucionTicket( , aTmp, aGet, dbfTmp, oNumero, oBrwDev, oDlg ) }, oDlg, , , .f., .f., "Emitir vale", , , , .t., "TOP", .t., , , .f. )

      ApoloBtnBmp():Redefine( IDCANCEL, "Del32", , , , , {|| oDlg:end() }, oDlg, , , .f., .f., "Cancelar", , , , .t., "TOP", .t., , , .f. )

      oDlg:bStart          := {|| aEval( aButtonsPago, {|o| if( !Empty( o:oButton:Cargo ), o:oButton:Show(), ) } ) }

   ACTIVATE DIALOG oDlg CENTER

   oBmp:End()

   if !Empty( dbfTmp ) .and. ( dbfTmp )->( Used() )
      ( dbfTmp )->( dbCloseArea() )
   end if

   dbfErase( cNewFil )

   dbfTmp         := nil

Return ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function SelectLinea( nTotSel, dbfTmp, oBrwDev )

   local nScan
   local uBook

   if ( dbfTmp )->nUntTil > 0

      uBook       := Eval( oBrwDev:bBookMark )

      nScan       := aScan( oBrwDev:Cargo, uBook )
      if nScan == 0

         nTotSel  += nTotLTpv( dbfTmp, nDouDiv, nDorDiv )

         aAdd( oBrwDev:Cargo, uBook )

      else

         nTotSel  -= nTotLTpv( dbfTmp, nDouDiv, nDorDiv )

         aDel( oBrwDev:Cargo, nScan, .t. )

      end if

      oBrwDev:Refresh()

   else

      cInformeDevolucionTpv( dbfTmp )

   end if

Return nil

//---------------------------------------------------------------------------//

Static Function ValidaDevolucionTiket( oNumero, oBrwDev, aTmp, aGet, oDlg, dbfTmp )

   local cTyp
   local lErr
   local nRecAnt
   local nOrdAnt
   local nRecLin
   local nOrdLin
   local cNumero

   cNumero        := oNumero:VarGet()

   if Empty( cNumero )
      Return .t.
   end if

   oDlg:Disable()

   lErr           := .f.
   cTyp           := ( dbfTikT )->( dbOrderInfo( DBOI_KEYTYPE ) )
   nRecAnt        := ( dbfTikT )->( RecNo() )
   nOrdAnt        := ( dbfTikT )->( OrdSetFocus( "cNumTik" ) )

   if !lBigSeek( nil, Upper( cNumero ), dbfTikT, cTyp )

      lErr        := .t.

      MsgStop( "N�mero del tiket no encontrado" )

   else

      if ( dbfTikT )->cTipTik != "1"

         lErr     := .t.

         MsgStop( "Esta selecci�n no es un ticket" )

      else

         /*
         Los datos del cliente lo asignamos---------------------------------------
         */

         aTmp[ _CCLITIK ]     := ( dbfTikT )->cCliTik
         aTmp[ _CNOMTIK ]     := ( dbfTikT )->cNomTik
         aTmp[ _CDNICLI ]     := ( dbfTikT )->cDniCli
         aTmp[ _CDIRCLI ]     := ( dbfTikT )->cDirCli
         aTmp[ _CPOBCLI ]     := ( dbfTikT )->cPobCli
         aTmp[ _CPRVCLI ]     := ( dbfTikT )->cPrvCli
         aTmp[ _CPOSCLI ]     := ( dbfTikT )->cPosCli

         /*
         Vamos a comprobar q tenga lineas, si es asi tenemos q ver si el codigo del articulo esta en el tiket
         */

         if ( dbfTikL )->( dbSeek( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik ) )

            while ( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil == ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik .and. !( dbfTikL )->( eof() ) )

               dbPass( dbfTikL, dbfTmp, .t. )

               /*
               Unidades q ya hemos devuelto------------------------------------
               */

               ( dbfTmp )->nUntTil  -= nDevNTpv( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikL )

               /*
               Guardamos la referencia al ticket del q venimos-----------------
               */

               ( dbfTmp )->cNumDev  := ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik

               /*
               Saltamos al siguiente registro----------------------------------
               */

               ( dbfTikL )->( dbSkip() )

            end while

         end if

         if !Empty( oBrwDev )
            oBrwDev:Refresh()
            oBrwDev:GoTop()
         end if

      end if

   end if

   ( dbfTikT )->( OrdScope( 0, nil ) )
   ( dbfTikT )->( OrdScope( 1, nil ) )
   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )
   ( dbfTikT )->( dbGoTo( nRecAnt ) )

   oDlg:Enable()

   if !lErr
      oNumero:Disable()
   end if

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function FinalizaDevolucionTicket( oBtn, aTmp, aGet, dbfTmp, oNumero, oBrwDev, oDlg )

   local nRec
   local nOrd
   local aTotalTicket
   local nTotalTicket
   local cSerieTicket
   local nNumeroTicket
   local cSufijoTicket
   local cNumeroTicket

   if len( oBrwDev:Cargo ) == 0

      MsgStop( "Debe seleccionar al menos una l�nea" )

   else

      CursorWait()

      cNumeroTicket        := oNumero:VarGet()
      nTotalTicket         := 0
      cSerieTicket         := "A"
      nNumeroTicket        := Str( nNewDoc( aTmp[ _CSERTIK ], dbfTikT, "nTikCli", 10, dbfCount ), 10 )
      cSufijoTicket        := RetSufEmp()

      /*
      Valores por defecto------------------------------------------------------
      */

      aTmp[ _CDIVTIK ]     := cDivEmp()
      aTmp[ _NVDVTIK ]     := nValDiv( cDivEmp(), dbfDiv )
      aTmp[ _CTURTIK ]     := cCurSesion()
      aTmp[ _CCCJTIK ]     := cCurUsr()
      aTmp[ _CNCJTIK ]     := oUser():cCaja()
      aTmp[ _NTARIFA ]     := Max( uFieldEmpresa( "nPreVta" ), 1 )
      aTmp[ _DFECCRE ]     := Date()
      aTmp[ _CTIMCRE ]     := SubStr( Time(), 1, 5 )
      aTmp[ _CHORTIK ]     := Substr( Time(), 1, 5 )
      aTmp[ _LABIERTO]     := .f.
      aTmp[ _LCLOTIK ]     := .f.
      aTmp[ _LPGDTIK ]     := .t.

      /*
      Archivamos el tipo de venta que se ha realizado--------------------------
      */

      if !Empty( oBtn )
         aTmp[ _CTIPTIK ]  := SAVDEV
      else
         aTmp[ _CTIPTIK ]  := SAVVAL
      end if

      /*
      Obtenemos el nuevo numero del Tiket--------------------------------------
      */

      aTmp[ _CSERTIK ]     := cSerieTicket
      aTmp[ _CNUMTIK ]     := nNumeroTicket
      aTmp[ _CSUFTIK ]     := cSufijoTicket

      /*
      A�ade las l�neas seleccionadas-------------------------------------------
      */

      for each nRec in ( oBrwDev:Cargo )

         ( dbfTmp )->( dbGoTo( nRec ) )

         dbPass( dbfTmp, dbfTikL, .t., cSerieTicket, nNumeroTicket, cSufijoTicket )

         nTotalTicket      += nTotLTpv( dbfTmp, nDouDiv, nDorDiv )

      next

      /*
      Salvamos a disco el array de las cabeceras-------------------------------
      */

      WinGather( aTmp, nil, dbfTikT, nil, APPD_MODE, nil, .f. )

      /*
      Pagos del ticket---------------------------------------------------------
      */

      if !Empty( oBtn ) .and. dbAppe( dbfTikP )
         ( dbfTikP )->cSerTik    := cSerieTicket
         ( dbfTikP )->cNumTik    := nNumeroTicket
         ( dbfTikP )->cSufTik    := cSufijoTicket
         ( dbfTikP )->nImpTik    := nTotalTicket
         ( dbfTikP )->cTurPgo    := cCurSesion()
         ( dbfTikP )->dPgoTik    := GetSysDate()
         ( dbfTikP )->cTimTik    := SubStr( Time(), 1, 5 )
         ( dbfTikP )->cCodCaj    := oUser():cCaja()
         ( dbfTikP )->cFpgPgo    := oBtn:Cargo
         ( dbfTikP )->cDivPgo    := cDivEmp()
         ( dbfTikP )->nVdvPgo    := nValDiv( cDivEmp(), dbfDiv )
      end if

      /*
      Resto el total de vale cuando realizo una devoluci�n---------------------
      */

      nRec                       := ( dbfTikT )->( RecNo() )
      nOrd                       := ( dbfTikT )->( OrdSetFocus( "cTikVal" ) )

      if ( dbfTikT )->( dbSeek( cNumeroTicket ) )
         if dbLock( dbfTikT )
            ( dbfTikT )->lLiqTik := .t.
            ( dbfTikT )->( dbUnLock() )
         endif
      end if

      /*
      Calculamos el total del vale o devolucion--------------------------------
      */

      nOrd                       := ( dbfTikT )->( OrdSetFocus( "cNumTik" ) )

      if ( dbfTikT )->( dbSeek( cSerieTicket + nNumeroTicket + cSufijoTicket ) )

         aTotalTicket            := aTotTik( cSerieTicket + nNumeroTicket + cSufijoTicket, dbfTikT, dbfTikL, dbfDiv, nil, nil, .f. )

         if dbLock( dbfTikT )

            ( dbfTikT )->nTotNet := aTotalTicket[ 1 ]
            ( dbfTikT )->nTotIva := aTotalTicket[ 2 ]
            ( dbfTikT )->nTotTik := aTotalTicket[ 3 ]

            ( dbfTikT )->( dbUnLock() )

         endif

      end if

      ( dbfTikT )->( OrdSetFocus( nOrd ) )
      ( dbfTikT )->( dbGoTo( nRec ) )

      /*
      Abrir la caja -----------------------------------------------------------
      */

      oUser():OpenCajon()

      /*
      Imprimir el registro-----------------------------------------------------
      */

      ImpTiket( .f. )

      /*
      Recuperamos el cursor y cerramos la ventana------------------------------
      */

      CursorWE()

      oDlg:End( IDOK )

   end if

Return ( .t. )

//---------------------------------------------------------------------------//

Static Function nDevNTpv( cNumero, dbfTikL )

   local nRec
   local nOrd
   local nDev
   local cNum

   nDev           := 0
   nRec           := ( dbfTikL )->( Recno() )
   nOrd           := ( dbfTikL )->( OrdSetFocus( "cNumDev" ) )
   cNum           := Str( ( dbfTikL )->nNumLin )

   if ( dbfTikL )->( dbSeek( cNumero + cNum ) )
      while ( dbfTikL )->cNumDev == cNumero .and. Str( ( dbfTikL )->nNumLin ) == cNum .and. !( dbfTikL )->( eof() )
         nDev     += nTotNTpv( dbfTikL )
         ( dbfTikL )->( dbSkip() )
      end while
   end if

   ( dbfTikL )->( dbGoto( nRec ) )
   ( dbfTikL )->( OrdSetFocus( nOrd ) )

Return ( nDev )

//---------------------------------------------------------------------------//

Static Function cInformeDevolucionTpv( dbfTmp )

   local cNum
   local nRec
   local nOrd
   local aInf
   local oBrw
   local oDlg
   local oBmp

   if Empty( ( dbfTmp )->cSerTil )
      Return ( nil )
   end if

   cNum           := ""
   nRec           := ( dbfTikL )->( Recno() )
   nOrd           := ( dbfTikL )->( OrdSetFocus( "cNumDev" ) )
   aInf           := {}

   if ( dbfTikL )->( dbSeek( ( dbfTmp )->cSerTil + ( dbfTmp )->cNumTil + ( dbfTmp )->cSufTil + Str( ( dbfTmp )->nNumLin ) ) )
      aAdd( aInf, { "N�mero",       ( dbfTikL )->cSerTil + "/" + Alltrim( ( dbfTikL )->cNumTil ) + "/" + Alltrim( ( dbfTikL )->cSufTil ) } )
      aAdd( aInf, { "Fecha",        Dtoc( RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,   "dFecTik" ) ) } )
      aAdd( aInf, { "Hora",         RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cHorTik" ) } )
      aAdd( aInf, { "Usuario",      RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cCcjTik" ) } )
      aAdd( aInf, { "Caja",         RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cNcjTik" ) } )
      aAdd( aInf, { "Almacen",      RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cAlmTik" ) } )
      aAdd( aInf, { "Sesi�n",       Alltrim( RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,"cTurTik" ) ) } )
      aAdd( aInf, { "Cliente",      RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cNomTik" ) } )
      aAdd( aInf, { "Direcci�n",    RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cDirCli" ) } )
      aAdd( aInf, { "Cod. postal",  RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cPosCli" ) } )
      aAdd( aInf, { "Poblaci�n",    RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cPobCli" ) } )
      aAdd( aInf, { "Provincia",    RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cPrvCli" ) } )
      aAdd( aInf, { "Tel�fono",     RetFld( ( dbfTikL )->cSerTil + ( dbfTikL )->cNumTil + ( dbfTikL )->cSufTil, dbfTikT,         "cTlfCli" ) } )
      aAdd( aInf, { "Unidades",     AllTrim( nTotNTpv( dbfTikL, cPicUnd ) ) } )
      aAdd( aInf, { "Importe",      AllTrim( Trans( nTotLTpv( dbfTikL, nDouDiv, nDorDiv ), cPorDiv ) ) } )
   end if

   ( dbfTikL )->( dbGoto( nRec ) )
   ( dbfTikL )->( OrdSetFocus( nOrd ) )

   if !Empty( aInf )

      DEFINE DIALOG oDlg RESOURCE "TICKETINFO"

      REDEFINE BITMAP oBmp ;
         ID          500 ;
         RESOURCE    "Cashier_delete_48_alpha" ;
         TRANSPARENT ;
         OF          oDlg

      oBrw                       := TXBrowse():New( oDlg )

      oBrw:bClrSel               := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus          := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:SetArray( aInf, , , .f. )

      oBrw:nMarqueeStyle         := 5
      oBrw:lRecordSelector       := .f.
      oBrw:lHScroll              := .f.

      oBrw:CreateFromResource( 100 )

      with object ( oBrw:AddCol() )
         :cHeader                := "Info"
         :bStrData               := {|| aInf[ oBrw:nArrayAt, 1 ] }
         :nWidth                 := 80
      end with

      with object ( oBrw:AddCol() )
         :cHeader                := "Valor"
         :bStrData               := {|| aInf[ oBrw:nArrayAt, 2 ] }
         :nWidth                 := 300
      end with

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:End() )

      ACTIVATE DIALOG oDlg CENTER

      oBmp:End()

   else

      MsgStop( "No se ha podido recopilar informaci�n." )

   end if

Return ( nil )

//---------------------------------------------------------------------------//


Static Function dFecMaxVale( cNumTik, cTikT  )

   local dFecMaxVale    := Ctod( "" )
   local nRec
   local nOrdAnt

   DEFAULT cTikT        := dbfTikT

   /*
   Guardamos los la posici�n y el orden de la tabla----------------------------
   */

   nRec                 := ( cTikT )->( Recno() )
   nOrdAnt              := ( cTikT )->( OrdSetFocus( "CDOCVAL" ) )

   if ( cTikT )->( dbSeek( cNumTik ) )

      while ( cTikT )->cValDoc == cNumTik .and. !( cTikT )->( Eof() )

         if ( cTikT )->dFecTik > dFecMaxVale
            dFecMaxVale := ( cTikT )->dFecTik
         end if

      ( cTikT )->( dbSkip() )

      end while

   end if

   /*
   Dejamos la tabla en la posicion que nos la encontramos----------------------
   */

   ( cTikT )->( OrdSetFocus( nOrdAnt ) )
   ( cTikT )->( dbGoTo( nRec ) )

   if Empty( DtoC( dFecMaxVale ) )
      dFecMaxVale       := Date()
   end if


return ( dFecMaxVale )

//---------------------------------------------------------------------------//

Static Function BrwTikCli( oGet )

   local oDlg
	local oBrw
   local oGet1
	local cGet1
   local nOrd           := GetBrwOpt( "BrwTikCli" )
   local oCbxOrd
   local cCbxOrd
   local aCbxOrd        := { "N�mero", "Fecha", "C�digo cliente", "Nombre cliente" }
   local nRecAnt        := ( dbfTikT )->( RecNo() )
   local nOrdAnt        := ( dbfTikT )->( OrdSetFocus( "cNumTik" ) )
   local cText          := ""

   nOrd                 := Min( Max( nOrd, 1 ), len( aCbxOrd ) )
   cCbxOrd              := aCbxOrd[ nOrd ]

   nOrd                 := ( dbfTikT )->( OrdSetFocus( nOrd ) )

   /*
   Posicinamiento--------------------------------------------------------------
   */

   ( dbfTikT )->( dbGoTop() )


   DEFINE DIALOG oDlg RESOURCE "HelpEntry" TITLE 'Seleccionar tickets'

      REDEFINE GET oGet1 VAR cGet1;
			ID 		104 ;
         ON CHANGE AutoSeek( nKey, nFlags, Self, oBrw, dbfTikT );
			OF 		oDlg

		REDEFINE COMBOBOX oCbxOrd ;
			VAR 		cCbxOrd ;
			ID 		102 ;
         ITEMS    aCbxOrd ;
         ON CHANGE( ( dbfTikT )->( OrdSetFocus( oCbxOrd:nAt ) ), oBrw:Refresh(), oGet1:SetFocus() );
         OF       oDlg

      oBrw                    := IXBrowse():New( oDlg )

      oBrw:bClrSel            := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrw:bClrSelFocus       := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrw:cAlias             := dbfTikT
      oBrw:cName              := "Ticket cliente"
      oBrw:bLDblClick         := {|| oDlg:End( IDOK ) }

      oBrw:nMarqueeStyle      := 5

      with object ( oBrw:AddCol() )
         :cHeader             := "N�mero"
         :cSortOrder          := "cNumTik"
         :bEditValue          := {|| ( dbfTikT )->cSerTik + "/" + AllTrim( ( dbfTikT )->cNumTik ) + "/" + ( dbfTikT )->cSufTik }
         :nWidth              := 70
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Fecha"
         :cSortOrder          := "dFecTik"
         :bEditValue          := {|| Dtoc( ( dbfTikT )->dFecTik ) }
         :nWidth              := 70
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "C�digo cliente"
         :bEditValue          := {|| Rtrim( ( dbfTikT )->cCliTik ) }
         :cSortOrder          := "cCliTik"
         :nWidth              := 75
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Nombre cliente"
         :bEditValue          := {|| AllTrim( ( dbfTikT )->cNomTik ) }
         :cSortOrder          := "cNomTik"
         :nWidth              := 150
         :bLClickHeader       := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Importe "
         :bEditValue          := {|| nTotalizer( ( dbfTikT)->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik, dbfTikT, dbfTikL, dbfTikP, dbfAlbCliT, dbfAlbCliL, dbfFacCliT, dbfFacCliL, dbfFacCliP, dbfIva, dbfDiv, cDivEmp(), .t. ) }
         :nWidth              := 85
         :nDataStrAlign       := 1
         :nHeadStrAlign       := 1
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Div."
         :bEditValue          := {|| cSimDiv( ( dbfTikT )->cDivTik, dbfDiv ) }
         :nWidth              := 30
         :nDataStrAlign       := 1
         :nHeadStrAlign       := 1
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Sesi�n"
         :bEditValue          := {|| ( dbfTikT )->cTurTik + "/" + ( dbfTikT )->cSufTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Hora"
         :bEditValue          := {|| ( dbfTikT )->cHorTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Caja"
         :bEditValue          := {|| ( dbfTikT )->cNcjTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Cajero"
         :bEditValue          := {|| ( dbfTikT )->cCcjTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      with object ( oBrw:AddCol() )
         :cHeader             := "Almac�n"
         :bEditValue          := {|| ( dbfTikT )->cAlmTik }
         :nWidth              := 80
         :lHide               := .t.
      end with

      oBrw:CreateFromResource( 105 )

		REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:end( IDOK ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

   oDlg:bStart                := {|| oBrw:Load() }

   oDlg:AddFastKey( VK_F5,    {|| oDlg:end( IDOK ) } )
   oDlg:AddFastKey( VK_RETURN,{|| oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   /*
   Guardamos los vales en el array---------------------------------------------
   */

   if oDlg:nResult == IDOK

      if !Empty( oGet )
         oGet:cText( ( dbfTikT )->cSerTik + ( dbfTikT )->cNumTik + ( dbfTikT )->cSufTik )
      end if

   end if

   SetBrwOpt( "BrwTikCli", ( dbfTikT )->( OrdNumber() ) )

   ( dbfTikT )->( OrdSetFocus( nOrd ) )

   CursorWE()

   oGet:SetFocus()

   /*
   Repos-----------------------------------------------------------------------
   */

   ( dbfTikT )->( OrdSetFocus( nOrdAnt ) )
   ( dbfTikT )->( dbGoTo( nRecAnt ) )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Function nTotalEntregado( cNumDoc, cTikT, cAlbCliP, cDiv )

   DEFAULT cTikT     := dbfTikT
   DEFAULT cDiv      := dbfDiv
   DEFAULT cAlbCliP  := dbfAlbCliP
   DEFAULT cNumDoc   := ( cTikT )->cNumDoc

Return nPagAlbCli( cNumDoc, cAlbCliP, cDiv )

#endif

//---------------------------------------------------------------------------//

Function ArticuloServido( oBrwLin, dbfTmpL )

   if ( dbfTmpL )->lArtServ

      ( dbfTmpL )->lArtServ := .f.
   else

      ( dbfTmpL )->lArtServ := .t.

   end if

   oBrwLin:Refresh()

Return nil

//---------------------------------------------------------------------------//

#ifndef __PDA__

CLASS TDatosImpresion

   DATA  cCodCaj
   DATA  oFmtTik
   DATA  cFmtTik
   DATA  oSayFmtTik
   DATA  cSayFmtTik
   DATA  oPrinterTik
   DATA  cPrinterTik

   DATA  oFmtVal
   DATA  cFmtVal
   DATA  oSayFmtVal
   DATA  cSayFmtVal
   DATA  oPrinterVal
   DATA  cPrinterVal

   DATA  oFmtAlb
   DATA  cFmtAlb
   DATA  oSayFmtAlb
   DATA  cSayFmtAlb
   DATA  oPrinterAlb
   DATA  cPrinterAlb

   DATA  oFmtFac
   DATA  cFmtFac
   DATA  oSayFmtFac
   DATA  cSayFmtFac
   DATA  oPrinterFac
   DATA  cPrinterFac

   DATA  cFmtTikReg
   DATA  cPrinterTikReg

   DATA  cFmtTikChk
   DATA  cPrinterTikChk

   DATA  cFmtTikEnt
   DATA  cPrinterTikEnt

   DATA  cFmtTikDev
   DATA  cPrinterDev

   DATA  cFmtAlbCaj
   DATA  cPrinterAlbCaj

   DATA  cFmtFacCaj
   DATA  cPrinterFacCaj

   DATA  cFmtEntCaj
   DATA  cPrinterEntCaj

   DATA  cFmtApt
   DATA  cPrinterApt

   METHOD Load( dbfCajT )

END CLASS

//---------------------------------------------------------------------------//

METHOD Load( dbfCajT )

   ::cCodCaj         := oUser():cCaja()

   ::cFmtTik         := cFormatoTicketEnCaja(   ::cCodCaj, dbfCajT )
   ::cFmtVal         := cFormatoValeEnCaja(     ::cCodCaj, dbfCajT )
   ::cFmtAlb         := cFormatoAlbaranEnCaja(  ::cCodCaj, dbfCajT )
   ::cFmtFac         := cFormatoFacturaEnCaja(  ::cCodCaj, dbfCajT )

   ::cSayFmtTik      := cNombreDoc( ::cFmtTik )
   ::cSayFmtVal      := cNombreDoc( ::cFmtVal )
   ::cSayFmtAlb      := cNombreDoc( ::cFmtAlb )
   ::cSayFmtFac      := cNombreDoc( ::cFmtFac )

   ::cPrinterTik     := cPrinterTiket(    ::cCodCaj, dbfCajT )
   ::cPrinterVal     := cPrinterVale(     ::cCodCaj, dbfCajT )
   ::cPrinterAlb     := cPrinterAlbaran(  ::cCodCaj, dbfCajT )
   ::cPrinterFac     := cPrinterFactura(  ::cCodCaj, dbfCajT )

   ::cFmtTikReg      := cFormatoTicketRegaloEnCaja(   ::cCodCaj, dbfCajT )
   ::cPrinterTikReg  := cPrinterRegalo(               ::cCodCaj, dbfCajT )

   ::cFmtTikChk      := cFormatoChequeRegaloEnCaja(   ::cCodCaj, dbfCajT )
   ::cPrinterTikChk  := cPrinterChequeRegalo(         ::cCodCaj, dbfCajT )

   ::cFmtTikEnt      := cFormatoEntregaEnCaja(     ::cCodCaj, dbfCajT )
   ::cPrinterTikEnt  := cPrinterEntrega(           ::cCodCaj, dbfCajT )
   ::cFmtTikDev      := cFormatoDevolucionEnCaja(  ::cCodCaj, dbfCajT )
   ::cPrinterDev     := cPrinterDevolucion(        ::cCodCaj, dbfCajT )
   ::cFmtAlbCaj      := cFormatoAlbaranEnCaja(     ::cCodCaj, dbfCajT )
   ::cPrinterAlbCaj  := cWindowsPrinterEnCaja(     ::cCodCaj, dbfCajT )

   ::cFmtFacCaj      := cFormatoFacturaEnCaja(  ::cCodCaj, dbfCajT )
   ::cPrinterFacCaj  := cWindowsPrinterEnCaja(  ::cCodCaj, dbfCajT )

   ::cFmtEntCaj      := cFormatoEntregaEnCaja(  ::cCodCaj, dbfCajT )
   ::cPrinterEntCaj  := cPrinterEntrega(        ::cCodCaj, dbfCajT )

   ::cFmtApt         := cFormatoApartadosEnCaja(   ::cCodCaj, dbfCajT )
   ::cPrinterApt     := cPrinterApartados(         ::cCodCaj, dbfCajT )

return self

//---------------------------------------------------------------------------//

#endif