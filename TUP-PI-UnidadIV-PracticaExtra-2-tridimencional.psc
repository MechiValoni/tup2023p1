Proceso sin_titulo
	//Escriba un algoritmo que lea un arreglo de 5 x N x 2 indicando que una empresa tiene N vendedores cada uno de los cuales vende 5
	//productos en abril y mayo. El arreglo almacena los ingresos obtenidos por cada vendedor en cada producto y mes, imprimir el total de cada vendedor en abril y mayo y
	//obtener los ingresos totales de la tienda en abril y mayo.
	//Los productos son filas
	//Los vendedores son columnas
	//Los meses (abril/mayo) son las paginas
	
	Definir ingresosProductoVendedor, subTotal, subTotalVendedor, ingresoVendedor Como Real;
	Definir cantidadVendedores, cantidadProductos, meses Como Entero;
	cantidadProductos <- 2;
	ingresosTotales <- 0; //Inicializo el acumulador en 0
	meses <- 2;
	//(0..1)
	//(0..2)
	
	Escribir "Ingrese la cantidad de Vendedores";
	Leer cantidadVendedores;
	Dimension ingresosProductoVendedor[cantidadProductos+1,cantidadVendedores,meses];
	
	Definir ingresosMensuales Como Real;
	Dimension ingresosMensuales[meses];
	//(0...1)
	
	// Cargo el arreglo
	Para vendedor<-0 Hasta cantidadVendedores-1 Hacer
		Escribir Sin Saltar "Los ingresos del vendedor " vendedor +1
		Para mes<-0 Hasta 1 Hacer
			Escribir Sin Saltar " para el mes " mes +1
			Para producto<-0 Hasta cantidadProductos-1 Hacer
				Escribir " y el producto : " producto +1
				Leer ingresosProductoVendedor[producto,vendedor,mes];
			FinPara
		Fin Para
	Fin Para
	
	// Recorro el arreglo
	Para mes<-0 Hasta meses-1 Hacer
		subTotal <- 0;
		Para vendedor<-0 Hasta cantidadVendedores-1 Hacer
			subTotalVendedor <- 0;
			Para producto<-0 Hasta cantidadProductos-1 Hacer
				subTotal <- subTotal + ingresosProductoVendedor[producto,vendedor,mes];
				
				subTotalVendedor <- subTotalVendedor + ingresosProductoVendedor[producto,vendedor,mes];
			FinPara
			ingresosProductoVendedor[cantidadProductos,vendedor,mes] <- subTotalVendedor; // Acumulo los ingres por vendedor
		Fin Para
		ingresosMensuales[mes] <- subTotal; // acumulo los ingresos de cada mes.
	Fin Para
	
	Escribir "Los ingresos mensuales de abril son " ingresosMensuales[0] " y en mayo son " ingresosMensuales[1];
	
	Para j<-0 Hasta cantidadVendedores-1 Con Paso 1 Hacer
		Para k<-0 Hasta meses-1 Con Paso 1 Hacer
			Escribir "El ingreso para el vendedor " j+1 "en el mes " k+1 " es: "  ingresosProductoVendedor[cantidadProductos,j,k];
		Fin Para
	Fin Para

FinProceso
