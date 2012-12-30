#include "FiveWin.Ch"
#include "Font.ch"
#include "Factu.ch"
#include "MesDbf.ch"

//---------------------------------------------------------------------------//

CLASS TRenTPre FROM TInfTip

   DATA  lDesglose   AS LOGIC    INIT .t.
   DATA  lCosAct     AS LOGIC    INIT .f.
   DATA  oPreCliT    AS OBJECT
   DATA  oPreCliL    AS OBJECT
   DATA  oEstado     AS OBJECT
   DATA  oDbfTvta    AS OBJECT
   DATA  aEstado     AS ARRAY    INIT { "Pendiente", "Aceptado", "Todos" }

   METHOD Create()

   METHOD OpenFiles()

   METHOD CloseFiles()

   METHod lResource( cFld )

   METHOD lGenerate()


END CLASS

//---------------------------------------------------------------------------//

METHOD OpenFiles() CLASS TRenTPre

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   DATABASE NEW ::oDbfTvta PATH ( cPatDat() ) FILE "TVTA.DBF"     VIA ( cDriver() ) SHARED INDEX "TVTA.CDX"

   DATABASE NEW ::oPreCliT PATH ( cPatEmp() ) FILE "PRECLIT.DBF"  VIA ( cDriver() ) SHARED INDEX "PRECLIT.CDX"

   DATABASE NEW ::oPreCliL PATH ( cPatEmp() ) FILE "PRECLIL.DBF"  VIA ( cDriver() ) SHARED INDEX "PRECLIL.CDX"

   RECOVER

      msgStop( 'Imposible abrir todas las bases de datos' )
      ::CloseFiles()
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseFiles() CLASS TRenTPre

   if !Empty( ::oDbfTvta ) .and. ::oDbfTvta:Used()
      ::oDbfTvta:End()
   end if
   if !Empty( ::oPreCliT ) .and. ::oPreCliT:Used()
      ::oPreCliT:End()
   end if
   if !Empty( ::oPreCliL ) .and. ::oPreCliL:Used()
      ::oPreCliL:End()
   end if

   ::oDbfTvta := nil
   ::oPreCliT := nil
   ::oPreCliL := nil

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Create()

   ::RentCreateFields()

   ::AddTmpIndex( "CCODTIP", "CCODTIP + CCODART + CCODPR1 + CCODPR2 + CVALPR1 + CVALPR2 + CLOTE" )

   ::AddGroup( {|| ::oDbf:cCodTip }, {|| "Tipo art.  : " + Rtrim( ::oDbf:cCodTip ) + "-" + oRetFld( ::oDbf:cCodTip, ::oTipArt:oDbf, "cNomTip" ) }, {||"Total tipo art�culo..."}, , ::lSalto )
   ::AddGroup( {|| ::oDbf:cCodTip + ::oDbf:cCodArt }, {|| "Art�culo : " + Rtrim( ::oDbf:cCodArt ) + "-" + Rtrim( oRetFld( ::oDbf:cCodArt, ::oDbfArt ) ) }, {||"Total art�culo..."} )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHod lResource( cFld ) CLASS TRenTPre

   local cEstado := "Todos"

   if !::StdResource( "INFRENTIP" )
      return .f.
   end if

   /* Monta tipo de art�culos */

   if !::oDefTipInf( 110, 120, 130, 140, 910 )
      return .f.
   end if

   /*
   Monta los articulos de manera automatica
   */

   if !::lDefArtInf( 70, 80, 90, 100, 800 )
      return .f.
   end if

   ::oDefExcInf( 210 )
   ::oDefExcImp( 211 )
   ::oDefResInf()

   REDEFINE CHECKBOX ::lCosAct ;
      ID       ( 205 );
      OF       ::oFld:aDialogs[1]

   REDEFINE COMBOBOX ::oEstado ;
      VAR      cEstado ;
      ID       218 ;
      ITEMS    ::aEstado ;
      OF       ::oFld:aDialogs[1]

   REDEFINE CHECKBOX ::lDesglose ;
      ID       600 ;
      OF       ::oFld:aDialogs[1]

   ::CreateFilter( aItmPreCli(), ::oPreCliT:cAlias )

   ::bPreGenerate    := {|| ::NewGroup( ::lDesglose ) }
   ::bPostGenerate   := {|| ::QuiGroup( ::lDesglose ) }

RETURN .t.

//---------------------------------------------------------------------------//
/*
Esta funcion crea la base de datos para generar posteriormente el informe
*/

METHOD lGenerate() CLASS TRenTPre

   local cCodTip
   local nTotUni
   local nTotImpUni  := 0
   local nTotCosUni  := 0
   local cExpHead    := ""
   local cExpLine    := ""
   local nImpDtoAtp  := 0

   ::oDlg:Disable()
   ::oBtnCancel:Enable()
   ::oDbf:Zap()

   ::aHeader   := {  {|| "Fecha     : " + Dtoc( Date() ) },;
                     {|| "Periodo   : " + Dtoc( ::dIniInf )     + " > " + Dtoc( ::dFinInf ) },;
                     {|| "Tipo Art. : " + if( ::lAllTip, "Todos", AllTrim( ::cTipOrg )  + " > " + AllTrim( ::cTipDes ) ) },;
                     {|| "Art�culos : " + if( ::lAllArt, "Todos", AllTrim( ::cArtOrg )  + " > " + AllTrim( ::cArtDes ) ) },;
                     {|| "Estado    : " + ::aEstado[ ::oEstado:nAt ] } }

   ::oPreCliT:OrdSetFocus( "dFecPre" )
   ::oPreCliL:OrdSetFocus( "nNumPre" )

   do case
      case ::oEstado:nAt == 1
         cExpHead    := '!lEstado .and. dFecPre >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPre <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      case ::oEstado:nAt == 2
         cExpHead    := 'lEstado .and. dFecPre >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPre <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      case ::oEstado:nAt == 3
         cExpHead    := 'dFecPre >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPre <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   end case

   if !Empty( ::oFilter:cExpFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpFilter
   end if

   ::oPreCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPreCliT:cFile ), ::oPreCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:SetTotal( ::oPreCliT:OrdKeyCount() )

   /*
   Lineas de albaranes
   */

   cExpLine          := '!lTotLin .and. !lControl .and. !lKitChl'

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::cArtOrg + '" .and. cRef <= "' + ::cArtDes + '"'
   end if

   ::oPreCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPreCliL:cFile ), ::oPreCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oPreCliT:GoTop()

   while !::lBreak .and. !::oPreCliT:Eof()

      if lChkSer( ::oPreCliT:cSerPre, ::aSer )

         if ::oPreCliL:Seek( ::oPreCliT:cSerPre + Str( ::oPreCliT:nNumPre ) + ::oPreCliT:cSufPre )

            while ::oPreCliL:cSerPre + Str( ::oPreCliL:nNumPre ) + ::oPreCliL:cSufPre == ::oPreCliT:cSerPre + Str( ::oPreCliT:nNumPre ) + ::oPreCliT:cSufPre

               cCodTip := oRetFld( ::oPreCliL:cRef, ::oDbfArt , "cCodTip")

               if ( ::lAllTip .or. ( cCodTip >= ::cTipOrg .AND. cCodTip <= ::cTipDes ) )                 .AND.;
                  !( ::lExcCero .AND. nTotNPreCli( ::oPreCliL:cAlias ) == 0 )                            .AND.;
                  !( ::lExcImp .AND. nImpLPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut ) == 0 )

                  /*
                  Calculamos las cajas en vendidas entre dos fechas
                  */

                  nTotUni           := nTotNPreCli( ::oPreCliL:cAlias )
                  nTotImpUni        := nImpLPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut )
                  nImpDtoAtp        := nDtoAtpPreCli( ::oPreCliT:cAlias, ::oPreCliL:cAlias, ::nDecOut, ::nDerOut )

                  if ::lCosAct .or. ::oPreCliL:nCosDiv == 0
                     nTotCosUni     := nRetPreCosto( ::oDbfArt:cAlias, ::oPreCliL:cRef ) * nTotUni
                  else
                     nTotCosUni     := ::oPreCliL:nCosDiv * nTotUni
                  end if

                  ::oDbf:Append()

                  ::oDbf:cCodTip    := cCodTip

                  ::oDbf:cCodArt    := ::oPreCliL:cRef
                  ::oDbf:cNomArt    := ::oPreCliL:cDetalle
                  ::oDbf:cCodPr1    := ::oPreCliL:cCodPr1
                  ::oDbf:cNomPr1    := retProp( ::oPreCliL:cCodPr1 )
                  ::oDbf:cCodPr2    := ::oPreCliL:cCodPr2
                  ::oDbf:cNomPr2    := retProp( ::oPreCliL:cCodPr2 )
                  ::oDbf:cValPr1    := ::oPreCliL:cValPr1
                  ::oDbf:cNomVl1    := retValProp( ::oPreCliL:cCodPr1 + ::oPreCliL:cValPr1 )
                  ::oDbf:cValPr2    := ::oPreCliL:cValPr2
                  ::oDbf:cNomVl2    := retValProp( ::oPreCliL:cCodPr2 + ::oPreCliL:cValPr2 )
                  ::oDbf:cLote      := ::oPreCliL:cLote

                  ::AddCliente( ::oPreCliT:cCodCli, ::oPreCliT, .f. )

                  ::oDbf:nTotCaj    := ::oPreCliL:nCanEnt
                  ::oDbf:nTotUni    := nTotUni
                  ::oDbf:nTotPes    := ::oDbf:nTotUni * oRetFld( ::oPreCliL:cRef, ::oDbfArt, "nPesoKg" )
                  ::oDbf:nTotImp    := nTotImpUni
                  ::oDbf:nPreKgr    := if( ::oDbf:nTotPes != 0, ::oDbf:nTotImp / ::oDbf:nTotPes, 0 )
                  ::oDbf:nTotVol    := ::oDbf:nTotUni * oRetFld( ::oPreCliL:cRef, ::oDbfArt, "nVolumen" )
                  ::oDbf:nPreVol    := if( ::oDbf:nTotVol != 0, ::oDbf:nTotImp / ::oDbf:nTotVol, 0 )
                  ::oDbf:nTotCos    := nTotCosUni
                  ::oDbf:nMargen    := nTotImpUni - nTotCosUni
                  ::oDbf:nDtoAtp    := nImpDtoAtp

                  if nTotUni != 0 .and. nTotCosUni != 0
                     ::oDbf:nRentab := nRentabilidad( nTotImpUni, nImpDtoAtp, nTotCosUni )
                     ::oDbf:nPreMed := nTotImpUni / nTotUni
                     ::oDbf:nCosMed := nTotCosUni / nTotUni
                  else
                     ::oDbf:nRentab := 0
                     ::oDbf:nPreMed := 0
                     ::oDbf:nCosMed := 0
                  end if

                  ::oDbf:cNumDoc    := ::oPreCliL:cSerPre + "/" + Alltrim( Str( ::oPreCliL:nNumPre ) ) + "/" + ::oPreCliL:cSufPre

                  ::oDbf:Save()

               end if

               ::oPreCliL:Skip()

            end while

         end if

      end if

      ::oMtrInf:AutoInc()

      ::oPreCliT:Skip()

   end while

   ::oPreCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPreCliT:cFile ) )

   ::oPreCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPreCliL:cFile ) )

   ::oMtrInf:AutoInc( ::oPreCliT:Lastrec() )

   ::oDlg:Enable()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//