Proceso ejemploSuper
	Definir precioUnitarioProducto, montoTotalTicket, montoDescuentoTicket, montoFinalTicket Como Real
	Definir unidadExtraProducto, docenasProducto, docenasMinDescuento Como Entero
	docenasMinDescuento <- 3
	precioUnitarioProducto <- 60
	montoDescuentoTicket <- 0
	montoFinalTicket <- 0
	montoTotalTicket <- 0
	
	Escribir "Ingrese la cantidad de docenas del producto"
	Leer docenasProducto
	montoTotalTicket <- precioUnitarioProducto * docenasProducto * 12 
	
	Si docenasProducto - docenasMinDescuento > 0 Entonces
		montoDescuentoTicket <- montoTotalTicket * 0.15
		montoFinalTicket <- montoTotalTicket - montoDescuentoTicket
		unidadExtraProducto <- docenasProducto - docenasMinDescuento
	SiNo
		montoDescuentoTicket <- montoTotalTicket * 0.10
		montoFinalTicket <- montoTotalTicket - montoDescuentoTicket
	Fin Si
	
	Escribir "$ " montoTotalTicket " - " montoDescuentoTicket " = " montoFinalTicket " con " unidadExtraProducto " unidades de regalo"

FinProceso
