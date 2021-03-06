#include "FiveWin.Ch"
#include "Factu.ch" 

//---------------------------------------------------------------------------//

CLASS TGenMailingDatabasePresupuestosClientes FROM TGenMailingDatabase 

   METHOD New( nView )

   METHOD getAdjunto()                 INLINE ( mailReportPreCli( ::cFormatoDocumento ) )

END CLASS

//---------------------------------------------------------------------------//

METHOD New( nView ) CLASS TGenMailingDatabasePresupuestosClientes

   ::Create()

   ::Super:New( nView )

   ::setItems( aItmPreCli() )

   ::setWorkArea( D():PresupuestosClientes( nView ) )

   ::setTypeDocument( "nPreCli" )

   ::setTypeFormat( "RC" )

   ::setFormatoDocumento( cFirstDoc( "RC", D():Documentos( nView ) ) )

   ::setBmpDatabase( "Presupuesto_cliente_48_alpha" )

   ::setAsunto( "Envio de nuestro presupuesto n�mero {Serie del pedido}/{N�mero del pedido}" )

   ::setBlockRecipients( {|| alltrim( retFld( ( D():PresupuestosClientes( ::nView ) )->cCodCli, D():Clientes( ::nView ), "cMeiInt" ) ) } )

Return ( Self )

//---------------------------------------------------------------------------//
