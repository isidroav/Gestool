#include "FiveWin.Ch"
#include "Font.ch"
#include "Factu.ch"
#include "MesDbf.ch"
//---------------------------------------------------------------------------//

CLASS OInfOPed FROM TPrvPgo

   DATA  lExcMov     AS LOGIC    INIT .f.
   DATA  oEstado     AS OBJECT
   DATA  oPedPrvT    AS OBJECT
   DATA  oPedPrvL    AS OBJECT
   DATA  aEstado     AS ARRAY    INIT  { "Pendiente", "Parcilamente", "Entregado", "Todos" }

   METHOD Create()

   METHOD OpenFiles()

   METHOD CloseFiles()

   METHOD lResource( cFld )

   METHOD lGenerate()

END CLASS

//---------------------------------------------------------------------------//

METHOD Create()

   ::CreateFields()

   ::AddTmpIndex( "cCodPgo", "cCodPgo + cCodArt" )
   ::AddGroup( {|| ::oDbf:cCodPgo }, {|| "For. pago : " + Rtrim( ::oDbf:cCodPgo ) + "-" + Rtrim( ::oDbf:cNomPgo ) }, {||"Total forma de pago..."}, , ::lSalto )
   ::AddGroup( {|| ::oDbf:cCodPgo + ::oDbf:cCodArt },    {|| "Art�culo : " + Rtrim( ::oDbf:cCodArt ) + "-" + Rtrim( oRetFld( ::oDbf:cCodArt, ::oDbfArt ) ) }, {|| Space(1) } )

RETURN ( self )

//---------------------------------------------------------------------------//

METHOD OpenFiles()

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   DATABASE NEW ::oPedPrvT PATH ( cPatEmp() ) FILE "PEDPROVT.DBF" VIA ( cDriver() ) SHARED INDEX "PEDPROVT.CDX"

   DATABASE NEW ::oPedPrvL PATH ( cPatEmp() ) FILE "PEDPROVL.DBF" VIA ( cDriver() ) SHARED INDEX "PEDPROVL.CDX"

   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      ::CloseFiles()
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseFiles()

   if !Empty( ::oPedPrvT ) .and. ::oPedPrvT:Used()
      ::oPedPrvT:End()
   end if
   if !Empty( ::oPedPrvL ) .and. ::oPedPrvL:Used()
      ::oPedPrvL:End()
   end if

   ::oPedPrvT := nil
   ::oPedPrvL := nil

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD lResource( cFld )

   local cEstado := "Todos"

   if !::StdResource( "INF_GEN25C" )
      return .f.
   end if

   /* Monta forma de pago */

   if !::oDefFpgInf( 1450, 1451, 1460, 1461, 920 )
      return .f.
   end if

   /*
   Monta los articulos de manera automatica
   */

   if !::lDefArtInf( 1470, 1471, 1480, 1481, 800 )
      return .f.
   end if

   /* Meter */

   ::oMtrInf:SetTotal( ::oPedPrvT:Lastrec() )

   REDEFINE COMBOBOX ::oEstado ;
      VAR      cEstado ;
      ID       1490 ;
      ITEMS    ::aEstado ;
      OF       ::oFld:aDialogs[1]

   ::CreateFilter( aItmPedPrv(), ::oPedPrvT:cAlias )

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

   ::aHeader      := {  {|| "Fecha     : " + Dtoc( Date() ) },;
                        {|| "Periodo   : " + Dtoc( ::dIniInf )   + " > " + Dtoc( ::dFinInf ) },;
                        {|| "F. Pago   : " + if( ::lAllFpg, "Todos", AllTrim( ::cFpgDes ) + " > " + AllTrim( ::cFpgHas ) ) },;
                        {|| "Art�culos : " + if( ::lAllArt, "Todos", AllTrim( ::cArtOrg ) + " > " + AllTrim( ::cArtDes ) ) },;
                        {|| "Estado    : " + ::aEstado[ ::oEstado:nAt ] } }

   ::oPedPrvT:OrdSetFocus( "dFecPed" )
   ::oPedPrvL:OrdSetFocus( "nNumPed" )

   do case
      case ::oEstado:nAt == 1
         cExpHead    := 'nEstado == 1 .and. dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      case ::oEstado:nAt == 2
         cExpHead    := 'nEstado == 2 .and. dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      case ::oEstado:nAt == 3
         cExpHead    := 'nEstado == 3 .and. dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
      case ::oEstado:nAt == 4
         cExpHead    := 'dFecPed >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecPed <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'
   end case

   if !::lAllFpg
      cExpLine       += ' .and. cCodPgo >= "' + ::cFpgDes + '" .and. cCodPgo <= "' + ::cFpgHas + '"'
   end if

   if !Empty( ::oFilter:cExpFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpFilter
   end if

   ::oPedPrvT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedPrvT:cFile ), ::oPedPrvT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:SetTotal( ::oPedPrvT:OrdKeyCount() )

   if !::lAllArt
      cExpLine       := 'cRef >= "' + ::cArtOrg + '" .and. cRef <= "' + ::cArtDes + '"'
   else
      cExpLine       := '.t.'
   end if

   ::oPedPrvL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedPrvL:cFile ), ::oPedPrvL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   ::oPedPrvT:GoTop()

   while !::lBreak .and. !::oPedPrvT:Eof()

      if lChkSer( ::oPedPrvT:cSerPed, ::aSer )

         if ::oPedPrvL:Seek( ::oPedPrvT:cSerPed + Str( ::oPedPrvT:nNumPed ) + ::oPedPrvT:cSufPed )

            while ::oPedPrvT:cSerPed + Str( ::oPedPrvT:nNumPed ) + ::oPedPrvT:cSufPed == ::oPedPrvL:cSerPed + Str( ::oPedPrvL:nNumPed ) + ::oPedPrvL:cSufPed .AND. ! ::oPedPrvL:eof()

               if !( ::lExcCero .AND. nImpLPedPrv( ::oPedPrvT:cAlias, ::oPedPrvL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

                  ::AddPed ( .f. )

               end if

               ::oPedPrvL:Skip()

            end while

         end if

      end if

      ::oPedPrvT:Skip()

      ::oMtrInf:AutoInc( ::oPedPrvT:OrdKeyNo() )

   end while

   ::oMtrInf:AutoInc( ::oPedPrvT:Lastrec() )

   ::oPedPrvT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedPrvT:cFile ) )

   ::oPedPrvL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedPrvL:cFile ) )

   ::oDlg:Enable()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//