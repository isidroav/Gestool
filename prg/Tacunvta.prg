#include "FiveWin.Ch"
#include "Font.ch"
#include "Factu.ch" 
#include "MesDbf.ch"

//---------------------------------------------------------------------------//

CLASS TAcuNVta FROM TInfPAge

   DATA  oTikCliT    AS OBJECT
   DATA  oTikCliL    AS OBJECT
   DATA  oAlbCliT    AS OBJECT
   DATA  oAlbCliL    AS OBJECT
   DATA  oFacCliT    AS OBJECT
   DATA  oFacCliL    AS OBJECT
   DATA  oFacRecT    AS OBJECT
   DATA  oFacRecL    AS OBJECT
   DATA  oDbfArt     AS OBJECT
   DATA  oDbfTVta    AS OBJECT
   DATA  lTvta       AS LOGIC    INIT .f.
   DATA  oIva        AS OBJECT
   DATA  cTipVen     AS CHARACTER
   DATA  cTipVen2    AS CHARACTER

   METHOD Create ()

   METHOD OpenFiles()

   METHOD CloseFiles()

   METHOD lResource( cFld )

   METHOD lGenerate()

END CLASS

//---------------------------------------------------------------------------//

METHOD Create()

   ::AcuCreate()

   ::AddTmpIndex( "cCodAge", "cCodAge" )

RETURN ( self )

//---------------------------------------------------------------------------//

METHOD OpenFiles()

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   DATABASE NEW ::oTikCliT PATH ( cPatEmp() ) FILE "TIKET.DBF"    VIA ( cDriver() ) SHARED INDEX "TIKET.CDX"

   DATABASE NEW ::oTikCliL PATH ( cPatEmp() ) FILE "TIKEL.DBF"    VIA ( cDriver() ) SHARED INDEX "TIKEL.CDX"

   ::oAlbCliT := TDataCenter():oAlbCliT()

   DATABASE NEW ::oAlbCliL PATH ( cPatEmp() ) FILE "ALBCLIL.DBF"  VIA ( cDriver() ) SHARED INDEX "ALBCLIL.CDX"

   ::oFacCliT := TDataCenter():oFacCliT()

   DATABASE NEW ::oFacCliL PATH ( cPatEmp() ) FILE "FACCLIL.DBF"  VIA ( cDriver() ) SHARED INDEX "FACCLIL.CDX"

   DATABASE NEW ::oFacRecT PATH ( cPatEmp() ) FILE "FACRECT.DBF"  VIA ( cDriver() ) SHARED INDEX "FACRECT.CDX"

   DATABASE NEW ::oFacRecL PATH ( cPatEmp() ) FILE "FACRECL.DBF"  VIA ( cDriver() ) SHARED INDEX "FACRECL.CDX"

   DATABASE NEW ::oDbfArt  PATH ( cPatArt() ) FILE "ARTICULO.DBF" VIA ( cDriver() ) SHARED INDEX "ARTICULO.CDX"

   DATABASE NEW ::oDbfTvta PATH ( cPatDat() ) FILE "TVTA.DBF"     VIA ( cDriver() ) SHARED INDEX "TVTA.CDX"

   DATABASE NEW ::oIva PATH ( cPatDat () )    FILE "TIVA.DBF"     VIA ( cDriver() ) SHARED INDEX "TIVA.CDX"

   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      ::CloseFiles()
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseFiles()

   if !Empty( ::oTikCliT ) .and. ::oTikCliT:Used()
      ::oTikCliT:End()
   end if
   if !Empty( ::oTikCliL ) .and. ::oTikCliL:Used()
      ::oTikCliL:End()
   end if
   if !Empty( ::oFacCliT ) .and. ::oFacCliT:Used()
      ::oFacCliT:End()
   end if
   if !Empty( ::oFacCliL ) .and. ::oFacCliL:Used()
      ::oFacCliL:End()
   end if
   if !Empty( ::oFacRecT ) .and. ::oFacRecT:Used()
      ::oFacRecT:End()
   end if
   if !Empty( ::oFacRecL ) .and. ::oFacRecL:Used()
      ::oFacRecL:End()
   end if
   if !Empty( ::oAlbCliT ) .and. ::oAlbCliT:Used()
      ::oAlbCliT:End()
   end if
   if !Empty( ::oAlbCliL ) .and. ::oAlbCliL:Used()
      ::oAlbCliL:End()
   end if
   if !Empty( ::oDbfArt ) .and. ::oDbfArt:Used()
      ::oDbfArt:End()
   end if
   if !Empty( ::oDbfTVta ) .and. ::oDbfTVta:Used()
      ::oDbfTVta:End()
   end if
   if !Empty( ::oIva ) .and. ::oIva:Used()
      ::oIva:End()
   end if

   ::oTikCliT := nil
   ::oTikCliL := nil
   ::oFacCliT := nil
   ::oFacCliL := nil
   ::oAlbCliT := nil
   ::oAlbCliL := nil
   ::oDbfArt  := nil
   ::oDbfTVta := nil
   ::oIva     := nil

RETURN ( Self )

//---------------------------------------------------------------------------//

METHod lResource( cFld )

   local oTipVen
   local oTipVen2
   local This        := Self

   if !::StdResource( "INFACUAGER" )
      return .f.
   end if

   ::CreateFilter( , ::oDbf, .t. )

   if !::oDefAgeInf( 70, 80, 90, 100, 930 )
      return .f.
   end if

   REDEFINE CHECKBOX ::lTvta ;
      ID       260 ;
      OF       ::oFld:aDialogs[1]

   REDEFINE GET oTipVen VAR ::cTipVen ;
      VALID    ( cTVta( oTipVen, This:oDbfTvta:cAlias, oTipVen2 ) ) ;
      BITMAP   "LUPA" ;
      ON HELP  ( BrwTVta( oTipVen, This:oDbfTVta:cAlias, oTipVen2 ) ) ;
      ID       270 ;
      OF       ::oFld:aDialogs[1]

   REDEFINE GET oTipVen2 VAR ::cTipVen2 ;
      ID       280 ;
      WHEN     ( .F. ) ;
      COLOR    CLR_GET ;
      OF       ::oFld:aDialogs[1]

   ::oDefExcInf( 210 )
   ::oDefExcImp( 211 )

RETURN .t.

//---------------------------------------------------------------------------//
/*
Esta funcion crea la base de datos para generar posteriormente el informe
*/

METHOD lGenerate()

   local cExpHead := ""
   local cExpLine := ""

   ::oDlg:Disable()
   ::oBtnCancel:Enable()
   ::oDbf:Zap()

   ::aHeader      := {  {|| "Fecha   : " + Dtoc( Date() ) },;
                        {|| "Periodo : " + Dtoc( ::dIniInf ) + " > " + Dtoc( ::dFinInf ) },;
                        {|| "Agentes : "   + ::cAgeOrg         + " > " + ::cAgeDes },;
                        {|| if ( ::lTvta, (if (!Empty( ::cTipVen ), "Tipo de Venta: " + ::cTipVen2, "Tipo de Venta: Todos" ) ), "Tipo de Venta: Ninguno" ) },;
                        {|| if( ::lTvta, "Aplicando comportamiento de los tipos de venta", "" ) } }

   ::oAlbCliT:OrdSetFocus( "dFecAlb" )
   ::oAlbCliL:OrdSetFocus( "nNumAlb" )

   cExpHead          := 'nFacturado < 3 .and. dFecAlb >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecAlb <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

   if !::lAgeAll
      cExpHead       += ' .and. cCodAge >= "' + Rtrim( ::cAgeOrg ) + '" .and. cCodAge <= "' + Rtrim( ::cAgeDes ) + '"'
   end if

   if !Empty( ::oFilter:cExpresionFilter ) 
      cExpHead       += ' .and. ' + ::oFilter:cExpresionFilter
   end if

   ::oAlbCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbCliT:cFile ), ::oAlbCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText := "Procesando albaranes"
   ::oMtrInf:SetTotal( ::oAlbCliT:OrdKeyCount() )

   cExpLine          := '!lTotLin .and. !lControl'

   ::oAlbCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oAlbCliL:cFile ), ::oAlbCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oAlbCliT:GoTop()

   while !::lBreak .and. !::oAlbCliT:Eof()

     if lChkSer( ::oAlbCliT:cSerAlb, ::aSer ) .and. ::oAlbCliL:Seek( ::oAlbCliT:cSerAlb + Str( ::oAlbCliT:nNumAlb ) + ::oAlbCliT:cSufAlb )

        while ::oAlbCliT:cSerAlb + Str( ::oAlbCliT:nNumAlb ) + ::oAlbCliT:cSufAlb == ::oAlbCliL:cSerAlb + Str( ::oAlbCliL:nNumAlb ) + ::oAlbCliL:cSufAlb .AND. ! ::oAlbCliL:eof()

           if !( ::lExcCero .and. nTotNAlbCli( ::oAlbCliL:cAlias ) == 0 ) .and.;
              !( ::lExcImp .and. nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

              if ::lTvta

                 if  ( if (!Empty( ::cTipVen ), ::oAlbCliL:cTipMov == ::cTipVen, .t. ) )

                    if !::oDbf:Seek( ::oAlbCliT:cCodAge )

                        ::oDbf:Append()

                        ::oDbf:cCodAge    := ::oAlbCliT:cCodAge
                        if ( ::oDbfAge:Seek (::oAlbCliT:cCodAge) )
                           ::oDbf:cNomAge := AllTrim ( ::oDbfAge:cApeAge ) + ", " + AllTrim ( ::oDbfAge:cNbrAge )
                        end if

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni := nTotNAlbCli( ::oAlbCliL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni := -nTotNAlbCli( ::oAlbCliL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni := 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot := 0
                           ::oDbf:nTotCom := 0
                        else
                           ::oDbf:nImpTot := nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom := nComLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    := nTotUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    := nTrnUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    := nPntUAlbCli( ::oAlbCliL:cAlias, ::nDecPnt, ::nValDiv )
                        ::oDbf:nIvaTot    := nIvaLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    := ::oDbf:nImpTot + ::oDbf:nIvaTot
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni

                        ::AcuPesVol( ::oAlbCliL:cRef, nTotNAlbCli( ::oAlbCliL ), ::oDbf:nImpTot, .f. )

                        ::oDbf:Save()
                     else

                        ::oDbf:Load()

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni += nTotNAlbCli( ::oAlbCliL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni += -nTotNAlbCli( ::oAlbCliL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni += 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot += 0
                           ::oDbf:nTotCom += 0
                        else
                           ::oDbf:nImpTot += nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom += nComLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    += nTotUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    += nTrnUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    += nPntUAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni
                        ::oDbf:nIvaTot    += nIvaLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    += nImpLAlbCli( ::oAlbCliT:cAlias, ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv, , , .t., .t.  )
                        ::oDbf:nTotFin    += nIvaLAlbCli( ::oAlbCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                        ::AcuPesVol( ::oAlbCliL:cRef, nTotNAlbCli( ::oAlbCliL ), ::oDbf:nImpTot, .t. )

                        ::oDbf:Save()

                     end if


                 end if

                 /*
                 Pasamos de los tipos de ventas
                 */

              else

               ::AddAlb( .t. )

              end if

           end if

           ::oAlbCliL:Skip()

        end while

     end if

     ::oAlbCliT:Skip()

     ::oMtrInf:AutoInc()

   end while

   ::oAlbCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbCliT:cFile ) )
   ::oAlbCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oAlbCliL:cFile ) )

   ::oFacCliT:OrdSetFocus( "dFecFac" )
   ::oFacCliL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

   if !::lAgeAll
      cExpHead       += ' .and. cCodAge >= "' + Rtrim( ::cAgeOrg ) + '" .and. cCodAge <= "' + Rtrim( ::cAgeDes ) + '"'
   end if

   if !Empty( ::oFilter:cExpresionFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpresionFilter
   end if

   ::oFacCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacCliT:cFile ), ::oFacCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText := "Procesando facturas"
   ::oMtrInf:SetTotal( ::oFacCliT:OrdKeyCount() )

   cExpLine          := '!lTotLin .and. !lControl'

   ::oFacCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacCliL:cFile ), ::oFacCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oFacCliT:GoTop()

   while !::lBreak .and. !::oFacCliT:Eof()

     if lChkSer( ::oFacCliT:cSerie, ::aSer ) .and. ::oFacCliL:Seek( ::oFacCliT:cSerie + Str( ::oFacCliT:nNumFac ) + ::oFacCliT:cSufFac )

        while ::oFacCliT:cSerie + Str( ::oFacCliT:nNumFac ) + ::oFacCliT:cSufFac == ::oFacCliL:cSerie + Str( ::oFacCliL:nNumFac ) + ::oFacCliL:cSufFac .AND. ! ::oFacCliL:eof()

           if !( ::lExcCero .AND. nTotNFacCli( ::oFacCliL:cAlias ) == 0 ) .and.;
              !( ::lExcImp .AND. nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

              if ::lTvta

                 if  ( if (!Empty( ::cTipVen ), ::oFacCliL:cTipMov == ::cTipVen, .t. ) )

                    if !::oDbf:Seek( ::oFacCliT:cCodAge )

                        ::oDbf:Append()

                        ::oDbf:cCodAge    := ::oFacCliT:cCodAge
                        if ( ::oDbfAge:Seek (::oFacCliT:cCodAge) )
                           ::oDbf:cNomAge := AllTrim ( ::oDbfAge:cApeAge ) + ", " + AllTrim ( ::oDbfAge:cNbrAge )
                        end if

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni := nTotNFacCli( ::oFacCliL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni := -nTotNFacCli( ::oFacCliL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni := 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot := 0
                           ::oDbf:nTotCom := 0
                        else
                           ::oDbf:nImpTot := nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom := nComLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    := nImpUFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    := nTrnUFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    := nPntUFacCli( ::oFacCliL:cAlias, ::nDecPnt, ::nValDiv )
                        ::oDbf:nIvaTot    := nIvaLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    := ::oDbf:nImpTot + ::oDbf:nIvaTot
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni

                        ::AcuPesVol( ::oFacCliL:cRef, nTotNFacCli( ::oFacCliL ), ::oDbf:nImpTot, .f. )

                        ::oDbf:Save()
                     else

                        ::oDbf:Load()

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni += nTotNFacCli( ::oFacCliL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni += -nTotNFacCli( ::oFacCliL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni += 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot += 0
                           ::oDbf:nTotCom += 0
                        else
                           ::oDbf:nImpTot += nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom += nComLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    += nImpUFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    += nTrnUFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    += nPntUFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni
                        ::oDbf:nIvaTot    += nIvaLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    += nImpLFacCli( ::oFacCliT:cAlias, ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    += nIvaLFacCli( ::oFacCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                        ::AcuPesVol( ::oFacCliL:cRef, nTotNFacCli( ::oFacCliL ), ::oDbf:nImpTot, .t. )

                        ::oDbf:Save()

                     end if

                 end if

                 /*
                 Pasamos de los tipos de ventas
                 */

              else

               ::AddFac( .t. )

              end if

           end if

           ::oFacCliL:Skip()

        end while

     end if

     ::oFacCliT:Skip()

     ::oMtrInf:AutoInc()

   end while

   ::oFacCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacCliT:cFile ) )
   ::oFacCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacCliL:cFile ) )

   ::oFacRecT:OrdSetFocus( "dFecFac" )
   ::oFacRecL:OrdSetFocus( "nNumFac" )

   cExpHead          := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

   if !::lAgeAll
      cExpHead       += ' .and. cCodAge >= "' + Rtrim( ::cAgeOrg ) + '" .and. cCodAge <= "' + Rtrim( ::cAgeDes ) + '"'
   end if

   if !Empty( ::oFilter:cExpresionFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpresionFilter 
   end if

   ::oFacRecT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacRecT:cFile ), ::oFacRecT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText := "Procesando fac. rec."
   ::oMtrInf:SetTotal( ::oFacRecT:OrdKeyCount() )

   cExpLine          := '!lTotLin .and. !lControl'

   ::oFacRecL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oFacRecL:cFile ), ::oFacRecL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oFacRecT:GoTop()

   while !::lBreak .and. !::oFacRecT:Eof()

     if lChkSer( ::oFacRecT:cSerie, ::aSer ) .and. ::oFacRecL:Seek( ::oFacRecT:cSerie + Str( ::oFacRecT:nNumFac ) + ::oFacRecT:cSufFac )

        while ::oFacRecT:cSerie + Str( ::oFacRecT:nNumFac ) + ::oFacRecT:cSufFac == ::oFacRecL:cSerie + Str( ::oFacRecL:nNumFac ) + ::oFacRecL:cSufFac .AND. ! ::oFacRecL:eof()

           if !( ::lExcCero .AND. nTotNFacRec( ::oFacRecL:cAlias ) == 0 ) .and.;
              !( ::lExcImp .AND. nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

              if ::lTvta

                 if  ( if (!Empty( ::cTipVen ), ::oFacRecL:cTipMov == ::cTipVen, .t. ) )

                    if !::oDbf:Seek( ::oFacRecT:cCodAge )

                        ::oDbf:Append()

                        ::oDbf:cCodAge    := ::oFacRecT:cCodAge
                        if ( ::oDbfAge:Seek (::oFacRecT:cCodAge) )
                           ::oDbf:cNomAge := AllTrim ( ::oDbfAge:cApeAge ) + ", " + AllTrim ( ::oDbfAge:cNbrAge )
                        end if

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni := nTotNFacRec( ::oFacRecL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni := -nTotNFacRec( ::oFacRecL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni := 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot := 0
                           ::oDbf:nTotCom := 0
                        else
                           ::oDbf:nImpTot := nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom := nComLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    := nImpUFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    := nTrnUFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    := nPntUFacRec( ::oFacRecL:cAlias, ::nDecPnt, ::nValDiv )
                        ::oDbf:nIvaTot    := nIvaLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    := ::oDbf:nImpTot + ::oDbf:nIvaTot
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni

                        ::AcuPesVol( ::oFacRecL:cRef, nTotNFacRec( ::oFacRecL ), ::oDbf:nImpTot, .f. )

                        ::oDbf:Save()
                     else

                        ::oDbf:Load()

                        if ::oDbfTvta:nUndMov == 1
                           ::oDbf:nNumUni += nTotNFacRec( ::oFacRecL )
                        elseif ::oDbfTvta:nUndMov == 2
                           ::oDbf:nNumUni += -nTotNFacRec( ::oFacRecL )
                        elseif ::oDbfTvta:nUndMov == 3
                           ::oDbf:nNumUni += 0
                        end if

                        if ::oDbfTvta:nImpMov == 3
                           ::oDbf:nImpTot += 0
                           ::oDbf:nTotCom += 0
                        else
                           ::oDbf:nImpTot += nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut )
                           ::oDbf:nTotCom += nComLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut )
                        end if

                        ::oDbf:nImpArt    += nImpUFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nImpTrn    += nTrnUFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPntVer    += nPntUFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nValDiv )
                        ::oDbf:nPreMed    := ::oDbf:nImpTot / ::oDbf:nNumUni
                        ::oDbf:nIvaTot    += nIvaLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    += nImpLFacRec( ::oFacRecT:cAlias, ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )
                        ::oDbf:nTotFin    += nIvaLFacRec( ::oFacRecL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv )

                        ::AcuPesVol( ::oFacRecL:cRef, nTotNFacRec( ::oFacRecL ), ::oDbf:nImpTot, .t. )

                        ::oDbf:Save()

                     end if

                 end if

                 /*
                 Pasamos de los tipos de ventas
                 */

              else

               ::AddFacRecVta( .t. )

              end if

           end if

           ::oFacRecL:Skip()

        end while

     end if

     ::oFacRecT:Skip()

     ::oMtrInf:AutoInc()

   end while

   ::oFacRecT:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacRecT:cFile ) )
   ::oFacRecL:IdxDelete( cCurUsr(), GetFileNoExt( ::oFacRecL:cFile ) )

   ::oTikCliT:OrdSetFocus( "dFecTik" )
   ::oTikCliL:OrdSetFocus( "cNumTil" )

   cExpHead          := 'dFecTik >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecTik <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

   cExpHead          += ' .and. ( cTipTik == "1" .or. cTipTik == "4" )'

   if !::lAgeAll
      cExpHead       += ' .and. cCodAge >= "' + Rtrim( ::cAgeOrg ) + '" .and. cCodAge <= "' + Rtrim( ::cAgeDes ) + '"'
   end if

   if !Empty( ::oFilter:cExpresionFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpresionFilter 
   end if

   ::oTikCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oTikCliT:cFile ), ::oTikCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText := "Procesando tickets"
   ::oMtrInf:SetTotal( ::oTikCliT:OrdKeyCount() )

   cExpLine          := '!lControl'

   ::oTikCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oTikCliL:cFile ), ::oTikCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oTikCliT:GoTop()

   while !::lBreak .and. !::oTikCliT:Eof()

      if lChkSer( ::oTikCliT:cSerTik, ::aSer ) .and. ::oTikCliL:Seek( ::oTikCliT:cSerTik + ::oTikCliT:cNumTik + ::oTikCliT:cSufTik )

         while ::oTikCliT:cSerTik + ::oTikCliT:cNumTik + ::oTikCliT:cSufTik == ::oTikCliL:cSerTil + ::oTikCliL:cNumTil + ::oTikCliL:cSufTil .and. !::oTikCliL:Eof()

            if !Empty( ::oTikCliL:cCbaTil )                       .AND.;
               !( ::lExcCero .AND. ::oTikCliL:nUntTil == 0 )      .AND.;
               !( ::lExcImp .AND. ::oTikCliL:nPvpTil == 0 )

               ::AddTik( ::oTikCliL:cCbaTil, 1, .t. )

            end if

            if !Empty( ::oTikCliL:cComTil )                       .AND.;
               !( ::lExcCero .AND. ::oTikCliL:nUntTil == 0 )      .AND.;
               !( ::lExcImp .AND. ::oTikCliL:nPcmTil == 0 )

               ::AddTik( ::oTikCliL:cComTil, 2, .t. )

            end if

            ::oTikCliL:Skip()

         end while

      end if

      ::oTikCliT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oMtrInf:AutoInc( ::oTikCliT:Lastrec() )

   ::oTikCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oTikCliT:cFile ) )
   ::oTikCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oTikCliL:cFile ) )

   if !::lExcCero
      ::IncluyeCero()
   end if

   ::oDlg:Enable()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//