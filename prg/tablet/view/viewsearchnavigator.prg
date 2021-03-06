#include "FiveWin.Ch"
#include "Factu.ch" 

CLASS ViewSearchNavigator FROM ViewNavigator

   METHOD New( oSender )

   DATA cTextoTipoDocumento
   METHOD setTextoTipoDocumento()      VIRTUAL

   DATA aItemsBusqueda
   METHOD setItemsBusqueda()           VIRTUAL

   METHOD Resource()
   
   METHOD BarraBusqueda()

   METHOD getComboboxOrden()
   METHOD changeComboboxOrden()

END CLASS

//---------------------------------------------------------------------------//

METHOD New( oSender ) CLASS ViewSearchNavigator

   ::oSender   := oSender

   ::setTextoTipoDocumento()

   ::setItemsBusqueda()

Return ( self )

//---------------------------------------------------------------------------//

METHOD Resource() CLASS ViewSearchNavigator

   ::oDlg                  := TDialog():New( 1, 5, 40, 100, "GESTOOL TABLET",,, .f., ::Style,, rgb( 255, 255, 255 ),,, .F.,, oGridFont(),,,, .f.,, "oDlg" )

   ::TituloBrowse()

   ::BotonSalirBrowse()

   ::BarraBusqueda()

   ::Super:Resource()

   ::oDlg:bResized         := {|| ::DialogResize() }

   ::oDlg:Activate( ,,,.t.,,, {|| ::InitDialog() } )

Return ( self )

//---------------------------------------------------------------------------//

METHOD BarraBusqueda() CLASS ViewSearchNavigator

   local cGetSearch        := Space( 100 )
   local oGetSearch
   local oComboboxOrden
   local cComboboxOrden    := ::getComboboxOrden()

   oGetSearch        := TGridGet():Build(       {  "nRow"      => 45,;
                                                   "nCol"      => {|| GridWidth( 0.5, ::oDlg ) },;
                                                   "bSetGet"   => {|u| if( PCount() == 0, cGetSearch, cGetSearch := u ) },;
                                                   "oWnd"      => ::oDlg,;
                                                   "nWidth"    => {|| GridWidth( 9, ::oDlg ) },;
                                                   "nHeight"   => 25,;
                                                   "bValid"    => {|| OrdClearScope( ::oBrowse, ::getWorkArea() ) },;
                                                   "bChanged"  => {| nKey, nFlags | AutoSeek( nKey, nFlags, oGetSearch, ::oBrowse, ::getWorkArea(), .t. ) } } )

   oComboboxOrden    := TGridComboBox():Build(  {  "nRow"      => 45,;
                                                   "nCol"      => {|| GridWidth( 9.5, ::oDlg ) },;
                                                   "bSetGet"   => {|u| if( PCount() == 0, cComboboxOrden, cComboboxOrden := u ) },;
                                                   "oWnd"      => ::oDlg,;
                                                   "nWidth"    => {|| GridWidth( 2, ::oDlg ) },;
                                                   "nHeight"   => 25,;
                                                   "aItems"    => ::aItemsBusqueda,;
                                                   "bChange"   => {|| ::ChangeComboboxOrden( oComboboxOrden, oGetSearch ) } } )

Return ( self )

//---------------------------------------------------------------------------//

METHOD getComboboxOrden() CLASS ViewSearchNavigator

   local cOrden   := ""

   if isArray( ::aItemsBusqueda ) .and. len( ::aItemsBusqueda ) > 1

      cOrden      := ::aItemsBusqueda[1]

   end if

Return ( cOrden )

//---------------------------------------------------------------------------//

METHOD ChangeComboboxOrden( oComboboxOrden, oGetSearch ) CLASS ViewSearchNavigator

   ( ::getWorkArea() )->( OrdSetFocus( oComboboxOrden:nAt ) )
   
   oGetSearch:SetFocus()

   ::oBrowse:Refresh()

Return ( self )

//---------------------------------------------------------------------------//