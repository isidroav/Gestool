#include "FiveWin.Ch"
#include "Font.ch"
#include "Factu.ch"
#include "MesDbf.ch"

//---------------------------------------------------------------------------//

CLASS TAcuGPed FROM TInfGrp

   DATA  lExcMov     AS LOGIC    INIT .f.
   DATA  oPedCliT    AS OBJECT
   DATA  oPedCliL    AS OBJECT
   DATA  oDbfTvta    AS OBJECT
   DATA  oEstado     AS OBJECT
   DATA  aEstado     AS ARRAY    INIT  { "Pendiente", "Parcialmente", "Entregado", "Todos" }

   METHOD Create ()

   METHOD OpenFiles()

   METHOD CloseFiles()

   METHOD lResource( cFld )

   METHOD lGenerate()

END CLASS

//---------------------------------------------------------------------------//
/*Creamos la temporal, los ordenes y los grupos*/

METHOD Create ()

   ::AcuCreate()

   ::AddTmpIndex( "cGrpFam", "cGrpFam" )

RETURN ( self )

//---------------------------------------------------------------------------//
/*Abrimos las tablas necesarias*/

METHOD OpenFiles() CLASS TAcuGPed

   local lOpen    := .t.
   local oBlock   := ErrorBlock( {| oError | ApoloBreak( oError ) } )

   BEGIN SEQUENCE

   DATABASE NEW ::oPedCliT PATH ( cPatEmp() ) FILE "PEDCLIT.DBF"  VIA ( cDriver() ) SHARED INDEX "PEDCLIT.CDX"

   DATABASE NEW ::oPedCliL PATH ( cPatEmp() ) FILE "PEDCLIL.DBF"  VIA ( cDriver() ) SHARED INDEX "PEDCLIL.CDX"

   DATABASE NEW ::oDbfTvta PATH ( cPatDat() ) FILE "TVTA.DBF"     VIA ( cDriver() ) SHARED INDEX "TVTA.CDX"

   RECOVER

      msgStop( "Imposible abrir todas las bases de datos" )
      ::CloseFiles()
      lOpen          := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//
/*Cerramos las tablas abiertas anteriormente*/

METHOD CloseFiles() CLASS TAcuGPed

   if !Empty( ::oPedCliT ) .and. ::oPedCliT:Used()
      ::oPedCliT:End()
   end if
   if !Empty( ::oPedCliL ) .and. ::oPedCliL:Used()
      ::oPedCliL:End()
   end if
   if !Empty( ::oDbfTvta ) .and. ::oDbfTvta:Used()
      ::oDbfTvta:End()
   end if

   ::oPedCliT := nil
   ::oPedCliL := nil
   ::oDbfTvta := nil

RETURN ( Self )

//---------------------------------------------------------------------------//
/*Se montan los recursos*/

METHOD lResource( cFld ) CLASS TAcuGPed

   local cEstado  := "Todos"

   if !::StdResource( "INFDETGRP" )
      return .f.
   end if

   /*Se montan los desde - hasta*/

   if !::oDefGrFInf( 110, 120, 130, 140, 900 )
      return .f.
   end if

   if !::lDefArtInf( 150, 160, 170, 180, 800 )
      return .f.
   end if

   if !::oDefCliInf( 710, 720, 730, 740, , 700 )
      return .f.
   end if

   /*Check para no dejar pasar las l�neas con precio 0*/

   ::oDefExcInf()

   /*Definimos el combo con los tipos de presupuesto*/

   REDEFINE COMBOBOX ::oEstado ;
      VAR      cEstado ;
      ID       218 ;
      ITEMS    ::aEstado ;
      OF       ::oFld:aDialogs[1]

   /*Damos valor al meter*/

   ::oMtrInf:SetTotal( ::oPedCliT:Lastrec() )

   ::CreateFilter( aItmPedCli(), ::oPedCliT:cAlias )

RETURN .t.

//---------------------------------------------------------------------------//
/*Generamos el informe*/

METHOD lGenerate() CLASS TAcuGPed

   local cExpHead := ""
   local cExpLine := ""

   /*Desabilita el di�logo y vac�a la dbf temporal*/

   ::oDlg:Disable()
   ::oBtnCancel:Enable()
   ::oDbf:Zap()

   /*Monta la cabecera del documento*/

   ::aHeader   := {  {|| "Fecha     : " + Dtoc( Date() ) },;
                     {|| "Periodo   : " + Dtoc( ::dIniInf ) + " > " + Dtoc( ::dFinInf ) },;
                     {|| "Gr. Fam.  : " + if( ::lAllGrp, "Todos", AllTrim( ::cGruFamOrg ) + " > " + AllTrim( ::cGruFamDes) ) },;
                     {|| "Art�culos : " + if( ::lAllArt, "Todos", AllTrim( ::cArtOrg ) + " > " + AllTrim( ::cArtDes) ) },;
                     {|| "Clientes  : " + if( ::lAllCli, "Todos", AllTrim( ::cCliOrg ) + " > " + AllTrim( ::cCliDes) ) },;
                     {|| "Estado    : " + ::aEstado[ ::oEstado:nAt ] } }

   /*Monta los filtros para las tablas de presupuestos*/

   ::oPedCliT:OrdSetFocus( "dFecPed" )
   ::oPedCliL:OrdSetFocus( "nNumPed" )

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

   if !::lAllCli
      cExpHead       += ' .and. cCodCli >= "' + Rtrim( ::cCliOrg ) + '" .and. cCodCli <= "' + Rtrim( ::cCliDes ) + '"'
   end if

   if !Empty( ::oFilter:cExpFilter )
      cExpHead       += ' .and. ' + ::oFilter:cExpFilter
   end if

   ::oPedCliT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedCliT:cFile ), ::oPedCliT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:SetTotal( ::oPedCLiT:OrdKeyCount() )

   cExpLine          := '!lTotLin .and. !lControl'

   if !::lAllGrp
      cExpLine       += ' .and. cGrpFam >= "' + Rtrim( ::cGruFamOrg ) + '" .and. cGrpFam <= "' + Rtrim( ::cGruFamDes ) + '"'
   end if

   if !::lAllArt
      cExpLine       += ' .and. cRef >= "' + ::cArtOrg + '" .and. cRef <= "' + ::cArtDes + '"'
   end if

   ::oPedCliL:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oPedCliL:cFile ), ::oPedCliL:OrdKey(), cAllTrimer( cExpLine ), , , , , , , , .t. )

   /*Recorremos las cabeceras y l�neas*/

   ::oPedCliT:GoTop()

   while !::lBreak .and. !::oPedCliT:Eof()

     if lChkSer( ::oPedCliT:cSerPed, ::aSer ) .and. ::oPedCliL:Seek( ::oPedCliT:cSerPed + Str( ::oPedCliT:nNumPed ) + ::oPedCliT:cSufPed )

        while ::oPedCliT:cSerPed + Str( ::oPedCliT:nNumPed ) + ::oPedCliT:cSufPed == ::oPedCliL:cSerPed + Str( ::oPedCliL:nNumPed ) + ::oPedCliL:cSufPed .AND. ! ::oPedCliL:eof()

           if !( ::lExcCero .AND. nImpLPedCli( ::oPedCliT:cAlias, ::oPedCliL:cAlias, ::nDecOut, ::nDerOut, ::nValDiv ) == 0 )

              /*Llenamos la base de datos temporal*/

              ::AcuPed()

           end if

           ::oPedCliL:Skip()

        end while

     end if

     ::oPedCliT:Skip()

     ::oMtrInf:AutoInc()

   end while

   /*Destruimos los filtros creados anteriormente*/

   ::oPedCliT:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedCliT:cFile ) )
   ::oPedCliL:IdxDelete( cCurUsr(), GetFileNoExt( ::oPedCliL:cFile ) )

   ::oMtrInf:AutoInc( ::oPedCliT:Lastrec() )

   /*Incluimos almacenes sin movimiento*/

   if !::lExcCero
      ::IncluyeCero()
   end if

   ::oDlg:Enable()

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//