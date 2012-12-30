#ifndef __PDA__
#include "FiveWin.Ch"
#include "Font.ch"
#include "Folder.ch"
#include "Factu.ch"
#include "Report.ch"
#include "Label.ch"
#include "FastRepH.ch"
#include "Xbrowse.ch"
#else
#include "FWCE.ch"
REQUEST DBFCDX
#endif

#ifndef __PDA__

#define CLR_BAR                  14197607
#define _MENUITEM_               "01099"

#define _CSERFAC                 1    //   C      1     0
#define _NNUMFAC                 2    //   N      9     0
#define _CSUFFAC                 3    //   N      9     0
#define _CTURFAC                 4    //   C      6     0
#define _DFECFAC                 5    //   D      8     0
#define _CCODPRV                 6    //   C      7     0
#define _CCODALM                 7    //   C      3     0
#define _CCODCAJ                 8    //   C      3     0
#define _CNOMPRV                 9    //   C     35     0
#define _CDIRPRV                 10   //   C     35     0
#define _CPOBPRV                 11   //   C     25     0
#define _CPROVPROV               12   //   C     20     0
#define _CPOSPRV                 13   //   C      5     0
#define _CDNIPRV                 14   //   C     15     0
#define _LLIQUIDADA              15   //   L      1     0
#define _LCONTAB                 16   //   L      1     0
#define _DFECENT                 17   //   D      8     0
#define _CSUPED                  18   //   C     10     0
#define _CCONDENT                19   //   C     20     0
#define _MCOMENT                 20   //   M     10     0  Comentarios
#define _CEXPED                  21   //   C     20     0
#define _COBSERV                 22   //   C     20     0
#define _CCODPAGO                23   //   C      2     0
#define _NBULTOS                 24   //   N      3     0
#define _NPORTES                 25   //   N      6     0
#define _CNUMFAC                 26   //   C     12     0
#define _LIMPALB                 27   //   L      1     0
#define _CDTOESP                 28   //   N      4     1
#define _NDTOESP                 29   //   N      4     1
#define _CDPP                    30   //   N      4     1
#define _NDPP                    31   //   N      4     1
#define _LRECARGO                32   //   L      1     0
#define _NIRPF                   33   //   N      4     1
#define _CCODAGE                 34   //   C      3     0
#define _CDIVFAC                 35   //   C      3     0
#define _NVDVFAC                 36   //   N     10     4
#define _LSNDDOC                 37   //   L      1     0
#define _CDTOUNO                 38   //   N      4     1
#define _NDTOUNO                 39   //   N      4     1
#define _CDTODOS                 40   //   N      4     1
#define _NDTODOS                 41   //   N      4     1
#define _CCODPRO                 42   //
#define _LRECDOC                 43   //   L      1     0
#define _LCLOFAC                 44   //   L      1     0
#define _CNUMDOC                 45   //   C     20     0
#define _CCODUSR                 46
#define _LIMPRIMIDO              47   //   L      1     0
#define _DFECIMP                 48   //   D      8     0
#define _CHORIMP                 49   //   C      5     0
#define _NTIPRET                 50
#define _NPCTRET                 51
#define _DFECCHG                 52   //   D      8     0
#define _CTIMCHG                 53   //   C      5     0
#define _CCODDLG                 54   //   C      2     0
#define _NREGIVA                 55   //   L      1     0
#define _LFACGAS                 56
#define _MCOMGAS                 57
#define _NNETGAS1                58
#define _NNETGAS2                59
#define _NNETGAS3                60
#define _NIVAGAS1                61
#define _NIVAGAS2                62
#define _NIVAGAS3                63
#define _NREGAS1                 64
#define _NREGAS2                 65
#define _NREGAS3                 66
#define _CMOTREC                 67    //   C     35     0
#define _CCAUREC                 68    //   C     35     0
#define _NTOTNET                 69
#define _NTOTIVA                 70
#define _NTOTREQ                 71
#define _NTOTFAC                 72
#define _NTOTSUP                 73
#define _CBANCO                  74
#define _CENTBNC                 75
#define _CSUCBNC                 76
#define _CDIGBNC                 77
#define _CCTABNC                 78

/*
Lineas de Detalle
*/

#define _CREF                       4      //   C     10     0
#define _CREFPRV                    5      //
#define _CDETALLE                   6      //   C     50     0
#define _NPREUNIT                   7      //   N     13     4
#define _NDTO                       8      //   N      5     1
#define _NIVA                       9      //   N      6     2
#define _NCANENT                   10      //   N     13     4
#define _LCONTROL                  11      //   L      1     0
#define _CUNIDAD                   12      //   C      2     0
#define _NUNICAJA                  13      //   N      8     3
#define _LCHGLIN                   14      //   L      1     0
#define _MLNGDES                   15      //   M     10     0
#define _NDTOLIN                   16      //   N      5     2
#define _NDTOPRM                   17      //   N      5     2
#define _NDTORAP                   18      //   N      5     2
#define _NPRECOM                   19      //   N      5     2
#define _LBNFLIN1                  20      //   N      5     1
#define _LBNFLIN2                  21      //   N      5     1
#define _LBNFLIN3                  22      //   N      5     1
#define _LBNFLIN4                  23      //   N      5     1
#define _LBNFLIN5                  24      //   N      5     1
#define _LBNFLIN6                  25      //   N      5     1
#define _NBNFLIN1                  26      //   N      5     1
#define _NBNFLIN2                  27      //   N      5     1
#define _NBNFLIN3                  28      //   N      5     1
#define _NBNFLIN4                  29      //   N      5     1
#define _NBNFLIN5                  30      //   N      5     1
#define _NBNFLIN6                  31      //   N      5     1
#define _NBNFSBR1                  32      //   N     13     3
#define _NBNFSBR2                  33      //   N     13     3
#define _NBNFSBR3                  34      //   N     13     3
#define _NBNFSBR4                  35      //   N     13     3
#define _NBNFSBR5                  36      //   N     13     3
#define _NBNFSBR6                  37      //   N     13     3
#define _NPVPLIN1                  38      //   N      6     2
#define _NPVPLIN2                  39      //   L      1     0
#define _NPVPLIN3                  40      //   C      5     0
#define _NPVPLIN4                  41      //   C      5     0
#define _NPVPLIN5                  42      //   C      5     0
#define _NPVPLIN6                  43      //   C      5     0
#define _NIVALIN1                  44      //   N     13     4
#define _NIVALIN2                  45      //   C      3     0
#define _NIVALIN3                  46      //   C      3     0
#define _NIVALIN4                  47      //   L      1     0
#define _NIVALIN5                  48      //   N      4     0
#define _NIVALIN6                  49
#define _NIVALIN                   50
#define _LIVALIN                   51      //   L     1      0
#define _CCODPR1                   52
#define _CCODPR2                   53      //   L     4      0
#define _CVALPR1                   54
#define _CVALPR2                   55
#define _NFACCNV                   56
#define _CALMLIN                   57
#define _NCTLSTK                   58
#define _LLOTE                     59
#define _NLOTE                     60
#define _CLOTE                     61
#define _DFECCAD                   62
#define _NNUMLIN                   63
#define _NUNDKIT                   64
#define _LKITART                   65
#define _LKITCHL                   66
#define _LKITPRC                   67
#define _LIMPLIN                   68
#define _MNUMSER                   69
#define _CCODUBI1                  70
#define _CCODUBI2                  71
#define _CCODUBI3                  72
#define _CVALUBI1                  73
#define _CVALUBI2                  74
#define _CVALUBI3                  75
#define _CNOMUBI1                  76
#define _CNOMUBI2                  77
#define _CNOMUBI3                  78
#define _CCODFAM                   79   //    C    8    0
#define _CGRPFAM                   80   //    C    3    0
#define _NREQ                      81   //    N   16    6
#define _MOBSLIN                   82   //    M   10    0
#define _NPVPREC                   83
#define _NNUMMED                   84
#define _NMEDUNO                   85
#define _NMEDDOS                   86
#define _NMEDTRE                   87
#define _LGASSUP                   88

/*
Definici�n de Array para IGIC
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

/*
Variables memvar para todo el .prg logico no!
*/

memvar cDbf
memvar cDbfCol
memvar cDbfRec
memvar cDbfAlm
memvar cDbfPrv
memvar cDbfPgo
memvar cDbfIva
memvar cDbfDiv
memvar cDbfArt
memvar cDbfKit
memvar cDbfPro
memvar cDbfTblPro
memvar aTotIva
memvar aIvaUno
memvar aIvaDos
memvar aIvaTre
memvar aDatVcto
memvar aImpVcto
memvar nTotBrt
memvar nTotNet
memvar nTotSup
memvar nTotIva
memvar nTotReq
memvar nTotRet
memvar nTotFac
memvar nTotDto
memvar nTotDpp
memvar nTotUno
memvar nTotDos
memvar nTotImp
memvar nTotUnd
memvar nPagFac
memvar nTipRet
memvar nTotPage
memvar cPinDivFac
memvar cPirDivFac
memvar cPicEurFac
memvar nDinDivFac
memvar nDirDivFac
memvar nVdvDivFac
memvar nPagina
memvar lEnd
memvar aImpVto
memvar aDatVto

/*
Variables Staticas para todo el .prg logico no!
*/

static oWndBrw
static oBrwIva
static oInf

static dbfRctPrvT
static dbfRctPrvL
static dbfRctPrvS
static filRctPrvL
static tmpRctPrvT
static tmpRctPrvP
static tmpRctPrvL
static tmpRctPrvI
static dbfRctPrvP
static dbfRctPrvI
static dbfRctPrvD

static dbfPedPrvT
static dbfPedPrvL
static dbfAlbPrvT
static dbfAlbPrvL
static dbfFacPrvT
static dbfFacPrvL
static dbfPrvBnc

static dbfIva
static dbfInci
static dbfPrv
static dbfArtPrv
static dbfFPago
static dbfTmp
static dbfKit
static dbfArticulo
static dbfUbicaL
static dbfCodebar
static dbfFamilia
static dbfTblCnv
static dbfArtCom
static dbfPro
static dbfDoc
static dbfCajT
static dbfTblPro
static dbfDiv
static dbfUsr
static dbfFlt
static dbfCount
static oBandera
static dbfDelega
static dbfEmp
static dbfAlm
static dbfAlbCliL
static dbfFacCliL
static dbfFacRecL
static dbfTikCliL
static dbfProLin
static dbfProMat
static dbfHisMov
static oStock
static cNewFile
static cPicEur
static cPicUnd
static cPinDiv
static cPouDiv
static cPorDiv
static cTmpInc
static cTmpDoc
static cTmpPgo
static cTmpSer

static dbfTmpInc
static dbfTmpDoc
static dbfTmpPgo
static dbfTmpSer

static cPirDiv
static nDinDiv
static nRinDiv

static oGetTotal
static oGetTotPg
static oGetRet
static oGetNet
static oGetIva
static oGetReq
static oGetPgd
static oGetPdt
static oUsr
static cUsr
static oFntTot
static oBanco

static oMnuPgo
static oMnuRec

static aNumAlb          := {}
static nGetNeto         := 0
static nGetIva          := 0
static nGetReq          := 0
static nGetPgd          := 0

static cOldCodCli       := ""
static cOldCodArt       := ""
static cOldPrpArt       := ""
static cOldUndMed       := ""
static lOpenFiles       := .f.
static lExternal        := .f.
static nLabels          := 1
static cFiltroUsuario   := ""
static bEdtRec          := { |aTmp, aGet, dbfRctPrvT, oBrw, bWhen, bValid, nMode, cNumFac | EdtRec( aTmp, aGet, dbfRctPrvT, oBrw, bWhen, bValid, nMode, cNumFac ) }
static bEdtDet          := { |aTmp, aGet, dbfRctPrvT, oBrw, bWhen, bValid, nMode, aFac    | EdtDet( aTmp, aGet, dbfRctPrvT, oBrw, bWhen, bValid, nMode ) }
static bEdtInc          := { |aTmp, aGet, dbfRctPrvI, oBrw, bWhen, bValid, nMode, aTmpLin | EdtInc( aTmp, aGet, dbfRctPrvI, oBrw, bWhen, bValid, nMode, aTmpLin ) }
static bEdtDoc          := { |aTmp, aGet, dbfRctPrvD, oBrw, bWhen, bValid, nMode, aTmpLin | EdtDoc( aTmp, aGet, dbfRctPrvD, oBrw, bWhen, bValid, nMode, aTmpLin ) }
static bEdtPgo          := { |aTmp, aGet, dbfFacCliP, oBrw, bWhen, bValid, nMode, aTmpFac | EdtPgo( aTmp, aGet, dbfFacCliP, oBrw, bWhen, bValid, nMode, aTmpFac ) }
static oUndMedicion

#endif

#ifndef __PDA__

//----------------------------------------------------------------------------//
//Funciones del programa
//----------------------------------------------------------------------------//

STATIC FUNCTION OpenFiles( lExt )

   local oBlock

   if lOpenFiles
      MsgStop( 'Imposible abrir ficheros de facturas rectificativas a proveedores' )
      Return ( .f. )
   end if

   DEFAULT lExt         := .f.

   lExternal            := lExt

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DisableAcceso()

      lOpenFiles        := .t.

      USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfRctPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfRctPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RctPrvI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVI", @dbfRctPrvI ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvI.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RctPrvD.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVD", @dbfRctPrvD ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvD.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RctPrvS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVS", @dbfRctPrvS ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvS.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACPRVP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVP", @dbfRctPrvP ) )
      SET ADSINDEX TO ( cPatEmp() + "FACPRVP.CDX" ) ADDITIVE
      ( dbfRctPrvP )->( OrdSetFocus( "rNumFac" ) )

      USE ( cPatPrv() + "PROVEE.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PROVEE", @dbfPrv ) )
      SET ADSINDEX TO ( cPatPrv() + "PROVEE.CDX" ) ADDITIVE

      USE ( cPatDat() + "TIVA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIVA", @dbfIva ) )
      SET ADSINDEX TO ( cPatDat() + "TIVA.CDX" ) ADDITIVE

      USE ( cPatArt() + "PROVART.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PROVART", @dbfArtPrv ) )
      SET ADSINDEX TO ( cPatArt() + "PROVART.CDX" ) ADDITIVE

      USE ( cPatArt() + "ARTICULO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTICULO", @dbfArticulo ) )
      SET ADSINDEX TO ( cPatArt() + "ARTICULO.CDX" ) ADDITIVE

      USE ( cPatArt() + "ArtCodebar.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CODEBAR", @dbfCodebar ) )
      SET ADSINDEX TO ( cPatArt() + "ArtCodebar.Cdx" ) ADDITIVE

      USE ( cPatArt() + "FAMILIAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FAMILIAS", @dbfFamilia ) )
      SET ADSINDEX TO ( cPatArt() + "FAMILIAS.CDX" ) ADDITIVE

      USE ( cPatArt() + "ARTKIT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTTIK", @dbfKit ) )
      SET ADSINDEX TO ( cPatArt() + "ARTKIT.CDX" ) ADDITIVE

      USE ( cPatGrp() + "FPAGO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FPAGO", @dbfFPago ) )
      SET ADSINDEX TO ( cPatGrp() + "FPAGO.CDX" ) ADDITIVE

      USE ( cPatArt() + "ArtDiv.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ARTCOM", @dbfArtCom ) )
      SET ADSINDEX TO ( cPatArt() + "ArtDiv.Cdx" ) ADDITIVE

      USE ( cPatDat() + "DIVISAS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DIVISAS", @dbfDiv ) )
      SET ADSINDEX TO ( cPatDat() + "DIVISAS.CDX" ) ADDITIVE

      USE ( cPatDat() + "CNFFLT.DBF" ) NEW SHARED VIA ( cDriver() )ALIAS ( cCheckArea( "CNFFLT", @dbfFlt ) )
      SET ADSINDEX TO ( cPatDat() + "CNFFLT.CDX" ) ADDITIVE

      USE ( cPatDat() + "TBLCNV.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TBLCNV", @dbfTblCnv ) )
      SET ADSINDEX TO ( cPatDat() + "TBLCNV.CDX" ) ADDITIVE

      USE ( cPatDat() + "Cajas.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "CAJAS", @dbfCajT ) )
      SET ADSINDEX TO ( cPatDat() + "Cajas.Cdx" ) ADDITIVE

      // Documentos de compras-------------------------------------------------

      USE ( cPatEmp() + "PEDPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVT", @dbfPedPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "PEDPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PEDPROVL", @dbfPedPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "PEDPROVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "ALBPROVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVT", @dbfAlbPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBPROVT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "ALBPROVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBPROVL", @dbfAlbPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBPROVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACPRVT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfFacPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "FACPRVT.CDX" ) ADDITIVE

      USE ( cPatEmp() + "FACPRVL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfFacPrvL ) )
      SET ADSINDEX TO ( cPatEmp() + "FACPRVL.CDX" ) ADDITIVE

      USE ( cPatEmp() + "TIPINCI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIPINCI", @dbfInci ) )
      SET ADSINDEX TO ( cPatEmp() + "TIPINCI.CDX" ) ADDITIVE

      USE ( cPatArt() + "PRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PRO", @dbfPro ) )
      SET ADSINDEX TO ( cPatArt() + "PRO.CDX" ) ADDITIVE

      USE ( cPatArt() + "TBLPRO.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TBLPRO", @dbfTblPro ) )
      SET ADSINDEX TO ( cPatArt() + "TBLPRO.CDX" ) ADDITIVE

      USE ( cPatAlm() + "ALMACEN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALMACEN", @dbfAlm ) )
      SET ADSINDEX TO ( cPatAlm() + "ALMACEN.CDX" ) ADDITIVE

      USE ( cPatEmp() + "RDOCUMEN.DBF" ) NEW SHARED VIA ( cDriver() )ALIAS ( cCheckArea( "RDOCUMEN", @dbfDoc ) )
      SET ADSINDEX TO ( cPatEmp() + "RDOCUMEN.CDX" ) ADDITIVE
      SET TAG TO "CTIPO"

      USE ( cPatDat() + "USERS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "USERS", @dbfUsr ) )
      SET ADSINDEX TO ( cPatDat() + "USERS.CDX" ) ADDITIVE

      USE ( cPatAlm() + "UBICAL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "UBICAL", @dbfUbicaL ) )
      SET ADSINDEX TO ( cPatAlm() + "UBICAL.CDX" ) ADDITIVE

      USE ( cPatDat() + "DELEGA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "DELEGA", @dbfDelega ) )
      SET ADSINDEX TO ( cPatDat() + "DELEGA.CDX" ) ADDITIVE

      USE ( cPatEmp() + "NCOUNT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "NCOUNT", @dbfCount ) )
      SET ADSINDEX TO ( cPatEmp() + "NCOUNT.CDX" ) ADDITIVE

      USE ( cPatDat() + "EMPRESA.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "EMPRESA", @dbfEmp ) )
      SET ADSINDEX TO ( cPatDat() + "EMPRESA.CDX" ) ADDITIVE

      USE ( cPatEmp() + "ALBCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "ALBCLIL", @dbfAlbCliL ) )
      SET ADSINDEX TO ( cPatEmp() + "ALBCLIL.CDX" ) ADDITIVE
      SET TAG TO "cStkFast"

      USE ( cPatEmp() + "FACCLIL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACCLIL", @dbfFacCliL ) )
      SET ADSINDEX TO ( cPatEmp() + "FACCLIL.CDX" ) ADDITIVE
      SET TAG TO "cRef"

      USE ( cPatEmp() + "FacRecL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacRecL", @dbfFacRecL ) )
      SET ADSINDEX TO ( cPatEmp() + "FacRecL.CDX" ) ADDITIVE
      SET TAG TO "cRef"

      USE ( cPatEmp() + "TIKEL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "TIKEL", @dbfTikCliL ) )
      SET ADSINDEX TO ( cPatEmp() + "TIKEL.CDX" ) ADDITIVE
      SET TAG TO "CSTKFAST"

      USE ( cPatEmp() + "PROLIN.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PROLIN", @dbfProLin ) )
      SET ADSINDEX TO ( cPatEmp() + "PROLIN.CDX" ) ADDITIVE
      SET TAG TO "cCodArt"

      USE ( cPatEmp() + "PROMAT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PROMAT", @dbfProMat ) )
      SET ADSINDEX TO ( cPatEmp() + "PROMAT.CDX" ) ADDITIVE
      SET TAG TO "cCodArt"

      USE ( cPatEmp() + "HISMOV.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "HISMOV", @dbfHisMov ) )
      SET ADSINDEX TO ( cPatEmp() + "HISMOV.CDX" ) ADDITIVE
      SET TAG TO "cRefMov"

      USE ( cPatPrv() + "PRVBNC.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "PRVBNC", @dbfPrvBnc ) )
      SET ADSINDEX TO ( cPatPrv() + "PRVBNC.CDX" ) ADDITIVE

      // Unidades de medicion

      oUndMedicion      := UniMedicion():Create( cPatGrp() )
      if !oUndMedicion:OpenFiles()
         lOpenFiles     := .f.
      end if

      oBandera          := TBandera():New()

      oStock            := TStock():Create( cPatGrp() )
      if !oStock:lOpenFiles()
         lOpenFiles     := .f.
      else

      oStock:cKit       := dbfKit

      oStock:cPedPrvT   := dbfPedPrvT
      oStock:cPedPrvL   := dbfPedPrvL
      oStock:cAlbPrvT   := dbfAlbPrvT
      oStock:cAlbPrvL   := dbfAlbPrvL
      oStock:cFacPrvT   := dbfFacPrvT
      oStock:cFacPrvL   := dbfFacPrvL
      oStock:cRctPrvT   := dbfRctPrvT
      oStock:cRctPrvL   := dbfRctPrvL
      oStock:cRctPrvS   := dbfRctPrvS

      oStock:cAlbCliL   := dbfAlbCliL
      oStock:cFacCliL   := dbfFacCliL
      oStock:cFacRecL   := dbfFacRecL
      oStock:cTikL      := dbfTikCliL

      oStock:cProducL   := dbfProLin
      oStock:cProducM   := dbfProMat

      oStock:cHisMov    := dbfHisMov

      end if

      oBanco            := TBancos():Create()
      if !oBanco:OpenFiles()
         lOpenFiles     := .f.
      end if

      oFntTot           := TFont():New( "Arial", 8, 26, .F., .T. )// Font del total

      /*
      Declaraci�n variables p�blicas-------------------------------------------
      */

      public nTotBrt    := 0
      public nTotNet    := 0
      public nTotSup    := 0
      public nTotIva    := 0
      public nTotReq    := 0
      public nTotRet    := 0
      public nTotFac    := 0
      public nTotDto    := 0
      public nTotDpp    := 0
      public nTotUno    := 0
      public nTotDos    := 0
      public nTotImp    := 0
      public nTotUnd    := 0
      public nPagFac    := 0
      public nTipRet    := 0
      public aTotIva    := { { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 } }
      public aIvaUno    := aTotIva[ 1 ]
      public aIvaDos    := aTotIva[ 2 ]
      public aIvaTre    := aTotIva[ 3 ]

      /*
      Limitaciones de cajero y cajas--------------------------------------------------------
      */

      if oUser():lFiltroVentas()
         cFiltroUsuario := "Field->cCodUsr == '" + oUser():cCodigo() + "' .and. Field->cCodCaj == '" + oUser():cCaja() + "'"
      end if

      EnableAcceso()

   RECOVER

      lOpenFiles        := .f.

      EnableAcceso()

      msgStop( "Imposible abrir ficheros de facturas rectificativas a proveedores" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpenFiles
      CloseFiles()
   end if

Return ( lOpenFiles )

//---------------------------------------------------------------------------//

Static Function CloseFiles()

   DisableAcceso()

   DestroyFastFilter( dbfRctPrvT, .t., .t. )

   if dbfRctPrvT != nil
      ( dbfRctPrvT )->( dbCloseArea() )
   end if

   if dbfRctPrvL != nil
      ( dbfRctPrvL )->( dbCloseArea() )
   end if

   if dbfRctPrvI != nil
      ( dbfRctPrvI )->( dbCloseArea() )
   end if

   if dbfRctPrvD != nil
      ( dbfRctPrvD )->( dbCloseArea() )
   end if

   if dbfRctPrvS != nil
      ( dbfRctPrvS )->( dbCloseArea() )
   end if

   if dbfPedPrvT != nil
      ( dbfPedPrvT )->( dbCloseArea() )
   end if

   if dbfPedPrvL != nil
      ( dbfPedPrvL )->( dbCloseArea() )
   end if

   if dbfPrv != nil
      ( dbfPrv )->( dbCloseArea() )
   end if

   if dbfIva != nil
      ( dbfIva )->( dbCloseArea() )
   end if

   if dbfArtPrv != nil
      ( dbfArtPrv )->( dbCloseArea() )
   end if

   if dbfFPago != nil
      ( dbfFPago )->( dbCloseArea() )
   end if

   if dbfArticulo != nil
      ( dbfArticulo )->( dbCloseArea() )
   end if

   if dbfCodebar != nil
      ( dbfCodebar )->( dbCloseArea() )
   end if

   if dbfFamilia != nil
      ( dbfFamilia )->( dbCloseArea() )
   end if

   if dbfKit != nil
      ( dbfKit )->( dbCloseArea() )
   end if

   if !Empty( dbfFlt )
      ( dbfFlt )->( dbCloseArea() )
   end if

   if dbfRctPrvP != nil
      ( dbfRctPrvP )->( dbCloseArea() )
   end if

   if dbfArtCom != nil
      ( dbfArtCom )->( dbCloseArea() )
   end if

   if dbfDiv != nil
      ( dbfDiv )->( dbCloseArea() )
   end if

   if ( dbfTblCnv ) != nil
      ( dbfTblCnv )->( dbCloseArea() )
   end if

   if dbfPro != nil
      ( dbfPro )->( dbCloseArea() )
   end if

   if dbfTblPro != nil
      ( dbfTblPro )->( dbCloseArea() )
   end if

   if dbfAlbPrvT != nil
      ( dbfAlbPrvT )->( dbCloseArea() )
   end if

   if dbfAlbPrvL != nil
      ( dbfAlbPrvL )->( dbCloseArea() )
   end if

   if dbfFacPrvT != nil
      ( dbfFacPrvT )->( dbCloseArea() )
   end if

   if dbfFacPrvL != nil
      ( dbfFacPrvL )->( dbCloseArea() )
   end if

   if dbfAlm != nil
      ( dbfAlm )->( dbCloseArea() )
   end if

   if dbfDoc != nil
      ( dbfDoc )->( dbCloseArea() )
   end if

   if dbfCajT != nil
      ( dbfCajT )->( dbCloseArea() )
   end if

   if dbfUbicaL != nil
      ( dbfUbicaL )->( dbCloseArea() )
   end if

   if dbfUsr != nil
      ( dbfUsr )->( dbCloseArea() )
   end if

   if dbfInci != nil
      ( dbfInci )->( dbCloseArea() )
   end if

   if dbfDelega != nil
      ( dbfDelega )->( dbCloseArea() )
   end if

   if dbfCount != nil
      ( dbfCount )->( dbCloseArea() )
   end if

   if dbfEmp != nil
      ( dbfEmp )->( dbCloseArea() )
   end if

   if dbfAlbCliL != nil
      ( dbfAlbCliL )->( dbCloseArea() )
   end if

   if dbfFacCliL != nil
      ( dbfFacCliL )->( dbCloseArea() )
   end if

   if dbfFacRecL != nil
      ( dbfFacRecL )->( dbCloseArea() )
   end if

   if dbfTikCliL != nil
      ( dbfTikCliL )->( dbCloseArea() )
   end if

   if dbfProLin != nil
      ( dbfProLin )->( dbCloseArea() )
   end if

   if dbfProMat != nil
      ( dbfProMat )->( dbCloseArea() )
   end if

   if dbfHisMov != nil
      ( dbfHisMov )->( dbCloseArea() )
   end if

   if dbfPrvBnc != nil
      ( dbfPrvBnc )->( dbCloseArea() )
   end if

   if !Empty( oUndMedicion )
      oUndMedicion:end()
   end if

   if oStock != nil
      oStock:end()
   end if

   if oBanco != nil
      oBanco:CloseFiles()
      oBanco:End()
   end if

   dbfRctPrvT  := nil
   dbfRctPrvL  := nil
   dbfRctPrvI  := nil
   dbfRctPrvD  := nil
   dbfRctPrvP  := nil
   dbfRctPrvS  := nil
   dbfPrv      := nil
   dbfIva      := nil
   dbfArtPrv   := nil
   dbfFPago    := nil
   dbfUbicaL   := nil
   dbfArticulo := nil
   dbfCodebar  := nil
   dbfKit      := nil
   dbfFlt      := nil
   dbfArtCom   := nil
   dbfDiv      := nil
   oBandera    := nil
   dbfTblCnv   := nil
   dbfPro      := nil
   dbfTblPro   := nil
   dbfAlbPrvT  := nil
   dbfAlbPrvL  := nil
   dbfFacPrvT  := nil
   dbfFacPrvL  := nil
   dbfDoc      := nil
   dbfCajT     := nil
   dbfUsr      := nil
   oStock      := nil
   dbfInci     := nil
   dbfDelega   := nil
   dbfCount    := nil
   oBanco      := nil
   dbfEmp      := nil

   dbfAlbCliL  := nil
   dbfFacCliL  := nil
   dbfFacRecL  := nil

   dbfTikCliL  := nil
   dbfProLin   := nil
   dbfProMat   := nil
   dbfHisMov   := nil

   dbfPrvBnc   := nil

   lOpenFiles  := .f.

   EnableAcceso()

RETURN ( !lOpenFiles )

//------------------------------------------------------------------------//

FUNCTION RctPrv( oMenuItem, oWnd, cCodPrv, cCodArt, cNumFac )

   local oSnd
   local oRpl
   local oImp
   local oRotor
   local oDel
   local oPrv
   local oPdf
   local oMail
   local oBtnEur
   local nLevel
   local lEuro          := .f.
   local oLiq

   DEFAULT oMenuItem    := _MENUITEM_
   DEFAULT oWnd         := oWnd()
   DEFAULT cCodPrv      := ""
   DEFAULT cCodArt      := ""
   DEFAULT cNumFac      := ""

   /*
   Obtenemos el nivel de acceso
   */

   nLevel            := nLevelUsr( oMenuItem )
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
   Anotamos el movimiento para el navegador
   */

   DisableAcceso()

   DEFINE SHELL oWndBrw FROM 0, 0 TO 22, 80 ;
      XBROWSE ;
      TITLE    "Facturas rectificativa de proveedores" ;
      PROMPTS  "N�mero",;
               "Fecha",;
               "C�digo",;
               "Proveedor",;
               "N�mero documento",;
               "Pago";
      MRU      "Document_navigate_cross_16";
      BITMAP   Rgb( 0, 114, 198 ) ;
      ALIAS    ( dbfRctPrvT );
      APPEND   ( WinAppRec( oWndBrw:oBrw, bEdtRec, dbfRctPrvT, cCodPrv, cCodArt, cNumFac ) );
      DUPLICAT ( WinDupRec( oWndBrw:oBrw, bEdtRec, dbfRctPrvT, cCodPrv, cCodArt, cNumFac ) );
      EDIT     ( WinEdtRec( oWndBrw:oBrw, bEdtRec, dbfRctPrvT, cCodPrv, cCodArt, cNumFac ) );
      ZOOM     ( WinZooRec( oWndBrw:oBrw, bEdtRec, dbfRctPrvT ) );
      DELETE   ( WinDelRec( oWndBrw:oBrw, dbfRctPrvT, {|| QuiRctPrv() } ) );
      LEVEL    nLevel ;
      OF       oWnd

     oWndBrw:lFechado      := .t.

     oWndBrw:bChgIndex     := {|| if( oUser():lFiltroVentas(), CreateFastFilter( cFiltroUsuario, dbfRctPrvT, .f., , cFiltroUsuario ), CreateFastFilter( "", dbfRctPrvT, .f. ) ) }

      oWndBrw:SetYearComboBoxChange( {|| YearComboBoxChange() } )

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n cerrada"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfRctPrvT )->lCloFac }
         :nWidth           := 20
         :lHide            := .t.
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Zoom16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Envio"
         :nHeadBmpNo       := 3
         :bStrData         := {|| "" }
         :bEditValue       := {|| ( dbfRctPrvT )->lSndDoc }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "Lbl16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Pagado"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| ChkPagRctPrv( dbfRctPrvT, dbfRctPrvP ) }
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
         :bEditValue       := {|| ( dbfRctPrvT )->lContab }
         :nWidth           := 20
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "BmpConta16" )
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Incidencia"
         :nHeadBmpNo       := 4
         :bStrData         := {|| "" }
         :bBmpData         := {|| nEstadoIncidencia( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) }
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
         :bEditValue       := {|| ( dbfRctPrvT )->lImprimido }
         :nWidth           := 20
         :lHide            := .t.
         :SetCheck( { "Sel16", "Nil16" } )
         :AddResource( "IMP16" )

      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "N�mero"
         :cSortOrder       := "nNumFac"
         :bEditValue       := {|| ( dbfRctPrvT )->cSerFac + "/" + Alltrim( Str( ( dbfRctPrvT )->nNumFac ) ) + "/" + ( dbfRctPrvT )->cSufFac }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Delegaci�n"
         :bEditValue       := {|| ( dbfRctPrvT )->cCodDlg }
         :nWidth           := 60
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Sesi�n"
         :bEditValue       := {|| Trans( ( dbfRctPrvT )->cTurFac, "######" ) }
         :nWidth           := 60
         :lHide            := .t.
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Numero documento"
         :cSortOrder       := "cNumDoc"
         :bEditValue       := {|| ( dbfRctPrvT )->cNumDoc }
         :nWidth           := 80
         :lHide            := .t.
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Fecha"
         :cSortOrder       := "dFecFac"
         :bEditValue       := {|| Dtoc( ( dbfRctPrvT )->dFecFac ) }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Caja"
         :bEditValue       := {|| ( dbfRctPrvT )->cCodCaj }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Usuario"
         :bEditValue       := {|| ( dbfRctPrvT )->cCodUsr }
         :nWidth           := 40
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "C�digo"
         :cSortOrder       := "cCodPrv"
         :bEditValue       := {|| ( dbfRctPrvT )->cCodPrv }
         :nWidth           := 80
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Nombre"
         :cSortOrder       := "cNomPrv"
         :bEditValue       := {|| ( dbfRctPrvT )->cNomPrv }
         :nWidth           := 180
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Pago"
         :cSortOrder       := "cCodPago"
         :bEditValue       := {|| ( dbfRctPrvT )->cCodPago }
         :nWidth           := 40
         :lHide            := .t.
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Base"
         :bEditValue       := {|| ( dbfRctPrvT )->nTotNet }
         :cEditPicture     := cPirDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := cImp()
         :bEditValue       := {|| ( dbfRctPrvT )->nTotIva }
         :cEditPicture     := cPirDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "R.E."
         :bEditValue       := {|| ( dbfRctPrvT )->nTotReq }
         :cEditPicture     := cPirDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
         :lHide            := .t.
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Total"
         :bEditValue       := {|| ( dbfRctPrvT )->nTotFac }
         :cEditPicture     := cPirDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
         :nWidth           := 80
         :nDataStrAlign    := 1
         :nHeadStrAlign    := 1
      end with

      with object ( oWndBrw:AddXCol() )
         :cHeader          := "Div."
         :bEditValue       := {|| cSimDiv( if( lEuro, cDivChg(), ( dbfRctPrvT )->cDivFac ), dbfDiv ) }
         :nWidth           := 30
      end with

      oWndBrw:lAutoSeek    := .f.
      oWndBrw:cHtmlHelp    := "Factura rectificativa de proveedor"

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

   DEFINE BTNSHELL RESOURCE "EDIT" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecEdit() );
      TOOLTIP  "(M)odificar";
      MRU ;
      HOTKEY   "M";
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "ZOOM" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecZoom() );
      TOOLTIP  "(Z)oom";
      MRU ;
      HOTKEY   "Z";
      LEVEL    ACC_ZOOM

   DEFINE BTNSHELL oDel RESOURCE "DEL" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( oWndBrw:RecDel() );
      MENU     This:Toggle() ;
      TOOLTIP  "(E)liminar";
      HOTKEY   "E";
      LEVEL    ACC_DELE

   DEFINE BTNSHELL oImp RESOURCE "IMP" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( nGenRctPrv( IS_PRINTER ) ) ;
      MENU     This:Toggle() ;
      TOOLTIP  "(I)mprimir";
      HOTKEY   "I";
      LEVEL    ACC_IMPR

      lGenFac( oWndBrw:oBrw, oImp, IS_PRINTER ) ;

   DEFINE BTNSHELL RESOURCE "SERIE1" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( PrnSerie( oWndBrw:oBrw ) ) ;
      TOOLTIP  "Imp(r)imir series";
      HOTKEY   "R";
      LEVEL    ACC_IMPR

   DEFINE BTNSHELL oPrv RESOURCE "PREV1" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( nGenRctPrv( IS_SCREEN ), oWndBrw:Refresh() ) ;
      MENU     This:Toggle() ;
      TOOLTIP  "(P)revisualizar";
      HOTKEY   "P";
      LEVEL    ACC_IMPR

      lGenFac( oWndBrw:oBrw, oPrv, IS_SCREEN ) ;

   DEFINE BTNSHELL oPdf RESOURCE "DOCLOCK" OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( nGenRctPrv( IS_PDF ) ) ;
      TOOLTIP  "Pd(f)";
      HOTKEY   "F";
      LEVEL    ACC_IMPR

      lGenFac( oWndBrw:oBrw, oPdf, IS_PDF ) ;

   DEFINE BTNSHELL oMail RESOURCE "Mail" OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      ACTION   ( nGenRctPrv( IS_MAIL ) ) ;
      TOOLTIP  "Correo electr�nico";
      LEVEL    ACC_IMPR

      lGenFac( oWndBrw:oBrw, oMail, IS_MAIL ) ;

   DEFINE BTNSHELL RESOURCE "RemoteControl_" OF oWndBrw ;
			NOBORDER ;
         ACTION   ( TRectificativaProveedorLabelGenerator():Create() ) ;
         TOOLTIP  "E(t)iquetas" ;
         HOTKEY   "T";
         LEVEL    ACC_IMPR

   DEFINE BTNSHELL oLiq RESOURCE "Money2_" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( lLiquida( oWndBrw:oBrw ) ) ;
      TOOLTIP  "Pagar" ;
      LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "Money2_" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( aGetSelRec( oWndBrw, {|| lLiquida( oWndBrw:oBrw, ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) }, "Liquidar series de facturas", .t., nil, .t., nil ) ) ;
         TOOLTIP  "Pagar series" ;
         FROM     oLiq ;
         CLOSED ;
         LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "BmpConta" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( aGetSelRec( oWndBrw, {|lChk1, lChk2, oTree | CntRctPrv( lChk1, lChk2, .t., oTree, nil, nil, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfPrv, dbfDiv, dbfArticulo, dbfFPago, dbfIva ) }, "Contabilizar facturas rectificativas", .f., "Simular resultados", .f., "Contabilizar pagos" ) ) ;
      TOOLTIP  "(C)ontabilizar" ;
      HOTKEY   "C";
      LEVEL    ACC_EDIT

   if oUser():lAdministrador()

      DEFINE BTNSHELL RESOURCE "ChgState" OF oWndBrw ;
         NOBORDER ;
         ACTION   ( aGetSelRec( oWndBrw, {|lChk1| lCntRctPrv( lChk1, dbfRctPrvT ) }, "Cambiar estado", .f., "Contabilizado", .t., nil ) ) ;
         TOOLTIP  "Cambiar Es(t)ado" ;
         HOTKEY   "T";
         LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL oSnd RESOURCE "Lbl" GROUP OF oWndBrw ;
      NOBORDER ;
      MENU     This:Toggle() ;
      TOOLTIP  "En(v)iar" ;
      MESSAGE  "Seleccionar facturas para ser enviados" ;
      ACTION   lSnd( oWndBrw, dbfRctPrvT ) ;
      HOTKEY   "V";
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL oBtnEur RESOURCE "BAL_EURO" OF oWndBrw ;
      NOBORDER ;
      ACTION   ( lEuro := !lEuro, oWndBrw:Refresh() ) ;
      TOOLTIP  "M(o)neda";
      HOTKEY   "O"

   DEFINE BTNSHELL RESOURCE "INFO" GROUP OF oWndBrw ;
      NOBORDER ;
      ACTION   ( TTrazaDocumento():Activate( RCT_PRV, ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) ) ;
      TOOLTIP  "I(n)forme documento" ;
      HOTKEY   "N" ;
      LEVEL    ACC_EDIT

   if oUser():lAdministrador()

      DEFINE BTNSHELL oRpl RESOURCE "BMPCHG" GROUP OF oWndBrw ;
         NOBORDER ;
         MENU     This:Toggle() ;
         ACTION   ( TDlgFlt():New( aItmRctPrv(), dbfRctPrvT ):ChgFields(), oWndBrw:Refresh() ) ;
         TOOLTIP  "Cambiar campos" ;
         LEVEL    ACC_EDIT

         DEFINE BTNSHELL RESOURCE "BMPCHG" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( TDlgFlt():New( aColRctPrv(), dbfRctPrvL ):ChgFields(), oWndBrw:Refresh() ) ;
            TOOLTIP  "Lineas" ;
            FROM     oRpl ;
            CLOSED ;
            LEVEL    ACC_EDIT

   end if

   DEFINE BTNSHELL oRotor RESOURCE "ROTOR" GROUP OF oWndBrw ;
      ACTION   ( oRotor:Expand() ) ;
      TOOLTIP  "Rotor" ;
      LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "Businessman_" OF oWndBrw ;
         ACTION   ( EdtPrv( ( dbfRctPrvT )->cCodPrv ) );
         TOOLTIP  "Modificar proveedor";
         FROM     oRotor ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "INFO" OF oWndBrw ;
         ACTION   ( InfProveedor( ( dbfRctPrvT )->cCodPrv ) );
         TOOLTIP  "Informe proveedor";
         FROM     oRotor ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "Document_plain_businessman_" OF oWndBrw ;
         ACTION   ( if( !Empty( ( dbfRctPrvT )->cNumFac ), ZooFacPrv( ( dbfRctPrvT )->cNumFac ), MsgStop( "La factura no proviene de un albar�n" ) ) );
         TOOLTIP  "Visualizar factura";
         FROM     oRotor ;
         LEVEL    ACC_EDIT

      DEFINE BTNSHELL RESOURCE "Money2_businessman_" OF oWndBrw ;
         ALLOW    EXIT ;
         ACTION   ( RecPrv( , , { ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac } ) );
         TOOLTIP  "Modificar recibo" ;
         FROM     oRotor ;
         LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "END" GROUP OF oWndBrw ;
      ALLOW    EXIT ;
      ACTION   ( oWndBrw:End() ) ;
      TOOLTIP  "(S)alir" ;
      HOTKEY   "S"

   if !oUser():lFiltroVentas()
      oWndBrw:oActiveFilter:aTField       := aItmRctPrv()
      oWndBrw:oActiveFilter:cDbfFilter    := dbfFlt
      oWndBrw:oActiveFilter:cTipFilter    := FAC_PRV
   end if

   ACTIVATE WINDOW oWndBrw VALID ( CloseFiles() )

   EnableAcceso()

   if !Empty( cCodPrv ) .or. !Empty( cCodArt ) .or. !Empty( cNumFac )
      if !Empty( oWndBrw )
         oWndBrw:RecAdd()
      end if
      cCodPrv  := nil
      cCodArt  := nil
      cNumFac  := nil
   end if

Return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION EdtRec( aTmp, aGet, dbfRctPrvT, oBrw, cCodPrv, cCodArt, nMode, cNumFac )

   local n
   local oDlg
	local oFld
   local oBtnOk
   local oBrwLin
   local oBrwPgo
   local oBrwInc
   local oBrwDoc
   local cGetRet
   local oGet        := Array( 6 )
   local cGet        := Array( 6 )
   local oSayLabels  := Array( 7 )
   local cTlfPrv
   local oTlfPrv
   local oBmpDiv
   local oBmpEmp
   local nOrd        := ( dbfRctPrvT )->( ordSetFocus( 1 ) )
   local aControl    := Array( 6 )
   local oSayGas     := Array( 16 )
   local oBmpGeneral

   cTlfPrv           := RetFld( aTmp[ _CCODPRV ], dbfPrv, "Telefono" )
   cUsr              := RetFld( aTmp[ _CCODUSR ], dbfUsr, "cNbrUse" )

   do case
   case nMode == APPD_MODE

      if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lAdministrador()
         msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
         Return .f.
      end if

      aTmp[ _CSERFAC ]  := cNewSer( "nRctPrv", dbfCount )
      aTmp[ _CTURFAC ]  := cCurSesion()
      aTmp[ _CDIVFAC ]  := cDivEmp()
      aTmp[ _CCODALM ]  := oUser():cAlmacen()
      aTmp[ _CCODCAJ ]  := oUser():cCaja()
      aTmp[ _NVDVFAC ]  := nChgDiv( aTmp[ _CDIVFAC ], dbfDiv )
      aTmp[ _CSUFFAC ]  := RetSufEmp()
      aTmp[ _LSNDDOC ]  := .t.
      aTmp[ _CCODPRO ]  := cProCnt()
      aTmp[ _DFECENT ]  := Ctod( "" )
      aTmp[ _CCODUSR ]  := cCurUsr()
      aTmp[ _CCODDLG ]  := oUser():cDelegacion()
      aTmp[ _DFECIMP ]  := Ctod( "" )

      if !Empty( cCodPrv )
         aTmp[ _CCODPRV ]  := cCodPrv
      end if

      if !Empty( cNumFac )
         aTmp[ _CNUMFAC ]  := cNumFac
      end if

   case nMode == DUPL_MODE

      if !lCajaOpen( oUser():cCaja() ) .and. !oUser():lAdministrador()
         msgStop( "Esta caja " + oUser():cCaja() + " esta cerrada." )
         Return .f.
      end if

      aTmp[ _CTURFAC ]  := cCurSesion()
      aTmp[ _CCODCAJ ]  := oUser():cCaja()
      aTmp[ _LSNDDOC ]  := .t.
      aTmp[ _DFECENT ]  := Ctod( "" )
      aTmp[ _DFECIMP ]  := Ctod( "" )
      aTmp[ _LCLOFAC ]  := .f.
      aTmp[ _LCONTAB ]  := .f.

   case nMode == EDIT_MODE

      if aTmp[ _LCONTAB ] .and. !ApoloMsgNoYes( "La modificaci�n de esta factura rectificativa puede provocar descuadres contables." + CRLF + "� Desea continuar ?", "Factura ya contabilizada" )
         return .f.
      end if

      if aTmp[ _LRECDOC ]
         MsgStop( "El documento ha sido recibido por internet", "Imposible modificar" )
         return .f.
      end if

      if aTmp[ _LCLOFAC ] .AND. !oUser():lAdministrador()
         msgStop( "Solo puede modificar los facturas rectificativas cerradas los administradores." )
         return .f.
      end if

   end case

   if Empty( aTmp[ _CDTOESP ] )
      aTmp[ _CDTOESP ]  := Padr( "General", 50 )
   end if

   if Empty( aTmp[ _CDPP ] )
      aTmp[ _CDPP ]     := Padr( "Pronto pago", 50 )
   end if

   /*
   Comienza la transaccion-----------------------------------------------------
   */

   if BeginTrans( aTmp, nMode )
      Return .f.
   end if

   /*
   Este valor los guaradamos para detectar los posibles cambios
   */

   cOldCodCli  := aTmp[ _CCODPRV ]

   cPicUnd     := MasUnd()                               // Picture de las unidades
   cPinDiv     := cPinDiv( aTmp[ _CDIVFAC ], dbfDiv )    // Picture de la divisa
   cPirDiv     := cPirDiv( aTmp[ _CDIVFAC ], dbfDiv )    // Picture de la divisa redondeada
   nDinDiv     := nDinDiv( aTmp[ _CDIVFAC ], dbfDiv )    // Decimales de la divisa
   nRinDiv     := nRinDiv( aTmp[ _CDIVFAC ], dbfDiv )    // Decimales de la divisa redondeada
   cPouDiv     := cPouDiv( aTmp[ _CDIVFAC ], dbfDiv ) // Picture de la divisa
   cPorDiv     := cPorDiv( aTmp[ _CDIVFAC ], dbfDiv ) // Picture de la divisa redondeada

   /*
   Etiquetas-------------------------------------------------------------------
   */

   cGet[ 1 ]   := RetFld( aTmp[ _CCODALM ], dbfAlm )
   cGet[ 2 ]   := RetFld( aTmp[ _CCODPRV ], dbfPrv )
   cGet[ 3 ]   := RetFld( aTmp[ _CCODPAGO], dbfFPago )
   cGet[ 5 ]   := RetFld( aTmp[ _CCODCAJ ], dbfCajT )
   cGet[ 6 ]   := RetFld( cCodEmp() + aTmp[ _CCODDLG ], dbfDelega, "cNomDlg" )

   DEFINE DIALOG oDlg RESOURCE "RECTPRV" TITLE LblTitle( nMode ) + "facturas rectificativas de proveedores"

      REDEFINE FOLDER   oFld ;
         ID             400 ;
         OF             oDlg ;
         PROMPT         "&Factura",    "Da&tos",      "&Incidencias",   "D&ocumentos" ;
         DIALOGS        "RCTPRV_1",    "RCTPRV_2",    "PEDCLI_3",       "PEDCLI_4"

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "factura_rectificatica_proveedor_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[1]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "folder2_red_alpha_48" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[2]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "information_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[3]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "address_book2_alpha_48" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[4]

      REDEFINE GET aGet[ _CCODUSR ] VAR aTmp[ _CCODUSR ];
         ID       125 ;
         WHEN     ( .f. ) ;
         VALID    ( SetUsuario( aGet[ _CCODUSR ], oUsr, nil, dbfUsr ) );
         OF       oFld:aDialogs[2]

      REDEFINE GET oUsr VAR cUsr ;
         ID       126 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      /*
      Datos del proveedor------------------------------------------------------
      */

		REDEFINE GET aGet[ _CCODPRV ] VAR aTmp[ _CCODPRV ] ;
			ID 		140 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			PICTURE	( RetPicCodPrvEmp() ) ;
         VALID    ( loaPrv( aGet, aTmp, dbfPrv, nMode, oGet[ 2 ], oTlfPrv ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwProvee( aGet[ _CCODPRV ], oGet[ 2 ] ) );
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CNOMPRV ] VAR aTmp[ _CNOMPRV ];
			ID 		141 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDNIPRV ] VAR aTmp[ _CDNIPRV ] ;
         ID       106 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oTlfPrv VAR cTlfPrv ;
         ID       107 ;
         WHEN     ( .f. );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDIRPRV ] VAR aTmp[ _CDIRPRV ] ;
         ID       103 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         BITMAP   "Environnment_View_16" ;
         ON HELP  GoogleMaps( aTmp[ _CDIRPRV ], Rtrim( aTmp[ _CPOBPRV ] ) + Space( 1 ) + Rtrim( aTmp[ _CPROVPROV ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPOBPRV ] VAR aTmp[ _CPOBPRV ] ;
         ID       105 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPROVPROV ] VAR aTmp[ _CPROVPROV ] ;
         ID       108 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CPOSPRV ] VAR aTmp[ _CPOSPRV ] ;
         ID       104 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CCODALM ] VAR aTmp[ _CCODALM ] ;
			ID 		150 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         VALID    cAlmacen( aGet[_CCODALM], dbfAlm, oGet[ 1 ] );
         BITMAP   "LUPA" ;
         ON HELP  brwAlmacen( aGet[ _CCODALM ], oGet[ 1 ] );
			OF 		oFld:aDialogs[1]

      REDEFINE GET oGet[1] VAR cGet[1] ;
			ID 		151 ;
			WHEN 		( .F. );
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_CCODPAGO] VAR aTmp[_CCODPAGO];
			ID 		160 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         VALID    cFPago( aGet[_CCODPAGO], dbfFPago, oGet[3] ) ;
         BITMAP   "LUPA" ;
         ON HELP  BrwFPago( aGet[_CCODPAGO ], oGet[3] ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oGet[3] VAR cGet[3];
			ID 		161 ;
			WHEN 		.F. ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      /*
      Bancos-------------------------------------------------------------------
      */

      REDEFINE GET aGet[ _CBANCO ] VAR aTmp[ _CBANCO ];
         ID       300 ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwBncPrv( aGet[ _CBANCO ], aGet[ _CENTBNC ], aGet[ _CSUCBNC ], aGet[ _CDIGBNC ], aGet[ _CCTABNC ], aTmp[ _CCODPRV ] ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CENTBNC ] VAR aTmp[ _CENTBNC ];
         ID       301 ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) );
         VALID    ( lCalcDC( aTmp[ _CENTBNC ], aTmp[ _CSUCBNC ], aTmp[ _CDIGBNC ], aTmp[ _CCTABNC ], aGet[ _CDIGBNC ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CSUCBNC ] VAR aTmp[ _CSUCBNC ];
         ID       302 ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) );
         VALID    ( lCalcDC( aTmp[ _CENTBNC ], aTmp[ _CSUCBNC ], aTmp[ _CDIGBNC ], aTmp[ _CCTABNC], aGet[ _CDIGBNC ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDIGBNC ] VAR aTmp[ _CDIGBNC ];
         ID       303 ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) );
         VALID    ( lCalcDC( aTmp[ _CENTBNC ], aTmp[ _CSUCBNC ], aTmp[ _CDIGBNC ], aTmp[ _CCTABNC ], aGet[ _CDIGBNC ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CCTABNC ] VAR aTmp[ _CCTABNC ];
         ID       304 ;
         PICTURE  "9999999999" ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) );
         VALID    ( lCalcDC( aTmp[ _CENTBNC ], aTmp[ _CSUCBNC ], aTmp[ _CDIGBNC ], aTmp[ _CCTABNC ], aGet[ _CDIGBNC ] ) ) ;
         OF       oFld:aDialogs[1]

      /*
		Cajas____________________________________________________________________
		*/

      REDEFINE GET aGet[ _CCODCAJ ] VAR aTmp[ _CCODCAJ ];
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    cCajas( aGet[ _CCODCAJ ], dbfCajT, oGet[ 5 ] ) ;
         ID       165 ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwCajas( aGet[ _CCODCAJ ], oGet[ 5 ] ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oGet[ 5 ] VAR cGet[ 5 ] ;
         ID       166 ;
         WHEN     .f. ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

		/*
		Moneda__________________________________________________________________
		*/

		REDEFINE GET aGet[ _CDIVFAC ] VAR aTmp[ _CDIVFAC ];
         WHEN     ( nMode == APPD_MODE ) ;
         VALID    ( cDivIn( aGet[ _CDIVFAC ], oBmpDiv, aGet[ _NVDVFAC ], @cPinDiv, @nDinDiv, @cPirDiv, @nRinDiv, nil, dbfDiv, oBandera ) );
			PICTURE	"@!";
			ID 		170 ;
         BITMAP   "LUPA" ;
         ON HELP  BrwDiv( aGet[ _CDIVFAC ], oBmpDiv, aGet[ _NVDVFAC ], dbfDiv, oBandera ) ;
			OF 		oFld:aDialogs[1]

		REDEFINE BITMAP oBmpDiv ;
         RESOURCE "BAN_EURO" ;
			ID 		171;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[ _NVDVFAC ] VAR aTmp[ _NVDVFAC ];
			WHEN		( .F. ) ;
			ID 		180 ;
			PICTURE	"@E 999,999.9999" ;
			OF 		oFld:aDialogs[1]

		/*
		Bitmap________________________________________________________________
      */

      REDEFINE BITMAP oBmpEmp ;
         FILE     "Bmp\ImgFacPrv.bmp" ;
         ID       500 ;
         OF       oDlg

      /*
		Botones_________________________________________________________________
		*/

      REDEFINE BUTTON aControl[1] ;
			ID 		500 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         ACTION   ( AppDeta( oBrwLin, bEdtDet, aTmp) )

      REDEFINE BUTTON aControl[2] ;
			ID 		501 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo )  ) ;
         ACTION   ( EdtDeta( oBrwLin, bEdtDet, aTmp ) )

      REDEFINE BUTTON aControl[3] ;
			ID 		502 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .and. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         ACTION   ( WinDelRec( oBrwLin, dbfTmp, {|| delDeta() }, {|| RecalculaTotal( aTmp ) } ) )

      REDEFINE BUTTON aControl[4] ;
			ID 		503 ;
			OF 		oFld:aDialogs[1] ;
         ACTION   ( if( !( dbfTmp )->lControl, WinZooRec( oBrwLin, bEdtDet, dbfTmp, aTmp ), ) )

      /*
      REDEFINE BUTTON ;
			ID 		530 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagados( aTmp, dbfTmpPgo ) ) ;
         ACTION   ( ImpFactura( oBrwLin, aGet, aTmp ) )
      */

      REDEFINE BUTTON aControl[5] ;
			ID 		524 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         ACTION   ( DbSwapUp( dbfTmp, oBrwLin ) )

      REDEFINE BUTTON aControl[6] ;
			ID 		525 ;
			OF 		oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         ACTION   ( DbSwapDown( dbfTmp, oBrwLin ) )

		/*
		Detalle________________________________________________________________
      */

      oBrwLin                 := IXBrowse():New( oFld:aDialogs[1] )

      oBrwLin:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwLin:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwLin:cAlias          := dbfTmp

      oBrwLin:nMarqueeStyle   := 6
      oBrwLin:cName           := "Lineas de facturas a proveedor"

         with object ( oBrwLin:AddCol() )
            :cHeader          := "N�mero"
            :bEditValue       := {|| if( ( dbfTmp )->lKitChl, "", Trans( ( dbfTmp )->nNumLin, "9999" ) ) }
            :nWidth           := 65
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C�digo"
            :bEditValue       := {|| ( dbfTmp )->cRef }
            :nWidth           := 80
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C. Barras"
            :bEditValue       := {|| cCodigoBarrasDefecto( ( dbfTmp )->cRef, dbfCodeBar ) }
            :nWidth           := 100
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "C�digo proveedor"
            :bEditValue       := {|| ( dbfTmp )->cRefPrv }
            :nWidth           := 80
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| if( Empty( ( dbfTmp )->cRef ) .and. !( dbfTmp )->lControl, ( dbfTmp )->mLngDes, ( dbfTmp )->cDetalle ) }
            :nWidth           := 292
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Prop. 1"
            :bEditValue       := {|| ( dbfTmp )->cValPr1 }
            :nWidth           := 60
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Prop. 2"
            :bEditValue       := {|| ( dbfTmp )->cValPr2 }
            :nWidth           := 60
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Lote"
            :bEditValue       := {|| ( dbfTmp )->cLote }
            :nWidth           := 80
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Caducidad"
            :bEditValue       := {|| Dtoc( ( dbfTmp )->dFecCad ) }
            :nWidth           := 60
            :lHide            := .t.
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := cNombreUnidades()
            :bEditValue       := {|| nTotNRctPrv( dbfTmp ) }
            :cEditPicture     := cPicUnd
            :nWidth           := 60
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "UM. Unidad de medici�n"
            :bEditValue       := {|| ( dbfTmp )->cUnidad }
            :nWidth           := 25
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Almacen"
            :bEditValue       := {|| ( dbfTmp )->cAlmLin }
            :nWidth           := 60
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Importe"
            :bEditValue       := {|| nTotURctPrv( dbfTmp, nDinDiv ) }
            :cEditPicture     := cPinDiv
            :nWidth           := 90
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "% Dto."
            :bEditValue       := {|| ( dbfTmp )->nDtoLin }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 50
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "% Prm."
            :bEditValue       := {|| ( dbfTmp )->nDtoPrm }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 40
            :lHide            := .t.
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "% " + cImp()
            :bEditValue       := {|| ( dbfTmp )->nIva }
            :cEditPicture     := "@E 999.99"
            :nWidth           := 50
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwLin:AddCol() )
            :cHeader          := "Total"
            :bEditValue       := {|| nTotLRctPrv( dbfTmp, nDinDiv, nRinDiv ) }
            :cEditPicture     := cPirDiv
            :nWidth           := 90
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         if nMode != ZOOM_MODE
            oBrwLin:bLDblClick   := {|| EdtDeta( oBrwLin, bEdtDet, aTmp ) }
         end if

      oBrwLin:CreateFromResource( 190 )

      /*
      Comentario para la factura de gastos_____________________________________
      */

      REDEFINE GET aGet[ _MCOMGAS ] VAR aTmp[ _MCOMGAS ] MEMO ;
         ID       290 ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

       /*
       Primer tipo de " + cImp() + " de gastos____________________________________________
       */

       REDEFINE GET aGet[ _NNETGAS1 ] VAR aTmp[ _NNETGAS1 ] ;
         ID       600 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  cPirDiv ;
         VALID    ( oSayGas[11]:Refresh(), oSayGas[12]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

       REDEFINE GET aGet[ _NIVAGAS1 ] VAR aTmp[ _NIVAGAS1 ] ;
         ID       601 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[11]:Refresh(), oSayGas[12]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[11] PROMPT Trans( aTmp[ _NNETGAS1 ] * aTmp[ _NIVAGAS1 ] / 100, cPirDiv ) ;
         ID       602 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NREGAS1 ] VAR aTmp[ _NREGAS1 ] ;
         ID       603 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LRECARGO ] ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[11]:Refresh(), oSayGas[12]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[12] PROMPT Trans( aTmp[ _NNETGAS1 ] * aTmp[ _NREGAS1 ] / 100, cPirDiv ) ;
         ID       604 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      /*
      Segundo tipo de " + cImp() + " de gastos____________________________________________
      */

      REDEFINE GET aGet[ _NNETGAS2 ] VAR aTmp[ _NNETGAS2 ] ;
         ID       610 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  cPirDiv ;
         VALID    ( oSayGas[13]:Refresh(), oSayGas[14]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NIVAGAS2 ] VAR aTmp[ _NIVAGAS2 ] ;
         ID       611 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[13]:Refresh(), oSayGas[14]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[13] PROMPT Trans( aTmp[ _NNETGAS2 ] * aTmp[ _NIVAGAS2 ] / 100, cPirDiv ) ;
         ID       612 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NREGAS2 ] VAR aTmp[ _NREGAS2 ] ;
         ID       613 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LRECARGO ] ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[13]:Refresh(), oSayGas[14]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[14] PROMPT Trans( aTmp[ _NNETGAS2 ] * aTmp[ _NREGAS2 ] / 100, cPirDiv ) ;
         ID       614 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      /*
      Tercer tipo de " + cImp() + " de gastos____________________________________________
      */

      REDEFINE GET aGet[ _NNETGAS3 ] VAR aTmp[ _NNETGAS3 ] ;
         ID       620 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  cPirDiv ;
         VALID    ( oSayGas[15]:Refresh(), oSayGas[16]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NIVAGAS3 ] VAR aTmp[ _NIVAGAS3 ] ;
         ID       621 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[15]:Refresh(), oSayGas[16]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[15] PROMPT Trans( aTmp[ _NNETGAS3 ] * aTmp[ _NIVAGAS3 ] / 100, cPirDiv ) ;
         ID       622 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NREGAS3 ] VAR aTmp[ _NREGAS3 ] ;
         ID       623 ;
         WHEN     ( nMode != ZOOM_MODE .and. aTmp[ _LRECARGO ] ) ;
         PICTURE  "@ER 99.99%" ;
         SPINNER ;
         VALID    ( oSayGas[15]:Refresh(), oSayGas[16]:Refresh(), .t. );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE SAY oSayGas[16] PROMPT Trans( aTmp[ _NNETGAS3 ] * aTmp[ _NREGAS3 ] / 100, cPirDiv ) ;
         ID       624 ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      /*
      Descuentos_______________________________________________________________
      */

      REDEFINE GET aGet[ _CDTOESP ] VAR aTmp[ _CDTOESP ] ;
         ID       199 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NDTOESP ] VAR aTmp[ _NDTOESP ] ;
			ID 		200 ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         PICTURE  "@E 99.99" ;
         SPINNER ;
         ON CHANGE( RecalculaTotal( aTmp ) );
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDPP ] VAR aTmp[ _CDPP ] ;
         ID       209 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[1]

		REDEFINE GET aGet[ _NDPP ] VAR aTmp[ _NDPP ];
			ID 		210 ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         PICTURE  "@E 99.99" ;
         SPINNER ;
         ON CHANGE( RecalculaTotal( aTmp ) );
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDTOUNO ] VAR aTmp[ _CDTOUNO ] ;
			ID 		240 ;
			PICTURE 	"@!" ;
			COLOR 	CLR_GET ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NDTOUNO ] VAR aTmp[ _NDTOUNO ];
			ID 		250 ;
			PICTURE 	"@E 99.99" ;
         SPINNER ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _CDTODOS ] VAR aTmp[ _CDTODOS ] ;
         ID       260 ;
			PICTURE 	"@!" ;
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[ _NDTODOS ] VAR aTmp[ _NDTODOS ];
         ID       270 ;
			PICTURE 	"@E 99.99" ;
         SPINNER ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         WHEN     ( nMode != ZOOM_MODE .AND. !lRecibosPagadosTmp( dbfTmpPgo ) ) ;
         OF       oFld:aDialogs[1]

      /*
      Desglose del IGIC---------------------------------------------------------
      */

      oBrwIva                        := TXBrowse():New( oFld:aDialogs[ 1 ] )

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
         :nWidth        := 80
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 2 ] )
         :cHeader       := "Base"
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 2 ] ), Trans( aTotIva[ oBrwIva:nArrayAt, 2 ], cPirDiv ), "" ) }
         :nWidth        := 80
         :cEditPicture  := cPirDiv
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
      end with

      with object ( oBrwIva:aCols[ 3 ] )
         :cHeader       := "%" + cImp()
         :bStrData      := {|| if( !IsNil( aTotIva[ oBrwIva:nArrayAt, 3 ] ), aTotIva[ oBrwIva:nArrayAt, 3 ], "" ) }
         :bEditValue    := {|| aTotIva[ oBrwIva:nArrayAt, 3 ] }
         :nWidth        := 45
         :cEditPicture  := "@E 999.99"
         :nDataStrAlign := 1
         :nHeadStrAlign := 1
         :nFootStrAlign := 1
         :nEditType     := 1
         :bEditWhen     := {|| !IsNil( aTotIva[ oBrwIva:nArrayAt, 3 ] ) }
         :bOnPostEdit   := {|o,x| EdtIva( o, x, aTotIva[ oBrwIva:nArrayAt, 3 ], dbfTmp, dbfIva, oBrwLin ), RecalculaTotal( aTmp ) }
      end with

      with object ( oBrwIva:aCols[ 4 ] )
         :cHeader       := "%R.E."
         :bStrData      := {|| if( !Empty( aTotIva[ oBrwIva:nArrayAt, 4 ] ) .and. aTmp[ _LRECARGO ], Trans( aTotIva[ oBrwIva:nArrayAt, 4 ], "@E 99.9" ), "" ) }
         :nWidth        := 45
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
         OF       oFld:aDialogs[ 1 ]

      REDEFINE CHECKBOX aGet[ _LRECARGO ] VAR aTmp[ _LRECARGO ] ;
			ID 		400 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[ 1 ]

      REDEFINE SAY oGetTotal VAR nTotFac ;
			ID 		410 ;
         FONT     oFntTot ;
         OF       oFld:aDialogs[ 1 ]

/*
      REDEFINE SAY oGet[4] VAR cGet[4];
         ID       420 ;
			FONT 		oFont ;
			OF 		oFld:aDialogs[1]
*/

      REDEFINE GET aGet[_CSERFAC] VAR aTmp[_CSERFAC] ;
         ID       100 ;
         PICTURE  "@!" ;
         SPINNER ;
         ON UP    ( UpSerie( aGet[_CSERFAC] ) );
         ON DOWN  ( DwSerie( aGet[_CSERFAC] ) );
         COLOR    CLR_GET ;
         WHEN     ( nMode == APPD_MODE .OR. nMode == DUPL_MODE );
         VALID    ( aTmp[_CSERFAC] >= "A" .AND. aTmp[_CSERFAC] <= "Z"  );
         OF       oFld:aDialogs[1]

         aGet[ _CSERFAC ]:bLostFocus := {|| aGet[ _CCODPRO ]:cText( cProCnt( aTmp[ _CSERFAC ] ) ) }

		REDEFINE GET aGet[_NNUMFAC] VAR aTmp[_NNUMFAC] ;
         ID       101 ;
			PICTURE 	"999999999";
			WHEN		.F. ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_CSUFFAC] VAR aTmp[_CSUFFAC];
         ID       102 ;
			WHEN 		.F. ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_DFECFAC] VAR aTmp[_DFECFAC] ;
			ID 		110 ;
			SPINNER ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET aGet[_CSUPED] VAR aTmp[_CSUPED] ;
			ID 		120 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR	 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CNUMFAC ] VAR aTmp[ _CNUMFAC ] ;
			ID 		130 ;
         PICTURE  "@R A/#########/##" ;
         WHEN     ( nMode == APPD_MODE ) ;
         VALID    ( cFacPrv( aGet, oBrwLin, nMode, aTmp ), RecalculaTotal( aTmp ) ) ;
         ON HELP  ( brwFacPrv( aGet[ _CNUMFAC ], dbfFacPrvT, dbfFacPrvL, dbfIva, dbfDiv ) );
         BITMAP   "LUPA" ;
			OF 		oFld:aDialogs[1]

      REDEFINE CHECKBOX aGet[ _LFACGAS ] VAR aTmp[ _LFACGAS ] ;
         ID       550;
         WHEN     ( nMode == APPD_MODE ) ;
         ON CHANGE( ShowKitRctPrv( dbfRctPrvT, oBrwLin, cCodPrv, nil, aGet, aTmp, aControl, oSayGas, oSayLabels, oBrwIva ),;
                    RecalculaTotal( aTmp ), .t. );
         OF       oFld:aDialogs[1]

      REDEFINE COMBOBOX aGet[ _NTIPRET ] VAR aTmp[ _NTIPRET ] ;
         ITEMS    { "Ret. S/Base", "Ret. S/Total" };
         ID       440 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( RecalculaTotal( aTmp ) );
         ON CHANGE( RecalculaTotal( aTmp ) );
         OF       oFld:aDialogs[ 1 ]

      REDEFINE GET aGet[ _NPCTRET ] VAR aTmp[ _NPCTRET ] ;
         ID       450 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( RecalculaTotal( aTmp ) );
         ON CHANGE( RecalculaTotal( aTmp ) );
         PICTURE  "@E 99.9" ;
         OF       oFld:aDialogs[ 1 ]

      REDEFINE SAY oGetRet VAR cGetRet;
         ID       491 ;
			OF 		oFld:aDialogs[1]

      REDEFINE GROUP oSayLabels[ 1 ] ID 700 OF oFld:aDialogs[ 1 ] TRANSPARENT
      REDEFINE SAY   oSayLabels[ 2 ] ID 701 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 3 ] ID 702 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 4 ] ID 703 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 5 ] ID 704 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 6 ] ID 705 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayLabels[ 7 ] ID 706 OF oFld:aDialogs[ 1 ]

      REDEFINE SAY   oSayGas[ 1 ]    ID 707 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 2 ]    ID 708 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 3 ]    ID 709 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 4 ]    ID 710 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 5 ]    ID 711 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 6 ]    ID 712 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 7 ]    ID 713 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 8 ]    ID 714 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 9 ]    ID 715 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY   oSayGas[ 10]    ID 716 OF oFld:aDialogs[ 1 ]

      /*
		Redefinici�n de la segunda caja de dialogo
		------------------------------------------------------------------------
      */

      REDEFINE COMBOBOX aGet[ _CMOTREC ] VAR aTmp[ _CMOTREC ] ;
         ITEMS    RECTIFICATIVA_ITEMS ;
         ID       100 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 2 ]

      REDEFINE GET aGet[ _CCAUREC ] VAR aTmp[ _CCAUREC ] ;
         ID       110 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 2 ]

      REDEFINE GET aGet[ _DFECENT ] VAR aTmp[ _DFECENT ] ;
         ID       131 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 2 ]

      REDEFINE GET aGet[ _CNUMDOC ] VAR aTmp[ _CNUMDOC ] ;
         ID       142 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 2 ]

      /*
      Regimen de IGIC-----------------------------------------------------------
      */

      REDEFINE RADIO aGet[ _NREGIVA ] VAR aTmp[ _NREGIVA ] ;
         ID       270, 271, 272, 273 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _CCODDLG ] VAR aTmp[ _CCODDLG ] ;
         ID       300 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]

      REDEFINE GET oGet[ 6 ] VAR cGet[ 6 ] ;
         ID       301 ;
         WHEN     ( .f. ) ;
         OF       oFld:aDialogs[2]


      REDEFINE GET aGet[ _CCODPRO ] VAR aTmp[ _CCODPRO ] ;
         ID       170 ;
         PICTURE  "@R ###.######" ;
			COLOR 	CLR_GET ;
         WHEN     ( nLenCuentaContaplus() != 0 .AND. nMode != ZOOM_MODE ) ;
         VALID    ( ChkProyecto( aTmp[ _CCODPRO ], oGet[ 4 ] ), .t. );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwProyecto( aGet[ _CCODPRO ], oGet[ 4 ] ) );
         OF       oFld:aDialogs[2]

      REDEFINE GET oGet[ 4 ] VAR cGet[ 4 ] ;
         ID       171 ;
			WHEN 		.F.;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[2]

      REDEFINE GET aGet[ _NBULTOS ] VAR aTmp[ _NBULTOS ] ;
         ID       132 ;
         PICTURE  "999999" ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[2]

      /*
      Campo para los comentarios---------------------------------------------
      */

      REDEFINE GET aGet[_MCOMENT] VAR aTmp[_MCOMENT];
			MEMO ;
         ID       210 ;
			COLOR 	CLR_GET ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[2]

      /*
		Redefine de la Zona de pagos-------------------------------------------
      */

      oBrwPgo                 := IXBrowse():New( oFld:aDialogs[2] )

      oBrwPgo:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwPgo:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwPgo:cAlias          := dbfTmpPgo

      oBrwPgo:nMarqueeStyle   := 5
      oBrwPgo:cName           := "Pagos de facturas rectifiactivas de proveedor"

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Pg. Pagado"
            :bStrData         := {|| "" }
            :bBmpData         := {|| nEstadoRecibo( dbfTmpPgo ) }
            :nWidth           := 22
            :AddResource( "Cnt16" )
            :AddResource( "Sel16" )
            :AddResource( "UndoRed16" )
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Cn. Contabilizado"
            :bStrData         := {|| "" }
            :bEditValue       := {|| ( dbfTmpPgo )->lConPgo }
            :nWidth           := 22
            :SetCheck( { "Sel16", "Nil16" } )
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Sesi�n"
            :bEditValue       := {|| Trans( ( dbfTmpPgo )->cTurRec, "######" ) }
            :nWidth           := 40
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( ( dbfTmpPgo )->dPreCob ) }
            :nWidth           := 75
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Vencimiento"
            :bEditValue       := {|| Dtoc( ( dbfTmpPgo )->dFecVto ) }
            :lHide            := .t.
            :nWidth           := 70
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Cobro"
            :bEditValue       := {|| Dtoc( ( dbfTmpPgo )->dEntrada ) }
            :nWidth           := 75
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| ( dbfTmpPgo )->cDescrip }
            :nWidth           := 175
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Importe"
            :bEditValue       := {|| nTotRecPrv( dbfTmpPgo, dbfDiv, nil, .t. ) }
            :nWidth           := 85
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
         end with

         with object ( oBrwPgo:AddCol() )
            :cHeader          := "Divisa"
            :bEditValue       := {|| cSimDiv( ( dbfTmpPgo )->cDivPgo, dbfDiv ) }
            :nWidth           := 60
         end with

         if nMode != ZOOM_MODE
            oBrwPgo:bLDblClick   := {|| ExtEdtRecPrv( dbfTmpPgo, dbfFacPrvT, dbfFacPrvL, dbfFPago, dbfIva, dbfDiv, oBanco, oBandera ), oBrwPgo:Refresh(), RecalculaTotal( aTmp ) }
         end if

      oBrwPgo:CreateFromResource( 220 )

      REDEFINE BUTTON ;
			ID 		501 ;
			OF 		oFld:aDialogs[2];
			WHEN 		( nMode == EDIT_MODE ) ;
         ACTION   ( ExtEdtRecPrv( dbfTmpPgo, dbfFacPrvT, dbfFacPrvL, dbfFPago, dbfIva, dbfDiv, oBanco, oBandera ), oBrwPgo:Refresh(), RecalculaTotal( aTmp ) )

		REDEFINE BUTTON ;
			ID 		502 ;
			OF 		oFld:aDialogs[2];
			WHEN 		( nMode == EDIT_MODE ) ;
         ACTION   ( ExtDelRecPrv( dbfTmpPgo ), oBrwPgo:Refresh(), RecalculaTotal( aTmp ) )

      REDEFINE BUTTON ;
         ID       505 ;
         OF       oFld:aDialogs[2];
         WHEN     ( nMode == EDIT_MODE ) ;
         ACTION   ( PrnRecPrv( ( dbfTmpPgo )->cSerFac + Str( ( dbfTmpPgo )->nNumFac ) + ( dbfTmpPgo )->cSufFac + Str( ( dbfTmpPgo )->nNumRec ), .f. ) )

      REDEFINE BUTTON ;
         ID       506 ;
         OF       oFld:aDialogs[2];
         WHEN     ( nMode == EDIT_MODE ) ;
         ACTION   ( VisRecPrv( ( dbfTmpPgo )->cSerFac + Str( ( dbfTmpPgo )->nNumFac ) + ( dbfTmpPgo )->cSufFac + Str( ( dbfTmpPgo )->nNumRec ), .f. ) )

      REDEFINE SAY oGetTotPg VAR nTotFac ;
         ID       405 ;
         OF       oFld:aDialogs[2]

		REDEFINE SAY oGetPgd VAR nGetPgd ;
			ID 		400 ;
			OF 		oFld:aDialogs[2]

      REDEFINE SAY oGetPdt VAR ( nTotFac - nGetPgd ) ;
			ID 		410 ;
			OF 		oFld:aDialogs[2]

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
      Caja de dialogo de incidencias
      */

      oBrwInc                 := IXBrowse():New( oFld:aDialogs[ 3 ] )

      oBrwInc:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwInc:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwInc:cAlias          := dbfTmpInc

      oBrwInc:nMarqueeStyle   := 5
      oBrwInc:cName           := "Incidencias de facturas rectificativas de proveedor"

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Resuelta"
            :bStrData         := {|| "" }
            :bEditValue       := {|| ( dbfTmpInc )->lListo }
            :nWidth           := 60
            :SetCheck( { "Sel16", "Cnt16" } )
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "C�digo"
            :bEditValue       := {|| ( dbfTmpInc )->cCodTip }
            :nWidth           := 80
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Incidencia"
            :bEditValue       := {|| cNomInci( ( dbfTmpInc )->cCodTip, dbfInci ) }
            :nWidth           := 220
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Fecha"
            :bEditValue       := {|| Dtoc( ( dbfTmpInc )->dFecInc ) }
            :nWidth           := 90
         end with

         with object ( oBrwInc:AddCol() )
            :cHeader          := "Descripci�n"
            :bEditValue       := {|| ( dbfTmpInc )->mDesInc }
            :nWidth           := 425
         end with

         if nMode != ZOOM_MODE
            oBrwInc:bLDblClick   := {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) }
         end if

         oBrwInc:CreateFromResource( 210 )

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

      /*
      Caja de dialogo de incidencias
      */

      oBrwDoc                 := TXBrowse():New( oFld:aDialogs[ 4 ] )

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
         ACTION   ( ShellExecute( oDlg:hWnd, "open", rTrim( ( dbfTmpDoc )->cRuta ) ) )

     REDEFINE BUTTON ;
         ID       10 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( RecalculaFacturaRectificativas( aTmp, oDlg ), ( oBrwLin:Refresh() ), RecalculaTotal( aTmp ) )

      REDEFINE BUTTON oBtnOk;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( EndTrans( aTmp, aGet, oBrw, oBrwLin, nMode, nDinDiv, oDlg, oFld ) )

      REDEFINE BUTTON ;
         ID       3 ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( if( EndTrans( aTmp, aGet, oBrw, oBrwLin, nMode, nDinDiv, oDlg, oFld ), GenRctPrv( IS_PRINTER ), ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( If( ExitNoSave( nMode, dbfTmp ), ( oDlg:end() ), ) )

   if nMode != ZOOM_MODE
      oFld:aDialogs[1]:AddFastKey( VK_F2, {|| AppDeta( oBrwLin, bEdtDet, aTmp) } )
      oFld:aDialogs[1]:AddFastKey( VK_F3, {|| EdtDeta( oBrwLin, bEdtDet, aTmp ) } )
      oFld:aDialogs[1]:AddFastKey( VK_F4, {|| WinDelRec( oBrwLin, dbfTmp, {|| delDeta() }, {|| RecalculaTotal( aTmp ) } ) } )

      oFld:aDialogs[2]:AddFastKey( VK_F3, {|| ExtEdtRecPrv( dbfTmpPgo, dbfFacPrvT, dbfFacPrvL, dbfFPago, dbfIva, dbfDiv, oBanco, oBandera ), oBrwPgo:Refresh(), RecalculaTotal( aTmp ) } )
      oFld:aDialogs[2]:AddFastKey( VK_F4, {|| ExtDelRecPrv( dbfTmpPgo ), oBrwPgo:Refresh(), RecalculaTotal( aTmp ) } )

      oFld:aDialogs[3]:AddFastKey( VK_F2, {|| WinAppRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
      oFld:aDialogs[3]:AddFastKey( VK_F3, {|| WinEdtRec( oBrwInc, bEdtInc, dbfTmpInc, nil, nil, aTmp ) } )
      oFld:aDialogs[3]:AddFastKey( VK_F4, {|| DbDelRec( oBrwInc, dbfTmpInc, nil, nil, .t. ) } )

      oFld:aDialogs[4]:AddFastKey( VK_F2, {|| WinAppRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
      oFld:aDialogs[4]:AddFastKey( VK_F3, {|| WinEdtRec( oBrwDoc, bEdtDoc, dbfTmpDoc, nil, nil, aTmp ) } )
      oFld:aDialogs[4]:AddFastKey( VK_F4, {|| DbDelRec( oBrwDoc, dbfTmpDoc, nil, nil, .f. ) } )

      oDlg:AddFastKey( VK_F5,             {|| EndTrans( aTmp, aGet, oBrw, oBrwLin, nMode, nDinDiv, oDlg, oFld ) } )
      oDlg:AddFastKey( VK_F6,             {|| if( EndTrans( aTmp, aGet, oBrw, oBrwLin, nMode, nDinDiv, oDlg, oFld ), GenRctPrv( IS_PRINTER ), ) } )
      oDlg:AddFastKey( 65,                {|| if( GetKeyState( VK_CONTROL ), CreateInfoArticulo(), ) } )
   end if

   oDlg:AddFastKey ( VK_F1, {|| GoHelp() } )

   do case
      case nMode == APPD_MODE .and. lRecogerUsuario() .and. Empty( cCodArt )
         oDlg:bStart := {|| if( lGetUsuario( aGet[ _CCODUSR ], dbfUsr ), , oDlg:end() ) }

      case nMode == APPD_MODE .and. lRecogerUsuario() .and. !Empty( cCodArt )
         oDlg:bStart := {|| if( lGetUsuario( aGet[ _CCODUSR ], dbfUsr ), AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt ), oDlg:end() ) }

      case nMode == APPD_MODE .and. !lRecogerUsuario() .and. !Empty( cCodArt )
         oDlg:bStart := {|| AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt ) }

   end case

	ACTIVATE DIALOG oDlg	;
      ON INIT     (  if( !Empty( cNumFac ), aGet[ _CNUMFAC ]:lValid(), ),;
                     EdtRecMenu( aTmp, oDlg ),;
                     ShowKitRctPrv( dbfRctPrvT, oBrwLin, cCodPrv, dbfTmpInc, aGet, aTmp, aControl, oSayGas, oSayLabels, oBrwIva ),;
                     oBrwLin:Load(),;
                     oBrwPgo:Load(),;
                     oBrwInc:Load() ) ;
      ON PAINT    (  RecalculaTotal( aTmp ) );
		CENTER

   oBmpEmp:End()
   oBmpGeneral:End()

   ( dbfRctPrvT )->( OrdSetFocus( nOrd ) )

   /*
   Chequea si la factura esta liquidada----------------------------------------
   */

   ChkLqdRctPrv( nil, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfIva, dbfDiv )

   /*
   Cerramos los ficheros-------------------------------------------------------
   */

   KillTrans( oBrwLin )

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function RecalculaFacturaRectificativas( aTmp, oDlg )

   local nRecNum
   local nPreCom

   if !ApoloMsgNoYes( "�Atenci�n!,"                                      + CRLF + ;
                  "todos los precios se recalcular�n en funci�n de"  + CRLF + ;
                  "los valores en las bases de datos.",;
                  "� Desea proceder ?" )
      return nil
   end if

   oDlg:Disable()

   ( dbfArticulo )->( ordSetFocus( "Codigo" ) )

   nRecNum                          := ( dbfTmp )->( RecNo() )

   ( dbfTmp )->( dbGotop() )
   while !( dbfTmp )->( eof() )

      /*
      Ahora buscamos por el codigo interno
      */

      nPreCom                       := nComPro( ( dbfTmp )->cRef, ( dbfTmp )->cCodPr1, ( dbfTmp )->cValPr1, ( dbfTmp )->cCodPr2, ( dbfTmp )->cValPr2, dbfArtCom )

      if nPrecom  != 0

         ( dbfTmp )->nPreUnit       := nPreCom

      else

         if uFieldEmpresa( "lCosPrv", .f. )
            nPreCom                 := nPreArtPrv( aTmp[ _CCODPRV ], ( dbfTmp )->cRef, dbfArtPrv )
         end if

         if nPreCom != 0
            ( dbfTmp )->nPreUnit    := nPreCom
         else

            ( dbfTmp )->nPreUnit    := nCosto( ( dbfTmp )->cRef, dbfArticulo, dbfKit, .f., aTmp[ _CDIVFAC ], dbfDiv )
         end if

      end if

      ( dbfTmp )->( dbSkip() )

   end while

   ( dbfTmp )->( dbGoTo( nRecNum ) )

   oDlg:Enable()

return nil

//----------------------------------------------------------------------------//

Static Function EdtPgo( aTmp, aGet, dbfTmpPgo, oBrw, dbfDiv, oBandera, nMode, aTmpFac )

	local oDlg
   local oGetPrv
   local cGetPrv        := RetProvee( aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODPRV" ) ) ], dbfPrv )
   local oSay
   local cSay           := Num2Text( aTmp[ ( dbfTmpPgo )->( FieldPos( "NIMPORTE" ) ) ] )
   local oBmpDiv
   local oGetSubCta
   local cGetSubCta
   local cPirDiv        := cPirDiv( aTmp[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ], dbfDiv )
   local nDinDiv        := nRinDiv( aTmp[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ], dbfDiv )
   local nImpOld        := Abs( aTmp[ ( dbfTmpPgo )->( FieldPos( "NIMPORTE" ) ) ] )

   if Empty( aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODCAJ" ) ) ] )
      aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODCAJ" ) ) ]   := oUser():cCaja()
   end if

   DEFINE DIALOG oDlg RESOURCE "PGO_PRV" TITLE LblTitle( nMode ) + "recibos de proveedores"

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "DPRECOB" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "DPRECOB" ) ) ];
			ID 		100 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  aGet[ ( dbfTmpPgo )->( FieldPos( "DPRECOB" ) ) ]:cText( Calendario( aTmp[ ( dbfTmpPgo )->( FieldPos( "DPRECOB" ) ) ] ) ) ;
         COLOR    CLR_GET ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "DFECVTO" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "DFECVTO" ) ) ];
         ID       250 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  aGet[ ( dbfTmpPgo )->( FieldPos( "DFECVTO" ) ) ]:cText( Calendario( aTmp[ ( dbfTmpPgo )->( FieldPos( "DFECVTO" ) ) ] ) ) ;
         COLOR    CLR_GET ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "DENTRADA" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "DENTRADA" ) ) ];
			ID 		110 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  aGet[ ( dbfTmpPgo )->( FieldPos( "DENTRADA" ) ) ]:cText( Calendario( aTmp[ ( dbfTmpPgo )->( FieldPos( "DENTRADA" ) ) ] ) ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPRV" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODPRV" ) ) ];
         ID       120 ;
         WHEN     ( .f. ) ;
			OF 		oDlg

      REDEFINE GET oGetPrv VAR cGetPrv ;
         ID       121 ;
         WHEN     .f.;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ] ;
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ] ;
         ID       310 ;
         IDTEXT   311 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			PICTURE  "@!" ;
         VALID    ( cFPago( aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ], dbfFPago, aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ]:oHelpText ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwFPago( aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ], aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ]:oHelpText ) ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ] ;
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ];
         ID       320 ;
         IDTEXT   321 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oBanco:Existe( aGet[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ], aGet[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ]:oHelpText, "cNomBnc", .t., .t., "0" ) );
         ON HELP  ( oBanco:Buscar( aGet[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ] ) ) ;
         BITMAP   "LUPA" ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CDESCRIP" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CDESCRIP" ) ) ];
         ID       140 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CPGDOPOR" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CPGDOPOR" ) ) ];
         ID       150 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         COLOR    CLR_GET ;
			OF 		oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "NIMPORTE" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "NIMPORTE" ) ) ];
         ID       180 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oSay:SetText( Num2Text( aTmp[ ( dbfTmpPgo )->( FieldPos( "NIMPORTE" ) ) ] ) ), .t. ) ;
         COLOR    CLR_GET ;
         PICTURE  ( cPirDiv ) ;
			OF 		oDlg

      REDEFINE CHECKBOX aGet[ ( dbfTmpPgo )->( FieldPos( "LRECIMP" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "LRECIMP" ) ) ];
         ID       160 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ];
         WHEN     ( .f. ) ;
         VALID    ( cDivOut( aGet[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ], oBmpDiv, aGet[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ], @cPirDiv, @nDinDiv, nil, nil, nil, nil, nil, dbfDiv, oBandera ) );
         PICTURE  "@!";
         ID       170 ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         ON HELP  BrwDiv( aGet[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ], oBmpDiv, aGet[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ], dbfDiv, oBandera ) ;
         OF       oDlg

		REDEFINE BITMAP oBmpDiv ;
         ID       171;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ];
			WHEN		( .F. ) ;
         ID       172 ;
         VALID    ( aTmp[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ] > 0 ) ;
         PICTURE  "@E 999,999.9999" ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE CHECKBOX aGet[ ( dbfTmpPgo )->( FieldPos( "LCOBRADO" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "LCOBRADO" ) ) ];
         ID       220 ;
         ON CHANGE( aGet[ ( dbfTmpPgo )->( FieldPos( "DENTRADA" ) ) ]:cText( if( aTmp[ ( dbfTmpPgo )->( FieldPos( "LCOBRADO" ) ) ], date(), ctod("") ) ) ) ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE CHECKBOX aGet[ ( dbfTmpPgo )->( FieldPos( "LNOTARQUEO" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "LNOTARQUEO" ) ) ];
         ID       330 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oDlg

      REDEFINE SAY oSay VAR cSay ;
         ID       190 ;
         COLOR    CLR_GET ;
         OF       oDlg

      REDEFINE GET aGet[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ];
         VAR      aTmp[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ];
         ID       240 ;
			COLOR 	CLR_GET ;
         PICTURE  ( Replicate( "X", nLenSubcuentaContaplus() ) ) ;
         WHEN     ( nLenCuentaContaplus() != 0 .AND. nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwChkSubCta( aGet[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ], oGetSubCta ) ) ;
         VALID    ( MkSubCta( aGet[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ], { aTmp[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ] }, oGetSubCta ) );
         OF       oDlg

		REDEFINE GET oGetSubCta VAR cGetSubCta ;
         ID       241 ;
			COLOR 	CLR_GET ;
			WHEN 		.F. ;
         OF       oDlg

      /*
      Botones__________________________________________________________________
      */

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( EndPgo( nImpOld, aTmp, aGet, dbfTmpPgo, oBrw, nMode, oDlg ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

      REDEFINE BUTTON ;
         ID       998 ;
			OF 		oDlg ;
         ACTION   ( GoHelp() )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| EndPgo( nImpOld, aTmp, aGet, dbfTmpPgo, oBrw, nMode, oDlg ) } )
   end if

   oDlg:AddFastKey( VK_F1, {|| GoHelp() } )

   ACTIVATE DIALOG oDlg CENTER;
      ON INIT ( EdtRecPgoMenu( aTmp, aGet, oDlg ),;
                aGet[ ( dbfTmpPgo )->( FieldPos( "CCODBNC" ) ) ]:lValid(),;
                aGet[ ( dbfTmpPgo )->( FieldPos( "CCODPGO" ) ) ]:lValid() )

   oMnuPgo:End()
   oBmpDiv:End()

RETURN ( oDlg:nResult == IDOK )

//---------------------------------------------------------------------------//

Static Function EdtRecPgoMenu( aTmp, aGet, oDlg )

   local cCodPrv  := aTmp[ ( dbfTmpPgo )->( FieldPos( "CCODPRV" ) ) ]

   MENU oMnuPgo

      MENUITEM    "&1. Rotor"

         MENU

            MENUITEM "&1. Modificar proveedor";
            MESSAGE  "Modifica el proveedor de la factura rectificativa" ;
            RESOURCE "Businessman_16";
            ACTION   ( EdtPrv( cCodPrv ) )

            MENUITEM "&2. Informe proveedor";
            MESSAGE  "Informe del proveedor de la factura" ;
            RESOURCE "Info16";
            ACTION   ( InfProveedor( cCodPrv ) )

         ENDMENU

   ENDMENU

   oDlg:SetMenu( oMnuPgo )

   aGet[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ]:lValid()
   aGet[ ( dbfTmpPgo )->( FieldPos( "CCTAREC" ) ) ]:lValid()

   aGet[ ( dbfTmpPgo )->( FieldPos( "DPRECOB" ) ) ]:SetFocus()

Return ( oMnuPgo )

//---------------------------------------------------------------------------//

Static Function EndPgo( nImpOld, aTmp, aGet, dbfTmpPgo, oBrw, nMode, oDlg )

   local nCon
   local nImp
   local nRec        := ( dbfTmpPgo )->( Recno() )
   local lImpNeg     := aTmp[ ( dbfTmpPgo )->( FieldPos( "nImporte" ) ) ] < 0
   local nImpAct     := Abs( aTmp[ ( dbfTmpPgo )->( FieldPos( "nImporte" ) ) ] )

   if nImpAct > nImpOld
      msgStop( "El importe no puede ser superior al actual." )
      return nil
   end if

   aTmp[ ( dbfTmpPgo )->( FieldPos( "DFECCHG" ) ) ]  := GetSysDate()
   aTmp[ ( dbfTmpPgo )->( FieldPos( "CTIMCHG" ) ) ]  := Time()

   /*
   Comprobamos q los importes sean distintos-----------------------------------
   */

   if nImpAct != nImpOld

      /*
      El importe ha cambiado por tanto debemos de hacer un nuevo recibo por la diferencia
      */

      nImp                       := ( nImpOld - nImpAct ) * if( lImpNeg, - 1 , 1 )

      /*
      A�adimos el nuevo recibo
      */

      ( dbfTmpPgo )->( dbAppend() )

      nCon                       := ( dbfTmpPgo )->( LastRec() )

#ifndef __PDA__
      ( dbfTmpPgo )->cTurRec     := cCurSesion()
#endif

      ( dbfTmpPgo )->cSerFac     := aTmp[ ( dbfTmpPgo )->( FieldPos( "cSerFac"  ) ) ]
      ( dbfTmpPgo )->nNumFac     := aTmp[ ( dbfTmpPgo )->( FieldPos( "nNumFac" ) ) ]
      ( dbfTmpPgo )->cSufFac     := aTmp[ ( dbfTmpPgo )->( FieldPos( "cSufFac" ) ) ]
      ( dbfTmpPgo )->nNumRec     := nCon
      ( dbfTmpPgo )->cTipRec     := "R"
      ( dbfTmpPgo )->cCodCaj     := aTmp[ ( dbfTmpPgo )->( FieldPos( "cCodCaj" ) ) ]
      ( dbfTmpPgo )->cCodPrv     := aTmp[ ( dbfTmpPgo )->( FieldPos( "cCodPrv" ) ) ]
      ( dbfTmpPgo )->dEntrada    := Ctod( "" )
      ( dbfTmpPgo )->nImporte    := nImp
      ( dbfTmpPgo )->cDescrip    := "Recibo n�" + AllTrim( Str( nCon ) ) + " de factura rectificativa " + aTmp[ ( dbfTmpPgo )->( FieldPos( "cSerFac" ) ) ] + '/' + AllTrim( Str( aTmp[ ( dbfTmpPgo )->( FieldPos( "nNumFac" ) ) ] ) ) + '/' + aTmp[ ( dbfTmpPgo )->( FieldPos( "cSufFac" ) ) ]
      ( dbfTmpPgo )->dPreCob     := dFecRctPrv( aTmp[ ( dbfTmpPgo )->( FieldPos( "cSerFac" ) ) ] + Str( aTmp[ ( dbfTmpPgo )->( FieldPos( "nNumFac" ) ) ] ) + aTmp[ ( dbfTmpPgo )->( FieldPos( "cSufFac" ) ) ], dbfRctPrvT )
      ( dbfTmpPgo )->dFecVto     := dFecRctPrv( aTmp[ ( dbfTmpPgo )->( FieldPos( "cSerFac" ) ) ] + Str( aTmp[ ( dbfTmpPgo )->( FieldPos( "nNumFac" ) ) ] ) + aTmp[ ( dbfTmpPgo )->( FieldPos( "cSufFac" ) ) ], dbfRctPrvT )
      ( dbfTmpPgo )->cPgdoPor    := ""
      ( dbfTmpPgo )->lCobrado    := .f.
      ( dbfTmpPgo )->cDivPgo     := aTmp[ ( dbfTmpPgo )->( FieldPos( "CDIVPGO" ) ) ]
      ( dbfTmpPgo )->nVdvPgo     := aTmp[ ( dbfTmpPgo )->( FieldPos( "NVDVPGO" ) ) ]
      ( dbfTmpPgo )->lConPgo     := .f.

      ( dbfTmpPgo )->( dbUnLock() )

   end if

   ( dbfTmpPgo )->( dbGoTo( nRec ) )

   WinGather( aTmp, aGet, dbfTmpPgo, oBrw, nMode )

   oDlg:End( IDOK )

Return nil

//---------------------------------------------------------------------------//

Static Function DelCobPrv( oBrw, dbfRctPrvP )

   if ( dbfRctPrvP )->lCobrado .and. !oUser():lAdministrador()
      msgStop( "Este recibo est� cobrado.", "Imposible eliminar" )
      return .f.
   end if

   if oUser():lNotConfirmDelete() .or. ApoloMsgNoYes("� Desea eliminar definitivamente este registro ?", "Confirme supersi�n" )
      DelRecno( dbfRctPrvP, oBrw, .f. )
   end if

return .t.

//---------------------------------------------------------------------------//

Static Function EdtRecMenu( aTmp, oDlg )

   MENU oMnuRec

      MENUITEM    "&1. Rotor"

         MENU

            if !lExternal

            MENUITEM    "&1. Visualizar albar�n";
               MESSAGE  "Visualiza la factura del la que proviene" ;
               RESOURCE "Document_plain_businessman_16" ;
               ACTION   ( if( !Empty( ( dbfRctPrvT )->cNumFac ), ZooFacPrv( ( dbfRctPrvT )->cNumFac ), MsgStop( "La factura rectificativa no proviene de una factura" ) ))

            SEPARATOR

            MENUITEM    "&2. Modificar proveedor";
               MESSAGE  "Modificar la ficha del proveedor" ;
               RESOURCE "Businessman_16" ;
               ACTION   ( EdtPrv( aTmp[ _CCODPRV ] ) )

            MENUITEM    "&3. Informe de proveedor";
               MESSAGE  "Abrir el informe del proveedor" ;
               RESOURCE "Info16" ;
               ACTION   ( InfProveedor( aTmp[ _CCODPRV ] ) );

            SEPARATOR

            end if

            MENUITEM    "&4. Informe del documento";
               MESSAGE  "Abrir el informe del documento" ;
               RESOURCE "Info16" ;
               ACTION   ( TTrazaDocumento():Activate( FAC_PRV, ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )

         ENDMENU

   ENDMENU

   oDlg:SetMenu( oMnuRec )

Return ( oMnuRec )

//----------------------------------------------------------------------------//

Static Function EdtInc( aTmp, aGet, dbfRctPrvI, oBrw, bWhen, bValid, nMode, aTmpFac )

   local oDlg
   local oNomInci
   local cNomInci       := RetFld( aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ], dbfInci )

   if nMode == APPD_MODE

      aTmp[ _CSERFAC  ] := aTmpFac[ _CSERFAC  ]
      aTmp[ _NNUMFAC  ] := aTmpFac[ _NNUMFAC ]
      aTmp[ _CSUFFAC  ] := aTmpFac[ _CSUFFAC ]

      if IsMuebles()
         aTmp[ ( dbfTmpInc )->( FieldPos( "lAviso" ) ) ]  := .t.
      end if

   end if

   DEFINE DIALOG oDlg RESOURCE "INCIDENCIA" TITLE LblTitle( nMode ) + "incidencias de facturas rectificativas de proveedores"

      REDEFINE GET aGet[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         VAR      aTmp[ ( dbfTmpInc )->( FieldPos( "cCodTip" ) ) ];
         ID       120 ;
         WHEN     ( nMode != ZOOM_MODE );
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

//---------------------------------------------------------------------------//

Static Function EdtDoc( aTmp, aGet, dbfAlbPrvD, oBrw, bWhen, bValid, nMode, aTmpLin )

   local oDlg
   local oRuta
   local oNombre
   local oObservacion

   DEFINE DIALOG oDlg RESOURCE "DOCUMENTOS" TITLE LblTitle( nMode ) + "documento de facturas a proveedor"

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

//---------------------------------------------------------------------------//


/*
Edita las lineas de Detalle
*/

STATIC FUNCTION EdtDet( aTmp, aGet, dbfRctPrvL, oBrw, aTmpFac, cCodArt, nMode )

	local oDlg
	local oFld
   local oBtn
	local oTotal
   local cSay2
   local oSay2
   local oBmp
   local cGetIra           := Space( 50 )
   local oGetIra
   local oBrwPrp
   local oSayPr1
   local oSayPr2
   local oSayVp1
   local oSayVp2
   local cSayVp1           := ""
   local cSayVp2           := ""
   local cSayPr1           := ""
   local cSayPr2           := ""
   local nTotal            := 0
   local nStkAct           := 0
   local oStkAct
   local oBtnSer

   /*
   Este valor los guaradamos para detectar los posibles cambios----------------
   */

   cOldCodArt              := aTmp[ _CREF ]
   cOldPrpArt              := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]
   cOldUndMed              := aTmp[ _CUNIDAD ]

   do case
   case nMode == APPD_MODE

      aTmp[ _NUNICAJA ]    := 1
      aTmp[ _CALMLIN  ]    := aTmpFac[ _CCODALM ]
      aTmp[ _NNUMLIN  ]    := nLastNum( dbfTmp )
      aTmp[ _DFECCAD  ]    := Ctod( "" )

      if !Empty( cCodArt )
         aTmp[ _CREF ]     := cCodArt
      end if

   case nMode == EDIT_MODE

      if !Empty( aTmp[ _CREF ] )
         ( dbfArticulo )->( dbSeek( aTmp[ _CREF ] ) )
      end if

   end case

   /*
   Caja de dialogo-------------------------------------------------------------
   */

   DEFINE DIALOG oDlg RESOURCE "LALBPRV" TITLE LblTitle( nMode ) + "lineas a facturas de proveedores"

      REDEFINE FOLDER oFld ;
         ID       400 ;
         OF       oDlg ;
         PROMPT   "&General",;
                  "&Stock",;
                  "&Observaciones" ;
         DIALOGS  "LFACPRV_7",;
                  "LALBPRV_3",;
                  "LFACPRV_5"

      REDEFINE GET aGet[ _CREF ] VAR aTmp[ _CREF ];
			ID 		110 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( LoaArt( aGet, aTmp, aTmpFac, oFld, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oBmp, oBrwPrp, oGetIra, oDlg, oStkAct, oTotal ) );
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwArticulo( aGet[_CREF], aGet[_CDETALLE] ) ) ;
			OF 		oFld:aDialogs[1]

      /*
      Lotes
      ------------------------------------------------------
      */

      REDEFINE GET aGet[ _CLOTE ] VAR aTmp[ _CLOTE ];
         ID       112 ;
         IDSAY    111 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			OF 		oFld:aDialogs[1]

      aGet[ _CLOTE ]:bValid   := {|| oStock:nPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oStkAct ), .t. }

      REDEFINE GET aGet[ _DFECCAD ] VAR aTmp[ _DFECCAD ];
         ID       113 ;
         IDSAY    114 ;
			SPINNER ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         OF       oFld:aDialogs[1]

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

      REDEFINE GET aGet[ _NIVA ] VAR aTmp[ _NIVA ] ;
			ID 		130 ;
         WHEN     ( lModIva() .AND. nMode != ZOOM_MODE ) ;
			PICTURE 	"@E 99.99" ;
			COLOR 	CLR_GET ;
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         VALID    ( lTiva( dbfIva, aTmp[ _NIVA ], @aTmp[ _NREQ ] ) );
         BITMAP   "LUPA" ;
         ON HELP  ( BrwIva( aGet[ _NIVA ], dbfIva, , .t. ) ) ;
			OF 		oFld:aDialogs[1]

      /*
      Propiedades
      -------------------------------------------------------------------------
      */

      REDEFINE GET aGet[_CVALPR1] VAR aTmp[_CVALPR1];
         ID       220 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
			COLOR 	CLR_GET ;
         BITMAP   "LUPA" ;
         VALID    ( if( lPrpAct( aGet[ _CVALPR1 ], oSayVp1, aTmp[_CCODPR1 ], dbfTblPro ),;
                        LoaArt( aGet, aTmp, aTmpFac, oFld, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oBmp, oBrwPrp, oGetIra, oDlg, oStkAct, oTotal ),;
                        .f. ) ) ;
         ON HELP  ( brwPrpAct( aGet[ _CVALPR1 ], oSayVp1, aTmp[ _CCODPR1 ] ) ) ;
			OF 		oFld:aDialogs[1]

         aGet[ _CVALPR1 ]:bChange   := {|| aGet[ _CVALPR1 ]:Assign(), oStock:nPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oStkAct ) }

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
         VALID    ( if( lPrpAct( aGet[ _CVALPR2 ], oSayVp2, aTmp[ _CCODPR2 ], dbfTblPro ),;
                        LoaArt( aGet, aTmp, aTmpFac, oFld, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oBmp, oBrwPrp, oGetIra, oDlg, oStkAct, oTotal ),;
                        .f. ) ) ;
         ON HELP  ( brwPrpAct( aGet[ _CVALPR2 ], oSayVp2, aTmp[ _CCODPR2 ] ) ) ;
			OF 		oFld:aDialogs[1]

         aGet[ _CVALPR2 ]:bChange   := {|| aGet[ _CVALPR2 ]:Assign(), oStock:nPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oStkAct ) }

      REDEFINE SAY oSayPr2 VAR cSayPr2;
         ID       231 ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSayVp2 VAR cSayVp2;
         ID       232 ;
         WHEN     .f. ;
         COLOR    CLR_GET ;
         OF       oFld:aDialogs[1]

      REDEFINE LISTBOX oBrwPrp ;
         FIELDS   "" ;
         HEAD     "" ;
         ID       100 ;
         OF       oFld:aDialogs[1]

      /*
      fin de propiedades
      -------------------------------------------------------------------------
      */

      REDEFINE GET aGet[_CUNIDAD] VAR aTmp[_CUNIDAD] ;
         ID       152 ;
         IDTEXT   153 ;
         BITMAP   "LUPA" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( oUndMedicion:Existe( aGet[ _CUNIDAD ], aGet[ _CUNIDAD ]:oHelpText, "cNombre" ), ValidaMedicion( aTmp, aGet) );
         ON HELP  ( oUndMedicion:Buscar( aGet[ _CUNIDAD ] ), ValidaMedicion( aTmp, aGet ) ) ;
         OF       oFld:aDialogs[1]

      // Campos de las descripciones de la unidad de medici�n

      REDEFINE GET aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ] ;
         VAR      aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ] ;
         ID       420 ;
         IDSAY    421 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:oSay:SetColor( CLR_BLUE )

      REDEFINE GET aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ] ;
         VAR      aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ] ;
         ID       430 ;
         IDSAY    431 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:oSay:SetColor( CLR_BLUE )

      REDEFINE GET aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ] ;
         VAR      aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ] ;
         ID       440 ;
         IDSAY    441 ;
         SPINNER ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         PICTURE  MasUnd() ;
         OF       oFld:aDialogs[1]

      aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:oSay:SetColor( CLR_BLUE )

		REDEFINE GET aGet[_NCANENT] VAR aTmp[_NCANENT] ;
			ID 		140 ;
         WHEN     ( lUseCaj() .AND. nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
			SPINNER ;
			PICTURE 	cPicUnd ;
         OF       oFld:aDialogs[1] ;
         IDSAY    141

		REDEFINE GET aGet[_NUNICAJA] VAR aTmp[_NUNICAJA] ;
			ID 		150 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
			SPINNER ;
			PICTURE 	cPicUnd;
         OF       oFld:aDialogs[1] ;
         IDSAY    151

		REDEFINE GET aGet[_NPREUNIT] VAR aTmp[_NPREUNIT] ;
			SPINNER ;
			ID 		160 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         COLOR    CLR_GET ;
			PICTURE 	cPinDiv ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NDTOLIN] VAR aTmp[_NDTOLIN] ;
			ID 		180 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         COLOR    CLR_GET ;
			SPINNER ;
         PICTURE  "@E 999.99" ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NDTOPRM] VAR aTmp[_NDTOPRM] ;
         ID       250 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         ON CHANGE( lCalcDeta( aTmp, aTmpFac, aGet, oTotal ) );
         COLOR    CLR_GET ;
			SPINNER ;
			PICTURE 	"@E 99.99" ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_NDTORAP] VAR aTmp[_NDTORAP] ;
         ID       260 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
			SPINNER ;
			PICTURE	"@E 99.99" ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

      REDEFINE CHECKBOX aGet[ _LGASSUP ] VAR aTmp[ _LGASSUP ] ;
         ID       460;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      aGet[ _LGASSUP ]:bChange   := {|| if( aTmp[ _LGASSUP ], ( aGet[ _NIVA ]:cText( 0 ), aGet[ _NIVA ]:HardDisable() ), ( aGet[ _NIVA ]:HardEnable() ) ) }

      REDEFINE GET oStkAct VAR nStkAct ;
         ID       190 ;
         WHEN     ( .f. );
         PICTURE  MasUnd() ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[ _CREFPRV ] VAR aTmp[ _CREFPRV ];
         ID       400 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

		REDEFINE GET oTotal VAR nTotal ;
			ID 		210 ;
         PICTURE  cPirDiv ;
			WHEN 		.F. ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET aGet[_CALMLIN] VAR aTmp[_CALMLIN]  ;
         ID       240 ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         VALID    ( cNomUbica( aTmp, aGet, dbfAlm ), cAlmacen( aGet[_CALMLIN], dbfAlm, oSay2 ), oStock:lPutStockActual( aTmp[ _CREF ], aTmp[ _CALMLIN ], aTmp[ _CVALPR1 ], aTmp[ _CVALPR2 ], aTmp[ _CLOTE ], aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oStkAct ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( Self, oSay2 ) ) ;
			COLOR 	CLR_GET ;
			OF 		oFld:aDialogs[1]

		REDEFINE GET oSay2 VAR cSay2 ;
			WHEN 		.F. ;
         ID       241 ;
			OF 		oFld:aDialogs[1]

      REDEFINE SAY aGet[_CCODUBI1] VAR aTmp[_CCODUBI1];
         ID       300 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CVALUBI1] VAR aTmp[_CVALUBI1] ;
         ID       270 ;
         BITMAP   "LUPA" ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON HELP  ( BrwUbiLin( aGet[_CVALUBI1], aGet[_CNOMUBI1], aTmp[_CCODUBI1], dbfUbicaL ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CNOMUBI1] VAR aTmp[_CNOMUBI1];
         WHEN     .F. ;
         ID       271 ;
         OF       oFld:aDialogs[1]

      REDEFINE SAY aGet[_CCODUBI2] VAR aTmp[_CCODUBI2];
         ID       310 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CVALUBI2] VAR aTmp[_CVALUBI2] ;
         ID       280 ;
         BITMAP   "LUPA" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ON HELP  ( BrwUbiLin( aGet[_CVALUBI2], aGet[_CNOMUBI2], aTmp[_CCODUBI2], dbfUbicaL ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CNOMUBI2] VAR aTmp[_CNOMUBI2];
         WHEN     .F. ;
         ID       281 ;
         OF       oFld:aDialogs[1]

      REDEFINE SAY aGet[_CCODUBI3] VAR aTmp[_CCODUBI3];
         ID       320 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CVALUBI3] VAR aTmp[_CVALUBI3] ;
         ID       290 ;
         BITMAP   "LUPA" ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ON HELP  ( BrwUbiLin( aGet[_CVALUBI3], aGet[_CNOMUBI3], aTmp[_CCODUBI3], dbfUbicaL ) ) ;
         OF       oFld:aDialogs[1]

      REDEFINE GET aGet[_CNOMUBI3] VAR aTmp[_CNOMUBI3];
         WHEN     .F. ;
         ID       291 ;
         OF       oFld:aDialogs[1]

      REDEFINE GET oGetIra VAR cGetIra;
         ID       410 ;
         IDSAY    411 ;
         BITMAP   "Lupa" ;
         ON HELP  ( SearchProperty( oGetIra, oBrwPrp ) ) ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      /*
      Segunda caja de di�logo _________________________________________________
      */

      REDEFINE RADIO aGet[ _NCTLSTK ] ;
         VAR      aTmp[ _NCTLSTK ] ;
         ID       350, 351, 352 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[ 2 ]

      REDEFINE GET aGet[_MOBSLIN] VAR aTmp[_MOBSLIN] ;
         MEMO ;
         ID       100 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[3]

      REDEFINE BUTTON oBtn;
         ID       IDOK ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( SaveDeta( aTmp, aGet, oBrw, oDlg, nMode, oTotal, oFld, aTmpFac, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oStkAct, oBrwPrp, oGetIra, oBtn, oBtnSer ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

      REDEFINE BUTTON ;
         ID       9 ;
         OF       oDlg ;
         ACTION   ( GoHelp() )

      REDEFINE BUTTON oBtnSer ;
         ID       552 ;
			OF 		oDlg ;
         ACTION   ( EditarNumeroSerie( aTmp, nMode ) )

   if nMode != ZOOM_MODE
      oDlg:AddFastKey( VK_F5, {|| oBtn:SetFocus(), oBtn:Click() } )
   end if

   oDlg:AddFastKey( VK_F6, {|| oBtnSer:Click() } )
   oDlg:AddFastKey( VK_F1, {|| GoHelp() } )

   oDlg:bStart    := {|| SetDlgMode( aGet, aTmp, oFld, aTmpFac, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oTotal, oBrwPrp, oGetIra ),;
                         aGet[ _CUNIDAD ]:lValid() }

	ACTIVATE DIALOG oDlg ;
      ON INIT     ( EdtDetMenu( aGet[ _CREF ], oDlg ) );
      CENTER

   EndDetMenu()

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

static Function cNomUbica( aTmp, aGet, dbfAlm )

   aTmp[_CCODUBI1]      := cGetUbica( aTmp[_CALMLIN], dbfAlm, 1 )
   aTmp[_CCODUBI2]      := cGetUbica( aTmp[_CALMLIN], dbfAlm, 2 )
   aTmp[_CCODUBI3]      := cGetUbica( aTmp[_CALMLIN], dbfAlm, 3 )

   if Empty( aTmp[_CCODUBI1] )
      aGet[_CCODUBI1]:Hide()
      aGet[_CVALUBI1]:Hide()
      aGet[_CNOMUBI1]:Hide()
   else
      aGet[_CCODUBI1]:Show()
      aGet[_CVALUBI1]:Show()
      aGet[_CNOMUBI1]:Show()
   end if

   if Empty( aTmp[_CCODUBI2] )
      aGet[_CCODUBI2]:Hide()
      aGet[_CVALUBI2]:Hide()
      aGet[_CNOMUBI2]:Hide()
   else
      aGet[_CCODUBI2]:Show()
      aGet[_CVALUBI2]:Show()
      aGet[_CNOMUBI2]:Show()
   end if

   if Empty( aTmp[_CCODUBI3] )
      aGet[_CCODUBI3]:Hide()
      aGet[_CVALUBI3]:Hide()
      aGet[_CNOMUBI3]:Hide()
   else
      aGet[_CCODUBI3]:Show()
      aGet[_CVALUBI3]:Show()
      aGet[_CNOMUBI3]:Show()
   end if

   aGet[_CCODUBI1]:Refresh()
   aGet[_CVALUBI1]:Refresh()
   aGet[_CNOMUBI1]:Refresh()
   aGet[_CCODUBI2]:Refresh()
   aGet[_CVALUBI2]:Refresh()
   aGet[_CNOMUBI3]:Refresh()
   aGet[_CCODUBI3]:Refresh()
   aGet[_CVALUBI3]:Refresh()
   aGet[_CNOMUBI3]:Refresh()

return .t.

//--------------------------------------------------------------------------//

STATIC FUNCTION SetDlgMode( aGet, aTmp, oFld, aTmpFac, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oTotal, oBrwPrp, oGetIra )

   local cCodArt  := aGet[ _CREF ]:VarGet()

   if !lUseCaj()
      aGet[ _NCANENT ]:Hide()
   else
      aGet[ _NCANENT ]:SetText( cNombreCajas() )
   end if

   aGet[ _NUNICAJA ]:SetText( cNombreUnidades() )

   oBrwPrp:Hide()
   oGetIra:Hide()

   oSayPr1:SetText( "" )
   oSayVp1:SetText( "" )

   oSayPr2:SetText( "" )
   oSayVp2:SetText( "" )

   /*
   Colocamos nuevamente los folders
   */

   oFld:aEnable   := { .t., !Empty( aTmp[ _CREF ] ), .t. }
   oFld:SetOption( 1 )

   do case
   case nMode == APPD_MODE

      aGet[_CREF    ]:show()
      aGet[_CDETALLE]:show()
      aGet[_MLNGDES ]:hide()
      aGet[_CLOTE   ]:hide()
      aGet[_DFECCAD ]:hide()
      aGet[_NCANENT ]:cText( 1 )
      aGet[_NUNICAJA]:cText( 1 )
      aGet[_CALMLIN ]:cText( aTmpFac[ _CCODALM ] )
      aGet[_NIVA    ]:cText( nIva( dbfIva, cDefIva() ) )

   case nMode != APPD_MODE .AND. empty( cCodArt )

      aGet[_CREF    ]:hide()
		aGet[_CDETALLE]:hide()
		aGet[_MLNGDES ]:show()
      aGet[_CLOTE   ]:hide()
      aGet[_DFECCAD ]:hide()

   case nMode != APPD_MODE .AND. !empty( cCodArt )

      aGet[_CREF    ]:show()
		aGet[_CDETALLE]:show()
		aGet[_MLNGDES ]:hide()

      if aTmp[ _LLOTE ]
         aGet[ _CLOTE   ]:Show()
         aGet[ _DFECFAC ]:Show()
      else
         aGet[ _CLOTE   ]:Hide()
         aGet[ _DFECCAD ]:Hide()
      end if

   end case

   lCalcDeta( aTmp, aTmpFac, aGet, oTotal )

   if !Empty( aTmp[ _CCODPR1 ] )
      aGet[ _CVALPR1 ]:Show()
      aGet[ _CVALPR1 ]:lValid()
      oSayPr1:Show()
      oSayVp1:Show()
      oSayPr1:SetText( retProp( aTmp[_CCODPR1], dbfPro ) )
   else
      aGet[ _CVALPR1 ]:hide()
      oSayPr1:Hide()
      oSayVp1:Hide()
   end if

   if !Empty( aTmp[_CCODPR2 ] )
      aGet[ _CVALPR2 ]:Show()
      aGet[ _CVALPR2 ]:lValid()
      oSayPr2:Show()
      oSayVp2:Show()
      oSayPr2:SetText( retProp(  aTmp[_CCODPR2], dbfPro ) )
   else
      aGet[ _CVALPR2 ]:hide()
      oSayPr2:hide()
      oSayVp2:hide()
   end if

   //Ocultamos las tres unidades de medicion

   aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:Hide()
   aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:Hide()
   aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:Hide()

   if oUndMedicion:oDbf:Seek(  aTmp[ _CUNIDAD ] )

      if oUndMedicion:oDbf:nDimension >= 1 .and. !Empty( oUndMedicion:oDbf:cTextoDim1 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim1 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:Show()
      end if

      if oUndMedicion:oDbf:nDimension >= 2 .and. !Empty( oUndMedicion:oDbf:cTextoDim2 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim2 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:Show()
      end if

      if oUndMedicion:oDbf:nDimension >= 3 .and. !Empty( oUndMedicion:oDbf:cTextoDim3 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim3 )
         aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:Show()
      end if

   end if

   aGet[ _CALMLIN ]:lValid()
   aGet[ _CREF    ]:SetFocus()

Return Nil

//--------------------------------------------------------------------------//

STATIC FUNCTION SaveDeta( aTmp, aGet, oBrw, oDlg2, nMode, oTotal, oFld, aTmpFac, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oStkAct, oBrwPrp, oGetIra, oBtn, oBtnSer )

   local n
   local i

   oBtn:SetFocus()

   if Empty( aTmp[ _CREF ] ) .and. lRetCodArt()
      MsgStop( "No se pueden a�adir lineas sin codificar" )
      return .f.
   end if

   if !lMoreIva( aTmp[_NIVA] )
      return nil
   end if

   if Empty( aTmp[ _CALMLIN ] )
      MsgStop( "C�digo de almacen no puede estar vacio" )
      aGet[ _CALMLIN ]:SetFocus()
      Return nil
   end if

   if !cAlmacen( aGet[ _CALMLIN ], dbfAlm )
      MsgStop( "C�digo de almacen no encontrado" )
      Return nil
   end if

   /*
   Comprobamos si tiene que introducir n�meros de serie------------------------
   */

   if nMode == APPD_MODE .and. RetFld( aTmp[ _CREF ], dbfArticulo, "lNumSer" ) .and. !( dbfTmpSer )->( dbSeek( Str( aTmp[ _NNUMLIN ], 4 ) + aTmp[ _CREF ] ) )

      MsgStop( "Tiene que introducir n�meros de serie para este art�culo." )

      oBtnSer:Click()

      Return .f.

   end if

   /*
   Grabamos el registro--------------------------------------------------------
   */

   cOldCodArt     := ""
   cOldUndMed     := ""

   if nMode == APPD_MODE

      if aTmp[ _LLOTE ]
         GraLotArt( aTmp[ _CREF ], dbfArticulo, aTmp[ _CLOTE ] )
      end if

      if !Empty( oBrwPrp:Cargo )

         for n := 1 to len( oBrwPrp:Cargo )

            for i := 1 to len( oBrwPrp:Cargo[ n ] )

               if IsNum( oBrwPrp:Cargo[ n, i ]:Value ) .and. oBrwPrp:Cargo[ n, i ]:Value != 0 //  .and.

                  aTmp[ _NUNICAJA]  := oBrwPrp:Cargo[ n, i ]:Value
                  aTmp[ _CCODPR1 ]  := oBrwPrp:Cargo[ n, i ]:cCodigoPropiedad1
                  aTmp[ _CVALPR1 ]  := oBrwPrp:Cargo[ n, i ]:cValorPropiedad1
                  aTmp[ _CCODPR2 ]  := oBrwPrp:Cargo[ n, i ]:cCodigoPropiedad2
                  aTmp[ _CVALPR2 ]  := oBrwPrp:Cargo[ n, i ]:cValorPropiedad2
                  aTmp[ _NPREUNIT]  := oBrwPrp:Cargo[ n, i ]:nPrecioCompra

                  WinGather( aTmp, aGet, dbfTmp, oBrw, nMode, nil, .f. )

               end if

            next

         next

         aCopy( dbBlankRec( dbfTmp ), aTmp )

         aEval( aGet, {| o, i | if( "GET" $ o:ClassName(), o:cText( aTmp[ i ] ), ) } )

      else

         WinGather( aTmp, aGet, dbfTmp, oBrw, nMode )

      end if

      if lEntCon()
         RecalculaTotal( aTmpFac )
         SetDlgMode( aGet, aTmp, oFld, aTmpFac, nMode, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oTotal, oBrwPrp, oGetIra )
      else
         oDlg2:End( IDOK )
      end if

   else

      WinGather( aTmp, aGet, dbfTmp, oBrw, nMode )

      oDlg2:end( IDOK )

   end if

   if !Empty( aGet[ _CUNIDAD ] )
      aGet[ _CUNIDAD ]:lValid()
   end if

   if !Empty( oBrwPrp )
      oBrwPrp:Cargo  := nil
   end if

RETURN NIL

//--------------------------------------------------------------------------//

/*
Funcion Auxiliar para A�adir lineas de detalle a una Factura
*/

STATIC FUNCTION AppDeta( oBrwLin, bEdtDet, aTmp, cCodArt )

   /*
   if !Empty( aNumAlb ) .or. aTmp[ _LIMPALB ]
      MsgStop( "No se pueden modificar registros a una factura que" + CRLF + ;
               "proviene de albaranes." )
      return .f.
   end if
   */

   if lRecibosPagadosTmp( dbfTmpPgo )
      MsgStop( "No se pueden modificar registros de una factura con pagos" )
      return .f.
   end if

   WinAppRec( oBrwLin, bEdtDet, dbfTmp, aTmp, cCodArt )

RETURN ( RecalculaTotal( aTmp ) )

//---------------------------------------------------------------------------//

/*
Funcion Auxiliar para la Edici�n de Lineas de Detalle en una Factura
*/

STATIC FUNCTION EdtDeta( oBrwLin, bEdtDet, aTmp, cLoop )

   if lRecibosPagadosTmp( dbfTmpPgo )
      MsgStop( "No se pueden modificar registros de una factura con pagos" )
      return .f.
   end if

   if !( dbfTmp )->lControl
      WinEdtRec( oBrwLin, bEdtDet, dbfTmp, aTmp )
   end if

RETURN ( RecalculaTotal( aTmp ) )

//--------------------------------------------------------------------------//
/*
Funcion Auxiliar para borrar las Lineas de Detalle en una Factura
*/

STATIC FUNCTION DelDeta()

   if lRecibosPagadosTmp( dbfTmpPgo )
      MsgStop( "No se pueden eliminar registros de una factura con pagos" )
      return .f.
   end if

   CursorWait()

   while ( dbfTmpSer )->( dbSeek( Str( ( dbfTmp )->nNumLin, 4 ) ) )
      ( dbfTmpSer )->( dbDelete() )
   end while

   if ( dbfTmp )->lKitArt
      dbDelKit( , dbfTmp, ( dbfTmp )->nNumLin )
   end if

   CursorWE()

RETURN ( .t. )

//--------------------------------------------------------------------------//
/*
Devuelve el importe total de pagos de una factura de proveedores
*/

FUNCTION nPagRctPrv( cFactura, cFacPrvP, cDivRet, dbfDiv, lOnlyCob, aTmp )

   local nRec
   local nOrd
   local nRinDiv
   local cCodDiv
   local nTotalPagado   := 0

   DEFAULT cFacPrvP     := dbfRctPrvP
   DEFAULT cDivRet      := cDivEmp()
   DEFAULT lOnlyCob     := .t.

   nRinDiv              := nRinDiv( cDivRet, dbfDiv )

   /*
   Si nos pasan la divisa tomamos el valor de la misma-------------------------
   */

   nRec                    := ( cFacPrvP )->( Recno() )

   if !Empty( aTmp )

      cCodDiv              := ( cFacPrvP )->cDivPgo

      ( cFacPrvP )->( dbGoTop() )
      while !( cFacPrvP )->( Eof() )

         if ( lOnlyCob .and. ( cFacPrvP )->lCobrado .and. !( cFacPrvP )->lDevuelto ) .or. ( !lOnlyCob .and. !( cFacPrvP )->lDevuelto )

            nTotalPagado   += ( cFacPrvP )->nImporte

         end if

         ( cFacPrvP )->( dbSkip() )

      end while

      ( cFacPrvP )->( dbGoTo( nRec ) )

   else

      nOrd                 := ( cFacPrvP )->( OrdSetFocus( "rNumFac" ) )

      if ( cFacPrvP )->( dbSeek( cFactura, .t. ) )

         cCodDiv           := ( cFacPrvP )->cDivPgo

         while ( ( cFacPrvP )->cSerFac + Str( ( cFacPrvP )->nNumFac ) + ( cFacPrvP )->cSufFac = cFactura )

            if ( lOnlyCob .and. ( cFacPrvP )->lCobrado .and. !( cFacPrvP )->lDevuelto ) .or. ( !lOnlyCob .and. !( cFacPrvP )->lDevuelto )

               nTotalPagado   += ( cFacPrvP )->nImporte

            end if

            ( cFacPrvP )->( dbSkip() )

         end while

      end if

      ( cFacPrvP )->( OrdSetFocus( nOrd ) )

   end if

   ( cFacPrvP )->( dbGoTo( nRec ) )

   if cDivRet != nil .and. cCodDiv != cDivRet
      nTotalPagado   := nCnv2Div( nTotalPagado, cCodDiv, cDivRet, dbfDiv )
   else
      nTotalPagado   := Round( nTotalPagado, nRinDiv )
   end if

RETURN ( nTotalPagado )

//---------------------------------------------------------------------------//

FUNCTION ChkPagRctPrv( dbfRctPrvT, dbfRctPrvP )

	local nBitmap

   do case
   case ( dbfRctPrvT )->lLiquidada
		nBitmap	:= 1
   case lRecibosPagados( dbfRctPrvT, dbfRctPrvP )
      nBitmap  := 2
   otherwise
      nBitmap  := 3
   end case

RETURN nBitmap

//---------------------------------------------------------------------------//
/*
Comprueba si una factura esta liquidada
*/

FUNCTION ChkLqdRctPrv( aTmp, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfIva, dbfDiv )

	local cFactura
	local nPagFacPrv
	local nTotal
   local cDivFac

	IF aTmp != NIL
      cFactura := aTmp[ _CSERFAC ] + Str( aTmp[ _NNUMFAC ] ) + aTmp[ _CSUFFAC ]
      cDivFac  := aTmp[ _CDIVFAC ]
	ELSE
      cFactura := (dbfRctPrvT)->CSERFAC + Str( (dbfRctPrvT)->NNUMFAC ) + (dbfRctPrvT)->CSUFFAC
      cDivFac  := (dbfRctPrvT)->CDIVFAC
   END IF

   nPagFacPrv  := abs( nPagRctPrv( cFactura, dbfRctPrvP, cDivFac, dbfDiv ) )
   nTotal      := abs( nTotRctPrv( cFactura, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP, nil, nil, .f. ) )

   if aTmp != NIL

      if nPagFacPrv == nTotal
         aTmp[ _LLIQUIDADA ] := .t.
      elseif nPagFacPrv > nTotal
         // MsgAlert( "Importe cobrado supera al total de la factura", "Revise cobros" )
         aTmp[ _LLIQUIDADA ] := .t.
      else
         aTmp[ _LLIQUIDADA ] := .f.
      end if

   else

      if dbLock( dbfRctPrvT )
         if nPagFacPrv == nTotal
            ( dbfRctPrvT )->lLiquidada := .t.
         elseif  nPagFacPrv > nTotal
            // MsgAlert( "Importe cobrado supera al total de la factura", "Revise cobros" )
            ( dbfRctPrvT )->lLiquidada := .t.
         else
            ( dbfRctPrvt )->lliquidada := .f.
         end if
         ( dbfRctPrvT )->( dbRUnLock() )
      end if

	END IF

RETURN NIL

//---------------------------------------------------------------------------//

STATIC FUNCTION PrnSerie( oBrw )

	local oDlg
   local oFmtDoc
   local cFmtDoc     := cFormatoDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount )
   local oSayFmt
   local cSayFmt
   local oSerIni
   local oSerFin
   local nRecno      := ( dbfRctPrvT )->( Recno() )
   local nOrdAnt     := ( dbfRctPrvT )->( OrdSetFocus( 1 ) )
   local cSerIni     := ( dbfRctPrvT )->cSerFac
   local cSerFin     := ( dbfRctPrvT )->cSerFac
   local nDocIni     := ( dbfRctPrvT )->nNumFac
   local nDocFin     := ( dbfRctPrvT )->nNumFac
   local cSufIni     := ( dbfRctPrvT )->cSufFac
   local cSufFin     := ( dbfRctPrvT )->cSufFac
   local oPrinter
   local cPrinter    := PrnGetName()
   local lCopiasPre  := .t.
   local lInvOrden   := .f.
   local oNumCop
   local nNumCop     := if( nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) == 0, Max( Retfld( ( dbfRctPrvT )->cCodPrv, dbfPrv, "nCopiasF" ), 1 ), nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) )

   if Empty( cFmtDoc )
      cFmtDoc        := cSelPrimerDoc( "TP" )
   end if

   cSayFmt           := cNombreDoc( cFmtDoc )

   DEFINE DIALOG oDlg RESOURCE "IMPSERDOC" TITLE "Imprimir series de facturas"

   REDEFINE GET oSerIni VAR cSerIni ;
      ID       100 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerIni ) );
      ON DOWN  ( DwSerie( oSerIni ) );
      VALID    ( cSerIni >= "A" .AND. cSerIni <= "Z"  );
      OF       oDlg

   REDEFINE GET oSerFin VAR cSerFin ;
      ID       110 ;
      PICTURE  "@!" ;
      UPDATE ;
      SPINNER ;
      ON UP    ( UpSerie( oSerFin ) );
      ON DOWN  ( DwSerie( oSerFin ) );
      VALID    ( cSerFin >= "A" .AND. cSerFin <= "Z"  );
      OF       oDlg

   REDEFINE GET nDocIni;
      ID       120 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      VALID    ( If ( !( dbfRctPrvT )->( dbSeek( cSerIni + Str( nDocIni, 9 ) + cSufIni ) ),;
							( msgStop( "Documento no valido" ), .F. ),;
							( .T. ) ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

   REDEFINE GET nDocFin;
      ID       130 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      VALID    ( If ( !( dbfRctPrvT )->( dbSeek( cSerFin  + Str( nDocFin, 9 ) + cSufFin ) ),;
						( msgStop( "Documento no valido" ), .F. ),;
						( .T. ) ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

   REDEFINE GET cSufIni ;
      ID       140 ;
      PICTURE  "##" ;
      VALID    ( If ( !( dbfRctPrvT )->( dbSeek( cSerIni  + Str( nDocIni, 9 ) + cSufIni ) ),;
							( msgStop( "Documento no valido" ), .F. ),;
							( .T. ) ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

   REDEFINE GET cSufFin ;
      ID       150 ;
      PICTURE  "##" ;
      VALID    ( If ( !( dbfRctPrvT )->( dbSeek( cSerFin  + Str( nDocFin, 9 ) + cSufFin ) ),;
							( msgStop( "Documento no valido" ), .F. ),;
							( .T. ) ) );
		COLOR 	CLR_GET ;
		OF 		oDlg

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
      VALID    ( cDocumento( oFmtDoc, oSayFmt, dbfDoc ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( BrwDocumento( oFmtDoc, oSayFmt, "TP" ) ) ;
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
      ACTION   (  StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden ),;
                  oDlg:end( IDOK ) )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      CANCEL ;
      ACTION   ( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden ), oDlg:end( IDOK ) } )

   oDlg:bStart := { || oSerIni:SetFocus() }

	ACTIVATE DIALOG oDlg CENTER

   ( dbfRctPrvT )->( ordSetFocus( nOrdAnt ) )
   ( dbfRctPrvT )->( dbGoTo( nRecNo ) )

	oBrw:refresh()

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION StartPrint( cFmtDoc, cDocIni, cDocFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden )

   local nCopyProvee

   oDlg:disable()

   if !lInvOrden

      ( dbfRctPrvT )->( dbSeek( cDocIni, .t. ) )

      while ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac >= cDocIni .AND. ;
            ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac <= cDocFin

            lChgImpDoc( dbfRctPrvT )

         if lCopiasPre

            nCopyProvee    := if( nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) == 0, Max( Retfld( ( dbfRctPrvT )->cCodPrv, dbfPrv, "nCopiasF" ), 1 ), nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) )

            GenRctPrv( IS_PRINTER, "Imprimiendo documento : " + ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac, cFmtDoc, cPrinter, nCopyProvee )

         else

            GenRctPrv( IS_PRINTER, "Imprimiendo documento : " + ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac, cFmtDoc, cPrinter, nNumCop )

         end if

      (dbfRctPrvT)->( dbSkip() )

      end while

   else

      ( dbfRctPrvT )->( dbSeek( cDocFin ) )

      while ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac >= cDocIni .and. ;
            ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac <= cDocFin .and.;
            !( dbfRctPrvT )->( Bof() )

            lChgImpDoc( dbfRctPrvT )

         if lCopiasPre

            nCopyProvee    := if( nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) == 0, Max( Retfld( ( dbfRctPrvT )->cCodPrv, dbfPrv, "nCopiasF" ), 1 ), nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) )

            GenRctPrv( IS_PRINTER, "Imprimiendo documento : " + ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac, cFmtDoc, cPrinter, nCopyProvee )

         else

            GenRctPrv( IS_PRINTER, "Imprimiendo documento : " + ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + (dbfRctPrvT)->cSufFac, cFmtDoc, cPrinter, nNumCop )

         end if

      ( dbfRctPrvT )->( dbSkip( -1 ) )

      end while

   end if

   oDlg:Enable()

RETURN NIL

//--------------------------------------------------------------------------//

/*
Calcula totales en las lineas de Detalle
*/

STATIC FUNCTION lCalcDeta( aTmp, aTmpFac, aGet, oTotal )

   oTotal:cText( nTotLRctPrv( aTmp, nDinDiv, nRinDiv ) )

RETURN .T.

//---------------------------------------------------------------------------//

FUNCTION nNetURctPrv( uFacPrvL, uFacPrvT, nDec, nRec, nVdv, cPinDiv )

   local nDtoEsp
	local nDtoPP
   local nDtoUno
	local nDtoDos
   local nCalculo
   local nDtoLin
   local nDtoPrm
   local nPorte

   DEFAULT nDec   := 0
   DEFAULT nRec   := 0
   DEFAULT nVdv   := 1

   nCalculo       := nTotURctPrv( uFacPrvL, nDec, nVdv )

   if ValType( uFacPrvL ) == "A"
      nDtoLin     := uFacPrvL[ _NDTOLIN ]
      nDtoPrm     := uFacPrvL[ _NDTOPRM ]
   else
      nDtoLin     := ( uFacPrvL )->nDtoLin
      nDtoPrm     := ( uFacPrvL )->nDtoPrm
   end if

   if nDtoLin != 0
      nCalculo    -= nCalculo * nDtoLin / 100
   end if

   if nDtoPrm != 0
      nCalculo    -= nCalculo * nDtoPrm / 100
   end if

   /*
   Comprobamos los parametros--------------------------------------------------
   */

   if ValType( uFacPrvT ) == "A"
      nDtoEsp     := uFacPrvT[ _NDTOESP ]
      nDtoPP      := uFacPrvT[ _NDPP    ]
      nDtoUno     := uFacPrvT[ _NDTOUNO ]
      nDtoDos     := uFacPrvT[ _NDTODOS ]
      nPorte      := uFacPrvT[ _NPORTES ]
   else
      nDtoEsp     := (uFacPrvT)->NDTOESP
      nDtoPP      := (uFacPrvT)->NDPP
      nDtoUno     := (uFacPrvT)->NDTOUNO
      nDtoDos     := (uFacPrvT)->NDTODOS
      nPorte      := (uFacPrvT)->NPORTES
   end if

   if nDtoEsp != 0
      nCalculo    -= Round( nCalculo * nDtoEsp / 100, nDec )
   end if

   if nDtoPP != 0
      nCalculo    -= Round( nCalculo * nDtoPP  / 100, nDec )
   end if

   if nDtoUno != 0
      nCalculo    -= Round( nCalculo * nDtoUno / 100, nDec )
   end if

   if nDtoDos != 0
      nCalculo    -= Round( nCalculo * nDtoDos / 100, nDec )
   end if

   nCalculo       := Round( nCalculo, nDec )

RETURN ( if( cPinDiv != NIL, Trans( nCalculo, cPinDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nImpURctPrv( uFacPrvT, dbfRctPrvL, nDec, nVdv, lIva, cPouDiv )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nVdv   := 1
   DEFAULT lIva   := .f.

   nCalculo       := nTotURctPrv( dbfRctPrvL, nDec, nVdv )

   if ValType( uFacPrvT ) == "A"
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTOESP ]  / 100, nDec )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDPP    ]  / 100, nDec )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTOUNO ]  / 100, nDec )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTODOS ]  / 100, nDec )
   else
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoEsp / 100, nDec )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDpp    / 100, nDec )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoUno / 100, nDec )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoDos / 100, nDec )
   end if

   if lIva .and. ( dbfRctPrvL )->nIva != 0
      nCalculo    += nCalculo * ( dbfRctPrvL )->nIva / 100
   end if

RETURN ( if( cPouDiv != nil, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nImpLRctPrv( uFacPrvT, dbfRctPrvL, nDec, nRou, nVdv, lIva, cPouDiv )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nRou   := 0
   DEFAULT nVdv   := 1
   DEFAULT lIva   := .f.

   nCalculo       := nTotLRctPrv( dbfRctPrvL, nDec, nRou, nVdv )

   if ValType( uFacPrvT ) == "A"
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTOESP ]  / 100, nRou )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDPP    ]  / 100, nRou )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTOUNO ]  / 100, nRou )
      nCalculo    -= Round( nCalculo * uFacPrvT[ _NDTODOS ]  / 100, nRou )
   else
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoEsp / 100, nRou )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDpp    / 100, nRou )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoUno / 100, nRou )
      nCalculo    -= Round( nCalculo * ( uFacPrvT )->nDtoDos / 100, nRou )
   end if

   if lIva .and. ( dbfRctPrvL )->nIva != 0
      nCalculo    += nCalculo * ( dbfRctPrvL )->nIva / 100
   end if

RETURN ( if( cPouDiv != nil, Trans( nCalculo, cPouDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nTotRctPrv( cFactura, cFacPrvT, cFacPrvL, cDbfIva, cDbfDiv, cFacPrvP, aTmp, cDivRet, lPic )

	local bCondition
	local nTotalArt
   local lRecargo
   local dFecFac
	local nDtoEsp
	local nDtoPP
   local nDtoUno
   local nDtoDos
	local nPorte
   local nPctRet
   local nRecno
	local cCodDiv
	local cCodPgo
   local nRegIva
   local lFacGas     := .f.
   local aTotalUno   := { 0, 0, 0 }
  	local aTotalDos   := { 0, 0, 0 }
   local aTotalDto   := { 0, 0, 0 }
	local aTotalDPP	:= { 0, 0, 0 }
   local aNetGas     := { 0, 0, 0 }
   local aPIvGas     := { 0, 0, 0 }
   local aPReGas     := { 0, 0, 0 }

   DEFAULT cFacPrvT  := dbfRctPrvT
   DEFAULT cFacPrvL  := dbfRctPrvL
   DEFAULT cFacPrvP  := dbfRctPrvP
   DEFAULT cDbfIva   := dbfIva
   DEFAULT cDbfDiv   := dbfDiv
   DEFAULT cFactura  := ( cFacPrvT )->cSerFac + Str( ( cFacPrvT )->nNumFac ) + ( cFacPrvT )->cSufFac
   DEFAULT lPic      := .f.

   public nTotBrt    := 0
   public nTotNet    := 0
   public nTotSup    := 0
   public nTotIva    := 0
   public nTotReq    := 0
   public nTotRet    := 0
   public nTotFac    := 0
   public nTotDto    := 0
   public nTotDpp    := 0
   public nTotUno    := 0
   public nTotDos    := 0
   public nTotImp    := 0
   public nTotUnd    := 0
   public nPagFac    := 0
   public nTipRet    := 0
   public aTotIva    := { { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 }, { 0,0,nil,0,0,0 } }
   public aIvaUno    := aTotIva[ 1 ]
   public aIvaDos    := aTotIva[ 2 ]
   public aIvaTre    := aTotIva[ 3 ]

   nRecno            := ( cFacPrvL )->( recno() )

   if aTmp != nil
      dFecFac        := aTmp[ _DFECFAC ]
      lRecargo       := aTmp[ _LRECARGO]
      nDtoEsp        := aTmp[ _NDTOESP ]
      nDtoPP         := aTmp[ _NDPP    ]
      nDtoUno        := aTmp[ _NDTOUNO ]
      nDtoDos        := aTmp[ _NDTODOS ]
      nPorte         := aTmp[ _NPORTES ]
      cCodDiv        := aTmp[ _CDIVFAC ]
      cCodPgo        := aTmp[ _CCODPAGO]
      nTipRet        := aTmp[ _NTIPRET ]
      nPctRet        := aTmp[ _NPCTRET ]
      nRegIva        := aTmp[ _NREGIVA ]
      lFacGas        := aTmp[ _LFACGAS ]
      aNetGas        := { aTmp[ _NNETGAS1 ], aTmp[ _NNETGAS2 ], aTmp[ _NNETGAS3 ] }
      aPIvGas        := { aTmp[ _NIVAGAS1 ], aTmp[ _NIVAGAS2 ], aTmp[ _NIVAGAS3 ] }
      aPReGas        := { aTmp[ _NREGAS1  ], aTmp[ _NREGAS2  ], aTmp[ _NREGAS3  ] }
      bCondition     := {|| ( cFacPrvL )->( !eof() ) }
      ( cFacPrvL )->( dbGoTop() )
   else
      dFecFac        := ( cFacPrvT )->dFecFac
      lRecargo       := ( cFacPrvT )->lRecargo
      nDtoEsp        := ( cFacPrvT )->nDtoEsp
      nDtoPP         := ( cFacPrvT )->nDpp
      nDtoUno        := ( cFacPrvT )->nDtoUno
      nDtoDos        := ( cFacPrvT )->nDtoDos
      nPorte         := ( cFacPrvT )->nPortes
      cCodDiv        := ( cFacPrvT )->cDivFac
      cCodPgo        := ( cFacPrvT )->cCodPago
      nTipRet        := ( cFacPrvT )->nTipRet
      nPctRet        := ( cFacPrvT )->nPctRet
      nRegIva        := ( cFacPrvT )->nRegIva
      lFacGas        := ( cFacPrvT )->lFacGas
      aNetGas        := { ( cFacPrvT )->nNetGas1, ( cFacPrvT )->nNetGas2, ( cFacPrvT )->nNetGas3 }
      aPIvGas        := { ( cFacPrvT )->nIvaGas1, ( cFacPrvT )->nIvaGas2, ( cFacPrvT )->nIvaGas3 }
      aPReGas        := { ( cFacPrvT )->nReGas1,  ( cFacPrvT )->nReGas2,  ( cFacPrvT )->nReGas3  }
      bCondition     := {|| ( cFacPrvL )->cSerFac + Str( ( cFacPrvL )->nNumFac ) + ( cFacPrvL )->cSufFac == cFactura .AND. ( cFacPrvL )->( !eof() ) }
      ( cFacPrvL )->( dbSeek( cFactura ) )
   end if

	/*
	Cargamos los pictures dependiendo de la moneda
	*/

   cPinDiv           := cPinDiv( cCodDiv, cDbfDiv )
   cPirDiv           := cPirDiv( cCodDiv, cDbfDiv )
   nDinDiv           := nDinDiv( cCodDiv, cDbfDiv )
   nRinDiv           := nRinDiv( cCodDiv, cDbfDiv )

   if !lFacGas

      while Eval( bCondition )

         if lValLine( cFacPrvL )

            nTotalArt   := nTotLRctPrv( cFacPrvL, nDinDiv, nRinDiv )
            if nTotalArt != 0

               if ( cFacPrvL )->lGasSup
                  nTotSup        += nTotalArt
               end if

               /*
               Estudio de IGIC
               */

               do case
               case _NPCTIVA1 == NIL .OR. _NPCTIVA1 == (cFacPrvL)->NIVA
                  _NPCTIVA1   := (cFacPrvL)->nIva
                  _NPCTREQ1   := (cFacPrvL)->nReq
                  _NBRTIVA1   += nTotalArt

               case _NPCTIVA2 == NIL .OR. _NPCTIVA2 == (cFacPrvL)->NIVA
                  _NPCTIVA2   := (cFacPrvL)->nIva
                  _NPCTREQ2   := (cFacPrvL)->nReq
                  _NBRTIVA2   += nTotalArt

               case _NPCTIVA3 == NIL .OR. _NPCTIVA3 == (cFacPrvL)->NIVA
                  _NPCTIVA3   := (cFacPrvL)->nIva
                  _NPCTREQ3   := (cFacPrvL)->nReq
                  _NBRTIVA3   += nTotalArt

               end case

            end if

            nTotUnd         += nTotNRctPrv( cFacPrvL )

         end if

         ( cFacPrvL )->( dbSkip() )

      end while

      ( cFacPrvL )->( dbGoto( nRecno ) )

   else

      _NBRTIVA1   := aNetGas[1]
      _NPCTIVA1   := aPIvGas[1]
      _NPCTREQ1   := aPReGas[1]

      _NBRTIVA2   := aNetGas[2]
      _NPCTIVA2   := aPIvGas[2]
      _NPCTREQ2   := aPReGas[2]

      _NBRTIVA3   := aNetGas[3]
      _NPCTIVA3   := aPIvGas[3]
      _NPCTREQ3   := aPReGas[3]

   end if

   /*
   Ordenamos los IGICS de menor a mayor
	*/

   aTotIva              := aSort( aTotIva,,, {|x,y| abs( x[1] ) > abs( y[1] ) } )

   _NBASIVA1            := Round( _NBRTIVA1, nRinDiv )
   _NBASIVA2            := Round( _NBRTIVA2, nRinDiv )
   _NBASIVA3            := Round( _NBRTIVA3, nRinDiv )

   nTotBrt              := _NBASIVA1 + _NBASIVA2 + _NBASIVA3

   /*
	Portes de la Factura
	*/

   nTotBrt              += nPorte

   /*
	Descuentos de la Facturas
	*/

   if !lFacGas

      IF nDtoEsp != 0

         aTotalDto[1]   := Round( _NBASIVA1 * nDtoEsp / 100, nRinDiv )
         aTotalDto[2]   := Round( _NBASIVA2 * nDtoEsp / 100, nRinDiv )
         aTotalDto[3]   := Round( _NBASIVA3 * nDtoEsp / 100, nRinDiv )

         nTotDto      := aTotalDto[1] + aTotalDto[2] + aTotalDto[3]

         _NBASIVA1      -= aTotalDto[1]
         _NBASIVA2      -= aTotalDto[2]
         _NBASIVA3      -= aTotalDto[3]

      END IF

      IF nDtoPP != 0

         aTotalDPP[1]   := Round( _NBASIVA1 * nDtoPP / 100, nRinDiv )
         aTotalDPP[2]   := Round( _NBASIVA2 * nDtoPP / 100, nRinDiv )
         aTotalDPP[3]   := Round( _NBASIVA3 * nDtoPP / 100, nRinDiv )

         nTotDPP      := aTotalDPP[1] + aTotalDPP[2] + aTotalDPP[3]

         _NBASIVA1      -= aTotalDPP[1]
         _NBASIVA2      -= aTotalDPP[2]
         _NBASIVA3      -= aTotalDPP[3]

      END IF

      IF nDtoUno != 0

         aTotalUno[1]   := Round( _NBASIVA1 * nDtoUno / 100, nRinDiv )
         aTotalUno[2]   := Round( _NBASIVA2 * nDtoUno / 100, nRinDiv )
         aTotalUno[3]   := Round( _NBASIVA3 * nDtoUno / 100, nRinDiv )

         nTotUno        := aTotalUno[1] + aTotalUno[2] + aTotalUno[3]

         _NBASIVA1      -= aTotalUno[1]
         _NBASIVA2      -= aTotalUno[2]
         _NBASIVA3      -= aTotalUno[3]

      END IF

      IF nDtoDos != 0

         aTotalDos[1]   := Round( _NBASIVA1 * nDtoDos / 100, nRinDiv )
         aTotalDos[2]   := Round( _NBASIVA2 * nDtoDos / 100, nRinDiv )
         aTotalDos[3]   := Round( _NBASIVA3 * nDtoDos / 100, nRinDiv )

         nTotDos        := aTotalDos[1] + aTotalDos[2] + aTotalDos[3]

         _NBASIVA1      -= aTotalDos[1]
         _NBASIVA2      -= aTotalDos[2]
         _NBASIVA3      -= aTotalDos[3]

      END IF

   end if

	/*
   Calculos de IGIC
	*/

   if nRegIva <= 1

      _NIMPIVA1         := if( _NPCTIVA1 != NIL, Round( _NBASIVA1 * _NPCTIVA1 / 100, nRinDiv ), 0 )
      _NIMPIVA2         := if( _NPCTIVA2 != NIL, Round( _NBASIVA2 * _NPCTIVA2 / 100, nRinDiv ), 0 )
      _NIMPIVA3         := if( _NPCTIVA3 != NIL, Round( _NBASIVA3 * _NPCTIVA3 / 100, nRinDiv ), 0 )

      /*
      Calculo de recargo
      */

      if lRecargo
         _NIMPREQ1   := if( _NPCTIVA1 != NIL, Round( _NBASIVA1 * _NPCTREQ1 / 100, nRinDiv ), 0 )
         _NIMPREQ2   := if( _NPCTIVA2 != NIL, Round( _NBASIVA2 * _NPCTREQ2 / 100, nRinDiv ), 0 )
         _NIMPREQ3   := if( _NPCTIVA3 != NIL, Round( _NBASIVA3 * _NPCTREQ3 / 100, nRinDiv ), 0 )
      end if

   end if

   /*
   Total IGIC
   */

   nTotIva           := Round( _NIMPIVA1 + _NIMPIVA2 + _NIMPIVA3, nRinDiv )

	/*
   Total de R.E.
	*/

   nTotReq           := Round( _NIMPREQ1 + _NIMPREQ2 + _NIMPREQ3, nRinDiv )

   /*
   Redondeo del neto de la factura
   */

   nTotNet           := Round( _NBASIVA1 + _NBASIVA2 + _NBASIVA3, nRinDiv )

	/*
	Total de impuestos
	*/

   nTotImp           := Round( nTotIva + nTotReq, nRinDiv )

   /*
   Total retenciones
   */

   if isNum( nTipRet )
      if nTipRet <= 1
         nTotRet     := Round( ( nTotNet - nTotSup ) * nPctRet / 100, nRinDiv )
      else
         nTotRet     := Round( ( nTotNet - nTotSup + nTotIva ) * nPctRet / 100, nRinDiv )
      end if
   end if

   /*
	Total facturas
	*/

   nTotFac           := Round( nTotNet + nTotImp - nTotRet, nRinDiv )

	/*
   Calculo de pagos
   */

   if cFacPrvP != nil
      nPagFac        := nPagRctPrv( cFactura, cFacPrvP, cCodDiv, cDbfDiv, .t., aTmp )
   end if

   aTotIva           := aSort( aTotIva,,, {|x,y| abs( x[1] ) > abs( y[1] ) } )

   /*
   Solicitan una divisa distinta a la q se hizo originalmente la factura
   */

   if cDivRet != nil .and. cDivRet != cCodDiv
      nTotNet     := nCnv2Div( nTotNet, cCodDiv, cDivRet, cDbfDiv )
      nTotIva     := nCnv2Div( nTotIva, cCodDiv, cDivRet, cDbfDiv )
      nTotReq     := nCnv2Div( nTotReq, cCodDiv, cDivRet, cDbfDiv )
      nTotFac     := nCnv2Div( nTotFac, cCodDiv, cDivRet, cDbfDiv )
      cPirDiv     := cPirDiv( cDivRet, cDbfDiv )
   end if

RETURN ( if( lPic, Trans( nTotFac, cPirDiv ), nTotFac ) )

//--------------------------------------------------------------------------//

Static Function RecalculaTotal( aTmp )

   nTotRctPrv( nil, dbfRctPrvT, dbfTmp, dbfIva, dbfDiv, dbfTmpPgo, aTmp )

   if oBrwIva != nil
      oBrwIva:refresh()
   end if

   if oGetNet != nil
      oGetNet:SetText( Trans( nTotNet, cPirDiv ) )
   end if

   if oGetIva != nil
      oGetIva:SetText( Trans( nTotIva, cPirDiv ) )
   end if

   if oGetReq != nil
      oGetReq:SetText( Trans( nTotReq, cPirDiv ) )
   end if

   if oGetTotal != nil
      oGetTotal:SetText( Trans( nTotFac, cPirDiv ) )
   end if

   if oGetRet != nil
      oGetRet:SetText( Trans( nTotRet, cPirDiv ) )
   end if

   if oGetTotPg != nil
      oGetTotPg:SetText( Trans( nTotFac, cPirDiv ) )
   end if

   if oGetPgd != nil
      oGetPgd:SetText( Trans( nPagFac, cPirDiv ) )
   end if

   if oGetPdt != nil
      oGetPdt:SetText( Trans( nTotFac - nPagFac, cPirDiv ) )
   end if

Return .t.

//---------------------------------------------------------------------------//

function nVtaRctPrv( cCodPrv, dDesde, dHasta, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nYear )

   local nCon     := 0
   local nRec     := ( dbfRctPrvT )->( Recno() )

   /*
   Facturas a Clientes -------------------------------------------------------
   */

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv == cCodPrv .and. !( dbfRctPrvT )->( Eof() )

         if ( dDesde == nil .or. ( dbfRctPrvT )->dFecFac >= dDesde )    .and.;
            ( dHasta == nil .or. ( dbfRctPrvT )->dFecFac <= dHasta )    .and.;
            ( nYear == nil .or. Year( ( dbfRctPrvT )->dFecFac ) == nYear )

            nCon  += nTotRctPrv( ( dbfRctPrvT )->cSerFac + Str( (dbfRctPrvT)->nNumFac ) + (dbfRctPrvT)->cSufFac, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, nil, nil, cDivEmp(), .f. )

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( dbGoTo( nRec ) )

return nCon

//----------------------------------------------------------------------------//
//
// Devuelve el total de pagos en Facturas de un clientes determinado
//

function nCobRctPrv( cCodPrv, dDesde, dHasta, dbfRctPrvT, dbfRctPrvP, dbfIva, dbfDiv, lOnlyCob, nYear )

   local nCob        := 0
   local nOrd        := ( dbfRctPrvT )->( OrdSetFocus( "cCodPrv" ) )
   local nRec        := ( dbfRctPrvT )->( Recno() )

   DEFAULT lOnlyCob  := .t.

   /*
   Facturas a Prventes -------------------------------------------------------
   */

   if ( dbfRctPrvT )->( dbSeek( cCodPrv ) )

      while ( dbfRctPrvT )->cCodPrv = cCodPrv .and. !( dbfRctPrvT )->( Eof() )

         if ( dDesde == nil .or. ( dbfRctPrvT )->DFECFAC >= dDesde ) .and.;
            ( dHasta == nil .or. ( dbfRctPrvT )->DFECFAC <= dHasta ) .and.;
            ( nYear == nil .or. Year( ( dbfRctPrvT )->dFecFac ) == nYear )

            nCob  += nPagRctPrv( ( dbfRctPrvT )->cSerFac + Str( (dbfRctPrvT)->nNumFac ) + (dbfRctPrvT)->cSufFac, dbfRctPrvP, cDivEmp(), dbfDiv, lOnlyCob )

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( OrdSetFocus( nOrd ) )
   ( dbfRctPrvT )->( dbGoTo( nRec ) )

return nCob

//----------------------------------------------------------------------------//

Static Function nGenRctPrv( nDevice, cCaption, cCodDoc, cPrinter, nCopies )

   local nFac

   CursorWait()

   for each nFac in ( oWndBrw:oBrw:aSelected )

      ( dbfRctPrvT )->( dbGoTo( nFac ) )

      GenRctPrv( nDevice, cCaption, cCodDoc, cPrinter, nCopies )

   next

   CursorWE()

Return ( nil )

//----------------------------------------------------------------------------//

Static Function GenRctPrv( nDevice, cCaption, cCodDoc, cPrinter, nCopies )

   local oDevice
   local nFactura

   if ( dbfRctPrvT )->( Lastrec() ) == 0
      Return nil
   end if

   nFactura             := ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac

   DEFAULT nDevice      := IS_PRINTER
   DEFAULT cCaption     := "Imprimiendo facturas rectificativas de proveedores"
   DEFAULT cCodDoc      := cFormatoDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount )
   DEFAULT nCopies      := if( nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) == 0, Max( Retfld( ( dbfRctPrvT )->cCodPrv, dbfPrv, "nCopiasF" ), 1 ), nCopiasDocumento( ( dbfRctPrvT )->cSerFac, "nRctPrv", dbfCount ) )

   if Empty( cCodDoc )
      cCodDoc           := cFirstDoc( "TP", dbfDoc )
   end if

   if !lExisteDocumento( cCodDoc, dbfDoc )
      return nil
   end if

   /*
   Si el documento es de tipo visual-------------------------------------------
   */

   if lVisualDocumento( cCodDoc, dbfDoc )

      PrintReportRctPrv( nDevice, nCopies, cPrinter, dbfDoc )

   else

      /*
      Recalculamos la factura
      */

      nTotRctPrv( nFactura, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP )

      /*
      Buscamos el primer registro
      */

      ( dbfRctPrvL )->( dbSeek( nFactura ) )
      ( dbfRctPrvP )->( dbSeek( nFactura ) )

      /*
      Posicionamos en ficheros auxiliares
      */

      ( dbfPrv   )->( dbSeek( ( dbfRctPrvT )->cCodPrv ) )
      ( dbfAlm   )->( dbSeek( ( dbfRctPrvT )->cCodAlm ) )
      ( dbfFPago )->( dbSeek( ( dbfRctPrvT )->cCodPago) )
      ( dbfDiv   )->( DbSeek( ( dbfRctPrvT )->cDivFac ) )

      private cDbf         := dbfRctPrvT
      private cDbfCol      := dbfRctPrvL
      private cDbfRec      := dbfRctPrvP
      private cDbfAlm      := dbfAlm
      private cDbfPrv      := dbfPrv
      private cDbfPgo      := dbfFPago
      private cDbfIva      := dbfIva
      private cDbfDiv      := dbfDiv
      private cDbfArt      := dbfArticulo
      private cDbfKit      := dbfKit
      private cDbfPro      := dbfPro
      private cDbfTblPro   := dbfTblPro
      private nTotPage     := nTotLRctPrv( dbfRctPrvL )
      private cPinDivFac   := cPinDiv
      private cPirDivFac   := cPirDiv
      private cPicEurFac   := cPicEur
      private nDinDivFac   := nDinDiv
      private nDirDivFac   := nRinDiv
      private nVdvDivFac   := ( dbfRctPrvT )->nVdvFac

      if !Empty( cPrinter )
         oDevice           := TPrinter():New( cCaption, .f., .t., cPrinter )
         REPORT oInf CAPTION cCaption TO DEVICE oDevice
      else
         REPORT oInf CAPTION cCaption PREVIEW
      end if

      /*
      Cabeceras del listado
      */

      if !Empty( oInf ) .and. oInf:lCreated
         oInf:lAutoLand          := .f.
         oInf:lFinish            := .f.
         oInf:lNoCancel          := .t.
         oInf:bSkip              := {|| FacPrvReportSkipper( dbfRctPrvL ) }

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
            WHILE       ( ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac = nFactura ) ;
            ON ENDPAGE  ( Epage( oInf, cCodDoc ) )

         if nDevice == IS_PRINTER
            oInf:oDevice:end()
         end if

      end if

      oInf                 := nil

   end if

   lChgImpDoc( dbfRctPrvT )

RETURN NIL

//---------------------------------------------------------------------------//

Static Function FacPrvReportSkipper( dbfRctPrvL )

   ( dbfRctPrvL )->( dbSkip() )

   nTotPage              += nTotLRctPrv( dbfRctPrvL )

Return nil

//---------------------------------------------------------------------------//

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

   MsgStop( "Factura con mas de 3 tipos de " + cImp(), "Imposible a�adir" )

RETURN .F.

//---------------------------------------------------------------------------//

STATIC FUNCTION ChgFactu( dbfRctPrvT, oBrw )

   if dbLock( dbfRctPrvT )
      ( dbfRctPrvT )->lLiquidada := !( dbfRctPrvT )->lLiquidada
      ( dbfRctPrvT )->( dbUnLock() )
   end if

	oBrw:refresh()

RETURN NIL

//----------------------------------------------------------------------------//

STATIC FUNCTION loaPrv( aGet, aTmp, dbfPrv, nMode, oSay, oTlfPrv )

   local lValid      := .f.
   local cNewCodCli  := aGet[ _CCODPRV ]:VarGet()
   local lChgCodCli  := ( Empty( cOldCodCli ) .or. cOldCodCli != cNewCodCli )

   if Empty( cNewCodCli )
      Return .t.
   elseif At( ".", cNewCodCli ) != 0
      cNewCodCli := PntReplace( aGet[_CCODPRV], "0", RetNumCodPrvEmp() )
   else
      cNewCodCli := Rjust( cNewCodCli, "0", RetNumCodPrvEmp() )
   end if

   if ( dbfPrv )->( dbSeek( cNewCodCli ) )

      if ( dbfPrv )->lBlqPrv
         msgStop( "Proveedor bloqueado, no se pueden realizar operaciones de compra" )
         return .f.
      end if

      aGet[_CCODPRV ]:cText( ( dbfPrv )->Cod )

      if Empty( aGet[_CNOMPRV]:varGet() ) .or. lChgCodCli
         aGet[_CNOMPRV]:cText( ( dbfPrv )->Titulo )
      end if

      if oTlfPrv != nil
         oTlfPrv:SetText( ( dbfPrv )->Telefono )
      end if

      if Empty( aGet[_CDIRPRV]:varGet() ) .or. lChgCodCli
         aGet[_CDIRPRV]:cText( ( dbfPrv )->Domicilio )
      endif

      if Empty( aGet[_CPOBPRV]:varGet() ) .or. lChgCodCli
         aGet[_CPOBPRV]:cText( (dbfPrv)->POBLACION )
      endif

      if Empty( aGet[_CPROVPROV]:varGet() ) .or. lChgCodCli
         aGet[_CPROVPROV]:cText( (dbfPrv)->PROVINCIA )
      endif

      if Empty( aGet[_CPOSPRV]:varGet() ) .or. lChgCodCli
         aGet[_CPOSPRV]:cText( (dbfPrv)->CODPOSTAL )
      endif

      if Empty( aGet[_CDNIPRV]:varGet() ) .or. lChgCodCli
         aGet[_CDNIPRV]:cText( (dbfPrv)->NIF )
      endif

      if lChgCodCli
         aGet[ _CDTOESP ]:cText( ( dbfPrv )->cDtoEsp )
         aGet[ _NDTOESP ]:cText( ( dbfPrv )->nDtoEsp )
         aGet[ _CDPP    ]:cText( ( dbfPrv )->cDtoPP )
         aGet[ _NDPP    ]:cText( ( dbfPrv )->DtoPP )
      end if

      if Empty( aGet[ _CCODPAGO ]:VarGet() ) .or. lChgCodCli

         aGet[ _CCODPAGO ]:cText( ( dbfPrv )->fPago )
         aGet[ _CCODPAGO ]:lValid()

         /*
         Si la forma de pago es un movimiento bancario le asignamos el banco y cuenta por defecto
         */

         if RetFld( aTmp[ _CCODPAGO ], dbfFPago, "LUTLBNC" )

            if dbSeekInOrd( ( dbfPrv )->Cod, "CCODDEF", dbfPrvBnc )

               if !Empty( aGet[ _CBANCO ] )
                  aGet[ _CBANCO ]:cText( ( dbfPrvBnc )->cCodBnc )
                  aGet[ _CBANCO ]:lValid()
               end if

               if !Empty( aGet[ _CENTBNC ] )
                  aGet[ _CENTBNC ]:cText( ( dbfPrvBnc )->cEntBnc )
                  aGet[ _CENTBNC ]:lValid()
               end if

               if !Empty( aGet[ _CSUCBNC ] )
                  aGet[ _CSUCBNC ]:cText( ( dbfPrvBnc )->cSucBnc )
                  aGet[ _CSUCBNC ]:lValid()
               end if

               if !Empty( aGet[ _CDIGBNC ] )
                  aGet[ _CDIGBNC ]:cText( ( dbfPrvBnc )->cDigBnc )
                  aGet[ _CDIGBNC ]:lValid()
               end if

               if !Empty( aGet[ _CCTABNC ] )
                  aGet[ _CCTABNC ]:cText( ( dbfPrvBnc )->cCtaBnc )
                  aGet[ _CCTABNC ]:lValid()
               end if

            end if

         end if

      end if

      if Empty( aGet[ _NTIPRET ]:VarGet() ) .or. lChgCodCli
         aGet[ _NTIPRET ]:oGet:cText(  ( dbfPrv )->nTipRet )
         aGet[ _NTIPRET ]:Select(      ( dbfPrv )->nTipRet )
      end if

      if Empty( aGet[ _NPCTRET ]:VarGet() ) .or. lChgCodCli
         aGet[ _NPCTRET ]:cText( ( dbfPrv )->nPctRet )
      end if

      if nMode == APPD_MODE
         aGet[ _NREGIVA ]:nOption( Max( ( dbfPrv )->nRegIva, 1 ) )
         aGet[ _NREGIVA ]:Refresh()

         if Empty( aTmp[ _CSERFAC ] )

            if !Empty( ( dbfPrv )->Serie )
               aGet[ _CSERFAC ]:cText( ( dbfPrv )->Serie )
            end if

         else

            if !Empty( ( dbfPrv )->Serie ) .and. aTmp[ _CSERFAC ] != ( dbfPrv )->Serie .and. ApoloMsgNoYes( "La serie del proveedor seleccionado es distinta a la anterior.", "�Desea cambiar la serie?" )
               aGet[ _CSERFAC ]:cText( ( dbfPrv )->Serie )
            end if

         end if

      end if

      if lChgCodCli
         aTmp[ _LRECARGO ] := ( dbfPrv )->lReq
         aGet[ _LRECARGO ]:Refresh()
      end if

      if ( dbfPrv )->lMosCom .and. !Empty( ( dbfPrv )->mComent ) .and. lChgCodCli
         MsgStop( AllTrim( ( dbfPrv )->mComent ) )
      end if

      cOldCodCli  := ( dbfPrv )->Cod
      lValid      := .t.

	ELSE

		msgStop( "Proveedor no encontrado" )

	END IF

RETURN lValid

//----------------------------------------------------------------------------//

/*
Carga los articulos
*/

STATIC FUNCTION LoaArt( aGet, aTmp, aTmpFac, oFld, oSayPr1, oSayPr2, oSayVp1, oSayVp2, oBmp, oBrwPrp, oGetIra, oDlg, oStkAct, oTotal )

   local nIva
   local nOrdAnt
   local nPreUnt
   local nPreCom
   local cCodFam
   local cPrpArt
   local cCodPrv
   local cCodArt
   local lChgCodArt
   local lSeek       := .f.

   nIva              := 0
   cCodPrv           := aTmpFac[ _CCODPRV ]
   cCodArt           := aGet[ _CREF    ]:VarGet()
   cPrpArt           := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]
   lChgCodArt        := ( Rtrim( cOldCodArt ) != Rtrim( cCodArt ) .or. Rtrim( cOldPrpArt ) != Rtrim( cPrpArt ) )

   if Empty( cCodArt )

      if lRetCodArt()
         MsgStop( "No se pueden a�adir lineas sin codificar" )
         return .f.
      end if

		aGet[_NIVA    ]:bWhen	:= {|| .t. }

      aGet[_CDETALLE]:Hide()

      aGet[_MLNGDES ]:Show()
      aGet[_MLNGDES ]:SetFocus()

      if !Empty( oBrwPrp )
         oBrwPrp:Hide()
      end if

   else

      if lModIva()
			aGet[_NIVA ]:bWhen	:= {|| .t. }
      else
			aGet[_NIVA ]:bWhen	:= {|| .f. }
      end if

		aGet[_CREF    ]:show()
		aGet[_CDETALLE]:show()
		aGet[_MLNGDES ]:hide()

      if !( ( dbfArticulo )->( dbSeek( cCodArt ) ) .or. ( dbfArticulo )->( dbSeek( Upper( cCodArt ) ) ) )

         /*
         Busqueda por codigo de proveedor-----------------------------------------
         */

         nOrdAnt                 := ( dbfArtPrv )->( OrdSetFocus( "cRefPrv" ) )

         if ( dbfArtPrv )->( dbSeek( cCodPrv + cCodArt ) )
            cCodArt              := ( dbfArtPrv )->cCodArt
         end if

         ( dbfArtPrv )->( ordSetFocus( nOrdAnt ) )

         /*
         Primero buscamos por codigos de barra------------------------------------
         */

         cCodArt                 := cSeekCodebar( cCodArt, dbfCodebar, dbfArticulo )

         lSeek                   := ( ( dbfArticulo )->( dbSeek( cCodArt ) ) .or. ( dbfArticulo )->( dbSeek( Upper( cCodArt ) ) ) )

      else

         lSeek                   := .t.

      end if

      /*
      Ahora buscamos por el codigo interno-------------------------------------
      */

      //if ( dbfArticulo )->( dbSeek( cCodArt ) ) .or. ( dbfArticulo )->( dbSeek( Upper( cCodArt ) ) )

      if lSeek

         if ( lChgCodArt )

            if ( dbfArticulo )->lObs
               MsgStop( "Art�culo catalogado como obsoleto" )
               return .f.
            end if

            /*
            Lotes
            ---------------------------------------------------------------------
            */

            aTmp[ _LLOTE  ]         := ( dbfArticulo )->lLote

            if ( dbfArticulo )->lLote
               aGet[ _CLOTE   ]:show()
               aGet[ _CLOTE   ]:cText( ( dbfArticulo )->cLote )
               aGet[ _DFECCAD ]:show()
               aGet[ _DFECCAD ]:cText( dFechaCaducidad( aTmpFac[ _DFECFAC ], ( dbfArticulo )->nDuracion, ( dbfArticulo )->nTipDur ) )
            else
               aGet[ _CLOTE   ]:hide()
               aGet[ _DFECCAD ]:hide()
            end if

            /*
            Cogemos las familias y grupos de familias
            */

            cCodFam              := ( dbfArticulo )->Familia
            if !Empty( cCodFam )
               aTmp[_CCODFAM]    := cCodFam
               aTmp[_CGRPFAM]    := cGruFam( cCodFam, dbfFamilia )
            end if

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
            Tomamos el valor del precio unitario
            */

            if oStkAct != nil .and. aTmp[ _NCTLSTK ] <= 1
               oStock:nPutStockActual( cCodArt, aTmpFac[ _CCODALM ], , , , aTmp[ _LKITART ], aTmp[ _NCTLSTK ], oStkAct )
            end if

            /*
            Tomamos el valor del precio unitario
            */

            nPreUnt  := aGet[ _NPREUNIT ]:VarGet()

            /*
            Abilitamos la segunda caja de dialogo
            */

            oFld:aEnable := { .t., .t., .t. }
            oFld:refresh()

            aGet[_CREF    ]:cText( ( dbfArticulo )->Codigo )
            aGet[_CDETALLE]:cText( ( dbfArticulo )->Nombre )

            if ( dbfArticulo )->lMosCom .and. !Empty( ( dbfArticulo )->mComent )
               MsgStop( Trim( ( dbfArticulo )->mComent ) )
            end if

            /*
            Preguntamos si el regimen de " + cImp() + " es distinto de Exento
            */

            nIva           := nIva( dbfIva, ( dbfArticulo )->TipoIva )
            aGet[ _NIVA    ]:cText( nIva )

            aTmp[ _NREQ ]  := nReq( dbfIva, ( dbfArticulo )->TipoIva )

            if ( dbfArticulo )->nCajEnt != 0
               aGet[_NCANENT]:cText( ( dbfArticulo )->nCajEnt )
            end if

            if ( dbfArticulo )->nUniCaja != 0
               aGet[_NUNICAJA]:cText( ( dbfArticulo )->nUniCaja )
            end if

            /*
            Referencia de proveedor-----------------------------------------------
            */

            nOrdAnt                 := ( dbfArtPrv )->( OrdSetFocus( "cCodPrv" ) )

            if ( dbfArtPrv )->( dbSeek( cCodPrv + cCodArt ) )

               if !Empty( aGet[ _CREFPRV ] )
                  aGet[ _CREFPRV ]:cText( ( dbfArtPrv )->cRefPrv )
               end if

            else

               if !Empty( aGet[ _CREFPRV ] )
                  aGet[ _CREFPRV ]:cText( Space( 20 ) )
               end if

            end if

            ( dbfArtPrv )->( ordSetFocus( nOrdAnt ) )

            /*
            Ponemos el precio de venta recomendado--------------------------------
            */

            aTmp[ _NPVPREC ]     := ( dbfArticulo )->PvpRec

            /*
            Buscamos la familia del articulo y anotamos las propiedades-----------
            */

            aTmp[ _CCODPR1 ]     := ( dbfArticulo )->cCodPrp1
            aTmp[ _CCODPR2 ]     := ( dbfArticulo )->cCodPrp2

            if ( !Empty( aTmp[ _CCODPR1 ] ) .or. !Empty( aTmp[ _CCODPR2 ] ) ) .and. uFieldEmpresa( "lUseTbl" )

               nPreCom           := nCosto( nil, dbfArticulo, dbfKit, .f., aTmpFac[ _CDIVFAC ], dbfDiv )

               LoadPropertiesTable( cCodArt, nPreCom, aTmp[ _CCODPR1 ], aTmp[ _CCODPR2 ], dbfPro, dbfTblPro, dbfArtCom, oBrwPrp, aGet[ _NUNICAJA ], aGet[ _NPREUNIT ] )

               oGetIra:Show()

            else

               oBrwPrp:Hide()
               oGetIra:Hide()

               if !Empty( aTmp[ _CCODPR1 ] )

                  if aGet[ _CVALPR1 ] != nil
                     aGet[ _CVALPR1 ]:Show()
                     aGet[ _CVALPR1 ]:SetFocus()
                  end if

                  if oSayPr1 != nil
                     oSayPr1:SetText( retProp( ( dbfArticulo )->cCodPrp1, dbfPro ) )
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

               if !Empty( aTmp[_CCODPR2 ] )

                  if aGet[ _CVALPR2 ] != nil
                     aGet[ _CVALPR2 ]:Show()
                  end if

                  if oSayPr2 != nil
                     oSayPr2:SetText( retProp( ( dbfArticulo )->cCodPrp2, dbfPro ) )
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

            end if

            /*
            Cargamos el codigo de las unidades---------------------------------
            */

            if !Empty( aGet[ _CUNIDAD ] )
               aGet[ _CUNIDAD ]:cText( ( dbfArticulo )->cUnidad )
               aGet[ _CUNIDAD ]:lValid()
            else
               aTmp[ _CUNIDAD ]  := ( dbfArticulo )->cUnidad
            end if

            ValidaMedicion( aTmp, aGet)

         end if

         cPrpArt                 := aTmp[ _CCODPR1 ] + aTmp[ _CCODPR2 ] + aTmp[ _CVALPR1 ] + aTmp[ _CVALPR2 ]

         if ( lChgCodArt ) .or. ( cPrpArt != cOldPrpArt )

            /*
            Precios de Compra-----------------------------------------------------
            */

            nPreCom              := nComPro( aTmp[ _CREF ], aTmp[ _CCODPR1 ], aTmp[ _CVALPR1 ], aTmp[ _CCODPR2 ], aTmp[ _CVALPR2 ], dbfArtCom )
            if nPrecom  != 0

               aGet[ _NPREUNIT ]:cText( nPreCom )

            else

               if uFieldEmpresa( "lCosPrv", .f. )
                  nPreCom     := nPreArtPrv( cCodPrv, cCodArt, dbfArtPrv )
               end if

               if nPreCom != 0
                  aGet[ _NPREUNIT ]:cText( nPreCom )
               else
                  aGet[ _NPREUNIT ]:cText( nCosto( nil, dbfArticulo, dbfKit, .f., aTmpFac[ _CDIVFAC ], dbfDiv ) )
               end if

            end if

         end if

         /*
         Recalculamos los totales de la linea----------------------------------
         */

         lCalcDeta( aTmp, aTmpFac, aGet, oTotal )

      else

         MsgStop( "Art�culo no encontrado" )
         Return .f.

      end if

   end if

   cOldCodArt                    := cCodArt
   cOldPrpArt                    := cPrpArt

Return .t.

//--------------------------------------------------------------------------//

STATIC FUNCTION LoadPreCosto( aGet, oGet )

	local xValor   := aGet[_CREF]:varGet()

	IF Empty( xValor )
		RETURN .F.
	END IF

   if oGet == nil
      return .f.
   end if

   IF ( dbfArticulo )->( dbSeek( xValor ) )
      oGet:cText( ( dbfArticulo )->pCosto )
	END IF

	aGet[_CREF]:bWhen := {|| .F. }

RETURN .F.

//--------------------------------------------------------------------------//

STATIC FUNCTION LoadArtPed( aGet )

   local lValid               := .f.
   local xValor               := aGet[_CREF]:varGet()

	IF Empty( xValor )

		aGet[_NIVA]:cText( 0 )
      aGet[_NIVA]:bWhen       := {|| .t. }

		aGet[_CDETALLE]:cText( Space( 50 ) )
      aGet[_CDETALLE]:bWhen   := {|| .t. }

		RETURN .T.

	END IF

   if ( dbfArticulo )->( dbSeek( xValor ) )

      aGet[_CREF    ]:cText( ( dbfArticulo )->Codigo )
      aGet[_CREF    ]:bWhen   := {|| .t. }

      aGet[_CDETALLE]:cText( ( dbfArticulo )->Nombre )
      aGet[_NPREUNIT]:cText( ( dbfArticulo )->pCosto )

      lValid                  := .t.

   else

      MsgStop( "Art�culo no encontrado" )

   end if

RETURN lValid

//--------------------------------------------------------------------------//

STATIC FUNCTION GetArtPrv( cRefPrv, cCodPrv, aGet )

	local nOrdAnt

   if Empty( cRefPrv )

      return .t.

   else

		nOrdAnt  := ( dbfArtPrv )->( ordSetFocus( 3 ) )

      if ( dbfArtPrv )->( dbSeek( cCodPrv + cRefPrv ) )

         aGet[ _CREF ]:cText( ( dbfArtPrv )->cCodArt )
			aGet[ _CREF ]:lValid()

      else

         msgStop( "Referencia de proveedor no encontrada" )

      end if

		( dbfArtPrv )->( ordSetFocus( nOrdAnt ) )

   end if

return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION SearchFact( oBrw )

	local oDlg
	local xToSearch
	local nNumFac	:= 0
   local cCodCli  := (dbfRctPrvT)->CCODPRV
	local dFactura	:= date()
   local nIndex   := (dbfRctPrvT)->(OrdNumber())

	DEFINE DIALOG oDlg RESOURCE "FINFACPRV"

		REDEFINE GET nNumFac ;
			ID 		130 ;
			PICTURE 	"999999999" ;
			WHEN 		( nIndex == 1 ) ;
			VALID 	( xToSearch := nNumFac, .T. ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET dFactura ;
			ID 		140 ;
			WHEN 		( nIndex == 2 ) ;
			VALID 	( xToSearch := dFactura, .T. ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE GET cCodCli ;
			ID 		150 ;
			WHEN 		( nIndex == 3 ) ;
         VALID    ( xToSearch := cCodCli, .T. ) ;
			COLOR 	CLR_GET ;
			OF 		oDlg

		REDEFINE BUTTON ;
			ID 		504 ;
			OF 		oDlg ;
         ACTION   ( (dbfRctPrvT)->( dbSeek( xToSearch ) ), oBrw:Refresh() )

		REDEFINE BUTTON ;
			ID 		510 ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

	ACTIVATE DIALOG oDlg	CENTER

RETURN NIL

//-------------------------------------------------------------------------//

STATIC FUNCTION EPage( oInf, cCodDoc )

   private nPagina      := oInf:nPage
	private lEnd			:= oInf:lFinish

	/*
	Ahora montamos los Items
	*/

   PrintItems( cCodDoc, oInf )

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION aGetSelRec( oBrw, bAction, cTitle, lHide1, cTitle1, lHide2, cTitle2, bPreAction, bPostAction )

   local oDlg
   local oRad
   local nRad        := 1
   local aRet        := {}
   local oTree
   local oChk1
   local oChk2
   local lChk1       := .t.
   local lChk2       := .t.
   local nRecno      := ( dbfRctPrvT )->( Recno() )
   local nOrdAnt     := ( dbfRctPrvT )->( OrdSetFocus( 1 ) )
   local oSerIni
   local oSerFin
   local cSerIni     := ( dbfRctPrvT )->cSerFac
   local cSerFin     := ( dbfRctPrvT )->cSerFac
   local oDocIni
   local oDocFin
   local nDocIni     := ( dbfRctPrvT )->nNumFac
   local nDocFin     := ( dbfRctPrvT )->nNumFac
   local oSufIni
   local oSufFin
   local cSufIni     := ( dbfRctPrvT )->cSufFac
   local cSufFin     := ( dbfRctPrvT )->cSufFac
   local oMtrInf
   local nMtrInf
   local lFechas     := .t.
   local dDesde      := CtoD( "01/01/" + Str( Year( Date() ) ) )
   local dHasta      := Date()
   local oImageList
   local oBtnCancel

   DEFAULT cTitle    := ""
   DEFAULT lHide1    := .f.
   DEFAULT cTitle1   := ""
   DEFAULT lHide2    := .f.
   DEFAULT cTitle2   := ""

   oImageList        := TImageList():New( 16, 16 )
   oImageList:AddMasked( TBitmap():Define( "Bullet_Square_Red_16" ),    Rgb( 255, 0, 255 ) )
   oImageList:AddMasked( TBitmap():Define( "Bullet_Square_Green_16" ),  Rgb( 255, 0, 255 ) )

   DEFINE DIALOG oDlg RESOURCE "SelectRango" TITLE cTitle

   REDEFINE RADIO oRad VAR nRad ;
      ID       80, 81 ;
      OF       oDlg

   REDEFINE GET oSerIni VAR cSerIni ;
      ID       100 ;
      PICTURE  "@!" ;
      SPINNER ;
      ON UP    ( UpSerie( oSerIni ) );
      ON DOWN  ( DwSerie( oSerIni ) );
      WHEN     ( oRad:nOption == 2 ) ;
      VALID    ( cSerIni >= "A" .and. cSerIni <= "Z" );
      UPDATE ;
      OF       oDlg

   REDEFINE BTNBMP ;
      ID       101 ;
      OF       oDlg ;
      RESOURCE "Up16" ;
      NOBORDER ;
      ACTION   ( dbFirst( dbfRctPrvT, "nNumFac", oDocIni, cSerIni, "nNumFac" ) )

   REDEFINE GET oSerFin VAR cSerFin ;
      ID       110 ;
      PICTURE  "@!" ;
      SPINNER ;
      ON UP    ( UpSerie( oSerFin ) );
      ON DOWN  ( DwSerie( oSerFin ) );
      WHEN     ( oRad:nOption == 2 ) ;
      VALID    ( cSerFin >= "A" .and. cSerFin <= "Z" );
      UPDATE ;
      OF       oDlg

   REDEFINE BTNBMP ;
      ID       111 ;
      OF       oDlg ;
      RESOURCE "Down16" ;
      NOBORDER ;
      ACTION   ( dbLast( dbfRctPrvT, "nNumFac", oDocFin, cSerFin, "nNumFAc" ) )

   REDEFINE GET oDocIni VAR nDocIni;
      ID       120 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( nRad == 2 ) ;
      OF       oDlg

   REDEFINE GET oDocFin VAR nDocFin;
      ID       130 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      WHEN     ( nRad == 2 ) ;
      OF       oDlg

   REDEFINE GET oSufIni VAR cSufIni ;
      ID       140 ;
      PICTURE  "##" ;
      WHEN     ( nRad == 2 ) ;
      OF       oDlg

   REDEFINE GET oSufFin VAR cSufFin ;
      ID       150 ;
      PICTURE  "##" ;
      WHEN     ( nRad == 2 ) ;
      OF       oDlg

   REDEFINE CHECKBOX oChk1 VAR lChk1 ;
      ID       160 ;
		OF 		oDlg

   REDEFINE CHECKBOX oChk2 VAR lChk2 ;
      ID       180 ;
		OF 		oDlg

   /*
   Rango de fechas-------------------------------------------------------------
   */

   REDEFINE CHECKBOX lFechas ;
      ID       300 ;
		OF 		oDlg

   REDEFINE GET dDesde ;
      ID       310 ;
      WHEN     ( !lFechas ) ;
      SPINNER ;
      OF       oDlg

	REDEFINE GET dHasta ;
      ID       320 ;
      WHEN     ( !lFechas ) ;
      SPINNER ;
      OF       oDlg

   /*
   Resultados del proceso------------------------------------------------------
   */

   oTree             := TTreeView():Redefine( 170, oDlg )
   oTree:bLDblClick  := {|| TreeChanged( oTree ) }

   REDEFINE METER oMtrInf ;
      VAR      nMtrInf ;
      NOPERCENTAGE ;
      ID       200 ;
      OF       oDlg

   oMtrInf:SetTotal( ( dbfRctPrvT )->( OrdKeyCount() ) )

   REDEFINE BUTTON ;
      ID       IDOK ;
		OF 		oDlg ;
      ACTION   ( MakSelRec( bAction, bPreAction, bPostAction, cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, nRad, lChk1, lChk2, lFechas, dDesde, dHasta, oDlg, oTree, oBrw, oMtrInf, oBtnCancel ) )

   REDEFINE BUTTON oBtnCancel ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      CANCEL ;
      ACTION   ( oDlg:end() )

   oDlg:bStart := {|| StartGetSelRec( oBrw, oRad, oChk1, oChk2, oSerIni, oSerFin, oDocIni, oDocFin, oSufIni, oSufFin, lHide1, lHide2, cTitle1, cTitle2 ) }

   oDlg:AddFastKey( VK_F5, {|| MakSelRec( bAction, bPreAction, bPostAction, cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, nRad, lChk1, lChk2, lFechas, dDesde, dHasta, oDlg, oTree, oBrw, oMtrInf, oBtnCancel ) } )

   ACTIVATE DIALOG oDlg ;
      CENTER ;
      ON INIT  ( oTree:SetImageList( oImageList ) )

   ( dbfRctPrvT )->( ordSetFocus( nOrdAnt ) )
   ( dbfRctPrvT )->( dbGoTo( nRecNo ) )

   oImageList:End()

   oTree:Destroy()

   oBrw:SetFocus()
   oBrw:Refresh()

RETURN ( aRet )

//---------------------------------------------------------------------------//

Static Function StartGetSelRec( oBrw, oRad, oChk1, oChk2, oSerIni, oSerFin, oDocIni, oDocFin, oSufIni, oSufFin, lHide1, lHide2, cTitle1, cTitle2 )

   if !Empty( oBrw ) .and. ( len( oBrw:oBrw:aSelected ) > 1 )

      oRad:SetOption( 1 )

   else

      oRad:SetOption( 2 )

      oSerIni:Enable()
      oSerFin:Enable()
      oDocIni:Enable()
      oDocFin:Enable()
      oSufIni:Enable()
      oSufFin:Enable()

   end if

   if lHide1
      oChk1:Hide()
   else
      SetWindowText( oChk1:hWnd, cTitle1 )
      oChk1:Refresh()
   end if

   if lHide2
      oChk2:Hide()
   else
      SetWindowText( oChk2:hWnd, cTitle2 )
      oChk2:Refresh()
   end if

Return ( nil )

//---------------------------------------------------------------------------//

Static Function TreeChanged( oTree )

   local oItemTree   := oTree:GetItem()

   if !Empty( oItemTree ) .and. !Empty( oItemTree:bAction )
      Eval( oItemTree:bAction )
   end if

RETURN NIL

//---------------------------------------------------------------------------//

Static Function MakSelRec( bAction, bPreAction, bPostAction, cDocIni, cDocFin, nRad, lChk1, lChk2, lFechas, dDesde, dHasta, oDlg, oTree, oBrw, oMtrInf, oBtnCancel )

   local n        := 0
   local nPos     := 0
   local nRec     := ( dbfRctPrvT )->( Recno() )
   local aPos
   local lRet
   local lPre
   local lWhile   := .t.

   /*
   Preparamos la pantalla para mostrar la simulaci�n---------------------------
   */

   if lChk1
      aPos        := { 0, 0 }
      ClientToScreen( oDlg:hWnd, aPos )
      oDlg:Move( aPos[ 1 ] - 22, aPos[ 2 ] - 510 )
   end if

   /*
   Desabilitamos el dialogo para iniciar el proceso----------------------------
   */

   oDlg:Disable()

   oTree:Enable()
   oTree:DeleteAll()

   oBtnCancel:bAction   := {|| lWhile := .f. }
   oBtnCancel:Enable()

   if !Empty( bPreAction )
      lPre              := Eval( bPreAction )
   end if

   if !IsLogic( lPre ) .or. lPre

      if nRad == 1

         for each nPos in ( oBrw:oBrw:aSelected )

            ( dbfRctPrvT )->( dbGoTo( nPos ) )

            if lFechas .or.( ( dbfRctPrvT )->dFecFac >= dDesde .and. ( dbfRctPrvT )->dFecFac <= dHasta )

               lRet  := Eval( bAction, lChk1, lChk2, oTree, dbfRctPrvT, dbfRctPrvL )

               if IsFalse( lRet )
                  exit
               end if

            end if

            oMtrInf:Set( ++n )

            SysRefresh()

            if !lWhile
               exit
            end if

         next

      else

         ( dbfRctPrvT )->( dbSeek( cDocIni, .t. ) )

         while ( lWhile )                                                                                      .and. ;
               ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac, 9 ) + ( dbfRctPrvT )->cSufFac >= cDocIni .and. ;
               ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac, 9 ) + ( dbfRctPrvT )->cSufFac <= cDocFin .and. ;
               !( dbfRctPrvT )->( eof() )

            if lFechas .or.( ( dbfRctPrvT )->dFecFac >= dDesde .and. ( dbfRctPrvT )->dFecFac <= dHasta )

               lRet  := Eval( bAction, lChk1, lChk2, oTree, dbfRctPrvT, dbfRctPrvL )

               if IsFalse( lRet )
                  exit
               end if

            end if

            oMtrInf:Set( ++n )

            ( dbfRctPrvT )->( dbSkip() )

            SysRefresh()

         end do

      end if

      if !Empty( bPostAction )
         Eval( bPostAction )
      end if

   end if

   oMtrInf:Set( ( dbfRctPrvT )->( OrdKeyCount() ) )

   ( dbfRctPrvT )->( dbGoTo( nRec ) )

   if lChk1
      WndCenter( oDlg:hWnd )
   end if

   oBtnCancel:bAction   := {|| oDlg:End() }

   oDlg:Enable()

   if oBrw != nil
      oBrw:Refresh()
   end if

RETURN ( nil )

//---------------------------------------------------------------------------//
/*
Realiza asientos en Contaplus, partiendo de la factura
*/

STATIC FUNCTION ContabilizaRectificativa( lSimula, lPago, oTree )

	local n
   local nAsiento    := 0
	local cCtaVent
	local nPosicion
	local nPosIva
	local dFecha
   local aTotFac
   local nTotFac
   local nTotRet
	local cConcepto
   local cConCompr
	local cSubCtaIva
	local cSubCtaReq
   local cRuta
   local cCodEmp
   local nImpDeta
   local nDinDiv     := nDinDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
   local nRinDiv     := nRinDiv( ( dbfRctPrvT )->cDivFac, dbfDiv )
	local aSimula		:= {}
	local aIva			:= {}
	local aVentas		:= {}
   local cCodDiv     := ( dbfRctPrvT )->cDivFac
   local cCtaPrv     := cPrvCta( ( dbfRctPrvT )->cCodPrv, dbfPrv )
   local cCtaPrvVta  := cPrvCtaVta( ( dbfRctPrvT )->cCodPrv, dbfPrv )
   local nFactura    := ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac
   local cFactura    := ( dbfRctPrvT )->cSerFac + "/" + Ltrim( Str( ( dbfRctPrvT )->nNumFac ) ) + "/" + ( dbfRctPrvT )->cSufFac
   local nNumFac     := ( dbfRctPrvT )->nNumFac
   local cCodPro     := Left( ( dbfRctPrvT )->cCodPro, 3 )
   local cClave      := Right( ( dbfRctPrvT )->cCodPro, 6 )
   local lErrorFound := .f.
   local cTerNif     := ( dbfRctPrvT )->cDniPrv
   local cTerNom     := ( dbfRctPrvT )->cNomPrv
   local lReturn

	/*
	Chequeando antes de pasar a Contaplus
	*/

   IF ( dbfRctPrvT )->lContab
      oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " ya contabilizada.", 0 )
      lErrorFound    := .t.
   END IF

   IF !ChkRuta( cRutCnt() )
      oTree:Add( "Factura rectificativa : " + rtrim( cFactura ) + " ruta no valida.", 0 )
      lErrorFound    := .t.
   END IF

   /*
	Chequeamos todos los valores
	*/

   cRuta             := cRutCnt()
   cCodEmp           := cCodEmpCnt( ( dbfRctPrvT )->cSerFac )

   if Empty( cCtaPrvVta )
      cCtaPrvVta     := cCtaPrv()
   end if

   if !ChkSubCta( cRutCnt(), cCodEmp, cCtaPrv, , .f., .f. )
      oTree:Add( "Factura rectificativa : " + rtrim( cFactura ) + " subcuenta " + cCtaPrv + " no encontada.", 0 )
      lErrorFound    := .t.
   end if

   /*
   Totales de las facturas
   */

   aTotFac           := aTotRctPrv( nFactura, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP )
   nTotFac           := aTotFac[ 4 ]
   nTotRet           := aTotFac[ 6 ]

	/*
	Estudio de los Articulos de una factura
	*/

   if ( dbfRctPrvL )->( dbSeek( nFactura ) )

      while ( ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac == nFactura .and. !( dbfRctPrvL )->( eof() ) )

         nImpDeta    := nTotLRctPrv( dbfRctPrvL, nDinDiv, nRinDiv, ( dbfRctPrvT )->nVdvFac )

         if nImpDeta != 0

            cCtaVent    := RetCtaCom( ( dbfRctPrvL )->cRef, dbfArticulo )
            if Empty( cCtaVent )
               cCtaVent := cCtaPrvVta + RetGrpVta( ( dbfRctPrvL )->cRef, cRuta, cCodEmp, dbfArticulo, ( dbfRctPrvL )->nIva )
            end if

            nPosicion   := aScan( aVentas, {|x| x[1] == cCtaVent } )
            if nPosicion == 0
               aadd( aVentas, { cCtaVent, nImpDeta } )
            else
               aVentas[ nPosicion, 2 ] += nImpDeta
            end if

            /*
            Construimos las bases de los IGICS
            */

            if ( dbfRctPrvT )->nRegIva == 2
               cSubCtaIva  := uFieldEmpresa( "cCtaCeeRpt" )
               cSubCtaReq  := uFieldEmpresa( "cCtaCeeSpt" )
            else
               cSubCtaIva  := cSubCuentaIva( ( dbfRctPrvL )->nIva, ( dbfRctPrvT )->lRecargo, cRuta, cCodEmp, dbfIva, .f. )
               cSubCtaReq  := cSubCuentaRecargo( ( dbfRctPrvL )->nIva, ( dbfRctPrvT )->lRecargo, cRuta, cCodEmp, dbfIva )
            end if

            nPosIva     := aScan( aIva, {|x| x[1] == ( dbfRctPrvL )->nIva } )
            if nPosIva == 0
               aadd( aIva, { ( dbfRctPrvL )->nIva, cSubCtaIva, cSubCtaReq, nImpDeta } )
            else
               aIva[ nPosIva, 4 ]   += nImpDeta
            end if

         end if

         ( dbfRctPrvL )->( dbSkip() )

      end while

   else

      oTree:Add( "Factura rectificativa : " + rtrim( cFactura ) + " factura sin art�culos.", 0 )
      lErrorFound    := .t.

   end if

   /*
	Descuentos sobres grupos de Venta
	*/

   for n := 1 TO Len( aVentas )

      if ( dbfRctPrvT )->nDtoEsp != 0
         aVentas[ n, 2 ] -= Round( aVentas[ n, 2 ] * ( dbfRctPrvT )->nDtoEsp / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDpp != 0
         aVentas[ n, 2 ] -= Round( aVentas[ n, 2 ] * ( dbfRctPrvT )->nDpp / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDtoUno != 0
         aVentas[ n, 2 ] -= Round( aVentas[ n, 2 ] * ( dbfRctPrvT )->nDtoUno / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDtoDos != 0
         aVentas[ n, 2 ] -= Round( aVentas[ n, 2 ] * ( dbfRctPrvT )->nDtoDos / 100, nRinDiv )
      end if

   next

   /*
   Descuentos sobres grupos de IGIC
	*/

   for n := 1 TO Len( aIva )

      if ( dbfRctPrvT )->nDtoEsp != 0
         aIva[ n, 4 ] -= Round( aIva[ n, 4 ] * ( dbfRctPrvT )->nDtoEsp / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDpp != 0
         aIva[ n, 4 ] -= Round( aIva[ n, 4 ] * ( dbfRctPrvT )->nDpp / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDtoUno != 0
         aIva[ n, 4 ] -= Round( aIva[ n, 4 ] * ( dbfRctPrvT )->nDtoUno / 100, nRinDiv )
      end if

      if ( dbfRctPrvT )->nDtoDos != 0
         aIva[ n, 2 ] -= Round( aIva[ n, 4 ] * ( dbfRctPrvT )->nDtoDos / 100, nRinDiv )
      end if

   next

	/*
   Chequeo de Cuentas de Ventas------------------------------------------------
	*/

   for n := 1 TO len( aVentas )

      if !ChkSubCta( cRutCnt(), cCodEmp, aVentas[ n, 1 ], , .f., .f. )

         oTree:Add( "Factura rectificativa : " + rtrim( cFactura ) + " subcuenta " + aVentas[ n, 1 ] + " no encontada.", 0 )
         lErrorFound    := .t.

      end if

   next

	/*
   Chequeo de Cuentas de IGIC---------------------------------------------------
	*/

   for n := 1 to len( aIva )

      if !ChkSubCta( cRuta, cCodEmp, aIva[ n, 2 ], , .f., .f. )
         oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " subcuenta " + aIva[ n, 2 ] + " no encontada.", 0 )
         lErrorFound    := .t.
      end if

      if !ChkSubCta( cRuta, cCodEmp, aIva[ n, 3 ], , .f., .f. )
         oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " subcuenta " + aIva[ n, 3 ] + " no encontada.", 0 )
         lErrorFound    := .t.
      end if

   next

   if nTotRet != 0

      if !ChkSubCta( cRuta, cCodEmp, cCtaRet(), , .f., .f. )
         oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " subcuenta " + cCtaRet() + " no encontada.", 0 )
         lErrorFound    := .t.
      end if

   end if

	/*
   Comprobamos fechas----------------------------------------------------------
	*/

   if !ChkFecha( , , ( dbfRctPrvT )->dFecFac, .f., oTree )
      lErrorFound    := .t.
   end if

   /*
   Datos comunes a todos los Asientos------------------------------------------
   */

   if lSimula .or. !lErrorFound

      if Empty( ( dbfRctPrvT )->dFecEnt )
         dFecha      := ( dbfRctPrvT )->dFecFac
      else
         dFecha      := ( dbfRctPrvT )->dFecEnt
      end if

      cConCompr      := "S/Rect."
      if !Empty( ( dbfRctPrvT )->cSuPed )
         nNumFac     := Val( ( dbfRctPrvT )->cSuPed )
         cConCompr   += " N." + Rtrim( ( dbfRctPrvT )->cSuPed )
      elseif !Empty( ( dbfRctPrvT )->cNumDoc )
         cConCompr   += " Doc. " + Rtrim( ( dbfRctPrvT )->cNumDoc )
      else
         cConCompr   += " N." + Rtrim( cFactura )
      end if
      cConcepto      := cConCompr + Space( 1 ) + DtoC( ( dbfRctPrvT )->dFecFac )
      cConCompr      += Space( 1 ) + Rtrim( ( dbfRctPrvT )->cNomPrv )

      /*
      Realizaci�n de Asientos-----------------------------------------------------
      */

      if OpenDiario( , cCodEmp )
         nAsiento := RetLastAsi()
      else
         oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " imposible abrir ficheros de contaplus.", 0 )
         return .f.
      end if

      /*
      Asiento de Proveedor________________________________________________________
      */

      aAdd( aSimula, MkAsiento(  nAsiento,;
                                 cCodDiv,;
                                 dFecha,;
                                 cCtaPrv,;
                                 ,;
                                 ,;
                                 cConcepto,;
                                 nTotFac,;
                                 nNumFac,;
                                 ,;
                                 ,;
                                 ,;
                                 ( dbfRctPrvT )->cNumDoc,;
                                 cCodPro,;
                                 cClave,;
                                 ,;
                                 ,;
                                 ,;
                                 lSimula,;
                                 cTerNif,;
                                 cTerNom ) )

      /*
      Asientos de Compras_________________________________________________________
      */

      for n := 1 TO len( aVentas )

         aAdd( aSimula, MkAsiento(  nAsiento,;
                                    cCodDiv,;
                                    dFecha,;
                                    aVentas[ n, 1 ],;
                                    ,;
                                    aVentas[ n, 2 ],;
                                    cConCompr,;
                                    ,;
                                    nNumFac,;
                                    ,;
                                    ,;
                                    ,;
                                    ( dbfRctPrvT )->cNumDoc,;
                                    cCodPro,;
                                    cClave,;
                                    ,;
                                    ,;
                                    ,;
                                    lSimula,;
                                    cTerNif,;
                                    cTerNom ) )

      next

      if ( dbfRctPrvT )->nRegIva == 2

      for n := 1 to len( aIva )

         aadd( aSimula, MkAsiento(  nAsiento, ;
                                    cCodDiv,;
                                    dFecha, ;
                                    aIva[ n, 3 ],;                                        // Cuenta de IGIC
                                    aIva[ n, 2 ],;                                        // Contrapartida
                                    Round( aIva[ n, 1 ] * aIva[ n, 4 ] / 100, nRinDiv ),; // Ptas. Debe
                                    cConCompr,;
                                    Round( aIva[ n, 1 ] * aIva[ n, 4 ] / 100, nRinDiv ),; // Ptas. Haber
                                    nNumFac,;
                                    aIva[ n, 4 ],;
                                    aIva[ n, 1 ],;
                                    If( ( dbfRctPrvT )->lRecargo, nPReq( dbfIva, aIva[ n, 1 ] ), 0 ),;
                                    ( dbfRctPrvT )->cNumDoc,;
                                    cCodPro,;
                                    cClave,;
                                    ,;
                                    ,;
                                    ,;
                                    lSimula,;
                                    cTerNif,;
                                    cTerNom ) )

      next

      else

      /*
      Asientos de IGIC_____________________________________________________________
      */

      for n := 1 TO len( aIva )

         aadd( aSimula, MkAsiento(  nAsiento, ;
                                    cCodDiv,;
                                    dFecha, ;
                                    aIva[ n, 2 ],;    // Cuenta de IGIC
                                    cCtaPrv,;         // Contrapartida
                                    Round( aIva[ n, 1 ] * aIva[ n, 4 ] / 100, nRinDiv ),;
                                    cConCompr,;
                                    ,;                // Ptas. Haber
                                    nNumFac,;
                                    aIva[ n, 4 ],;
                                    aIva[ n, 1 ],;
                                    If( ( dbfRctPrvT )->lRecargo, nPReq( dbfIva, aIva[ n, 1 ] ), 0 ),;
                                    ( dbfRctPrvT )->cNumDoc,;
                                    cCodPro,;
                                    cClave,;
                                    ,;
                                    ,;
                                    ,;
                                    lSimula,;
                                    cTerNif,;
                                    cTerNom ) )

      next

      /*
      Asientos del Recargo________________________________________________________
      */

      if ( dbfRctPrvT )->lRecargo

         for n := 1 TO len( aIva )

            aadd( aSimula, MkAsiento(  nAsiento,;
                                       cCodDiv,;
                                       dFecha,;
                                       aIva[ n, 3 ],; // Cuenta de IGIC
                                       ,;
                                       Round( nPReq( dbfIva, aIva[ n, 1 ] ) * aIva[ n, 4 ] / 100, nRinDiv ),;
                                       cConCompr,;
                                       ,;
                                       nNumFac,;
                                       ,;
                                       ,;
                                       ,;
                                       ( dbfRctPrvT )->cNumDoc,;
                                       cCodPro,;
                                       cClave,;
                                       ,;
                                       ,;
                                       ,;
                                       lSimula,;
                                       cTerNif,;
                                       cTerNom ) )

         next

      end if

      end if

      /*
      Asientos del retenciones________________________________________________________
      */

      if nTotRet != 0

         aadd( aSimula, MkAsiento(  nAsiento,;
                                    cCodDiv,;
                                    dFecha,;
                                    cCtaRet(),;   // Cuenta de retencion
                                    ,;
                                    ,;
                                    cConCompr,;
                                    nTotRet,;
                                    nNumFac,;
                                    ,;
                                    ,;
                                    ,;
                                    ( dbfRctPrvT )->cNumDoc,;
                                    cCodPro,;
                                    cClave,;
                                    ,;
                                    ,;
                                    ,;
                                    lSimula,;
                                    cTerNif,;
                                    cTerNom ) )

      end if

      /*
      Contabilizaci�n de Pagos
      --------------------------------------------------------------------------
      */

      if lPago .and. ( dbfRctPrvP )->( dbSeek( nFactura ) )

         while ( ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac == nFactura ) .AND.;
               !( dbfRctPrvP )->( eof() )

            lReturn  := CntRecPrv( lSimula, oTree, nAsiento, aSimula, .t., dbfRctPrvT, dbfRctPrvP, dbfPrv, dbfFPago, dbfDiv )

            if IsFalse( lReturn )
               exit
            end if

            ( dbfRctPrvP )->( dbSkip() )

         end while

      end if

      /*
      Ponemos la factura como Contabilizada---------------------------------------
      */

      if !lSimula .and. !lErrorFound

         lReturn  := ChgContabilizado( .t., cFactura, nAsiento, oTree )

      else

         lReturn  := msgTblCon( aSimula, cCodDiv, dbfDiv, !lErrorFound, cFactura, {|| aWriteAsiento( aSimula, cCodDiv, .t., oTree, cFactura, nAsiento ), ChgContabilizado( .t., cFactura, nAsiento, oTree ) } )

      end if

      CloseDiario()

   end if

Return ( lReturn )

//----------------------------------------------------------------------------//
/*
Procesa los albaranes de proveedores
*/

STATIC FUNCTION cFacPrv( aGet, oBrw, nMode, aTmp )

   local lValid   := .f.
   local cFactura := aGet[ _CNUMFAC ]:varGet()
   local nOption  := 0

   if nMode != APPD_MODE .OR. Empty( cFactura )
      return .t.
   end if

   if ( dbfFacPrvT )->( dbSeek( cFactura ) )

      if Empty( aTmp[ _CCODPRV ] )
         aGet[ _CCODPRV ]:cText( ( dbfFacPrvT )->cCodPrv )
         aGet[ _CCODPRV ]:lValid()
      end if

      if Empty( aTmp[ _CCODALM ] )
         aGet[ _CCODALM ]:cText( ( dbfFacPrvT )->cCodAlm )
         aGet[ _CCODALM ]:lValid()
      end if

      if Empty( aTmp[ _CCODCAJ ] )
         aGet[ _CCODCAJ ]:cText( ( dbfFacPrvT )->cCodCaj )
         aGet[ _CCODCAJ ]:lValid()
      end if

      if Empty( aTmp[ _CCODPAGO ] )
         aGet[ _CCODPAGO ]:cText( ( dbfFacPrvT )->cCodPago )
         aGet[ _CCODPAGO ]:lValid()
      end if

      if Empty( aTmp[ _CDTOESP ] )
         aGet[ _CDTOESP ]:cText( ( dbfFacPrvT )->cDtoEsp )
      end if

      if Empty( aTmp[ _NDTOESP ] )
         aGet[ _NDTOESP ]:cText( ( dbfFacPrvT )->nDtoEsp )
      end if

      if Empty( aTmp[ _CDPP ] )
         aGet[ _CDPP    ]:cText( ( dbfFacPrvT )->cDpp )
      end if

      if Empty( aTmp[ _NDPP ] )
         aGet[ _NDPP    ]:cText( ( dbfFacPrvT )->nDpp )
      end if

      if Empty( aTmp[ _CDTOUNO ] )
         aGet[ _CDTOUNO ]:cText( ( dbfFacPrvT )->cDtoUno )
      end if

      if Empty( aTmp[ _NDTOUNO ] )
         aGet[ _NDTOUNO ]:cText( ( dbfFacPrvT )->nDtoUno )
      end if

      if Empty( aTmp[ _CDTODOS ] )
         aGet[ _CDTODOS ]:cText( ( dbfFacPrvT )->cDtoDos )
      end if

      if Empty( aTmp[ _NDTODOS ] )
         aGet[ _NDTODOS ]:cText( ( dbfFacPrvT )->nDtoDos )
      end if

      if Empty( aTmp[ _MCOMENT ] )
         aGet[ _MCOMENT ]:cText( ( dbfFacPrvT )->cObserv )
      end if

      aGet[ _NREGIVA ]:nOption( Max( ( dbfPrv )->nRegIva, 1 ) )
      aGet[ _NREGIVA ]:Refresh()


      if !Empty( nTipRet )
         aGet[ _NPCTRET ]:Select( ( dbfFacPrvT )->nTipRet )
         aGet[ _NPCTRET ]:Refresh()
      end if

      if Empty( aTmp[ _MCOMENT ] )
         aGet[ _NPCTRET ]:cText( ( dbfFacPrvT )->nPctRet )
      end if

      /*
      Si lo encuentra----------------------------------------------------------
      */

      nOption           := nImportaLineas()

      if nOption >= 1                              .and.;
         ( dbfFacPrvL )->( dbSeek( cFactura ) )

         while ( ( dbfFacPrvL )->cSerFac + Str( ( dbfFacPrvL )->nNumFac ) + ( dbfFacPrvL )->cSufFac == cFactura )

            ( dbfTmp )->( dbAppend() )

            ( dbfTmp )->cRef     := ( dbfFacPrvL )->cRef
            ( dbfTmp )->cDetalle := ( dbfFacPrvL )->cDetalle
            ( dbfTmp )->mLngDes  := ( dbfFacPrvL )->mLngDes
            ( dbfTmp )->mNumSer  := ( dbfFacPrvL )->mNumSer
            ( dbfTmp )->nIva     := ( dbfFacPrvL )->nIva
            ( dbfTmp )->nReq     := ( dbfFacPrvL )->nReq
            ( dbfTmp )->nPreUnit := ( dbfFacPrvL )->nPreUnit
            ( dbfTmp )->nUniCaja := if( nOption == 2, ( ( dbfFacPrvL )->nUniCaja * -1 ), ( dbfFacPrvL )->nUniCaja )
            ( dbfTmp )->nCanEnt  := ( dbfFacPrvL )->nCanEnt
            ( dbfTmp )->nDtoLin  := ( dbfFacPrvL )->nDtoLin
            ( dbfTmp )->nDtoPrm  := ( dbfFacPrvL )->nDtoPrm
            ( dbfTmp )->nDtoRap  := ( dbfFacPrvL )->nDtoRap
            ( dbfTmp )->cAlmLin  := ( dbfFacPrvL )->cAlmLin
            ( dbfTmp )->nNumLin  := ( dbfFacPrvL )->nNumLin
            ( dbfTmp )->nUndKit  := ( dbfFacPrvL )->nUndKit
            ( dbfTmp )->lKitChl  := ( dbfFacPrvL )->lKitChl
            ( dbfTmp )->lKitArt  := ( dbfFacPrvL )->lKitArt
            ( dbfTmp )->lKitPrc  := ( dbfFacPrvL )->lKitPrc
            ( dbfTmp )->cCodPr1  := ( dbfFacPrvL )->cCodPr1                              // Cod. prop. 1
            ( dbfTmp )->cCodPr2  := ( dbfFacPrvL )->cCodPr2                              // Cod. prop. 2
            ( dbfTmp )->cValPr1  := ( dbfFacPrvL )->cValPr1                              // Val. prop. 1
            ( dbfTmp )->cValPr2  := ( dbfFacPrvL )->cValPr2                              // Val. prop. 2
            ( dbfTmp )->lLote    := ( dbfFacPrvL )->lLote
            ( dbfTmp )->nLote    := ( dbfFacPrvL )->nLote
            ( dbfTmp )->cLote    := ( dbfFacPrvL )->cLote
            ( dbfTmp )->mObsLin  := ( dbfFacPrvL )->mObsLin
            ( dbfTmp )->cRefPrv  := ( dbfFacPrvL )->cRefPrv
            ( dbfTmp )->cUnidad  := ( dbfFacPrvL )->cUnidad
            ( dbfTmp )->nNumMed  := ( dbfFacPrvL )->nNumMed
            ( dbfTmp )->nMedUno  := ( dbfFacPrvL )->nMedUno
            ( dbfTmp )->nMedDos  := ( dbfFacPrvL )->nMedDos
            ( dbfTmp )->nMedTre  := ( dbfFacPrvL )->nMedTre
            ( dbfTmp )->dFecCad  := ( dbfFacPrvL )->dFecCad
            ( dbfTmp )->lGasSup  := ( dbfFacPrvL )->lGasSup

            ( dbfFacPrvL )->( dbSkip() )

         end while

         ( dbfTmp )->( dbGoTop() )

         oBrw:Refresh()

      end if

      aGet[ _CNUMFAC ]:bWhen     := {|| .f. }

   else

      MsgStop( "Factura no encontrada." )

   end if

   nTotRctPrv( nil, dbfRctPrvT, dbfTmp, dbfIva, dbfDiv, dbfRctPrvP, aTmp )

RETURN lValid

//---------------------------------------------------------------------------//

FUNCTION mkRctPrv( cPath, oMeter )

   if oMeter != nil
		oMeter:cText	:= "Generando Bases"
		sysrefresh()
   end if

   CreateFiles( cPath )

   rxRctPrv( cPath, oMeter )

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION rxRctPrv( cPath, oMeter )

   local dbfRctPrvT
   local dbfRctPrvL

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "RctPrvT.Dbf" ) .OR. ;
      !lExistTable( cPath + "RctPrvL.Dbf" ) .OR. ;
      !lExistTable( cPath + "RctPrvI.Dbf" ) .OR. ;
      !lExistTable( cPath + "RctPrvD.Dbf" ) .OR. ;
      !lExistTable( cPath + "RctPrvS.Dbf" )
      CreateFiles( cPath )
   end if

	/*
	Eliminamos los indices
	*/

   fEraseIndex( cPath + "RctPrvT.Cdx" )
   fEraseIndex( cPath + "RctPrvL.Cdx" )
   fEraseIndex( cPath + "RctPrvI.Cdx" )
   fEraseIndex( cPath + "RctPrvD.Cdx" )
   fEraseIndex( cPath + "RctPrvS.Cdx" )

   dbUseArea( .t., cDriver(), cPath + "RctPrvT.DBF", cCheckArea( "FACPRVT", @dbfRctPrvT ), .f. )

   if !( dbfRctPrvT )->( neterr() )

      ( dbfRctPrvT )->( __dbPack() )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "NNUMFAC", "CSERFAC + STR( NNUMFAC ) + CSUFFAC", {|| Field->CSERFAC + STR( Field->NNUMFAC ) + Field->CSUFFAC } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "DFECFAC", "DFECFAC", {|| Field->DFECFAC } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "CCODPRV", "CCODPRV", {|| Field->CCODPRV } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "CNOMPRV", "Upper( CNOMPRV )", {|| Upper( Field->CNOMPRV ) } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "cNumDoc", "Upper( cNumDoc )", {|| Upper( Field->cNumDoc ) } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.CDX", "cTurFac", "cTurFac + cSufFac + cCodCaj", {|| Field->CTURFAC + Field->CSUFFAC + Field->cCodCaj } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.Cdx", "cCodUsr", "Field->cCodUsr + Dtos( Field->dFecChg ) + Field->cTimChg", {|| Field->cCodUsr + Dtos( Field->dFecChg ) + Field->cTimChg } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.Cdx", "cCodPago", "cCodPago", {|| Field->cCodPago } ) )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvT.Cdx", "cNumFac", "cNumFac", {|| Field->cNumFac } ) )

      ( dbfRctPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de facturas rectificativas de proveedores" )
   end if

   /*
   Nuevo Area------------------------------------------------------------------
   */

   dbUseArea( .t., cDriver(), cPath + "RctPrvL.DBF", cCheckArea( "FACPRVL", @dbfRctPrvL ), .f. )
   if !( dbfRctPrvL )->( neterr() )
      ( dbfRctPrvL )->( __dbPack() )

      ( dbfRctPrvL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvL )->( ordCreate( cPath + "RctPrvL.CDX", "NNUMFAC", "CSERFAC + STR( NNUMFAC ) + CSUFFAC", {|| Field->CSERFAC + STR( Field->NNUMFAC ) + Field->CSUFFAC } ) )

      ( dbfRctPrvL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvL )->( ordCreate( cPath + "RctPrvL.CDX", "cRef", "cRef + cValPr1 + cValPr2", {|| Field->cRef + Field->cValPr1 + Field->cValPr2 }, ) )

      ( dbfRctPrvL )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvL )->( ordCreate( cPath + "RctPrvL.CDX", "Lote", "cLote", {|| Field->cLote }, ) )

      ( dbfRctPrvL )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de facturas rectificativas de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "RctPrvI.DBF", cCheckArea( "FacPrvI", @dbfRctPrvT ), .f. )
   if !( dbfRctPrvT )->( neterr() )
      ( dbfRctPrvT )->( __dbPack() )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvI.CDX", "nNumFac", "cSerFac + Str( nNumFac ) + cSufFac", {|| Field->cSerFac + STR( Field->nNumFac ) + Field->cSufFac } ) )

      ( dbfRctPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de facturas rectificativas de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "RctPrvD.DBF", cCheckArea( "FacPrvD", @dbfRctPrvT ), .f. )
   if !( dbfRctPrvT )->( neterr() )
      ( dbfRctPrvT )->( __dbPack() )

      ( dbfRctPrvT )->( ordCondSet("!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvD.CDX", "nNumFac", "cSerFac + STR( nNumFac ) + cSufFac", {|| Field->cSerFac + STR( Field->nNumFac ) + Field->cSufFac } ) )

      ( dbfRctPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de facturas rectificativas de proveedores" )
   end if

   dbUseArea( .t., cDriver(), cPath + "RctPrvS.DBF", cCheckArea( "RctPrvS", @dbfRctPrvT ), .f. )
   if !( dbfRctPrvT )->( neterr() )
      ( dbfRctPrvT )->( __dbPack() )

      ( dbfRctPrvT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvS.CDX", "nNumFac", "cSerFac + Str( nNumFac ) + cSufFac + Str( nNumLin )", {|| Field->cSerFac + Str( Field->nNumFac ) + Field->cSufFac + Str( Field->nNumLin ) } ) )

      ( dbfRctPrvT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvS.CDX", "cRefSer", "cRef + cAlmLin + cNumSer", {|| Field->cRef + Field->cAlmLin + Field->cNumSer } ) )

      ( dbfRctPrvT )->( ordCondSet( "!Deleted()", {||!Deleted()}  ) )
      ( dbfRctPrvT )->( ordCreate( cPath + "RctPrvS.CDX", "cNumSer", "cNumSer", {|| Field->cNumSer } ) )

      ( dbfRctPrvT )->( dbCloseArea() )
   else
      msgStop( "Imposible abrir en modo exclusivo la tabla de numeros de series de facturas rectificativas de proveedores" )
   end if

RETURN NIL

//--------------------------------------------------------------------------//

STATIC FUNCTION BeginTrans( aTmp, nMode )

   local oError
   local oBlock
   local lErrors     := .f.
   local cDbf        := "FPrvL"
   local cDbfInc     := "FPrvI"
   local cDbfDoc     := "FPrvD"
   local cDbfPgo     := "FPrvP"
   local cDbfSer     := "FPrvS"
   local nFactura    := aTmp[ _CSERFAC ] + Str( aTmp[ _NNUMFAC ] ) + aTmp[ _CSUFFAC ]

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      aNumAlb        := {}

      cNewFile       := cGetNewFileName( cPatTmp() + cDbf )
      cTmpInc        := cGetNewFileName( cPatTmp() + cDbfInc )
      cTmpDoc        := cGetNewFileName( cPatTmp() + cDbfDoc )
      cTmpPgo        := cGetNewFileName( cPatTmp() + cDbfPgo )
      cTmpSer        := cGetNewFileName( cPatTmp() + cDbfSer )

      /*
      Primero Crear la base de datos local
      */

      dbCreate( cNewFile, aSqlStruct( aColRctPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cNewFile, cCheckArea( cDbf, @dbfTmp ), .f. )

      if !( dbfTmp )->( neterr() )

         ( dbfTmp )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmp )->( OrdCreate( cNewFile, "nNumLin", "Str( nNumLin, 4 )", {|| Str( Field->nNumLin ) } ) )

         ( dbfTmp )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmp )->( OrdCreate( cNewFile, "Recno", "Str( Recno() )", {|| Str( Recno() ) } ) )

      end if

      /*
      A�adimos desde el fichero de lineas
      */

      if ( dbfRctPrvL )->( dbSeek( nFactura ) )

         while ( ( dbfRctPrvL )->CSERFAC + Str( ( dbfRctPrvL )->NNUMFAC ) + ( dbfRctPrvL )->CSUFFAC == nFactura .AND. !( dbfRctPrvL )->( eof() ) )

            dbPass( dbfRctPrvL, dbfTmp, .t. )
            ( dbfRctPrvL )->( dbSkip() )

         end while

      end if

      ( dbfTmp )->( dbGoTop() )

      /*
      Creamos la tabla temporal de incidencias
      */

      dbCreate( cTmpInc, aSqlStruct( aIncRctPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpInc, cCheckArea( cDbfInc, @dbfTmpInc ), .f. )
      if !( dbfTmpInc )->( neterr() )
         ( dbfTmpInc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpInc )->( ordCreate( cTmpInc, "Recno", "Recno()", {|| Recno() } ) )
      end if

      /*
      A�adimos desde el fichero de incidencias
      */

      if ( dbfRctPrvI )->( dbSeek( nFactura ) )

         while ( ( dbfRctPrvI )->cSerFac + Str( ( dbfRctPrvI )->nNumFac ) + ( dbfRctPrvI )->cSufFac == nFactura ) .AND. ( dbfRctPrvI )->( !eof() )

            dbPass( dbfRctPrvI, dbfTmpInc, .t. )
            ( dbfRctPrvI )->( dbSkip() )

         end while

      end if

      ( dbfTmpInc )->( dbGoTop() )

      /*
      Creamos la tabla temporal de documentos
      */

      dbCreate( cTmpDoc, aSqlStruct( aFacPrvDoc() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpDoc, cCheckArea( cDbfDoc, @dbfTmpDoc ), .f. )
      if !( dbfTmpDoc )->( neterr() )
         ( dbfTmpDoc )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpDoc )->( ordCreate( cTmpDoc, "Recno", "Recno()", {|| Recno() } ) )
      end if

      /*
      A�adimos desde el fichero de incidencias
      */

      if ( dbfRctPrvD )->( dbSeek( nFactura ) )
         while ( ( dbfRctPrvD )->cSerFac + Str( ( dbfRctPrvD )->nNumFac ) + ( dbfRctPrvD )->cSufFac == nFactura ) .AND. ( dbfRctPrvD )->( !eof() )
            dbPass( dbfRctPrvD, dbfTmpDoc, .t. )
            ( dbfRctPrvD )->( dbSkip() )
         end while
      end if

      ( dbfTmpDoc )->( dbGoTop() )

      /*
      Creamos el fichero de series------------------------------------------------
      */

      dbCreate( cTmpSer, aSqlStruct( aSerRctPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpSer, cCheckArea( cDbf, @dbfTmpSer ), .f. )

      if !( dbfTmpSer )->( neterr() )
         ( dbfTmpSer )->( OrdCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpSer )->( OrdCreate( cTmpSer, "nNumLin", "Str( nNumLin, 4 ) + cRef", {|| Str( Field->nNumLin, 4 ) + Field->cRef } ) )
      end if

      /*
      A�adimos desde el fichero de series-----------------------------------------
      */

      if ( dbfRctPrvS )->( dbSeek( nFactura ) )
         while ( ( dbfRctPrvS )->cSerFac + Str( ( dbfRctPrvS )->nNumFac ) + ( dbfRctPrvS )->cSufFac == nFactura .and. !( dbfRctPrvS )->( eof() ) )
            dbPass( dbfRctPrvS, dbfTmpSer, .t. )
            ( dbfRctPrvS )->( dbSkip() )
         end while
      end if

      ( dbfTmpSer )->( dbGoTop() )

      /*
      Creamos la tabla temporal de pagos a proveedores
      */

      dbCreate( cTmpPgo, aSqlStruct( aItmRecPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), cTmpPgo, cCheckArea( cDbfPgo, @dbfTmpPgo ), .f. )
      if !( dbfTmpPgo )->( neterr() )

         ( dbfTmpPgo )->( ordCondSet( "!Deleted() .and. !Empty( cTipRec )", {|| !Deleted() .and. !Empty( Field->cTipRec ) } ) )
         ( dbfTmpPgo )->( ordCreate( cTmpPgo, "rNumFac", "cSerFac + Str( nNumFac ) + cSufFac + Str( nNumRec )", {|| Field->cSerFac + Str( Field->nNumFac ) + Field->cSufFac + Str( Field->nNumRec ) }, ) )

         ( dbfTmpPgo )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
         ( dbfTmpPgo )->( ordCreate( cTmpPgo, "cRecDev", "CRECDEV", {|| Field->CRECDEV } ) )

         ( dbfTmpPgo )->( ordCondSet( "!Deleted()", {|| !Deleted() } ) )
         ( dbfTmpPgo )->( ordCreate( cTmpPgo, "nNumFac", "cSerFac + Str( nNumFac ) + cSufFac + Str( nNumRec )", {|| Field->cSerFac + Str( Field->nNumFac ) + Field->cSufFac + Str( Field->nNumRec ) }, ) )

         ( dbfTmpPgo )->( ordCondSet( "!Deleted()", {||!Deleted() } ) )
         ( dbfTmpPgo )->( ordCreate( cTmpPgo, "Recno", "Recno()", {|| Recno() } ) )

      end if

      /*
      A�adimos desde el fichero de pagos
      */

      if ( dbfRctPrvP )->( dbSeek( nFactura ) ) .and. nMode != DUPL_MODE

         while ( ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac == nFactura ) .and. ( dbfRctPrvP )->( !eof() )

            dbPass( dbfRctPrvP, dbfTmpPgo, .t. )

            ( dbfRctPrvP )->( dbSkip() )

         end while

      end if

      ( dbfTmpPgo )->( dbGoTop() )

   RECOVER USING oError

      msgStop( "Imposible crear tablas temporales." + CRLF + ErrorMessage( oError ) )

      KillTrans()

      lErrors     := .t.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lErrors )

//---------------------------------------------------------------------------//

Function aIncRctPrv()

   local aIncFacPrv  := {}

   aAdd( aIncFacPrv, { "cSerFac", "C",    1,  0, "Serie de factura" ,              "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "nNumFac", "N",    9,  0, "N�mero de factura" ,             "'999999999'",        "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "cSufFac", "C",    2,  0, "Sufijo de factura" ,             "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "cCodTip", "C",    3,  0, "Tipo de incidencia" ,            "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "dFecInc", "D",    8,  0, "Fecha de la incidencia" ,        "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "mDesInc", "M",   10,  0, "Descripci�n de la incidencia" ,  "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "lListo",  "L",    1,  0, "L�gico de listo" ,               "",                   "", "( cDbfCol )" } )
   aAdd( aIncFacPrv, { "lAviso",  "L",    1,  0, "L�gico de aviso" ,               "",                   "", "( cDbfCol )" } )

Return ( aIncFacPrv )

//---------------------------------------------------------------------------//

Function aRctPrvDoc()

   local aFacPrvDoc  := {}

   aAdd( aFacPrvDoc, { "cSerFac", "C",    1,  0, "Serie de facturas" ,               "",                   "", "( cDbfCol )" } )
   aAdd( aFacPrvDoc, { "nNumFac", "N",    9,  0, "N�mero de facturas" ,              "'999999999'",        "", "( cDbfCol )" } )
   aAdd( aFacPrvDoc, { "cSufFac", "C",    2,  0, "Sufijo de facturas" ,              "",                   "", "( cDbfCol )" } )
   aAdd( aFacPrvDoc, { "cNombre", "C",  250,  0, "Nombre del documento" ,            "",                   "", "( cDbfCol )" } )
   aAdd( aFacPrvDoc, { "cRuta",   "C",  250,  0, "Ruta del documento" ,              "",                   "", "( cDbfCol )" } )
   aAdd( aFacPrvDoc, { "mObsDoc", "M",   10,  0, "Observaciones del documento" ,     "",                   "", "( cDbfCol )" } )

Return ( aFacPrvDoc )

//---------------------------------------------------------------------------//

Function aSerRctPrv()

   local aColFacPrv  := {}

   aAdd( aColFacPrv,  { "cSerFac", "C",  1,   0, "",                                 "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "nNumFac", "N",  9,   0, "",                                 "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "cSufFac", "C",  2,   0, "",                                 "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "nNumLin", "N",  4,   0, "N�mero de la l�nea",               "'9999'",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "cRef",    "C", 18,   0, "Referencia del art�culo",          "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "cAlmLin", "C",  3,   0, "C�digo de almacen",                "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "lUndNeg", "L",  1,   0, "L�gico de unidades en negativo",   "",                  "", "( cDbfCol )" } )
   aAdd( aColFacPrv,  { "cNumSer", "C", 30,   0, "Numero de serie",                  "",                  "", "( cDbfCol )" } )

Return ( aColFacPrv )

//---------------------------------------------------------------------------//


STATIC FUNCTION EndTrans( aTmp, aGet, oBrw, oBrwLin, nMode, nDec, oDlg, oFld )

   local aTbl
   local nItem
   local nNumLin
   local cSerFac
   local nNumFac
   local cSufFac
   local oError
   local oBlock

   if Empty( aTmp[ _CSERFAC ] )
      aTmp[ _CSERFAC ]  := "A"
   end if

   nNumLin              := 1
   cSerFac              := aTmp[ _CSERFAC ]
   nNumFac              := aTmp[ _NNUMFAC ]
   cSufFac              := aTmp[ _CSUFFAC ]

   /*
   Comprobamos la fecha del documento
   */

   if !lValidaOperacion( aTmp[ _DFECFAC ] )
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

   if Empty( aTmp[ _CCODPAGO ] )
      msgStop( "Forma de pago no puede estar vac�a." )
      aGet[ _CCODPAGO ]:SetFocus()
      return .f.
   end if

   if Empty( aTmp[ _CNUMFAC ] )
      msgStop( "N�mero de factura no puede estar vacia." )
      aGet[ _CNUMFAC ]:SetFocus()
      return .f.
   end if

   if !aTmp[ _LFACGAS ] .and. ( dbfTmp )->( lastrec() ) == 0
      MsgStop( "No puede almacenar un documento sin l�neas." )
      return .f.
   end if

   if Empty( aTmp[ _CMOTREC ] )
      MsgStop( "Debe indicar un motivo para la factura rectificativa." )
      oFld:SetOption( 2 )
      aGet[ _CMOTREC ]:SetFocus()
      return .f.
   end if

   if Empty( aTmp[ _CCAUREC ] )
      MsgStop( "Debe indicar una causa por la que se emite la factura rectificativa." )
      oFld:SetOption( 2 )
      aGet[ _CCAUREC ]:SetFocus()
      return .f.
   end if

   /*
   Para q nadie toque mientras grabamos----------------------------------------
   */

   CursorWait()

   oDlg:Disable()

   oMsgText( "Archivando" )

   oBlock      := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   //BeginTransaction()

   /*
	Primero hacer el RollBack
	*/

   aTmp[ _DFECCHG ]  := GetSysDate()
   aTmp[ _CTIMCHG ]  := Time()

	/*
	RollBack en edici�n de registros
	*/

   do case
   case nMode == APPD_MODE .or. nMode == DUPL_MODE

      // Nuevo numero de la factura

      nNumFac           := nNewDoc( cSerFac, dbfRctPrvT, "nRctPrv", , dbfCount )
      aTmp[ _NNUMFAC ]  := nNumFac

   case nMode == EDIT_MODE

      // oStock:RctPrv( cSerFac + Str( nNumFac ) + cSufFac, ( dbfRctPrvT )->cCodAlm, .t., .f. )

      while ( dbfRctPrvL )->( dbSeek( cSerFac + str( nNumFac ) + cSufFac ) .and. !( dbfRctPrvL )->( eof() ) )
         if dbLock( dbfRctPrvL )
            ( dbfRctPrvL )->( dbDelete() )
            ( dbfRctPrvL )->( dbUnLock() )
         end if
      end while

      while ( dbfRctPrvI )->( dbSeek( cSerFac + str( nNumFac ) + cSufFac ) .and. !( dbfRctPrvI )->( eof() ) )
         if dbLock( dbfRctPrvI )
            ( dbfRctPrvI )->( dbDelete() )
            ( dbfRctPrvI )->( dbUnLock() )
         end if
      end while

      while ( dbfRctPrvD )->( dbSeek( cSerFac + str( nNumFac ) + cSufFac ) .and. !( dbfRctPrvD )->( eof() ) )
         if dbLock( dbfRctPrvD )
            ( dbfRctPrvD )->( dbDelete() )
            ( dbfRctPrvD )->( dbUnLock() )
         end if
      end while

      while ( dbfRctPrvP )->( dbSeek( cSerFac + str( nNumFac ) + cSufFac ) .and. !( dbfRctPrvP )->( eof() ) )
         if dbLock( dbfRctPrvP )
            ( dbfRctPrvP )->( dbDelete() )
            ( dbfRctPrvP )->( dbUnLock() )
         end if
      end while

      while ( dbfRctPrvS )->( dbSeek( cSerFac + Str( nNumFac ) + cSufFac ) )
         if dbLock( dbfRctPrvS )
            ( dbfRctPrvS )->( dbDelete() )
            ( dbfRctPrvS )->( dbUnLock() )
         end if
      end while

   end case

   /*
   Quitamos los filtros
   */

   ( dbfTmp )->( dbClearFilter() )

   oMsgProgress()
   oMsgProgress():SetRange( 0, ( dbfTmp )->( LastRec() ) )

	/*
   Ahora escribimos en el fichero definitivo-----------------------------------
	*/

   ( dbfTmp )->( dbGoTop() )
   while !( dbfTmp )->( eof() )

      aTbl                                               := dbScatter( dbfTmp )
      aTbl[ _CSERFAC ]                                   := cSerFac
      aTbl[ _NNUMFAC ]                                   := nNumFac
      aTbl[ _CSUFFAC ]                                   := cSufFac
      aTbl[ ( dbfRctPrvL )->( FieldPos( "dFecFac" ) ) ]  := aTmp[ _DFECFAC ]

      dbGather( aTbl, dbfRctPrvL, .t. )

      ( dbfTmp )->( dbSkip() )

      oMsgProgress():Deltapos( 1 )

   end while

   /*
   Ahora escribimos en el fichero definitivo de incidencias--------------------
	*/

   ( dbfTmpInc )->( dbGoTop() )
   while ( dbfTmpInc )->( !eof() )
      dbPass( dbfTmpInc, dbfRctPrvI, .t., cSerFac, nNumFac, cSufFac )
      ( dbfTmpInc )->( dbSkip() )
   end while

   /*
   Ahora escribimos en el fichero definitivo de documentos---------------------
	*/

   ( dbfTmpDoc )->( dbGoTop() )
   while ( dbfTmpDoc )->( !eof() )
      dbPass( dbfTmpDoc, dbfRctPrvD, .t., cSerFac, nNumFac, cSufFac )
      ( dbfTmpDoc )->( dbSkip() )
   end while

   /*
   Escribimos el fichero definitivo de series---------------------------------
   */

   ( dbfTmpSer )->( dbGoTop() )
   while ( dbfTmpSer )->( !eof() )
      dbPass( dbfTmpSer, dbfRctPrvS, .t., cSerFac, nNumFac, cSufFac )
      ( dbfTmpSer )->( dbSkip() )
   end while

   /*
   Si cambia el cliente en la factura, lo cambiamos en los recibos-------------
   */

   ( dbfTmpPgo )->( dbGoTop() )

   while ( dbfTmpPgo )->( !eof() )

      if ( dbfTmpPgo )->cCodPrv != aTmp[ _CCODPRV ]
         ( dbfTmpPgo )->cCodPrv := aTmp[ _CCODPRV ]
      end if

      if ( dbfTmpPgo )->cNomPrv != aTmp[ _CNOMPRV ]
         ( dbfTmpPgo )->cNomPrv := aTmp[ _CNOMPRV ]
      end if

      ( dbfTmpPgo )->( dbSkip() )

   end while

   /*
   Ahora escribimos en el fichero definitivo de pagos--------------------------
	*/

   ( dbfTmpPgo )->( dbGoTop() )
   while ( dbfTmpPgo )->( !eof() )
      dbPass( dbfTmpPgo, dbfRctPrvP, .t., cSerFac, nNumFac, cSufFac )
      ( dbfTmpPgo )->( dbSkip() )
   end while

   /*
   Guardamos  los campos de totales--------------------------------------------
   */

   aTmp[ _NTOTNET ]   := nTotNet
   aTmp[ _NTOTSUP ]   := nTotSup
   aTmp[ _NTOTIVA ]   := nTotIva
   aTmp[ _NTOTREQ ]   := nTotReq
   aTmp[ _NTOTFAC ]   := nTotFac

   /*
   Grabamos las cabeceras de los albaranes
   */

   WinGather( aTmp, , dbfRctPrvT, , nMode )

   /*
   Generar los pagos de las facturas
   */

   GenPgoRctPrv( cSerFac + Str( nNumFac ) + cSufFac, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfPrv, dbfFPago, dbfDiv )

   /*
   Escribe los datos pendientes------------------------------------------------
   */

   dbCommitAll()

   RECOVER USING oError

      RollBackTransaction()
      msgStop( "Imposible almacenar documentos" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   oMsgText()
   EndProgress()

   oDlg:Enable()
   oDlg:End( IDOK )

   CursorWE()

RETURN .T.

//------------------------------------------------------------------------//

STATIC FUNCTION KillTrans( oBrwLin )

	/*
	Borramos los ficheros
	*/

   if !Empty( dbfTmp ) .and. ( dbfTmp )->( Used() )
      ( dbfTmp )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpInc ) .and. ( dbfTmpInc )->( Used() )
      ( dbfTmpInc )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpDoc ) .and. ( dbfTmpDoc )->( Used() )
      ( dbfTmpDoc )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpPgo ) .and. ( dbfTmpPgo )->( Used() )
      ( dbfTmpPgo )->( dbCloseArea() )
   end if

   if !Empty( dbfTmpSer ) .and. ( dbfTmpSer )->( Used() )
      ( dbfTmpSer )->( dbCloseArea() )
   end if

   dbfTmp            := nil
   dbfTmpInc         := nil
   dbfTmpDoc         := nil
   dbfTmpPgo         := nil
   dbfTmpSer         := nil

   dbfErase( cNewFile )
   dbfErase( cTmpInc  )
   dbfErase( cTmpDoc  )
   dbfErase( cTmpPgo  )
   dbfErase( cTmpSer  )

   if !Empty( oMnuRec )
      oMnuRec:End()
   end if

   memory( -1 )

   if oBrwLin != nil
      oBrwLin:CloseData()
   end if

RETURN NIL

//------------------------------------------------------------------------//

STATIC FUNCTION CreateFiles( cPath )

   if !lExistTable( cPath + "RctPrvT.DBF" )
      dbCreate( cPath + "RctPrvT.DBF", aSqlStruct( aItmRctPrv() ), cDriver() )
   end if
   if !lExistTable( cPath + "RctPrvL.DBF" )
      dbCreate( cPath + "RctPrvL.DBF", aSqlStruct( aColRctPrv() ), cDriver() )
   end if
   if !lExistTable( cPath + "RctPrvI.DBF" )
      dbCreate( cPath + "RctPrvI.DBF", aSqlStruct( aIncRctPrv() ), cDriver() )
   end if
   if !lExistTable( cPath + "RctPrvD.DBF" )
      dbCreate( cPath + "RctPrvD.DBF", aSqlStruct( aFacPrvDoc() ), cDriver() )
   end if
   if !lExistTable( cPath + "RctPrvS.Dbf" )
      dbCreate( cPath + "RctPrvS.Dbf", aSqlStruct( aSerRctPrv() ), cDriver() )
   end if

RETURN NIL

//----------------------------------------------------------------------------//

/*
Devuelve la fecha de una factura de proveedor
*/

FUNCTION dFecRctPrv( cFacPrv, dbfRctPrvT )

	local dFecFac	:= Ctod("")

   IF (dbfRctPrvT)->( dbSeek( cFacPrv ) )
      dFecFac  := (dbfRctPrvT)->DFECFAC
	END IF

RETURN ( dFecFac )

//----------------------------------------------------------------------------//
/*
Devuelve el codigo del Proveedor pasando un numero de factura
*/

FUNCTION cPrvRctPrv( cFacPrv, dbfRctPrvT )

	local cCodPrv	:= ""

   IF (dbfRctPrvT)->( dbSeek( cFacPrv ) )
      cCodPrv  := (dbfRctPrvT)->CCODPRV
	END IF

RETURN ( cCodPrv )

//----------------------------------------------------------------------------//
/*
Devuelve el Nombre del Proveedor pasando un numero de factura
*/

FUNCTION cNbrRctPrv( cFacPrv, dbfRctPrvT )

	local cNomPrv	:= ""

   IF (dbfRctPrvT)->( dbSeek( cFacPrv ) )
      cNomPrv  := (dbfRctPrvT)->CNOMPRV
	END IF

RETURN ( cNomPrv )

//--------------------------------------------------------------------------//

FUNCTION nEstRctPrv( cFacPrv, dbfRctPrvT, dbfRctPrvP )

   local nBitmap  := 3

   if ( dbfRctPrvT )->( dbSeek( cFacPrv ) )
      nBitmap     := ChkPagRctPrv( dbfRctPrvT, dbfRctPrvP )
   end if

RETURN nBitmap

//---------------------------------------------------------------------------//
/*
Cambia el estado de un pedido
*/

STATIC FUNCTION ChgContabilizado( lContabilizado, cFactura, nAsiento, oTree )

   if dbDialogLock( dbfRctPrvT )
      ( dbfRctPrvT )->lContab := lContabilizado
      ( dbfRctPrvT )->( dbUnlock() )
   end if

   if !Empty( oTree )
      oTree:Add( "Factura rectificativa : " + Rtrim( cFactura ) + " asiento generado num. " + Alltrim( Str( nAsiento ) ), 1 )
   end if

RETURN NIL

//-------------------------------------------------------------------------//

STATIC FUNCTION ImpFactura( oBrw, aGet, aTmp )

	local oDlg
	local oBrwFac
	local oGetDes
	local cGetDes
	local cSelFac	:= ""
	local aLinFac	:= {}

	local nChgDiv	:= aTmp[ _NVDVFAC ]

	IF Empty( aGet[ _CCODPRV ]:varGet() )
		msgStop( "Es necesario codificar un proveedor" )
		RETURN .T.
	END IF

	DEFINE DIALOG oDlg RESOURCE "IMPFACPRV"

		REDEFINE GET oGetDes VAR cGetDes;
			ID 		110 ;
			COLOR 	CLR_GET ;
			VALID		( loadFac( cGetDes, oBrwFac, @aLinFac ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( oGetDes:cText( cGetFile( "*.dat", "Seleccione el fichero de la factura" ) ) );
			OF 		oDlg

		REDEFINE LISTBOX oBrwFac ;
			VAR 		cSelFac ;
			ITEMS 	{} ;
			ID 		120 ;
			OF	 		oDlg

		REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
			ACTION 	(  appdFac( aGet, cSelFac, oBrwFac:aItems, aLinFac, nChgDiv ),;
                     oDlg:end( IDOK ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         CANCEL ;
         ACTION   ( oDlg:end() )

		ACTIVATE DIALOG oDlg	CENTER

RETURN NIL

//--------------------------------------------------------------------------//

/*
Esta funcion carga las facturas y sus lineas en dos arrays
*/

STATIC FUNCTION loadFac( cGetDes, oBrwFac, aLinFac )

	local	a1
	local a2
   local cIni
	local cSep
	local oText
	local nCont		:= 0

	IF empty( cGetDes )
		RETURN .T.
	END IF

	CursorWait()

	IF	file( cGetDes )

		oText 			:= TTxtFile():New( cGetDes )
		oText:Open()

		/*
		Inicializamos los valores
		*/

		aLinFac			:= {}
		oBrwFac:reset()

		/*
		Cabeceras de la factura
		*/

		WHILE !oText:lEof()

			a1	:= oText:cGetStr( 6 )
					oText:cGetStr( 1 )
			a2	:= oText:cGetStr( 6 )
					oText:cGetStr( 1 )

			++nCont
			aadd( aLinFac, {} )

			oBrwFac:Add( a1 + space( 1 ) + substr( a2, 1, 2 ) + "/" + substr( a2, 3, 2 ) + "/" + substr( a2, 5, 2 ) )

			WHILE !oText:lEof()

				/*
				Avanzadilla en la lectura
				*/

				cIni	:= oText:cGetStr( 1 )

				IF cIni == chr( 255 )
					EXIT
				END IF

				/*
				A�adimos la linea de detalle a un array
				*/

				aadd( aLinFac[ nCont ],;
                              {  cIni + oText:cGetStr( 5 ),;   // "Codigo interno"
                                 oText:cGetStr( 13 ),;         // "Codigo Barras"
											oText:cGetStr( 30 ),;			// "Descripci�n"
											oText:cGetStr(  7 ),;			// "Unidades"
											oText:cGetStr(  7 ),;			// "Coste"
                                 oText:cGetStr(  1 ) } )       // "tipo " + cImp()

				/*
				Estudiamos el separador
				*/

				cSep	:= oText:cGetStr( 1 )

				IF cSep == chr( 254 )
					LOOP
				END IF

			END WHILE

		END WHILE

      oText:Close()

	ELSE

		msgAlert( "Fichero no encontrado" )

	END IF

	oBrwFac:setFocus()

	CursorWe()

RETURN .T.

//--------------------------------------------------------------------------//

/*
A�ade las lineas de detalle al fichero definitivamente
*/

STATIC FUNCTION appdFac( aGet, cSelFac, aSelFac, aLinFac, nChgDiv )

   local n
	local nIva
	local nSelFac := AScan( aSelFac,;
						  { | cItem | Upper( AllTrim( cItem ) ) == ;
										  Upper( AllTrim( cSelFac ) ) } )

	IF nSelFac	!= 0

		aGet[_CSUPED]:cText( substr( cSelFac, 1, 6 ) )

		FOR n := 1 TO len( aLinFac[ nSelFac ] )

			(dbfTmp)->( dbAppend() )

			(dbfTmp)->CREF			:= aLinFac[ nSelFac, n, 1 ]
			(dbfTmp)->CDETALLE 	:= aLinFac[ nSelFac, n, 3 ]
			(dbfTmp)->NUNICAJA	:= val( aLinFac[ nSelFac, n, 4 ] ) / 100
			(dbfTmp)->NPREUNIT 	:= val( aLinFac[ nSelFac, n, 5 ] ) / 100

			/*
			Ojo esto es una chapuza para FECA
			*/

			DO CASE
			CASE aLinFac[ nSelFac, n, 6 ] == "1"
				nIva	:= 7
			CASE aLinFac[ nSelFac, n, 6 ] == "2"
				nIva	:= 16
			CASE aLinFac[ nSelFac, n, 6 ] == "3"
				nIva	:= 4
			END CASE

			(dbfTmp)->NIVA			:= nIva

		NEXT

		(dbfTmp)->( dbGoTop() )

	END IF

RETURN NIL

//---------------------------------------------------------------------------//

/*
Genera los recibos de una factura
*/

FUNCTION GenPgoRctPrv( cNumFac, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfPrv, dbfFPago, dbfDiv, aTmp )

   local nCobro
   local cCodPgo
   local cSerFac
   local nNumFac
   local cSufFac
   local cDivFac
   local nVdvFac
   local dFecFac
   local cCodPrv
   local cNomPrv
   local cCodUsr
   local cCodCaj
   local nTotal
   local nTotCob
   local nDec
   local nInc        := 0
   local n           := 0
   local nTotAcu     := 0
   local nPlazos     := 0
   local cBanco
   local cEntidad
   local cSucursal
   local cControl
   local cCuenta

   if aTmp != nil
      cSerFac        := aTmp[ _CSERFAC ]
      nNumFac        := aTmp[ _NNUMFAC ]
      cSufFac        := aTmp[ _CSUFFAC ]
      cDivFac        := aTmp[ _CDIVFAC ]
      nVdvFac        := aTmp[ _NVDVFAC ]
      dFecFac        := aTmp[ _DFECFAC ]
      cCodPgo        := aTmp[ _CCODPAGO]
      cCodPrv        := aTmp[ _CCODPRV ]
      cNomPrv        := aTmp[ _CNOMPRV ]
      cCodUsr        := aTmp[ _CCODUSR ]
      cCodCaj        := aTmp[ _CCODCAJ ]
   else
      cSerFac        := ( dbfRctPrvT )->cSerFac
      nNumFac        := ( dbfRctPrvT )->nNumFac
      cSufFac        := ( dbfRctPrvT )->cSufFac
      cDivFac        := ( dbfRctPrvT )->cDivFac
      nVdvFac        := ( dbfRctPrvT )->nVdvFac
      dFecFac        := ( dbfRctPrvT )->dFecFac
      cCodPgo        := ( dbfRctPrvT )->cCodPago
      cCodPrv        := ( dbfRctPrvT )->cCodPrv
      cNomPrv        := ( dbfRctPrvT )->cNomPrv
      cCodUsr        := ( dbfRctPrvT )->cCodUsr
      cCodCaj        := ( dbfRctPrvT )->cCodCaj
      cBanco         := ( dbfRctPrvT )->cBanco
      cEntidad       := ( dbfRctPrvT )->cEntBnc
      cSucursal      := ( dbfRctPrvT )->cSucBnc
      cControl       := ( dbfRctPrvT )->cDigBnc
      cCuenta        := ( dbfRctPrvT )->cCtaBnc
   end if

   /*
   Comprobar q el total de factura no es igual al de pagos
   */

   nTotal            := nTotRctPrv( cNumFac, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP, nil, nil, .f. )
   nTotCob           := nPagRctPrv( cNumFac, dbfRctPrvP, nil, dbfDiv, .f. )
   nDec              := nRouDiv( cDivFac, dbfDiv ) // Decimales de la divisa redondeada

   if nTotal != nTotCob

      /*
      Si no hay recibos pagados eliminamos los recibos y se vuelven a generar
      */

      if ( dbfRctPrvP )->( dbSeek( cNumFac ) )

         while cNumFac == ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac .and. !( dbfRctPrvP )->( eof() )

            if !( dbfRctPrvP )->lCobrado .and. dbLock( dbfRctPrvP )
               ( dbfRctPrvP )->( dbDelete() )
               ( dbfRctPrvP )->( dbUnLock() )
            end if

            ( dbfRctPrvP )->( dbSkip() )

         end while

      end if

      nTotal            -= nPagRctPrv( cNumFac, dbfRctPrvP, nil, dbfDiv, .f. )

      /*
      Genera pagos-------------------------------------------------------------
      */

      if ( dbfFPago )->( dbSeek( cCodPgo ) )

         nTotAcu        := nTotal
         nPlazos        := Max( ( dbfFPago )->nPlazos, 1 )

         for n := 1 to nPlazos

            if n != nPlazos
               nTotAcu  -= Round( nTotal / nPlazos, nDec )
            end if

            nInc        := nNewReciboProveedor( cSerFac + Str( nNumFac ) + cSufFac, "R", dbfRctPrvP )

            ( dbfRctPrvP)->( dbAppend() )

            ( dbfRctPrvP )->cSerFac    := cSerFac
            ( dbfRctPrvP )->nNumFac    := nNumFac
            ( dbfRctPrvP )->cSufFac    := cSufFac
            ( dbfRctPrvP )->cCodPrv    := cCodPrv
            ( dbfRctPrvP )->cNomPrv    := cNomPrv
            ( dbfRctPrvP )->nNumRec    := nInc
            ( dbfRctPrvP )->cTipRec    := "R"
            ( dbfRctPrvP )->nImporte   := if( n != nPlazos, Round( nTotal / nPlazos, nDec ), Round( nTotAcu, nDec ) )
            ( dbfRctPrvP )->cTurRec    := cCurSesion()
            ( dbfRctPrvP )->cDescrip   := "Recibo n�" + AllTrim( Str( nInc ) ) + " de factura rectificativa " + cSerFac  + '/' + allTrim( Str( nNumFac ) ) + '/' + cSufFac
            ( dbfRctPrvP )->cDivPgo    := cDivFac
            ( dbfRctPrvP )->nVdvPgo    := nVdvFac
            ( dbfRctPrvP )->lCobRado   := ( ( dbfFPago )->nCobRec == 1 )
            ( dbfRctPrvP )->dPreCob    := dFecFac
            ( dbfRctPrvP )->dFecVto    := dNexDay( dFecFac + ( dbfFPago )->nPlaUno + ( ( dbfFPago )->nDiaPla * ( n - 1 ) ), dbfPrv )
            ( dbfRctPrvP )->cCtaRec    := ( dbfFPago )->cCtaCobro
            ( dbfRctPrvP )->dFecChg    := GetSysDate()
            ( dbfRctPrvP )->cTimChg    := Time()
            ( dbfRctPrvP )->cCodPgo    := cCodPgo
            ( dbfRctPrvP )->lNotArqueo := .f.
            ( dbfRctPrvP )->cCodCaj    := cCodCaj
            ( dbfRctPrvP )->cCodUsr    := cCodUsr

            if ( dbfFPago )->lUtlBnc
               ( dbfRctPrvP )->cBncEmp    := ( dbfFPago )->cBanco
               ( dbfRctPrvP )->cEntEmp    := ( dbfFPago )->cEntBnc
               ( dbfRctPrvP )->cSucEmp    := ( dbfFPago )->cSucBnc
               ( dbfRctPrvP )->cDigEmp    := ( dbfFPago )->cDigBnc
               ( dbfRctPrvP )->cCtaEmp    := ( dbfFPago )->cCtaBnc
            end if

            ( dbfRctPrvP )->cBncPrv       := cBanco
            ( dbfRctPrvP )->cEntPrv       := cEntidad
            ( dbfRctPrvP )->cSucPrv       := cSucursal
            ( dbfRctPrvP )->cDigPrv       := cControl
            ( dbfRctPrvP )->cCtaPrv       := cCuenta

            if ( dbfFPago )->nCobRec == 1
               ( dbfRctPrvP )->dEntrada:= dNexDay( dFecFac + ( dbfFPago )->nPlaUno + ( ( dbfFPago )->nDiaPla * ( n - 1 ) ), dbfPrv )
            end if

            ( dbfRctPrvP )->( dbUnLock() )

         next

      end if

   end if

RETURN NIL

//---------------------------------------------------------------------------//
//
// Devuelve el total de la compra en facturas de proveedores de un articulo
//

function nTotVRctPrv( cCodArt, dbfRctPrvL, nDinDiv, nDirDiv )

   local nTotVta  := 0
   local nRecno   := ( dbfRctPrvL )->( Recno() )

   if ( dbfRctPrvL )->( dbSeek( cCodArt ) )

      while ( dbfRctPrvL )->CREF == cCodArt .and. !( dbfRctPrvL )->( eof() )

         nTotVta  += nTotLRctPrv( dbfRctPrvL, nDinDiv, nDirDiv )
         ( dbfRctPrvL )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//---------------------------------------------------------------------------//
//
// Devuelve el total de unidades de la compra en facturas de proveedores de un articulo
//

function nTotDRctPrv( cCodArt, dbfRctPrvL, cCodAlm )

   local nTotVta  := 0
   local nRecno   := ( dbfRctPrvL )->( Recno() )

   if ( dbfRctPrvL )->( dbSeek( cCodArt ) )

      while ( dbfRctPrvL )->CREF == cCodArt .and. !( dbfRctPrvL )->( eof() )

         if cCodAlm != nil
            if cCodAlm == ( dbfRctPrvL )->cAlmLin
               nTotVta  += nTotNRctPrv( dbfRctPrvL )
            end if
         else
            nTotVta     += nTotNRctPrv( dbfRctPrvL )
         end if

         ( dbfRctPrvL )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvL )->( dbGoTo( nRecno ) )

return ( nTotVta )

//---------------------------------------------------------------------------//

static function lNotOpen()

   if NetErr()
      msgAlert( "Imposible abrir ficheros." )
      CloseFiles()
      return .t.
   end if

return .f.

//--------------------------------------------------------------------------//
/*
Devuelve si la factura esta contabilizada o no
*/

FUNCTION lConRctPrv( cFacPrv, dbfRctPrvT )

   local lConFac  := .f.

   IF ( dbfRctPrvT )->( dbSeek( cFacPrv ) )
      lConFac     := ( dbfRctPrvT )->LCONTAB
	END IF

RETURN ( lConFac )

//----------------------------------------------------------------------------//

/*
Devuelve el codigo del Prvente pasando un numero de factura
*/

FUNCTION dPrvRctPrv( cFacPrv, dbfRctPrvT )

   local cCodPrv  := ""

   IF ( dbfRctPrvT )->( dbSeek( cFacPrv ) )
      cCodPrv     := (dbfRctPrvT)->cCodPrv
	END IF

RETURN ( cCodPrv )

//----------------------------------------------------------------------------//

/*
Devuelve la forma de pago pasando un numero de factura
*/

FUNCTION cPgoRctPrv( cFacPrv, dbfRctPrvT )

   local cCodPgo  := ""

   IF ( dbfRctPrvT )->( dbSeek( cFacPrv ) )
      cCodPgo     := ( dbfRctPrvT )->cCodPago
   END IF

RETURN ( cCodPgo )

//----------------------------------------------------------------------------//

FUNCTION cNomRctPrv( cFacPrv, dbfRctPrvT )

   local cNomPrv := ""

   IF ( dbfRctPrvT )->( dbSeek( cFacPrv ) )
      cNomPrv  := ( dbfRctPrvT )->cNomPrv
	END IF

RETURN ( cNomPrv )

//----------------------------------------------------------------------------//

FUNCTION cCodRctPrv( cFacPrv, uFacPrvT )

   local cCodPrv := ""

   if ValType( uFacPrvT ) == "O"

      if uFacPrvT:Seek( cFacPrv )
         cCodPrv  := uFacPrvT:cCodPrv
      end if

   else

      if ( uFacPrvT )->( dbSeek( cFacPrv ) )
         cCodPrv  := ( uFacPrvT )->cCodPrv
      end if

   end if

RETURN ( cCodPrv )

//----------------------------------------------------------------------------//
/*
Comprueba q no existan recibos pagados
*/

Static Function lRecibosPagados( uFacPrv, dbfRctPrvP )

   local cNumFac
   local lRecPgd  := .f.
   local nRecAct  := ( dbfRctPrvP )->( Recno() )
   local nOrdAct  := ( dbfRctPrvP )->( OrdSetFocus( "NNUMFAC" ) )

   if ValType( uFacPrv ) == "A"
      cNumFac     := uFacPrv[ _CSERFAC ] + Str( uFacPrv[ _NNUMFAC ], 9 ) + uFacPrv[ _CSUFFAC ]
   else
      cNumFac     := ( uFacPrv )->CSERFAC + Str( ( uFacPrv )->NNUMFAC ) + ( uFacPrv )->CSUFFAC
   end if

   if ( dbfRctPrvP )->( dbSeek( cNumFac ) )
      while cNumFac == ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac .and. !( dbfRctPrvP )->( eof() )
         if ( dbfRctPrvP )->lCobrado .and. !( dbfRctPrvP )->lDevuelto
            lRecPgd   := .t.
            exit
         end if
         ( dbfRctPrvP )->( dbSkip() )
      end while
   end if

   ( dbfRctPrvP )->( OrdSetFocus( nOrdAct ) )
   ( dbfRctPrvP )->( dbGoTo( nRecAct) )

return ( lRecPgd )

//----------------------------------------------------------------------------//

function dFecVtoRct( nVto )

   local dVto     := Ctod( "  /  /  " )

   DEFAULT nVto   := 1

   if nVto <= len( aDatVcto )
      dVto        := aDatVcto[ nVto ]
   end if

return ( dVto )

//----------------------------------------------------------------------------//

function nImpVtoRct( nVto )

   local nImp     := 0

   DEFAULT nVto   := 1

   if nVto <= len( aImpVcto )
      nImp        := aImpVcto[ nVto ]
   end if

return ( nImp )

//----------------------------------------------------------------------------//

static function lGenFac( oBrw, oBtn, nDevice )

   local bAction

   DEFAULT nDevice   := IS_PRINTER

   if Empty( oBtn )
      return nil
   end if

   IF !( dbfDoc )->( dbSeek( "TP" ) )

         DEFINE BTNSHELL RESOURCE "DOCUMENT" OF oWndBrw ;
            NOBORDER ;
            ACTION   ( msgStop( "No hay facturas de proveedores predefinidos" ) );
            TOOLTIP  "No hay documentos" ;
            HOTKEY   "N";
            FROM     oBtn ;
            CLOSED ;
            LEVEL    ACC_EDIT

   ELSE

      WHILE ( dbfDoc )->cTipo == "TP" .AND. !( dbfDoc )->( eof() )

         bAction  := bGenFac( nDevice, "Imprimiendo facturas de proveedores", ( dbfDoc )->CODIGO )

         oWndBrw:NewAt( "Document", , , bAction, Rtrim( ( dbfDoc )->cDescrip ) , , , , , oBtn )

         ( dbfDoc )->( dbSkip() )

      END DO

   END IF

   SysRefresh()

return nil

//---------------------------------------------------------------------------//

static function bGenFac( nDevice, cTitle, cCodDoc )

   local bGen
   local nDev  := by( nDevice )
   local cTit  := by( cTitle  )
   local cCod  := by( cCodDoc )

   if nDev == IS_PRINTER
      bGen     := {|| nGenRctPrv( nDevice, cTit, cCod ) }
   else
      bGen     := {|| nGenRctPrv( nDevice, cTit, cCod ) }
   end if

return bGen

//---------------------------------------------------------------------------//
//
// Devuelve el precio neto de un articulo en un factura
//

FUNCTION nNetLFacRct( uFacPrvL, uFacPrvT, nDec, nRec, nVdv, cPirDiv )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nRec   := 0
   DEFAULT nVdv   := 1

   nCalculo       := nNetURctPrv( uFacPrvL, nDec, nRec, nVdv )

   nCalculo       *= nTotNRctPrv( uFacPrvL )

   /*
   Comprobamos los parametros--------------------------------------------------------------------
   */

   if ValType( uFacPrvL ) == "A"

      if uFacPrvL[ _NDTO ]!= 0
         nCalculo    -= nCalculo * uFacPrvL[ _NDTO ] / 100
      end if

   else

      if ( uFacPrvL )->nDto != 0
         nCalculo    -= nCalculo * ( uFacPrvL )->nDto / 100
      end if

   end if

   nCalculo          := Round( nCalculo, nRec )

RETURN ( if( cPirDiv != NIL, Trans( nCalculo, cPirDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nBrtLRctPrv( uTmpLin, nDec, nRec, nVdv, cPorDiv )

   local nCalculo := 0

   DEFAULT nDec   := 2
   DEFAULT nVdv   := 1

   nCalculo       := nTotURctPrv( uTmpLin, nDec, nVdv, cPorDiv )
   nCalculo       *= nTotNRctPrv( uTmpLin )

   nCalculo       := Round( nCalculo / nVdv, nRec )

Return ( if( cPorDiv != nil, Trans( nCalculo, cPorDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION cProFacRct( cFacPro, dbfRctPrvT )

   local cCodPro := ""

   IF ( dbfRctPrvT )->( dbSeek( cFacPro ) )
      cCodPro  := ( dbfRctPrvT )->CCODPRO
	END IF

RETURN ( cCodPro )

//----------------------------------------------------------------------------//

FUNCTION nTotNRctPrv( uDbf )

   local nTotUnd

   DEFAULT uDbf   := dbfRctPrvL

   do case
      case ValType( uDbf ) == "A"
         nTotUnd  := uDbf[ _NUNICAJA ]
         nTotUnd  *= NotCaja( uDbf[ _NCANENT ] )
         nTotUnd  *= NotCero( uDbf[ _NUNDKIT ] )
         nTotUnd  *= NotCero( uDbf[ _NMEDUNO ] )
         nTotUnd  *= NotCero( uDbf[ _NMEDDOS ] )
         nTotUnd  *= NotCero( uDbf[ _NMEDTRE ] )

      case ValType( uDbf ) == "O"
         nTotUnd  := uDbf:nUniCaja
         nTotUnd  *= NotCaja( uDbf:nCanEnt )
         nTotUnd  *= NotCero( uDbf:nUndKit )
         nTotUnd  *= NotCero( uDbf:nMedUno )
         nTotUnd  *= NotCero( uDbf:nMedDos )
         nTotUnd  *= NotCero( uDbf:nMedTre )

      otherwise
         nTotUnd  := ( uDbf )->nUniCaja
         nTotUnd  *= NotCaja( ( uDbf )->nCanEnt )
         nTotUnd  *= NotCero( ( uDbf )->nUndKit )
         nTotUnd  *= NotCero( ( uDbf )->nMedUno )
         nTotUnd  *= NotCero( ( uDbf )->nMedDos )
         nTotUnd  *= NotCero( ( uDbf )->nMedTre )

   end case

RETURN ( nTotUnd )

//--------------------------------------------------------------------------//

FUNCTION nIvaURctPrv( dbfTmp, nDec, nVdv )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nVdv   := 1

   nCalculo       := nTotURctPrv( dbfTmp, nDec, nVdv )

   if !( dbfTmp )->lIvaLin
      nCalculo    += nCalculo * ( dbfTmp )->nIva / 100
   end if

   if nVdv != 0
      nCalculo    := nCalculo / nVdv
   end if

RETURN ( Round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

FUNCTION nIvaLRctPrv( dbfLin, nDec, nRouDec, nVdv, lDto, lPntVer, cPorDiv )

   local nCalculo := nTotLRctPrv( dbfLin, nDec, nRouDec, nVdv )

   if !( dbfLin )->lIvaLin
      nCalculo    := nCalculo * ( dbfLin )->nIva / 100
   end if

RETURN ( if( cPorDiv != NIL, Trans( nCalculo, cPorDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

/*
Devuelve un array con el neto, IGIC, recargo y total
*/

FUNCTION aTotRctPrv( cFactura, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP, cDivRet )

   nTotRctPrv( cFactura, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP, nil, cDivRet )

RETURN ( { nTotNet, nTotIva, nTotReq, nTotFac, aTotIva, nTotRet } )

//---------------------------------------------------------------------------//

static function QuiRctPrv( lDetail, lSetCnt )

   local nOrdAnt

   DEFAULT lDetail   := .t.
   DEFAULT lSetCnt   := .t.

   if ( dbfRctPrvT )->lCloFac .and. !oUser():lAdministrador()
      msgStop( "Solo puede eliminar facturas cerradas los administradores." )
      Return .f.
   end if

   CursorWait()

   if lDetail
      DelDetalle()
   end if

   nOrdAnt        := ( dbfAlbPrvT )->( OrdSetFocus( "cNumFac" ) )

   while ( dbfAlbPrvT )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )
      SetFacturadoAlbaranProveedor( .f., , , dbfAlbPrvT, dbfAlbPrvL )
   end while

   ( dbfAlbPrvT )->( OrdSetFocus( nOrdAnt ) )

   if lSetCnt
      nPutDoc( ( dbfRctPrvT )->cSerFac, ( dbfRctPrvT )->nNumFac, ( dbfRctPrvT )->cSufFac, dbfRctPrvT, "nRctPrv" )
   end if

   CursorWE()

return .t.

//----------------------------------------------------------------------------//

STATIC FUNCTION DelDetalle( cFactura )

   local nOrdAnt

   DEFAULT cFactura  := ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac

   CursorWait()

   /*
   Eliminamos los apuntes de stocks--------------------------------------------
   */

   while ( dbfRctPrvL )->( dbSeek( cFactura ) ) .and. !( dbfRctPrvL )->( eof() )
      if dbLock( dbfRctPrvL )
         ( dbfRctPrvL )->( dbDelete() )
         ( dbfRctPrvL )->( dbUnLock() )
      end if
   end while

   /*
   Eliminamos los pagos--------------------------------------------------------
   */

   while ( dbfRctPrvP )->( dbSeek( cFactura ) ) .and. !( dbfRctPrvP )->( eof() )
      if dbLock( dbfRctPrvP )
         ( dbfRctPrvP )->( dbDelete() )
         ( dbfRctPrvP )->( dbUnLock() )
      end if
   end while

   while ( dbfRctPrvI )->( dbSeek( cFactura ) .and. !( dbfRctPrvI )->( eof() ) )
      if dbLock( dbfRctPrvI )
         ( dbfRctPrvI )->( dbDelete() )
         ( dbfRctPrvI )->( dbUnLock() )
      end if
   end while

   while ( dbfRctPrvD )->( dbSeek( cFactura ) .and. !( dbfRctPrvD )->( eof() ) )
      if dbLock( dbfRctPrvD )
         ( dbfRctPrvD )->( dbDelete() )
         ( dbfRctPrvD )->( dbUnLock() )
      end if
   end while

   while ( dbfRctPrvS )->( dbSeek( cFactura ) .and. !( dbfRctPrvS )->( eof() ) )
      if dbLock( dbfRctPrvS )
         ( dbfRctPrvS )->( dbDelete() )
         ( dbfRctPrvS )->( dbUnLock() )
      end if
   end while

	/*
   Restaura los Albaranes caso de estar facturados-----------------------------
	*/

   nOrdAnt           := ( dbfAlbPrvT )->( OrdSetFocus( "cNumFac" ) )

   if ( dbfAlbPrvT )->( dbSeek( cFactura ) )

      while ( dbfAlbPrvT )->cNumFac == cFactura .and. !( dbfAlbPrvT )->( eof() )

         SetFacturadoAlbaranProveedor( .f., oStock, , dbfAlbPrvT, dbfAlbPrvL )

         ( dbfAlbPrvT )->( dbSkip() )

      end while

   end if

   ( dbfAlbPrvT )->( OrdSetFocus( nOrdAnt ) )

   CursorWe()

RETURN NIL

//--------------------------------------------------------------------------//

function aItmRctPrv()

   local aItmFacPrv  := {}

   aAdd( aItmFacPrv, { "CSERFAC"    ,"C",  1, 0, "Serie de factura"                         ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NNUMFAC"    ,"N",  9, 0, "N�mero de factura"                        ,            "'999999999'",        "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CSUFFAC"    ,"C",  2, 0, "Sufijo de factura"                        ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CTURFAC"    ,"C",  6, 0, "Sesi�n del factura"                       ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "DFECFAC"    ,"D",  8, 0, "Fecha de la factura"                      ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODPRV"    ,"C", 12, 0, "C�digo del proveedor"                     ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODALM"    ,"C",  3, 0, "C�digo de almacen"                        ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODCAJ"    ,"C",  3, 0, "C�digo de caja"                           ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CNOMPRV"    ,"C", 35, 0, "Nombre del proveedor"                     ,            "'@!'",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDIRPRV"    ,"C", 35, 0, "Domicilio del proveedor"                  ,            "'@!'",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CPOBPRV"    ,"C", 25, 0, "Poblaci�n del proveedor"                  ,            "'@!'",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CPROVPROV"  ,"C", 20, 0, "Provincia del proveedor"                  ,            "'@!'",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CPOSPRV"    ,"C",  5, 0, "C�digo postal del proveedor"              ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDNIPRV"    ,"C", 30, 0, "DNI/CIF del proveedor"                    ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LLIQUIDADA" ,"L",  1, 0, "L�gico de la liquidaci�n"                 ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LCONTAB"    ,"L",  1, 0, "L�gico de la contabilizaci�n"             ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "DFECENT"    ,"D",  8, 0, "Fecha de entrada"                         ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CSUPED"     ,"C", 10, 0, "Su pedido"                                ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCONDENT"   ,"C", 20, 0, "Condici�n de entrada"                     ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "MCOMENT"    ,"M", 10, 0, "Comentarios"                              ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CEXPED"     ,"C", 20, 0, "Expedici�n"                               ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "COBSERV"    ,"C", 20, 0, "Observaciones"                            ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODPAGO"   ,"C",  2, 0, "Codigo del tipo de pago"                  ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NBULTOS"    ,"N",  3, 0, "N�mero de bultos"                         ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NPORTES"    ,"N",  6, 0, "Valor de los portes"                      ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cNumFac"    ,"C", 12, 0, "N�mero de la factura"                     ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LIMPALB"    ,"L",  1, 0, "Factura importada desde albaranes"        ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDTOESP"    ,"C", 50, 0, "Descripci�n de descuento especial"        ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NDTOESP"    ,"N",  5, 2, "Porcentaje de descuento especial"         ,            "'@EZ 99.99'",        "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDPP"       ,"C", 50, 0, "Descripci�n descuento por pronto pago"    ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NDPP"       ,"N",  5, 2, "Porcentaje de descuento por pronto pago"  ,            "'@EZ 99.99'",        "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LRECARGO"   ,"L",  1, 0, "L�gico para recargo"                      ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NIRPF"      ,"N",  4, 1, "Porcentaje de IRPF"                       ,            "'@EZ 99.99'",        "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODAGE"    ,"C",  3, 0, "C�digo del agente"                        ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDIVFAC"    ,"C",  3, 0, "C�digo de divisa"                         ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NVDVFAC"    ,"N", 13, 6, "Valor del cambio de la divisa"            ,            "'@E 999,999.999999'","", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LSNDDOC"    ,"L",  1, 0, "Enviar documento por internet"            ,            "",                   "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDTOUNO"    ,"C", 25, 0, "Descripci�n de primer descuento personalizado",        "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NDTOUNO"    ,"N",  5, 2, "Porcentaje de primer descuento personalizado",         "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CDTODOS"    ,"C", 25, 0, "Descripci�n de segundo descuento personalizado",       "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "NDTODOS"    ,"N",  5, 2, "Porcentaje de segundo descuento personalizado",        "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CCODPRO"    ,"C",  9, 0, "C�digo de proyecto en contabilidad",                   "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LRECDOC"    ,"L",  1, 0, "Documento recibido por internet"          ,            "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "LCLOFAC"    ,"L",  1, 0, ""                                         ,            "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "CNUMDOC"    ,"C", 20, 0, "N�mero de documento"                      ,            "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cCodUsr"    ,"C",  3, 0, "C�digo de usuario",                                    "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "lImprimido" ,"L",  1, 0, "L�gico de imprimido del documento",                    "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "dFecImp"    ,"D",  8, 0, "�ltima fecha de impresi�n del documento",              "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cHorImp"    ,"C",  5, 0, "Hora de la �ltima impresi�n del documento",            "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTipRet"    ,"N",  1, 0, "Tipo de retenci�n ( 1. Base / 2. Base+IVA )",          "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nPctRet"    ,"N",  6, 2, "Porcentaje de retenci�n",                              "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "dFecChg"    ,"D",  8, 0, "Fecha de modificaci�n del documento",                  "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cTimChg"    ,"C",  5, 0, "Hora de modificaci�n del documento",                   "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cCodDlg"    ,"C",  2, 0, "C�digo delegaci�n",                                    "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nRegIva"    ,"N",  1, 0, "R�gimen de " + cImp(),                                 "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "lFacGas"    ,"L",  1, 0, "L�gico factura de gastos",                             "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "mComGas"    ,"M", 10, 0, "Comentario de gastos",                                 "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nNetGas1"   ,"N", 16, 6, "Neto de fac. de gastos 1",                             "cPirDivFac",     "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nNetGas2"   ,"N", 16, 6, "Neto de fac. de gastos 2",                             "cPirDivFac",     "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nNetGas3"   ,"N", 16, 6, "Neto de fac. de gastos 3",                             "cPirDivFac",     "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nIvaGas1"   ,"N",  6, 2, "Porcentaje " + cImp() + " 1 de gastos",                "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nIvaGas2"   ,"N",  6, 2, "Porcentaje " + cImp() + " 2 de gastos",                "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nIvaGas3"   ,"N",  6, 2, "Porcentaje " + cImp() + " 3 de gastos",                "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nReGas1"    ,"N",  6, 2, "Porcentaje R.E. 1 de gastos",                          "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nReGas2"    ,"N",  6, 2, "Porcentaje R.E. 2 de gastos",                          "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nReGas3"    ,"N",  6, 2, "Porcentaje R.E. 3 de gastos",                          "'@EZ 99.99'",    "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cMotRec"    ,"C",250, 0, "Motivo de la factura rectificativa",                   "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cCauRec"    ,"C",250, 0, "Causa de la factura rectificativa",                    "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTotNet"    ,"N", 16, 6, "Total neto",                                           "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTotIva"    ,"N", 16, 6, "Total " + cImp(),                                      "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTotReq"    ,"N", 16, 6, "Total recargo",                                        "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTotFac"    ,"N", 16, 6, "Total factura rectificativa",                          "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "nTotSup"    ,"N", 16, 6, "Total gastos suplidos",                                "",               "", "( cDbf )"} )
   aAdd( aItmFacPrv, { "cBanco"     ,"C", 50, 0, "Nombre del banco del proveedor" ,                      "",               "", "( cDbf )", nil } )
   aAdd( aItmFacPrv, { "cEntBnc"    ,"C",  4, 0, "Entidad de la cuenta bancaria del proveedor" ,         "",               "", "( cDbf )", nil } )
   aAdd( aItmFacPrv, { "cSucBnc"    ,"C",  4, 0, "Sucursal de la cuenta bancaria del proveedor" ,        "",               "", "( cDbf )", nil } )
   aAdd( aItmFacPrv, { "cDigBnc"    ,"C",  2, 0, "D�gito de control de la cuenta bancaria del proveedor","",               "", "( cDbf )", nil } )
   aAdd( aItmFacPrv, { "cCtaBnc"    ,"C", 10, 0, "Cuenta bancaria del proveedor" ,                       "",               "", "( cDbf )", nil } )

return ( aItmFacPrv )

//---------------------------------------------------------------------------//

function aColRctPrv()

   local aColFacPrv  := {}

   aAdd( aColFacPrv, { "CSERFAC"    ,"C",  1, 0, "Serie de factura"            ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NNUMFAC"    ,"N",  9, 0, "N�mero de factura"           ,"'999999999'",         "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CSUFFAC"    ,"C",  2, 0, "Sufijo de factura"           ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CREF"       ,"C", 18, 0, "Referencia art�culo"         ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CREFPRV"    ,"C", 20, 0, "Referencia del proveedor"    ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CDETALLE"   ,"C",250, 0, "Detalle de articulo"         ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NPREUNIT"   ,"N", 16, 6, "Precio unitario"             ,"cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NDTO"       ,"N",  6, 2, ""                            ,"'@E 99,99'",          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NIVA"       ,"N",  6, 2, "Porcentaje de " + cImp()     ,"'@E 99,99'",          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NCANENT"    ,"N", 16, 6, "Cantidad recibida"           ,"MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LCONTROL"   ,"L",  1, 0, "Control reservado"           ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CUNIDAD"    ,"C",  2, 0, "Unidad de venta"             ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NUNICAJA"   ,"N", 16, 6, "Unidades por caja"           ,"MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LCHGLIN"    ,"L",  1, 0, "Cambio de precio"            ,"",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "MLNGDES"    ,"M", 10, 0, ""                            ,""          ,          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NDTOLIN"    ,"N",  6, 2, "Descuento lineal"            ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NDTOPRM"    ,"N",  6, 2, "Descuento por promoci�n"     ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NDTORAP"    ,"N",  6, 2, "Descuento por rappels"       ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NPRECOM"    ,"N", 16, 6, "Precio de compra"            ,"cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LBNFLIN1"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "LBNFLIN2"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "LBNFLIN3"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "LBNFLIN4"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "LBNFLIN5"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "LBNFLIN6"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN1"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN2"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN3"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN4"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN5"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFLIN6"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR1"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR2"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR3"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR4"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR5"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NBNFSBR6"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN1"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN2"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN3"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN4"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN5"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NPVPLIN6"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN1"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN2"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN3"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN4"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN5"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN6"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aColFacPrv, { "NIVALIN"    ,"N",  6, 2, "" }                                                                      )
   aAdd( aColFacPrv, { "LIVALIN"    ,"L",  1, 0, "" }                                                                      )
   aAdd( aColFacPrv, { "CCODPR1"    ,"C", 10, 0, "C�digo de la propiedad 1",     "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CCODPR2"    ,"C", 10, 0, "C�digo de la propiedad 2",     "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CVALPR1"    ,"C", 10, 0, "Valor de la propiedad 1" ,     "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CVALPR2"    ,"C", 10, 0, "Valor de la propiedad 2" ,     "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NFACCNV"    ,"N", 16, 6, "Factor de conversi�n de la compra", "",               "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CALMLIN"    ,"C",  3, 0, "C�digo del almacen" ,          "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NCTLSTK"    ,"N",  1, 0, "Tipo de stock de la l�nea",    "'9'",                 "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LLOTE"      ,"L",  1, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NLOTE"      ,"N",  9, 0, "",                             "'999999999'",         "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CLOTE"      ,"C", 12, 0, "N�mero de lote",               "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "dFecCad"    ,"D",  8, 0, "Fecha de caducidad",           "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NNUMLIN"    ,"N",  4, 0, "N�mero de la l�nea",           "9999",                "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NUNDKIT"    ,"N", 16, 6, "Unidades del producto kit",    "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LKITART"    ,"L",  1, 0, "L�nea con escandallo",         "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LKITCHL"    ,"L",  1, 0, "L�nea pertenciente a escandallo", "",                 "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LKITPRC"    ,"L",  1, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "LIMPLIN"    ,"L",  1, 0, "Imprimir linea",               "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "MNUMSER"    ,"M", 10, 0, "" ,                            "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CCODUBI1"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CCODUBI2"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CCODUBI3"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CVALUBI1"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CVALUBI2"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CVALUBI3"   ,"C",  5, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CNOMUBI1"   ,"C", 30, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CNOMUBI2"   ,"C", 30, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CNOMUBI3"   ,"C", 30, 0, "",                             "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CCODFAM"    ,"C", 16, 0, "C�digo de familia",            "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "CGRPFAM"    ,"C",  3, 0, "C�digo del grupo de familia",  "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "NREQ"       ,"N", 16, 6, "Recargo de equivalencia",      "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "MOBSLIN"    ,"M", 10, 0, "Observacion de l�nea",         "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "nPvpRec"    ,"N", 16, 6, "Precio de venta recomendado",  "cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "nNumMed"    ,"N",  1, 0, "N�mero de mediciones",         "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "nMedUno"    ,"N", 16, 6, "Primera unidad de medici�n",   "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "nMedDos"    ,"N", 16, 6, "Segunda unidad de medici�n",   "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "nMedTre"    ,"N", 16, 6, "Tercera unidad de medici�n",   "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "lGasSup"    ,"L",  1, 0, "Linea de gastos suplidos",     "",                    "", "( cDbfCol )" } )
   aAdd( aColFacPrv, { "dFecFac"    ,"D",  8, 0, "Fecha de la factura",          "",                    "", "( cDbfCol )" } )

Return ( aColFacPrv )

//---------------------------------------------------------------------------//

Static Function lLiquida( oBrw, cFactura, cDivFac )

   DEFAULT cFactura  := ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac
   DEFAULT cDivFac   := ( dbfRctPrvT )->cDivFac

   if ( dbfRctPrvT )->lLiquidada
      MsgStop( "Factura ya pagada" )
      return .f.
   end if

   /*
   Comporbamos si existen recibos de esta factura
   */

   ( dbfRctPrvP )->( dbGoTop() )

   if ( dbfRctPrvP )->( dbSeek( cFactura ) )

      while ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac == cFactura .and. !( dbfRctPrvP )->( eof() )

         if !Empty( ( dbfRctPrvP )->cTipRec ) .and. !( dbfRctPrvP )->lCobrado

            EdtRecPrv( ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvP )->nNumFac ) + ( dbfRctPrvP )->cSufFac, .f. )

            exit

         end if

         ( dbfRctPrvP )->( dbSkip() )

      end do

      /*
      Chequea si la factura esta liquidada----------------------------------------
      */

      ChkLqdRctPrv( nil, dbfRctPrvT, dbfRctPrvL, dbfRctPrvP, dbfIva, dbfDiv )

   end if

   oBrw:Refresh()
   oBrw:SetFocus()

Return .t.

//---------------------------------------------------------------------------//

Function SynRctPrv( cPath )

   local aTotFac

   if OpenFiles()

      while !( dbfRctPrvP )->( eof() )

         if Empty( ( dbfRctPrvP )->cCodCaj )
            if dbLock( dbfRctPrvP )
               ( dbfRctPrvP )->cCodCaj := "000"
               ( dbfRctPrvP )->( dbUnLock() )
            end if
         end if

         if !( ( dbfRctPrvP )->cSerFac >= "A" .and. ( dbfRctPrvP )->cSerFac <= "Z" )
            if dbLock( dbfRctPrvP )
               ( dbfRctPrvP )->( dbDelete() )
               ( dbfRctPrvP )->( dbUnLock() )
            end if
         end if

         ( dbfRctPrvP )->( dbSkip() )

         SysRefresh()

      end while

      while !( dbfRctPrvT )->( eof() )

         if Empty( ( dbfRctPrvT )->cCodCaj )
            if dbLock( dbfRctPrvT )
               ( dbfRctPrvT )->cCodCaj := "000"
               ( dbfRctPrvT )->( dbUnLock() )
            end if
         end if

         if !( ( dbfRctPrvT )->cSerFac >= "A" .and. ( dbfRctPrvT )->cSerFac <= "Z" )
            if dbLock( dbfRctPrvT )
               ( dbfRctPrvT )->( dbDelete() )
               ( dbfRctPrvT )->( dbUnLock() )
            end if
         end if

         /*
         Rellenamos los campos de totales--------------------------------------
         */

         if ( dbfRctPrvT )->nTotFac == 0 .and. dbLock( dbfRctPrvT )

            aTotFac                 := aTotRctPrv( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac, dbfRctPrvT, dbfRctPrvL, dbfIva, dbfDiv, dbfRctPrvP, ( dbfRctPrvT )->cDivFac )

            ( dbfRctPrvT )->nTotNet := aTotFac[1]
            ( dbfRctPrvT )->nTotIva := aTotFac[2]
            ( dbfRctPrvT )->nTotReq := aTotFac[3]
            ( dbfRctPrvT )->nTotFac := aTotFac[4]

            ( dbfRctPrvT )->( dbUnLock() )

         end if

         ( dbfRctPrvT )->( dbSkip() )

         SysRefresh()

      end while

      while !( dbfRctPrvL )->( eof() )

         if !( dbfRctPrvT )->( dbSeek( ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac ) )

            if dbLock( dbfRctPrvL )
               ( dbfRctPrvL )->( dbDelete() )
               ( dbfRctPrvL )->( dbUnLock() )
            end if

         else

            if Empty( ( dbfRctPrvL )->cLote ) .and. !Empty( ( dbfRctPrvL )->nLote )
               if dbLock( dbfRctPrvL )
                  ( dbfRctPrvL )->cLote   := AllTrim( Str( ( dbfRctPrvL )->nLote ) )
                  ( dbfRctPrvL )->( dbUnLock() )
               end if
            end if

            if !Empty( ( dbfRctPrvL )->cRef ) .and. Empty( ( dbfRctPrvL )->cCodFam )
               if dbLock( dbfRctPrvL )
                  ( dbfRctPrvL )->cCodFam := RetFamArt( ( dbfRctPrvL )->cRef, dbfArticulo )
                  ( dbfRctPrvL )->( dbUnLock() )
               end if
            end if

            if !Empty( ( dbfRctPrvL )->cRef ) .and. !Empty( ( dbfRctPrvL )->cCodFam )
               if dbLock( dbfRctPrvL )
                  ( dbfRctPrvL )->cGrpFam := cGruFam( ( dbfRctPrvL )->cCodFam, dbfFamilia )
                  ( dbfRctPrvL )->( dbUnLock() )
               end if
            end if

            if Empty( ( dbfRctPrvL )->nReq )
               if dbLock( dbfRctPrvL )
                  ( dbfRctPrvL )->nReq    := nPReq( dbfIva, ( dbfRctPrvL )->nIva )
                  ( dbfRctPrvL )->( dbUnLock() )
               end if
            end if

            if ( dbfRctPrvL )->dFecFac != ( dbfRctPrvT )->dFecFac
               if dbLock( dbfRctPrvL )
                  ( dbfRctPrvL )->dFecFac := ( dbfRctPrvT )->dFecFac
                  ( dbfRctPrvL )->( dbUnLock() )
               end if
            end if

         end if

         ( dbfRctPrvL )->( dbSkip() )

         SysRefresh()

      end while

      while !( dbfRctPrvI )->( eof() )

         if !( dbfRctPrvT )->( dbSeek( ( dbfRctPrvI )->cSerFac + Str( ( dbfRctPrvI )->nNumFac ) + ( dbfRctPrvI )->cSufFac ) )
            if dbLock( dbfRctPrvI )
               ( dbfRctPrvI )->( dbDelete() )
               ( dbfRctPrvI )->( dbUnLock() )
            end if
         end if

         ( dbfRctPrvI )->( dbSkip() )

         SysRefresh()

      end while

      CloseFiles()

   end if

return nil

//------------------------------------------------------------------------//

CLASS TRectificativasProveedorSenderReciver FROM TSenderReciverItem

   Method CreateData()

   Method RestoreData()

   Method SendData()

   Method ReciveData()

   Method Process()

END CLASS

//----------------------------------------------------------------------------//

Method CreateData() CLASS TRectificativasProveedorSenderReciver

   local oBlock
   local oError
   local lSnd        := .f.
   local dbfRctPrvT
   local dbfRctPrvL
   local dbfRctPrvI
   local dbfRctPrvP
   local cFileName   := "FacPrv" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   ::oSender:SetText( "Enviando facturas a proveedores" )

   oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @dbfRctPrvT ) )
   SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @dbfRctPrvL ) )
   SET ADSINDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

   USE ( cPatEmp() + "RctPrvI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvI", @dbfRctPrvI ) )
   SET ADSINDEX TO ( cPatEmp() + "RctPrvI.CDX" ) ADDITIVE

   USE ( cPatEmp() + "FacPrvP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvP", @dbfRctPrvP ) )
   SET ADSINDEX TO ( cPatEmp() + "FacPrvP.CDX" ) ADDITIVE

   /*
   Creamos todas las bases de datos relacionadas con Articulos
   */

   rxRctPrv( cPatSnd() )
   rxRecPrv( cPatSnd() )

   USE ( cPatSnd() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVT", @tmpRctPrvT ) )
   SET ADSINDEX TO ( cPatSnd() + "RctPrvT.CDX" ) ADDITIVE

   USE ( cPatSnd() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FACPRVL", @tmpRctPrvL ) )
   SET ADSINDEX TO ( cPatSnd() + "RctPrvL.CDX" ) ADDITIVE

   USE ( cPatSnd() + "RctPrvI.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvI", @tmpRctPrvI ) )
   SET ADSINDEX TO ( cPatSnd() + "RctPrvI.CDX" ) ADDITIVE

   USE ( cPatSnd() + "FacPrvP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvP", @tmpRctPrvP ) )
   SET ADSINDEX TO ( cPatSnd() + "FacPrvP.CDX" ) ADDITIVE

   if !Empty( ::oSender:oMtr )
      ::oSender:oMtr:nTotal := ( dbfRctPrvT )->( LastRec() )
   end if

   while !( dbfRctPrvT )->( eof() )

      if ( dbfRctPrvT )->lSndDoc

         lSnd  := .t.

         dbPass( dbfRctPrvT, tmpRctPrvT, .t. )
         ::oSender:SetText( ( dbfRctPrvT )->cSerFac + "/" + AllTrim( Str( ( dbfRctPrvT )->nNumFac ) ) + "/" + AllTrim( ( dbfRctPrvT )->cSufFac ) + "; " + Dtoc( ( dbfRctPrvT )->dFecFac ) + "; " + AllTrim( ( dbfRctPrvT )->cCodPrv ) + "; " + ( dbfRctPrvT )->cNomPrv )

         if ( dbfRctPrvL )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )
            do while ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac == ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac .AND. !( dbfRctPrvL )->( eof() )
               dbPass( dbfRctPrvL, tmpRctPrvL, .t. )
               ( dbfRctPrvL )->( dbSkip() )
            end do
         end if

         if ( dbfRctPrvI )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )
            do while ( dbfRctPrvI )->cSerFac + Str( ( dbfRctPrvI )->nNumFac ) + ( dbfRctPrvI )->cSufFac == ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac .AND. !( dbfRctPrvI )->( eof() )
               dbPass( dbfRctPrvI, tmpRctPrvI, .t. )
               ( dbfRctPrvI )->( dbSkip() )
            end do
         end if

         if ( dbfRctPrvP )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )
            do while ( dbfRctPrvP )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac == ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac .AND. !( dbfRctPrvP )->( eof() )
               dbPass( dbfRctPrvP, tmpRctPrvP, .t. )
               ( dbfRctPrvP )->( dbSkip() )
            end do
         end if

      end if

      ( dbfRctPrvT )->( dbSkip() )

      if !Empty( ::oSender:oMtr )
         ::oSender:oMtr:Set( ( dbfRctPrvT )->( OrdKeyNo() ) )
      end if

   END DO

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   CLOSE ( dbfRctPrvT )
   CLOSE ( dbfRctPrvL )
   CLOSE ( dbfRctPrvI )
   CLOSE ( dbfRctPrvP )
   CLOSE ( tmpRctPrvT )
   CLOSE ( tmpRctPrvL )
   CLOSE ( tmpRctPrvI )
   CLOSE ( tmpRctPrvP )

   if lSnd

      /*
      Comprimir los archivos---------------------------------------------------
      */

      ::oSender:SetText( "Comprimiendo facturas de proveedores" )

      if ::oSender:lZipData( cFileName )
         ::oSender:SetText( "Ficheros comprimidos" )
      else
         ::oSender:SetText( "ERROR al crear fichero comprimido" )
      end if

   else

      ::oSender:SetText( "No hay facturas de proveedores para enviar" )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method RestoreData() CLASS TRectificativasProveedorSenderReciver

   local oBlock
   local oError
   local dbfRctPrvT

   if ::lSuccesfullSend

      /*
      Retorna el valor anterior
      */

      oBlock            := ErrorBlock( {| oError | ApoloBreak( oError ) } )
      BEGIN SEQUENCE

      USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvT", @dbfRctPrvT ) )
      SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

         lSelectAll( oWndBrw, dbfRctPrvT, "lSndDoc", .f., .t., .t. )

   RECOVER USING oError

      msgStop( "Imposible abrir todas las bases de datos " + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

      CLOSE ( dbfRctPrvT )

   end if

Return ( Self )

//----------------------------------------------------------------------------//

Method SendData() CLASS TRectificativasProveedorSenderReciver

   local cFileName         := "FacPrv" + StrZero( ::nGetNumberToSend(), 6 ) + "." + RetSufEmp()

   if File( cPatOut() + cFileName )

      /*
      Enviarlos a internet
      */

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

Method ReciveData() CLASS TRectificativasProveedorSenderReciver

   local n
   local aExt        := aRetDlgEmp()

   /*
   Recibirlo de internet
   */

   ::oSender:SetText( "Recibiendo facturas de proveedores" )

   for n := 1 to len( aExt )
      ftpGetFiles( "FacPrv*." + aExt[ n ], cPatIn(), 2000, ::oSender )
   next

   ::oSender:SetText( "Facturas rectificativas de proveedores recibidas" )

Return Self

//----------------------------------------------------------------------------//

Method Process() CLASS TRectificativasProveedorSenderReciver

   local m
   local oStock
   local dbfRctPrvT
   local dbfRctPrvL
   local dbfRctPrvP
   local aFiles      := Directory( cPatIn() + "RctPrv*.*" )
   local oBlock
   local oError

   /*
   Recibirlo de internet
   */

   ::oSender:SetText( "Recibiendo facturas rectificativas de proveedores" )

   for m := 1 to len( aFiles )

      ::oSender:SetText( "Procesando fichero : " + aFiles[ m, 1 ] )

      oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )

      BEGIN SEQUENCE

      /*
      descomprimimos el fichero
      */

      if ::oSender:lUnZipData( cPatIn() + aFiles[ m, 1 ] )

         /*
         Ficheros temporales
         */

         if lExistTable( cPatSnd() + "RctPrvT.DBF" ) .and.;
            lExistTable( cPatSnd() + "RctPrvL.DBF" ) .and.;
            lExistTable( cPatSnd() + "FacPrvP.DBF" )

            USE ( cPatSnd() + "RctPrvT.DBF" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "FacPrvT", @tmpRctPrvT ) )
            SET ADSINDEX TO ( cPatSnd() + "RctPrvT.CDX" ) ADDITIVE

            USE ( cPatSnd() + "RctPrvL.DBF" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "FacPrvL", @tmpRctPrvL ) )
            SET ADSINDEX TO ( cPatSnd() + "RctPrvL.CDX" ) ADDITIVE

            USE ( cPatSnd() + "FacPrvP.Dbf" ) NEW VIA ( cDriver() )READONLY ALIAS ( cCheckArea( "FacPrvP", @tmpRctPrvP ) )
            SET ADSINDEX TO ( cPatSnd() + "FacPrvP.Cdx" ) ADDITIVE

            USE ( cPatEmp() + "RctPrvT.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvT", @dbfRctPrvT ) )
            SET ADSINDEX TO ( cPatEmp() + "RctPrvT.CDX" ) ADDITIVE

            USE ( cPatEmp() + "RctPrvL.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvL", @dbfRctPrvL ) )
            SET ADSINDEX TO ( cPatEmp() + "RctPrvL.CDX" ) ADDITIVE

            USE ( cPatEmp() + "FacPrvP.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "FacPrvP", @dbfRctPrvP ) )
            SET ADSINDEX TO ( cPatEmp() + "FacPrvP.CDX" ) ADDITIVE

            oStock            := TStock():New()
            oStock:cFacPrvT   := dbfRctPrvT
            oStock:cFacPrvL   := dbfRctPrvL

            while ( tmpRctPrvT )->( !eof() )

               /*
               Comprobamos que no exista el Facido en la base de datos
               */

               if lValidaOperacion( ( tmpRctPrvT )->dFecFac, .f. ) .and. ;
                  !( dbfRctPrvT )->( dbSeek( ( tmpRctPrvT )->cSerFac + Str( ( tmpRctPrvT )->nNumFac ) + ( tmpRctPrvT )->cSufFac ) )

                  dbPass( tmpRctPrvT, dbfRctPrvT, .t. )
                  ::oSender:SetText( "A�adido     : " + ( tmpRctPrvT )->cSerFac + "/" + AllTrim( Str( ( tmpRctPrvT )->nNumFac ) ) +"/" + AllTrim( ( tmpRctPrvT )->cSufFac ) + "; " + Dtoc( ( tmpRctPrvT )->dFecFac ) + "; " + AllTrim( ( tmpRctPrvT )->cCodPrv ) + ( tmpRctPrvT )->cNomPrv )

                  if ( tmpRctPrvL )->( dbSeek( ( tmpRctPrvT )->cSerFac + Str( ( tmpRctPrvT )->nNumFac ) + ( tmpRctPrvT )->cSufFac ) )
                     while ( tmpRctPrvL )->cSerFac + Str( ( tmpRctPrvL )->nNumFac ) + ( tmpRctPrvL )->cSufFac == ( tmpRctPrvT )->cSerFac + Str( ( tmpRctPrvT )->nNumFac ) + ( tmpRctPrvT )->cSufFac .and. !( tmpRctPrvL )->( eof() )
                        dbPass( tmpRctPrvL, dbfRctPrvL, .t. )
                        ( tmpRctPrvL )->( dbSkip() )
                     end do
                  end if

                  /*
                  Pasamos los pagos-----------------------------------------------
                  */

                  if ( tmpRctPrvP )->( dbSeek( ( tmpRctPrvT )->cSerFac + Str( ( tmpRctPrvT )->nNumFac ) + ( tmpRctPrvT )->cSufFac ) )
                     while ( tmpRctPrvP )->cSerFac + Str( ( tmpRctPrvP )->nNumFac ) + ( tmpRctPrvP )->cSufFac == ( tmpRctPrvT )->cSerFac + Str( ( tmpRctPrvT )->nNumFac ) + ( tmpRctPrvT )->cSufFac .and. !( tmpRctPrvP )->( eof() )
                        dbPass( tmpRctPrvP, dbfRctPrvP, .t. )
                        ( tmpRctPrvP )->( dbSkip() )
                     end do
                  end if

                  /*
                  Actualizamos los Stocks-----------------------------------------

                  oStock:RctPrv( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac, ( dbfRctPrvT )->cCodAlm, .f., .t. )
                  */

               else

                  ::oSender:SetText( "Desestimado : " + ( tmpRctPrvT )->cSerFac + "/" + AllTrim( Str( ( tmpRctPrvT )->nNumFac ) ) +"/" + AllTrim( ( tmpRctPrvT )->cSufFac ) + "; " + Dtoc( ( tmpRctPrvT )->dFecFac ) + "; " + AllTrim( ( tmpRctPrvT )->cCodPrv ) + ( tmpRctPrvT )->cNomPrv )

               end if

               ( tmpRctPrvT )->( dbSkip() )

            end do

            CLOSE ( dbfRctPrvT )
            CLOSE ( dbfRctPrvL )
            CLOSE ( dbfRctPrvP )
            CLOSE ( tmpRctPrvT )
            CLOSE ( tmpRctPrvL )
            CLOSE ( tmpRctPrvP )

            oStock:end()

         end if

      end if

      ::oSender:AppendFileRecive( aFiles[ m, 1 ] )

      RECOVER USING oError

         CLOSE ( dbfRctPrvT )
         CLOSE ( dbfRctPrvL )
         CLOSE ( dbfRctPrvP )
         CLOSE ( tmpRctPrvT )
         CLOSE ( tmpRctPrvL )
         CLOSE ( tmpRctPrvP )

         ::oSender:SetText( "Error procesando fichero " + aFiles[ m, 1 ] )
         ::oSender:SetText( ErrorMessage( oError ) )

      END SEQUENCE

      ErrorBlock( oBlock )

   next

Return Self

//----------------------------------------------------------------------------//

Static Function nEstadoIncidencia( cNumFac )

   local nEstado  := 0

   if ( dbfRctPrvI )->( dbSeek( cNumFac ) )

      while ( dbfRctPrvI )->cSerFac + Str( ( dbfRctPrvI )->nNumFac ) + ( dbfRctPrvI )->cSufFac == cNumFac .and. !( dbfRctPrvI )->( Eof() )

         if ( dbfRctPrvI )->lListo
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

         ( dbfRctPrvI )->( dbSkip() )

      end while

   end if

Return ( nEstado )

//---------------------------------------------------------------------------//

Function AppRctPrv( cCodPrv, cCodArt, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_APPD ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv( nil, nil, cCodPrv, cCodArt )
         oWndBrw:RecAdd()
      end if

   else

      if OpenFiles( .t. )
         WinAppRec( nil, bEdtRec, dbfRctPrvT, cCodPrv, cCodArt )
         CloseFiles()
      end if

   end if

RETURN .t.

//----------------------------------------------------------------------------//

FUNCTION EdtRctPrv( nNumFac, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_EDIT ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv()
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            oWndBrw:RecEdit()
         else
            MsgStop( "No se encuentra factura" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            nTotRctPrv()
            WinEdtRec( nil, bEdtRec, dbfRctPrvT )
         else
            MsgStop( "No se encuentra factura" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//----------------------------------------------------------------------------//

FUNCTION ZooRctPrv( nNumFac, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv()
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            oWndBrw:RecZoom()
         else
            MsgStop( "No se encuentra factura" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            nTotRctPrv()
            WinZooRec( nil, bEdtRec, dbfRctPrvT )
         else
            MsgStop( "No se encuentra factura" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//----------------------------------------------------------------------------//

FUNCTION DelRctPrv( nNumFac, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv()
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            WinDelRec( nil, dbfRctPrvT, {|| QuiRctPrv() } )
         else
            MsgStop( "No se encuentra factura" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            WinDelRec( nil, dbfRctPrvT, {|| QuiRctPrv() } )
         else
            MsgStop( "No se encuentra factura" )
         end if
         CloseFiles()
      end if

   end if

Return nil

//----------------------------------------------------------------------------//

FUNCTION PrnRctPrv( nNumFac, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv()
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            GenRctPrv( IS_PRINTER )
         else
            MsgStop( "No se encuentra factura" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            nTotRctPrv()
            GenRctPrv( IS_PRINTER )
         else
            MsgStop( "No se encuentra factura" )
         end if
         CloseFiles()
      end if

   end if

RETURN NIL

//---------------------------------------------------------------------------//

FUNCTION VisRctPrv( nNumFac, lOpenBrowse )

   local nLevel         := nLevelUsr( _MENUITEM_ )

   DEFAULT lOpenBrowse  := .f.

   if nAnd( nLevel, 1 ) != 0 .or. nAnd( nLevel, ACC_ZOOM ) == 0
      msgStop( 'Acceso no permitido.' )
      return .t.
   end if

   if lOpenBrowse

      if RctPrv()
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            GenRctPrv( IS_SCREEN )
         else
            MsgStop( "No se encuentra factura" )
         end if
      end if

   else

      if OpenFiles( .t. )
         if dbSeekInOrd( nNumFac, "nNumFac", dbfRctPrvT )
            nTotRctPrv()
            GenRctPrv( IS_SCREEN )
         else
            MsgStop( "No se encuentra factura" )
         end if
         CloseFiles()
      end if

   end if

Return nil

//---------------------------------------------------------------------------//

Static Function lRecibosPagadosTmp( dbfTmpPgo )

   local lRecPgd  := .f.
   local nRecAct  := ( dbfTmpPgo )->( Recno() )

   while !( dbfTmpPgo )->( eof() )
      if ( dbfTmpPgo )->lCobrado .and. !( dbfTmpPgo )->lDevuelto
         lRecPgd  := .t.
         exit
      end if
      ( dbfTmpPgo )->( dbSkip() )
   end while

   ( dbfTmpPgo )->( dbGoTo( nRecAct) )

return ( lRecPgd )

//---------------------------------------------------------------------------//

static function ShowKitRctPrv( dbfMaster, oBrw, cCodPrv, dbfTmpInc, aGet, aTmp, aControl, oSayGas, oSayLabels, oBrwIva )

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

      if !Empty( aTmp ) .and. aTmp[ _LFACGAS ]

         oBrw:Hide()
         oBrwIva:Hide()
         aEval( aControl, {| o | o:Hide() } )
         oSayLabels[1]:Hide()
         oSayLabels[2]:Hide()
         oSayLabels[3]:Hide()
         oSayLabels[4]:Hide()
         oSayLabels[5]:Hide()
         aGet[ _CDTOESP ]:Hide()
         aGet[ _CDPP    ]:Hide()
         aGet[ _NDTOESP ]:Hide()
         aGet[ _NDPP    ]:Hide()
         aGet[ _CDTOUNO ]:Hide()
         aGet[ _NDTOUNO ]:Hide()
         aGet[ _CDTODOS ]:Hide()
         aGet[ _NDTODOS ]:Hide()

         aEval( oSayGas, {| o | o:Show() } )
         aGet[ _MCOMGAS  ]:Show()
         aGet[ _NNETGAS1 ]:Show()
         aGet[ _NNETGAS2 ]:Show()
         aGet[ _NNETGAS3 ]:Show()
         aGet[ _NIVAGAS1 ]:Show()
         aGet[ _NIVAGAS2 ]:Show()
         aGet[ _NIVAGAS3 ]:Show()
         aGet[ _NREGAS1  ]:Show()
         aGet[ _NREGAS2  ]:Show()
         aGet[ _NREGAS3  ]:Show()

      else

         oBrw:Show()
         oBrwIva:Show()
         aEval( aControl, {| o | o:Show() } )
         oSayLabels[1]:Show()
         oSayLabels[2]:Show()
         oSayLabels[3]:Show()
         oSayLabels[4]:Show()
         oSayLabels[5]:Show()
         aGet[ _CDTOESP ]:Show()
         aGet[ _CDPP    ]:Show()
         aGet[ _NDTOESP ]:Show()
         aGet[ _NDPP    ]:Show()
         aGet[ _CDTOUNO ]:Show()
         aGet[ _NDTOUNO ]:Show()
         aGet[ _CDTODOS ]:Show()
         aGet[ _NDTODOS ]:Show()

         aEval( oSayGas, {| o | o:Hide() } )
         aGet[ _MCOMGAS  ]:Hide()
         aGet[ _MCOMGAS  ]:Hide()
         aGet[ _NNETGAS1 ]:Hide()
         aGet[ _NNETGAS2 ]:Hide()
         aGet[ _NNETGAS3 ]:Hide()
         aGet[ _NIVAGAS1 ]:Hide()
         aGet[ _NIVAGAS2 ]:Hide()
         aGet[ _NIVAGAS3 ]:Hide()
         aGet[ _NREGAS1  ]:Hide()
         aGet[ _NREGAS2  ]:Hide()
         aGet[ _NREGAS3  ]:Hide()

      end if

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

STATIC FUNCTION ValidaMedicion( aTmp, aGet )

   local cNewUndMed  := aGet[ _CUNIDAD ]:VarGet

   /*
   Cargamos el codigo de las unidades---------------------------------
   */

   if ( Empty( cOldUndMed ) .or. cOldUndMed != cNewUndMed )

      if oUndMedicion:oDbf:Seek( aTmp[ _CUNIDAD ] )

         if oUndMedicion:oDbf:nDimension >= 1 .and. !Empty( oUndMedicion:oDbf:cTextoDim1 )
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim1 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:cText( ( dbfArticulo )->nLngArt )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:Show()
            else
               aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]  := ( dbfArticulo )->nLngArt
            end if
         else
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:Hide()
            else
               aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]  := 0
            end if
         end if

         if oUndMedicion:oDbf:nDimension >= 1 .and. !Empty( oUndMedicion:oDbf:cTextoDim2 )
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim2 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:cText( ( dbfArticulo )->nAltArt )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:Show()
            else
               aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]  := ( dbfArticulo )->nAltArt
            end if

         else
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:Hide()
            else
                 aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]  := 0
            end if
         end if

         if oUndMedicion:oDbf:nDimension >= 1 .and. !Empty( oUndMedicion:oDbf:cTextoDim3 )
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:oSay:SetText( oUndMedicion:oDbf:cTextoDim3 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:cText( ( dbfArticulo ) ->nAncArt )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:Show()
            else
               aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]  := ( dbfArticulo )->nAncArt
            end if
         else
            if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ] )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
               aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:Hide()
            else
               aTmp[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]  := 0
            end if
         end if

      else

         if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ] )
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:Hide()
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedUno" ) ) ]:cText( 0 )
         end if

         if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ] )
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:Hide()
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedDos" ) ) ]:cText( 0 )
         end if

         if !Empty( aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ] )
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:Hide()
            aGet[ ( dbfRctPrvL )->( fieldpos( "nMedTre" ) ) ]:cText( 0 )
         end if

      end if

      cOldUndMed := cNewUndMed

   end if

RETURN .t.

//---------------------------------------------------------------------------//

Function IsRctPrv( cPath )

   DEFAULT cPath  := cPatEmp()

   if !lExistTable( cPath + "RctPrvT.Dbf" )
      dbCreate( cPath + "RctPrvT.Dbf", aSqlStruct( aItmRctPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "RctPrvL.Dbf" )
      dbCreate( cPath + "RctPrvL.Dbf", aSqlStruct( aColRctPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "RctPrvI.Dbf" )
      dbCreate( cPath + "RctPrvI.Dbf", aSqlStruct( aIncRctPrv() ), cDriver() )
   end if

   if !lExistTable( cPath + "RctPrvD.Dbf" )
      dbCreate( cPath + "RctPrvD.Dbf", aSqlStruct( aFacPrvDoc() ), cDriver() )
   end if

   if !lExistIndex( cPath + "RctPrvT.Cdx" ) .OR. ;
      !lExistIndex( cPath + "RctPrvL.Cdx" ) .OR. ;
      !lExistIndex( cPath + "RctPrvI.Cdx" ) .OR. ;
      !lExistIndex( cPath + "RctPrvD.Cdx" )

      rxRctPrv( cPath )

   end if

Return ( nil )

//---------------------------------------------------------------------------//

FUNCTION cPrpRctPrv( cFacPrvL )

   local cReturn     := ""

   DEFAULT cFacPrvL  := if( !Empty( tmpRctPrvL ), tmpRctPrvL, dbfRctPrvL )

   cReturn           += Alltrim( ( cFacPrvL )->cRef )

   if !Empty( ( cFacPrvL )->cValPr1 )
      cReturn        += "."
      cReturn        += Alltrim( ( cFacPrvL )->cValPr1 )
   end if

   if !Empty( ( cFacPrvL )->cValPr2 )
      cReturn        += "."
      cReturn        += Alltrim( ( cFacPrvL )->cValPr2 )
   end if

RETURN ( cReturn )

//---------------------------------------------------------------------------//

/*
Devuelve la descripci�n de una linea de factura
*/

FUNCTION cDesRctPrv( cFacPrvL, cFacPrvS )

   DEFAULT cFacPrvL  := dbfRctPrvL
   DEFAULT cFacPrvS  := dbfRctPrvS

RETURN ( Descrip( cFacPrvL, cFacPrvS ) )

//------------------------------------------------------------------------//

Function cCtaRctPrv( cRctPrvT, cRctPrvP, cBncPrv )

   local cCtaRctPrv  := ""

   DEFAULT cRctPrvT  := dbfRctPrvT
   DEFAULT cRctPrvP  := dbfRctPrvP
   DEFAULT cBncPrv   := dbfPrvBnc

   cCtaRctPrv        := Rtrim( ( cRctPrvT )->cEntBnc + ( cRctPrvT )->cSucBnc + ( cRctPrvT )->cDigBnc + ( cRctPrvT )->cCtaBnc )

   if Empty( cCtaRctPrv )
      if dbSeekInOrd( ( cRctPrvT )->cSerFac + Str( ( cRctPrvT )->nNumFac ) + ( cRctPrvT )->cSufFac, "nNumFac", cRctPrvP )
         cCtaRctPrv  := cProveeCuenta( ( cRctPrvP )->cCodPrv, cBncPrv )
      end if
   end if

Return ( cCtaRctPrv )

//------------------------------------------------------------------------//

#endif

//---------------------------------------------------------------------------//
//Funciones comunes del programa y del pda
//---------------------------------------------------------------------------//

/*
Calcula el total de linea de factura
*/

FUNCTION nTotLRctPrv( uFacPrvL, nDec, nRec, nVdv, cPirDiv )

   local nCalculo
   local nDtoLin
   local nDtoPrm

   DEFAULT uFacPrvL  := dbfRctPrvL
   DEFAULT nDec      := nDinDiv()
   DEFAULT nRec      := nRinDiv()
   DEFAULT nVdv      := 1

   nCalculo       := nTotURctPrv( uFacPrvL, nDec, nVdv )

   do case
   case ValType( uFacPrvL ) == "A"
      nDtoLin     := uFacPrvL[ _NDTOLIN ]
      nDtoPrm     := uFacPrvL[ _NDTOPRM ]
   case ValType( uFacPrvL ) == "C"
      nDtoLin     := ( uFacPrvL )->nDtoLin
      nDtoPrm     := ( uFacPrvL )->nDtoPrm
   case ValType( uFacPrvL ) == "O"
      nDtoLin     := uFacPrvL:nDtoLin
      nDtoPrm     := uFacPrvL:nDtoPrm
   end case

   if nDtoLin != 0
      nCalculo    -= nCalculo * nDtoLin / 100
   end if

   if nDtoPrm != 0
      nCalculo    -= nCalculo * nDtoPrm / 100
   end if

   nCalculo       *= nTotNRctPrv( uFacPrvL )

   if nRec != nil
      nCalculo       := Round( nCalculo, nRec )
   end if

RETURN ( if( cPirDiv != NIL, Trans( nCalculo, cPirDiv ), nCalculo ) )

//---------------------------------------------------------------------------//

FUNCTION nTotURctPrv( uFacPrvL, nDec, nVdv, cPinDiv )

	local nCalculo

   DEFAULT uFacPrvL  := dbfRctPrvL
   DEFAULT nDec      := 0
   DEFAULT nVdv      := 1

   do case
   case ValType( uFacPrvL ) == "O"
      nCalculo    := uFacPrvL:nPreUnit / nVdv
   case ValType( uFacPrvL ) == "A"
      nCalculo    := uFacPrvL[ _NPREUNIT ] / nVdv
   case ValType( uFacPrvL ) == "C"
      nCalculo    := ( uFacPrvL )->nPreUnit / nVdv
   end case

   nCalculo       := Round( nCalculo, nDec )

RETURN ( ( if( cPinDiv != nil, Trans( nCalculo, cPinDiv ), nCalculo ) )  )

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS TRectificativaProveedorLabelGenerator

   Data oDlg
   Data oFld

   Data oSerieInicio
   Data cSerieInicio

   Data oSerieFin
   Data cSerieFin

   Data nDocumentoInicio
   Data nDocumentoFin

   Data cSufijoInicio
   Data cSufijoFin

   Data oFormatoLabel
   Data cFormatoLabel

   Data nFilaInicio
   Data nColumnaInicio

   Data nRecno

   Data oBrwLabel

   Data nCantidadLabels
   Data nUnidadesLabels

   Data oMtrLabel
   Data nMtrLabel

   Data oFilter

   Data lClose

   Data lErrorOnCreate

   Data oBtnFilter
   Data oBtnSiguiente
   Data oBtnAnterior
   Data oBtnCancel

   Data aSearch

   Data cFileTmpLabel
   Data cAreaTmpLabel

   Method New()
   Method Init()

   Method Create()
   Method lCreateAuxiliar()

   Method lCreateTemporal()
   Method PrepareTemporal( oFr )
   Method DestroyTemporal()

   Method End()

   Method BotonAnterior()

   Method BotonSiguiente()

   Method PutLabel()

   Method SelectAllLabels()

   Method AddLabel()

   Method DelLabel()

   Method EditLabel()

   Method FilterLabel()

   Method LoadAuxiliar()

   Method lPrintLabels()

   Method InitLabel( oLabel )

   Method SelectColumn( oCombo )

END CLASS

//----------------------------------------------------------------------------//

Method New() CLASS TRectificativaProveedorLabelGenerator

   local oError
   local oBlock

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::cSerieInicio       := ( dbfRctPrvT )->cSerFac
      ::cSerieFin          := ( dbfRctPrvT )->cSerFac

      ::nDocumentoInicio   := ( dbfRctPrvT )->nNumFac
      ::nDocumentoFin      := ( dbfRctPrvT )->nNumFac

      ::cSufijoInicio      := ( dbfRctPrvT )->cSufFac
      ::cSufijoFin         := ( dbfRctPrvT )->cSufFac

      ::nRecno             := ( dbfRctPrvT )->( Recno() )

      ::cFormatoLabel      := GetPvProfString( "Etiquetas", "Factura proveedor", Space( 3 ), cPatEmp() + "Empresa.Ini" )
      if len( ::cFormatoLabel ) < 3
         ::cFormatoLabel   := Space( 3 )
      end if

      ::nMtrLabel          := 0

      ::nFilaInicio        := 1
      ::nColumnaInicio     := 1

      ::nCantidadLabels    := 1
      ::nUnidadesLabels    := 1

      ::aSearch            := { "C�digo", "Nombre" }

      ::lErrorOnCreate     := .f.

   RECOVER USING oError

      ::lErrorOnCreate     := .t.

      msgStop( "Error en la creaci�n de generador de etiquetas" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE
   ErrorBlock( oBlock )

Return ( Self )

//--------------------------------------------------------------------------//

Method Init() CLASS TRectificativaProveedorLabelGenerator

   local oError
   local oBlock
   local lError            := .f.

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      if !lOpenFiles
         OpenFiles()
         ::lClose          := .t.
      end if

      ::cSerieInicio       := ( dbfRctPrvT )->cSerFac
      ::cSerieFin          := ( dbfRctPrvT )->cSerFac

      ::nDocumentoInicio   := ( dbfRctPrvT )->nNumFac
      ::nDocumentoFin      := ( dbfRctPrvT )->nNumFac

      ::cSufijoInicio      := ( dbfRctPrvT )->cSufFac
      ::cSufijoFin         := ( dbfRctPrvT )->cSufFac

      ::nCantidadLabels    := 1
      ::nUnidadesLabels    := 1

      ::lErrorOnCreate     := .f.

   RECOVER USING oError

      ::lErrorOnCreate     := .t.

      msgStop( "Error en la creaci�n de generador de etiquetas" + CRLF + ErrorMessage( oError ) )

   END SEQUENCE
   ErrorBlock( oBlock )

Return ( Self )

//--------------------------------------------------------------------------//

Method Create() CLASS TRectificativaProveedorLabelGenerator

   local oBtnPrp
   local oBtnMod
   local oBtnZoo
   local oGetOrd
   local cGetOrd     := Space( 100 )
	local oCbxOrd
   local cCbxOrd     := "C�digo"
   local aCbxOrd     := { "C�digo", "Nombre" }

   ::New()

   if !::lErrorOnCreate .and. ::lCreateAuxiliar()

      DEFINE DIALOG ::oDlg RESOURCE "SelectLabels_0"

         REDEFINE PAGES ::oFld ;
            ID       10;
            OF       ::oDlg ;
            DIALOGS  "SelectLabels_1",;
                     "SelectLabels_2"

         /*
         Bitmap-------------------------------------------------------------------
         */

         REDEFINE BITMAP ;
            RESOURCE "EnvioEtiquetas" ;
            ID       500 ;
            OF       ::oDlg ;

         REDEFINE GET ::oSerieInicio VAR ::cSerieInicio ;
            ID       100 ;
            PICTURE  "@!" ;
            SPINNER ;
            ON UP    ( UpSerie( ::oSerieInicio ) );
            ON DOWN  ( DwSerie( ::oSerieInicio ) );
            VALID    ( ::cSerieInicio >= "A" .and. ::cSerieInicio <= "Z" );
            UPDATE ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::oSerieFin VAR ::cSerieFin ;
            ID       110 ;
            PICTURE  "@!" ;
            SPINNER ;
            ON UP    ( UpSerie( ::oSerieFin ) );
            ON DOWN  ( DwSerie( ::oSerieFin ) );
            VALID    ( ::cSerieFin >= "A" .and. ::cSerieFin <= "Z" );
            UPDATE ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::nDocumentoInicio ;
            ID       120 ;
            PICTURE  "999999999" ;
            SPINNER ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::nDocumentoFin ;
            ID       130 ;
            PICTURE  "999999999" ;
            SPINNER ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::cSufijoInicio ;
            ID       140 ;
            PICTURE  "##" ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::cSufijoFin ;
            ID       150 ;
            PICTURE  "##" ;
            OF       ::oFld:aDialogs[ 1 ]

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

         REDEFINE GET ::oFormatoLabel VAR ::cFormatoLabel ;
            ID       160 ;
            IDTEXT   161 ;
            BITMAP   "LUPA" ;
            OF       ::oFld:aDialogs[ 1 ]

            ::oFormatoLabel:bValid  := {|| cDocumento( ::oFormatoLabel, ::oFormatoLabel:oHelpText, dbfDoc, "RL" ) }
            ::oFormatoLabel:bHelp   := {|| BrwDocumento( ::oFormatoLabel, ::oFormatoLabel:oHelpText, "RL" ) }

         TBtnBmp():ReDefine( 220, "Printer_pencil_16",,,,,{|| EdtDocumento( ::cFormatoLabel ) }, ::oFld:aDialogs[ 1 ], .f., , .f., "Modificar formato de etiquetas" )

         REDEFINE RADIO ::nCantidadLabels ;
            ID       200, 201 ;
            OF       ::oFld:aDialogs[ 1 ]

         REDEFINE GET ::nUnidadesLabels ;
            ID       210 ;
            PICTURE  "99999" ;
            SPINNER ;
            MIN      1 ;
            MAX      99999 ;
            WHEN     ( ::nCantidadLabels == 2 ) ;
            OF       ::oFld:aDialogs[ 1 ]

         /*
         Segunda caja de dialogo--------------------------------------------------
         */

         REDEFINE GET oGetOrd ;
            VAR      cGetOrd ;
            ID       200 ;
            BITMAP   "FIND" ;
            OF       ::oFld:aDialogs[ 2 ]

         oGetOrd:bChange   := {| nKey, nFlags, oGet | AutoSeek( nKey, nFlags, oGet, ::oBrwLabel, ::cAreaTmpLabel ) }
         oGetOrd:bValid    := {|| ( ::cAreaTmpLabel )->( OrdScope( 0, nil ) ), ( ::cAreaTmpLabel )->( OrdScope( 1, nil ) ), ::oBrwLabel:Refresh(), .t. }

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

         REDEFINE BUTTON oBtnMod;
            ID       160 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( nil )

         REDEFINE BUTTON oBtnZoo;
            ID       165 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            ACTION   ( nil )

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
         ::oBrwLabel:cAlias          := ::cAreaTmpLabel

         ::oBrwLabel:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
         ::oBrwLabel:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }
         ::oBrwLabel:bLDblClick      := {|| ::PutLabel() }

         ::oBrwLabel:CreateFromResource( 180 )

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Sl. Seleccionada"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->lLabel }
            :nWidth           := 20
            :SetCheck( { "Sel16", "Nil16" } )
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "C�digo"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->cRef }
            :nWidth           := 80
            :cSortOrder       := "cRef"
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Nombre"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->cDetalle }
            :nWidth           := 250
            :cSortOrder       := "cDetalle"
            :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | oCbxOrd:Set( oCol:cHeader ) }
      end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Prp. 1"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->cValPr1 }
            :nWidth           := 40
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "Prp. 2"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->cValPr2 }
            :nWidth           := 40
         end with

         with object ( ::oBrwLabel:AddCol() )
            :cHeader          := "N. etiquetas"
            :bEditValue       := {|| ( ::cAreaTmpLabel )->nLabel }
            :cEditPicture     := "@E 99,999"
            :nWidth           := 80
            :nDataStrAlign    := 1
            :nHeadStrAlign    := 1
            :nEditType        := 1
            :bOnPostEdit      := {|o,x| if( dbDialogLock( ::cAreaTmpLabel ), ( ( ::cAreaTmpLabel )->nLabel := x, ( ::cAreaTmpLabel )->( dbUnlock() ) ), ) }
         end with

         REDEFINE METER ::oMtrLabel ;
            VAR      ::nMtrLabel ;
            PROMPT   "" ;
            ID       190 ;
            OF       ::oFld:aDialogs[ 2 ] ;
            TOTAL    ( ::cAreaTmpLabel  )->( lastrec() )

         ::oMtrLabel:nClrText   := rgb( 128,255,0 )
         ::oMtrLabel:nClrBar    := rgb( 128,255,0 )
         ::oMtrLabel:nClrBText  := rgb( 128,255,0 )

         /*
         Botones generales--------------------------------------------------------
         */

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

      ::oDlg:bStart  := {|| ::oBtnAnterior:Hide(), ::oFormatoLabel:lValid(), oBtnMod:Hide(), oBtnZoo:Hide(), oBtnPrp:Hide() }

      ACTIVATE DIALOG ::oDlg CENTER

      ::End()

   end if

Return ( Self )

//--------------------------------------------------------------------------//

Method lCreateAuxiliar() CLASS TRectificativaProveedorLabelGenerator

   local oBlock
   local oError
   local lCreateAuxiliar   := .t.

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::cAreaTmpLabel      := "Lbl" + cCurUsr()
      ::cFileTmpLabel      := cGetNewFileName( cPatTmp() + "Lbl" )

      dbCreate( ::cFileTmpLabel, aSqlStruct( aLblRctPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), ::cFileTmpLabel, ::cAreaTmpLabel, .f. )

      if!( ::cAreaTmpLabel )->( neterr() )
         ( ::cAreaTmpLabel )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
         ( ::cAreaTmpLabel )->( OrdCreate( ::cFileTmpLabel, "cRef", "cRef", {|| Field->cRef } ) )

         ( ::cAreaTmpLabel )->( ordCondSet( "!Deleted()", {|| !Deleted() }  ) )
         ( ::cAreaTmpLabel )->( OrdCreate( ::cFileTmpLabel, "cDetalle", "Upper( cDetalle )", {|| Upper( Field->cDetalle ) } ) )
      end if

      ( ::cAreaTmpLabel )->( OrdsetFocus( "cRef" ) )

   RECOVER USING oError

      lCreateAuxiliar      := .f.

      MsgStop( 'Imposible crear fichero temporal' + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lCreateAuxiliar )

//--------------------------------------------------------------------------//

Method BotonAnterior() CLASS TRectificativaProveedorLabelGenerator

   ::oFld:GoPrev()

   ::oBtnAnterior:Hide()

   SetWindowText( ::oBtnSiguiente:hWnd, "Siguien&te >" )

Return ( Self )

//--------------------------------------------------------------------------//

Method BotonSiguiente() CLASS TRectificativaProveedorLabelGenerator

   do case
      case ::oFld:nOption == 1

         if Empty( ::cFormatoLabel )

            MsgStop( "Debe cumplimentar un formato de etiquetas" )

         else

            ::LoadAuxiliar()

            ::oFld:GoNext()
            ::oBtnAnterior:Show()
            SetWindowText( ::oBtnSiguiente:hWnd, "&Terminar" )

         end if

      case ::oFld:nOption == 2

         if ::lPrintLabels()

            SetWindowText( ::oBtnCancel:hWnd, "&Cerrar" )

         end if

   end case

Return ( Self )

//--------------------------------------------------------------------------//

Method lCreateTemporal() CLASS TRectificativaProveedorLabelGenerator

   local n
   local nRec
   local oBlock
   local oError
   local nBlancos
   local lCreateTemporal   := .t.

   oBlock                  := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      tmpRctPrvL           := "LblFac"
      filRctPrvL           := cGetNewFileName( cPatTmp() + "LblFac" )

      dbCreate( filRctPrvL, aSqlStruct( aLblRctPrv() ), cLocalDriver() )
      dbUseArea( .t., cLocalDriver(), filRctPrvL, tmpRctPrvL, .f. )

      ( tmpRctPrvL )->( OrdCondSet( "!Deleted()", {||!Deleted()} ) )
      ( tmpRctPrvL )->( OrdCreate( filRctPrvL, "nNumFac", "cSerFac + Str( nNumFac ) + cSufFac", {|| Field->cSerFac + Str( Field->nNumFac ) + Field->cSufFac } ) )

      nRec                 := ( ::cAreaTmpLabel )->( Recno() )

      ( ::cAreaTmpLabel )->( dbGoTop() )
      while !( ::cAreaTmpLabel )->( eof() )

         if ( ::cAreaTmpLabel )->lLabel
            for n := 1 to ( ::cAreaTmpLabel )->nLabel
               dbPass( ::cAreaTmpLabel, tmpRctPrvL, .t. )
            next
         end if

         ( ::cAreaTmpLabel )->( dbSkip() )

      end while
      ( tmpRctPrvL )->( dbGoTop() )

      ( ::cAreaTmpLabel )->( dbGoTo( nRec ) )

   RECOVER USING oError

      lCreateTemporal      := .f.

      MsgStop( 'Imposible abrir ficheros de art�culos' + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( lCreateTemporal )

//---------------------------------------------------------------------------//

Method DestroyTemporal() CLASS TRectificativaProveedorLabelGenerator

   if ( tmpRctPrvL )->( Used() )
      ( tmpRctPrvL )->( dbCloseArea() )
   end if

   dbfErase( filRctPrvL )

   tmpRctPrvL           := nil

   SysRefresh()

Return ( .t. )

//---------------------------------------------------------------------------//

Method PrepareTemporal( oFr ) CLASS TRectificativaProveedorLabelGenerator

   local n
   local nBlancos       := 0
   local nPaperHeight   := oFr:GetProperty( "MainPage", "PaperHeight" ) * fr01cm
   local nHeight        := oFr:GetProperty( "CabeceraColumnas", "Height" )
   local nColumns       := oFr:GetProperty( "MainPage", "Columns" )
   local nItemsInColumn := int( nPaperHeight / nHeight )

   nBlancos             := ( ::nColumnaInicio - 1 ) * nItemsInColumn
   nBlancos             += ( ::nFilaInicio - 1 )

   for n := 1 to nBlancos
      dbPass( dbBlankRec( dbfRctPrvL ), tmpRctPrvL, .t. )
   next

   ( tmpRctPrvL )->( dbGoTop() )

Return ( .t. )

//---------------------------------------------------------------------------//

Method lPrintLabels() CLASS TRectificativaProveedorLabelGenerator

   local oFr

   local nCopies      := 1
   local nDevice      := IS_SCREEN
   local cPrinter     := PrnGetName()

   if ::lCreateTemporal()

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
      Zona de datos---------------------------------------------------------------
      */

      DataLabel( oFr, .t. )

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

         do case
            case nDevice == IS_SCREEN
               oFr:ShowPreparedReport()

            case nDevice == IS_PRINTER
               oFr:PrintOptions:SetPrinter( cPrinter )
               oFr:PrintOptions:SetCopies( nCopies )
               oFr:PrintOptions:SetShowDialog( .f. )
               oFr:Print()

            case nDevice == IS_PDF
               oFr:DoExport( "PDFExport" )

         end case

      end if

      /*
      Destruye el dise�ador-------------------------------------------------------
      */

      oFr:DestroyFr()

      /*
      Destruye el fichero temporal------------------------------------------------
      */

      ::DestroyTemporal()

   end if

Return .t.

//---------------------------------------------------------------------------//

Method End() CLASS TRectificativaProveedorLabelGenerator

   if !Empty( ::nRecno )
      ( dbfRctPrvT )->( dbGoTo( ::nRecno ) )
   end if

   if IsTrue( ::lClose )
      CloseFiles()
   end if

   if !Empty( ::cAreaTmpLabel ) .and. ( ::cAreaTmpLabel )->( Used() )
      ( ::cAreaTmpLabel )->( dbCloseArea() )
   end if

   dbfErase( ::cFileTmpLabel )

   WritePProString( "Etiquetas", "Factura proveedor", ::cFormatoLabel, cPatEmp() + "Empresa.Ini" )

Return ( Self )

//--------------------------------------------------------------------------//

Method PutLabel() CLASS TRectificativaProveedorLabelGenerator

   ( ::cAreaTmpLabel )->lLabel   := !( ::cAreaTmpLabel )->lLabel

   ::oBrwLabel:Refresh()
   ::oBrwLabel:Select()

Return ( Self )

//--------------------------------------------------------------------------//

Method SelectAllLabels( lSelect ) CLASS TRectificativaProveedorLabelGenerator

	local n			:= 0
   local nRecno   := ( ::cAreaTmpLabel )->( Recno() )

	CursorWait()

   ( ::cAreaTmpLabel )->( dbGoTop() )
   while !( ::cAreaTmpLabel )->( eof() )

      ( ::cAreaTmpLabel )->lLabel := lSelect

      ( ::cAreaTmpLabel )->( dbSkip() )

      ::oMtrLabel:Set( ++n )

   end while

   ( ::cAreaTmpLabel )->( dbGoTo( nRecno ) )

   ::oBrwLabel:Refresh()

   ::oMtrLabel:Set( 0 )
   ::oMtrLabel:Refresh()

	CursorArrow()

Return ( Self )

//--------------------------------------------------------------------------//

Method AddLabel() CLASS TRectificativaProveedorLabelGenerator

   ( ::cAreaTmpLabel )->nLabel++

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//--------------------------------------------------------------------------//

Method DelLabel() CLASS TRectificativaProveedorLabelGenerator

   if ( ::cAreaTmpLabel )->nLabel > 1
      ( ::cAreaTmpLabel )->nLabel--
   end if

   ::oBrwLabel:Refresh()
   ::oBrwLabel:SetFocus()

Return ( Self )

//---------------------------------------------------------------------------//

Method EditLabel() CLASS TRectificativaProveedorLabelGenerator

   ::oBrwLabel:aCols[ 6 ]:Edit()

Return ( Self )

//---------------------------------------------------------------------------//

Method FilterLabel()

   if Empty( ::oFilter )
      ::oFilter      := TDlgFlt():New( aLblRctPrv(), ::cAreaTmpLabel )
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

Method LoadAuxiliar() CLASS TRectificativaProveedorLabelGenerator

   local nRec
   local nOrd

   /*
   Limpiamos la base de datos temporal-----------------------------------------
   */

   ( ::cAreaTmpLabel )->( __dbZap() )

   /*
   Llenamos la tabla temporal--------------------------------------------------
	*/

   nRec           := ( dbfRctPrvT )->( Recno() )
   nOrd           := ( dbfRctPrvT )->( OrdSetFocus( "nNumFac" ) )

   if ( dbfRctPrvT )->( dbSeek( ::cSerieInicio + Str( ::nDocumentoInicio, 9 ) + ::cSufijoInicio, .t. ) )

      while ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac >= ::cSerieInicio + Str( ::nDocumentoInicio, 9 ) + ::cSufijoInicio .and. ;
            ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac <= ::cSerieFin + Str( ::nDocumentoFin, 9 ) + ::cSufijoFin          .and. ;
            !( dbfRctPrvT )->( eof() )

         if ( dbfRctPrvL )->( dbSeek( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) )

            while ( ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac == ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac ) .and. ( dbfRctPrvL )->( !eof() )

               if !Empty( ( dbfRctPrvL )->cRef )

                  ( ::cAreaTmpLabel )->( dbAppend() )

                  ( ::cAreaTmpLabel )->cSerFac  := ( dbfRctPrvL )->cSerFac
                  ( ::cAreaTmpLabel )->nNumFac  := ( dbfRctPrvL )->nNumFac
                  ( ::cAreaTmpLabel )->cSufFac  := ( dbfRctPrvL )->cSufFac
                  ( ::cAreaTmpLabel )->cRef     := ( dbfRctPrvL )->cRef
                  ( ::cAreaTmpLabel )->cRefPrv  := ( dbfRctPrvL )->cRefPrv
                  ( ::cAreaTmpLabel )->cDetalle := ( dbfRctPrvL )->cDetalle
                  ( ::cAreaTmpLabel )->nPreUnit := ( dbfRctPrvL )->nPreUnit
                  ( ::cAreaTmpLabel )->nIva     := ( dbfRctPrvL )->nIva
                  ( ::cAreaTmpLabel )->nReq     := ( dbfRctPrvL )->nReq
                  ( ::cAreaTmpLabel )->nCanEnt  := ( dbfRctPrvL )->nCanEnt
                  ( ::cAreaTmpLabel )->lControl := ( dbfRctPrvL )->lControl
                  ( ::cAreaTmpLabel )->cUnidad  := ( dbfRctPrvL )->cUnidad
                  ( ::cAreaTmpLabel )->nUniCaja := ( dbfRctPrvL )->nUniCaja
                  ( ::cAreaTmpLabel )->mLngDes  := ( dbfRctPrvL )->mLngDes
                  ( ::cAreaTmpLabel )->nDtoLin  := ( dbfRctPrvL )->nDtoLin
                  ( ::cAreaTmpLabel )->nDtoPrm  := ( dbfRctPrvL )->nDtoPrm
                  ( ::cAreaTmpLabel )->nDtoRap  := ( dbfRctPrvL )->nDtoRap
                  ( ::cAreaTmpLabel )->cCodPr1  := ( dbfRctPrvL )->cCodPr1
                  ( ::cAreaTmpLabel )->cCodPr2  := ( dbfRctPrvL )->cCodPr2
                  ( ::cAreaTmpLabel )->cValPr1  := ( dbfRctPrvL )->cValPr1
                  ( ::cAreaTmpLabel )->cValPr2  := ( dbfRctPrvL )->cValPr2
                  ( ::cAreaTmpLabel )->nFacCnv  := ( dbfRctPrvL )->nFacCnv
                  ( ::cAreaTmpLabel )->cAlmLin  := ( dbfRctPrvL )->cAlmLin
                  ( ::cAreaTmpLabel )->nCtlStk  := ( dbfRctPrvL )->nCtlStk
                  ( ::cAreaTmpLabel )->lLote    := ( dbfRctPrvL )->lLote
                  ( ::cAreaTmpLabel )->nLote    := ( dbfRctPrvL )->nLote
                  ( ::cAreaTmpLabel )->cLote    := ( dbfRctPrvL )->cLote
                  ( ::cAreaTmpLabel )->nNumLin  := ( dbfRctPrvL )->nNumLin
                  ( ::cAreaTmpLabel )->nUndKit  := ( dbfRctPrvL )->nUndKit
                  ( ::cAreaTmpLabel )->lKitArt  := ( dbfRctPrvL )->lKitArt
                  ( ::cAreaTmpLabel )->lKitChl  := ( dbfRctPrvL )->lKitChl
                  ( ::cAreaTmpLabel )->lKitPrc  := ( dbfRctPrvL )->lKitPrc
                  ( ::cAreaTmpLabel )->lImpLin  := ( dbfRctPrvL )->lImpLin
                  ( ::cAreaTmpLabel )->mNumSer  := ( dbfRctPrvL )->mNumSer
                  ( ::cAreaTmpLabel )->cCodUbi1 := ( dbfRctPrvL )->cCodUbi1
                  ( ::cAreaTmpLabel )->cCodUbi2 := ( dbfRctPrvL )->cCodUbi2
                  ( ::cAreaTmpLabel )->cCodUbi3 := ( dbfRctPrvL )->cCodUbi3
                  ( ::cAreaTmpLabel )->cValUbi1 := ( dbfRctPrvL )->cValUbi1
                  ( ::cAreaTmpLabel )->cValUbi2 := ( dbfRctPrvL )->cValUbi2
                  ( ::cAreaTmpLabel )->cValUbi3 := ( dbfRctPrvL )->cValUbi3
                  ( ::cAreaTmpLabel )->cNomUbi1 := ( dbfRctPrvL )->cNomUbi1
                  ( ::cAreaTmpLabel )->cNomUbi2 := ( dbfRctPrvL )->cNomUbi2
                  ( ::cAreaTmpLabel )->cNomUbi3 := ( dbfRctPrvL )->cNomUbi3
                  ( ::cAreaTmpLabel )->cCodFam  := ( dbfRctPrvL )->cCodFam
                  ( ::cAreaTmpLabel )->cGrpFam  := ( dbfRctPrvL )->cGrpFam
                  ( ::cAreaTmpLabel )->mObsLin  := ( dbfRctPrvL )->mObsLin
                  ( ::cAreaTmpLabel )->nPvpRec  := ( dbfRctPrvL )->nPvpRec
                  ( ::cAreaTmpLabel )->nUndLin  := nTotNRctPrv( dbfRctPrvL )
                  ( ::cAreaTmpLabel )->lLabel   := .t.

                  if ::nCantidadLabels == 1
                  ( ::cAreaTmpLabel )->nLabel   := nTotNRctPrv( dbfRctPrvL )
                  else
                  ( ::cAreaTmpLabel )->nLabel   := ::nUnidadesLabels
                  end if

               end if

               ( dbfRctPrvL )->( dbSkip() )

            end while

         end if

         ( dbfRctPrvT )->( dbSkip() )

      end while

   end if

   ( dbfRctPrvT )->( OrdSetFocus( nOrd ) )
   ( dbfRctPrvT )->( dbGoTo( nRec ) )

   ( ::cAreaTmpLabel )->( dbGoTop() )

   ::oBrwLabel:Refresh()

Return ( Self )

//---------------------------------------------------------------------------//

Method InitLabel( oLabel ) CLASS TRectificativaProveedorLabelGenerator

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

Method SelectColumn( oCombo ) CLASS TRectificativaProveedorLabelGenerator

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

Static Function DataLabel( oFr, lTemporal )

   /*
   Zona de datos------------------------------------------------------------
   */

   oFr:ClearDataSets()

   if lTemporal
      oFr:SetWorkArea(  "Lineas de facturas rectificativas", ( tmpRctPrvL )->( Select() ), .f., { FR_RB_FIRST, FR_RE_LAST, 0 } )
   else
      oFr:SetWorkArea(  "Lineas de facturas rectificativas", ( dbfRctPrvL )->( Select() ), .f., { FR_RB_FIRST, FR_RE_COUNT, 20 } )
   end if
   oFr:SetFieldAliases( "Lineas de facturas rectificativas", cItemsToReport( aColRctPrv() ) )

   oFr:SetWorkArea(     "Facturas rectificativas", ( dbfRctPrvT )->( Select() ) )
   oFr:SetFieldAliases( "Facturas rectificativas", cItemsToReport( aItmRctPrv() ) )

   oFr:SetWorkArea(     "Art�culos", ( dbfArticulo )->( Select() ) )
   oFr:SetFieldAliases( "Art�culos", cItemsToReport( aItmArt() ) )

   oFr:SetWorkArea(     "Precios por propiedades", ( dbfArtCom )->( Select() ) )
   oFr:SetFieldAliases( "Precios por propiedades", cItemsToReport( aItmVta() ) )

   if lTemporal
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Facturas rectificativas", {|| ( tmpRctPrvL )->cSerFac + Str( ( tmpRctPrvL )->nNumFac ) + ( tmpRctPrvL )->cSufFac } )
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Art�culos", {|| ( tmpRctPrvL )->cRef } )
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Precios por propiedades", {|| ( tmpRctPrvL )->cRef + ( tmpRctPrvL )->cCodPr1 + ( tmpRctPrvL )->cCodPr2 + ( tmpRctPrvL )->cValPr1 + ( tmpRctPrvL )->cValPr2 } )
   else
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Facturas rectificativas", {|| ( dbfRctPrvL )->cSerFac + Str( ( dbfRctPrvL )->nNumFac ) + ( dbfRctPrvL )->cSufFac } )
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Art�culos", {|| ( dbfRctPrvL )->cRef } )
      oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Precios por propiedades", {|| ( dbfRctPrvL )->cRef + ( dbfRctPrvL )->cCodPr1 + ( dbfRctPrvL )->cCodPr2 + ( dbfRctPrvL )->cValPr1 + ( dbfRctPrvL )->cValPr2 } )
   end if

   oFr:SetResyncPair(      "Lineas de facturas rectificativas", "Facturas rectificativas" )
   oFr:SetResyncPair(      "Lineas de facturas rectificativas", "Art�culos" )
   oFr:SetResyncPair(      "Lineas de facturas rectificativas", "Precios por propiedades" )

Return nil

//---------------------------------------------------------------------------//

Function DesignLabelRctPrv( oFr, dbfDoc )

   local oLabel   := TRectificativaProveedorLabelGenerator():Init()

   if !oLabel:lErrorOnCreate

      /*
      Zona de datos---------------------------------------------------------
      */

      DataLabel( oFr, .f. )

      /*
      Paginas y bandas------------------------------------------------------
      */

      if !Empty( ( dbfDoc )->mReport )

         oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      else

         oFr:AddPage(         "MainPage" )

         oFr:AddBand(         "CabeceraColumnas",  "MainPage",       frxMasterData )
         oFr:SetProperty(     "CabeceraColumnas",  "Top",            200 )
         oFr:SetProperty(     "CabeceraColumnas",  "Height",         100 )
         oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet",        "Lineas de facturas rectificativas" )

      end if

      /*
      Zona de variables--------------------------------------------------------
      */

      VariableReport( oFr )

      /*
      Dise�o de report------------------------------------------------------
      */

      oFr:DesignReport()

      /*
      Destruye el dise�ador-------------------------------------------------
      */

      oFr:DestroyFr()

      /*
      Destruye el fichero temporal------------------------------------------------
      */

      oLabel:DestroyTemporal()

      /*
      Cierra ficheros-------------------------------------------------------
      */

      oLabel:End()

   else

      Return .f.

   end if

Return .t.


//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

Function aLblRctPrv()

   local aLblFacPrv  := {}

   aAdd( aLblFacPrv, { "CSERFAC"    ,"C",  1, 0, "Serie de factura"            ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NNUMFAC"    ,"N",  9, 0, "N�mero de factura"           ,"'999999999'",         "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CSUFFAC"    ,"C",  2, 0, "Sufijo de factura"           ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CREF"       ,"C", 18, 0, "Referencia art�culo"         ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CREFPRV"    ,"C", 20, 0, "Referencia del proveedor"    ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CDETALLE"   ,"C",100, 0, "Detalle de articulo"         ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NPREUNIT"   ,"N", 16, 6, "Precio unitario"             ,"cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NDTO"       ,"N",  6, 2, ""                            ,"'@E 99,99'",          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NIVA"       ,"N",  6, 2, "Porcentaje de " + cImp()           ,"'@E 99,99'",          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NCANENT"    ,"N", 16, 6, "Cantidad recibida"           ,"cMasUnd()",           "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LCONTROL"   ,"L",  1, 0, "Control reservado"           ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CUNIDAD"    ,"C",  2, 0, "Unidad de venta"             ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NUNICAJA"   ,"N", 16, 6, "Unidades por caja"           ,"cMasUnd()",           "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LCHGLIN"    ,"L",  1, 0, "Cambio de precio"            ,"",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "MLNGDES"    ,"M", 10, 0, ""                            ,""          ,          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NDTOLIN"    ,"N",  6, 2, "Descuento lineal"            ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NDTOPRM"    ,"N",  6, 2, "Descuento por promoci�n"     ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NDTORAP"    ,"N",  6, 2, "Descuento por rappel"        ,"'@E 999,99'",         "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NPRECOM"    ,"N", 16, 6, "Precio de compra"            ,"cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LBNFLIN1"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "LBNFLIN2"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "LBNFLIN3"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "LBNFLIN4"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "LBNFLIN5"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "LBNFLIN6"   ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN1"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN2"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN3"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN4"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN5"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFLIN6"   ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR1"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR2"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR3"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR4"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR5"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NBNFSBR6"   ,"N",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN1"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN2"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN3"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN4"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN5"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NPVPLIN6"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN1"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN2"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN3"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN4"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN5"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN6"   ,"N", 16, 6, "" }                                                                      )
   aAdd( aLblFacPrv, { "NIVALIN"    ,"N",  6, 2, "" }                                                                      )
   aAdd( aLblFacPrv, { "LIVALIN"    ,"L",  1, 0, "" }                                                                      )
   aAdd( aLblFacPrv, { "CCODPR1"    ,"C", 10, 0, "C�digo de la propiedad 1",    "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CCODPR2"    ,"C", 10, 0, "C�digo de la propiedad 2",    "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CVALPR1"    ,"C", 10, 0, "Valor de la propiedad 1" ,    "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CVALPR2"    ,"C", 10, 0, "Valor de la propiedad 2" ,    "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NFACCNV"    ,"N", 16, 6, "Factor de conversi�n de la compra", "",              "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CALMLIN"    ,"C",  3, 0, "C�digo del almacen" ,         "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NCTLSTK"    ,"N",  1, 0, "Tipo de stock de la l�nea",   "'9'",                 "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LLOTE"      ,"L",  1, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NLOTE"      ,"N",  9, 0, "",                            "'999999999'",         "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CLOTE"      ,"C", 12, 0, "N�mero de lote",              "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NNUMLIN"    ,"N",  4, 0, "N�mero de la l�nea",          "9999",                "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NUNDKIT"    ,"N", 16, 6, "Unidades del producto kit",   "MasUnd()",            "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LKITART"    ,"L",  1, 0, "L�nea con escandallo",        "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LKITCHL"    ,"L",  1, 0, "L�nea pertenciente a escandallo", "",                "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LKITPRC"    ,"L",  1, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LIMPLIN"    ,"L",  1, 0, "Imprimir l�nea",              "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "MNUMSER"    ,"M", 10, 0, "" ,                           "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CCODUBI1"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CCODUBI2"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CCODUBI3"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CVALUBI1"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CVALUBI2"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CVALUBI3"   ,"C",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CNOMUBI1"   ,"C", 30, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CNOMUBI2"   ,"C", 30, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CNOMUBI3"   ,"C", 30, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CCODFAM"    ,"C", 16, 0, "C�digo de familia",           "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "CGRPFAM"    ,"C",  3, 0, "C�digo del grupo de familia", "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NREQ"       ,"N", 16, 6, "Recargo de equivalencia",     "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "MOBSLIN"    ,"M", 10, 0, "Observaci�n de l�nea",        "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "nPvpRec"    ,"N", 16, 6, "Precio de venta recomendado", "cPinDivFac",          "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NUNDLIN"    ,"N",  5, 0, "",                            "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "LLABEL"     ,"L",  1, 0, "L�gico de etiqueta",          "",                    "", "( cDbfCol )" } )
   aAdd( aLblFacPrv, { "NLABEL"     ,"N",  5, 0, "N�mero de etiquetas",         "",                    "", "( cDbfCol )" } )

return ( aLblFacPrv )

//---------------------------------------------------------------------------//

Static Function DataReport( oFr )

   /*
   Zona de datos------------------------------------------------------------
   */

   oFr:ClearDataSets()

   oFr:SetWorkArea(     "Facturas rectificativas", ( dbfRctPrvT )->( Select() ), .f., { FR_RB_CURRENT, FR_RB_CURRENT, 0 } )
   oFr:SetFieldAliases( "Facturas rectificativas", cItemsToReport( aItmRctPrv() ) )

   oFr:SetWorkArea(     "Lineas de facturas rectificativas", ( dbfRctPrvL )->( Select() ) )
   oFr:SetFieldAliases( "Lineas de facturas rectificativas", cItemsToReport( aColRctPrv() ) )

   oFr:SetWorkArea(     "Incidencias de facturas rectificativas", ( dbfRctPrvI )->( Select() ) )
   oFr:SetFieldAliases( "Incidencias de facturas rectificativas", cItemsToReport( aIncRctPrv() ) )

   oFr:SetWorkArea(     "Documentos de facturas rectificativas", ( dbfRctPrvD )->( Select() ) )
   oFr:SetFieldAliases( "Documentos de facturas rectificativas", cItemsToReport( aFacPrvDoc() ) )

   oFr:SetWorkArea(     "Empresa", ( dbfEmp )->( Select() ) )
   oFr:SetFieldAliases( "Empresa", cItemsToReport( aItmEmp() ) )

   oFr:SetWorkArea(     "Proveedores", ( dbfPrv )->( Select() ) )
   oFr:SetFieldAliases( "Proveedores", cItemsToReport( aItmPrv() ) )

   oFr:SetWorkArea(     "Almacenes", ( dbfAlm )->( Select() ) )
   oFr:SetFieldAliases( "Almacenes", cItemsToReport( aItmAlm() ) )

   oFr:SetWorkArea(     "Formas de pago", ( dbfFpago )->( Select() ) )
   oFr:SetFieldAliases( "Formas de pago", cItemsToReport( aItmFPago() ) )

   oFr:SetWorkArea(     "Unidades de medici�n",  oUndMedicion:Select() )
   oFr:SetFieldAliases( "Unidades de medici�n",  cObjectsToReport( oUndMedicion:oDbf ) )

   oFr:SetWorkArea(     "Bancos", ( dbfPrvBnc )->( Select() ) )
   oFr:SetFieldAliases( "Bancos", cItemsToReport( aPrvBnc() ) )

   oFr:SetMasterDetail( "Facturas rectificativas", "Lineas de facturas rectificativas",      {|| ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Incidencias de facturas rectificativas", {|| ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Documentos de facturas rectificativas",  {|| ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Proveedores",                            {|| ( dbfRctPrvT )->cCodPrv } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Almacenes",                              {|| ( dbfRctPrvT )->cCodAlm } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Formas de pago",                         {|| ( dbfRctPrvT )->cCodPago} )
   oFr:SetMasterDetail( "Facturas rectificativas", "Empresa",                                {|| cCodigoEmpresaEnUso() } )
   oFr:SetMasterDetail( "Facturas rectificativas", "Bancos",                                 {|| ( dbfRctPrvT )->cCodPrv } )

   oFr:SetMasterDetail( "Lineas de facturas rectificativas", "Unidades de medici�n",         {|| ( dbfRctPrvL )->cUnidad } )

   oFr:SetResyncPair(   "Facturas rectificativas", "Lineas de facturas rectificativas" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Incidencias de facturas rectificativas" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Documentos de facturas rectificativas" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Proveedores" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Almacenes" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Formas de pago" )
   oFr:SetResyncPair(   "Facturas rectificativas", "Bancos" )

   oFr:SetResyncPair(   "Lineas de facturas rectificativas", "Unidades de medici�n" )

Return nil

//---------------------------------------------------------------------------//

Static Function VariableReport( oFr )

   oFr:DeleteCategory(  "Facturas rectificativas" )
   oFr:DeleteCategory(  "Lineas de facturas rectificativas" )

   /*
   Creaci�n de variables----------------------------------------------------
   */

   oFr:AddVariable(     "Facturas rectificativas",             "Total bruto",                         "GetHbVar('nTotBrt')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total factura",                       "GetHbVar('nTotFac')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total descuento",                     "GetHbVar('nTotDto')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total descuento pronto pago",         "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total primer descuento definible",    "GetHbVar('nTotDto')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total segundo descuento definible",   "GetHbVar('nTotDpp')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total neto",                          "GetHbVar('nTotNet')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total " + cImp(),                           "GetHbVar('nTotIva')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total RE",                            "GetHbVar('nTotReq')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total retenciones por IRPF",          "GetHbVar('nTotRet')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total impuestos",                     "GetHbVar('nTotImp')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Total unidades",                      "GetHbVar('nTotUnd')" )
   oFr:AddVariable(     "Facturas rectificativas",             "Bruto primer tipo de " + cImp(),            "GetHbArrayVar('aIvaUno',1)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Bruto segundo tipo de " + cImp(),           "GetHbArrayVar('aIvaDos',1)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Bruto tercer tipo de " + cImp(),            "GetHbArrayVar('aIvaTre',1)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Base primer tipo de " + cImp(),             "GetHbArrayVar('aIvaUno',2)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Base segundo tipo de " + cImp(),            "GetHbArrayVar('aIvaDos',2)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Base tercer tipo de " + cImp(),             "GetHbArrayVar('aIvaTre',2)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje primer tipo " + cImp(),          "GetHbArrayVar('aIvaUno',3)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje segundo tipo " + cImp(),         "GetHbArrayVar('aIvaDos',3)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje tercer tipo " + cImp(),          "GetHbArrayVar('aIvaTre',3)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje primer tipo RE",           "GetHbArrayVar('aIvaUno',4)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje segundo tipo RE",          "GetHbArrayVar('aIvaDos',4)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Porcentaje tercer tipo RE",           "GetHbArrayVar('aIvaTre',4)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe primer tipo " + cImp(),             "GetHbArrayVar('aIvaUno',5)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe segundo tipo " + cImp(),            "GetHbArrayVar('aIvaDos',5)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe tercer tipo " + cImp(),             "GetHbArrayVar('aIvaTre',5)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe primer RE",                   "GetHbArrayVar('aIvaUno',6)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe segundo RE",                  "GetHbArrayVar('aIvaDos',6)" )
   oFr:AddVariable(     "Facturas rectificativas",             "Importe tercer RE",                   "GetHbArrayVar('aIvaTre',6)" )

   oFr:AddVariable(     "Facturas rectificativas",             "Cuenta bancaria proveedor",           "CallHbFunc('cCtaRctPrv')" )

   oFr:AddVariable(     "Lineas de facturas rectificativas",   "C�digo del art�culo con propiedades", "CallHbFunc('cPrpRctPrv')" )
   oFr:AddVariable(     "Lineas de facturas rectificativas",   "Detalle del art�culo",                "CallHbFunc('cDesRctPrv')" )
   oFr:AddVariable(     "Lineas de facturas rectificativas",   "Total unidades art�culo",             "CallHbFunc('nTotNRctPrv')" )
   oFr:AddVariable(     "Lineas de facturas rectificativas",   "Precio unitario de factura",          "CallHbFunc('nTotURctPrv')" )
   oFr:AddVariable(     "Lineas de facturas rectificativas",   "Total l�nea de factura",              "CallHbFunc('nTotLRctPrv')" )

Return nil

//---------------------------------------------------------------------------//

Function DesignReportRctPrv( oFr, dbfDoc )

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

      if !Empty( ( dbfDoc )->mReport )

         oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      else

         oFr:SetProperty(     "Report",            "ScriptLanguage", "PascalScript" )
         oFr:SetProperty(     "Report.ScriptText", "Text",;
                                                   + ;
                                                   "procedure DetalleOnMasterDetail(Sender: TfrxComponent);"   + Chr(13) + Chr(10) + ;
                                                   "begin"                                                     + Chr(13) + Chr(10) + ;
                                                   "CallHbFunc('nTotRctPrv');"                                 + Chr(13) + Chr(10) + ;
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
         oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet", "Facturas rectificativas" )

         oFr:AddBand(         "DetalleColumnas",   "MainPage", frxDetailData  )
         oFr:SetProperty(     "DetalleColumnas",   "Top", 230 )
         oFr:SetProperty(     "DetalleColumnas",   "Height", 28 )
         oFr:SetObjProperty(  "DetalleColumnas",   "DataSet", "Lineas de facturas rectificativas" )
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

      oFr:SetTabTreeExpanded( FR_tvAll, .f. )
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

Function PrintReportRctPrv( nDevice, nCopies, cPrinter, dbfDoc )

   local oFr
   local cFilePdf

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

   DataReport( oFr )

   cFilePdf             := cPatTmp() + "RectificativaProveedor" + StrTran( ( dbfRctPrvT )->cSerFac + Str( ( dbfRctPrvT )->nNumFac ) + ( dbfRctPrvT )->cSufFac, " ", "" ) + ".Pdf"

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
            oFr:PrepareReport()
            oFr:ShowPreparedReport()

         case nDevice == IS_PRINTER
            oFr:PrintOptions:SetPrinter( cPrinter )
            oFr:PrintOptions:SetCopies( nCopies )
            oFr:PrintOptions:SetShowDialog( .f. )
            oFr:PrepareReport()
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
            oFr:SetProperty(  "PDFExport", "FileName",         cFilePdf  )
            oFr:SetProperty(  "PDFExport", "EmbeddedFonts",    .t. )
            oFr:SetProperty(  "PDFExport", "PrintOptimized",   .t. )
            oFr:SetProperty(  "PDFExport", "Outline",          .t. )
            oFr:SetProperty(  "PDFExport", "OpenAfterExport",  .f. )
            oFr:DoExport(     "PDFExport" )

            if file( cFilePdf )

               with object ( TGenMailing():New() )

                  :SetTypeDocument( "nRctPrv" )
                  :SetDe(           uFieldEmpresa( "cNombre" ) )
                  :SetCopia(        uFieldEmpresa( "cCcpMai" ) )
                  :SetAdjunto(      cFilePdf )
                  :SetPara(         RetFld( ( dbfAlbPrvT )->cCodPrv, dbfPrv, "cMeiInt" ) )
                  :SetAsunto(       "Envio de factura rectificativa de proveedor n�mero " + ( dbfRctPrvT )->cSerFac + "/" + Alltrim( Str( ( dbfRctPrvT )->nNumFac ) ) )
                  :SetMensaje(      "Adjunto le remito nuestra factura rectificativa de proveedor " + ( dbfRctPrvT )->cSerFac + "/" + Alltrim( Str( ( dbfRctPrvT )->nNumFac ) ) + Space( 1 ) )
                  :SetMensaje(      "de fecha " + Dtoc( ( dbfRctPrvT )->dfecFac ) + Space( 1 ) )
                  :SetMensaje(      CRLF )
                  :SetMensaje(      CRLF )
                  :SetMensaje(      "Reciba un cordial saludo." )

                  :GeneralResource( dbfRctPrvT, aItmRctPrv() )

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
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

FUNCTION nIncURctPrv( dbfTmpLin, nDec, nVdv )

   local nCalculo

   DEFAULT nDec   := 0
   DEFAULT nVdv   := 1

   nCalculo       := nTotURctPrv( dbfTmpLin, nDec, nVdv )

   if !( dbfTmpLin )->lIvaLin
      nCalculo    += nCalculo * ( dbfTmpLin )->nIva / 100
   end if

	IF nVdv != 0
      nCalculo    := nCalculo / nVdv
	END IF

RETURN ( Round( nCalculo, nDec ) )

//---------------------------------------------------------------------------//

FUNCTION nIncLRctPrv( dbfLin, nDec, nRouDec, nVdv )

   local nCalculo := nTotLRctPrv( dbfLin, nDec, nRouDec, nVdv )

   if !( dbfLin )->lIvaLin
      nCalculo    += nCalculo * ( dbfLin )->nIva / 100
   end if

RETURN ( nCalculo )

//---------------------------------------------------------------------------//
Static Function YearComboBoxChange()

	 if oWndBrw:oWndBar:lAllYearComboBox()
      DestroyFastFilter( dbfRctPrvT )
      CreateUserFilter( "", dbfRctPrvT, .f., , , "all" )
	 else
      DestroyFastFilter( dbfRctPrvT )
      CreateUserFilter( "Year( Field->dFecFac ) == " + oWndBrw:oWndBar:cYearComboBox(), dbfRctPrvT, .f., , , "Year( Field->dFecFac ) == " + oWndBrw:oWndBar:cYearComboBox() )
	 end if

    ( dbfRctPrvT )->( dbGoTop() )

	 oWndBrw:Refresh()

Return nil

//---------------------------------------------------------------------------//
/*
Obtnenemos el nuevo numero del contador
*/

function nNewReciboProveedor( cNumFac, cTipRec, dbfFacPrvP )

   local nCon
   local nRec
   local nOrd

   DEFAULT cTipRec         := .f.

   nCon                    := 1
   nRec                    := ( dbfFacPrvP )->( Recno() )

   if Empty( cTipRec )
      nOrd                 := ( dbfFacPrvP )->( OrdSetFocus( "nNumFac" ) )
   else
      nOrd                 := ( dbfFacPrvP )->( OrdSetFocus( "rNumFac" ) )
   end if

   if ( dbfFacPrvP )->( dbSeek( cNumFac ) )

      while ( dbfFacPrvP )->cSerFac + Str( ( dbfFacPrvP )->nNumFac ) + ( dbfFacPrvP )->cSufFac == cNumFac .and. !( dbfFacPrvP )->( eof() )

         ++nCon

         ( dbfFacPrvP )->( dbSkip() )

      end do

   end if

   ( dbfFacPrvP )->( OrdSetFocus( nOrd ) )
   ( dbfFacPrvP )->( dbGoTo( nRec ) )

return ( nCon )

//------------------------------------------------------------------------//

Static Function EditarNumeroSerie( aTmp, nMode )

   with object ( TNumerosSerie() )

      :lCompras         := .t.
      :nMode            := nMode

      :cCodArt          := aTmp[ _CREF    ]
      :cCodAlm          := aTmp[ _CALMLIN ]
      :nNumLin          := aTmp[ _NNUMLIN ]

      :nTotalUnidades   := nTotNRctPrv( aTmp )

      :oStock           := oStock

      :uTmpSer          := dbfTmpSer

      :Resource()

   end with

Return ( nil )

//--------------------------------------------------------------------------//

Static Function OldEditarNumeroSerie( aTmp, nMode )

   local n        := 1
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
   local nTotUnd

   DEFAULT nMode  := APPD_MODE

   nTotUnd        := Abs( nTotNRctPrv( aTmp ) )

   if nTotUnd == 0
      MsgStop( "No hay unidades para asignar n�meros de serie." )
      Return ( nil )
   end if

   aNumSer        := Afill( Array( nTotUnd ), Space( 40 ) )

   if ( dbfTmpSer )->( dbSeek( Str( aTmp[ _NNUMLIN ], 4 ) + aTmp[ _CREF ] ) )
      while ( Str( ( dbfTmpSer )->nNumLin, 4 ) + ( dbfTmpSer )->cRef == Str( aTmp[ _NNUMLIN ], 4 ) + aTmp[ _CREF ] ) .and. !( dbfTmpSer )->( Eof() )
         if ( n <= nTotUnd )
            aNumSer[ n ]   := ( dbfTmpSer )->cNumSer
         end if
         ( dbfTmpSer )->( dbSkip() )
         n++
      end while
   end if

   DEFINE DIALOG oDlg RESOURCE "VtaNumSer"

      REDEFINE GET nTotUnd ;
			ID 		100 ;
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

      oBrwSer                 := TXBrowse():New( oDlg )

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

      oProSer     := TMeter():ReDefine( 240, { | u | if( pCount() == 0, nProSer, nProSer := u ) }, 10, oDlg, .f., , , .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )

      REDEFINE BUTTON ;
         ID       510 ;
         OF       oDlg ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( SalvarNumeroSerie( aNumSer, aTmp, oProSer, nMode ), oDlg:End() )

      REDEFINE BUTTON ;
         ID       520 ;
         OF       oDlg ;
         ACTION   ( oDlg:End() )

      oDlg:AddFastKey( VK_F5, {|| SalvarNumeroSerie( aNumSer, aTmp, oProSer, nMode ), oDlg:End() } )

   ACTIVATE DIALOG oDlg CENTER

Return ( aNumSer )

//----------------------------------------------------------------------------//

Static Function SalvarNumeroSerie( aNumSer, aTmp, oProSer, nMode )

   local cNumSer
   local nTotUnd              := len( aNumSer )

   while ( ( dbfTmpSer )->( dbSeek( Str( aTmp[ _NNUMLIN ], 4 ) + aTmp[ _CREF ] ) ) ) .and. !( dbfTmpSer )->( Eof() )
      ( dbfTmpSer )->( dbDelete() )
   end while

   if !Empty( oProSer )
      oProSer:SetTotal( nTotUnd )
   end if

   for each cNumSer in aNumSer

      ( dbfTmpSer )->( dbAppend() )
      ( dbfTmpSer )->cRef     := aTmp[ _CREF    ]
      ( dbfTmpSer )->nNumLin  := aTmp[ _NNUMLIN ]
      ( dbfTmpSer )->cAlmLin  := aTmp[ _CALMLIN ]
      ( dbfTmpSer )->cNumSer  := cNumSer

      if !Empty( oProSer ) .and. ( Mod( hb_enumindex(), int( nTotUnd / 100 ) ) == 0 )
         oProSer:Set( hb_enumindex() )
      end if

   next

Return ( nil )

//----------------------------------------------------------------------------//