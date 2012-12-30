#include "FiveWin.Ch"
#include "Factu.ch"
#include "MesDbf.ch"
#include "Report.ch"
#include "XBrowse.ch"

memvar oDbf
memvar cDbf
memvar oDbfCol
memvar cDbfCol
memvar oDbfAlm
memvar cDbfAlm
memvar oDbfSec
memvar cDbfSec
memvar cPouDivPro
memvar cDetPro
memvar cDetMat
memvar cDetHPer
memvar cDetMaq
memvar oThis
memvar nPagina
memvar lEnd
memvar cTiempoEmp
memvar nProd
memvar nMat
memvar nPer
memvar nMaq
memvar nParte

//---------------------------------------------------------------------------//

Function StartTProduccion()

   local oProduccion := TProduccion():New( cPatEmp(), oWnd(), "04008" )

   if !Empty( oProduccion )
      oProduccion:Activate()
   end if

Return nil

//---------------------------------------------------------------------------//

CLASS TProduccion FROM TMasDet

   DATA  cMru        INIT "Worker2_Form_Red_16"

   DATA  oArt
   DATA  oAlm
   DATA  oAlbPrvT
   DATA  oAlbPrvL
   DATA  oAlbPrvS
   DATA  oFacPrvT
   DATA  oFacPrvL
   DATA  oFacPrvS
   DATA  oRctPrvL
   DATA  oRctPrvS
   DATA  oAlbCliT
   DATA  oAlbCliL
   DATA  oAlbCliS
   DATA  oFacCliT
   DATA  oFacCliL
   DATA  oFacCliS
   DATA  oFacRecT
   DATA  oFacRecL
   DATA  oFacRecS
   DATA  oTikCliT
   DATA  oTikCliL
   DATA  oTikCliS

   DATA  oHisMov

   DATA  oStock
   DATA  oPro
   DATA  oTblPro
   DATA  oFam
   DATA  oKitArt
   DATA  oDbfDoc
   DATA  oDbfCount
   DATA  oDbfEmp
   DATA  oDbfFilter

   DATA  oDetProduccion
   DATA  oDetSeriesProduccion
   DATA  oDetMaterial
   DATA  oDetSeriesMaterial
   DATA  oDetHoras
   DATA  oDetHorasPersonal
   DATA  oDetPersonal
   DATA  oDetMaquina

   DATA  oOperario
   DATA  oSeccion
   DATA  oOperacion
   DATA  oMaquina
   DATA  oHoras

   DATA  oGetTotalUnidades
   DATA  nGetTotalUnidades    INIT  0

   DATA  cTmpEmp
   DATA  cTiempoEmpleado      INIT  0

   DATA  oTotProducido
   DATA  oTotMaterias
   DATA  oTotPersonal
   DATA  oTotMaquinaria

   DATA  cOldCodSec           INIT ""
   DATA  cOldCodOpe           INIT ""
   DATA  dOldFecIni           INIT Ctod( "" )
   DATA  dOldFecFin           INIT Ctod( "" )
   DATA  cOldHorIni           INIT ""
   DATA  cOldHorFin           INIT ""

   DATA aCal
   DATA cTime

   DATA  oDbfTemporal

   DATA  cFileName

   METHOD New( cPath, oWndParent, oMenuItem )
   METHOD Create( cPath, oWndParent )

   METHOD Activate()

   METHOD OpenFiles( lExclusive )
   METHOD OpenService( lExclusive )

   METHOD CloseFiles()
   METHOD CloseService()

   METHOD DefineFiles()

   METHOD Resource( nMode, aDatosAnterior )

   METHOD lPreSave( oGetAlm, oGetSec, oGetOpe, oHorFin, nMode, oDlg )

   METHOD nTotUnidades()   INLINE   ( NotCaja( ::oDbf:nCajArt ) * ::oDbf:nUndArt )
   METHOD lTotUnidades()   INLINE   ( ::oGetTotalUnidades:cText( Round( ::nTotUnidades(), ::nDouDiv ) ), .t. )

   METHOD LoaArticulo( oGetArticulo, oGetNombre )

   METHOD GetNewCount()

   METHOD lTiempoEmpleado( oTmpEmp )

   METHOD lRecargaPersonal( oCodSec )

   METHOD GenParte( nDevice, cCaption, cCodDoc, cPrinter )

   METHOD EPage( oInf, cCodDoc )

   METHOD lGenParte( oBrw, oBtn, nDevice )

   METHOD bGenParte( nDevice, cTitle, cCodDoc )

   METHOD nGenParte( nDevice, cTitle, cCodDoc, cPrinter, nCopy )

   METHOD CreateTemporal( cNumeroParte )

   METHOD DefineTemporal()

   METHOD DestroyTemporal()

   METHOD DefineCalculate()

   METHOD PrnSerie()

   METHOD StartPrint( cFmtDoc, cDocIni, cDocFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden )

   METHOD RecSiguente( oBrw )

   METHOD CargaPersonalAnterior( aDatosAnterior )

   METHOD nTotalProducido( cDocumento )

   METHOD nTotalMaterial( cDocumento )

   METHOD nTotalPersonal( cDocumento )

   METHOD nTotalMaquina( cDocumento )

   METHOD nTotalOperario( cDocOpe )

   METHOD nTotalVolumen( cDocumento )

   METHOD DataReport( oFr )

   METHOD VariableReport( oFr )

   METHOD DesignReportProducc( oFr, dbfDoc )

   METHOD PrintReportProducc( nDevice, nCopies, cPrinter, dbfDoc )

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( cPath, oWndParent, oMenuItem )

   DEFAULT cPath           := cPatEmp()
   DEFAULT oWndParent      := GetWndFrame()

   if oMenuItem != nil .and. ::nLevel == nil
      ::nLevel             := nLevelUsr( oMenuItem )
   else
      ::nLevel             := 0
   end if

   if nAnd( ::nLevel, 1 ) != 0
      msgStop( "Acceso no permitido." )
      return nil
   end if

   ::cPath                 := cPath
   ::oWndParent            := oWndParent

   ::cTipoDocumento        := PAR_PRO

   ::bFirstKey             := {|| ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd }

   ::oOperario             := TOperarios():Create()
   ::oOperacion            := TOperacion():CreateInit()
   ::oMaquina              := TMaquina():CreateInit()
   ::oSeccion              := TSeccion():Create()
   ::oHoras                := THoras():Create()

   ::oDetHoras             := TDetHoras():New( cPath, Self )

   ::oDetProduccion        := TDetProduccion():New( cPath, Self )
   ::AddDetail( ::oDetProduccion )

   ::oDetSeriesProduccion  := TDetSeriesProduccion():New( cPath, Self )
   ::AddDetail( ::oDetSeriesProduccion )

   ::oDetMaterial          := TDetMaterial():New( cPath, Self )
   ::AddDetail( ::oDetMaterial )

   ::oDetSeriesMaterial    := TDetSeriesMaterial():New( cPath, Self )
   ::AddDetail( ::oDetSeriesMaterial )

   ::oDetPersonal          := TDetPersonal():New( cPath, Self )
   ::AddDetail( ::oDetPersonal )

   ::oDetHorasPersonal     := TDetHorasPersonal():New( cPath, Self )
   ::AddDetail( ::oDetHorasPersonal )

   ::oDetMaquina           := TDetMaquina():New( cPath, Self )
   ::AddDetail( ::oDetMaquina )

   ::oStock                := TStock():Create( cPatGrp() )

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD Create( cPath, oWndParent )

   DEFAULT cPath        := cPatEmp()
   DEFAULT oWndParent   := GetWndFrame()

   ::cPath              := cPath
   ::oWndParent         := oWndParent

   ::oOperario          := TOperarios():Create( cPath )

   ::oOperacion         := TOperacion():CreateInit( cPath )

   ::oMaquina           := TMaquina():CreateInit( cPath )

   ::oSeccion           := TSeccion():Create( cPath )

   ::oHoras             := THoras():Create( cPath )

   ::oDetHoras          := TDetHoras():New( cPath, Self )

   ::oDetHorasPersonal  := TDetHorasPersonal():New( cPath, Self )
   ::AddDetail( ::oDetHorasPersonal )

   ::oDetProduccion     := TDetProduccion():New( cPath, Self )
   ::AddDetail( ::oDetProduccion )

   ::oDetSeriesProduccion  := TDetSeriesProduccion():New( cPath, Self )
   ::AddDetail( ::oDetSeriesProduccion )

   ::oDetMaterial       := TDetMaterial():New( cPath, Self )
   ::AddDetail( ::oDetMaterial )

   ::oDetSeriesMaterial := TDetSeriesMaterial():New( cPath, Self )
   ::AddDetail( ::oDetSeriesMaterial )

   ::oDetPersonal       := TDetPersonal():New( cPath, Self )
   ::AddDetail( ::oDetPersonal )

   ::oDetMaquina        := TDetMaquina():New( cPath, Self )
   ::AddDetail( ::oDetMaquina )

   ::oStock             := TStock():Create( cPatGrp() )

   ::bFirstKey          := {|| ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd }

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD Activate()

   local oImp
   local oPrv
   local oPdf

   if ::oWndParent != nil
      ::oWndParent:CloseAll()
   end if

   if !::OpenFiles()
      return nil
   end if

   DEFINE SHELL ::oWndBrw FROM 2, 10 TO 18, 70 ;
      XBROWSE ;
      TITLE    "Partes de producci�n" ;
      PROMPT   "N�mero",;
               "Fecha inicio",;
               "Operaci�n",;
               "Secci�n",;
               "Almac�n" ;
      MRU      "Worker2_Form_Red_16";
      BITMAP   clrTopProduccion ;
      ALIAS    ( ::oDbf ) ;
      APPEND   ::Append() ;
      EDIT     ::Edit() ;
      DELETE   ::Del() ;
      DUPLICAT ::Dup() ;
      OF       ::oWndParent

      // Columnas ---------------------------------------------------------------

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "N�mero"
         :cSortOrder       := "cNumOrd"
         :bEditValue       := {|| ::oDbf:cSerOrd + "/" + AllTrim( Str( ::oDbf:nNumOrd ) ) + "/" + ::oDbf:cSufOrd }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | ::oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "Fecha inicio"
         :cSortOrder       := "dFecOrd"
         :bEditValue       := {|| Dtoc( ::oDbf:dFecOrd ) + "-" + Trans( ::oDbf:cHorIni, "@R 99:99" ) }
         :nWidth           := 100
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | ::oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "Fecha fin"
         :bEditValue       := {|| Dtoc( ::oDbf:dFecFin ) + "-" + Trans( ::oDbf:cHorFin, "@R 99:99" ) }
         :nWidth           := 100
      end with

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "Operaci�n"
         :cSortOrder       := "cCodOpe"
         :bEditValue       := {|| ::oDbf:cCodOpe + " - " + oRetFld( ::oDbf:cCodOpe, ::oOperacion:oDbf ) }
         :nWidth           := 250
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | ::oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "Secci�n"
         :cSortOrder       := "cCodSec"
         :bEditValue       := {|| ::oDbf:cCodSec + " - " + oRetFld( ::oDbf:cCodSec, ::oSeccion:oDbf ) }
         :nWidth           := 250
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | ::oWndBrw:ClickOnHeader( oCol ) }
      end with

      with object ( ::oWndBrw:AddXCol() )
         :cHeader          := "Almac�n"
         :cSortOrder       := "cAlmOrd"
         :bEditValue       := {|| ::oDbf:cAlmOrd + " - " + oRetFld( ::oDbf:cAlmOrd, ::oAlm ) }
         :nWidth           := 250
         :bLClickHeader    := {| nMRow, nMCol, nFlags, oCol | ::oWndBrw:ClickOnHeader( oCol ) }
      end with

      ::oWndBrw:CreateXFromCode()

   DEFINE BTNSHELL RESOURCE "BUS" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::oWndBrw:SearchSetFocus() ) ;
      TOOLTIP  "(B)uscar" ;
      HOTKEY   "B";

      ::oWndBrw:AddSeaBar()

   DEFINE BTNSHELL RESOURCE "NEW" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::oWndBrw:RecAdd() );
      ON DROP  ( ::oWndBrw:RecAdd() );
      TOOLTIP  "(A)�adir";
      BEGIN GROUP ;
      HOTKEY   "A" ;
      LEVEL    ACC_APPD

   DEFINE BTNSHELL RESOURCE "NEW" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::RecSiguente( ::oWndBrw ) );
      TOOLTIP  "Si(g)uente";
      HOTKEY   "G";
      LEVEL    ACC_APPD

   DEFINE BTNSHELL RESOURCE "EDIT" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::oWndBrw:RecEdit() );
      TOOLTIP  "(M)odificar";
      HOTKEY   "M" ;
      LEVEL    ACC_EDIT

   DEFINE BTNSHELL RESOURCE "ZOOM" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::Zoom() );
      TOOLTIP  "(Z)oom";
      HOTKEY   "Z" ;
      LEVEL    ACC_ZOOM

   DEFINE BTNSHELL RESOURCE "DEL" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::oWndBrw:RecDel() );
      TOOLTIP  "(E)liminar";
      HOTKEY   "E";
      LEVEL    ACC_DELE

   DEFINE BTNSHELL oImp RESOURCE "IMP" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::nGenParte( IS_PRINTER ) ) ;
      TOOLTIP  "(I)mprimir";
      HOTKEY   "I";
      LEVEL    ACC_IMPR

      ::lGenParte( ::oWndBrw:oBrw, oImp, IS_PRINTER )

   DEFINE BTNSHELL RESOURCE "SERIE1" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::PrnSerie() ) ;
      TOOLTIP  "Imp(r)imir series";
      HOTKEY   "R";
      LEVEL    ACC_IMPR

   DEFINE BTNSHELL oPrv RESOURCE "PREV1" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::GenParte( IS_SCREEN ) ) ;
      TOOLTIP  "(P)revisualizar";
      HOTKEY   "P";
      LEVEL    ACC_IMPR

      ::lGenParte( ::oWndBrw:oBrw, oPrv, IS_SCREEN )

   DEFINE BTNSHELL oPdf RESOURCE "DOCLOCK" OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::GenParte( IS_PDF ) ) ;
      TOOLTIP  "Pd(f)";
      HOTKEY   "F";
      LEVEL    ACC_IMPR

      ::lGenParte( ::oWndBrw:oBrw, oPdf, IS_PDF )

   ::LoadFilter()

   DEFINE BTNSHELL RESOURCE "END" GROUP OF ::oWndBrw ;
      NOBORDER ;
      ACTION   ( ::oWndBrw:end() ) ;
      TOOLTIP  "(S)alir" ;
      HOTKEY   "S"

   if ::cHtmlHelp != nil
      ::oWndBrw:cHtmlHelp  := ::cHtmlHelp
   end if

   ACTIVATE WINDOW ::oWndBrw VALID ( ::CloseFiles() )

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD OpenFiles( lExclusive )

   local lOpen          := .t.
   local oError
   local oBlock

   DEFAULT  lExclusive  := .f.

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

   if Empty( ::oDbf )
      ::DefineFiles()
   end if

   ::oDbf:Activate( .f., !lExclusive )

   ::OpenDetails()

   DATABASE NEW ::oArt        PATH ( cPatArt() )   FILE "ARTICULO.DBF"  VIA ( cDriver() ) SHARED INDEX "ARTICULO.CDX"

   DATABASE NEW ::oAlm        PATH ( cPatAlm() )   FILE "ALMACEN.DBF"   VIA ( cDriver() ) SHARED INDEX "ALMACEN.CDX"

   DATABASE NEW ::oFam        PATH ( cPatArt() )   FILE "FAMILIAS.DBF"  VIA ( cDriver() ) SHARED INDEX "FAMILIAS.CDX"

   DATABASE NEW ::oAlbPrvT    PATH ( cPatEmp() )   FILE "ALBPROVT.DBF"  VIA ( cDriver() ) SHARED INDEX "ALBPROVT.CDX"
   DATABASE NEW ::oAlbPrvL    PATH ( cPatEmp() )   FILE "ALBPROVL.DBF"  VIA ( cDriver() ) SHARED INDEX "ALBPROVL.CDX"
   ::oAlbPrvL:OrdSetFocus( "cRef" )
   DATABASE NEW ::oAlbPrvS    PATH ( cPatEmp() )   FILE "ALBPRVS.DBF"   VIA ( cDriver() ) SHARED INDEX "ALBPRVS.CDX"

   DATABASE NEW ::oFacPrvT    PATH ( cPatEmp() )   FILE "FACPRVT.DBF"   VIA ( cDriver() ) SHARED INDEX "FACPRVT.CDX"
   DATABASE NEW ::oFacPrvL    PATH ( cPatEmp() )   FILE "FACPRVL.DBF"   VIA ( cDriver() ) SHARED INDEX "FACPRVL.CDX"
   ::oFacPrvL:OrdSetFocus( "cRef" )
   DATABASE NEW ::oFacPrvS    PATH ( cPatEmp() )   FILE "FacPrvS.DBF"   VIA ( cDriver() ) SHARED INDEX "FacPrvS.CDX"

   DATABASE NEW ::oRctPrvL    PATH ( cPatEmp() )   FILE "RctPrvL.DBF"   VIA ( cDriver() ) SHARED INDEX "RctPrvL.CDX"
   ::oRctPrvL:OrdSetFocus( "cRef" )
   DATABASE NEW ::oRctPrvS    PATH ( cPatEmp() )   FILE "RctPrvS.DBF"   VIA ( cDriver() ) SHARED INDEX "RctPrvS.CDX"

   DATABASE NEW ::oAlbCliT    PATH ( cPatEmp() )   FILE "AlbCliT.DBF"   VIA ( cDriver() ) SHARED INDEX "AlbCliT.CDX"
   DATABASE NEW ::oAlbCliL    PATH ( cPatEmp() )   FILE "AlbCliL.DBF"   VIA ( cDriver() ) SHARED INDEX "AlbCliL.CDX"
   DATABASE NEW ::oAlbCliS    PATH ( cPatEmp() )   FILE "AlbCliS.DBF"   VIA ( cDriver() ) SHARED INDEX "AlbCliS.CDX"

   DATABASE NEW ::oFacCliT    PATH ( cPatEmp() )   FILE "FacCliT.DBF"   VIA ( cDriver() ) SHARED INDEX "FacCliT.CDX"
   DATABASE NEW ::oFacCliL    PATH ( cPatEmp() )   FILE "FacCliL.DBF"   VIA ( cDriver() ) SHARED INDEX "FacCliL.CDX"
   DATABASE NEW ::oFacCliS    PATH ( cPatEmp() )   FILE "FacCliS.DBF"   VIA ( cDriver() ) SHARED INDEX "FacCliS.CDX"

   DATABASE NEW ::oFacRecT    PATH ( cPatEmp() )   FILE "FacRecT.DBF"   VIA ( cDriver() ) SHARED INDEX "FacRecT.CDX"
   DATABASE NEW ::oFacRecL    PATH ( cPatEmp() )   FILE "FacRecL.DBF"   VIA ( cDriver() ) SHARED INDEX "FacRecL.CDX"
   DATABASE NEW ::oFacRecS    PATH ( cPatEmp() )   FILE "FacRecS.DBF"   VIA ( cDriver() ) SHARED INDEX "FacRecS.CDX"

   DATABASE NEW ::oTikCliT    PATH ( cPatEmp() )   FILE "TikeT.DBF"     VIA ( cDriver() ) SHARED INDEX  "TikeT.CDX"
   DATABASE NEW ::oTikCliL    PATH ( cPatEmp() )   FILE "TikeL.DBF"     VIA ( cDriver() ) SHARED INDEX  "TikeL.CDX"
   DATABASE NEW ::oTikCliS    PATH ( cPatEmp() )   FILE "TikeS.DBF"     VIA ( cDriver() ) SHARED INDEX  "TikeS.CDX"

   DATABASE NEW ::oTblPro     PATH ( cPatArt() )   FILE "TblPro.DBF"    VIA ( cDriver() ) SHARED INDEX "TblPro.CDX"

   DATABASE NEW ::oPro        PATH ( cPatArt() )   FILE "Pro.DBF"       VIA ( cDriver() ) SHARED INDEX "Pro.CDX"

   DATABASE NEW ::oKitArt     PATH ( cPatArt() )   FILE "ARTKIT.DBF"    VIA ( cDriver() ) SHARED INDEX "ARTKIT.CDX"

   DATABASE NEW ::oDbfDoc     PATH ( cPatEmp() )   FILE "RDOCUMEN.DBF"  VIA ( cDriver() ) SHARED INDEX "RDOCUMEN.CDX"
   ::oDbfDoc:OrdSetFocus( "cTipo" )

   DATABASE NEW ::oDbfCount   PATH ( cPatEmp() )   FILE "NCOUNT.DBF"    VIA ( cDriver() ) SHARED INDEX "NCOUNT.CDX"

   DATABASE NEW ::oDbfEmp     PATH ( cPatDat() )   FILE "EMPRESA.DBF"   VIA ( cDriver() ) SHARED INDEX "EMPRESA.CDX"

   DATABASE NEW ::oDbfFilter  PATH ( cPatDat() )   FILE "CnfFlt.Dbf"    VIA ( cDriver() ) SHARED INDEX "CnfFlt.Cdx"

   DATABASE NEW ::oHisMov     PATH ( cPatEmp() )   FILE "HISMOV.DBF"    VIA ( cDriver() ) SHARED INDEX "HISMOV.CDX"

   if Empty( ::oDbfTemporal )
      ::DefineTemporal()
   end if

   ::oDbfTemporal:Activate( .f., .f. )

   if !::oDetHoras:OpenFiles()
      lOpen          := .f.
   end if

   if !::oOperario:OpenFiles()
      lOpen          := .f.
   end if

   if !::oSeccion:OpenFiles()
      lOpen          := .f.
   end if

   if !::oOperacion:OpenFiles()
      lOpen          := .f.
   end if

   if !::oMaquina:OpenFiles()
      lOpen          := .f.
   end if

   if !::oHoras:OpenFiles()
      lOpen          := .f.
   end if

   if !::oStock:lOpenFiles()
      lOpen          := .f.
   end if

   ::oStock:cAlbPrvL   := ::oAlbPrvL:cAlias
   ::oStock:cAlbPrvS   := ::oAlbPrvS:cAlias

   ::oStock:cFacPrvL   := ::oFacPrvL:cAlias
   ::oStock:cFacPrvS   := ::oFacPrvS:cAlias

   ::oStock:cRctPrvL   := ::oRctPrvL:cAlias
   ::oStock:cRctPrvS   := ::oRctPrvS:cAlias

   ::oStock:cAlbCliT   := ::oAlbCliT:cAlias
   ::oStock:cAlbCliL   := ::oAlbCliL:cAlias
   ::oStock:cAlbCliS   := ::oAlbCliS:cAlias

   ::oStock:cFacCliT   := ::oFacCliT:cAlias
   ::oStock:cFacCliL   := ::oFacCliL:cAlias
   ::oStock:cFacCliS   := ::oFacCliS:cAlias

   ::oStock:cFacRecT   := ::oFacRecT:cAlias
   ::oStock:cFacRecL   := ::oFacRecL:cAlias
   ::oStock:cFacRecS   := ::oFacRecS:cAlias

   ::oStock:cTikT      := ::oTikCliT:cAlias
   ::oStock:cTikL      := ::oTikCliL:cAlias
   ::oStock:cTikS      := ::oTikCliS:cAlias

   ::oStock:cHisMov    := ::oHisMov:cAlias

   ::oStock:cProducL   := ::oDetProduccion:oDbf:cAlias
   ::oStock:cProducM   := ::oDetMaterial:oDbf:cAlias
   ::oStock:cProducS   := ::oDetSeriesProduccion:oDbf:cAlias
   ::oStock:cProducP   := ::oDetSeriesMaterial:oDbf:cAlias

   RECOVER USING oError

      lOpen          := .f.

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !lOpen
      ::CloseFiles()
   end if

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD OpenService( lExclusive )

   local lOpen          := .t.
   local oError
   local oBlock

   DEFAULT lExclusive   := .f.

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      if Empty( ::oDbf )
         ::DefineFiles()
      end if

      ::oDbf:Activate( .f., !lExclusive )

      // ::OpenDetails()

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

      ::CloseService()

      lOpen             := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseService()

   if ::oDbf != nil .and. ::oDbf:Used()
      ::oDbf:End()
   end if

   ::oDbf   := nil

   ::CloseDetails()

RETURN ( .t. )

//---------------------------------------------------------------------------//

METHOD CloseFiles()

   if ::oDbf != nil .and. ::oDbf:Used()
      ::oDbf:End()
   end if

   ::CloseDetails()

   if ::oArt != nil .and. ::oArt:Used()
      ::oArt:End()
   end if

   if ::oAlm != nil .and. ::oAlm:Used()
      ::oAlm:End()
   end if

   if ::oAlbPrvT != nil .and. ::oAlbPrvT:Used()
      ::oAlbPrvT:End()
   end if

   if ::oAlbPrvL != nil .and. ::oAlbPrvL:Used()
      ::oAlbPrvL:End()
   end if

   if ::oAlbPrvS != nil .and. ::oAlbPrvS:Used()
      ::oAlbPrvS:End()
   end if

   if ::oFacPrvT != nil .and. ::oFacPrvT:Used()
      ::oFacPrvT:End()
   end if

   if ::oFacPrvL != nil .and. ::oFacPrvL:Used()
      ::oFacPrvL:End()
   end if

   if ::oFacPrvS != nil .and. ::oFacPrvS:Used()
      ::oFacPrvs:End()
   end if

   if ::oRctPrvL != nil .and. ::oRctPrvL:Used()
      ::oRctPrvL:End()
   end if

   if ::oRctPrvS != nil .and. ::oRctPrvS:Used()
      ::oRctPrvS:End()
   end if

   if ::oAlbCliT != nil .and. ::oAlbCliT:Used()
      ::oAlbCliT:End()
   end if

   if ::oAlbCliL != nil .and. ::oAlbCliL:Used()
      ::oAlbCliL:End()
   end if

   if ::oAlbCliS != nil .and. ::oAlbCliS:Used()
      ::oAlbCliS:End()
   end if

   if ::oFacCliT != nil .and. ::oFacCliT:Used()
      ::oFacCliT:End()
   end if

   if ::oFacCliL != nil .and. ::oFacCliL:Used()
      ::oFacCliL:End()
   end if

   if ::oFacCliS != nil .and. ::oFacCliS:Used()
      ::oFacClis:End()
   end if

   if ::oFacRecT != nil .and. ::oFacRecT:Used()
      ::oFacRecT:End()
   end if

   if ::oFacRecL != nil .and. ::oFacRecL:Used()
      ::oFacRecL:End()
   end if

   if ::oFacRecS != nil .and. ::oFacRecS:Used()
      ::oFacRecs:End()
   end if

   if ::oTikCliT != nil .and. ::oTikCliT:Used()
      ::oTikCliT:End()
   end if

   if ::oTikCliL != nil .and. ::oTikCliL:Used()
      ::oTikCliL:End()
   end if

   if ::oTikCliS != nil .and. ::oTikCliS:Used()
      ::oTikClis:End()
   end if

   if ::oFam != nil .and. ::oFam:Used()
      ::oFam:End()
   end if

   if ::oTblPro != nil .and. ::oTblPro:Used()
      ::oTblPro:End()
   end if

   if ::oPro != nil .and. ::oPro:Used()
      ::oPro:End()
   end if

   if ::oKitArt != nil .and. ::oKitArt:Used()
      ::oKitArt:End()
   end if

   if ::oDbfDoc != nil .and. ::oDbfDoc:Used()
      ::oDbfDoc:End()
   end if

   if ::oDbfCount != nil .and. ::oDbfCount:Used()
      ::oDbfCount:End()
   end if

   if ::oDbfEmp != nil .and. ::oDbfEmp:Used()
      ::oDbfEmp:End()
   end if

   if ::oHisMov != nil .and. ::oHisMov:Used()
      ::oHisMov:End()
   end if

   if ::oDetHoras != nil
      ::oDetHoras:End()
      ::oDetHoras    := nil
   end if

   if ::oDetPersonal != nil
      ::oDetPersonal:End()
      ::oDetPersonal := nil
   end if

   if ::oOperario != nil
      ::oOperario:End()
      ::oOperario    := nil
   end if

   if ::oSeccion != nil
      ::oSeccion:End()
      ::oSeccion     := nil
   end if

   if ::oOperacion != nil
      ::oOperacion:End()
      ::oOperacion   := nil
   end if

   if ::oMaquina != nil
      ::oMaquina:End()
      ::oMaquina     := nil
   end if

   if ::oHoras != nil
      ::oHoras:End()
      ::oHoras       := nil
   end if

   if !Empty( ::oStock )
      ::oStock:end()
      ::oStock       := nil
   end if

   if !Empty( ::oDbfDiv ) .and. ::oDbfDiv:Used()
      ::oDbfDiv:End()
   end if

   if ::oDbfFilter != nil .and. ::oDbfFilter:Used()
      ::oDbfFilter:End()
      ::oDbfFilter   := nil
   end if

   ::DestroyTemporal()

   ::oDbfDiv   := nil

   ::oFam      := nil
   ::oTblPro   := nil
   ::oPro      := nil
   ::oKitArt   := nil
   ::oDbfDoc   := nil
   ::oDbfCount := nil
   ::oDbfEmp   := nil
   ::oHisMov   := nil

RETURN ( .t. )

//----------------------------------------------------------------------------//

METHOD DefineFiles( cPath, cDriver )

   DEFAULT cPath        := ::cPath
   DEFAULT cDriver      := cDriver()

   DEFINE DATABASE ::oDbf FILE "ProCab.Dbf" CLASS "ProCab" ALIAS "ProCab" PATH ( cPath ) VIA ( cDriver ) COMMENT "Partes de producci�n"

      FIELD NAME "cSerOrd" TYPE "C" LEN 01  DEC 0 COMMENT "Serie"             OF ::oDbf
      FIELD NAME "nNumOrd" TYPE "N" LEN 09  DEC 0 COMMENT "N�mero"            OF ::oDbf
      FIELD NAME "cSufOrd" TYPE "C" LEN 02  DEC 0 COMMENT "Sufijo"            OF ::oDbf
      FIELD NAME "dFecOrd" TYPE "D" LEN 08  DEC 0 COMMENT "Fecha inicio"      OF ::oDbf
      FIELD NAME "dFecFin" TYPE "D" LEN 08  DEC 0 COMMENT "Fecha fin"         OF ::oDbf
      FIELD NAME "cCodDiv" TYPE "C" LEN 03  DEC 0 COMMENT "Divisa"            OF ::oDbf
      FIELD NAME "nVdvDiv" TYPE "N" LEN 16  DEC 6 COMMENT "Valor divisa"      OF ::oDbf
      FIELD NAME "cAlmOrd" TYPE "C" LEN 03  DEC 0 COMMENT "Almac�n destino"   OF ::oDbf
      FIELD NAME "cCodSec" TYPE "C" LEN 03  DEC 0 COMMENT "Secci�n"           OF ::oDbf
      FIELD NAME "cHorIni" TYPE "C" LEN 05  DEC 0 COMMENT "Hora de inicio" PICTURE "@R 99:99"   OF ::oDbf
      FIELD NAME "cHorFin" TYPE "C" LEN 05  DEC 0 COMMENT "Hora de fin"    PICTURE "@R 99:99"   OF ::oDbf
      FIELD NAME "cCodOpe" TYPE "C" LEN 03  DEC 0 COMMENT "Operaci�n"         OF ::oDbf
      FIELD NAME "cAlmOrg" TYPE "C" LEN 03  DEC 0 COMMENT "Almacen Origen"    OF ::oDbf

      INDEX TO "ProCab.Cdx" TAG "cNumOrd" ON "cSerOrd + Str( nNumOrd, 9 ) + cSufOrd"   COMMENT "N�mero"        NODELETED OF ::oDbf
      INDEX TO "ProCab.Cdx" TAG "dFecOrd" ON "dFecOrd"                                 COMMENT "Fecha inicio"  NODELETED OF ::oDbf
      INDEX TO "ProCab.Cdx" TAG "cCodOpe" ON "cCodOpe"                                 COMMENT "Operaci�n"     NODELETED OF ::oDbf
      INDEX TO "ProCab.Cdx" TAG "cCodSec" ON "cCodSec"                                 COMMENT "Secci�n"       NODELETED OF ::oDbf
      INDEX TO "ProCab.Cdx" TAG "cAlmOrd" ON "cAlmOrd"                                 COMMENT "Almac�n"       NODELETED OF ::oDbf

   END DATABASE ::oDbf

RETURN ( ::oDbf )

//---------------------------------------------------------------------------//

METHOD Resource( nMode, aDatosAnterior )

   local oFld
   local oDlg
   local oBrwMat
   local oBrwMatPri
   local oBrwPer
   local oBrwMaq
   local oGetSer
   local oGetAlm
   local oSayAlm
   local cSayAlm
   local oGetSec
   local oSaySec
   local cSaySec
   local oFntTot              := TFont():New( "Arial", 8, 26, .F., .T. )
   local oHorIni
   local oHorFin
   local oTmpEmp
   local oFecIni
   local oFecFin
   local oGetOpe
   local oSayOpe
   local cSayOpe
   local oAlmOrg
   local oSayOrg
   local cSayOrg
   local oBmpGeneral

   if nMode == APPD_MODE

      if !Empty( cDefSer() )
         ::oDbf:cSerOrd       := cDefSer()
      else
         ::oDbf:cSerOrd       := "A"
      end if

      ::oDbf:cAlmOrd       := oUser():cAlmacen()
      ::oDbf:cCodDiv       := cDivEmp()
      ::oDbf:nVdvDiv       := nChgDiv( cDivEmp() )

      if aDatosAnterior != nil
         ::oDbf:dFecOrd    := aDatosAnterior[2]
         ::oDbf:dFecFin    := aDatosAnterior[2]
         ::oDbf:cHorIni    := aDatosAnterior[3]
         ::oDbf:cHorFin    := aDatosAnterior[3]
         ::oDbf:cCodSec    := aDatosAnterior[4]
         ::CargaPersonalAnterior( aDatosAnterior )
      else
         ::oDbf:dFecOrd    := GetSysDate()
         ::oDbf:dFecFin    := GetSysDate()
         ::oDbf:cHorIni    := uFieldEmpresa( "cIniJornada" )
         ::oDbf:cHorFin    := SubStr( Time(), 1, 2 ) + SubStr( Time(), 4, 2 )
      end if


   end if

   ::cOldCodSec            := ::oDbf:cCodSec
   ::cOldCodOpe            := ::oDbf:cCodOpe
   ::dOldFecIni            := ::oDbf:dFecOrd
   ::dOldFecFin            := ::oDbf:dFecFin
   ::cOldHorIni            := ::oDbf:cHorIni
   ::cOldHorFin            := ::oDbf:cHorFin

   ::lTiempoEmpleado()

   ::lLoadDivisa( ::oDbf:cCodDiv )

   cSayOrg                 := RetAlmacen( ::oDbf:cAlmOrg, ::oAlm )
   cSayAlm                 := RetAlmacen( ::oDbf:cAlmOrd, ::oAlm )
   cSaySec                 := oRetFld( ::oDbf:cCodSec, ::oSeccion:oDbf )
   cSayOpe                 := oRetFld( ::oDbf:cCodOpe, ::oOperacion:oDbf )

   DEFINE DIALOG oDlg RESOURCE "Produccion" TITLE LblTitle( nMode ) + "parte de producci�n"

      REDEFINE FOLDER oFld;
         ID       400 ;
			OF 		oDlg ;
         PROMPT   "&Producci�n", "&Materias primas", "P&ersonal", "Maquinaria" ;
         DIALOGS  "Produccion_1", "Produccion_2", "Produccion_3", "Produccion_4"

      /*
      Operaciones--------------------------------------------------------------
      */

      REDEFINE GET oGetOpe VAR ::oDbf:cCodOpe ;
         ID       210 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
			OF 		oFld:aDialogs[1]

         oGetOpe:bHelp     := {|| ::oOperacion:Buscar( oGetOpe ), ::lRecargaPersonal( , oGetOpe, , , , , oBrwPer, oBrwMaq ) }
         oGetOpe:bValid    := {|| ::oOperacion:Existe( oGetOpe, oSayOpe, "cDesOpe", .t., .t., "0" ), ::lRecargaPersonal( , oGetOpe, , , , , oBrwPer, oBrwMaq ) }

      REDEFINE GET oSayOpe VAR cSayOpe ;
         ID       220 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      /*
      C�digo de almac�n origen-------------------------------------------------
      */

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "partes_producion_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[1]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "cube_yellow_alpha_48" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[2]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "worker_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[3]

      REDEFINE BITMAP oBmpGeneral ;
        ID       990 ;
        RESOURCE "robot_48_alpha" ;
        TRANSPARENT ;
        OF       oFld:aDialogs[4]

      REDEFINE GET oAlmOrg VAR ::oDbf:cAlmOrg ;
         ID       230 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cAlmacen( oAlmOrg, ::oAlm, oSayOrg ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( oAlmOrg, oSayOrg ) ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSayOrg VAR cSayOrg ;
         ID       231 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      /*
      C�digo de almac�n destino------------------------------------------------
      */

      REDEFINE GET oGetAlm VAR ::oDbf:cAlmOrd ;
         ID       150 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         VALID    ( cAlmacen( oGetAlm, ::oAlm, oSayAlm ) ) ;
         BITMAP   "LUPA" ;
         ON HELP  ( BrwAlmacen( oGetAlm, oSayAlm ) ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET oSayAlm VAR cSayAlm ;
         ID       151 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      /*
      C�digo de la secci�n-----------------------------------------------------
      */

      REDEFINE GET oGetSec VAR ::oDbf:cCodSec ;
         ID       160 ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         BITMAP   "LUPA" ;
			OF 		oFld:aDialogs[1]

         oGetSec:bHelp     := {|| ::oSeccion:Buscar( oGetSec ), ::lRecargaPersonal( oGetSec, , , , , , oBrwPer, oBrwMaq ) }
         oGetSec:bValid    := {|| ::oSeccion:Existe( oGetSec, oSaySec, "cDesSec", .t., .t., "0" ), ::lRecargaPersonal( oGetSec, , , , , , oBrwPer, oBrwMaq ) }

      REDEFINE GET oSaySec VAR cSaySec ;
         ID       161 ;
         WHEN     .f. ;
         OF       oFld:aDialogs[1]

      /*
      Divisas------------------------------------------------------------------
      */

      ::oDefDiv( 140, 141, 142, oFld:aDialogs[1], nMode )

      /*
      Serie numero y sufijo del documento--------------------------------------
      */

      REDEFINE GET oGetSer VAR ::oDbf:cSerOrd ;
         ID       100 ;
         PICTURE  "@!" ;
         SPINNER ;
         ON UP    ( UpSerie( oGetSer ) );
         ON DOWN  ( DwSerie( oGetSer ) );
         WHEN     ( nMode == APPD_MODE .or. nMode == DUPL_MODE );
         VALID    ( ::oDbf:cSerOrd >= "A" .and. ::oDbf:cSerOrd <= "Z" ) ;
			OF 		oFld:aDialogs[1]

      REDEFINE GET ::oDbf:nNumOrd ;
			ID 		110 ;
			PICTURE 	"999999999" ;
         WHEN     ( .f. );
			OF 		oFld:aDialogs[1]

      REDEFINE GET ::oDbf:cSufOrd ;
         ID       120 ;
         PICTURE  "@!" ;
         WHEN     ( .f. );
			OF 		oFld:aDialogs[1]

      /*
      Fecha y horas del documento----------------------------------------------
      */

      REDEFINE GET oFecIni VAR ::oDbf:dFecOrd ;
			ID 		130 ;
			SPINNER ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      oFecIni:bValid    := {|| ::lTiempoEmpleado( oTmpEmp ), ::lRecargaPersonal( , , oFecIni, , , , oBrwPer, oBrwMaq ) }
      oFecIni:bChange   := {|| ::lTiempoEmpleado( oTmpEmp ) }

      REDEFINE GET oFecFin VAR ::oDbf:dFecFin ;
         ID       131 ;
			SPINNER ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         OF       oFld:aDialogs[1]

      oFecFin:bValid    := {|| ::lTiempoEmpleado( oTmpEmp ), ::lRecargaPersonal( , , , oFecFin, , , oBrwPer, oBrwMaq ) }
      oFecFin:bChange   := {|| ::lTiempoEmpleado( oTmpEmp ) }

      /*
      Hora inicio, hora fin, tiempo empleado-----------------------------------
      */

      REDEFINE GET oHorIni ;
         VAR      ::oDbf:cHorIni ;
         PICTURE  "@R 99:99" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         SPINNER ;
         ON UP    ( UpTime( oHorIni ) );
         ON DOWN  ( DwTime( oHorIni ) );
         ID       170 ;
         OF       oFld:aDialogs[1]

         oHorIni:bValid    := {|| if( ValidTime( oHorIni ), ::lTiempoEmpleado( oTmpEmp ), .f. ), ::lRecargaPersonal( , , , , oHorIni, , oBrwPer, oBrwMaq ) }
         oHorIni:bChange   := {|| ::lTiempoEmpleado( oTmpEmp ) }

      REDEFINE GET oHorFin ;
         VAR      ::oDbf:cHorFin ;
         PICTURE  "@R 99:99" ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         SPINNER ;
         ON UP    ( UpTime( oHorFin ) );
         ON DOWN  ( DwTime( oHorFin ) );
         ID       180 ;
         OF       oFld:aDialogs[1]

         oHorFin:bValid    := {|| if( ValidTime( oHorFin ), ::lTiempoEmpleado( oTmpEmp ), .f. ), ::lRecargaPersonal( , , , , , oHorFin , oBrwPer, oBrwMaq ) }
         oHorFin:bChange   := {|| ::lTiempoEmpleado( oTmpEmp ) }

      REDEFINE GET oTmpEmp ;
         VAR      ::cTmpEmp ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ID       190 ;
         OF       oFld:aDialogs[1]

      /*
      Material producido-------------------------------------------------------
      */

		REDEFINE BUTTON ;
			ID 		500 ;
         OF       oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetProduccion:Append( oBrwMat ), ::oTotProducido:Refresh(), oBrwMat:Refresh(), oBrwMatPri:Refresh() )

		REDEFINE BUTTON ;
			ID 		501 ;
         OF       oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetProduccion:Edit( oBrwMat ), ::oTotProducido:Refresh(), oBrwMat:Refresh(), oBrwMatPri:Refresh() )

		REDEFINE BUTTON ;
			ID 		502 ;
         OF       oFld:aDialogs[1] ;
         ACTION   ( ::oDetProduccion:Zoom(), oBrwMat:Refresh(), oBrwMatPri:Refresh() )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       oFld:aDialogs[1] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetProduccion:Del( oBrwMat, oBrwMatPri ) )

      /*
      Browse de materiales-----------------------------------------------------
      */

      oBrwMat                 := IXBrowse():New( oFld:aDialogs[1] )

      oBrwMat:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwMat:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwMat:SetoDbf( ::oDetProduccion:oDbfVir )

      oBrwMat:nMarqueeStyle   := 6
      oBrwMat:cName           := "Lineas de partes de producci�n"

      with object ( oBrwMat:AddCol() )
         :cHeader          := "N�mero"
         :bStrData         := {|| Trans( ::oDetProduccion:oDbfVir:nNumLin, "9999" ) }
         :nWidth           := 60
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "C�digo"
         :bStrData         := {|| ::oDetProduccion:oDbfVir:cCodArt }
         :nWidth           := 80
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "Nombre"
         :bStrData         := {|| ::oDetProduccion:oDbfVir:cNomArt }
         :nWidth           := 400
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "Almac�n"
         :bStrData         := {|| ::oDetProduccion:oDbfVir:cAlmOrd }
         :nWidth           := 55
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "Total unidades"
         :bStrData         := {|| ::oDetProduccion:cTotUnidades( ::oDetProduccion:oDbfVir ) }
         :nWidth           := 82
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "Precio"
         :bStrData         := {|| Trans( ::oDetProduccion:oDbfVir:nImpOrd, ::cPouDiv ) }
         :nWidth           := 85
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMat:AddCol() )
         :cHeader          := "Total"
         :bStrData         := {|| ::oDetProduccion:cTotPrecio( ::oDetProduccion:oDbfVir ) }
         :nWidth           := 85
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      oBrwMat:CreateFromResource( 200 )

      if nMode != ZOOM_MODE
         oBrwMat:bLDblClick   := {|| ::oDetProduccion:Edit( oBrwMat ), ::oTotProducido:Refresh(), oBrwMat:Refresh(), oBrwMatPri:Refresh() }
      else
         oBrwMat:bLDblClick   := {|| ::oDetProduccion:Zoom(), oBrwMat:Refresh(), oBrwMatPri:Refresh() }
      end if

      /*
      Materias Primas----------------------------------------------------------
      */

      REDEFINE BUTTON ;
			ID 		500 ;
         OF       oFld:aDialogs[2] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaterial:Append( oBrwMatPri ), ::oTotMaterias:Refresh(), oBrwMatPri:Refresh() )

		REDEFINE BUTTON ;
			ID 		501 ;
         OF       oFld:aDialogs[2] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaterial:Edit( oBrwMatPri ), ::oTotMaterias:Refresh(), oBrwMatPri:Refresh() )

		REDEFINE BUTTON ;
			ID 		502 ;
         OF       oFld:aDialogs[2] ;
         ACTION   ( ::oDetMaterial:Zoom(), oBrwMatPri:Refresh() )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       oFld:aDialogs[2] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaterial:Del( oBrwMatPri ), ::oTotMaterias:Refresh(), oBrwMatPri:Refresh() )

      oBrwMatPri                 := IXBrowse():New( oFld:aDialogs[ 2 ] )

      oBrwMatPri:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwMatPri:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwMatPri:SetoDbf( ::oDetMaterial:oDbfVir )

      oBrwMatPri:nMarqueeStyle   := 6
      oBrwMatPri:cName           := "Materias primas produccion"

      oBrwMatPri:bLDblClick      := { || ::oDetMaterial:Edit( oBrwMatPri ), ::oTotMaterias:Refresh() }

      oBrwMatPri:CreateFromResource( 200 )

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "N�mero"
         :bStrData         := {|| Trans( ::oDetMaterial:oDbfVir:FieldGetByName( "nNumLin" ), "9999" ) }
         :nWidth           := 60
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "C�digo"
         :bStrData         := {|| ::oDetMaterial:oDbfVir:FieldGetByName( "cCodArt" ) }
         :nWidth           := 85
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "Nombre"
         :bStrData         := {|| ::oDetMaterial:oDbfVir:FieldGetByName( "cNomArt" ) }
         :nWidth           := 395
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "Almac�n"
         :bStrData         := {|| ::oDetMaterial:oDbfVir:FieldGetByName( "cAlmOrd" ) }
         :nWidth           := 60
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "Total unidades"
         :bStrData         := {|| ::oDetMaterial:cTotUnidades( ::oDetMaterial:oDbfVir ) }
         :nWidth           := 80
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "Precio"
         :bStrData         := {|| Trans( ::oDetMaterial:oDbfVir:nImpOrd, ::cPouDiv ) }
         :nWidth           := 85
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      with object ( oBrwMatPri:AddCol() )
         :cHeader          := "Total"
         :bStrData         := {|| ::oDetMaterial:cTotPrecio( ::oDetMaterial:oDbfVir ) }
         :nWidth           := 85
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      /*
      Personal-----------------------------------------------------------------
      */

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oFld:aDialogs[3] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetPersonal:Append( oBrwPer ), ::oTotPersonal:Refresh(), oBrwPer:Refresh() )

		REDEFINE BUTTON ;
         ID       501 ;
         OF       oFld:aDialogs[3] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetPersonal:Edit( oBrwPer ), ::oTotPersonal:Refresh(), oBrwPer:Refresh() )

		REDEFINE BUTTON ;
         ID       502 ;
         OF       oFld:aDialogs[3] ;
         ACTION   ( ::oDetPersonal:Zoom(), oBrwPer:Refresh() )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       oFld:aDialogs[3] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetPersonal:Del( oBrwPer ), ::oTotPersonal:Refresh(), oBrwPer:Refresh() )

      oBrwPer                 := TXBrowse():New( oFld:aDialogs[3] )

      oBrwPer:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwPer:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwPer:SetoDbf( ::oDetPersonal:oDbfVir )

      oBrwPer:nMarqueeStyle   := 5

      oBrwPer:bLDblClick      := { || ::oDetPersonal:Edit( oBrwPer ), ::oTotPersonal:Refresh() }

      oBrwPer:CreateFromResource( 200 )

      with object ( oBrwPer:AddCol() )
         :cHeader          := "Personal"
         :bStrData         := {|| Rtrim( ::oDetPersonal:oDbfVir:cCodTra ) + " - " + oRetFld( ::oDetPersonal:oDbfVir:cCodTra, ::oOperario:oDbf ) }
         :nWidth           := 325
      end with

      with object ( oBrwPer:AddCol() )
         :cHeader          := "Operaci�n"
         :bStrData         := {|| ::oDetPersonal:oDbfVir:cCodOpe + " - " + oRetFld( ::oDetPersonal:oDbfVir:cCodOpe, ::oOperacion:oDbf ) }
         :nWidth           := 325
      end with

      with object ( oBrwPer:AddCol() )
         :cHeader          := "Tiempo empleado"
         :bStrData         := {|| cTiempo( ::oDetPersonal:oDbfVir:dFecIni, ::oDetPersonal:oDbfVir:dFecFin, ::oDetPersonal:oDbfVir:cHorIni, ::oDetPersonal:oDbfVir:cHorFin ) }
         :nWidth           := 110
      end with

      with object ( oBrwPer:AddCol() )
         :cHeader          := "Total"
         :bStrData         := {|| ::oDetPersonal:cTotal( ::oDetPersonal:oDbfVir:cCodTra, ::oDetHorasPersonal:oDbfVir ) }
         :nWidth           := 90
         :nDataStrAlign    := AL_RIGHT
         :nHeadStrAlign    := AL_RIGHT
      end with

      /*
      Maquinaria---------------------------------------------------------------
      */

      REDEFINE BUTTON ;
         ID       500 ;
         OF       oFld:aDialogs[4] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaquina:Append( oBrwMaq ), ::oTotMaquinaria:Refresh(), oBrwMaq:Refresh() )

      REDEFINE BUTTON ;
         ID       501 ;
         OF       oFld:aDialogs[4] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaquina:Edit( oBrwMaq ), ::oTotMaquinaria:Refresh(), oBrwMaq:Refresh() )

      REDEFINE BUTTON ;
         ID       502 ;
         OF       oFld:aDialogs[4] ;
         ACTION   ( ::oDetMaquina:Zoom() )

      REDEFINE BUTTON ;
         ID       503 ;
         OF       oFld:aDialogs[4] ;
         WHEN     ( nMode != ZOOM_MODE ) ;
         ACTION   ( ::oDetMaquina:Del( oBrwMaq ), ::oTotMaquinaria:Refresh() )

      oBrwMaq                 := TXBrowse():New( oFld:aDialogs[4] )

      oBrwMaq:bClrSel         := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
      oBrwMaq:bClrSelFocus    := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

      oBrwMaq:SetoDbf( ::oDetMaquina:oDbfVir )

      oBrwMaq:nMarqueeStyle   := 5

      oBrwMaq:bLDblClick      := { || ::oDetMaquina:Edit( oBrwPer ), ::oTotMaquinaria:Refresh() }

      oBrwMaq:CreateFromResource( 200 )

      with object ( oBrwMaq:AddCol() )
         :cHeader             := "Maquina"
         :bStrData            := {|| Rtrim( ::oDetMaquina:oDbfVir:cCodMaq ) + " - " + oRetFld( ::oDetMaquina:oDbfVir:cCodMaq, ::oMaquina:oDbf ) }
         :nWidth              := 645
      end with

      with object ( oBrwMaq:AddCol() )
         :cHeader             := "Tiempo empleado"
         :bStrData            := {|| cTiempo( ::oDetMaquina:oDbfVir:dFecIni, ::oDetMaquina:oDbfVir:dFecFin, ::oDetMaquina:oDbfVir:cIniMaq, ::oDetMaquina:oDbfVir:cFinMaq ) }
         :nWidth              := 120
      end with

      with object ( oBrwMaq:AddCol() )
         :cHeader             := "Total"
         :bStrData            := {|| Trans( ::oDetMaquina:nTotCosto( ::oDetMaquina:oDbfVir ), ::cPorDiv ) }
         :nWidth              := 90
         :nDataStrAlign       := AL_RIGHT
         :nHeadStrAlign       := AL_RIGHT
      end with

      /*
      Totales------------------------------------------------------------------
      */

      REDEFINE SAY ::oTotProducido  PROMPT ::oDetProduccion:cTotal( ::oDetProduccion:oDbfVir )                              ID 810 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY ::oTotMaterias   PROMPT ::oDetMaterial:cTotal( ::oDetMaterial:oDbfVir )                                  ID 811 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY ::oTotPersonal   PROMPT ::oDetPersonal:nTotalTra( ::oDetPersonal:oDbfVir, ::oDetHorasPersonal:oDbfVir )  ID 812 OF oFld:aDialogs[ 1 ]
      REDEFINE SAY ::oTotMaquinaria PROMPT ::oDetMaquina:nTotal( ::oDetMaquina:oDbfVir )                                    ID 813 OF oFld:aDialogs[ 1 ]

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
			WHEN 		( nMode != ZOOM_MODE ) ;
         ACTION   ( ::lPreSave( oGetAlm, oGetSec, oGetOpe, oHorFin, nMode, oDlg ) )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
         ACTION   ( oDlg:end() )

      REDEFINE BUTTON ;
         ID       559 ;
			OF 		oDlg ;
         ACTION   ( MsgInfo( "Ayuda no definida", "Perdonen las molestias") )

      if nMode != ZOOM_MODE
      oFld:aDialogs[1]:AddFastKey( VK_F2, {|| ::oDetProduccion:Append( oBrwMat ), ::oTotProducido:Refresh() } )
      oFld:aDialogs[1]:AddFastKey( VK_F3, {|| ::oDetProduccion:Edit( oBrwMat ), ::oTotProducido:Refresh() } )
      oFld:aDialogs[1]:AddFastKey( VK_F4, {|| ::oDetProduccion:Del( oBrwMat, oBrwMatPri ) } )
      oFld:aDialogs[2]:AddFastKey( VK_F2, {|| ::oDetMaterial:Append( oBrwMatPri ), ::oTotMaterias:Refresh() } )
      oFld:aDialogs[2]:AddFastKey( VK_F3, {|| ::oDetMaterial:Edit( oBrwMatPri ), ::oTotMaterias:Refresh() } )
      oFld:aDialogs[2]:AddFastKey( VK_F4, {|| ::oDetMaterial:Del( oBrwMatPri ), ::oTotMaterias:Refresh() } )
      oFld:aDialogs[3]:AddFastKey( VK_F2, {|| ::oDetPersonal:Append( oBrwPer ), ::oTotPersonal:Refresh() } )
      oFld:aDialogs[3]:AddFastKey( VK_F3, {|| ::oDetPersonal:Edit( oBrwPer ), ::oTotPersonal:Refresh() } )
      oFld:aDialogs[3]:AddFastKey( VK_F4, {|| ::oDetPersonal:Del( oBrwPer ), ::oTotPersonal:Refresh() } )
      oFld:aDialogs[4]:AddFastKey( VK_F2, {|| ::oDetMaquina:Append( oBrwMaq ), ::oTotMaquinaria:Refresh() } )
      oFld:aDialogs[4]:AddFastKey( VK_F3, {|| ::oDetMaquina:Edit( oBrwMaq ), ::oTotMaquinaria:Refresh() } )
      oFld:aDialogs[4]:AddFastKey( VK_F4, {|| ::oDetMaquina:Del( oBrwMaq ), ::oTotMaquinaria:Refresh() } )
      oDlg:AddFastKey( VK_F5, {|| ::lPreSave( oGetAlm, oGetSec, oGetOpe, oHorFin, nMode, oDlg ) } )
      end if

      oDlg:bStart := { || oBrwMat:Load(), oBrwMatPri:Load(), oFecIni:SetFocus() }

   ACTIVATE DIALOG oDlg CENTER

   oFntTot:End()
   oBmpGeneral:End()

   oBrwMat:CloseData()
   oBrwMatPri:CloseData()

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

METHOD lPreSave( oGetAlm, oGetSec, oGetOpe, oHorFin, nMode, oDlg )

   if Empty( ::oDbf:cAlmOrd )
      MsgStop( "Tiene que seleccionar un almac�n." )
      oGetAlm:SetFocus()
      Return nil
   end if

   if Empty( ::oDbf:cCodSec )
      MsgStop( "Tiene que seleccionar una secci�n." )
      oGetSec:SetFocus()
      Return nil
   end if

   if Empty( ::oDbf:cCodOpe )
      MsgStop( "Tiene que seleccionar una operaci�n." )
      oGetOpe:SetFocus()
      Return nil
   end if

   if ::oDbf:dFecFin < ::oDbf:dFecOrd
      MsgStop( "La fecha de fin no puede ser menor que la fecha de inicio." )
      oHorFin:SetFocus()
      Return nil
   end if

   oDlg:End( IDOK )

Return ( .t. )

//--------------------------------------------------------------------------//

METHOD LoaArticulo( oGetArticulo, oGetNombre )

   local cCodArt  := oGetArticulo:VarGet()

   if Empty( cCodArt )

      if lRetCodArt()
         MsgStop( "No se pueden a�adir lineas sin codificar" )
         return .f.
      end if

      return .t.

   else

      /*
      Primero buscamos por codigos de barra
      */

      ::oArt:ordSetFocus( "CodeBar" )

      if ::oArt:Seek( cCodArt )
         cCodArt  := ::oArt:Codigo
      end if

      ::oArt:ordSetFocus( "Codigo" )

      /*
      Ahora buscamos por el codigo interno
      */

      if ::oArt:Seek( cCodArt ) .or. ::oArt:Seek( Upper( cCodArt ) )

         cCodArt  := ::oArt:Codigo

         oGetNombre:cText( ::oArt:Nombre )

         if ::oArt:nCajEnt != 0
            ::oDbf:nCajArt := ::oArt:nCajEnt
         end if

         if ::oArt:nUniCaja != 0
            ::oDbf:nUndArt := ::oArt:nUniCaja
         end if

         return .t.

      else

         MsgStop( "Art�culo no encontrado" )
         return .f.

      end if

   end if

RETURN .t.

//--------------------------------------------------------------------------//

METHOD GetNewCount()

   ::oDbf:nNumOrd    := nNewDoc( ::oDbf:cSerOrd, ::oDbf:nArea, "nParPrd" )

RETURN ( .t. )

//---------------------------------------------------------------------------//

METHOD lTiempoEmpleado( oTmpEmp )

   ::cTiempoEmpleado    := nTiempoEntreFechas( ::oDbf:dFecOrd, ::oDbf:dFecFin, ::oDbf:cHorIni, ::oDbf:cHorFin )
   ::cTmpEmp            := cFormatoDDHHMM( ::cTiempoEmpleado )

   if oTmpEmp != nil
      oTmpEmp:cText( ::cTmpEmp )
      oTmpEmp:Refresh()
   end if

RETURN .t.

//---------------------------------------------------------------------------//

METHOD lRecargaPersonal( oCodSec, oCodOpe, oFecIni, oFecFin, oHorIni, oHorFin, oBrwPer, oBrwMaq )

   local nOrdAnt     := ::oOperario:oDbf:OrdSetFocus( "cCodSec" )
   local nOrdAntHora := ::oDetHoras:oDbf:OrdSetFocus( "cCodTra" )
   local nOrdAntMaq  := ::oMaquina:oDbf:OrdSetFocus( "cCodSec" )
   local cCodSec     := ""
   local cCodOpe     := ""
   local dFecIni     := Ctod( "" )
   local dFecFin     := Ctod( "" )
   local cHorIni     := ""
   local cHorFin     := ""

   /*
   Comprobamos el valor que nos han cambiado y tomamos su nuevo valor
   */

   if oCodSec != nil
      cCodSec        := oCodSec:VarGet()
   end if

   if oCodOpe != nil
      cCodOpe        := oCodOpe:VarGet()
   end if

   if oFecIni != nil
      dFecIni        := oFecIni:VarGet()
   end if

   if oFecFin != nil
      dFecFin        := oFecFin:VarGet()
   end if

   if oHorIni != nil
      cHorIni        := oHorIni:VarGet()
   end if

   if oHorFin != nil
      cHorFin        := oHorFin:VarGet()
   end if

   /*Cambios en la seccion*/

   if !Empty( cCodSec ) .and. ::cOldCodSec != cCodSec

      /*
      Borramos los registros que tenemos---------------------------------------
      */

      ::oDetPersonal:oDbfVir:Zap()
      ::oDetHorasPersonal:oDbfVir:Zap()
      ::oDetMaquina:oDbfVir:Zap()

      /*
      Metemos autom�ticamente los operarios------------------------------------
      */

      if ::oOperario:oDbf:Seek( ::oDbf:cCodSec )

         while ::oOperario:oDbf:cCodSec == ::oDbf:cCodSec .and. !::oOperario:oDbf:Eof()

            ::oDetPersonal:oDbfVir:Append()

            ::oDetPersonal:oDbfVir:cCodTra      := ::oOperario:oDbf:cCodTra
            ::oDetPersonal:oDbfVir:cCodSec      := ::oDbf:cCodSec
            ::oDetPersonal:oDbfVir:cCodOpe      := ::oDbf:cCodOpe
            ::oDetPersonal:oDbfVir:dFecIni      := ::oDbf:dFecOrd
            ::oDetPersonal:oDbfVir:dFecFin      := ::oDbf:dFecFin
            ::oDetPersonal:oDbfVir:cHorIni      := ::oDbf:cHorIni
            ::oDetPersonal:oDbfVir:cHorFin      := ::oDbf:cHorFin

            ::oDetPersonal:oDbfVir:Save()

            ::oDetHoras:oDbf:GoTop()

            if ::oDetHoras:oDbf:Seek( ::oOperario:oDbf:cCodTra )

               while ::oDetHoras:oDbf:cCodTra == ::oOperario:oDbf:cCodTra .and. !::oDetHoras:oDbf:Eof()

                  if ::oDetHoras:oDbf:lDefHor

                     ::oDetHorasPersonal:oDbfVir:Append()

                     ::oDetHorasPersonal:oDbfVir:cCodTra := ::oOperario:oDbf:cCodTra
                     ::oDetHorasPersonal:oDbfVir:cCodHra := ::oDetHoras:oDbf:cCodHra
                     ::oDetHorasPersonal:oDbfVir:nCosHra := ::oDetHoras:oDbf:nCosHra
                     ::oDetHorasPersonal:oDbfVir:nNumHra := ::cTiempoEmpleado

                     ::oDetHorasPersonal:oDbfVir:Save()

                  end if

                  ::oDetHoras:oDbf:Skip()

               end while

            end if

            ::oOperario:oDbf:Skip()

         end while

      end if

      /*
      Metemos autom�ticamente la maquinaria-------------------------------------
      */

      if ::oMaquina:oDbf:Seek( ::oDbf:cCodSec )

         while ::oMaquina:oDbf:cCodSec == ::oDbf:cCodSec .and. !::oMaquina:oDbf:Eof()

            ::oDetMaquina:oDbfVir:Append()

            ::oDetMaquina:oDbfVir:cCodSec   := ::oDbf:cCodSec
            ::oDetMaquina:oDbfVir:cCodMaq   := ::oMaquina:oDbf:cCodMaq
            ::oDetMaquina:oDbfVir:dFecIni   := ::oDbf:dFecOrd
            ::oDetMaquina:oDbfVir:dFecFin   := ::oDbf:dFecFin
            ::oDetMaquina:oDbfVir:cIniMaq   := ::oDbf:cHorIni
            ::oDetMaquina:oDbfVir:cFinMaq   := ::oDbf:cHorFin
            ::oDetMaquina:oDbfVir:nCosHra   := ::oMaquina:nTotalCosteHora( ::oMaquina:oDbf:cCodMaq )
            ::oDetMaquina:oDbfVir:nTotHra   := ::cTiempoEmpleado

            ::oDetMaquina:oDbfVir:Save()

            ::oMaquina:oDbf:Skip()

         end while

      end if

      ::cOldCodSec   := cCodSec

   end if

   /*Cambios en la operacion*/

   if !Empty( cCodOpe ) .and. ::cOldCodOpe != cCodOpe

      ::oDetPersonal:oDbfVir:GoTop()

      while !::oDetPersonal:oDbfVir:Eof()

         ::oDetPersonal:oDbfVir:Load()
         ::oDetPersonal:oDbfVir:cCodOpe   := cCodOpe
         ::oDetPersonal:oDbfVir:Save()
         ::oDetPersonal:oDbfVir:Skip()

      end while

      ::cOldCodOpe   := cCodOpe

   end if

   /*Cambios en la fecha de inicio*/

   if !Empty( dFecIni ) .and. ::dOldFecIni != dFecIni

      /*Personal*/

      ::oDetPersonal:oDbfVir:GoTop()

      while !::oDetPersonal:oDbfVir:Eof()

         ::oDetPersonal:oDbfVir:Load()
         ::oDetPersonal:oDbfVir:dFecIni      := dFecIni
         ::oDetPersonal:oDbfVir:Save()
         ::oDetPersonal:oDbfVir:Skip()

      end while

      /*Horas personal*/

      ::oDetHorasPersonal:oDbfVir:GoTop()

      while !::oDetHorasPersonal:oDbfVir:Eof()

         ::oDetHorasPersonal:oDbfVir:Load()
         ::oDetHorasPersonal:oDbfVir:nNumHra := ::cTiempoEmpleado
         ::oDetHorasPersonal:oDbfVir:Save()
         ::oDetHorasPersonal:oDbfVir:Skip()

      end while


      /*Maquinaria*/

      ::oDetMaquina:oDbfVir:GoTop()

      while !::oDetMaquina:oDbfVir:Eof()

         ::oDetMaquina:oDbfVir:Load()
         ::oDetMaquina:oDbfVir:dFecIni       := dFecIni
         ::oDetMaquina:oDbfVir:nTotHra       := ::cTiempoEmpleado
         ::oDetMaquina:oDbfVir:Save()
         ::oDetMaquina:oDbfVir:Skip()

      end while

      ::dOldFecIni   := dFecIni

   end if

   /*Cambios en la fecha de fin*/

   if !Empty( dFecFin ) .and. ::dOldFecFin != dFecFin

      /*Personal*/

      ::oDetPersonal:oDbfVir:GoTop()

      while !::oDetPersonal:oDbfVir:Eof()

         ::oDetPersonal:oDbfVir:Load()
         ::oDetPersonal:oDbfVir:dFecFin      := dFecFin
         ::oDetPersonal:oDbfVir:Save()
         ::oDetPersonal:oDbfVir:Skip()

      end while

      /*Horas personal*/

      ::oDetHorasPersonal:oDbfVir:GoTop()

      while !::oDetHorasPersonal:oDbfVir:Eof()

         ::oDetHorasPersonal:oDbfVir:Load()
         ::oDetHorasPersonal:oDbfVir:nNumHra := ::cTiempoEmpleado
         ::oDetHorasPersonal:oDbfVir:Save()
         ::oDetHorasPersonal:oDbfVir:Skip()

      end while

      /*Maquinaria*/

      ::oDetMaquina:oDbfVir:GoTop()

      while !::oDetMaquina:oDbfVir:Eof()

         ::oDetMaquina:oDbfVir:Load()
         ::oDetMaquina:oDbfVir:dFecFin       := dFecFin
         ::oDetMaquina:oDbfVir:nTotHra       := ::cTiempoEmpleado
         ::oDetMaquina:oDbfVir:Save()
         ::oDetMaquina:oDbfVir:Skip()

      end while

      ::dOldFecFin   := dFecFin

   end if

   /*Cambios en la hora de inicio*/

   if !Empty( cHorIni ) .and. ::cOldHorIni != cHorIni

      /*Personal*/

      ::oDetPersonal:oDbfVir:GoTop()

      while !::oDetPersonal:oDbfVir:Eof()

         ::oDetPersonal:oDbfVir:Load()
         ::oDetPersonal:oDbfVir:cHorIni      := cHorIni
         ::oDetPersonal:oDbfVir:Save()
         ::oDetPersonal:oDbfVir:Skip()

      end while

      /*Horas personal*/

      ::oDetHorasPersonal:oDbfVir:GoTop()

      while !::oDetHorasPersonal:oDbfVir:Eof()

         ::oDetHorasPersonal:oDbfVir:Load()
         ::oDetHorasPersonal:oDbfVir:nNumHra := ::cTiempoEmpleado
         ::oDetHorasPersonal:oDbfVir:Save()
         ::oDetHorasPersonal:oDbfVir:Skip()

      end while

      /*Maquinaria*/

      ::oDetMaquina:oDbfVir:GoTop()

      while !::oDetMaquina:oDbfVir:Eof()

         ::oDetMaquina:oDbfVir:Load()
         ::oDetMaquina:oDbfVir:cIniMaq       := cHorIni
         ::oDetMaquina:oDbfVir:nTotHra       := ::cTiempoEmpleado
         ::oDetMaquina:oDbfVir:Save()
         ::oDetMaquina:oDbfVir:Skip()

      end while

      ::cOldHorIni   := cHorIni

   end if

   /*Cambios en la hora de fin*/

   if !Empty( cHorFin ) .and. ::cOldHorFin != cHorFin

      /*Personal*/

      ::oDetPersonal:oDbfVir:GoTop()

      while !::oDetPersonal:oDbfVir:Eof()

         ::oDetPersonal:oDbfVir:Load()
         ::oDetPersonal:oDbfVir:cHorFin         := cHorFin
         ::oDetPersonal:oDbfVir:Save()
         ::oDetPersonal:oDbfVir:Skip()

      end while

      /*Horas personal*/

      ::oDetHorasPersonal:oDbfVir:GoTop()

      while !::oDetHorasPersonal:oDbfVir:Eof()

         ::oDetHorasPersonal:oDbfVir:Load()
         ::oDetHorasPersonal:oDbfVir:nNumHra    := ::cTiempoEmpleado
         ::oDetHorasPersonal:oDbfVir:Save()
         ::oDetHorasPersonal:oDbfVir:Skip()

      end while

      /*Maquinaria*/

      ::oDetMaquina:oDbfVir:GoTop()

      while !::oDetMaquina:oDbfVir:Eof()

         ::oDetMaquina:oDbfVir:Load()
         ::oDetMaquina:oDbfVir:cFinMaq          := cHorFin
         ::oDetMaquina:oDbfVir:nTotHra          := ::cTiempoEmpleado
         ::oDetMaquina:oDbfVir:Save()
         ::oDetMaquina:oDbfVir:Skip()

      end while

      ::cOldHorFin   := cHorFin

   end if

   ::oDetHoras:oDbf:OrdSetFocus( nOrdAntHora )
   ::oOperario:oDbf:OrdSetFocus( nOrdAnt )
   ::oMaquina:oDbf:OrdSetFocus( nOrdAntMaq )

   ::oDetPersonal:oDbfVir:GoTop()
   ::oDetHorasPersonal:oDbfVir:GoTop()
   ::oDetMaquina:oDbfVir:GoTop()

   ::oTotPersonal:Refresh()
   ::oTotMaquinaria:Refresh()

   if !Empty( oBrwPer )
      oBrwPer:Refresh()
   end if

   if !Empty( oBrwMaq )
      oBrwMaq:Refresh()
   end if

RETURN .t.

//---------------------------------------------------------------------------//

Function aDocPro()

   local aDoc        := {}

   aAdd( aDoc, { "Empresa",         "EM" } )
   aAdd( aDoc, { "Producci�n",      "PO" } )
   aAdd( aDoc, { "Almacen",         "AL" } )

RETURN ( aDoc )

//---------------------------------------------------------------------------//

METHOD GenParte( nDevice, cCaption, cCodDoc, cPrinter, nCopies )

   local oInf
   local oDevice
   local cNumeroParte

   DEFAULT nDevice      := IS_PRINTER
   DEFAULT cCaption     := "Imprimiendo parte de producci�n"
   DEFAULT cCodDoc      := cFormatoDocumento( ::oDbf:cSerOrd, "NPARPRD", ::oDbfCount:cAlias )
   DEFAULT nCopies      := nCopiasDocumento( ::oDbf:cSerOrd, "NPARPRD", ::oDbfCount:cAlias )

   if ::oDbf:Lastrec() == 0
      Return nil
   end if

   if Empty( cCodDoc )
      cCodDoc           := if( ::oDbf:cSerOrd == "A", "PO1", "PO2" )
   end if

   if !lExisteDocumento( cCodDoc, ::oDbfDoc:cAlias )
      return nil
   end if

   cNumeroParte            := ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd

   ::CreateTemporal( cNumeroParte )

   ::oDbf:GetStatus( .t. )

   ::oDbf:Seek( cNumeroParte )

   if lVisualDocumento( cCodDoc, ::oDbfDoc:cAlias )

      public cTiempoEmp    := cTiempo( ::oDbf:dFecOrd, ::oDbf:dFecFin, ::oDbf:cHorIni, ::oDbf:cHorFin )
      public nProd         := nTotProd( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetProduccion:oDbf:cAlias )
      public nMat          := nTotMat( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetMaterial:oDbf:cAlias )
      public nPer          := nTotPer( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetHorasPersonal:oDbf:cAlias )
      public nMaq          := nTotMaq( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetMaquina:oDbf:cAlias )
      public nParte        := nTotParte( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetProduccion:oDbf:cAlias, ::oDetMaterial:oDbf:cAlias, ::oDetHorasPersonal:oDbf:cAlias, ::oDetMaquina:oDbf:cAlias )

      ::PrintReportProducc( nDevice, nCopies, cPrinter, ::oDbfDoc:cAlias )

   else

      private oDbf            := ::oDbf
      private cDbf            := ::oDbf:cAlias
      private oDbfCol         := ::oDbfTemporal
      private cDbfCol         := ::oDbfTemporal:cAlias
      private oThis           := Self
      private oDbfAlm         := ::oAlm
      private cDbfAlm         := ::oAlm:cAlias
      private oDbfSec         := ::oSeccion:oDbf
      private cDbfSec         := ::oSeccion:oDbf:cAlias
      private cPouDivPro      := ::cPouDiv
      private cDetPro         := ::oDetProduccion:oDbf:cAlias
      private cDetMat         := ::oDetMaterial:oDbf:cAlias
      private cDetHPer        := ::oDetHorasPersonal:oDbf:cAlias
      private cDetMaq         := ::oDetMaquina:oDbf:cAlias

      if !Empty( cPrinter )
         oDevice              := TPrinter():New( cCaption, .f., .t., cPrinter )
         REPORT oInf CAPTION cCaption TO DEVICE oDevice
      else
         REPORT oInf CAPTION cCaption PREVIEW
      end if

      if !Empty( oInf ) .and. oInf:lCreated

         oInf:lAutoland       := .f.
         oInf:lFinish         := .f.
         oInf:lNoCancel       := .t.
         oInf:bSkip           := {|| ::oDbfTemporal:Skip() }

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

      RptAddGroup( {|| Self:oDbfTemporal:cTipo }, {|| cNombreTipo( oInf:aGroups[1]:cValue ) }, {|| "" }, , .f. )

      END REPORT

      if !Empty( oInf )

         ACTIVATE REPORT oInf ;
            WHILE       ( !::oDbfTemporal:Eof() );
            ON ENDPAGE  ::EPage( oInf, cCodDoc )

            if nDevice == IS_PRINTER
               oInf:oDevice:end()
            end if

      end if

      oInf  := nil

   end if

   ::oDbfTemporal:Zap()

   ::oDbf:SetStatus()

RETURN ( NIL )

//---------------------------------------------------------------------------//

METHOD EPage( oInf, cCodDoc )

	private nPagina		:= oInf:nPage
	private lEnd			:= oInf:lFinish

   PrintItems( cCodDoc, oInf )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD lGenParte( oBrw, oBtn, nDevice )

   local bAction

   DEFAULT nDevice   := IS_PRINTER

   if !::oDbfDoc:Seek( "PO" )

      DEFINE BTNSHELL RESOURCE "DOCUMENT" OF ::oWndBrw ;
         NOBORDER ;
         ACTION   ( msgStop( "No hay documentos predefinidos" ) );
         TOOLTIP  "No hay documentos" ;
         HOTKEY   "N";
         FROM     oBtn ;
         CLOSED ;
         LEVEL    ACC_EDIT

   else

      while ::oDbfDoc:cTipo == "PO" .AND. !::oDbfDoc:eof()

         bAction  := ::bGenParte( nDevice, "Imprimiendo parte de producci�n", ::oDbfDoc:Codigo )

         ::oWndBrw:NewAt( "Document", , , bAction, Rtrim( ::oDbfDoc:cDescrip ) , , , , , oBtn )

         ::oDbfDoc:Skip()

      end do

   end if

RETURN nil

//---------------------------------------------------------------------------//

METHOD bGenParte( nDevice, cTitle, cCodDoc )

   local bGen
   local nDev        := by( nDevice )
   local cTit        := by( cTitle    )
   local cCod        := by( cCodDoc   )

   bGen              := {|| ::GenParte( nDev, cTit, cCod ) }

RETURN ( bGen )

//---------------------------------------------------------------------------//

METHOD CreateTemporal( cNumeroParte )

   local nOrdPR      := ::oDetProduccion:oDbf:OrdSetFocus( "cNumOrd" )
   local nOrdMP      := ::oDetMaterial:oDbf:OrdSetFocus( "cNumOrd" )
   local nOrdOP      := ::oDetPersonal:oDbf:OrdSetFocus( "cNumOrd" )
   local nOrdMQ      := ::oDetMaquina:oDbf:OrdSetFocus( "cNumOrd" )

   /*
   Metemos las l�neas con los materiales producidos "PR"-----------------------
   */

   ::oDetProduccion:oDbf:GoTop()

   if ::oDetProduccion:oDbf:Seek( cNumeroParte )

      while ::oDetProduccion:oDbf:cSerOrd + Str( ::oDetProduccion:oDbf:nNumOrd ) + ::oDetProduccion:oDbf:cSufOrd == cNumeroParte .and. !::oDetProduccion:oDbf:Eof()

      ::oDbfTemporal:Append()

      ::oDbfTemporal:cSerOrd     := ::oDbf:cSerOrd
      ::oDbfTemporal:nNumOrd     := ::oDbf:nNumOrd
      ::oDbfTemporal:cSufOrd     := ::oDbf:cSufOrd
      ::oDbfTemporal:cTipo       := "PR"
      ::oDbfTemporal:cCodigo     := ::oDetProduccion:oDbf:cCodArt
      ::oDbfTemporal:cNombre     := ::oDetProduccion:oDbf:cNomArt
      ::oDbfTemporal:cTxtSer     := SerialDescrip( ::oDetProduccion:oDbf:cSerOrd + Str( ::oDetProduccion:oDbf:nNumOrd ) + ::oDetProduccion:oDbf:cSufOrd + Str( ::oDetProduccion:oDbf:nNumLin ), ::oDetSeriesProduccion:oDbf:cAlias )
      ::oDbfTemporal:cCodAlm     := ::oDetProduccion:oDbf:cAlmOrd
      ::oDbfTemporal:cCodSec     := Space(3)
      ::oDbfTemporal:cCodOpe     := Space(3)
      ::oDbfTemporal:dFecIni     := ::oDbf:dFecOrd
      ::oDbfTemporal:dFecFin     := ::oDbf:dFecFin
      ::oDbfTemporal:cHorIni     := ::oDbf:cHorIni
      ::oDbfTemporal:cHorFin     := ::oDbf:cHorFin
      ::oDbfTemporal:nCajas      := ::oDetProduccion:oDbf:nCajOrd
      ::oDbfTemporal:nUnidades   := ::oDetProduccion:oDbf:nUndOrd
      ::oDbfTemporal:nUndHra     := ::oDetProduccion:oDbf:nCajOrd * ::oDetProduccion:oDbf:nUndOrd
      ::oDbfTemporal:nImporte    := ::oDetProduccion:oDbf:nImpOrd
      ::oDbfTemporal:nTotLin     := ::oDbfTemporal:nUndHra * ::oDbfTemporal:nImporte
      ::oDbfTemporal:nPeso       := ::oDetProduccion:oDbf:nPeso
      ::oDbfTemporal:cUndPes     := ::oDetProduccion:oDbf:cUndPes
      ::oDbfTemporal:nVolumen    := ::oDetProduccion:oDbf:nVolumen
      ::oDbfTemporal:cUndVol     := ::oDetProduccion:oDbf:cUndVol
      ::oDbfTemporal:cCodPr1     := ::oDetProduccion:oDbf:cCodPr1
      ::oDbfTemporal:cCodPr2     := ::oDetProduccion:oDbf:cCodPr2
      ::oDbfTemporal:cValPr1     := ::oDetProduccion:oDbf:cValPr1
      ::oDbfTemporal:cValPr2     := ::oDetProduccion:oDbf:cValPr2
      ::oDbfTemporal:lLote       := ::oDetProduccion:oDbf:lLote
      ::oDbfTemporal:cLote       := ::oDetProduccion:oDbf:cLote

      ::oDbfTemporal:Save()

      ::oDetProduccion:oDbf:Skip()

      end while

   end if

   /*
   Metemos las l�neas con las materias primas necesitadas "MP"-----------------
   */

   ::oDetMaterial:oDbf:GoTop()

   if ::oDetMaterial:oDbf:Seek( cNumeroParte )

      while ::oDetMaterial:oDbf:cSerOrd + Str( ::oDetMaterial:oDbf:nNumOrd ) + ::oDetMaterial:oDbf:cSufOrd == cNumeroParte .and. !::oDetMaterial:oDbf:Eof()

      ::oDbfTemporal:Append()

      ::oDbfTemporal:cSerOrd     := ::oDbf:cSerOrd
      ::oDbfTemporal:nNumOrd     := ::oDbf:nNumOrd
      ::oDbfTemporal:cSufOrd     := ::oDbf:cSufOrd
      ::oDbfTemporal:cTipo       := "MP"
      ::oDbfTemporal:cCodigo     := ::oDetMaterial:oDbf:cCodArt
      ::oDbfTemporal:cNombre     := ::oDetMaterial:oDbf:cNomArt
      ::oDbfTemporal:cCodAlm     := ::oDetMaterial:oDbf:cAlmOrd
      ::oDbfTemporal:cCodSec     := Space(3)
      ::oDbfTemporal:cCodOpe     := Space(3)
      ::oDbfTemporal:dFecIni     := ::oDbf:dFecOrd
      ::oDbfTemporal:dFecFin     := ::oDbf:dFecFin
      ::oDbfTemporal:cHorIni     := ::oDbf:cHorIni
      ::oDbfTemporal:cHorFin     := ::oDbf:cHorFin
      ::oDbfTemporal:nCajas      := ::oDetMaterial:oDbf:nCajOrd
      ::oDbfTemporal:nUnidades   := ::oDetMaterial:oDbf:nUndOrd
      ::oDbfTemporal:nUndHra     := ::oDetMaterial:oDbf:nCajOrd * ::oDetMaterial:oDbf:nUndOrd
      ::oDbfTemporal:nImporte    := ::oDetMaterial:oDbf:nImpOrd
      ::oDbfTemporal:nTotLin     := ::oDbfTemporal:nUndHra * ::oDbfTemporal:nImporte
      ::oDbfTemporal:nPeso       := ::oDetMaterial:oDbf:nPeso
      ::oDbfTemporal:cUndPes     := ::oDetMaterial:oDbf:cUndPes
      ::oDbfTemporal:nVolumen    := ::oDetMaterial:oDbf:nVolumen
      ::oDbfTemporal:cUndVol     := ::oDetMaterial:oDbf:cUndVol
      ::oDbfTemporal:cCodPr1     := ::oDetMaterial:oDbf:cCodPr1
      ::oDbfTemporal:cCodPr2     := ::oDetMaterial:oDbf:cCodPr2
      ::oDbfTemporal:cValPr1     := ::oDetMaterial:oDbf:cValPr1
      ::oDbfTemporal:cValPr2     := ::oDetMaterial:oDbf:cValPr2
      ::oDbfTemporal:lLote       := ::oDetMaterial:oDbf:lLote
      ::oDbfTemporal:cLote       := ::oDetMaterial:oDbf:cLote

      ::oDbfTemporal:Save()

      ::oDetMaterial:oDbf:Skip()

      end while

   end if

   /*
   Metemos las l�neas con los operarios que intervinieron "OP"-----------------
   */

   ::oDetPersonal:oDbf:GoTop()

   if ::oDetPersonal:oDbf:Seek( cNumeroParte )

      while ::oDetPersonal:oDbf:cSerOrd + Str( ::oDetPersonal:oDbf:nNumOrd ) + ::oDetPersonal:oDbf:cSufOrd == cNumeroParte .and. !::oDetPersonal:oDbf:Eof()

      ::oDbfTemporal:Append()

      ::oDbfTemporal:cSerOrd     := ::oDbf:cSerOrd
      ::oDbfTemporal:nNumOrd     := ::oDbf:nNumOrd
      ::oDbfTemporal:cSufOrd     := ::oDbf:cSufOrd
      ::oDbfTemporal:cTipo       := "OP"
      ::oDbfTemporal:cCodigo     := ::oDetPersonal:oDbf:cCodTra
      ::oDbfTemporal:cNombre     := oRetFld( ::oDetPersonal:oDbf:cCodTra, ::oOperario:oDbf )
      ::oDbfTemporal:cCodAlm     := Space(3)
      ::oDbfTemporal:cCodSec     := ::oDetPersonal:oDbf:cCodSec
      ::oDbfTemporal:cCodOpe     := ::oDetPersonal:oDbf:cCodOpe
      ::oDbfTemporal:dFecIni     := ::oDetPersonal:oDbf:dFecIni
      ::oDbfTemporal:dFecFin     := ::oDetPersonal:oDbf:dFecFin
      ::oDbfTemporal:cHorIni     := ::oDetPersonal:oDbf:cHorIni
      ::oDbfTemporal:cHorFin     := ::oDetPersonal:oDbf:cHorFin
      ::oDbfTemporal:nCajas      := 0
      ::oDbfTemporal:nUnidades   := 0
      ::oDbfTemporal:nUndHra     := nTiempoEntreFechas( ::oDetPersonal:oDbf:dFecIni, ::oDetPersonal:oDbf:dFecFin, ::oDetPersonal:oDbf:cHorIni, ::oDetPersonal:oDbf:cHorFin )
      ::oDbfTemporal:nImporte    := ::oDetPersonal:nTotal( ::oDetPersonal:oDbf:cCodTra, ::oDetHorasPersonal:oDbf )
      ::oDbfTemporal:nTotLin     := ::oDbfTemporal:nUndHra * ::oDbfTemporal:nImporte
      ::oDbfTemporal:nPeso       := 0
      ::oDbfTemporal:cUndPes     := Space(2)
      ::oDbfTemporal:nVolumen    := 0
      ::oDbfTemporal:cUndVol     := Space(2)
      ::oDbfTemporal:cCodPr1     := Space(5)
      ::oDbfTemporal:cCodPr2     := Space(5)
      ::oDbfTemporal:cValPr1     := Space(5)
      ::oDbfTemporal:cValPr2     := Space(5)
      ::oDbfTemporal:lLote       := .f.
      ::oDbfTemporal:cLote       := Space(12)

      ::oDbfTemporal:Save()

      ::oDetPersonal:oDbf:Skip()

      end if

   end if

   /*
   Metemos las l�neas con la maquinaria usada en la operaci�n "MQ"-------------
   */

   ::oDetMaquina:oDbf:GoTop()

   if ::oDetMaquina:oDbf:Seek( cNumeroParte )

      while ::oDetMaquina:oDbf:cSerOrd + Str( ::oDetMaquina:oDbf:nNumOrd ) + ::oDetMaquina:oDbf:cSufOrd == cNumeroParte .and. !::oDetMaquina:oDbf:Eof()

      ::oDbfTemporal:Append()

      ::oDbfTemporal:cSerOrd     := ::oDbf:cSerOrd
      ::oDbfTemporal:nNumOrd     := ::oDbf:nNumOrd
      ::oDbfTemporal:cSufOrd     := ::oDbf:cSufOrd
      ::oDbfTemporal:cTipo       := "MQ"
      ::oDbfTemporal:cCodigo     := ::oDetMaquina:oDbf:cCodMaq
      ::oDbfTemporal:cNombre     := oRetFld( ::oDetMaquina:oDbf:cCodMaq, ::oMaquina:oDbf )
      ::oDbfTemporal:cCodAlm     := Space(3)
      ::oDbfTemporal:cCodSec     := ::oDetMaquina:oDbf:cCodSec
      ::oDbfTemporal:cCodOpe     := Space(3)
      ::oDbfTemporal:dFecIni     := ::oDetMaquina:oDbf:dFecIni
      ::oDbfTemporal:dFecFin     := ::oDetMaquina:oDbf:dFecFin
      ::oDbfTemporal:cHorIni     := ::oDetMaquina:oDbf:cIniMaq
      ::oDbfTemporal:cHorFin     := ::oDetMaquina:oDbf:cFinMaq
      ::oDbfTemporal:nCajas      := 0
      ::oDbfTemporal:nUnidades   := 0
      ::oDbfTemporal:nUndHra     := ::oDetMaquina:oDbf:nTotHra
      ::oDbfTemporal:nImporte    := ::oDetMaquina:oDbf:nCosHra
      ::oDbfTemporal:nTotLin     := ::oDbfTemporal:nUndHra * ::oDbfTemporal:nImporte
      ::oDbfTemporal:nPeso       := 0
      ::oDbfTemporal:cUndPes     := Space(2)
      ::oDbfTemporal:nVolumen    := 0
      ::oDbfTemporal:cUndVol     := Space(2)
      ::oDbfTemporal:cCodPr1     := Space(5)
      ::oDbfTemporal:cCodPr2     := Space(5)
      ::oDbfTemporal:cValPr1     := Space(5)
      ::oDbfTemporal:cValPr2     := Space(5)
      ::oDbfTemporal:lLote       := .f.
      ::oDbfTemporal:cLote       := Space(12)

      ::oDbfTemporal:Save()

      ::oDetMaquina:oDbf:Skip()

      end while

   end if

   ::oDetProduccion:oDbf:OrdSetFocus( nOrdPR )
   ::oDetMaterial:oDbf:OrdSetFocus( nOrdMP )
   ::oDetPersonal:oDbf:OrdSetFocus( nOrdOP )
   ::oDetMaquina:oDbf:OrdSetFocus( nOrdMQ )

   ::oDbfTemporal:GoTop()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD DefineTemporal()

   ::cFileName      := cGetNewFileName( cPatTmp() + "TPro" )

   DEFINE DATABASE ::oDbfTemporal FILE ( ::cFileName ) CLASS "TPro" ALIAS "TPro" PATH ( cPatTmp() ) VIA ( cLocalDriver() )COMMENT "l�neas de producci�n"

      FIELD NAME "cSerOrd"    TYPE "C" LEN  01  DEC 0 COMMENT "Serie"                                    OF ::oDbfTemporal
      FIELD NAME "nNumOrd"    TYPE "N" LEN  09  DEC 0 COMMENT "N�mero"                                   OF ::oDbfTemporal
      FIELD NAME "cSufOrd"    TYPE "C" LEN  02  DEC 0 COMMENT "Sufijo"                                   OF ::oDbfTemporal
      FIELD NAME "cTipo"      TYPE "C" LEN  02  DEC 0 COMMENT "Tipo"                                     OF ::oDbfTemporal
      FIELD NAME "cCodigo"    TYPE "C" LEN  18  DEC 0 COMMENT "C�digo"                                   OF ::oDbfTemporal
      FIELD NAME "cNombre"    TYPE "C" LEN 100  DEC 0 COMMENT "Nombre"                                   OF ::oDbfTemporal
      FIELD NAME "cTxtSer"    TYPE "M" LEN  10  DEC 0 COMMENT "Series"                                   OF ::oDbfTemporal
      FIELD NAME "cCodAlm"    TYPE "C" LEN  03  DEC 0 COMMENT "Almac�n"                                  OF ::oDbfTemporal
      FIELD NAME "cCodSec"    TYPE "C" LEN  03  DEC 0 COMMENT "Secci�n"                                  OF ::oDbfTemporal
      FIELD NAME "cCodOpe"    TYPE "C" LEN  03  DEC 0 COMMENT "Operaci�n"                                OF ::oDbfTemporal
      FIELD NAME "dFecIni"    TYPE "D" LEN  08  DEC 0 COMMENT "Fecha inicio"                             OF ::oDbfTemporal
      FIELD NAME "dFecFin"    TYPE "D" LEN  08  DEC 0 COMMENT "Fecha fin"                                OF ::oDbfTemporal
      FIELD NAME "cHorIni"    TYPE "C" LEN  05  DEC 0 COMMENT "Hora de inicio" PICTURE "@R 99:99"        OF ::oDbfTemporal
      FIELD NAME "cHorFin"    TYPE "C" LEN  05  DEC 0 COMMENT "Hora de fin"    PICTURE "@R 99:99"        OF ::oDbfTemporal
      FIELD NAME "nCajas"     TYPE "N" LEN  16  DEC 6 COMMENT "Cajas"                                    OF ::oDbfTemporal
      FIELD NAME "nUnidades"  TYPE "N" LEN  16  DEC 6 COMMENT "Unidades"                                 OF ::oDbfTemporal
      FIELD NAME "nUndHra"    TYPE "N" LEN  16  DEC 6 COMMENT "Tot. und/hra"                             OF ::oDbfTemporal
      FIELD NAME "nImporte"   TYPE "N" LEN  16  DEC 6 COMMENT "Importe"                                  OF ::oDbfTemporal
      FIELD NAME "nTotLin"    TYPE "N" LEN  16  DEC 6 COMMENT "Total l�nea"                              OF ::oDbfTemporal
      FIELD NAME "nPeso"      TYPE "N" LEN  16  DEC 6 COMMENT "Peso del art�culo"                        OF ::oDbfTemporal
      FIELD NAME "cUndPes"    TYPE "C" LEN  02  DEC 0 COMMENT "Unidad del peso"                          OF ::oDbfTemporal
      FIELD NAME "nVolumen"   TYPE "N" LEN  16  DEC 6 COMMENT "Volumen del art�culo"                     OF ::oDbfTemporal
      FIELD NAME "cUndVol"    TYPE "C" LEN  02  DEC 0 COMMENT "Unidad del volumen"                       OF ::oDbfTemporal
      FIELD NAME "cCodPr1"    TYPE "C" LEN  10  DEC 0 COMMENT "C�digo de primera propiedad"              OF ::oDbfTemporal
      FIELD NAME "cCodPr2"    TYPE "C" LEN  10  DEC 0 COMMENT "C�digo de segunda propiedad"              OF ::oDbfTemporal
      FIELD NAME "cValPr1"    TYPE "C" LEN  10  DEC 0 COMMENT "Valor de primera propiedad"               OF ::oDbfTemporal
      FIELD NAME "cValPr2"    TYPE "C" LEN  10  DEC 0 COMMENT "Valor de segunda propiedad"               OF ::oDbfTemporal
      FIELD NAME "lLote"      TYPE "L" LEN  01  DEC 0 COMMENT "L�gico lote"                              OF ::oDbfTemporal
      FIELD NAME "cLote"      TYPE "C" LEN  12  DEC 0 COMMENT "Lote"                                     OF ::oDbfTemporal

      INDEX TO ( ::cFileName ) TAG "cNumOrd" ON "cSerOrd + Str( nNumOrd, 9 ) + cSufOrd"   COMMENT "N�mero"    NODELETED OF ::oDbfTemporal

   END DATABASE ::oDbfTemporal

RETURN ( ::oDbfTemporal )

//---------------------------------------------------------------------------//

METHOD DestroyTemporal()

   if !Empty( ::oDbfTemporal ) .and. ::oDbfTemporal:Used()
      ::oDbfTemporal:End()
   end if

   dbfErase( ::cFileName )

   ::oDbfTemporal := nil

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD PrnSerie()

	local oDlg
   local oFmtDoc
   local cFmtDoc     := cSelPrimerDoc( "PO" )
   local oSayFmt
   local cSayFmt
   local oSerIni
   local oSerFin
   local nRecno      := ::oDbf:Recno()
   local nOrdAnt     := ::oDbf:OrdSetFocus( "cNumOrd" )
   local cSerIni     := ::oDbf:cSerOrd
   local cSerFin     := ::oDbf:cSerOrd
   local nDocIni     := ::oDbf:nNumOrd
   local nDocFin     := ::oDbf:nNumOrd
   local cSufIni     := ::oDbf:cSufOrd
   local cSufFin     := ::oDbf:cSufOrd
   local oPrinter
   local cPrinter    := PrnGetName()
   local lCopiasPre  := .t.
   local lInvOrden   := .f.
   local oNumCop
   local nNumCop     := nCopiasDocumento( ::oDbf:cSerOrd, "nParPrd", ::oDbfCount:cAlias )

   DEFAULT cPrinter  := PrnGetName()

   cSayFmt           := cNombreDoc( cFmtDoc )

   DEFINE DIALOG oDlg RESOURCE "IMPSERDOC" TITLE "Imprimir series de partes de producci�n"

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
      OF       oDlg

   REDEFINE GET nDocFin;
      ID       130 ;
		PICTURE 	"999999999" ;
      SPINNER ;
      OF       oDlg

   REDEFINE GET cSufIni ;
      ID       140 ;
      PICTURE  "##" ;
      OF       oDlg

   REDEFINE GET cSufFin ;
      ID       150 ;
      PICTURE  "##" ;
      OF       oDlg

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
      VALID    ( cDocumento( oFmtDoc, oSayFmt, ::oDbfDoc:cAlias ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( BrwDocumento( oFmtDoc, oSayFmt, "PO" ) ) ;
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
      ACTION   (  ::StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden ),;
                  oDlg:end( IDOK ) )

   REDEFINE BUTTON ;
      ID       IDCANCEL ;
		OF 		oDlg ;
      ACTION   ( oDlg:end() )

   oDlg:bStart := { || oSerIni:SetFocus() }

   oDlg:AddFastKey( VK_F5, {|| ::StartPrint( SubStr( cFmtDoc, 1, 3 ), cSerIni + Str( nDocIni, 9 ) + cSufIni, cSerFin + Str( nDocFin, 9 ) + cSufFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden ), oDlg:end( IDOK ) } )

   ACTIVATE DIALOG oDlg CENTER

   ::oDbf:GoTo( nRecNo )
   ::oDbf:OrdSetFocus( nOrdAnt )

RETURN NIL

//--------------------------------------------------------------------------//

METHOD StartPrint( cFmtDoc, cDocIni, cDocFin, oDlg, cPrinter, lCopiasPre, nNumCop, lInvOrden )

   oDlg:disable()

   if !lInvOrden

      ::oDbf:Seek( cDocIni, .t. )

      while ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd >= cDocIni .AND. ;
            ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd <= cDocFin

         if lCopiasPre

            ::nGenParte( IS_PRINTER, "Imprimiendo documento : " + ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, cFmtDoc, cPrinter, nCopiasDocumento( ::oDbf:cSerOrd, "NPARPRD", ::oDbfCount:cAlias ) )

         else

            ::nGenParte( IS_PRINTER, "Imprimiendo documento : " + ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, cFmtDoc, cPrinter, nNumCop )

         end if

         ::oDbf:Skip( 1 )

      end do

   else

      ::oDbf:Seek( cDocFin )

      while ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd >= cDocIni .and.;
            ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd <= cDocFin .and.;
            !::oDbf:Bof()

         if lCopiasPre

            ::nGenParte( IS_PRINTER, "Imprimiendo documento : " + ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, cFmtDoc, cPrinter, nCopiasDocumento( ::oDbf:cSerOrd, "NPARPRD", ::oDbfCount:cAlias ) )

         else

            ::nGenParte( IS_PRINTER, "Imprimiendo documento : " + ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, cFmtDoc, cPrinter, nNumCop )

         end if

         ::oDbf:Skip( -1 )

      end while

   end if

   oDlg:enable()

RETURN NIL

//---------------------------------------------------------------------------//

METHOD nGenParte( nDevice, cTitle, cCodDoc, cPrinter, nCopy )

   local nImpYet     := 1

   DEFAULT nDevice   := IS_PRINTER
   DEFAULT nCopy     := nCopiasDocumento( , "NPARPRD", ::oDbfCount:cAlias )

   nCopy             := Max( nCopy, 1 )

   while nImpYet <= nCopy
      ::GenParte( nDevice, cTitle, cCodDoc, cPrinter )
      nImpYet++
   end while

return nil

//---------------------------------------------------------------------------//

METHOD DefineCalculate()

   ::aCal  := {}

   aAdd( ::aCal, { "cTiempo( (cDbf)->dFecOrd, (cDbf)->dFecFin, (cDbf)->cHorIni, (cDbf)->cHorFin )",   "C", 50, 0, "Tiempo empleado",      "",           "" } )
   aAdd( ::aCal, { "nTotProd( (cDbf)->cSerOrd + Str((cDbf)->nNumOrd) + (cDbf)->cSufOrd, cDetPro )",   "N", 16, 6, "Total producido",      "cPouDivPro", "" } )
   aAdd( ::aCal, { "nTotMat( (cDbf)->cSerOrd + Str((cDbf)->nNumOrd) + (cDbf)->cSufOrd, cDetMat )",    "N", 16, 6, "Total materias primas","cPouDivPro", "" } )
   aAdd( ::aCal, { "nTotPer( (cDbf)->cSerOrd + Str((cDbf)->nNumOrd) + (cDbf)->cSufOrd, cDetHPer )",   "N", 16, 6, "Total personal",       "cPouDivPro", "" } )
   aAdd( ::aCal, { "nTotMaq( (cDbf)->cSerOrd + Str((cDbf)->nNumOrd) + (cDbf)->cSufOrd, cDetMaq )",    "N", 16, 6, "Total maquinaria",     "cPouDivPro", "" } )
   aAdd( ::aCal, { "nTotParte((cDbf)->cSerOrd + Str((cDbf)->nNumOrd) + (cDbf)->cSufOrd,cDetPro,cDetMat,cDethPer,cDetMaq)", "N", 16, 6, "Total Parte",     "cPouDivPro", "" } )

RETURN ( ::aCal )

//---------------------------------------------------------------------------//

METHOD RecSiguente( oBrw )

   local lAppend
   local lTrigger
   local aAnterior   := { ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDbf:dFecFin, ::oDbf:cHorFin, ::oDbf:cCodSec }

   if( ::oWndBrw != nil, ::oWndBrw:Maximize(), )

   if ::bOnPreAppend != nil
      lTrigger := Eval( ::bOnPreAppend, Self )
      if Valtype( lTrigger ) == "L" .and. !lTrigger
         return .f.
      end if
   end if

   ::oDbf:Blank()
   ::oDbf:SetDefault()

   ::LoadDetails( .f. )

   lAppend       := ::Resource( 1, aAnterior )

   if lAppend

      ::GetNewCount()

      ::oDbf:Insert()

      ::SaveDetails( APPD_MODE )

      if( ::oWndBrw != nil, ::oWndBrw:Refresh(), )

   else

      ::oDbf:Cancel()

      if( ::oWndBrw != nil, ::oWndBrw:Refresh(), )

   end if

   ::CancelDetails()

   if ::bOnPostAppend != nil
      Eval( ::bOnPostAppend, Self )
   end if

   oBrw:Refresh()

RETURN ( lAppend )

//---------------------------------------------------------------------------//

METHOD CargaPersonalAnterior( aDatosAnterior )

   local nOrdAnt     := ::oDetHorasPersonal:oDbf:OrdSetFocus( "cNumOrd" )

   /*Pasamos el personal*/

   ::oDetPersonal:oDbf:GoTop()

   if ::oDetPersonal:oDbf:Seek( aDatosAnterior[1] )

      while ::oDetPersonal:oDbf:cSerOrd + Str( ::oDetPersonal:oDbf:nNumOrd ) + ::oDetPersonal:oDbf:cSufOrd == aDatosAnterior[1] .and.;
            !::oDetPersonal:oDbf:Eof()

         ::oDetPersonal:oDbfVir:Append()

         ::oDetPersonal:oDbfVir:cCodTra   := ::oDetPersonal:oDbf:cCodTra
         ::oDetPersonal:oDbfVir:cCodSec   := ::oDbf:cCodSec
         ::oDetPersonal:oDbfVir:cCodOpe   := ::oDbf:cCodOpe
         ::oDetPersonal:oDbfVir:dFecIni   := ::oDbf:dFecOrd
         ::oDetPersonal:oDbfVir:dFecFin   := ::oDbf:dFecFin
         ::oDetPersonal:oDbfVir:cHorIni   := ::oDbf:cHorIni
         ::oDetPersonal:oDbfVir:cHorFin   := ::oDbf:cHorFin

         ::oDetPersonal:oDbfVir:Save()

         ::oDetPersonal:oDbf:Skip()

      end while

   end if

   /*Pasamos las horas de personal*/

   ::oDetHorasPersonal:oDbf:GoTop()

   if ::oDetHorasPersonal:oDbf:Seek( aDatosAnterior[1] )

      while ::oDetHorasPersonal:oDbf:cSerOrd + Str( ::oDetHorasPersonal:oDbf:nNumOrd ) + ::oDetHorasPersonal:oDbf:cSufOrd == aDatosAnterior[1] .and.;
            !::oDetHorasPersonal:oDbf:Eof()

         ::oDetHorasPersonal:oDbfVir:Append()

         ::oDetHorasPersonal:oDbfVir:cCodTra    :=  ::oDetHorasPersonal:oDbf:cCodTra
         ::oDetHorasPersonal:oDbfVir:cCodHra    :=  ::oDetHorasPersonal:oDbf:cCodHra
         ::oDetHorasPersonal:oDbfVir:nNumHra    :=  nTiempoEntreFechas( ::oDbf:dFecOrd, ::oDbf:dFecFin, ::oDbf:cHorIni, ::oDbf:cHorFin )
         ::oDetHorasPersonal:oDbfVir:nCosHra    :=  ::oDetHorasPersonal:oDbf:nCosHra

         ::oDetHorasPersonal:oDbfVir:Save()

         ::oDetHorasPersonal:oDbf:Skip()

      end while

   end if

   /*Pasamos las maquinarias*/

   ::oDetMaquina:oDbf:GoTop()

   if ::oDetMaquina:oDbf:Seek( aDatosAnterior[1] )

      while ::oDetMaquina:oDbf:cSerOrd + Str( ::oDetMaquina:oDbf:nNumOrd ) + ::oDetMaquina:oDbf:cSufOrd == aDatosAnterior[1] .and.;
            !::oDetMaquina:oDbf:Eof()

         ::oDetMaquina:oDbfVir:Append()

         ::oDetMaquina:oDbfVir:cCodSec    := ::oDbf:cCodSec
         ::oDetMaquina:oDbfVir:cCodMaq    := ::oDetMaquina:oDbf:cCodMaq
         ::oDetMaquina:oDbfVir:dFecIni    := ::oDbf:dFecOrd
         ::oDetMaquina:oDbfVir:dFecFin    := ::oDbf:dFecFin
         ::oDetMaquina:oDbfVir:cIniMaq    := ::oDbf:cHorIni
         ::oDetMaquina:oDbfVir:cFinMaq    := ::oDbf:cHorFin
         ::oDetMaquina:oDbfVir:nCosHra    := ::oDetMaquina:oDbf:nCosHra
         ::oDetMaquina:oDbfVir:nTotHra    := nTiempoEntreFechas( ::oDbf:dFecOrd, ::oDbf:dFecFin, ::oDbf:cHorIni, ::oDbf:cHorFin )

         ::oDetMaquina:oDbfVir:Save()

         ::oDetMaquina:oDbf:Skip()

      end while

   end if

   ::oDetHorasPersonal:oDbf:OrdSetFocus( nOrdAnt )

   ::oDetPersonal:oDbfVir:GoTop()
   ::oDetHorasPersonal:oDbfVir:GoTop()
   ::oDetMaquina:oDbfVir:GoTop()

RETURN( Self )

//---------------------------------------------------------------------------//
/*
Devuelve el total producido----------------------------------------------------
*/

function nTotProd( cNumParte, cDetPro )

   local nTotal := 0

   ( cDetPro )->( dbGoTop() )

   if ( cDetPro )->( dbSeek( cNumParte ) )

      while ( cDetPro )->cSerOrd + Str( ( cDetPro )->nNumOrd ) + ( cDetPro )->cSufOrd == cNumParte .and. !( cDetPro )->( Eof() )

         nTotal += ( NotCaja( ( cDetPro )->nCajOrd ) * ( cDetPro )->nUndOrd ) * ( cDetPro )->nImpOrd

         ( cDetPro )->( dbSkip() )

      end while

   end if

RETURN nTotal

//---------------------------------------------------------------------------//
/*
Devuelve el total materias primas----------------------------------------------
*/

function nTotMat( cNumParte, cDetMat )

   local nTotal := 0

   ( cDetMat )->( dbGoTop() )

   if ( cDetMat )->( dbSeek( cNumParte ) )

      while ( cDetMat )->cSerOrd + Str( ( cDetMat )->nNumOrd ) + ( cDetMat )->cSufOrd == cNumParte .and. !( cDetMat )->( Eof() )

         nTotal += ( NotCaja( ( cDetMat )->nCajOrd ) * ( cDetMat )->nUndOrd ) * ( cDetMat )->nImpOrd

         ( cDetMat )->( dbSkip() )

      end while

   end if

RETURN nTotal

//---------------------------------------------------------------------------//
/*
Devuelve el total de personal--------------------------------------------------
*/

function nTotPer( cNumParte, cDetHPer )

   local nTotal   := 0

   ( cDetHPer )->( dbGoTop() )

   if ( cDetHPer )->( dbSeek( cNumParte ) )

      while ( cDetHPer )->cSerOrd + Str( ( cDetHPer )->nNumOrd ) + ( cDetHPer )->cSufOrd == cNumParte .and. !( cDetHPer )->( Eof() )

         nTotal += ( cDetHPer )->nNumHra * ( cDetHPer )->nCosHra

         ( cDetHPer )->( dbSkip() )

      end while

   end if


Return nTotal

//---------------------------------------------------------------------------//
/*
Devuelve el total maquinas-----------------------------------------------------
*/

function nTotMaq( cNumParte, cDetMaq )

   local nTotal := 0

   ( cDetMaq )->( dbGoTop() )

   if ( cDetMaq )->( dbSeek( cNumParte ) )

      while ( cDetMaq )->cSerOrd + Str( ( cDetMaq )->nNumOrd ) + ( cDetMaq )->cSufOrd == cNumParte .and. !( cDetMaq )->( Eof() )

         nTotal += ( cDetMaq )->nTotHra * ( cDetMaq )->nCosHra

         ( cDetMaq )->( dbSkip() )

      end while

   end if

RETURN nTotal

//---------------------------------------------------------------------------//
/*
Devuelve el total del parte de producci�n--------------------------------------
*/

function nTotParte( cNumParte, cDetPro, cDetMat, cDetHPer, cDetMaq )

   local nToTal := 0

   nTotal   += nTotProd( cNumParte, cDetPro )
   nTotal   += nTotMat( cNumParte, cDetMat )
   nTotal   += nTotPer( cNumParte, cDetHPer )
   nTotal   += nTotMaq( cNumParte, cDetMaq )

RETURN nTotal

//---------------------------------------------------------------------------//

Function cNombreTipo( cCodTipo )

   local cNombreTipo := ""

   do case
      case cCodTipo == "PR"
         cNombreTipo := "Art�culos producidos"
      case cCodTipo == "MP"
         cNombreTipo := "Materias primas"
      case cCodTipo == "OP"
         cNombreTipo := "Operarios"
      case cCodTipo == "MQ"
         cNombreTipo := "Maquinaria"
   end case

RETURN ( cNombreTipo )

//---------------------------------------------------------------------------//

Function cTiempo( dFecIni, dFecFin, cHorIni, cHorFin )

Return cFormatoDDHHMM( nTiempoEntreFechas( dFecIni, dFecFin, cHorIni, cHorFin ) )

//---------------------------------------------------------------------------//

METHOD nTotalProducido( cDocumento )

   local nTotal   := 0
   local nRec     := ::oDetProduccion:oDbf:Recno()
   local nOrdAnt  := ::oDetProduccion:oDbf:OrdSetFocus( "cNumOrd" )

   ::oDetProduccion:oDbf:GoTop()

   while !::oDetProduccion:oDbf:Eof()

      if ::oDetProduccion:oDbf:cSerOrd + Str( ::oDetProduccion:oDbf:nNumOrd ) + ::oDetProduccion:oDbf:cSufOrd == cDocumento

         nTotal   += ( NotCaja( ::oDetProduccion:oDbf:nCajOrd ) * ::oDetProduccion:oDbf:nUndOrd ) * ::oDetProduccion:oDbf:nImpOrd

      end if

      ::oDetProduccion:oDbf:Skip()

   end while

   ::oDetProduccion:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetProduccion:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//

METHOD nTotalMaterial( cDocumento )

   local nTotal   := 0
   local nRec     := ::oDetMaterial:oDbf:Recno()
   local nOrdAnt  := ::oDetMaterial:oDbf:OrdSetFocus( "cNumOrd" )

   ::oDetMaterial:oDbf:GoTop()

   while !::oDetMaterial:oDbf:Eof()

      if ::oDetMaterial:oDbf:cSerOrd + Str( ::oDetMaterial:oDbf:nNumOrd ) + ::oDetMaterial:oDbf:cSufOrd == cDocumento

         nTotal   += ( NotCaja( ::oDetMaterial:oDbf:nCajOrd ) * ::oDetMaterial:oDbf:nUndOrd ) * ::oDetMaterial:oDbf:nImpOrd

      end if

      ::oDetMaterial:oDbf:Skip()

   end while

   ::oDetMaterial:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetMaterial:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//

METHOD nTotalPersonal( cDocumento )

   local nTotal   := 0
   local nRec     := ::oDetPersonal:oDbf:Recno()
   local nOrdAnt  := ::oDetPersonal:oDbf:OrdSetFocus( "cNumOrd" )
   local nRecLin  := ::oDetHorasPersonal:oDbf:Recno()
   local nOrdLin  := ::oDetHorasPersonal:oDbf:OrdSetFocus( "cNumTra" )

   ::oDetPersonal:oDbf:GoTop()
   ::oDetHorasPersonal:oDbf:GoTop()

   if ::oDetPersonal:oDbf:Seek( cDocumento )

      while ::oDetPersonal:oDbf:cSerOrd + Str( ::oDetPersonal:oDbf:nNumOrd ) + ::oDetPersonal:oDbf:cSufOrd == cDocumento .and. !::oDetPersonal:oDbf:Eof()

         if ::oDetHorasPersonal:oDbf:Seek( ::oDetPersonal:oDbf:cSerOrd + Str( ::oDetPersonal:oDbf:nNumOrd ) + ::oDetPersonal:oDbf:cSufOrd + ::oDetPersonal:oDbf:cCodTra )

            while ::oDetPersonal:oDbf:cSerOrd + Str( ::oDetPersonal:oDbf:nNumOrd ) + ::oDetPersonal:oDbf:cSufOrd + ::oDetPersonal:oDbf:cCodTra == ::oDetHorasPersonal:oDbf:cSerOrd + Str( ::oDetHorasPersonal:oDbf:nNumOrd ) + ::oDetHorasPersonal:oDbf:cSufOrd + ::oDetHorasPersonal:oDbf:cCodTra .and. ;
                  !::oDetHorasPersonal:oDbf:Eof()

                  nTotal   += ::oDetHorasPersonal:oDbf:nNumHra * ::oDetHorasPersonal:oDbf:nCosHra

               ::oDetHorasPersonal:oDbf:Skip()

            end while

         end if

         ::oDetPersonal:oDbf:Skip()

      end while

   end if

   ::oDetHorasPersonal:oDbf:OrdSetFocus( nOrdLin )
   ::oDetHorasPersonal:oDbf:GoTo( nRecLin )
   ::oDetPersonal:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetPersonal:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//

METHOD nTotalMaquina( cDocumento )

   local nTotal   := 0
   local nRec     := ::oDetMaquina:oDbf:Recno()
   local nOrdAnt  := ::oDetMaquina:oDbf:OrdSetFocus( "cNumOrd" )

   ::oDetMaquina:oDbf:GoTop()

   while !::oDetMaquina:oDbf:Eof()

      if ::oDetMaquina:oDbf:cSerOrd + Str( ::oDetMaquina:oDbf:nNumOrd ) + ::oDetMaquina:oDbf:cSufOrd == cDocumento

         nTotal   += ::oDetMaquina:oDbf:nTotHra * ::oDetMaquina:oDbf:nCosHra

      end if

      ::oDetMaquina:oDbf:Skip()

   end while

   ::oDetMaquina:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetMaquina:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//

METHOD nTotalOperario( cDocOpe )

   local nTotal   := 0
   local nRec     := ::oDetHorasPersonal:oDbf:Recno()
   local nOrdAnt  := ::oDetHorasPersonal:oDbf:OrdSetFocus( "cNumTra" )

   ::oDetHorasPersonal:oDbf:GoTop()

   if ::oDetHorasPersonal:oDbf:Seek( cDocOpe )

      while ::oDetHorasPersonal:oDbf:cSerOrd + Str( ::oDetHorasPersonal:oDbf:nNumOrd ) + ::oDetHorasPersonal:oDbf:cSufOrd + ::oDetHorasPersonal:oDbf:cCodTra == cDocOpe .and. !::oDetHorasPersonal:oDbf:Eof()

         nTotal   += ::oDetHorasPersonal:oDbf:nNumHra * ::oDetHorasPersonal:oDbf:nCosHra

         ::oDetHorasPersonal:oDbf:Skip()

      end while

   end if

   ::oDetHorasPersonal:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetHorasPersonal:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//

METHOD nTotalVolumen( cDocumento )

   local nTotal   := 0
   local nRec     := ::oDetProduccion:oDbf:Recno()
   local nOrdAnt  := ::oDetProduccion:oDbf:OrdSetFocus( "cNumOrd" )

   ::oDetProduccion:oDbf:GoTop()

   if ::oDetProduccion:oDbf:Seek( cDocumento )

      while ::oDetProduccion:oDbf:cSerOrd + Str( ::oDetProduccion:oDbf:nNumOrd ) + ::oDetProduccion:oDbf:cSufOrd == cDocumento .and.;
            !::oDetProduccion:oDbf:Eof()

         nTotal   += ( NotCaja( ::oDetProduccion:oDbf:nCajOrd ) * ::oDetProduccion:oDbf:nUndOrd ) * ::oDetProduccion:oDbf:nVolumen

         ::oDetProduccion:oDbf:Skip()

      end while

   end if

   ::oDetProduccion:oDbf:OrdSetFocus( nOrdAnt )
   ::oDetProduccion:oDbf:GoTo( nRec )

RETURN ( nTotal )

//---------------------------------------------------------------------------//
/*funcion para editar un parte desde fuera de la clase*/

function EditProduccion( cNumParte, oBrw )

   local oProduccion

   oProduccion    :=  TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      if oProduccion:oDbf:SeekInOrd( cNumParte, "cNumOrd" )

         oProduccion:Edit( oBrw )

      end if

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

return .t.

//---------------------------------------------------------------------------//
/*funcion para hacer zoom un parte desde fuera de la clase*/

function ZoomProduccion( cNumParte, oBrw )

   local oProduccion

   oProduccion    :=  TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      if oProduccion:oDbf:SeekInOrd( cNumParte, "cNumOrd" )

         oProduccion:Zoom( oBrw )

      end if

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

return .t.

//---------------------------------------------------------------------------//
/*funcion para eliminar un parte desde fuera de la clase*/

function DelProduccion( cNumParte, oBrw )

   local oProduccion

   oProduccion    :=  TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      if oProduccion:oDbf:SeekInOrd( cNumParte, "cNumOrd" )

         oProduccion:Del( oBrw )

      end if

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

return .t.

//---------------------------------------------------------------------------//
/*funcion para imprimir un parte desde fuera de la clase*/

function PrnProduccion( cNumParte )

   local oProduccion

   oProduccion    :=  TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      if oProduccion:oDbf:SeekInOrd( cNumParte, "cNumOrd" )

         oProduccion:GenParte( IS_PRINTER )

      end if

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

RETURN ( .t. )

//---------------------------------------------------------------------------//
/*
funcion para visualizar un parte desde fuera de la clase
*/

function VisProduccion( cNumParte )

   local oProduccion

   oProduccion    :=  TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      if oProduccion:oDbf:SeekInOrd( cNumParte, "cNumOrd" )

         oProduccion:GenParte( IS_SCREEN )

      end if

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

RETURN ( .t. )

//---------------------------------------------------------------------------//
#include "FastRepH.ch"

METHOD DataReport( oFr )

   /*
   Zona de datos------------------------------------------------------------
   */

   oFr:ClearDataSets()

   oFr:SetWorkArea(     "Producci�n", ::oDbf:nArea, .f., { FR_RB_CURRENT, FR_RB_CURRENT, 0 } )
   oFr:SetFieldAliases( "Producci�n", cObjectsToReport( ::oDbf ) )

   oFr:SetWorkArea(     "Lineas de producci�n", ::oDbfTemporal:nArea )
   oFr:SetFieldAliases( "Lineas de producci�n", cObjectsToReport( ::oDbfTemporal ) )

   oFr:SetWorkArea(     "Empresa", ::oDbfEmp:nArea )
   oFr:SetFieldAliases( "Empresa", cItemsToReport( aItmEmp() ) )

   oFr:SetWorkArea(     "Almacenes", ::oAlm:nArea )
   oFr:SetFieldAliases( "Almacenes", cItemsToReport( aItmAlm() ) )

   oFr:SetWorkArea(     "Secci�n", ::oSeccion:oDbf:nArea )
   oFr:SetFieldAliases( "Secci�n", cObjectsToReport( ::oSeccion:oDbf ) )

   oFr:SetWorkArea(     "Operaci�n", ::oOperacion:oDbf:nArea )
   oFr:SetFieldAliases( "Operaci�n", cObjectsToReport( ::oOperacion:oDbf ) )

   oFr:SetMasterDetail( "Producci�n", "Lineas de producci�n", {|| ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd } )
   oFr:SetMasterDetail( "Producci�n", "Empresa",              {|| cCodigoEmpresaEnUso() } )
   oFr:SetMasterDetail( "Producci�n", "Almacenes",            {|| ::oDbf:cAlmOrd } )
   oFr:SetMasterDetail( "Producci�n", "Secci�n",              {|| ::oDbf:cCodSec } )
   oFr:SetMasterDetail( "Producci�n", "Operaci�n",            {|| ::oDbf:cCodOpe } )

   oFr:SetResyncPair(   "Producci�n", "Lineas de producci�n" )
   oFr:SetResyncPair(   "Producci�n", "Empresa" )
   oFr:SetResyncPair(   "Producci�n", "Almacenes" )
   oFr:SetResyncPair(   "Producci�n", "Secci�n" )
   oFr:SetResyncPair(   "Producci�n", "Operaci�n" )

Return nil

//---------------------------------------------------------------------------//

METHOD VariableReport( oFr )

   oFr:DeleteCategory(  "Producci�n" )

   /*
   Creaci�n de variables----------------------------------------------------
   */

   oFr:AddVariable(     "Producci�n",   "Tiempo empleado",          "GetHbVar('cTiempoEmp')" )
   oFr:AddVariable(     "Producci�n",   "Total producido",          "GetHbVar('nProd')" )
   oFr:AddVariable(     "Producci�n",   "Total materias primas",    "GetHbVar('nMat')" )
   oFr:AddVariable(     "Producci�n",   "Total personal",           "GetHbVar('nPer')" )
   oFr:AddVariable(     "Producci�n",   "Total maquinaria",         "GetHbVar('nMaq')" )
   oFr:AddVariable(     "Producci�n",   "Total parte de trabajo",   "GetHbVar('nParte')" )

Return nil

//---------------------------------------------------------------------------//

METHOD DesignReportProducc( oFr, dbfDoc )

   if ::OpenFiles()

      ::CreateTemporal( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd )

      public cTiempoEmp    := cTiempo( ::oDbf:dFecOrd, ::oDbf:dFecFin, ::oDbf:cHorIni, ::oDbf:cHorFin )
      public nProd         := nTotProd( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetProduccion:oDbf:cAlias )
      public nMat          := nTotMat( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetMaterial:oDbf:cAlias )
      public nPer          := nTotPer( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetHorasPersonal:oDbf:cAlias )
      public nMaq          := nTotMaq( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetMaquina:oDbf:cAlias )
      public nParte        := nTotParte( ::oDbf:cSerOrd + Str( ::oDbf:nNumOrd ) + ::oDbf:cSufOrd, ::oDetProduccion:oDbf:cAlias, ::oDetMaterial:oDbf:cAlias, ::oDetHorasPersonal:oDbf:cAlias, ::oDetMaquina:oDbf:cAlias )

      /*
      Zona de datos------------------------------------------------------------
      */

      ::DataReport( oFr )

      /*
      Paginas y bandas---------------------------------------------------------
      */

      if !Empty( ( dbfDoc )->mReport )

         oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      else

         oFr:SetProperty(     "Report",            "ScriptLanguage", "PascalScript" )

         oFr:AddPage(         "MainPage" )

         oFr:AddBand(         "CabeceraDocumento", "MainPage", frxPageHeader )
         oFr:SetProperty(     "CabeceraDocumento", "Top", 0 )
         oFr:SetProperty(     "CabeceraDocumento", "Height", 200 )

         oFr:AddBand(         "CabeceraColumnas",  "MainPage", frxMasterData )
         oFr:SetProperty(     "CabeceraColumnas",  "Top", 200 )
         oFr:SetProperty(     "CabeceraColumnas",  "Height", 0 )
         oFr:SetProperty(     "CabeceraColumnas",  "StartNewPage", .t. )
         oFr:SetObjProperty(  "CabeceraColumnas",  "DataSet", "Producci�n" )

         oFr:AddBand(         "DetalleColumnas",   "MainPage", frxDetailData  )
         oFr:SetProperty(     "DetalleColumnas",   "Top", 230 )
         oFr:SetProperty(     "DetalleColumnas",   "Height", 28 )
         oFr:SetObjProperty(  "DetalleColumnas",   "DataSet", "Lineas de producci�n" )
         oFr:SetProperty(     "DetalleColumnas",   "OnMasterDetail", "DetalleOnMasterDetail" )

         oFr:AddBand(         "PieDocumento",      "MainPage", frxPageFooter )
         oFr:SetProperty(     "PieDocumento",      "Top", 930 )
         oFr:SetProperty(     "PieDocumento",      "Height", 110 )

      end if

      /*
      Zona de variables--------------------------------------------------------
      */

      ::VariableReport( oFr )

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

      ::oDbfTemporal:Zap()

      ::CloseFiles()

   else

      Return .f.

   end if

Return .t.

//---------------------------------------------------------------------------//

METHOD PrintReportProducc( nDevice, nCopies, cPrinter, dbfDoc )

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
   Zona de datos---------------------------------------------------------------
   */

   ::DataReport( oFr )

   /*
   Cargar el informe-----------------------------------------------------------
   */

   if !Empty( ( dbfDoc )->mReport )

      oFr:LoadFromBlob( ( dbfDoc )->( Select() ), "mReport")

      /*
      Zona de variables--------------------------------------------------------
      */

      ::VariableReport( oFr )

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

Function AppProduccion()

   local oProduccion

   oProduccion           := TProduccion():New( cPatEmp() )

   if oProduccion:OpenFiles()

      oProduccion:Append()

      oProduccion:CloseFiles()

   end if

   if oProduccion != nil
      oProduccion:End()
   end if

return .t.

//---------------------------------------------------------------------------//