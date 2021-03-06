#include "FiveWin.Ch"
#include "Struct.ch"
#include "Factu.ch" 
#include "Ini.ch"

//----------------------------------------------------------------------------//

CLASS TSenderReciverItem

   DATA  cText

   DATA  oSender

   DATA  lSelectSend
   DATA  lSelectRecive

   DATA  nNumberSend       INIT     0
   DATA  nNumberRecive     INIT     0

   DATA  cIniFile

   DATA  cFileName

   DATA  lSuccesfullSend

   Method New()

   Method CreateData()     VIRTUAL

   Method RestoreData()    VIRTUAL

   Method SendData()       VIRTUAL

   Method ReciveData()     VIRTUAL

   Method Process()        VIRTUAL

   Method Save()

   Method Load()

   Method nGetNumberToSend()

   Method SetNumberToSend()   INLINE   WritePProString( "Numero", ::cText, cValToChar( ::nNumberSend ), ::cIniFile )

   Method IncNumberToSend()   INLINE   WritePProString( "Numero", ::cText, cValToChar( ++::nNumberSend ), ::cIniFile )

END CLASS

//----------------------------------------------------------------------------//

METHOD New( cText, oSender )

   ::cText           := cText
   ::oSender         := oSender
   ::cIniFile        := cPatEmp() + "Empresa.Ini"
   ::lSuccesfullSend := .f.

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD Save()

   WritePProString( "Envio",     ::cText, cValToChar( ::lSelectSend ), ::cIniFile )
   WritePProString( "Recepcion", ::cText, cValToChar( ::lSelectRecive ), ::cIniFile )

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD Load()

   ::lSelectSend     := ( Upper( GetPvProfString( "Envio", ::cText, cValToChar( ::lSelectSend ), ::cIniFile ) ) == ".T." )
   ::lSelectRecive   := ( Upper( GetPvProfString( "Recepcion", ::cText, cValToChar( ::lSelectRecive ), ::cIniFile ) ) == ".T." )

RETURN ( Self )

//----------------------------------------------------------------------------//

Method nGetNumberToSend()

   ::nNumberSend     := GetPvProfInt( "Numero", ::cText, ::nNumberSend, ::cIniFile )

Return ( ::nNumberSend )

//----------------------------------------------------------------------------//

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
   local dbfClient    
   local dbfCliAtp    
   local dbfObrasT    
   local dbfContactos 
   local oError
   local oBlock
   local cFileName
   local oAtipicas

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

   dbUseArea( .t., cDriver(), cPatSnd() + "ObrasT.Dbf", cCheckArea( "ObrasT", @tmpObr ), .f. )
   ( tmpObr )->( ordListAdd( cPatSnd() + "ObrasT.Cdx" ) )

   dbUseArea( .t., cDriver(), cPatSnd() + "CliContactos.Dbf", cCheckArea( "CLICONTA", @tmpCon ), .f. )
   ( tmpCon )->( ordListAdd( cPatSnd() + "CliContactos.Cdx" ) )

   /*
   Creamos la temporal de at�picas---------------------------------------------
   */

   TAtipicas():GetInstance():OpenFiles( .f., cPatSnd() )
   tmpAtp   := TAtipicas():GetInstance():oDbf:cAlias

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
            while ( dbfObrasT )->cCodCli == ( dbfClient )->Cod .and. !( dbfObrasT )->( Eof() )
               dbPass( dbfObrasT, tmpObr, .t. )
               SysRefresh()
               ( dbfObrasT )->( dbSkip() )
            end while
         end if

         if ( dbfContactos )->( dbSeek( ( dbfClient )->Cod ) )
            while ( dbfContactos )->cCodCli == ( dbfClient )->Cod .and. !( dbfContactos )->( Eof() )
               dbPass( dbfContactos, tmpCon, .t. )
               SysRefresh()
               ( dbfContactos )->( dbSkip() )
            end while
         end if

         if ( dbfCliAtp )->( dbSeek( ( dbfClient )->Cod ) )
            while ( dbfCliAtp )->cCodCli == ( dbfClient )->Cod .and. !( dbfCliAtp )->( Eof() )
               Logwrite( ( dbfcliatp )->( OrdKeyNo() ) )
               dbPass( dbfCliAtp, tmpAtp, .t. )
               SysRefresh()
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

   TAtipicas():GetInstance():CloseFiles()
   TAtipicas():EndInstance()

   CLOSE ( tmpCli       )
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

      if ::oSender:SendFiles( cPatOut() + cFileName, cFileName )
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
      ::oSender:GetFiles( "Cli*." + aExt[ n ], cPatIn() )
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
   local dbfClient
   local dbfCliAtp
   local dbfObrasT
   local dbfContactos
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
                        ::CleanRelation( ( tmpCli )->Cod, dbfCliAtp, dbfObrasT, dbfContactos )
                     else
                        ::oSender:SetText( "Desestimado : " + AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )
                     end if
                  else
                        dbPass( tmpCli, dbfClient, .t. )
                        ::oSender:SetText( "A�adido     : " + AllTrim( ( dbfClient )->Cod ) + "; " + ( dbfClient )->Titulo )
                        //::CleanRelation( ( tmpCli )->Cod, dbfCliAtp, dbfObrasT, dbfContactos )
                  end if

                  ( tmpCli )->( dbSkip() )

                  if !Empty( ::oSender:oMtr )
                     ::oSender:oMtr:Set( ( tmpCli )->( recno() ) )
                  end if

                  SysRefresh()

               end while

               if !Empty( ::oSender:oMtr )
                  ::oSender:oMtr:nTotal      := ( tmpAtp )->( lastrec() )
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

Method CleanRelation( cCodCli, dbfCliAtp, dbfObrasT, dbfContactos ) CLASS TClienteSenderReciver

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

//---------------------------------------------------------------------------//
