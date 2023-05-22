Proceso sin_titulo
	//Realizar un programa que permita almacenar números reales en una matriz de orden 4×3, cuatro filas y tres columnas. Además,
	//calcular e imprimir la suma de cada fila
	//calcular e imprimir la suma total
	
	Definir numerosReales Como Real
	Dimension numerosReales[4,3];
	//Rango filas (0..3)
	//Rangos columnas (0..2)
	
	Definir sumaSubTotales Como Real
	Dimension sumaSubTotales[4];
	// rango filas (0..3)
	
	Definir sumaTotal Como Real;
	Definir sumaSubTotal Como Real;
	sumaTotal <- 0;
	sumaSubTotal <- 0;
	
	//Cargo el array
	Para fila<-0 Hasta 3 Con Paso 1 Hacer
		Para columna<-0 Hasta 2 Con Paso 1 Hacer
			Escribir Sin Saltar "ingrese un numero real: "
			Leer numerosReales[fila,columna];
		Fin Para
	Fin Para
	
	//Recorro
	Para fila<-0 Hasta 3 Con Paso 1 Hacer
		sumaSubTotal <- 0; //inicializo el acumulador de la fila en 0
		
		Para columna<-0 Hasta 2 Con Paso 1 Hacer
			sumaTotal <- sumaTotal + numerosReales[fila,columna]; //sumo el total
			
			sumaSubTotal <- sumaSubTotal + numerosReales[fila,columna];  //sumo el total de la fila
		Fin Para
		
		sumaSubTotales[fila] <- sumaSubTotal; //asigna la suma de la fila al otro arreglo
	Fin Para
	
	Escribir sumaTotal " " sumaSubTotales[0] " " sumaSubTotales[1] " " sumaSubTotales[2] " " sumaSubTotales[3]
	
FinProceso
