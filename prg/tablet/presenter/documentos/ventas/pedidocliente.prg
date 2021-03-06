#include "FiveWin.Ch"
#include "Factu.ch"

CLASS PedidoCliente FROM DocumentosVentas  

   METHOD New()

   METHOD setEnviroment()              INLINE ( ::setDataTable( "PedCliT" ), ( ::getWorkArea() )->( OrdSetFocus( "dFecDes" ) ) )

   METHOD setNavigator()

   METHOD PropiedadesBrowseDetail()

   METHOD Resource( nMode )

   METHOD ResourceDetail( nMode )

   METHOD GetAppendDocumento()

   METHOD GetEditDocumento()

   METHOD GetAppendDetail()
   
   METHOD GetEditDetail()

   METHOD StartResourceDetail()

END CLASS

//---------------------------------------------------------------------------//

METHOD New() CLASS PedidoCliente

   if ::OpenFiles()
      
      ::setEnviroment()

      ::setNavigator()

      ::CloseFiles()

   end if   

return ( self )

//---------------------------------------------------------------------------//

METHOD setNavigator() CLASS PedidoCliente

   ::oViewSearchNavigator       := PedidoClienteViewSearchNavigator():New( self )

   if !Empty( ::oViewSearchNavigator )
      ::oViewSearchNavigator:Resource()
   end if

return ( self )

//---------------------------------------------------------------------------//

METHOD Resource( nMode ) CLASS PedidoCliente

   ::oViewEdit       := ViewEdit():New( self )

   if !Empty( ::oViewEdit )

      ::oViewEdit:SetTextoTipoDocumento( LblTitle( nMode ) + "pedido" )
      
      ::oViewEdit:ResourceViewEdit( nMode )

   end if

Return ( .t. )   

//---------------------------------------------------------------------------//

METHOD ResourceDetail( nMode ) CLASS PedidoCliente

   local lResult     := .f.

   ::nMode           := nMode

   ::oViewEditDetail := ViewDetail():New( self )

   if !Empty( ::oViewEditDetail )

      lResult        := ::oViewEditDetail:ResourceViewEditDetail( nMode )

   end if

Return ( lResult )   

//---------------------------------------------------------------------------//

METHOD StartResourceDetail() CLASS PedidoCliente

   ::CargaArticulo()

   ::RecalculaLinea()

Return ( self )

//---------------------------------------------------------------------------//

METHOD GetAppendDocumento() CLASS PedidoCliente

   ::hDictionaryMaster      := D():GetPedidoClienteDefaultValue( ::nView )
   ::hDictionaryDetail      := {}

Return ( self )

//---------------------------------------------------------------------------//

METHOD GetEditDocumento() CLASS PedidoCliente

   ::hDictionaryMaster      := D():GetPedidoClienteById( D():PedidosClientesId( ::nView ), ::nView ) 
   ::hDictionaryDetail      := D():GetPedidoClienteLineas( ::nView )

Return ( self )

//---------------------------------------------------------------------------//

METHOD PropiedadesBrowseDetail() CLASS PedidoCliente

   ::oViewEdit:oBrowse:cName  := "Grid pedidos lineas"

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "N�mero"
      :bEditValue             := {|| ::getDataBrowse( "NumeroLinea" ) }
      :cEditPicture           := "9999"
      :nWidth                 := 55
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :lHide                  := .t.   
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "C�d"
      :bEditValue             := {|| ::getDataBrowse( "Articulo" ) }
      :nWidth                 := 80
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "Descripci�n"
      :bEditValue             := {|| ::getDataBrowse( "DescripcionArticulo" ) }
      :bFooter                := {|| "Total..." }
      :nWidth                 := 310
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := cNombreCajas()
      :bEditValue             := {|| ::getDataBrowse( "Cajas" ) }
      :cEditPicture           := MasUnd()
      :nWidth                 := 60
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :lHide                  := .t.
      :nFooterType            := AGGR_SUM
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := cNombreUnidades()
      :bEditValue             := {|| ::getDataBrowse( "Unidades" ) }
      :cEditPicture           := MasUnd()
      :nWidth                 := 60
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :lHide                  := .t.
      :nFooterType            := AGGR_SUM
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "Und"
      :bEditValue             := {|| nTotNPedCli( ::hDictionaryDetail[ ::oViewEdit:oBrowse:nArrayAt ] ) }
      :cEditPicture           := MasUnd()
      :nWidth                 := 90
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :nFooterType            := AGGR_SUM
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "Precio"
      :bEditValue             := {|| nTotUPedCli( ::hDictionaryDetail[ ::oViewEdit:oBrowse:nArrayAt ] ) }
      :cEditPicture           := cPouDiv( hGet( ::hDictionaryMaster, "Divisa" ), D():Divisas( ::nView ) )
      :nWidth                 := 90
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "% Dto."
      :bEditValue             := {|| ::getDataBrowse( "Descuento" ) }
      :cEditPicture           := "@E 999.99"
      :nWidth                 := 55
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :lHide                  := .t.
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "% " + cImp()
      :bEditValue             := {|| ::getDataBrowse( "PorcentajeImpuesto" ) }
      :cEditPicture           := "@E 999.99"
      :nWidth                 := 45
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :lHide                  := .t.
   end with

   with object ( ::oViewEdit:oBrowse:AddCol() )
      :cHeader                := "Total"
      :bEditValue             := {|| nTotalLineaPedidoCliente( ::hDictionaryDetail[ ::oViewEdit:oBrowse:nArrayAt ], , , , .t., hGet( ::hDictionaryMaster, "OperarPuntoVerde" ), .t. ) }
      :cEditPicture           := cPouDiv( hGet( ::hDictionaryMaster, "Divisa" ), D():Divisas( ::nView ) )
      :nWidth                 := 94
      :nDataStrAlign          := 1
      :nHeadStrAlign          := 1
      :nFooterType            := AGGR_SUM
   end with

Return ( self )

//---------------------------------------------------------------------------//

METHOD GetAppendDetail() CLASS PedidoCliente

   ::hDictionaryDetailTemporal      := D():GetPedidoClienteLineaBlank( ::nView )

Return ( self )

//---------------------------------------------------------------------------//

METHOD GetEditDetail() CLASS PedidoCliente

   if !Empty( ::nPosDetail )
      ::hDictionaryDetailTemporal      := ::hDictionaryDetail[ ::nPosDetail ]
   end if

Return ( self )

//---------------------------------------------------------------------------//