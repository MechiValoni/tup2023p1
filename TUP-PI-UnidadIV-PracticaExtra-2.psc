Proceso sin_titulo
	//Escriba un algoritmo que lea un arreglo de 5 x N indicando que una empresa tiene N vendedores cada uno de los cuales vende 5
	//productos. El arreglo almacena los ingresos obtenidos por cada vendedor en cada producto, imprimir el total de cada vendedor y
	//obtener los ingresos totales de la tienda.
	//Los productos son filas
	//Los vendedores son columnas
	
	Definir ingresosProductoVendedor, ingresosTotales, ingresoVendedor Como Real;
	Definir cantidadVendedores, cantidadProductos Como Entero;
	cantidadProductos <- 5;
	ingresosTotales <- 0; //Inicializo el acumulador en 0
	
	Escribir "Ingrese la cantidad de Vendedores";
	Leer cantidadVendedores;
	Dimension ingresosProductoVendedor[cantidadProductos+1,cantidadVendedores];
	
	// Cargo el arreglo
	Para vendedor<-0 Hasta cantidadVendedores-1 Hacer
		Escribir "Ingrese lo ingresos del vendedor " vendedor +1
		Para producto<-0 Hasta cantidadProductos-1 Hacer
			Escribir "Ingrese el ingreso por el producto :" producto +1
			Leer ingresosProductoVendedor[producto,vendedor];
		Fin Para
	Fin Para
	
	
	// Recorrer
	Para vendedor<-0 Hasta cantidadVendedores-1 Hacer
		ingresoVendedor <- 0; 
		//recorro todos los productos
		Para producto<-0 Hasta cantidadProductos-1 Hacer
			ingresosTotales <- ingresosTotales + ingresosProductoVendedor[producto,vendedor]; // sumo todos los ingresos
			
			ingresoVendedor <- ingresoVendedor + ingresosProductoVendedor[producto,vendedor]; // sumuo el ingreso del vendedor actual
		Fin Para
		ingresosProductoVendedor[5,vendedor] <- ingresoVendedor; // Almaceno en la fila 6 (subindice 5) el subtotal del vendedor actual
	Fin Para
	
	Escribir "Ingresos totales: " ingresosTotales;
	
	// Recorrer los vendedores y mostrar subtotales fila 6 (subindice 5)
	Para vendedor<-0 Hasta cantidadVendedores-1 Hacer
		Escribir "Ingresos totales del vendedor " vendedor+1 " : " ingresosProductoVendedor[5,vendedor];
	Fin Para

FinProceso
