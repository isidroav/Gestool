#include "FiveWin.ch"
#include "Factu.ch" 
#include "Empresa.ch"
#include "HbXml.ch"
#include "Xbrowse.ch"

//---------------------------------------------------------------------------//
//
// Controla los accesos al programa
//

CLASS AccessCode

   CLASSDATA   cAgente
   CLASSDATA   cRuta
   
   DATA  oDlg
   DATA  oDlgConnect
   DATA  oBrwUser 
   DATA  oBtnOk
   DATA  oBtnCancel
   DATA  oBtnFree
   DATA  oBrush
   DATA  dbfUser
   DATA  dbfCajas

   DATA  oSayDatabase

   DATA  oGetUser
   DATA  cGetUser       INIT  Space( 100 )
   DATA  oSayUser

   DATA  oGetPassword
   DATA  cGetPassword   INIT  Space( 10 )
   DATA  oSayPassword

   DATA  oMessage
   DATA  cPcnUsr        INIT  Rtrim( NetName() )
   DATA  oGetServer
   DATA  cGetServer

   DATA  cGetBuscar     INIT ""
   DATA  oGetBuscar

   DATA  oCbxOrden
   DATA  cCbxOrden      INIT  "C�digo"

   DATA  oGetPasswordSql
   DATA  cGetPasswordSql
   DATA  oBtnConectOk
   DATA  oBtnConectCancel

   DATA  oBmpEngine
   DATA  cBmpEngine     INIT  "Data_Green_Alpha_48"

   DATA  oProgress
   DATA  nProgress      INIT  0

   DATA  nConnection    INIT  0
   DATA  lConnected     INIT  .t.

   DATA  cIniFile       INIT  FullCurDir() + "GstApolo.Ini"

   METHOD Resource()
   METHOD InitResource()
   METHOD EndResource( oDlg )

   METHOD FileResource()

   METHOD TactilResource()
   METHOD InitTactilResource( oDlg, oImgUsr, oLstUsr, dbfUsr )
   METHOD SelectTactilResource( nOpt, oLstUsr )
   METHOD EndTactilResource( oDlg )

   METHOD LoadIni()

   METHOD SaveIni()

   METHOD ShowConnectDialog()
   METHOD ShowLoginDialog()
   METHOD HideLoginDialog()

   METHOD InitialCheck()

   METHOD LoadUsuarios()
   METHOD lCheckUsuario()

END CLASS

//---------------------------------------------------------------------------//

METHOD Resource() CLASS AccessCode

   local oDlg
   local oIcoApp
   local oBmpLogo
   local oBmpVersion

   // Iconos-------------------------------------------------------------------

   DEFINE ICON oIcoApp RESOURCE "Gestool"

   /*
   Comprobamos que exista el direcotrio USR------------------------------------
   */

   if( !lIsDir( cPatUsr() ), MakeDir( cNamePath( cPatUsr() ) ), )

   /*
   Comprobaciones iniciales----------------------------------------------------
   */

   ::LoadIni()

   /*
   Preparamos el dialogo-------------------------------------------------------
   */

   DEFINE BRUSH ::oBrush COLOR Rgb( 255, 255, 255 ) // FILE ( cBmpVersion() )

   DEFINE DIALOG oDlg RESOURCE "Bienvenidos" TITLE "Bienvenidos a " + __GSTROTOR__ + Space( 1 ) + __GSTVERSION__ + " - " + __GSTFACTORY__ BRUSH ::oBrush ICON oIcoApp

   REDEFINE BITMAP   oBmpVersion ;
      FILE           cBmpVersion() ;
      ID             600 ;
      OF             oDlg

   REDEFINE BITMAP   oBmpLogo ;
      FILE           ( FullCurDir() + "Bmp\Gestoollogo.bmp" ) ;
      ID             610 ;
      OF             oDlg

   do case
      case lAds()
         ::oSayDatabase          := TSay():Redefine( 210, {|| "Database engine : Sybase Advantage Release 10.0 - SAP Company �" }, oDlg )
         ::cBmpEngine            := "Data_Green_Alpha_48"

      case lAIS()
         ::oSayDatabase          := TSay():Redefine( 210, {|| "Database engine : Internet Sybase Advantage Release 10.0 - SAP Company �" }, oDlg )
         ::cBmpEngine            := "Courthouse_Alpha_48"

      otherwise
         ::oSayDatabase          := TSay():Redefine( 210, {|| "Database engine : xHarbour Native RDD" }, oDlg )
         ::cBmpEngine            := "Data_Green_Alpha_48"

   end case

   ::oSayDatabase:lTransparent   := .t.

   // ::oSayDatabase:SetTransparent()

   REDEFINE BITMAP   ::oBmpEngine ;
      ID             200 ;
      RESOURCE       ::cBmpEngine ;
      TRANSPARENT ;
      OF             oDlg

   ::oSayUser                    := TSay():Redefine( 100, , oDlg )
   ::oSayUser:lTransparent       := .t.

   REDEFINE GET      ::oGetUser ;
      VAR            ::cGetUser ;
      BITMAP         "LUPA" ;
      ID             110 ;
      OF             oDlg

   ::oGetUser:bHelp              := {|| BrwUser( ::oGetUser, nil, ::oGetUser, .f., .f., .f., .t. ) }

   ::oSayPassword                := TSay():Redefine( 120, , oDlg )
   ::oSayPassword:lTransparent   := .t.

   REDEFINE GET      ::oGetPassword ;
      VAR            ::cGetPassword ;
      ID             130 ;
      OF             oDlg

   ::oProgress                   := TApoloMeter():ReDefine( 240, { | u | if( pCount() == 0, ::nProgress, ::nProgress := u ) }, 10, oDlg, .f., , , .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )

   REDEFINE BUTTON   ::oBtnOk ;
      ID             IDOK ;
      OF             oDlg ;
      ACTION         ( ::EndResource( oDlg ) )

   REDEFINE BUTTON   ::oBtnCancel ;
      ID             IDCANCEL ;
      OF             oDlg ;
      CANCEL ;
      ACTION         ( oDlg:end() )

   REDEFINE SAY      ::oMessage PROMPT "" ;
      ID             160 ;
      COLOR          Rgb( 0,0,0 ), Rgb( 255,255,255 ) ;
      OF             oDlg

   oDlg:AddFastKey( VK_F5, {|| ::EndResource( oDlg ) } )

   oDlg:bStart       := {|| ::InitResource( oDlg ) }

   ACTIVATE DIALOG oDlg CENTER

   if !Empty( oIcoApp )
      oIcoApp:end()
   end if

   if !Empty( oBmpLogo )
      oBmpLogo:End()
   end if 

   if !Empty( oBmpVersion )
      oBmpVersion:End()
   end if 

   if !Empty( ::oBrush )
      ::oBrush:End()
   end if

   if !Empty( ::oBmpEngine )
      ::oBmpEngine:End()
   end if

   if !Empty( ::oSayDatabase )
      ::oSayDatabase:End()
   end if 

   ::SaveIni()

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

METHOD EndResource( oDlg ) CLASS AccessCode

   SysRefresh()

   if lChkUser( ::cGetUser, ::cGetPassword, ::oBtnOk )

      ::HideLoginDialog()

      ::oProgress:Show()
      ::oMessage:Show()

      lInitCheck( ::oMessage, ::oProgress )

      ::oProgress:Hide()

      oDlg:end( IDOK )

   end if

RETURN ( nil )

//--------------------------------------------------------------------------//

METHOD FileResource( oDlg ) CLASS AccessCode

   local cCodigoAgente

   SysRefresh()

   ::cGetUser        := GetPvProfString(  "Tablet", "User",       "",   FullCurDir() + "GstApolo.Ini" )
   ::cGetPassword    := GetPvProfString(  "Tablet", "Password",   "",   FullCurDir() + "GstApolo.Ini" )
   ::cAgente         := GetPvProfString(  "Tablet", "Agente",     "",   FullCurDir() + "GstApolo.Ini" )
   ::cRuta           := GetPvProfString(  "Tablet", "Ruta",       "",   FullCurDir() + "GstApolo.Ini" )

   if empty( ::cGetUser ) 
      apoloMsgStop( "C�digo de usuario esta vacio")
      Return ( .f. )
   end if 

   if empty( ::cGetPassword ) 
      apoloMsgStop( "Clave de acceso esta vacia" )
      Return ( .f. )
   end if 

   if lChkUser( ::cGetUser, ::cGetPassword )
      Return ( .t. )
   end if

Return ( .f. )

//--------------------------------------------------------------------------//


METHOD InitResource( oDlg ) CLASS AccessCode

   oDlg:bValid    := {|| .f. }

   ::HideLoginDialog()

   ::InitialCheck()

   ::ShowLoginDialog( oDlg )

   ::oGetPassword:SetFocus()

   oDlg:bValid    := {|| .t. }

Return .t.

//---------------------------------------------------------------------------//

METHOD ShowLoginDialog( oDlg ) CLASS AccessCode

   // Show del dialogo---------------------------------------------------------

   ::oGetUser:Show()
   ::oSayUser:Show()

   ::oGetPassword:Show()
   ::oSayPassword:Show()

   ::oBtnOk:Show()
   ::oBtnCancel:Show()

   if !Empty( ::oMessage )
      ::oMessage:Hide()
   end if

Return ( Self )

//---------------------------------------------------------------------------//

METHOD TactilResource() CLASS AccessCode

   local oDlg
   local oIcoApp
   local oImgUsr
   local oLstUsr
   local oBmpVersion

   /*
   Comprobamos que exista el direcotrio USR------------------------------------
   */

   if( !lIsDir( cPatUsr() ), MakeDir( cNamePath( cPatUsr() ) ), )

   /*
   Iconos----------------------------------------------------------------------
   */

   DEFINE ICON oIcoApp RESOURCE "Gestool"


   /*
   Preparamos el dialogo-------------------------------------------------------
   */

   DEFINE BRUSH ::oBrush COLOR Rgb( 255, 255, 255 ) // FILE ( cBmpVersion() )

   /*
   Montamos el di�logo con la im�gen de fondo--------------------------------
   */

   DEFINE DIALOG oDlg RESOURCE "BienvenidosTactil" TITLE __GSTROTOR__ + Space( 1 ) + __GSTVERSION__ + " - " + __GSTFACTORY__ BRUSH ::oBrush

   REDEFINE BITMAP oBmpVersion ;
      FILE     cBmpVersion() ;
      ID       600 ;
      OF       oDlg

      /*
      Montamos la lista con los usuarios-------------------------------------
      */

      oImgUsr                    := TImageList():New( 50, 50 ) //

      oLstUsr                    := TListView():Redefine( 100, oDlg )
      oLstUsr:nOption            := 0
      oLstUsr:bClick             := {| nOpt | ::SelectTactilResource( nOpt, oDlg, oLstUsr ) }

      /*
      Informaci�n global-------------------------------------------------------
      */

      do case
      case lAds()
         ::oSayDatabase          := TWebBtn():Redefine( 210,,,,,, oDlg,,,, "Database engine : Sybase Advantage Release 10.0 - SAP Company �", "LEFT",,,,, Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) )
         ::cBmpEngine            := "Data_Green_Alpha_48"

      case lAIS()
         ::oSayDatabase          := TWebBtn():Redefine( 210,,,,,, oDlg,,,, "Database engine : Internet Sybase Advantage Release 10.0 - SAP Company �", "LEFT",,,,, Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) )
         ::cBmpEngine            := "Courthouse_Alpla_48"

      otherwise
         ::oSayDatabase          := TWebBtn():Redefine( 210,,,,,, oDlg,,,, "Database engine : xHarbour Native RDD", "LEFT",,,,, Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) )
         ::cBmpEngine            := "Data_Green_Alpha_48"

      end case

      ::oSayDatabase:SetTransparent()

      REDEFINE IMAGE ::oBmpEngine ;
         ID       200 ;
         RESOURCE ::cBmpEngine ;
         OF       oDlg

      TWebBtn():Redefine( 220,,,,,, oDlg,,,, cNameVersion(), "Left",,,,, Rgb( 0, 0, 0 ), Rgb( 255, 255, 255 ) ):SetTransparent()

      ::oProgress                := TApoloMeter():ReDefine( 240, { | u | if( pCount() == 0, ::nProgress, ::nProgress := u ) }, 10, oDlg, .f., , , .t., rgb( 255,255,255 ), , rgb( 128,255,0 ) )

      REDEFINE SAY ::oMessage PROMPT "" ID 160 COLOR Rgb( 0,0,0 ), Rgb( 255,255,255 ) OF oDlg

      /*
      Botones de la caja de di�logo--------------------------------------------
      */

      REDEFINE BUTTON ID IDCANCEL OF oDlg ACTION ( oDlg:end() )

      /*
      Al iniciar el di�logo cargamos las im�genes de los usuarios--------------
      */

      oDlg:bStart                := {|| ::InitTactilResource( oDlg, oImgUsr, oLstUsr ) }

   ACTIVATE DIALOG oDlg CENTER

   if !Empty( ::oBrush )
      ::oBrush:End()
   end if

   if !Empty( ::oBmpEngine )
      ::oBmpEngine:End()
   end if

   if !Empty( oIcoApp )
      oIcoApp:end()
   end if

   if !Empty( oBmpVersion )
      oBmpVersion:End()
   end if 

   if !Empty( oLstUsr )
      oLstUsr:End()
   end if

   if !Empty( ::oBrush )
      ::oBrush:End()
   end if  

RETURN ( oDlg:nResult == IDOK )

//--------------------------------------------------------------------------//

METHOD InitTactilResource( oDlg, oImgUsr, oLstUsr ) CLASS AccessCode

   local nImg     := -1
   local nUser    := 0

   CursorWait()

   // Comprobamos q exista al menos un usario master---------------------------

   TstUsuario()

   while !IsMaster()
      rxUsuario()
   end while

   // Abrimos las bases de datos de usuarios-----------------------------------

   USE ( cPatDat() + "USERS.DBF" ) NEW VIA ( cDriver() ) SHARED ALIAS ( ::dbfUser := cCheckArea( "USERS" ) )
   SET ADSINDEX TO ( cPatDat() + "Users.Cdx" ) ADDITIVE   

   ( ::dbfUser )->( dbSetFilter( {|| !Field->lGrupo }, "!lGrupo" ) )

   USE ( cPatDat() + "Cajas.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( ::dbfCajas := cCheckArea( "CAJAS" ) )
   SET ADSINDEX TO ( cPatDat() + "Cajas.Cdx" ) ADDITIVE   

   // Comprobamos q el usuario esta libre--------------------------------------

   nUsrInUse( ::dbfUser )

   if !Empty( oImgUsr ) .and. !Empty( oLstUsr )

      oImgUsr:AddMasked( TBitmap():Define( "BIG_ADMIN" ),   Rgb( 255, 0, 255 ) )
      oImgUsr:AddMasked( TBitmap():Define( "BIG_USER" ),    Rgb( 255, 0, 255 ) )

      oLstUsr:SetImageList( oImgUsr )

      oLstUsr:EnableGroupView()

      oLstUsr:SetIconSpacing( 120, 140 )

      with object ( TListViewGroup():New() )
         :cHeader := "Administradores"
         :Create( oLstUsr )
      end with

      with object ( TListViewGroup():New() )
         :cHeader := "Usuarios"
         :Create( oLstUsr )
      end with

      ( ::dbfUser )->( dbGoTop() )
      while !( ::dbfUser )->( eof() )

         if !( ::dbfUser )->lUseUse .and. !( ::dbfUser )->lGrupo

            if !Empty( ( ::dbfUser )->cImagen ) .and. File( Rtrim( ( ::dbfUser )->cImagen ) )

               oImgUsr:Add( TBitmap():Define( , Rtrim( ( ::dbfUser )->cImagen ) ) )

               nImg++

               with object ( TListViewItem():New() )
                  :Cargo   := ( ::dbfUser )->cCodUse
                  :cText   := Capitalize( ( ::dbfUser )->cNbrUse )
                  :nImage  := nImg
                  :nGroup  := if( ( ::dbfUser )->nGrpUse <= 1, 1, 2 )
                  :Create( oLstUsr )
               end with

            else

               with object ( TListViewItem():New() )
                  :Cargo   := ( ::dbfUser )->cCodUse
                  :cText   := Capitalize( ( ::dbfUser )->cNbrUse )
                  :nImage  := if( ( ::dbfUser )->nGrpUse <= 1, 0, 1 )
                  :nGroup  := if( ( ::dbfUser )->nGrpUse <= 1, 1, 2 )
                  :Create( oLstUsr )
               end with

            end if

         end if

         ( ::dbfUser )->( dbSkip() )

      end while

      oLstUsr:Refresh()

   end if

   CursorWE()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD EndTactilResource( oDlg ) CLASS AccessCode

   if ( ::dbfUser )->( Used() )
      ( ::dbfUser )->( dbCloseArea() )
   end if

   if ( ::dbfCajas )->( Used() )
      ( ::dbfCajas )->( dbCloseArea() )
   end if

   lInitCheck( ::oMessage, ::oProgress )

   oDlg:End( IDOK )

RETURN ( nil )

//--------------------------------------------------------------------------//

METHOD SelectTactilResource( nOpt, oDlg, oLstUsr ) CLASS AccessCode

   local oUser
   local oItem

   // Chequeamos que seleccione almenos un usuario-----------------------------

   if Empty( nOpt )
      MsgStop( "Seleccione usuario" )
      Return .f.
   end if

   oItem             := oLstUsr:GetItem( nOpt )

   if !Empty( oItem ) .and. dbSeekInOrd( oItem:Cargo, "cCodUse", ::dbfUser )

      if !( ::dbfUser )->lUseUse

         // Comprobamos la clave del usuario-----------------------------------

         if lGetPsw( ::dbfUser, .t. )

            oUser    := oSetUsr( ( ::dbfUser )->cCodUse, ::dbfUser, ::dbfCajas, nil, .t. )
            if oUser:lCreated
               oUser:Save( ::dbfUser )
            end if

            ::EndTactilResource( oDlg )

            Return ( .t. )

         end if

      else

         MsgStop( "Usuario en uso" )

         Return .f.

      end if

   else

      MsgStop( "El usuario no existe" )

   end if

Return ( .f. )

//---------------------------------------------------------------------------//

METHOD LoadIni() CLASS AccessCode

   ::cGetServer      := GetPvProfString( "Sql", "Servidor", cValToChar( ::cGetServer ),      ::cIniFile )
   ::cGetUser        := GetPvProfString( "Sql", "Usuario",  cValToChar( ::cGetUser ),        ::cIniFile )
   ::cGetPasswordSql := GetPvProfString( "Sql", "Password", cValToChar( ::cGetPasswordSql ), ::cIniFile )

Return ( Self )

//--------------------------------------------------------------------------//

METHOD SaveIni() CLASS AccessCode

   WritePProString( "Sql", "Servidor", cValToChar( ::cGetServer ),      ::cIniFile )
   WritePProString( "Sql", "Usuario",  cValToChar( ::cGetUser ),        ::cIniFile )
   WritePProString( "Sql", "Password", cValToChar( ::cGetPasswordSql ), ::cIniFile )

Return ( Self )

//--------------------------------------------------------------------------//

METHOD ShowConnectDialog() CLASS AccessCode

   // Usuario y contrase�a para conectarse-------------------------------------

   ::cGetServer      := Padr( ::cGetServer,        100 )
   ::cGetUser        := Padr( ::cGetUser,          100 )
   ::cGetPasswordSql := Padr( ::cGetPasswordSql,   100 )

   DEFINE DIALOG ::oDlgConnect RESOURCE "SqlConnect"

      REDEFINE BITMAP ;
         RESOURCE "ConectarMySql" ;
         ID       500 ;
         OF       ::oDlgConnect

      REDEFINE GET ::oGetServer ;
         VAR      ::cGetServer ;
         ID       210 ;
         IDSAY    200 ;
         OF       ::oDlgConnect

      REDEFINE GET ::oGetUser ;
         VAR      ::cGetUser ;
         ID       230 ;
         IDSAY    220 ;
         OF       ::oDlgConnect

      REDEFINE GET ::oGetPasswordSql ;
         VAR      ::cGetPasswordSql ;
         ID       250 ;
         IDSAY    240 ;
         OF       ::oDlgConnect

      REDEFINE BUTTON ::oBtnConectOk ;
         ID       260 ;
         OF       ::oDlgConnect ;
         ACTION   ( if( ::lConnect(), ::oDlgConnect:end( IDOK ), ) )

      REDEFINE BUTTON ::oBtnConectCancel ;
         ID       270 ;
         OF       ::oDlgConnect ;
         CANCEL ;
         ACTION   ( ::oDlgConnect:end() )

   ACTIVATE DIALOG ::oDlgConnect CENTER

Return ( ::oDlgConnect:nResult == IDOK )

//--------------------------------------------------------------------------//

Method HideLoginDialog() CLASS AccessCode

   ::oGetUser:Hide()
   ::oSayUser:Hide()

   ::oGetPassword:Hide()
   ::oSayPassword:Hide()

   ::oBtnOk:Hide()
   ::oBtnCancel:Hide()

Return ( Self )

//--------------------------------------------------------------------------//

Method InitialCheck() CLASS AccessCode

   if !Empty( ::oMessage )
      ::oMessage:Show()
   end if

   if !lAIS()

      // Comprobamos q exista al menos un usario master---------------------------

      TstUsuario()

      while !IsMaster()
         rxUsuario()
      end while

      // Comprobamos q exista al menos una caja-----------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando cajas..." )
      end if

      while !IsCaja()
         rxCajas()
      end while

      // Comprobamos q exista al menos una impresora de ticket--------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando impresoras de tikets..." )
      end if

      while !IsImpTik()
         rxImpTik( cPatDat() )
      end while

      // Comprobamos q exista al menos un visor-----------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando visor..." )
      end if

      while !IsVisor()
         rxVisor( cPatDat() )
      end while

      // Comprobamos q exista al menos un cajon portamonedas----------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando caj�n portamonedas..." )
      end if

      while !IsCajPorta()
         rxCajPorta( cPatDat() )
      end while

      // Tipos de impresoras por defecto------------------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando tipos de impresoras..." )
      end if
 
      while !IsTipImp()
         rxTipImp( cPatDat() )
      end while

      // Tipos de notas por defecto-----------------------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando tipos de notas..." )
      end if

      while !IsTipoNotas()
         rxTipoNotas( cPatDat() )
      end while

      // Comprobamos q exista al menos un tipo de ventas--------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando tipos de ventas..." )
      end if

      while !IsTipoVentas()
         rxTVta( cPatDat() )
      end while

      // Comprobamos q exista al menos una caja-----------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando divisas..." )
      end if

      while !IsDiv()
         rxDiv()
      end while

      // Comprobamos q existan los tipos de impuestos----------------------------------

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando tipos de impuestos..." )
      end if

      IsIva()

   end if

   // Iniciamos el data center-------------------------------------------------

   if lAIS()

      with object ( TDataCenter() )

         if :lAdsConnection

            if !Empty( ::oMessage )
               ::oMessage:SetText( "Servidor ADS conectado." )
            end if

            ::oBmpEngine:Reload( "Data_Green_Alpha_48" )

         end if

      end with

   end if

   // Abrimos las bases de datos de usuarios-----------------------------------

   if !Empty( ::oMessage )
      ::oMessage:SetText( "Cargando usuarios... " )
   end if

   ::LoadUsuarios()

   // Cerramos los mensajes----------------------------------------------------

   if !Empty( ::oMessage )
      ::oMessage:Hide()
   end if

Return ( Self )

//---------------------------------------------------------------------------//

METHOD LoadUsuarios() CLASS AccessCode

   local dbfUser

   USE ( cPatDat() + "Users.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "Users", @dbfUser ) )
   SET ADSINDEX TO ( cPatDat() + "Users.Cdx" ) ADDITIVE

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Comprobando los usuarios en uso..." )
      end if

      nUsrInUse( dbfUser )

      if !Empty( ::oMessage )
         ::oMessage:SetText( "Localizando usuario del pc..." )
      end if

      if ( dbfUser )->( FieldPos( "cPcnUse" ) ) != 0 .and. !dbSeekInOrd( ::cPcnUsr, "cPcnUse", dbfUser )
         ( dbfUser )->( dbGoTop() )
      end if

      ::oGetUser:cText( Capitalize( ( dbfUser )->cNbrUse ) )

   CLOSE ( dbfUser )

Return ( Self )

//---------------------------------------------------------------------------//

METHOD lCheckUsuario() CLASS AccessCode

   local dbfUser

   USE ( cPatDat() + "Users.Dbf" ) NEW VIA ( cDriver() ) SHARED ALIAS ( cCheckArea( "USERS", @dbfUser ) )
   SET ADSINDEX TO ( cPatDat() + "Users.Cdx" ) ADDITIVE

   nUsrInUse( dbfUser )

   ( dbfUser )->( dbGoTop() )
   while !( dbfUser )->( eof() )

      if !( dbfUser )->lGrupo
         aAdd( ::aUser, { ( dbfUser )->lUseUse, ( dbfUser )->cCodUse, ( dbfUser )->cNbrUse, ( dbfUser )->cClvUse } )
      end if

      ( dbfUser )->( dbSkip() )

   end while

Return ( Self )

//---------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//