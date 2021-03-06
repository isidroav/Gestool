#include "FiveWin.Ch"

#include "Hbxml.ch"
#include "Hbclass.ch"
#include "Fileio.ch"

#include "Factu.ch" 

#define SchemaVersion            '3.2'
#define Modality                 'I'   // "individual" (I)
#define InvoiceIssuerType        'EM'
#define InvoicesCount            '1'
#define EquivalentInEuros        '0.00'
#define InvoiceDocumentType      'FC'
#define InvoiceClass             'OO'
#define TaxTypeCode              '01'

#define DoubleTwoDecimalPicture  "999999999.99"
#define DoubleFourDecimalPicture "999999999.9999"
#define DoubleSixDecimalPicture  "999999999.999999"

CLASS TFacturaElectronica

   DATA  oXml
   DATA  oXmlNode
   DATA  oXmlHeader
   DATA  oXmlBatch
   DATA  oXmlTotalInvoicesAmount
   DATA  oXmlTotalOutstandingAmount
   DATA  oXmlTotalExecutableAmount
   DATA  oXmlParties
   DATA  oXmlSellerParty
   DATA  oXmlTaxIdentification
   DATA  oXmlLegalEntity
   DATA  oXmlRegistrationData
   DATA  oXmlAddressInSpain
   DATA  oXmlLegalEntity
   DATA  oXmlContactDetails
   DATA  oXmlBuyerParty
   DATA  oXmlTaxIdentification
   DATA  oXmlLegalEntity
   DATA  oXmlInvoices
   DATA  oXmlInvoice
   DATA  oXmlInvoiceHeader
   DATA  oXmlCorrective
   DATA  oXmlTaxPeriod
   DATA  oXmlInvoiceIssueData
   DATA  oXmlPlaceOfIssue
   DATA  oXmlInvoiceCurrencyCode
   DATA  oXmlTaxesOutputs
   DATA  oXmlTax
   DATA  oXmlTaxableBase
   DATA  oXmlTaxAmount
   DATA  oXmlEquivalenceSurcharge
   DATA  oXmlInvoiceTotals
   DATA  oXmlGeneralDiscounts
   DATA  oXmlDiscount
   DATA  oXmlInvoiceLine
   DATA  oXmlItems
   DATA  oXmlDiscountsAndRebates
   DATA  oXmlPaymentDetails
   DATA  oXmlInstallment
   DATA  oXmlAccountToBeCredited
   DATA  oXmlAccountToBeDebited

   DATA  hDC

   DATA  cFicheroOrigen
   DATA  cFicheroDestino
   DATA  cFicheroOriginal
   DATA  cNif
   DATA  oFirma

   DATA     oTree

   DATA     cInvoiceNumber
   DATA     cInvoiceSeriesCode
   DATA     cInvoiceCurrencyCode
   DATA     nInvoiceTotalAmount           INIT  0

   DATA     nTotalGrossAmount             INIT  0
   DATA     nTotalGrossAmountBeforeTaxes  INIT  0
   DATA     nTotalGeneralDiscounts        INIT  0
   DATA     nTotalGeneralSurcharges       INIT  0
   DATA     nTotalTaxOutputs              INIT  0
   DATA     nTotalTaxesWithheld           INIT  0
   DATA     nInvoiceTotal                 INIT  0
   DATA     nTotalOutstandingAmount       INIT  0
   DATA     nTotalExecutableAmount        INIT  0
   DATA     nTotalReimbursableExpenses    INIT  0

   ACCESS   TotalGrossAmount              INLINE ( Alltrim( Trans( ::nTotalGrossAmount,            DoubleTwoDecimalPicture ) ) )
   ACCESS   InvoiceTotalAmount            INLINE ( Alltrim( Trans( ::nInvoiceTotalAmount,          DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalOutstandingAmount        INLINE ( Alltrim( Trans( ::nTotalOutstandingAmount,      DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalExecutableAmount         INLINE ( Alltrim( Trans( ::nTotalExecutableAmount,       DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalGeneralSurcharges        INLINE ( Alltrim( Trans( ::nTotalGeneralSurcharges,      DoubleTwoDecimalPicture ) ) )

   ACCESS   TotalTaxOutputs               INLINE ( Alltrim( Trans( ::nTotalTaxOutputs,             DoubleTwoDecimalPicture ) ) )

   ACCESS   TotalGrossAmountBeforeTaxes   INLINE ( Alltrim( Trans( ::nTotalGrossAmountBeforeTaxes, DoubleTwoDecimalPicture ) ) )

   ACCESS   TotalGeneralDiscounts         INLINE ( Alltrim( Trans( ::nTotalGeneralDiscounts,       DoubleTwoDecimalPicture ) ) )

   ACCESS   TotalTaxesWithheld            INLINE ( Alltrim( Trans( ::nTotalTaxesWithheld,          DoubleTwoDecimalPicture ) ) )
   ACCESS   InvoiceTotal                  INLINE ( Alltrim( Trans( ::nInvoiceTotal,                DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalOutstandingAmount        INLINE ( Alltrim( Trans( ::nTotalOutstandingAmount,      DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalExecutableAmount         INLINE ( Alltrim( Trans( ::nTotalExecutableAmount,       DoubleTwoDecimalPicture ) ) )
   ACCESS   TotalReimbursableExpenses     INLINE ( Alltrim( Trans( ::nTotalReimbursableExpenses,   DoubleTwoDecimalPicture ) ) )

   DATA     cCorrectiveInvoiceNumber
   DATA     cCorrectiveReasonCode
   DATA     cCorrectiveReasonDescription
   DATA     cCorrectiveCorrectionMethod
   DATA     cCorrectiveCorrectionMethodDescription

   DATA     dCorrectiveStartDate
   DATA     dCorrectiveEndDate
   DATA     dIssueDate
   DATA     dOperationDate

   ACCESS   IssueDate                  INLINE ( dToIso( ::dIssueDate ) )
   ACCESS   OperationDate              INLINE ( dToIso( ::dOperationDate ) )
   ACCESS   CorrectiveStartDate        INLINE ( dToIso( ::dCorrectiveStartDate ) )
   ACCESS   CorrectiveEndDate          INLINE ( dToIso( ::dCorrectiveEndDate ) )

   DATA     cPlaceOfIssuePostCode
   DATA     cPlaceOfIssueDescription

   ACCESS   PlaceOfIssuePostCode       INLINE ( Rtrim( Left( ::cPlaceOfIssuePostCode, 9 ) ) )
   ACCESS   PlaceOfIssueDescription    INLINE ( Rtrim( Left( ::cPlaceOfIssueDescription, 20 ) ) )

   DATA     cTaxCurrencyCode
   DATA     cLanguageName

   DATA     oSellerParty
   DATA     oBuyerParty

   DATA     aTax
   DATA     aDiscount
   DATA     aItemLine
   DATA     aInstallment

   DATA     lError

   DATA     oMail
   DATA     cMailServer
   DATA     cMailServerPort
   DATA     cMailServerUserName
   DATA     cMailServerPassword
   DATA     cMailSubject
   DATA     cMailBody
   DATA     cMailRecipient

   METHOD New() CONSTRUCTOR

   METHOD GeneraXml()
   METHOD HeaderXml()
   METHOD PartiesXml()
   METHOD InvoiceXml()
   METHOD TaxesXml()
   METHOD TotalXml()
   METHOD DiscountXml()
   METHOD ItemsXml()
   METHOD InstallmentXml()

   METHOD ShowInWeb()

   METHOD Firma()
   METHOD VerificaFirma()

   METHOD FirmaJava()

   METHOD Enviar()

   METHOD addItemLine( oItemLine )        INLINE ( aAdd( ::aItemLine, oItemLine ) )
   METHOD addInstallment( oInstallment )  INLINE ( aAdd( ::aInstallment, oInstallment ) )
   METHOD addTax( oTax )                  INLINE ( ::nTotalTaxOutputs += oTax:nTaxAmount, aAdd( ::aTax, oTax ), ::aTax )
   METHOD addDiscount( oDiscount )        INLINE ( ::nTotalGeneralDiscounts += oDiscount:nDiscountAmount, aAdd( ::aDiscount, oDiscount ), ::aDiscount )

   METHOD MailServerSend()                INLINE ( ::cMailServer + if( !Empty( ::cMailServerPort ), ":" + Alltrim( Str( ::cMailServerPort ) ), "" ) )

ENDCLASS

//---------------------------------------------------------------------------//

METHOD New( oTree )

   ::oTree                          := oTree

   ::cInvoiceCurrencyCode           := 'EUR'
   ::cLanguageName                  := 'es'

   ::nTotalGrossAmount              := 0
   ::nTotalGeneralDiscounts         := 0
   ::nTotalGeneralSurcharges        := 0
   ::nTotalGrossAmountBeforeTaxes   := 0
   ::nTotalTaxOutputs               := 0
   ::nTotalTaxesWithheld            := 0
   ::nInvoiceTotal                  := 0
   ::nTotalOutstandingAmount        := 0
   ::nTotalExecutableAmount         := 0
   ::nTotalReimbursableExpenses     := 0
   ::nInvoiceTotalAmount            := 0

   ::oSellerParty                   := Party()
   ::oBuyerParty                    := Party()

   ::aTax                           := {}
   ::aDiscount                      := {}
   ::aItemLine                      := {}
   ::aInstallment                   := {}

   ::cMailServer                    := Rtrim( uFieldEmpresa( "cSrvMai" ) )
   ::cMailServerPort                := uFieldEmpresa( "nPrtMai" )
   ::cMailServerUserName            := Rtrim( uFieldEmpresa( "cCtaMai" ) )
   ::cMailServerPassword            := Rtrim( uFieldEmpresa( "cPssMai" ) )

   ::cMailSubject                   := "Env�o de  factura electr�nica."
   ::cMailBody                      := ""
   ::cMailRecipient                 := ""

   ::lError                         := .f.

Return ( self )

//---------------------------------------------------------------------------//

METHOD GeneraXml()

   local oError
   local oBlock

   ::oXml         := TXmlDocument():new( '<?xml version="1.0" encoding="ISO-8859-1" ?>' )

   // ::oXml         := TXmlDocument():new( '<?xml version="1.0" encoding="UTF-8" ?> ' )

   /*
   Comienza el nodo principal--------------------------------------------------
   */
   
//   ::oXmlNode     := TXmlNode():new( , 'm:Facturae', { 'xmlns:m' => 'http://www.facturae.es/Facturae/2007/v3.1/Facturae',;
//                                                       'xmlns:n1' => 'http://www.facturae.es/Facturae/2007/v3.1/Facturae',;
//                                                       'xmlns:tns' => 'http://schemas.xmlsoap.org/soap/envelope/',;
//                                                       'xmlns:ds' => 'http://www.w3.org/2000/09/xmldsig#',;
//                                                       'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',;
//                                                       'xsi:schemaLocation' => 'http://www.facturae.es/Facturae/2007/v3.1/Facturae http://www.facturae.es/NR/rdonlyres/56F4132E-2AF9-41DD-AADC-CB412AE3F79C/0/1Facturaev31.xsd' } )
   
   /*
   Facturae 3.2
   */

   ::oXmlNode     := TXmlNode():new( , "fe:Facturae",;
                                       {  "xmlns:fe" => "http://www.facturae.es/Facturae/2009/v3.2/Facturae",;
                                          "xmlns:ds" => "http://www.w3.org/2000/09/xmldsig#",;
                                          "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",;
                                          "xsi:schemaLocation" => "http://www.facturae.es/Facturae/2009/v3.2/Facturae" } )


/*
<xs:schema 
xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns="http://www.facturae.es/Facturae/2007/v3.1/Facturae" 
targetNamespace="http://www.facturae.es/Facturae/2007/v3.1/Facturae" version="3.1">
<xs:import 
namespace="http://www.w3.org/2000/09/xmldsig#" 
schemaLocation="http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd"/>
*/

/*
<xs:schema xmlns:ds="http://www.w3.org/2000/09/xmldsig#",;
xmlns:xs="http://www.w3.org/2001/XMLSchema",;
xmlns="http://www.facturae.es/Facturae/2014/v3.2.1/Facturae",;
targetNamespace="http://www.facturae.es/Facturae/2014/v3.2.1/Facturae" version="3.2.1">
<xs:import namespace="http://www.w3.org/2000/09/xmldsig#" schemaLocation="http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd"/>
*/

   ::HeaderXml()

   ::PartiesXml()

   ::InvoiceXml()

   ::oXml:oRoot:addBelow( ::oXmlNode )

   /*
   Generar fisicamente el fichero----------------------------------------------
   */

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ferase( ::cFicheroOrigen )

      ::hDC       := fCreate( ::cFicheroOrigen )

      if ::hDC < 0
         ::hDC    := 0
      endif

      ::oXml:Write( ::hDC, HBXML_STYLE_INDENT )

      fClose( ::hDC )

      ::hDC       := 0

      ::oTree:Add( "Fichero generado " + Lower( ::cFicheroOrigen ) + " satisfactoriamente.", 1 )

   RECOVER USING oError

      ::lError    := .t.

      ::oTree:Add( "Error el generar el fichero " + Lower( ::cFicheroOrigen ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   // GoWeb( AllTrim( ::cFicheroOrigen ) )

Return ( Self )

//---------------------------------------------------------------------------//

METHOD HeaderXml()

   /*
   Comienza el nodo header--------------------------------------------------
   */

   ::oXmlHeader   := TXmlNode():new( , 'FileHeader' )
      ::oXmlHeader:addBelow( TXmlNode():new( , 'SchemaVersion', ,       SchemaVersion ) )
      ::oXmlHeader:addBelow( TXmlNode():new( , 'Modality', ,            Modality ) )
      ::oXmlHeader:addBelow( TXmlNode():new( , 'InvoiceIssuerType', ,   InvoiceIssuerType ) )

      /*
      Comienza el nodo batch------------------------------------------------
      */

      ::oXmlBatch    := TXmlNode():new( , 'Batch' )
         ::oXmlBatch:addBelow( TXmlNode():new( , 'BatchIdentifier', ,   ::cInvoiceNumber ) )
         ::oXmlBatch:addBelow( TXmlNode():new( , 'InvoicesCount', ,     InvoicesCount  ) )

         /*
         Comienza el nodo TotalInvoicesAmount-------------------------------
         */

         ::oXmlTotalInvoicesAmount  := TXmlNode():new( , 'TotalInvoicesAmount' )
            ::oXmlTotalInvoicesAmount:addBelow( TXmlNode():new( , 'TotalAmount', ,        ::InvoiceTotalAmount() ) )
            ::oXmlTotalInvoicesAmount:addBelow( TXmlNode():new( , 'EquivalentInEuros', ,  EquivalentInEuros ) )

         ::oXmlBatch:addBelow( ::oXmlTotalInvoicesAmount )

         /*
         Comienza el nodo TotalOutstandingAmount----------------------------
         */

         ::oXmlTotalOutstandingAmount  := TXmlNode():new( , 'TotalOutstandingAmount' )
            ::oXmlTotalOutstandingAmount:addBelow( TXmlNode():new( , 'TotalAmount', ,        ::TotalOutstandingAmount() ) )
            ::oXmlTotalOutstandingAmount:addBelow( TXmlNode():new( , 'EquivalentInEuros', ,  EquivalentInEuros ) )

         ::oXmlBatch:addBelow( ::oXmlTotalOutstandingAmount )

         /*
         Comienza el nodo TotalExecutableAmount----------------------------
         */

         ::oXmlTotalExecutableAmount  := TXmlNode():new( , 'TotalExecutableAmount' )
            ::oXmlTotalExecutableAmount:addBelow( TXmlNode():new( , 'TotalAmount', ,         ::TotalExecutableAmount() ) )
            ::oXmlTotalExecutableAmount:addBelow( TXmlNode():new( , 'EquivalentInEuros', ,   EquivalentInEuros ) )

         ::oXmlBatch:addBelow( ::oXmlTotalExecutableAmount )

         /*
         Comienza el nodo InvoiceCurrencyCode----------------------------
         */

         ::oXmlBatch:addBelow( TXmlNode():new( , 'InvoiceCurrencyCode', , ::cInvoiceCurrencyCode ) )

      ::oXmlHeader:addBelow( ::oXmlBatch )

   ::oXmlNode:addBelow( ::oXmlHeader )

Return ( self )

//---------------------------------------------------------------------------//

METHOD PartiesXml()

   /*
   Comienza el nodo parties----------------------------------------------------
   */

   ::oXmlParties   := TXmlNode():new( , 'Parties' )

      /*
      Comienza el nodo SellerParty---------------------------------------------
      */

      ::oXmlSellerParty    := TXmlNode():new( , 'SellerParty' )

         /*
         Comienza el nodo TotalInvoicesAmount-------------------------------
         */

         ::oXmlTaxIdentification  := TXmlNode():new( , 'TaxIdentification' )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'PersonTypeCode', ,          ::oSellerParty:cPersonTypeCode ) )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'ResidenceTypeCode', ,       ::oSellerParty:cResidenceTypeCode ) )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'TaxIdentificationNumber', , ::oSellerParty:TaxIdentificationNumber() ) )

         ::oXmlSellerParty:addBelow( ::oXmlTaxIdentification )

         /*
         Comienza el nodo LegalEntity------------------------------------------
         */

         if !Empty( ::oSellerParty:cCorporateName )

            ::oXmlLegalEntity  := TXmlNode():new( , 'LegalEntity' )

               if !Empty( ::oSellerParty:CorporateName() )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'CorporateName', ,  ::oSellerParty:CorporateName() ) )
               end if

               if !Empty( ::oSellerParty:TradeName() )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'TradeName', ,      ::oSellerParty:TradeName() ) )
               end if

               ::oXmlRegistrationData  := TXmlNode():new( , 'RegistrationData' )

                  if !Empty( ::oSellerParty:nBook )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Book', ,                        ::oSellerParty:nBook ) )
                  end if

                  if !Empty( ::oSellerParty:cRegisterOfCompaniesLocation )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'RegisterOfCompaniesLocation', , ::oSellerParty:cRegisterOfCompaniesLocation ) )
                  end if

                  if !Empty( ::oSellerParty:nSheet )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Sheet', ,                       ::oSellerParty:nSheet ) )
                  end if

                  if !Empty( ::oSellerParty:nFolio )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Folio', ,                       ::oSellerParty:nFolio ) )
                  end if

                  if !Empty( ::oSellerParty:cSection )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Section', ,                     ::oSellerParty:cSection ) )
                  end if

                  if !Empty( ::oSellerParty:nVolume )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Volume', ,                      ::oSellerParty:nVolume ) )
                  end if

                  if !Empty( ::oSellerParty:cAditionalRegistrationData )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'AditionalRegistrationData', ,   ::oSellerParty:cAditionalRegistrationData ) )
                  end if

               ::oXmlLegalEntity:addBelow( ::oXmlRegistrationData )

               /*
               Comienza el nodo de direcciones------------------------------------
               */

               ::oXmlAddressInSpain  := TXmlNode():new( , 'AddressInSpain' )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,     ::oSellerParty:Address() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,    ::oSellerParty:PostCode() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,        ::oSellerParty:Town() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,    ::oSellerParty:Province() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', , ::oSellerParty:CountryCode() ) )

               ::oXmlLegalEntity:addBelow( ::oXmlAddressInSpain )

               ::oXmlContactDetails := TXmlNode():new( , 'ContactDetails' )

                  if !Empty( ::oSellerParty:Telephone() )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'Telephone', ,      ::oSellerParty:Telephone() ) )
                  end if

                  if !Empty( ::oSellerParty:cTelFax )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'TeleFax', ,        ::oSellerParty:cTelFax ) )
                  end if

                  if !Empty( ::oSellerParty:cWebAddress )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'WebAddress', ,     ::oSellerParty:cWebAddress ) )
                  end if

                  if !Empty( ::oSellerParty:cElectronicMail )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'ElectronicMail', , ::oSellerParty:cElectronicMail ) )
                  end if

                  ::oXmlLegalEntity:addBelow( ::oXmlContactDetails )

               ::oXmlSellerParty:addBelow( ::oXmlLegalEntity )

            ::oXmlParties:addBelow( ::oXmlSellerParty )

         end if

         /*
         Comienza el nodo Individual------------------------------------------
         */

         if !Empty( ::oSellerParty:cName )

            ::oXmlLegalEntity  := TXmlNode():new( , 'Individual' )

               if !Empty( ::oSellerParty:cName )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'Name', ,  ::oSellerParty:Name() ) )
               end if

               if !Empty( ::oSellerParty:cName ) .or. !Empty( ::oSellerParty:cFirstSurname )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'FirstSurname', , ::oSellerParty:FirstSurname() ) )
               end if

               if !Empty( ::oSellerParty:cSecondSurname )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'SecondSurname', , ::oSellerParty:SecondSurname() ) )
               end if

               /*
               Comienza el nodo de direcciones------------------------------------
               */

               ::oXmlAddressInSpain  := TXmlNode():new( , 'AddressInSpain' )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,     ::oSellerParty:Address() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,    ::oSellerParty:PostCode() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,        ::oSellerParty:Town() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,    ::oSellerParty:Province() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', , ::oSellerParty:CountryCode() ) )

               ::oXmlLegalEntity:addBelow( ::oXmlAddressInSpain )

               ::oXmlContactDetails := TXmlNode():new( , 'ContactDetails' )

                  if !Empty( ::oSellerParty:Telephone() )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'Telephone', ,      ::oSellerParty:Telephone() ) )
                  end if

                  if !Empty( ::oSellerParty:cTelFax )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'TeleFax', ,        ::oSellerParty:cTelFax ) )
                  end if

                  if !Empty( ::oSellerParty:cWebAddress )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'WebAddress', ,     ::oSellerParty:cWebAddress ) )
                  end if

                  if !Empty( ::oSellerParty:cElectronicMail )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'ElectronicMail', , ::oSellerParty:cElectronicMail ) )
                  end if

                  ::oXmlLegalEntity:addBelow( ::oXmlContactDetails )

               ::oXmlSellerParty:addBelow( ::oXmlLegalEntity )

            ::oXmlParties:addBelow( ::oXmlSellerParty )

         end if

      /*
      Comienza el nodo BuyerParty---------------------------------------------
      */

      ::oXmlBuyerParty    := TXmlNode():new( , 'BuyerParty' )

         /*
         Comienza el nodo TaxIdentification-------------------------------
         */

         ::oXmlTaxIdentification  := TXmlNode():new( , 'TaxIdentification' )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'PersonTypeCode', ,          ::oBuyerParty:cPersonTypeCode ) )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'ResidenceTypeCode', ,       ::oBuyerParty:cResidenceTypeCode ) )
            ::oXmlTaxIdentification:addBelow( TXmlNode():new( , 'TaxIdentificationNumber', , ::oBuyerParty:TaxIdentificationNumber() ) )

         ::oXmlBuyerParty:addBelow( ::oXmlTaxIdentification )

         /*
         Comienza el nodo LegalEntity------------------------------------------
         */

         if !Empty( ::oBuyerParty:cCorporateName )

            ::oXmlLegalEntity  := TXmlNode():new( , 'LegalEntity' )

               if !Empty( ::oBuyerParty:CorporateName() )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'CorporateName', ,  ::oBuyerParty:CorporateName() ) )
               end if

               if !Empty( ::oBuyerParty:TradeName() )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'TradeName', ,      ::oBuyerParty:TradeName() ) )
               end if

               ::oXmlRegistrationData  := TXmlNode():new( , 'RegistrationData' )

                  if !Empty( ::oBuyerParty:nBook )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Book', ,                        ::oBuyerParty:nBook ) )
                  end if

                  if !Empty( ::oBuyerParty:cRegisterOfCompaniesLocation )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'RegisterOfCompaniesLocation', , ::oBuyerParty:cRegisterOfCompaniesLocation ) )
                  end if

                  if !Empty( ::oBuyerParty:nSheet )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Sheet', ,                       ::oBuyerParty:nSheet ) )
                  end if

                  if !Empty( ::oBuyerParty:nFolio )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Folio', ,                       ::oBuyerParty:nFolio ) )
                  end if

                  if !Empty( ::oBuyerParty:cSection )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Section', ,                     ::oBuyerParty:cSection ) )
                  end if

                  if !Empty( ::oBuyerParty:nVolume )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'Volume', ,                      ::oBuyerParty:nVolume ) )
                  end if

                  if !Empty( ::oBuyerParty:cAditionalRegistrationData )
                     ::oXmlRegistrationData:addBelow( TXmlNode():new( , 'AditionalRegistrationData', ,   ::oBuyerParty:cAditionalRegistrationData ) )
                  end if

               ::oXmlLegalEntity:addBelow( ::oXmlRegistrationData )

               /*
               Comienza el nodo de direcciones------------------------------------
               */

               ::oXmlAddressInSpain  := TXmlNode():new( , 'AddressInSpain' )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,     ::oBuyerParty:Address() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,    ::oBuyerParty:PostCode() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,        ::oBuyerParty:Town() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,    ::oBuyerParty:Province() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', , ::oBuyerParty:CountryCode() ) )

               ::oXmlLegalEntity:addBelow( ::oXmlAddressInSpain )

               ::oXmlContactDetails := TXmlNode():new( , 'ContactDetails' )

                  if !Empty( ::oBuyerParty:Telephone )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'Telephone', ,   ::oBuyerParty:Telephone() ) )
                  end if

                  if !Empty( ::oBuyerParty:TelFax() )
                     ::oXmlContactDetails:addBelow( TXmlNode():new( , 'TeleFax', ,     ::oBuyerParty:TelFax() ) )
               end if

               if !Empty( ::oBuyerParty:WebAddress() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'WebAddress', ,     ::oBuyerParty:WebAddress() ) )
               end if

               if !Empty( ::oBuyerParty:ElectronicMail() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'ElectronicMail', , ::oBuyerParty:ElectronicMail() ) )
               end if

               ::oXmlLegalEntity:addBelow( ::oXmlContactDetails )

            ::oXmlBuyerParty:addBelow( ::oXmlLegalEntity )

         end if

         /*
         Comienza el nodo Individual------------------------------------------
         */

         if !Empty( ::oBuyerParty:cName )

            ::oXmlLegalEntity  := TXmlNode():new( , 'Individual' )

               if !Empty( ::oBuyerParty:cName )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'Name', ,  ::oBuyerParty:Name() ) )
               end if

               if !Empty( ::oBuyerParty:cFirstSurname )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'FirstSurname', ,  ::oBuyerParty:FirstSurname() ) )
               end if

               if !Empty( ::oBuyerParty:cSecondSurname() )
                  ::oXmlLegalEntity:addBelow( TXmlNode():new( , 'SecondSurname', ,  ::oBuyerParty:SecondSurname() ) )
               end if

               /*
               Comienza el nodo de direcciones------------------------------------
               */

               ::oXmlAddressInSpain  := TXmlNode():new( , 'AddressInSpain' )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,     ::oBuyerParty:Address() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,    ::oBuyerParty:PostCode() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,        ::oBuyerParty:Town() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,    ::oBuyerParty:Province() ) )
                  ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', , ::oBuyerParty:CountryCode() ) )

               ::oXmlLegalEntity:addBelow( ::oXmlAddressInSpain )

               ::oXmlContactDetails := TXmlNode():new( , 'ContactDetails' )

               if !Empty( ::oBuyerParty:Telephone() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'Telephone', ,      ::oBuyerParty:Telephone() ) )
               end if

               if !Empty( ::oBuyerParty:TelFax() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'TeleFax', ,        ::oBuyerParty:TelFax() ) )
               end if

               if !Empty( ::oBuyerParty:WebAddress() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'WebAddress', ,     ::oBuyerParty:WebAddress() ) )
               end if

               if !Empty( ::oBuyerParty:ElectronicMail() )
                  ::oXmlContactDetails:addBelow( TXmlNode():new( , 'ElectronicMail', , ::oBuyerParty:ElectronicMail() ) )
               end if

               ::oXmlLegalEntity:addBelow( ::oXmlContactDetails )

            ::oXmlBuyerParty:addBelow( ::oXmlLegalEntity )

         end if

         ::oXmlParties:addBelow( ::oXmlBuyerParty )

      ::oXmlNode:addBelow( ::oXmlParties )

Return ( self )

//---------------------------------------------------------------------------//

METHOD InvoiceXml()

   local oTax
   local oItem
   local oInstallment

   /*
   Comienza el nodo header--------------------------------------------------
   */

   ::oXmlInvoices    := TXmlNode():new( , 'Invoices' )

      ::oXmlInvoice  := TXmlNode():new( , 'Invoice' )

         /*
         Inicio de InvoiceHeader-----------------------------------------------
         */

         ::oXmlInvoiceHeader  := TXmlNode():new( , 'InvoiceHeader' )
            ::oXmlInvoiceHeader:addBelow( TXmlNode():new( , 'InvoiceNumber', ,         ::cInvoiceNumber ) )
            ::oXmlInvoiceHeader:addBelow( TXmlNode():new( , 'InvoiceSeriesCode', ,     ::cInvoiceSeriesCode ) )
            ::oXmlInvoiceHeader:addBelow( TXmlNode():new( , 'InvoiceDocumentType', ,   InvoiceDocumentType ) )
            ::oXmlInvoiceHeader:addBelow( TXmlNode():new( , 'InvoiceClass', ,          InvoiceClass ) )

            /*
            Inicio de factura rectificativa rellenar solo si es el caso--------
            */

            if !Empty( ::cCorrectiveInvoiceNumber )

               ::oXmlCorrective  := TXmlNode():new( , 'Corrective' )
                  ::oXmlCorrective:addBelow( TXmlNode():new( , 'InvoiceNumber', ,      ::cCorrectiveInvoiceNumber ) )
                  ::oXmlCorrective:addBelow( TXmlNode():new( , 'ReasonCode', ,         ::cCorrectiveReasonCode ) )
                  ::oXmlCorrective:addBelow( TXmlNode():new( , 'ReasonDescription', ,  ::cCorrectiveReasonDescription ) )

                  ::oXmlTaxPeriod   := TXmlNode():new( , 'TaxPeriod' )
                     ::oXmlTaxPeriod:addBelow( TXmlNode():new( , 'StartDate', ,  ::CorrectiveStartDate() ) )
                     ::oXmlTaxPeriod:addBelow( TXmlNode():new( , 'EndDate', ,    ::CorrectiveEndDate() ) )

                  ::oXmlCorrective:addBelow( ::oXmlTaxPeriod )

                  ::oXmlCorrective:addBelow( TXmlNode():new( , 'CorrectionMethod', ,            ::cCorrectiveCorrectionMethod ) )
                  ::oXmlCorrective:addBelow( TXmlNode():new( , 'CorrectionMethodDescription', , ::cCorrectiveCorrectionMethodDescription ) )

               ::oXmlInvoiceHeader:addBelow( ::oXmlCorrective )

            end if

         ::oXmlInvoice:addBelow( ::oXmlInvoiceHeader )

         /*
         Fin de InvoiceHeader--------------------------------------------------
         */

         /*
         Inicio de IssueData---------------------------------------------------
         */

         if !Empty( ::dIssueDate )

            ::oXmlInvoiceIssueData  := TXmlNode():new( , 'InvoiceIssueData' )

               ::oXmlInvoiceIssueData:addBelow( TXmlNode():new( , 'IssueDate', ,      ::IssueDate() ) )
               ::oXmlInvoiceIssueData:addBelow( TXmlNode():new( , 'OperationDate', ,  ::OperationDate() ) )

               ::oXmlPlaceOfIssue  := TXmlNode():new( , 'PlaceOfIssue' )

                  ::oXmlPlaceOfIssue:addBelow( TXmlNode():new( , 'PostCode', ,                 ::PlaceOfIssuePostCode() ) )
                  ::oXmlPlaceOfIssue:addBelow( TXmlNode():new( , 'PlaceOfIssueDescription', ,  ::PlaceOfIssueDescription() ) )

               ::oXmlInvoiceIssueData:addBelow( ::oXmlPlaceOfIssue )

               ::oXmlInvoiceIssueData:addBelow( TXmlNode():new( , 'InvoiceCurrencyCode', ,   ::cInvoiceCurrencyCode ) )
               ::oXmlInvoiceIssueData:addBelow( TXmlNode():new( , 'TaxCurrencyCode', ,       ::cTaxCurrencyCode ) )
               ::oXmlInvoiceIssueData:addBelow( TXmlNode():new( , 'LanguageName', ,          ::cLanguageName ) )

            ::oXmlInvoice:addBelow( ::oXmlInvoiceIssueData )

         end if

         /*
         Comenzamos los Taxes--------------------------------------------------
         */

         ::oXmlTaxesOutputs   := TXmlNode():new( , 'TaxesOutputs' )

            for each oTax in ::aTax

               ::TaxesXml( oTax )

               ::oXmlTaxesOutputs:addBelow( ::oXmlTax )

            next

         ::oXmlInvoice:addBelow( ::oXmlTaxesOutputs )

         /*
         Comenzamos los Totals-------------------------------------------------
         */

         ::TotalXml()

         /*
         Comenzamos las lineas-------------------------------------------------
         */

         if !Empty( ::aItemLine )

            ::oXmlItems := TXmlNode():new( , 'Items' )

               for each oItem in ::aItemLine

                  ::ItemsXml( oItem )

                  ::oXmlItems:addBelow( ::oXmlInvoiceLine )

               next

            ::oXmlInvoice:addBelow( ::oXmlItems )

         end if

         /*
         Comenzamos los pagos--------------------------------------------------
         */

         if !Empty( ::aInstallment )

            ::oXmlPaymentDetails := TXmlNode():new( , 'PaymentDetails' )

            for each oInstallment in ::aInstallment

               ::InstallmentXml( oInstallment )

               ::oXmlPaymentDetails:addBelow( ::oXmlInstallment )

            next

            ::oXmlInvoice:addBelow( ::oXmlPaymentDetails )

         end if

         /*
         Fin de los pagos--------------------------------------------------
         */

      ::oXmlInvoices:addBelow( ::oXmlInvoice )

   ::oXmlNode:addBelow( ::oXmlInvoices )

Return ( self )

//---------------------------------------------------------------------------//

METHOD TaxesXml( oTax )

   if Empty( oTax )
      Return ( nil )
   end if

   /*
   Inicio de InvoiceHeader-----------------------------------------------------
   */

   ::oXmlTax         := TXmlNode():new( , 'Tax' )

   /*
   Tipo de impuestos--------------------------------------------------------------
   */

   if oTax:nTaxBase != 0

      ::oXmlTax:addBelow( TXmlNode():new( , 'TaxTypeCode', ,   oTax:cTaxTypeCode ) )
      ::oXmlTax:addBelow( TXmlNode():new( , 'TaxRate', ,       oTax:TaxRate() ) )

      ::oXmlTaxableBase := TXmlNode():new( , 'TaxableBase' )

         ::oXmlTaxableBase:addBelow( TXmlNode():new( , 'TotalAmount', ,       oTax:TaxBase() ) )
         ::oXmlTaxableBase:addBelow( TXmlNode():new( , 'EquivalentInEuros', , EquivalentInEuros ) )

      ::oXmlTax:addBelow( ::oXmlTaxableBase )

      ::oXmlTaxAmount   := TXmlNode():new( , 'TaxAmount' )

         ::oXmlTaxAmount:addBelow( TXmlNode():new( , 'TotalAmount', ,         oTax:TaxAmount() ) )
         ::oXmlTaxAmount:addBelow( TXmlNode():new( , 'EquivalentInEuros', ,   EquivalentInEuros ) )

      ::oXmlTax:addBelow( ::oXmlTaxAmount )

   end if

   /*
   Recargo de equivalencia--------------------------------------------------
   */

   if oTax:nEquivalenceSurchargeAmount != 0

      ::oXmlTax:addBelow( TXmlNode():new( , 'EquivalenceSurcharge', ,   oTax:EquivalenceSurcharge() ) )

      ::oXmlEquivalenceSurcharge := TXmlNode():new( , 'EquivalenceSurchargeAmount' )

         ::oXmlEquivalenceSurcharge:addBelow( TXmlNode():new( , 'TotalAmount', ,         oTax:EquivalenceSurchargeAmount() ) )
         ::oXmlEquivalenceSurcharge:addBelow( TXmlNode():new( , 'EquivalentInEuros', ,   EquivalentInEuros ) )

      ::oXmlTax:addBelow( ::oXmlEquivalenceSurcharge )

   end if

Return ( ::oXmlTax )

//---------------------------------------------------------------------------//

METHOD TotalXml()

   local oDiscount

   ::oXmlInvoiceTotals   := TXmlNode():new( , 'InvoiceTotals' )

      if !Empty( ::TotalGrossAmount() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalGrossAmount', ,   ::TotalGrossAmount() ) )
      end if

      /*
      Descuentos generales-----------------------------------------------------
      */

      if !Empty( ::aDiscount )

         ::oXmlGeneralDiscounts  := TXmlNode():new( , 'GeneralDiscounts' )

            for each oDiscount in ::aDiscount

               ::DiscountXml( oDiscount )

               ::oXmlGeneralDiscounts:addBelow( ::oXmlDiscount )

            next

         ::oXmlInvoiceTotals:addBelow( ::oXmlGeneralDiscounts )

      end if

      /*
      Fin de descuentos generales----------------------------------------------
      */

      if !Empty( ::TotalGeneralDiscounts() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalGeneralDiscounts', ,       ::TotalGeneralDiscounts() ) )
      end if

      if !Empty( ::TotalGeneralSurcharges() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalGeneralSurcharges', ,      ::TotalGeneralSurcharges() ) )
      end if

      if !Empty( ::TotalGrossAmountBeforeTaxes() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalGrossAmountBeforeTaxes', , ::TotalGrossAmountBeforeTaxes() ) )
      end if

      if !Empty( ::TotalTaxOutputs() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalTaxOutputs', ,             ::TotalTaxOutputs() ) )
      end if

      if !Empty( ::TotalTaxesWithheld() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalTaxesWithheld', ,          ::TotalTaxesWithheld() ) )
      end if

      if !Empty( ::InvoiceTotal() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'InvoiceTotal', ,                ::InvoiceTotal() ) )
      end if

      if !Empty( ::TotalOutstandingAmount() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalOutstandingAmount', ,      ::TotalOutstandingAmount() ) )
      end if

      if !Empty( ::TotalExecutableAmount() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalExecutableAmount', ,       ::TotalExecutableAmount() ) )
      end if

      if !Empty( ::TotalReimbursableExpenses() )
         ::oXmlInvoiceTotals:addBelow( TXmlNode():new( , 'TotalReimbursableExpenses', ,   ::TotalReimbursableExpenses() ) )
      end if

   ::oXmlInvoice:addBelow( ::oXmlInvoiceTotals )

Return ( self )

//---------------------------------------------------------------------------//

METHOD DiscountXml( oDiscount )

   ::oXmlDiscount   := TXmlNode():new( , 'Discount' )

      ::oXmlDiscount:addBelow( TXmlNode():new( , 'DiscountReason', , oDiscount:DiscountReason() ) )
      ::oXmlDiscount:addBelow( TXmlNode():new( , 'DiscountRate', ,   oDiscount:DiscountRate() ) )
      ::oXmlDiscount:addBelow( TXmlNode():new( , 'DiscountAmount', , oDiscount:DiscountAmount() ) )

Return ( ::oXmlDiscount )

//---------------------------------------------------------------------------//

METHOD ItemsXml( oItemLine )

   local oTax
   local oDiscount

   ::oXmlInvoiceLine := TXmlNode():new( , 'InvoiceLine' )

   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'ItemDescription', ,      oItemLine:ItemDescription() ) )
   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'Quantity', ,             oItemLine:Quantity() ) )
   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'UnitOfMeasure', ,        oItemLine:UnitOfMeasure() ) )
   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'UnitPriceWithoutTax', ,  oItemLine:UnitPriceWithoutTax() ) )
   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'TotalCost', ,            oItemLine:TotalCost() ) )

   /*
   Descuentos---------------------------------------------------------------
   */

   if !Empty( oItemLine:aDiscount )

      ::oXmlDiscountsAndRebates := TXmlNode():new( , 'DiscountsAndRebates' )

      for each oDiscount in oItemLine:aDiscount

         ::DiscountXml( oDiscount )

         ::oXmlDiscountsAndRebates:addBelow( ::oXmlDiscount )

      next

      ::oXmlInvoiceLine:addBelow( ::oXmlDiscountsAndRebates )

   end if

   ::oXmlInvoiceLine:addBelow( TXmlNode():new( , 'GrossAmount', , oItemLine:GrossAmount() ) )

   /*
   Comenzamos los Taxes--------------------------------------------------
   */

   if !Empty( oItemLine:aTax )

      ::oXmlTaxesOutputs   := TXmlNode():new( , 'TaxesOutputs' )

      for each oTax in oItemLine:aTax

         ::TaxesXml( oTax )

         ::oXmlTaxesOutputs:addBelow( ::oXmlTax )

      next

      ::oXmlInvoiceLine:addBelow( ::oXmlTaxesOutputs )

   end if

Return ( self )

//---------------------------------------------------------------------------//

METHOD InstallmentXml( oInstallment )

   ::oXmlInstallment := TXmlNode():new( , 'Installment' )

   ::oXmlInstallment:addBelow( TXmlNode():new( , 'InstallmentDueDate', ,   oInstallment:InstallmentDueDate() ) )
   ::oXmlInstallment:addBelow( TXmlNode():new( , 'InstallmentAmount', ,    oInstallment:InstallmentAmount() ) )
   ::oXmlInstallment:addBelow( TXmlNode():new( , 'PaymentMeans', ,         oInstallment:cPaymentMeans ) )

   if !Empty( oInstallment:oAccountToBeDebited )

      ::oXmlAccountToBeDebited  := TXmlNode():new( , 'AccountToBeDebited' )

         ::oXmlAccountToBeDebited:addBelow( TXmlNode():new( , 'IBAN', ,       oInstallment:oAccountToBeDebited:IBAN() ) )
         ::oXmlAccountToBeDebited:addBelow( TXmlNode():new( , 'BankCode', ,   oInstallment:oAccountToBeDebited:BankCode() ) )
         ::oXmlAccountToBeDebited:addBelow( TXmlNode():new( , 'BranchCode', , oInstallment:oAccountToBeDebited:BranchCode() ) )

         ::oXmlAddressInSpain  := TXmlNode():new( , 'AddressInSpain' )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,     oInstallment:oAccountToBeDebited:Address() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,    oInstallment:oAccountToBeDebited:PostCode() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,        oInstallment:oAccountToBeDebited:Town() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,    oInstallment:oAccountToBeDebited:Province() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', , oInstallment:oAccountToBeDebited:CountryCode() ) )

         ::oXmlAccountToBeDebited:addBelow( ::oXmlAddressInSpain )

      ::oXmlInstallment:addBelow( ::oXmlAccountToBeDebited )

   end if

   if !Empty( oInstallment:oAccountToBeCredited )

      ::oXmlAccountToBeCredited  := TXmlNode():new( , 'AccountToBeCredited' )

         ::oXmlAccountToBeCredited:addBelow( TXmlNode():new( , 'IBAN', ,         oInstallment:oAccountToBeCredited:IBAN() ) )
         ::oXmlAccountToBeCredited:addBelow( TXmlNode():new( , 'BankCode', ,     oInstallment:oAccountToBeCredited:BankCode() ) )
         ::oXmlAccountToBeCredited:addBelow( TXmlNode():new( , 'BranchCode', ,   oInstallment:oAccountToBeCredited:BranchCode() ) )

         ::oXmlAddressInSpain  := TXmlNode():new( , 'BranchInSpainAddress' )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Address', ,        oInstallment:oAccountToBeCredited:Address() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'PostCode', ,       oInstallment:oAccountToBeCredited:PostCode() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Town', ,           oInstallment:oAccountToBeCredited:Town() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'Province', ,       oInstallment:oAccountToBeCredited:Province() ) )
            ::oXmlAddressInSpain:addBelow( TXmlNode():new( , 'CountryCode', ,    oInstallment:oAccountToBeCredited:CountryCode() ) )

         ::oXmlAccountToBeCredited:addBelow( ::oXmlAddressInSpain )

      ::oXmlInstallment:addBelow( ::oXmlAccountToBeCredited )

   end if

Return ( self )

//---------------------------------------------------------------------------//

METHOD Firma()

   local xRet
   local hLib
   local oNode
   local oError
   local oBlock

   if !File( FullCurDir() + "\aeatfact.dll")
      ::oTree:Add( "No existe el componente AeatFact.Dll" )
      Return ( Self )
   end if

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::oFirma    := CreateObject( "AEATFACT.AeatFactCtl" )

   RECOVER USING oError

      WaitRun( "regsvr32 /s " + FullcurDir() + "AeatFact.Dll" )

      ::oFirma    := CreateObject( "AEATFACT.AeatFactCtl" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( ::oFirma )

      xRet        := ::oFirma:FIRMA( ::cFicheroOrigen, ::cNif, ::cFicheroDestino )
      xRet        := ::oFirma:VERIFICA( ::cFicheroOrigen, ::cFicheroDestino )

      if Left( xRet, 2 ) == "00"

         oNode := ::oTree:Add( "Firma digital realizada satisfactoriamente.", 1 )

         oNode:Add( xRet, 1 )
         oNode:Expand()

      else

         oNode := ::oTree:Add( "Error al realizar la firma digital." )

         oNode:Add( xRet )
         oNode:Expand()

      end if

   else

      ::oTree:Add( "No se ha podido crear el objeto para la firma digital." )

   end if

Return ( self )

//---------------------------------------------------------------------------//

METHOD VerificaFirma()

   local xRet
   local oError
   local oBlock

   if !File( FullCurDir() + "\aeatfact.dll")
      ::oTree:Add( "No existe el componente AeatFact.Dll" )
      Return ( Self )
   end if

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      ::oFirma    := CreateObject( "AEATFACT.AeatFactCtl" )

   RECOVER USING oError

      WaitRun( "regsvr32 /s " + FullcurDir() + "AeatFact.Dll" )

      ::oFirma    := CreateObject( "AEATFACT.AeatFactCtl" )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( ::oFirma )

      xRet        := ::oFirma:VERIFICA( ::cFicheroOrigen, ::cFicheroDestino )

      ::oTree:Add( xRet, if( Left( xRet, 2 ) == "00", 1, 0 ) )

   end if

Return ( self )

//---------------------------------------------------------------------------//

METHOD FirmaJava()

   local oError
   local oBlock

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      logwrite(   "java -jar " + FullCurDir() + "firma\firma.jar " + ::cFicheroOrigen + space(1) + ::cFicheroDestino + space( 1 ) + "Explorer" )
      waitRun(    "java -jar " + FullCurDir() + "firma\firma.jar " + ::cFicheroOrigen + space(1) + ::cFicheroDestino + space( 1 ) + "Explorer", 6 )

      ::oTree:Add( "Firma digital realizada satisfactoriamente.", 1 )

   RECOVER USING oError

      ::oTree:Add( "No se ha podido realizar la firma digital." )

   END SEQUENCE

   ErrorBlock( oBlock )

Return ( self )

//---------------------------------------------------------------------------//

METHOD Enviar()

   local oError
   local oBlock
   local lSendMail               := .f.

   if Empty( ::cMailServer ) .or. Empty( ::cMailServerUserName ) .or. Empty( ::cMailServerPassword )
      ::oTree:Add( "Debe cumplimentar los datos de servidor de correo electr�nico en la configuraci�n de empresa." )
      Return ( lSendMail )
   end if

   if !File( ::cFicheroDestino )
      ::oTree:Add( "No existe fichero firmado " + Lower( ::cFicheroDestino ) + " en formato Facturae." )
      Return ( lSendMail )
   end if

   with object ( TGenMailing():New() )

      :SetAdjunto(      ::cFicheroDestino )
      :SetPara(         "mcalero@gestool.es" )
      :SetAsunto(       "Env�o de  factura de cliente" )
      :SetMensaje(      "Adjunto le remito nuestra factura de cliente" )
      :SetMensaje(      CRLF )
      :SetMensaje(      CRLF )
      :SetMensaje(      "Reciba un cordial saludo." )

      :lExternalSend()

   end with

Return ( lSendMail )

//---------------------------------------------------------------------------//

METHOD ShowInWeb()

   local oDlg
   local oActiveX

   DEFINE DIALOG oDlg         RESOURCE "ShowFacturae"

   REDEFINE ACTIVEX oActiveX  ID 100      OF oDlg  PROGID "Shell.Explorer"

   REDEFINE BUTTON            ID IDCANCEL OF oDlg  ACTION ( oDlg:End() )

   oDlg:bStart                := {|| oActiveX:Do( "Navigate", ::cFicheroOrigen ), SysRefresh() }

   ACTIVATE DIALOG oDlg CENTERED

return nil

//---------------------------------------------------------------------------//
// Estructuras y clases auxiliares-------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//

CLASS Party

   DATA     cTaxIdentificationNumber      INIT ''
   DATA     cCountryCode                  INIT 'ESP'
   DATA     cCorporateName                INIT ''
   DATA     cTradeName                    INIT ''
   DATA     cRegistrationData             INIT ''
   DATA     nBook                         INIT ''
   DATA     cRegisterOfCompaniesLocation  INIT ''
   DATA     nSheet                        INIT '-'
   DATA     nFolio                        INIT ''
   DATA     cSection                      INIT ''
   DATA     nVolume                       INIT ''
   DATA     cAditionalRegistrationData    INIT ''
   DATA     cAddress                      INIT ''
   DATA     cPostCode                     INIT ''
   DATA     cTown                         INIT ''
   DATA     cProvince                     INIT ''
   DATA     cTelephone                    INIT ''
   DATA     cTelFax                       INIT ''
   DATA     cWebAddress                   INIT ''
   DATA     cElectronicMail               INIT ''
   DATA     cPersonTypeCode               INIT 'F'
   DATA     cResidenceTypeCode            INIT 'R'

   DATA     cName                         INIT ''
   DATA     cFirstSurname                 INIT ''
   DATA     cSecondSurname                INIT ''

   ACCESS   TaxIdentificationNumber       INLINE ( Rtrim( Left( ::cTaxIdentificationNumber, 30 ) ) )

   ACCESS   Telephone                     INLINE ( Rtrim( ::cTelephone         ) )
   ACCESS   TelFax                        INLINE ( Rtrim( ::cTelFax            ) )
   ACCESS   WebAddress                    INLINE ( Rtrim( ::cWebAddress        ) )
   ACCESS   ElectronicMail                INLINE ( Rtrim( ::cElectronicMail    ) )
   ACCESS   PersonTypeCode                INLINE ( Rtrim( ::cPersonTypeCode    ) )
   ACCESS   ResidenceTypeCode             INLINE ( Rtrim( ::cResidenceTypeCode ) )

   ACCESS   CorporateName                 INLINE ( Rtrim( Left( ::cCorporateName, 80 ) ) )
   ACCESS   TradeName                     INLINE ( Rtrim( Left( ::cTradeName, 40 ) ) )
   ACCESS   Address                       INLINE ( Rtrim( Left( ::cAddress, 80 ) ) )
   ACCESS   PostCode                      INLINE ( Rtrim( Left( ::cPostCode, 9 ) ) )
   ACCESS   Town                          INLINE ( Rtrim( Left( ::cTown, 50 ) ) )
   ACCESS   Province                      INLINE ( Rtrim( Left( ::cProvince, 20 ) ) )
   ACCESS   CountryCode                   INLINE ( Rtrim( Left( ::cCountryCode, 3 ) ) )

   ACCESS   Name                          INLINE ( Rtrim( Left( ::cName, 40 ) ) )
   ACCESS   FirstSurname                  INLINE ( Rtrim( Left( ::cFirstSurname, 40 ) ) )
   ACCESS   SecondSurname                 INLINE ( Rtrim( Left( ::cSecondSurname, 40 ) ) )

ENDCLASS

//---------------------------------------------------------------------------//

CLASS Tax

   DATA     cTaxTypeCode                  INIT '01'
   DATA     nTaxRate                      INIT 0.00
   DATA     nTaxBase                      INIT 0.00
   DATA     nTaxAmount                    INIT 0.00
   DATA     nEquivalenceSurcharge         INIT 0.00
   DATA     nEquivalenceSurchargeAmount   INIT 0.00

   ACCESS   TaxRate                       INLINE ( Alltrim( Trans( ::nTaxRate,                     DoubleTwoDecimalPicture ) ) )
   ACCESS   TaxBase                       INLINE ( Alltrim( Trans( ::nTaxBase,                     DoubleTwoDecimalPicture ) ) )
   ACCESS   TaxAmount                     INLINE ( Alltrim( Trans( ::nTaxAmount,                   DoubleTwoDecimalPicture ) ) )
   ACCESS   EquivalenceSurcharge          INLINE ( Alltrim( Trans( ::nEquivalenceSurcharge,        DoubleTwoDecimalPicture ) ) )
   ACCESS   EquivalenceSurchargeAmount    INLINE ( Alltrim( Trans( ::nEquivalenceSurchargeAmount,  DoubleTwoDecimalPicture ) ) )

ENDCLASS

//---------------------------------------------------------------------------//

CLASS Discount

   DATA     cDiscountReason               INIT '-'
   DATA     nDiscountRate                 INIT 0.00
   DATA     nDiscountAmount               INIT 0.000000

   ACCESS   DiscountReason                INLINE ( ::cDiscountReason )
   ACCESS   DiscountRate                  INLINE ( Alltrim( Trans( ::nDiscountRate,    DoubleFourDecimalPicture ) ) )
   ACCESS   DiscountAmount                INLINE ( Alltrim( Trans( ::nDiscountAmount,  DoubleSixDecimalPicture  ) ) )

ENDCLASS

//---------------------------------------------------------------------------//

CLASS ItemLine

   DATA     oFacturaElectronica

   DATA     cItemDescription              INIT ''
   DATA     nQuantity                     INIT 0.00
   DATA     cUnitOfMeasure                INIT '01'
   DATA     nUnitPriceWithoutTax          INIT 0.000000
   DATA     nTotalCost                    INIT 0.00
   DATA     aDiscount                     INIT {}
   DATA     nGrossAmount                  INIT 0.00
   DATA     aTax                          INIT {}

   ACCESS   ItemDescription               INLINE ( Rtrim( ::cItemDescription ) )
   ACCESS   UnitOfMeasure                 INLINE ( ::cUnitOfMeasure )
   ACCESS   Quantity                      INLINE ( Alltrim( Trans( ::nQuantity,                          DoubleTwoDecimalPicture ) ) )
   ACCESS   UnitPriceWithoutTax           INLINE ( Alltrim( Trans( ::nUnitPriceWithoutTax,               DoubleSixDecimalPicture ) ) )
   ACCESS   TotalCost                     INLINE ( Alltrim( Trans( ::nQuantity * ::nUnitPriceWithoutTax, DoubleSixDecimalPicture ) ) )

   //------------------------------------------------------------------------//

   METHOD New( oFacturaElectronica )      CONSTRUCTOR

   METHOD addDiscount( oDiscount )
   METHOD GrossAmount()

   METHOD addTax( oTax )                  INLINE aAdd( ::aTax, oTax )

ENDCLASS

//---------------------------------------------------------------------------//

METHOD New( oFacturaElectronica )

   ::oFacturaElectronica               := oFacturaElectronica 

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD addDiscount( oDiscount )

   if Empty( ::nTotalCost )
      ::nTotalCost                     := ::nQuantity * ::nUnitPriceWithoutTax
   end if

   oDiscount:nDiscountAmount           := Round( ::nTotalCost * oDiscount:nDiscountRate / 100, nRouDiv() )

   aAdd( ::aDiscount, oDiscount )

RETURN ( oDiscount )

//------------------------------------------------------------------------//

METHOD GrossAmount()

   local oDiscount

   ::nGrossAmount       := ::nQuantity * ::nUnitPriceWithoutTax

   for each oDiscount in ::aDiscount
      ::nGrossAmount    -= oDiscount:nDiscountAmount
   next

RETURN ( Alltrim( Trans( ::nGrossAmount, DoubleSixDecimalPicture ) ) )

//---------------------------------------------------------------------------//

CLASS Installment

   DATA     dInstallmentDueDate
   DATA     nInstallmentAmount      INIT 0.00
   DATA     cPaymentMeans           INIT '02'

   DATA     oAccountToBeCredited
   DATA     oAccountToBeDebited

   ACCESS   InstallmentDueDate      INLINE ( dToIso( ::dInstallmentDueDate ) )
   ACCESS   InstallmentAmount       INLINE ( Alltrim( Trans( ::nInstallmentAmount,  DoubleTwoDecimalPicture ) ) )

ENDCLASS

//---------------------------------------------------------------------------//

CLASS Account

   DATA     cIBAN                   INIT ''
   DATA     cBankCode               INIT ''
   DATA     cBranchCode             INIT ''

   DATA     cAddress                INIT ''
   DATA     cPostCode               INIT ''
   DATA     cTown                   INIT ''
   DATA     cProvince               INIT ''
   DATA     cCountryCode            INIT 'ESP'

   ACCESS   IBAN                    INLINE ( 'ES88' + Rtrim( Left( ::cIBAN, 30 ) ) )
   ACCESS   BankCode                INLINE ( Rtrim( Left( ::cBankCode, 60 ) ) )
   ACCESS   BranchCode              INLINE ( Rtrim( Left( ::cBranchCode, 60 ) ) )

   ACCESS   Address                 INLINE ( Rtrim( Left( ::cAddress, 80 ) ) )
   ACCESS   PostCode                INLINE ( Rtrim( Left( ::cPostCode, 9 ) ) )
   ACCESS   Town                    INLINE ( Rtrim( Left( ::cTown, 50 ) ) )
   ACCESS   Province                INLINE ( Rtrim( Left( ::cProvince, 20 ) ) )
   ACCESS   CountryCode             INLINE ( Rtrim( Left( ::cCountryCode, 3 ) ) )

ENDCLASS

//---------------------------------------------------------------------------//

/*
<namespace:Facturae xmlns:namespace="http://www.facturae.es/Facturae/2009/v3.2/Facturae" xmlns:namespace2="http://www.w3.org/2001/XMLSchema" xmlns:namespace3="http://www.w3.org/2000/09/xmldsig#">
<FileHeader>
<SchemaVersion>3.2</SchemaVersion>
<Modality>I</Modality>
<InvoiceIssuerType>EM</InvoiceIssuerType>
<Batch>
<BatchIdentifier>99999999R_F00010</BatchIdentifier>
<InvoicesCount>1</InvoicesCount>
<TotalInvoicesAmount>
<TotalAmount>672.35</TotalAmount>
</TotalInvoicesAmount>
<TotalOutstandingAmount>
<TotalAmount>672.35</TotalAmount>
</TotalOutstandingAmount>
<TotalExecutableAmount>
<TotalAmount>672.35</TotalAmount>
</TotalExecutableAmount>
<InvoiceCurrencyCode>EUR</InvoiceCurrencyCode>
</Batch>
</FileHeader>
<Parties>
<SellerParty>
<TaxIdentification>
<PersonTypeCode>F</PersonTypeCode>
<ResidenceTypeCode>R</ResidenceTypeCode>
<TaxIdentificationNumber>99999999R</TaxIdentificationNumber>
</TaxIdentification>
<Individual>
<Name>JUAN ESPA�OL ESPA�OL</Name>
<FirstSurname/>
<SecondSurname/>
<AddressInSpain>
<Address>Domicilio</Address>
<PostCode>30000</PostCode>
<Town>Poblacion</Town>
<Province>Provincia</Province>
<CountryCode>ESP</CountryCode>
</AddressInSpain>
<ContactDetails>
<Telephone>968112233</Telephone>
<TeleFax>968223300</TeleFax>
<WebAddress>www.paginaweb.es</WebAddress>
<ElectronicMail>email@ncs.es</ElectronicMail>
<ContactPersons>Persona de Contacto</ContactPersons>
</ContactDetails>
</Individual>
</SellerParty>
<BuyerParty>
<TaxIdentification>
<PersonTypeCode>J</PersonTypeCode>
<ResidenceTypeCode>R</ResidenceTypeCode>
<TaxIdentificationNumber>Q2826000H</TaxIdentificationNumber>
</TaxIdentification>
<LegalEntity>
<CorporateName>AEAT</CorporateName>
<TradeName>AEAT</TradeName>
<AddressInSpain>
<Address>Calle Sta Maria Magdalena</Address>
<PostCode>28016</PostCode>
<Town>Madrid</Town>
<Province>Madrid</Province>
<CountryCode>ESP</CountryCode>
</AddressInSpain>
<ContactDetails>
<Telephone></Telephone>
<TeleFax/>
<WebAddress/>
<ElectronicMail>email@email.es</ElectronicMail>
<ContactPersons/>
</ContactDetails>
</LegalEntity>
</BuyerParty>
</Parties>
<Invoices>
<Invoice>
<InvoiceHeader>
<InvoiceNumber>00010</InvoiceNumber>
<InvoiceSeriesCode>F</InvoiceSeriesCode>
<InvoiceDocumentType>FC</InvoiceDocumentType>
<InvoiceClass>OO</InvoiceClass>
</InvoiceHeader>
<InvoiceIssueData>
<IssueDate>2009-10-02</IssueDate>
<InvoiceCurrencyCode>EUR</InvoiceCurrencyCode>
<TaxCurrencyCode>EUR</TaxCurrencyCode>
<LanguageName>es</LanguageName>
</InvoiceIssueData>
<TaxesOutputs>
<Tax>
<TaxTypeCode>01</TaxTypeCode>
<TaxRate>16.00</TaxRate>
<TaxableBase>
<TotalAmount>301.50</TotalAmount>
</TaxableBase>
<TaxAmount>
<TotalAmount>48.24</TotalAmount>
</TaxAmount>
</Tax>
<Tax>
<TaxTypeCode>01</TaxTypeCode>
<TaxRate>7.00</TaxRate>
<TaxableBase>
<TotalAmount>301.50</TotalAmount>
</TaxableBase>
<TaxAmount>
<TotalAmount>21.11</TotalAmount>
</TaxAmount>
</Tax>
</TaxesOutputs>
<InvoiceTotals>
<TotalGrossAmount>603.00</TotalGrossAmount>
<TotalGeneralDiscounts>0.00</TotalGeneralDiscounts>
<TotalGeneralSurcharges>0.00</TotalGeneralSurcharges>
<TotalGrossAmountBeforeTaxes>603.00</TotalGrossAmountBeforeTaxes>
<TotalTaxOutputs>69.35</TotalTaxOutputs>
<TotalTaxesWithheld>0.00</TotalTaxesWithheld>
<InvoiceTotal>672.35</InvoiceTotal>
<TotalOutstandingAmount>672.35</TotalOutstandingAmount>
<TotalExecutableAmount>672.35</TotalExecutableAmount>
<TotalReimbursableExpenses>0.00</TotalReimbursableExpenses>
</InvoiceTotals>
<Items>
<InvoiceLine>
<ItemDescription>ARTICULO 0101</ItemDescription>
<Quantity>1</Quantity>
<UnitOfMeasure>01</UnitOfMeasure>
<UnitPriceWithoutTax>100.500000</UnitPriceWithoutTax>
<TotalCost>100.500000</TotalCost>
<GrossAmount>100.500000</GrossAmount>
<TaxesOutputs>
<Tax>
<TaxTypeCode>01</TaxTypeCode>
<TaxRate>16.00</TaxRate>
<TaxableBase>
<TotalAmount>100.50</TotalAmount>
</TaxableBase>
<TaxAmount>
<TotalAmount>16.08</TotalAmount>
</TaxAmount>
</Tax>
</TaxesOutputs>
<AdditionalLineItemInformation/>
</InvoiceLine>
<InvoiceLine>
<ItemDescription>ARTICULO 0102</ItemDescription>
<Quantity>2</Quantity>
<UnitOfMeasure>01</UnitOfMeasure>
<UnitPriceWithoutTax>100.500000</UnitPriceWithoutTax>
<TotalCost>201.000000</TotalCost>
<GrossAmount>201.000000</GrossAmount>
<TaxesOutputs>
<Tax>
<TaxTypeCode>01</TaxTypeCode>
<TaxRate>16.00</TaxRate>
<TaxableBase>
<TotalAmount>201.00</TotalAmount>
</TaxableBase>
<TaxAmount>
<TotalAmount>32.16</TotalAmount>
</TaxAmount>
</Tax>
</TaxesOutputs>
<AdditionalLineItemInformation/>
</InvoiceLine>
<InvoiceLine>
<ItemDescription>ARTICULO 0103</ItemDescription>
<Quantity>3</Quantity>
<UnitOfMeasure>01</UnitOfMeasure>
<UnitPriceWithoutTax>100.500000</UnitPriceWithoutTax>
<TotalCost>301.500000</TotalCost>
<GrossAmount>301.500000</GrossAmount>
<TaxesOutputs>
<Tax>
<TaxTypeCode>01</TaxTypeCode>
<TaxRate>7.00</TaxRate>
<TaxableBase>
<TotalAmount>301.50</TotalAmount>
</TaxableBase>
<TaxAmount>
<TotalAmount>21.11</TotalAmount>
</TaxAmount>
</Tax>
</TaxesOutputs>
<AdditionalLineItemInformation/>
</InvoiceLine>
</Items>
<PaymentDetails>
<Installment>
<InstallmentDueDate>2009-10-02</InstallmentDueDate>
<InstallmentAmount>672.35</InstallmentAmount>
<PaymentMeans>01</PaymentMeans>
<CollectionAdditionalInformation>Contado</CollectionAdditionalInformation>
</Installment>
</PaymentDetails>
</Invoice>
</Invoices>
</namespace:Facturae>
*/