#include "FiveWin.Ch"
#include "Factu.ch"
#include "Report.ch"
#include "MesDbf.ch"
#include "FastRepH.ch"
#include "HbXml.ch"

//---------------------------------------------------------------------------//

CLASS TFastReportInfGen FROM TNewInfGen

   DATA  aInitGroup

   DATA  oPages

   DATA  oBrwRango

   DATA  oOfficeBar

   DATA  nDias

   DATA  nUnidadesTiempo   INIT 1
   DATA  oUnidadesTiempo
   DATA  cUnidadesTiempo   INIT "Semana(s)"
   DATA  aUnidadesTiempo   INIT { "Dia(s)", "Semana(s)", "Mes(es)", "A�o(s)" }

   DATA  oTreeReporting
   DATA  oTreePersonalizados
   DATA  oTreeImageList

   DATA  oColDesde
   DATA  oColHasta

   DATA  lPersonalizado    INIT .f.
   DATA  oDbfPersonalizado

   DATA  cResource         INIT "FastReport"

   DATA  cTypeName         INIT ""
   DATA  cReportName       INIT ""

   DATA  oBtnPrevisualizar
   DATA  oBtnImprimir
   DATA  oBtnExcel
   DATA  oBtnPdf
   DATA  oBtnHTML

   DATA  oBtnDiseno
   DATA  oBtnDuplicar
   DATA  oBtnEliminar
   DATA  oBtnFiltrar

   DATA  cInformeFastReport

   DATA  oExt

   DATA  nTotalRemesasAgentes          INIT 0

   DATA  nBaseSatClientes              INIT 0
   DATA  nIVASatClientes               INIT 0
   DATA  nRecargoSatClientes           INIT 0
   DATA  nTotalSatClientes             INIT 0

   DATA  nBasePresupuestosClientes     INIT 0
   DATA  nIVAPresupuestosClientes      INIT 0
   DATA  nRecargoPresupuestosClientes  INIT 0
   DATA  nTotalPresupuestosClientes    INIT 0

   DATA  nBasePedidosClientes          INIT 0
   DATA  nIVAPedidosClientes           INIT 0
   DATA  nRecargoPedidosClientes       INIT 0
   DATA  nTotalPedidosClientes         INIT 0

   DATA  nBaseAlbaranesClientes        INIT 0
   DATA  nIVAAlbaranesClientes         INIT 0
   DATA  nRecargoAlbaranesClientes     INIT 0
   DATA  nTotalAlbaranesClientes       INIT 0

   DATA  nBaseFacturasClientes         INIT 0
   DATA  nIVAFacturasClientes          INIT 0
   DATA  nRecargoFacturasClientes      INIT 0
   DATA  nTotalFacturasClientes        INIT 0

   DATA  nBaseFacturasRectificativasClientes    INIT 0
   DATA  nIVAFacturasRectificativasClientes     INIT 0
   DATA  nRecargoFacturasRectificativasClientes INIT 0
   DATA  nTotalFacturasRectificativasClientes   INIT 0

   DATA  nBaseTicketsClientes          INIT 0
   DATA  nIVATicketsClientes           INIT 0
   DATA  nRecargoTicketsClientes       INIT 0
   DATA  nTotalTicketsClientes         INIT 0

   DATA  nTotalPagosClientes           INIT 0
   DATA  nTotalPendientesClientes      INIT 0

   //------------------------------------------------------------------------//

   METHOD Create()

   METHOD Default()                    VIRTUAL

   METHOD NewResource( cFldRes )

   METHOD lResource( cFld )

   METHOD InitDialog()
   METHOD SetDialog()

   METHOD StartDialog()                VIRTUAL

   METHOD LoadPersonalizado()

   METHOD Activate()

   METHOD Play( uParam )

   METHOD EditValueTextDesde()         INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:HelpDesde ) )
   METHOD EditValueTextHasta()         INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:HelpHasta ) )
   METHOD EditTextDesde()              INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:TextDesde ) )
   METHOD EditTextHasta()              INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:TextHasta ) )

   METHOD ValidValueTextDesde( oGet )  INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:ValidDesde, oGet ) )
   METHOD ValidValueTextHasta( oGet )  INLINE ( Eval( ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:ValidHasta, oGet ) )

   METHOD cKeyInf()                    INLINE ( Padr( ::ClassName(), 50 ) + Padr( Upper( ::cTypeName ), 50 ) + Padr( Upper( ::cReportName ), 50 ) )

   METHOD ExtractOrder()

   METHOD End()

   METHOD OpenData( cPath, lExclusive )
   METHOD CloseData()

   METHOD lGenerate()

   METHOD GenReport( nOption )

   METHOD lValidRegister()

   METHOD DataReport()

   METHOD SyncAllDbf()

   METHOD DefineReport( cPath )

   METHOD DefinePersonalizado( cPath )

   METHOD Reindexa( cPath )

   METHOD FastReport( nDevice )

   METHOD DesignReport( cNombre )

   METHOD TreeReportingChanged()       VIRTUAL
   METHOD TreePersonalizadosChanged()  VIRTUAL

   METHOD TreeReportingClick()         INLINE ( ::GenReport( IS_SCREEN ) )
   METHOD TreePersonalizadosClick()    INLINE ( ::GenReport( IS_SCREEN ) )

   METHOD SaveReport()
   METHOD LoadReport()
   METHOD MoveReport()

   METHOD OpenTemporal()
   METHOD CloseTemporal()

   METHOD Duplicar()

   METHOD Eliminar()

   METHOD SaveDuplicar( cNombre, oTreeInforme )

   METHOD GetFieldByDescription( cDescription )

   METHOD DlgExportDocument()
   METHOD ExportDocument( cGetFile )

   METHOD DlgImportDocument()
   METHOD ImportDocument()

   METHOD nRemesaAgentes()
   METHOD nFacturaClientes()
   METHOD nPagosClientes()


   //------------------------------------------------------------------------//

   INLINE METHOD ActiveClients()

      local nActiveClients := 0

      ::oDbfCli:GetStatus()
      ::oDbfCli:OrdSetFocus( "lBlqCli" )

      nActiveClients       := ::oDbfCli:OrdKeyCount()

      ::oDbfCli:SetStatus()

      RETURN ( nActiveClients )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD TotalCodigoClientes( cCliDesde, cCliHasta, cDescription )

      local uValue
      local cField
      local nTotalClients        := 0

      DEFAULT cDescription       := "Total"

      cField                     := ::GetFieldByDescription( cDescription )

      if !Empty( cField ) .and. IsChar( cCliDesde ) .and. IsChar( cCliHasta )

         ::oDbf:GetStatus()

         ::oDbf:GoTop()
         while !( ::oDbf:Eof() )

            if ( Rtrim( ::oDbf:cCodCli ) >= Rtrim( cCliDesde ) .and. Rtrim( ::oDbf:cCodCli ) <= Rtrim( cCliHasta ) )

               uValue            := ::oDbf:FieldGetByName( cField )

               if IsNum( uValue )
                  nTotalClients  += uValue
               end if

            end if

            ::oDbf:Skip()

         end while

         ::oDbf:SetStatus()

      end if

      RETURN ( nTotalClients )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD TotalFechaClientes( dDesde, dHasta, cDescription )

      local uValue
      local cField
      local nTotalClients        := 0

      DEFAULT cDescription       := "Total"

      cField                     := ::GetFieldByDescription( cDescription )

      if !Empty( cField ) .and. IsDate( dDesde ) .and. IsDate( dHasta )

         ::oDbf:GetStatus()

         ::oDbf:GoTop()
         while !( ::oDbf:Eof() )

            if ( ::oDbf:dFecDoc >= dDesde ) .and. ( ::oDbf:dFecDoc <= dHasta )

               uValue            := ::oDbf:FieldGetByName( cField )

               if IsNum( uValue )
                  nTotalClients  += uValue
               end if

            end if

            ::oDbf:Skip()

         end while

         ::oDbf:SetStatus()

      end if

      RETURN ( nTotalClients )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD TotalPreimerTrimestreClientes( cDescription )

      local dFechaInicio   := Ctod( "01/01/" + Str( Year( ::dIniInf ) ) )
      local dFechaFin      := Ctod( "01/04/" + Str( Year( ::dIniInf ) ) ) - 1

      RETURN ( ::TotalFechaClientes( dFechaInicio, dFechaFin, cDescription ) )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD TotalSegundoTrimestreClientes( cDescription )

      local dFechaInicio   := Ctod( "01/04/" + Str( Year( ::dIniInf ) ) )
      local dFechaFin      := Ctod( "01/08/" + Str( Year( ::dIniInf ) ) ) - 1

      RETURN ( ::TotalFechaClientes( dFechaInicio, dFechaFin, cDescription ) )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD TotalCodigoArticulos( cArtDesde, cArtHasta, cDescription )

      local uValue
      local cField
      local nTotalArticulos         := 0

      DEFAULT cDescription          := "Total"

      cField                        := ::GetFieldByDescription( cDescription )

      if !Empty( cField ) .and. IsChar( cArtDesde ) .and. IsChar( cArtHasta )

         ::oDbf:GetStatus()

         ::oDbf:GoTop()
         while !( ::oDbf:Eof() )

            if ( Rtrim( ::oDbf:cCodArt ) >= Rtrim( cArtDesde ) .and. Rtrim( ::oDbf:cCodArt ) <= Rtrim( cArtHasta ) )

               uValue               := ::oDbf:FieldGetByName( cField )

               if IsNum( uValue )
                  nTotalArticulos   += uValue
               end if

            end if

            ::oDbf:Skip()

         end while

         ::oDbf:SetStatus()

      end if

      RETURN ( nTotalArticulos )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD BrwRangoKeyDown( o, nKey )

      local oColumn  := o:SelectedCol()

      if ( nKey == 107 .or. nKey == 187 )

         if !Empty( oColumn ) .and. !Empty( oColumn:bEditBlock )

            oColumn:RunBtnAction()

         end if

      end if

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD Count( cDescription, lUnique )

      local cField
      local uValue
      local aValue               := {}
      local nTotal               := 0

      DEFAULT cDescription       := "C�digo cliente"
      DEFAULT lUnique            := ".f."

      cField                     := ::GetFieldByDescription( cDescription )
      lUnique                    := Lower( lUnique ) == ".t."

      if !Empty( cField )

         ::oDbf:GetStatus()

         ::oDbf:GoTop()
         while !( ::oDbf:Eof() )

            uValue               := ::oDbf:FieldGetByName( cField )

            if !Empty( uValue )

               if lUnique

                  if aScan( aValue, uValue ) == 0
                     aAdd( aValue, uValue )
                     nTotal++
                  end if

               else

                  nTotal++

               end if

            end if

            ::oDbf:Skip()

         end while

         ::oDbf:SetStatus()

      end if

      RETURN ( nTotal )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitSatClientes()

      ::nBaseSatClientes         := 0
      ::nIVASatClientes          := 0
      ::nRecargoSatClientes      := 0
      ::nTotalSatClientes        := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddSATClientes()

      ::nBaseSATClientes         += ::oSatCliT:nTotNet
      ::nIVASATClientes          += ::oSatCliT:nTotIva
      ::nRecargoSATClientes      += ::oSatCliT:nTotReq
      ::nTotalSATClientes        += ::oSatCliT:nTotSat

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitPresupuestosClientes()

      ::nBasePresupuestosClientes      := 0
      ::nIVAPresupuestosClientes       := 0
      ::nRecargoPresupuestosClientes   := 0
      ::nTotalPresupuestosClientes     := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddPresupuestosClientes()

      ::nBasePresupuestosClientes      += ::oPreCliT:nTotNet
      ::nIVAPresupuestosClientes       += ::oPreCliT:nTotIva
      ::nRecargoPresupuestosClientes   += ::oPreCliT:nTotReq
      ::nTotalPresupuestosClientes     += ::oPreCliT:nTotPre

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitPedidosClientes()

      ::nBasePedidosClientes           := 0
      ::nIVAPedidosClientes            := 0
      ::nRecargoPedidosClientes        := 0
      ::nTotalPedidosClientes          := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddPedidosClientes()

      ::nBasePedidosClientes           += ::oPedCliT:nTotNet
      ::nIVAPedidosClientes            += ::oPedCliT:nTotIva
      ::nRecargoPedidosClientes        += ::oPedCliT:nTotReq
      ::nTotalPedidosClientes          += ::oPedCliT:nTotPed

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitAlbaranesClientes()

      ::nBaseAlbaranesClientes         := 0
      ::nIVAAlbaranesClientes          := 0
      ::nRecargoAlbaranesClientes      := 0
      ::nTotalAlbaranesClientes        := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddAlbaranesClientes()

      ::nBaseAlbaranesClientes         += ::oAlbCliT:nTotNet
      ::nIVAAlbaranesClientes          += ::oAlbCliT:nTotIva
      ::nRecargoAlbaranesClientes      += ::oAlbCliT:nTotReq
      ::nTotalAlbaranesClientes        += ::oAlbCliT:nTotAlb

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitFacturasClientes()

      ::nBaseFacturasClientes          := 0
      ::nIVAFacturasClientes           := 0
      ::nRecargoFacturasClientes       := 0
      ::nTotalFacturasClientes         := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddFacturasClientes()

      ::nBaseFacturasClientes       += ::oFacCliT:nTotNet
      ::nIVAFacturasClientes        += ::oFacCliT:nTotIva
      ::nRecargoFacturasClientes    += ::oFacCliT:nTotReq
      ::nTotalFacturasClientes      += ::oFacCliT:nTotFac

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitFacturasRectificativasClientes()

      ::nBaseFacturasRectificativasClientes       := 0
      ::nIVAFacturasRectificativasClientes        := 0
      ::nRecargoFacturasRectificativasClientes    := 0
      ::nTotalFacturasRectificativasClientes      := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddFacturasRectificativasClientes()

      ::nBaseFacturasRectificativasClientes       += ::oFacRecT:nTotNet
      ::nIVAFacturasRectificativasClientes        += ::oFacRecT:nTotIva
      ::nRecargoFacturasRectificativasClientes    += ::oFacRecT:nTotReq
      ::nTotalFacturasRectificativasClientes      += ::oFacRecT:nTotFac

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD InitTicketsClientes()

      ::nBaseTicketsClientes       := 0
      ::nIVATicketsClientes        := 0
      ::nRecargoTicketsClientes    := 0
      ::nTotalTicketsClientes      := 0

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddTicketsClientes()

      ::nBaseTicketsClientes       += ::oTikCliT:nTotNet
      ::nIVATicketsClientes        += ::oTikCliT:nTotIva
      ::nTotalTicketsClientes      += ::oTikCliT:nTotTik

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD AddVariable()

      Super:AddVariable()

      ::oFastReport:AddVariable(    "SAT clientes",            "Total base SAT clientes",            "CallHbFunc( 'oTinfGen', ['nBaseSATClientes'])"    )
      ::oFastReport:AddVariable(    "SAT clientes",            "Total " + cImp() + " SAT clientes",  "CallHbFunc( 'oTinfGen', ['nIVASATClientes'])"     )
      ::oFastReport:AddVariable(    "SAT clientes",            "Total recargo SAT clientes",         "CallHbFunc( 'oTinfGen', ['nRecargoSATClientes'])" )
      ::oFastReport:AddVariable(    "SAT clientes",            "Total SAT clientes",                 "CallHbFunc( 'oTinfGen', ['nTotalSATClientes'])"   )

      ::oFastReport:AddVariable(    "Presupuestos clientes",   "Total base presupuestos clientes",            "CallHbFunc( 'oTinfGen', ['nBasePresupuestosClientes'])"    )
      ::oFastReport:AddVariable(    "Presupuestos clientes",   "Total " + cImp() + " presupuestos clientes",  "CallHbFunc( 'oTinfGen', ['nIVAPresupuestosClientes'])"     )
      ::oFastReport:AddVariable(    "Presupuestos clientes",   "Total recargo presupuestos clientes",         "CallHbFunc( 'oTinfGen', ['nRecargoPresupuestosClientes'])" )
      ::oFastReport:AddVariable(    "Presupuestos clientes",   "Total presupuestos clientes",                 "CallHbFunc( 'oTinfGen', ['nTotalPresupuestosClientes'])"   )

      ::oFastReport:AddVariable(    "Pedidos clientes",        "Total base pedidos clientes",            "CallHbFunc( 'oTinfGen', ['nBasePedidosClientes'])"    )
      ::oFastReport:AddVariable(    "Pedidos clientes",        "Total " + cImp() + " pedidos clientes",  "CallHbFunc( 'oTinfGen', ['nIVAPedidosClientes'])"     )
      ::oFastReport:AddVariable(    "Pedidos clientes",        "Total recargo pedidos clientes",         "CallHbFunc( 'oTinfGen', ['nRecargoPedidosClientes'])" )
      ::oFastReport:AddVariable(    "Pedidos clientes",        "Total pedidos clientes",                 "CallHbFunc( 'oTinfGen', ['nTotalPedidosClientes'])"   )

      ::oFastReport:AddVariable(    "Albaranes clientes",      "Total base albaranes clientes",          "CallHbFunc( 'oTinfGen', ['nBaseAlbaranesClientes'])"    )
      ::oFastReport:AddVariable(    "Albaranes clientes",      "Total " + cImp() + " albaranes clientes","CallHbFunc( 'oTinfGen', ['nIVAAlbaranesClientes'])"     )
      ::oFastReport:AddVariable(    "Albaranes clientes",      "Total recargo albaranes clientes",       "CallHbFunc( 'oTinfGen', ['nRecargoAlbaranesClientes'])" )
      ::oFastReport:AddVariable(    "Albaranes clientes",      "Total albaranes clientes",               "CallHbFunc( 'oTinfGen', ['nTotalAlbaranesClientes'])"   )

      ::oFastReport:AddVariable(    "Facturas clientes",       "Total base facturas clientes",           "CallHbFunc( 'oTinfGen', ['nBaseFacturasClientes'])"     )
      ::oFastReport:AddVariable(    "Facturas clientes",       "Total " + cImp() + " facturas clientes", "CallHbFunc( 'oTinfGen', ['nIVAFacturasClientes'])"      )
      ::oFastReport:AddVariable(    "Facturas clientes",       "Total recargo facturas clientes",        "CallHbFunc( 'oTinfGen', ['nRecargoFacturasClientes'])"  )
      ::oFastReport:AddVariable(    "Facturas clientes",       "Total facturas clientes",                "CallHbFunc( 'oTinfGen', ['nTotalFacturasClientes'])"    )

      ::oFastReport:AddVariable(    "Liquidaci�n de agentes",  "Total liquidaci�n de agentes",           "GetHbVar('nTotalRemesasAgentes')"                       )

      RETURN ( Self )

   ENDMETHOD

   //------------------------------------------------------------------------//

   INLINE METHOD CreateTreeImageList()

      ::oTreeImageList        := TImageList():New( 16, 16 )
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_16" ),                      Rgb( 255, 0, 255 ) ) // 0
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_new_16" ),                  Rgb( 255, 0, 255 ) ) // 1
      ::oTreeImageList:AddMasked( TBitmap():Define( "Clipboard_empty_businessman_16" ),   Rgb( 255, 0, 255 ) ) // 2
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_plain_businessman_16" ),    Rgb( 255, 0, 255 ) ) // 3
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_businessman_16" ),          Rgb( 255, 0, 255 ) ) // 4
      ::oTreeImageList:AddMasked( TBitmap():Define( "Notebook_user1_16" ),                Rgb( 255, 0, 255 ) ) // 5
      ::oTreeImageList:AddMasked( TBitmap():Define( "Clipboard_empty_user1_16" ),         Rgb( 255, 0, 255 ) ) // 6
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_plain_user1_16" ),          Rgb( 255, 0, 255 ) ) // 7
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_user1_16" ),                Rgb( 255, 0, 255 ) ) // 8
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_delete_16" ),               Rgb( 255, 0, 255 ) ) // 9
      ::oTreeImageList:AddMasked( TBitmap():Define( "Cashier_user1_16" ),                 Rgb( 255, 0, 255 ) ) // 10
      ::oTreeImageList:AddMasked( TBitmap():Define( "ChgPre16" ),                         Rgb( 255, 0, 255 ) ) // 11
      ::oTreeImageList:AddMasked( TBitmap():Define( "Truck_red_16" ),                     Rgb( 255, 0, 255 ) ) // 12
      ::oTreeImageList:AddMasked( TBitmap():Define( "Package_16" ),                       Rgb( 255, 0, 255 ) ) // 13
      ::oTreeImageList:AddMasked( TBitmap():Define( "Worker2_Form_Red_16" ),              Rgb( 255, 0, 255 ) ) // 14
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_navigate_cross_16" ),       Rgb( 255, 0, 255 ) ) // 15
      ::oTreeImageList:AddMasked( TBitmap():Define( "Package_16" ),                       Rgb( 255, 0, 255 ) ) // 16
      ::oTreeImageList:AddMasked( TBitmap():Define( "Office-building_address_book_16" ),  Rgb( 255, 0, 255 ) ) // 17
      ::oTreeImageList:AddMasked( TBitmap():Define( "Document_navigate_cross_16" ),       Rgb( 255, 0, 255 ) ) // 18
      ::oTreeImageList:AddMasked( TBitmap():Define( "User1_16" ),                         Rgb( 255, 0, 255 ) ) // 19
      ::oTreeImageList:AddMasked( TBitmap():Define( "Power-drill_user1_16" ),             Rgb( 255, 0, 255 ) ) // 20

      if !Empty( ::oTreeReporting )
         ::oTreeReporting:SetImageList( ::oTreeImageList )
      end if

      if !Empty( ::oTreePersonalizados )
         ::oTreePersonalizados:SetImageList( ::oTreeImageList )
      end if

      RETURN ( Self )

   ENDMETHOD

//---------------------------------------------------------------------------//

END CLASS

//----------------------------------------------------------------------------//

METHOD NewResource( cFldRes ) CLASS TFastReportInfGen

   local n
   local o

   /*
   Montamos el array con los periodos para los informes------------------------
   */

   ::lCreaArrayPeriodos()

   /*
   Aplicamos los valores segun se han archivado--------------------------------
   */

   ::Default()

   ::lLoadDivisa()

   ::lDefDivInf                     := .f.
   ::lDefSerInf                     := .f.

   /*
   Caja de dialogo-------------------------------------------------------------
   */

   DEFINE DIALOG ::oDlg RESOURCE ::cResource TITLE ::cSubTitle

   REDEFINE FOLDER ::oPages ;
      ID       100;
      OF       ::oDlg ;
      PROMPT   "&General",;
               "Personalizados" ;
      DIALOGS  "FastReportPage",;
               "FastReportPage"

   ::oTreeReporting                 := TTreeView():Redefine( 100, ::oPages:aDialogs[ 1 ] )
   ::oTreeReporting:bChanged        := {|| ::TreeReportingChanged() }
   ::oTreeReporting:OnClick         := {|| ::TreeReportingClick() }

   ::oTreePersonalizados            := TTreeView():Redefine( 100, ::oPages:aDialogs[ 2 ] )
   ::oTreePersonalizados:bChanged   := {|| ::TreePersonalizadosChanged() }
   ::oTreePersonalizados:OnClick    := {|| ::TreePersonalizadosClick() }

   /*
   Fechas----------------------------------------------------------------------
   */

   if ::lDefFecInf
      ::oDefIniInf( 1110, ::oDlg, 1111 )
      ::oDefFinInf( 1120, ::oDlg, 1121 )
      ::lPeriodoInforme( 220, ::oDlg )
   end if

   /*
   Browse de los rangos----------------------------------------------------------
   */

   ::oBrwRango                      := TXBrowse():New( ::oDlg )

   ::oBrwRango:bClrSel              := {|| { CLR_BLACK, Rgb( 229, 229, 229 ) } }
   ::oBrwRango:bClrSelFocus         := {|| { CLR_BLACK, Rgb( 167, 205, 240 ) } }

   ::oBrwRango:SetArray( ::aInitGroup, , , .f. )

   ::oBrwRango:lHScroll             := .f.
   ::oBrwRango:lVScroll             := .f.
   ::oBrwRango:lRecordSelector      := .t.
   ::oBrwRango:lFastEdit            := .t.

   ::oBrwRango:nFreeze              := 1
   ::oBrwRango:nMarqueeStyle        := 3

   ::oBrwRango:nColSel              := 2

   ::oBrwRango:CreateFromResource( 310 )

   ::oColNombre                     := ::oBrwRango:AddCol()
   ::oColNombre:cHeader             := ""
   ::oColNombre:bStrData            := {|| ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:Nombre }
   ::oColNombre:bBmpData            := {|| ::oBrwRango:nArrayAt }
   ::oColNombre:nWidth              := 90

   for each o in ::aInitGroup
      ::oColNombre:AddResource( o:Cargo:cBitmap )
   next

   with object ( ::oColDesde := ::oBrwRango:AddCol() )
      :cHeader       := "Desde"
      :bEditValue    := {|| ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:Desde }
      :bOnPostEdit   := {|o,x| ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:Desde := x }
      :bEditValid    := {|oGet| ::ValidValueTextDesde( oGet ) } // msginfo( "valid desde" ),
      :bEditBlock    := {|| ::EditValueTextDesde() }
      :cEditPicture  := "@!"
      :nEditType     := 5
      :nWidth        := 120
      :nBtnBmp       := 1
      :AddResource( "Lupa" )
   end with

   with object ( ::oBrwRango:AddCol() )
      :cHeader       := ""
      :bEditValue    := {|| ::EditTextDesde() }
      :nEditType     := 0
      :nWidth        := 160
   end with

   with object ( ::oColHasta := ::oBrwRango:AddCol() )
      :cHeader       := "Hasta"
      :bEditValue    := {|| ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:Hasta }
      :bOnPostEdit   := {|o,x| ::aInitGroup[ ::oBrwRango:nArrayAt ]:Cargo:Hasta := x }
      :bEditValid    := {|oGet| ::ValidValueTextHasta( oGet ) }
      :bEditBlock    := {|| ::EditValueTextHasta() }
      :cEditPicture  := "@!"
      :nEditType     := 5
      :nWidth        := 120
      :nBtnBmp       := 1
      :AddResource( "Lupa" )
   end with

   with object ( ::oBrwRango:AddCol() )
      :cHeader       := ""
      :bEditValue    := {|| ::EditTextHasta() }
      :nEditType     := 0
      :nWidth        := 160
   end with

   ::oBrwRango:OnKeyDown            := {| o, nKey | ::BrwRangoKeyDown( o, nKey ) }

   /*
   Divisas---------------------------------------------------------------------
   */

   if ::lDefDivInf
      ::oDefDivInf( 1130, 1131, ::oDlg )
   end if

   /*
   Series----------------------------------------------------------------------
   */

   if ::lDefSerInf
      ::oDefSerInf( ::oDlg )
   end if

   /*
   Progreso--------------------------------------------------------------------
   */

   if ::lDefMetInf
      ::oDefMetInf( 1160, ::oDlg )
   end if

RETURN .t.

//----------------------------------------------------------------------------//

METHOD lResource( cFld ) CLASS TFastReportInfGen

   ::lNewInforme     := .t.
   ::lDefCondiciones := .f.

   if !::NewResource()
      return .f.
   end if

   /*
   Carga controles-------------------------------------------------------------
   */

   if !::lGrupoArticulo( .t. )
      return .f.
   end if

   if !::lGrupoFamilia( .t. )
      return .f.
   end if

   if !::lGrupoTipoArticulo( .t. )
      return .f.
   end if

   if !::lGrupoCategoria( .t. )
      return .f.
   end if

   if !::lGrupoTemporada( .t. )
      return .f.
   end if

   if !::lGrupoFabricante( .t. )
      return .f.
   end if

   /*
   Definimos el tree de condiciones--------------------------------------------
   */

   REDEFINE GROUP ::oGrupoCondiciones ID 131 OF ::oDlg TRANSPARENT

   REDEFINE GET ::nUnidadesTiempo ;
      SPINNER  MIN 0 MAX 999 ;
      PICTURE  "@E 999" ;
      ID       320 ;
      OF       ::oDlg

   REDEFINE COMBOBOX ::oUnidadesTiempo ;
      VAR      ::cUnidadesTiempo ;
      ID       330 ;
      ITEMS    ::aUnidadesTiempo ;
      OF       ::oDlg

RETURN .t.

//---------------------------------------------------------------------------//

METHOD InitDialog() CLASS TFastReportInfGen

   local n
   local oGrupo
   local oCarpeta

   ::oOfficeBar            := TDotNetBar():New( 0, 0, 1020, 115, ::oDlg, 1 )
   ::oOfficeBar:lPaintAll  := .f.
   ::oOfficeBar:lDisenio   := .f.

   ::oOfficeBar:SetStyle( 1 )

      oCarpeta             := TCarpeta():New( ::oOfficeBar, "Informe" )

      oGrupo               := TDotNetGroup():New( oCarpeta, 306, "Impresi�n", .f. )
      ::oBtnPrevisualizar  := TDotNetButton():New( 60, oGrupo, "Prev1_32",             "Visualizar [F5]",   1, {|| ::GenReport( IS_SCREEN ) }, , , .f., .f., .f. )
      ::oBtnImprimir       := TDotNetButton():New( 60, oGrupo, "Imp32",                "Imprimir",          2, {|| ::GenReport( IS_PRINTER ) }, , , .f., .f., .f. )
      ::oBtnExcel          := TDotNetButton():New( 60, oGrupo, "Table_32",             "Excel",             3, {|| ::GenReport( IS_EXCEL ) }, , , .f., .f., .f. )
      ::oBtnPdf            := TDotNetButton():New( 60, oGrupo, "Document_lock_32",     "Pdf",               4, {|| ::GenReport( IS_PDF ) }, , , .f., .f., .f. )
      ::oBtnHTML           := TDotNetButton():New( 60, oGrupo, "SndInt32",             "HTML",              5, {|| ::GenReport( IS_HTML ) }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 246, "�tiles", .f. )
      ::oBtnDiseno         := TDotNetButton():New( 60, oGrupo, "Drawing_utensils_32",  "Dise�ar",           1, {|| ::DesignReport() }, , , .f., .f., .f. )
      ::oBtnDuplicar       := TDotNetButton():New( 60, oGrupo, "Document_new_32",      "Nuevo",             2, {|| ::Duplicar() }, , , .f., .f., .f. )
      ::oBtnEliminar       := TDotNetButton():New( 60, oGrupo, "Document_delete_32",   "Eliminar",          3, {|| ::Eliminar() }, , , .f., .f., .f. )
      ::oBtnFiltrar        := TDotNetButton():New( 60, oGrupo, "Funnel_32",            "Filtrar",           4, {|| ::DlgFilter() }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 126, "Herramientas", .f. )

      ::oBtnExportar       := TDotNetButton():New( 60, oGrupo, "Folder_out_32",        "Exportar",          1, {|| ::DlgExportDocument() }, , , .f., .f., .f. )
      ::oBtnImportar       := TDotNetButton():New( 60, oGrupo, "Folder_into_32",       "Importar",          2, {|| ::DlgImportDocument() }, , , .f., .f., .f. )

      oGrupo               := TDotNetGroup():New( oCarpeta, 66, "Salida", .f. )

      ::oBtnCancel         := TDotNetButton():New( 60, oGrupo, "End32",                "Salir",             1, {|| ::lBreak := .t., ::End() }, , , .f., .f., .f. )

      ::oDlg:oTop          := ::oOfficeBar

   ::HideCondiciones()

   /*
   Cargamos las condiciones en oTreeCondiciones--------------------------------
   */

   SysRefresh()

   if ::lDesglosar
      ::oDefDesglosar()
   end if

   if ::lLinImporteCero
      ::oDefLinImporteCero()
   end if

   if ::lDocImporteCero
      ::oDefDocImporteCero()
   end if

   /*
   Nos posicionamos en el informe----------------------------------------------
   */

   ::lRecargaFecha()

   /*
   Cambios---------------------------------------------------------------------
   */

   ::oTreeReporting:SetFocus()

   ::TreeReportingChanged()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD SetDialog( lEnabled ) CLASS TFastReportInfGen

   DEFAULT lEnabled              := .f.

   ::oBtnPrevisualizar:lEnabled  := lEnabled
   ::oBtnImprimir:lEnabled       := lEnabled
   ::oBtnExcel:lEnabled          := lEnabled
   ::oBtnPdf:lEnabled            := lEnabled
   ::oBtnHTML:lEnabled           := lEnabled
   ::oBtnDiseno:lEnabled         := lEnabled
   ::oBtnFiltrar:lEnabled        := lEnabled
   ::oBtnDuplicar:lEnabled       := lEnabled
   ::oBtnEliminar:lEnabled       := lEnabled
   ::oBtnExportar:lEnabled       := lEnabled
   ::oBtnImportar:lEnabled       := lEnabled

   if lEnabled
      ::oTreeReporting:Enable()
      ::oBrwRango:Enable()
   else
      ::oTreeReporting:Disable()
      ::oBrwRango:Disable()
   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Create() CLASS TFastReportInfGen

   ::AddField( "cCodArt",     "C", 18, 0, {|| "@!" }, "Codigo art�culo", .f., "C�digo art�culo", 14, .f. )

   ::AddTmpIndex( "cCodArt", "cCodArt" )

RETURN ( self )

//---------------------------------------------------------------------------//

METHOD Activate() CLASS TFastReportInfGen

   local lActivate      := .f.

   if !Empty( ::oDlg )

      ::oDlg:AddFastKey( VK_F5,  {|| ::GenReport( IS_SCREEN ) } )
      ::oDlg:AddFastKey( VK_F9,  {|| ::MoveReport() } )

      ::oDlg:bStart     := {|| ::StartDialog(), ::LoadPersonalizado() }

      ::oDlg:Activate( , , , .t., , , {|| ::InitDialog() } )

      lActivate         := ( ::oDlg:nResult == IDOK )

   end if

RETURN ( lActivate )

//----------------------------------------------------------------------------//

METHOD Play( uParam ) CLASS TFastReportInfGen

   ::Create( uParam )

   if ::lOpenFiles

      if ::OpenData()

         if ::OpenTemporal()

            if ::lResource()

               ::Activate()

            end if

            ::CloseTemporal()

         end if

         ::CloseData()

      end if

   end if

   ::End()

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD End() CLASS TFastReportInfGen

   if ::lSave2Exit .and. ::lOpenFiles
      ::Save()
   end if

   if ::oDbfDiv != nil .and. ::oDbfDiv:Used()
      ::oDbfDiv:end()
   end if

   if ::oBmpDiv != nil
      ::oBmpDiv:end()
   end if

   if ::oBandera != nil
      ::oBandera:end()
   end if

   ::CloseData()

   /*
   LLamamos al metodo virtual
   */

   ::CloseFiles()

   if ::oDbfArt != nil .and. ::oDbfArt:Used()
      ::oDbfArt:End()
   end if

   if ::oDbfAlm != nil .and. ::oDbfAlm:Used()
      ::oDbfAlm:End()
   end if

   if ::oDbfAge != nil .and. ::oDbfAge:Used()
      ::oDbfAge:End()
   end if

   if ::oDbfFam != nil .and. ::oDbfFam:Used()
      ::oDbfFam:End()
   end if

   if ::oDbfCat != nil .and. ::oDbfCat:Used()
      ::oDbfCat:End()
   end if

   if ::oDbfPrv != nil .and. ::oDbfPrv:Used()
      ::oDbfPrv:End()
   end if

   if ::oDbfCli != nil .and. ::oDbfCli:Used()
      ::oDbfCli:End()
   end if

   if ::oDbfTmp != nil .and. ::oDbfTmp:Used()
      ::oDbfTmp:End()
   end if

   if ::oDbfEmp != nil .and. ::oDbfEmp:Used()
      ::oDbfEmp:End()
   end if

   if ::oGruFam != nil
      ::oGruFam:End()
   end if

   if ::oDbfFpg != nil .and. ::oDbfFpg:Used()
      ::oDbfFpg:End()
   end if

   if ::oDbfTur != nil .and. ::oDbfTur:Used()
      ::oDbfTur:End()
   end if

   if ::oTipArt != nil
      ::oTipArt:End()
   end if

   if ::oDbfFab != nil
      ::oDbfFab:End()
   end if

   if ::oGrpCli != nil
      ::oGrpCli:End()
   end if

   if ::oGrpPrv != nil
      ::oGrpPrv:End()
   end if

   if ::oDbfTrn != nil
      ::oDbfTrn:End()
   end if

   if ::oSeccion != nil
      ::oSeccion:End()
   end if

   if ::oOperacion != nil
      ::oOperacion:End()
   end if

   if ::oDbfIva != nil .and. ::oDbfIva:Used()
      ::oDbfIva:End()
   end if

   if ::oDbfRut != nil .and. ::oDbfRut:Used()
      ::oDbfRut:End()
   end if

   if ::oDbfUsr != nil .and. ::oDbfUsr:Used()
      ::oDbfUsr:End()
   end if

   if !Empty( ::oRemAgeT ) .and. ( ::oRemAgeT:Used() )
      ::oRemAgeT:end()
   end if

   /*
   Eliminamos los temporales---------------------------------------------------
   */

   ::CloseTemporal()

   if !Empty( ::nBmp )
      DeleteObject( ::nBmp )
   end if

   if !Empty( ::oBmpImagen )
      ::oBmpImagen:End()
   end if

   if !Empty( ::oDlg )
      ::oDlg:End()
   end if

   Self        := nil

Return .t.

//----------------------------------------------------------------------------//

METHOD GenReport( nOption ) CLASS TFastReportInfGen

   local oDlg
   local oTreeInforme

   if IsNil( ::oPages:nOption ) .or. ( ::oPages:nOption <= 1 )
      oTreeInforme      := ::oTreeReporting:GetSelected()
   else
      oTreeInforme      := ::oTreePersonalizados:GetSelected()
   end if

   if !Empty( oTreeInforme:aItems )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:cPrompt ) .and. !Empty( oTreeInforme:cPrompt )
      ::cReportName     := Rtrim( oTreeInforme:cPrompt )
   else
      msgStop( "No se ha podido cargar el nombre del informe." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:bAction ) .and. !Empty( oTreeInforme:bAction )
      ::cTypeName       := Rtrim( oTreeInforme:bAction )
   else
      msgStop( "No se ha podido cargar el tipo de informe." )
      Return ( Self )
   end if

   /*
   Obtenemos el informe personalizado------------------------------------------
   */

   ::LoadReport()

   if Empty( ::cInformeFastReport )
      MsgStop( "No se ha podido cargar un dise�o de informe valido.", ::cTypeName )
      Return ( Self )
   end if

   /*
   Ponemos el dialogo a disable------------------------------------------------
   */

   ::SetDialog( .f. )

   ::lBreak             := .f.
   ::oBtnCancel:bAction := {|| ::lBreak := .t. }

   /*
   Extraer el orden------------------------------------------------------------
   */

   ::ExtractOrder()

   /*
   Comienza la generacion del informe------------------------------------------
   */

   if Valtype( ::bPreGenerate ) == "B"
      Eval( ::bPreGenerate )
   end if

   if ::lGenerate()

      if !::lBreak

          DEFINE DIALOG oDlg ;
               FROM     0,0 ;
               TO       4, 30 ;
               TITLE    "Generando informe" ;
               STYLE    DS_MODALFRAME

         oDlg:bStart    := { || ::FastReport( nOption ), oDlg:End(), SysRefresh() }
         oDlg:cMsg      := "Por favor espere..."

         ACTIVATE DIALOG oDlg ;
            CENTER ;
            ON PAINT oDlg:Say( 11, 0, xPadC( oDlg:cMsg, ( oDlg:nRight - oDlg:nLeft ) ), , , , .t. )

      end if

   else

      if !::lBreak
         msgStop( "No hay registros en las condiciones solictadas" )
      end if

   end if

   if Valtype( ::bPostGenerate ) == "B"
      Eval( ::bPostGenerate )
   end if

   ::oMtrInf:cText         := ""
   ::oMtrInf:Set( 0 )

   ::oBtnCancel:bAction    := {|| ::lBreak := .t., ::End() }

   ::SetDialog( .t. )

RETURN ( Self )

//----------------------------------------------------------------------------//

METHOD lGenerate() CLASS TFastReportInfGen

   ::oDbf:Zap()

   ::oMtrInf:SetTotal( ::oDbfArt:LastRec() )

   ::oMtrInf:cText      := "Procesando art�culos"

   /*
   Calculo del numero de dias--------------------------------------------------
   */

   ::nDias              := 0

   do case
      case ::cUnidadesTiempo == "Dia(s)"
         ::nDias        := ::nUnidadesTiempo
      case ::cUnidadesTiempo == "Semana(s)"
         ::nDias        := ::nUnidadesTiempo * 7
      case ::cUnidadesTiempo == "Mes(es)"
         ::nDias        := ::nUnidadesTiempo * 30
      case ::cUnidadesTiempo == "A�o(s)"
         ::nDias        := ::nUnidadesTiempo * 365
   end case

   /*
   Recorremos art�culos--------------------------------------------------------
   */

   ::oDbfArt:GoTop()
   while !::oDbfArt:Eof() .and. !::lBreak

      if ::lValidRegister()

         ::oDbf:Append()
         ::oDbf:cCodArt := ::oDbfArt:Codigo
         ::oDbf:Save()

      end if

      ::oDbfArt:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oMtrInf:AutoInc( ::oDbfArt:LastRec() )

RETURN ( ::oDbf:LastRec() > 0 )

//---------------------------------------------------------------------------//

Method lValidRegister() CLASS TFastReportInfGen

   if ( ::oDbfArt:Codigo >= ::oGrupoArticulo:Cargo:Desde    .and. ::oDbfArt:Codigo <= ::oGrupoArticulo:Cargo:Hasta      ) .and.;
      ( ::oDbfArt:Familia >= ::oGrupoFamilia:Cargo:Desde    .and. ::oDbfArt:Familia <= ::oGrupoFamilia:Cargo:Hasta      ) .and.;
      ( ::oDbfArt:cCodTip >= ::oGrupoTArticulo:Cargo:Desde  .and. ::oDbfArt:cCodTip <= ::oGrupoTArticulo:Cargo:Hasta    ) .and.;
      ( ::oDbfArt:cCodCate >= ::oGrupoCategoria:Cargo:Desde .and. ::oDbfArt:cCodCate <= ::oGrupoCategoria:Cargo:Hasta   ) .and.;
      ( ::oDbfArt:cCodTemp >= ::oGrupoTemporada:Cargo:Desde .and. ::oDbfArt:cCodTemp <= ::oGrupoTemporada:Cargo:Hasta   ) .and.;
      ( ::oDbfArt:cCodFab >= ::oGrupoFabricante:Cargo:Desde .and. ::oDbfArt:cCodFab <= ::oGrupoFabricante:Cargo:Hasta   ) .and.;
      ( !Empty( ::oDbfArt:dFecVta ) .and. Empty( ::oDbfArt:dFinVta ) .and. ( ::oDbfArt:dFecVta + ::nDias < Date() ) )

      return .t.

   end if

RETURN ( .f. )

//---------------------------------------------------------------------------//

METHOD DataReport( oFr ) CLASS TFastReportInfGen

   /*
   Zona de detalle-------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Informe", ::oDbf:nArea )
   ::oFastReport:SetFieldAliases(   "Informe", cObjectsToReport( ::oDbf ) )

   /*
   Zona de datos---------------------------------------------------------------
   */

   ::oFastReport:SetWorkArea(       "Empresa", ::oDbfEmp:nArea )
   ::oFastReport:SetFieldAliases(   "Empresa", cItemsToReport( aItmEmp() ) )

   ::oFastReport:SetWorkArea(       "Art�culos", ::oDbfArt:nArea )
   ::oFastReport:SetFieldAliases(   "Art�culos", cItemsToReport( aItmArt() ) )

   ::oFastReport:SetWorkArea(       "Familias", ::oDbfFam:nArea )
   ::oFastReport:SetFieldAliases(   "Familias", cItemsToReport( aItmFam() ) )

   ::oFastReport:SetWorkArea(       "Tipo art�culos", ::oTipArt:Select() )
   ::oFastReport:SetFieldAliases(   "Tipo art�culos", cObjectsToReport( ::oTipArt:oDbf ) )

   ::oFastReport:SetWorkArea(       "Categorias", ::oDbfCat:nArea )
   ::oFastReport:SetFieldAliases(   "Categorias", cItemsToReport( aItmCategoria() ) )

   ::oFastReport:SetWorkArea(       "Temporadas", ::oDbfTmp:nArea )
   ::oFastReport:SetFieldAliases(   "Temporadas", cItemsToReport( aItmTemporada() ) )

   ::oFastReport:SetWorkArea(       "Fabricantes", ::oDbfFab:Select() )
   ::oFastReport:SetFieldAliases(   "Fabricantes", cObjectsToReport( ::oDbfFab:oDbf ) )

   ::oFastReport:SetMasterDetail(   "Informe", "Art�culos",       {|| ::oDbf:cCodArt } )
   ::oFastReport:SetMasterDetail(   "Informe", "Empresa",         {|| cCodEmp() } )
   ::oFastReport:SetMasterDetail(   "Informe", "Familias",        {|| ::oDbfArt:Familia } )
   ::oFastReport:SetMasterDetail(   "Informe", "Tipo art�culos",  {|| ::oDbfArt:cCodTip } )
   ::oFastReport:SetMasterDetail(   "Informe", "Categorias",      {|| ::oDbfArt:cCodCat } )
   ::oFastReport:SetMasterDetail(   "Informe", "Temporadas",      {|| ::oDbfArt:cCodTemp } )
   ::oFastReport:SetMasterDetail(   "Informe", "Fabricantes",     {|| ::oDbfArt:cCodFab } )

   ::oFastReport:SetResyncPair(     "Informe", "Art�culos" )
   ::oFastReport:SetResyncPair(     "Informe", "Empresa" )
   ::oFastReport:SetResyncPair(     "Informe", "Familias" )
   ::oFastReport:SetResyncPair(     "Informe", "Tipo art�culos" )
   ::oFastReport:SetResyncPair(     "Informe", "Categorias" )
   ::oFastReport:SetResyncPair(     "Informe", "Temporadas" )
   ::oFastReport:SetResyncPair(     "Informe", "Fabricantes" )

Return ( Self )

//----------------------------------------------------------------------------//

METHOD OpenData( cPath, lExclusive ) CLASS TFastReportInfGen

   local lOpen          := .t.
   local oError
   local oBlock

   DEFAULT cPath        := cPatEmp()
   DEFAULT lExclusive   := .f.

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      DATABASE NEW ::oDbfEmp PATH ( cPatDat() ) FILE "Empresa.Dbf" VIA ( cDriver() ) SHARED INDEX "Empresa.Cdx"

      DATABASE NEW ::oDbfDiv PATH ( cPatDat() ) FILE "Divisas.Dbf" VIA ( cDriver() ) SHARED INDEX "Divisas.Cdx"

      /*
      Definicion y apertura de los fiche de configuraci�n----------------------
      */

      if Empty( ::oDbfInf )
         ::oDbfInf               := ::DefineReport( cPath )
      end if

      ::oDbfInf:Activate( .f., !( lExclusive ) )

      if Empty( ::oDbfPersonalizado )
         ::oDbfPersonalizado     := ::DefinePersonalizado( cPath )
      end if

      ::oDbfPersonalizado:Activate( .f., !( lExclusive ) )

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

      ::CloseFiles()

      lOpen             := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD CloseTemporal() CLASS TFastReportInfGen

   /*
   Eliminamos los temporales---------------------------------------------------
   */

   if ::oDbf != nil .and. ::oDbf:Used()
      ::oDbf:End()
   end if

   ::oDbf      := nil

   dbDrop( ::cFileName, ::cFileIndx, cLocalDriver() )

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD CloseData() CLASS TFastReportInfGen

   if ::oDbfEmp != nil .and. ::oDbfEmp:Used()
      ::oDbfEmp:end()
   end if

   if ::oDbfDiv != nil .and. ::oDbfDiv:Used()
      ::oDbfDiv:end()
   end if

   if ::oDbfInf != nil .and. ::oDbfInf:Used()
      ::oDbfInf:end()
   end if

   if ::oDbfPersonalizado != nil .and. ::oDbfPersonalizado:Used()
      ::oDbfPersonalizado:end()
   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

Method DefineReport( cPath ) CLASS TFastReportInfGen

   DEFAULT cPath        := cPatEmp()

   DEFINE DATABASE ::oDbfInf FILE "FstInf.Dbf" CLASS "FstInf" PATH ( cPath ) VIA ( cDriver() ) COMMENT "Informes de la apliacaci�n"

      FIELD NAME "cCodUse" TYPE "C" LEN   3  DEC 0 COMMENT "C�digo usuario"            OF ::oDbfInf
      FIELD NAME "cClsInf" TYPE "C" LEN  50  DEC 0 COMMENT "Clase del informe"         OF ::oDbfInf
      FIELD NAME "cTypInf" TYPE "C" LEN  50  DEC 0 COMMENT "Tipo del informe"          OF ::oDbfInf
      FIELD NAME "cNomInf" TYPE "C" LEN  50  DEC 0 COMMENT "Nombre del informe"        OF ::oDbfInf
      FIELD NAME "mOrgInf" TYPE "M" LEN  10  DEC 0 COMMENT "Configuraci�n original"    OF ::oDbfInf
      FIELD NAME "mModInf" TYPE "M" LEN  10  DEC 0 COMMENT "Configuraci�n modificada"  OF ::oDbfInf

      INDEX TO "FstInf.Cdx" TAG "cClsInf" ON "Upper( cClsInf ) + Upper( cTypInf ) + Upper( cNomInf )" NODELETED COMMENT "C�digo"  OF ::oDbfInf
      INDEX TO "FstInf.Cdx" TAG "cCodUse" ON "cCodUse + Upper( cNomInf )"                             NODELETED COMMENT "Usuario" OF ::oDbfInf

   END DATABASE ::oDbfInf

Return ( ::oDbfInf )

//--------------------------------------------------------------------------//

Method DefinePersonalizado( cPath ) CLASS TFastReportInfGen

   DEFAULT cPath        := cPatEmp()

   DEFINE DATABASE ::oDbfPersonalizado FILE "PrsInf.Dbf" CLASS "PrsInf" PATH ( cPath ) VIA ( cDriver() ) COMMENT "Informes personalizados"

      FIELD NAME "cCodUse" TYPE "C" LEN   3  DEC 0 COMMENT "C�digo usuario"            OF ::oDbfPersonalizado
      FIELD NAME "cClsInf" TYPE "C" LEN  50  DEC 0 COMMENT "Clase del informe"         OF ::oDbfPersonalizado
      FIELD NAME "cTypInf" TYPE "C" LEN  50  DEC 0 COMMENT "Tipo del informe"          OF ::oDbfPersonalizado
      FIELD NAME "cNomInf" TYPE "C" LEN  50  DEC 0 COMMENT "Nombre del informe"        OF ::oDbfPersonalizado
      FIELD NAME "mModInf" TYPE "M" LEN  10  DEC 0 COMMENT "Configuraci�n modificada"  OF ::oDbfPersonalizado

      INDEX TO "PrsInf.Cdx" TAG "cClsInf" ON "Upper( cClsInf ) + Upper( cTypInf ) + Upper( cNomInf )";
                                                            NODELETED COMMENT "C�digo"    OF ::oDbfPersonalizado
      INDEX TO "PrsInf.Cdx" TAG "cCodUse" ON "cCodUse + Upper( cNomInf )";
                                                            NODELETED COMMENT "Usuario"   OF ::oDbfPersonalizado

   END DATABASE ::oDbfPersonalizado

Return ( ::oDbfPersonalizado )

//--------------------------------------------------------------------------//

Method Reindexa( cPath )

   if file( cPath + "FstInf.Cdx" )
      ferase( cPath + "FstInf.Cdx" )
   end if

   ::DefineReport( cPath )

   ::oDbfInf:Activate( .f., .f. )
   ::oDbfInf:Pack()
   ::oDbfInf:End()

   if file( cPath + "PrsInf.Cdx" )
      ferase( cPath + "PrsInf.Cdx" )
   end if

   ::DefinePersonalizado( cPath )

   ::oDbfPersonalizado:Activate( .f., .f. )
   ::oDbfPersonalizado:Pack()
   ::oDbfPersonalizado:End()

Return ( ::oDbfPersonalizado )

//--------------------------------------------------------------------------//

Method FastReport( nDevice ) CLASS TFastReportInfGen

   CursorWait()

   ::oFastReport                    := frReportManager():new()

   if !Empty( ::oFastReport )

      ::oFastReport:LoadLangRes(       "Spanish.Xml" )
      ::oFastReport:SetIcon( 1 )

      ::oFastReport:SetEventHandler(   "Designer", "OnSaveReport", {|| ::SaveReport() } )

      ::oFastReport:ClearDataSets()

      ::DataReport()

      ::oFastReport:LoadFromString( ::cInformeFastReport )

      ::AddVariable()

      ::oFastReport:SetTitle(                "Visualizando : " + ::cTypeName )
      ::oFastReport:ReportOptions:SetName(   "Visualizando : " + ::cTypeName )

      /*
      Imprimir el informe------------------------------------------------------
      */

      do case
         case nDevice == IS_SCREEN
            ::oFastReport:ShowReport()

         case nDevice == IS_PRINTER
            ::oFastReport:PrepareReport()
            ::oFastReport:PrintOptions:SetCopies( 1 )
            ::oFastReport:PrintOptions:SetShowDialog( .f. )
            ::oFastReport:Print()

         case nDevice == IS_PDF
            ::oFastReport:PrepareReport()
            ::oFastReport:SetProperty( "PDFExport", "ShowDialog",       .t. )
            ::oFastReport:SetProperty( "PDFExport", "DefaultPath",      cPatTmp() )
            ::oFastReport:SetProperty( "PDFExport", "FileName",         "Informe" + cCurUsr() + ".pdf" )
            ::oFastReport:SetProperty( "PDFExport", "EmbeddedFonts",    .t. )
            ::oFastReport:SetProperty( "PDFExport", "PrintOptimized",   .t. )
            ::oFastReport:SetProperty( "PDFExport", "Outline",          .t. )
            ::oFastReport:SetProperty( "PDFExport", "OpenAfterExport",  .t. )
            ::oFastReport:DoExport(    "PDFExport" )

         case nDevice == IS_HTML
            ::oFastReport:PrepareReport()
            ::oFastReport:SetProperty( "HTMLExport", "ShowDialog",      .t. )
            ::oFastReport:SetProperty( "HTMLExport", "DefaultPath",     cPatTmp() )
            ::oFastReport:SetProperty( "HTMLExport", "FileName",        "Informe" + cCurUsr() + ".html" )
            ::oFastReport:DoExport(    "HTMLExport" )

         case nDevice == IS_EXCEL
            ::oFastReport:PrepareReport()
            ::oFastReport:SetProperty( "XLSExport", "ShowDialog",       .t. )
            ::oFastReport:SetProperty( "XLSxport", "DefaultPath",       cPatTmp() )
            ::oFastReport:SetProperty( "XLSExport", "FileName",         "Informe" + cCurUsr() + ".xls" )
            ::oFastReport:DoExport(    "XLSExport" )

      end case

      ::oFastReport:DestroyFR()

   end if

   CursorWE()

RETURN ( Self )

//---------------------------------------------------------------------------//

Method DesignReport( cNombre ) CLASS TFastReportInfGen

   local oTreeInforme

   if IsNil( ::oPages:nOption ) .or. ( ::oPages:nOption <= 1 )
      oTreeInforme      := ::oTreeReporting:GetSelected()
   else
      oTreeInforme      := ::oTreePersonalizados:GetSelected()
   end if

   if IsArray( oTreeInforme:aItems ) .and. len( oTreeInforme:aItems ) >= 1
      msgStop( "Seleccione el nodo inferior." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:cPrompt ) .and. !Empty( oTreeInforme:cPrompt )
      ::cReportName     := Rtrim( oTreeInforme:cPrompt )
   else
      msgStop( "No se ha podido cargar el nombre del informe." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:bAction ) .and. !Empty( oTreeInforme:bAction )
      ::cTypeName       := Rtrim( oTreeInforme:bAction )
   else
      msgStop( "No hay acci�n definida para este informe." )
      Return ( Self )
   end if

   /*
   Obtenemos el informe personalizado------------------------------------------
   */

   ::LoadReport()

   /*
   if Empty( ::cInformeFastReport )
      MsgStop( "No se ha podido cargar un dise�o de informe valido.", ::cTypeName )
      Return ( Self )
   end if
   */

   if !Empty( cNombre )
      ::lPersonalizado                 := .t.
      ::cReportName                    := cNombre
   end if

   /*
   Creacion del objeto---------------------------------------------------------
   */

   ::oFastReport                       := frReportManager():new()

   ::oFastReport:LoadLangRes(       "Spanish.Xml" )
   ::oFastReport:SetIcon( 1 )

   ::oFastReport:SetEventHandler(   "Designer", "OnSaveReport", {|| ::SaveReport() } )

   ::oFastReport:ClearDataSets()

   ::DataReport()

   if !Empty( ::cInformeFastReport )

      ::oFastReport:LoadFromString( ::cInformeFastReport )

      if ::lPersonalizado
         ::SaveReport()
      end if

   else

      ::oFastReport:AddPage(        "MainPage" )

      ::oFastReport:AddBand(        "CabeceraDocumento", "MainPage", frxPageHeader )
      ::oFastReport:SetProperty(    "CabeceraDocumento", "Top", 0 )
      ::oFastReport:SetProperty(    "CabeceraDocumento", "Height", 200 )

      ::oFastReport:AddBand(        "CabeceraColumnas",  "MainPage", frxMasterData )
      ::oFastReport:SetProperty(    "CabeceraColumnas",  "Top", 200 )
      ::oFastReport:SetProperty(    "CabeceraColumnas",  "Height", 100 )
      ::oFastReport:SetProperty(    "CabeceraColumnas",  "StartNewPage", .t. )
      ::oFastReport:SetObjProperty( "CabeceraColumnas",  "DataSet", "Informe" )

      ::oFastReport:AddBand(        "DetalleColumnas",   "MainPage", frxDetailData  )
      ::oFastReport:SetProperty(    "DetalleColumnas",   "Top", 230 )
      ::oFastReport:SetProperty(    "DetalleColumnas",   "Height", 28 )
      ::oFastReport:SetObjProperty( "DetalleColumnas",   "DataSet", "Informe" )

   end if

   ::AddVariable()

   ::oFastReport:SetTitle(                "Dise�ando : " + ::cTypeName )
   ::oFastReport:ReportOptions:SetName(   "Dise�ando : " + ::cTypeName )

   ::oFastReport:PreviewOptions:SetMaximized( .t. )

   ::oFastReport:SetTabTreeExpanded( FR_tvAll, .f. )

   ::oFastReport:DesignReport()

   if !Empty( ::oFastReport )
      ::oFastReport:DestroyFR()
   end if

   if !Empty( cNombre )
      ::LoadPersonalizado()
   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

Method SaveReport() CLASS TFastReportInfGen

   if ::lPersonalizado

      if ::oDbfPersonalizado:Seek( ::cKeyInf() )
      ::oDbfPersonalizado:Load()
      else
      ::oDbfPersonalizado:Append()
      end if

      ::oDbfPersonalizado:cCodUse   := cCurUsr()
      ::oDbfPersonalizado:cClsInf   := ::ClassName()
      ::oDbfPersonalizado:cTypInf   := ::cTypeName
      ::oDbfPersonalizado:cNomInf   := ::cReportName

      ::oDbfPersonalizado:Save()

      RETURN ( ::oFastReport:SaveToBlob( ::oDbfPersonalizado:nArea, "mModInf" ) )

   else

      if ::oDbfInf:Seek( ::cKeyInf() )
      ::oDbfInf:Load()
      else
      ::oDbfInf:Append()
      end if

      ::oDbfInf:cCodUse             := cCurUsr()
      ::oDbfInf:cClsInf             := ::ClassName()
      ::oDbfInf:cTypInf             := ::cTypeName
      ::oDbfInf:cNomInf             := ::cReportName

      ::oDbfInf:Save()

   end if

RETURN ( ::oFastReport:SaveToBlob( ::oDbfInf:nArea, "mModInf" ) )

//---------------------------------------------------------------------------//

Method MoveReport() CLASS TFastReportInfGen

   if ::oDbfInf:Seek( Padr( ::ClassName(), 50 ) + Upper( ::cReportName ) )

      if ApoloMsgNoYes( ::oDbfInf:mModInf, "�Desea mover este dise�o al original?" )

         ::oDbfInf:FieldPutByName( "mOrgInf", ::oDbfInf:mModInf )

         msgInfo( "El informe ha sido movido al original." )

      end if

   else

      msgStop( cCurUsr() + Upper( ::cReportName ), "No encontrado" )

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD OpenTemporal() CLASS TFastReportInfGen

   local o
   local lOpen
   local oError
   local oBlock

   lOpen                := .t.

   oBlock               := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      /*
      Apertura del fichero temporal-----------------------------------------------
      */

      ::oDbf:Create()

      ::oDbf:Activate( .f., .f. )

      for each o in ::aIndex
         ::oDbf:AddTmpIndex( o[ 1 ], ::cFileIndx, o[ 2 ], o[ 3 ], o[ 4 ], o[ 5 ], o[ 6 ], , , , , .t. )
      next

   RECOVER USING oError

      msgStop( ErrorMessage( oError ), "Imposible abrir todas las bases de datos" )

      ::CloseFiles()

      lOpen             := .f.

   END SEQUENCE

   ErrorBlock( oBlock )

RETURN ( lOpen )

//---------------------------------------------------------------------------//

METHOD ExtractOrder() CLASS TFastReportInfGen

   local n
   local a
   local c
   local cExpresion
   local cText
   local cField         := ""
   local cIndex         := ""

   if !Empty( ::cInformeFastReport )

      cText             := ::cInformeFastReport
      cText             := CutString( '<TfrxGroupHeader', '>', cText )

      if !Empty( cText )

         cText          := CutString( 'Condition="', '"', cText )

         a              := HB_ATokens( cText, ";" )

         if isArray( a )

            for each cText in a

               if !Empty( cText )

                  cField      := StrTran( cText, "&#34", "" ) // CutString( '&#34;', '&#34;', cText, .t. )

                  if !Empty( cField )

                     n        := aScan( ::aFields, {|a| a[ 6 ] == cField } )
                     if n != 0

                        do case
                           case ::aFields[ n, 2 ] == "C"
                              cExpresion  := ::aFields[ n, 1 ]

                           case ::aFields[ n, 2 ] == "N"
                              cExpresion  := "Str( " +  ::aFields[ n, 1 ] + " )"

                           case ::aFields[ n, 2 ] == "D"
                              cExpresion  := "Dtos( " +  ::aFields[ n, 1 ] + " )"

                        end case

                        if Empty( cIndex )
                           cIndex   := cExpresion
                        else
                           cIndex   += " + " + cExpresion
                        end if

                     end if

                  end if

               end if

            next

         end if

      end if

      if !Empty( cIndex )
         ::oDbf:AddTmpIndex( "Grupos", ( ::cFileIndx ), ( cIndex ), , , , , , , , , .t. )
      end if

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Duplicar() CLASS TFastReportInfGen

   local oDlg
   local oNombre
   local cNombre
   local oBmpGeneral
   local oTreeInforme   := ::oTreeReporting:GetSelected()

   if Empty( oTreeInforme:aItems ) .and. !Empty( oTreeInforme:cPrompt ) .and. Alltrim( Upper( oTreeInforme:cPrompt ) ) != "PERSONALIZADOS"

      DEFINE DIALOG oDlg RESOURCE "ADD_FAVORITOS" TITLE "Nuevo " + Alltrim( Lower( oTreeInforme:cPrompt ) )

      REDEFINE BITMAP oBmpGeneral ;
         ID       500 ;
         RESOURCE "Form_Blue_Add_Alpha_48" ;
         TRANSPARENT ;
         OF       oDlg

      REDEFINE GET oNombre ;
         VAR      cNombre ;
         ID       100 ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
         OF       oDlg ;
         ACTION   ( ::SaveDuplicar( cNombre, oDlg ) )

      REDEFINE BUTTON ;
         ID       IDCANCEL ;
         OF       oDlg ;
         ACTION   ( oDlg:end() )

      oDlg:AddFastKey( VK_F5, {|| ::SaveDuplicar( cNombre, oDlg ) } )

      ACTIVATE DIALOG oDlg CENTER

      oBmpGeneral:End()

   else

      MsgStop( "Debe seleccionar un tipo de documento." )

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD SaveDuplicar( cNombre, oDlg ) CLASS TFastReportInfGen

   if Empty( cNombre )

      MsgStop( "Nombre del informe no puede estar vacio" )

   else

      ::DesignReport( cNombre )

      oDlg:End()

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD LoadPersonalizado() CLASS TFastReportInfGen

   local oItem


   if !Empty( ::oTreePersonalizados )

      ::oTreePersonalizados:DeleteAll()

      ::BuildTree( ::oTreePersonalizados, .f. )

      if ::oDbfPersonalizado:Seek( ::ClassName() )

         while ( Rtrim( ::oDbfPersonalizado:cClsInf ) == ::ClassName() ) .and. !( ::oDbfPersonalizado:Eof() )

            oItem    := ::oTreePersonalizados:GetText( Alltrim( ::oDbfPersonalizado:cTypInf ) )
            if IsObject( oItem )
               oItem:Add( Alltrim( ::oDbfPersonalizado:cNomInf ), oItem:nImage, Alltrim( ::oDbfPersonalizado:cTypInf ) )
               oItem:Expand()
            end if

            // ::oTreePersonalizados:Add( Alltrim( ::oDbfPersonalizado:cNomInf ) + Space( 1 ) + "[" + Alltrim( ::oDbfPersonalizado:cTypInf ) + "]", 1 )

            ::oDbfPersonalizado:Skip()

         end while

      end if

      ::oTreePersonalizados:Expand()

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD Eliminar() CLASS TFastReportInfGen

   local oTreeInforme

   if IsNil( ::oPages:nOption ) .or. ( ::oPages:nOption <= 1 )
      MsgStop( "Solo es posible eliminar informes personalizados." )
      Return ( Self )
   else
      oTreeInforme      := ::oTreePersonalizados:GetSelected()
   end if

   if IsArray( oTreeInforme:aItems ) .and. !Empty( oTreeInforme:aItems )
      msgStop( "Seleccione el nodo inferior." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:cPrompt ) .and. !Empty( oTreeInforme:cPrompt )
      ::cReportName     := Rtrim( oTreeInforme:cPrompt )
   else
      msgStop( "No se ha podido cargar el nombre del informe." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:bAction ) .and. !Empty( oTreeInforme:bAction )
      ::cTypeName       := Rtrim( oTreeInforme:bAction )
   else
      msgStop( "No se ha podido cargar el tipo de informe." )
      Return ( Self )
   end if

   if ApoloMsgNoYes( "�Desea eliminar el informe " + ::cReportName + "?", "Confirme supresi�n" )

      if ::oDbfPersonalizado:Seek( ::cKeyInf() )
         ::oDbfPersonalizado:Delete()
      end if

      ::LoadPersonalizado()

   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD LoadReport() CLASS TFastReportInfGen

   ::cInformeFastReport             := ""

   /*
   Vamos a detectar si es un informe personalizado-----------------------------
   */

   if IsNil( ::oPages:nOption ) .or. ( ::oPages:nOption <= 1 )

      ::lPersonalizado              := .f.

      if ::oDbfInf:Seek( ::cKeyInf() )

         if !Empty( ::oDbfInf:mModInf )
            ::cInformeFastReport    := ::oDbfInf:mModInf
         elseif !Empty( ::oDbfInf:mOrgInf )
            ::cInformeFastReport    := ::oDbfInf:mOrgInf
         end if

      end if

   else

      ::lPersonalizado              := .t.

      if ::oDbfPersonalizado:Seek( ::cKeyInf() )

         if !Empty( ::oDbfPersonalizado:mModInf )
            ::cInformeFastReport    := ::oDbfPersonalizado:mModInf
         end if

      end if

   end if

   if Empty( ::cInformeFastReport )
      if File( cPatReporting() + Upper( ::cReportName ) + ".fr3" )
         ::cInformeFastReport       := MemoRead( cPatReporting() + Upper( ::cReportName ) + ".fr3" )
      end if
   end if

RETURN ( Self )

//---------------------------------------------------------------------------//

METHOD GetFieldByDescription( cDescription )

   local nPos
   local cField

   nPos                 := aScan( ::oDbf:aTField, { | oFld | oFld:cComment == cDescription } )
   if ( nPos != 0 )
      cField            := ::oDbf:aTField[ nPos ]:cName
   end if

RETURN ( cField )

//---------------------------------------------------------------------------//

METHOD DlgExportDocument( oWndBrw )

   local oDlg
   local oGetFile
   local cGetFile
   local oTreeInforme

   /*
   Vamos a obtener el nombre del informe---------------------------------------
   */

   if IsNil( ::oPages:nOption ) .or. ( ::oPages:nOption <= 1 )
      MsgStop( "Solo es posible exportar informes personalizados." )
      Return ( Self )
   end if

   oTreeInforme         := ::oTreePersonalizados:GetSelected()

   if IsArray( oTreeInforme:aItems ) .and. !Empty( oTreeInforme:aItems )
      msgStop( "Seleccione el nodo inferior." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:cPrompt ) .and. !Empty( oTreeInforme:cPrompt )
      ::cReportName     := Rtrim( oTreeInforme:cPrompt )
   else
      msgStop( "No se ha podido cargar el nombre del informe." )
      Return ( Self )
   end if

   if IsChar( oTreeInforme:bAction ) .and. !Empty( oTreeInforme:bAction )
      ::cTypeName       := Rtrim( oTreeInforme:bAction )
   else
      msgStop( "No se ha podido cargar el tipo de informe." )
      Return ( Self )
   end if

   if ::oDbfPersonalizado:Seek( ::cKeyInf() )
      if Empty( ::oDbfPersonalizado:mModInf )
         msgStop( "El informe esta vacio." )
         Return ( Self )
      end if
   else
      msgStop( "No se ha encontrado el informe." )
      Return ( Self )
   end if

   /*
   Ahora mostramos el dialogo si obtuvimos bien el informe---------------------
   */

   cGetFile             := Padr( FullCurDir() + "Informe.Dat", 100 )
 
   DEFINE DIALOG oDlg RESOURCE "ExpDocs" TITLE "Exportar documento"

      REDEFINE SAY PROMPT ::cTypeName ;
         ID       100 ;
         OF       oDlg

      REDEFINE GET oGetFile VAR cGetFile ;
         ID       110 ;
         BITMAP   "Folder" ;
         ON HELP  ( oGetFile:cText( Padr( cGetFile( "*.Dat", "Seleccion de fichero" ), 100 ) ) ) ;
			OF 		oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:Disable(), ::ExportDocument( cGetFile ), oDlg:Enable() )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| oDlg:Disable(), if( ::ExportDocument( cGetFile ), oDlg:Enable():End(), oDlg:Enable() ) } )

	ACTIVATE DIALOG oDlg CENTER

Return ( Self )

//---------------------------------------------------------------------------//

METHOD ExportDocument( cGetFile )

   local nHandle
   local lErrors  := .f.

   ( ::oDbfPersonalizado:nArea )->( __dbCopy( cPatTmp() + "Exp.Dbf", , {|| Upper( ( ::oDbfPersonalizado:nArea )->cClsInf ) + Upper( Rtrim( ( ::oDbfPersonalizado:nArea )->cNomInf ) ) == Padr( ::ClassName(), 50 ) + Upper( Rtrim( ::cReportName ) ) }, , , , , cLocalDriver() ) )

   nHandle        := fCreate( cGetFile )
   if nHandle != -1

      if fClose( nHandle ) .and. ( fErase( cGetFile ) == 0 )

         hb_ZipFile( cGetFile, cPatTmp() + "Exp.Dbf", 9 )
         hb_ZipFile( cGetFile, cPatTmp() + "Exp.Fpt", 9 )

      else

         lErrors  := .t.

      end if

   end if

   fErase( cPatTmp() + "Exp.Dbf" )
   fErase( cPatTmp() + "Exp.Fpt" )

   if !lErrors
      msgInfo( "Documento " + Rtrim( cGetFile ) + " exportado satisfactoriamente." )
   else
      msgStop( "Error en la creaci�n de fichero." )
   end if

Return ( !lErrors )

//---------------------------------------------------------------------------//

METHOD DlgImportDocument()

   local oDlg
   local oGetFile
   local cGetFile := Padr( FullCurDir() + "Exp.Dat", 100 )
   local oSayProc
   local cSayProc := ""

   DEFINE DIALOG oDlg RESOURCE "ImpDocs"

      REDEFINE GET oGetFile VAR cGetFile ;
         ID       100 ;
         BITMAP   "Folder" ;
         ON HELP  ( oGetFile:cText( Padr( cGetFile( "*.Dat", "Selecci�n de fichero" ), 100 ) ) ) ;
			OF 		oDlg

      REDEFINE SAY oSayProc PROMPT cSayProc ;
         ID       110 ;
         OF       oDlg

      REDEFINE BUTTON ;
         ID       IDOK ;
			OF 		oDlg ;
         ACTION   ( oDlg:Disable(), ::ImportDocument( cGetFile, oSayProc ), oDlg:Enable() )

		REDEFINE BUTTON ;
         ID       IDCANCEL ;
			OF 		oDlg ;
			ACTION 	( oDlg:end() )

   oDlg:AddFastKey( VK_F5, {|| oDlg:Disable(), ::ImportDocument( cGetFile, oSayProc ), oDlg:Enable() } )

	ACTIVATE DIALOG oDlg CENTER

Return ( nil  )

//---------------------------------------------------------------------------//

METHOD ImportDocument( cGetFile, oSayProc )

   local aFiles
   local oBlock
   local oError

   cGetFile       := Rtrim( cGetFile )

   if !File( cGetFile )
      MsgStop( "El fichero " + cGetFile + " no existe." )
      Return .f.
   end if

   aFiles         := Hb_GetFilesInZip( cGetFile )

   if !hb_UnZipFile( cGetFile, , , , cPatTmp(), aFiles )
      MsgStop( "No se ha descomprimido el fichero " + cGetFile + ".", "Error" )
      Return .f.
   end if
   hb_gcAll()

   if !File( cPatTmp() + "Exp.Dbf" ) .or. !File( cPatTmp() + "Exp.Fpt"   )
      MsgStop( "Faltan ficheros para importar el documento." )
      Return .f.
   end if

   oBlock         := ErrorBlock( {| oError | ApoloBreak( oError ) } )
   BEGIN SEQUENCE

      oSayProc:SetText( "Importando documento" )

      DATABASE NEW ::oExt PATH ( cPatTmp() ) FILE "Exp.Dbf" VIA ( cLocalDriver() )

      while !( ::oExt:Eof() )

         if Rtrim( ::oExt:cClsInf ) == Rtrim( ::ClassName() )

            if ::oDbfPersonalizado:Seek( Upper( ::oExt:cClsInf ) + Upper( ::oExt:cNomInf ) )
               ::oDbfPersonalizado:Delete()
            end if

            ::oDbfPersonalizado:AppendFromObject( ::oExt )

         else

            MsgStop( "El documento a importar no es del mismo tipo." )

         end if

         ::oExt:Skip()

      end while

      oSayProc:SetText( "Documento importado satisfactoriamente." )

   RECOVER USING oError

      msgStop( "Error importando documento." + CRLF + ErrorMessage( oError ) )

   END SEQUENCE

   ErrorBlock( oBlock )

   if !Empty( ::oExt )
      ::oExt:End()
   end if

   fErase( cPatTmp() + "Exp.Dbf" )
   fErase( cPatTmp() + "Exp.Fpt" )

   ::LoadPersonalizado()

Return ( Self )

//---------------------------------------------------------------------------//

METHOD nRemesaAgentes()

   local cExpHead

   if Empty( ::oRemAgeT )
      DATABASE NEW ::oRemAgeT PATH ( cPatEmp() ) CLASS "RemAgeT" FILE "RemAgeT.DBF" VIA ( cDriver() ) SHARED INDEX "RemAgeT.CDX"
   end if

   ::oRemAgeT:OrdSetFocus( "dFecCob" )

   cExpHead          := 'dFecCob >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecCob <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

   ::oRemAgeT:AddTmpIndex( cCurUsr(), GetFileNoExt( ::oRemAgeT:cFile ), ::oRemAgeT:OrdKey(), ( cExpHead ), , , , , , , , .t. )

   ::oMtrInf:cText   := "Procesando liquidaciones de agentes"
   ::oMtrInf:SetTotal( ::oRemAgeT:OrdKeyCount() )

   ::oRemAgeT:GoTop()

   while !::lBreak .and. !::oRemAgeT:Eof()

      if ( ::oRemAgeT:cCodAge >= ::oGrupoAgente:Cargo:Desde .and. ::oRemAgeT:cCodAge <= ::oGrupoAgente:Cargo:Hasta )
         ::nTotalRemesasAgentes  += ::oRemAgeT:nTotCob
      end if

      ::oRemAgeT:Skip()

      ::oMtrInf:AutoInc()

   end while

   ::oRemAgeT:IdxDelete( cCurUsr(), GetFileNoExt( ::oRemAgeT:cFile ) )

RETURN ( ::nTotalRemesasAgentes )

//---------------------------------------------------------------------------//

METHOD nFacturaClientes()

   local cExpHead

   if Empty( ::oFacCliT )
      ::oFacCliT  := TDataCenter():oFacCliT()  
   end if

   ::nTotalFacturasClientes   := 0

   with object ( ::oFacCliT )

      :OrdSetFocus( "dFecFac" )

      cExpHead                := 'dFecFac >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dFecFac <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

      :AddTmpIndex( cCurUsr(), GetFileNoExt( :cFile ), :OrdKey(), ( cExpHead ), , , , , , , , .t. )

      if !Empty( ::oMtrInf )
         ::oMtrInf:cText      := "Procesando facturas de clientes"
         ::oMtrInf:SetTotal( :OrdKeyCount() )
      end if

      :GoTop()

      while !::lBreak .and. !:Eof()

         if ( :cCodPago >= ::oGrupoFpago:Cargo:Desde         .and. :cCodPago  <= ::oGrupoFpago:Cargo:Hasta )         .and.;
            ( :cCodRut  >= ::oGrupoRuta:Cargo:Desde          .and. :cCodRut   <= ::oGrupoRuta:Cargo:Hasta )          .and.;
            ( :cCodAge  >= ::oGrupoAgente:Cargo:Desde        .and. :cCodAge   <= ::oGrupoAgente:Cargo:Hasta )        .and.;
            ( :cCodTrn  >= ::oGrupoTransportista:Cargo:Desde .and. :cCodTrn   <= ::oGrupoTransportista:Cargo:Hasta ) .and.;
            ( :cCodUsr  >= ::oGrupoUsuario:Cargo:Desde       .and. :cCodUsr   <= ::oGrupoUsuario:Cargo:Hasta )

            ::nTotalFacturasClientes   += :nTotFac

         end if

         :Skip()

         if !Empty( ::oMtrInf )
            ::oMtrInf:AutoInc()
         end if

      end while

      :IdxDelete( cCurUsr(), GetFileNoExt( :cFile ) )

   end with

RETURN ( ::nTotalFacturasClientes )

//---------------------------------------------------------------------------//

METHOD nPagosClientes()

   local cExpHead

   if Empty( ::oFacCliP )
      ::oFacCliP  := ::oFacCliP := TDataCenter():oFacCliP()
   end if

   if Empty( ::oFacCliT )
      ::oFacCliT  := TDataCenter():oFacCliT()  
   end if

   ::nTotalPagosClientes      := 0
   ::nTotalPendienteClientes  := 0

   with object ( ::oFacCliP )

      :OrdSetFocus( "dPreCob" )
      ::oFacCliT:OrdSetFocus( "cNumFac" )

      cExpHead                := 'dPreCob >= Ctod( "' + Dtoc( ::dIniInf ) + '" ) .and. dPreCob <= Ctod( "' + Dtoc( ::dFinInf ) + '" )'

      :AddTmpIndex( cCurUsr(), GetFileNoExt( :cFile ), :OrdKey(), ( cExpHead ), , , , , , , , .t. )

      if !Empty( ::oMtrInf )
         ::oMtrInf:cText      := "Procesando pagos de clientes"
         ::oMtrInf:SetTotal( :OrdKeyCount() )
      end if

      :GoTop()

      while !::lBreak .and. !:Eof()

         if ( :cCodPago >= ::oGrupoFpago:Cargo:Desde         .and. :cCodPago  <= ::oGrupoFpago:Cargo:Hasta )

            if ( ::oFacCliT:Seek( ::oFacCliT:cSerie + Str( ::oFacCliT:nNumFac ) + ::oFacCliT:cSufFac ) )                                    .and.;
               ( ::oFacCliT:cCodRut  >= ::oGrupoRuta:Cargo:Desde          .and. ::oFacCliT:cCodRut   <= ::oGrupoRuta:Cargo:Hasta )          .and.;
               ( ::oFacCliT:cCodAge  >= ::oGrupoAgente:Cargo:Desde        .and. ::oFacCliT:cCodAge   <= ::oGrupoAgente:Cargo:Hasta )        .and.;
               ( ::oFacCliT:cCodTrn  >= ::oGrupoTransportista:Cargo:Desde .and. ::oFacCliT:cCodTrn   <= ::oGrupoTransportista:Cargo:Hasta ) .and.;
               ( ::oFacCliT:cCodUsr  >= ::oGrupoUsuario:Cargo:Desde       .and. ::oFacCliT:cCodUsr   <= ::oGrupoUsuario:Cargo:Hasta )

               if ::oFacCliT:lCobrado
                  ::nTotalPagosClientes      += nTotRecCli( ::oFacCliP, ::oDbfDiv )
               else
                  ::nTotalPendienteClientes  += nTotRecCli( ::oFacCliP, ::oDbfDiv )
               end if

            end if

         end if

         :Skip()

         if !Empty( ::oMtrInf )
            ::oMtrInf:AutoInc()
         end if

      end while

      :IdxDelete( cCurUsr(), GetFileNoExt( :cFile ) )

   end with

RETURN ( ::nTotalPagosClientes )

//---------------------------------------------------------------------------//

METHOD SyncAllDbf()

   if Empty( ::oDbfInf )
      ::DefineReport()
   end if

   if Empty( ::oDbfPersonalizado )
      ::DefinePersonalizado()
   end if

   lCheckDbf( ::oDbfInf )
   lCheckDbf( ::oDbfPersonalizado )

RETURN ( Self )

//---------------------------------------------------------------------------//

/*
METHOD SyncAllDbf() CLASS TFastReportInfGen

   ::OpenData( cPatEmp(), .t. )

   lCheckDbf( ::oDbfInf )

   ::CloseData()

RETURN ( Self )
*/

//---------------------------------------------------------------------------//

Static Function CutString( cStart, cEnd, cText, lExclude )

   local nStart
   local nEnd
   local cString        := ""

   DEFAULT lExclude     := .f.

   nStart               := Rat( cStart, cText )
   if nStart != 0

      nEnd              := At( cEnd, cText, nStart + len( cStart ) )
      if nEnd != 0
         cString        := SubStr( cText, nStart, ( nEnd - nStart + len( cEnd ) ) )

         if lExclude
            cString     := StrTran( cString, cStart, "" )
            cString     := StrTran( cString, cEnd, "" )
         end if

      end if

   end if

RETURN ( cString )

//---------------------------------------------------------------------------//