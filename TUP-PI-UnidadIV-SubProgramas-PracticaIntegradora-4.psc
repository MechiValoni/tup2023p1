Algoritmo Tema2
	Definir datosVendedores, ventas Como Caracter;
	Definir cantVendedores, cantDatosVendedores, cantVentas, cantDatosVentas Como Entero;
	Definir opcionMenu Como Entero;
	cantVendedores <- 5;
	cantDatosVendedores <- 3;
	cantDatosVentas <- 4;
	Dimension datosVendedores[cantVendedores,cantDatosVendedores];
	
	datosVendedores[0,0] <- "102";
	datosVendedores[0,1] <- "Juan";
	datosVendedores[0,2] <- "Perez";
	datosVendedores[1,0] <- "100";
	datosVendedores[1,1] <- "Mirta";
	datosVendedores[1,2] <- "Cermeli";
	datosVendedores[2,0] <- "99";
	datosVendedores[2,1] <- "Gerardo";
	datosVendedores[2,2] <- "Malaponte";
	datosVendedores[3,0] <- "98";
	datosVendedores[3,1] <- "Mauro";
	datosVendedores[3,2] <- "Mansur";
	datosVendedores[4,0] <- "101";
	datosVendedores[4,1] <- "Aldana";
	datosVendedores[4,2] <- "Martin";
	
	Repetir
		opcionMenu <- menu();
		Segun opcionMenu
			1:
				Escribir "Ingrese el numero de ventas ";
				Leer cantVentas;
				Dimension ventas[cantVentas,cantDatosVentas];
				
				registrarVentas(ventas, cantVentas, cantDatosVentas);
				Escribir "---------------------------------------------------------------";
			2:
				verResumenVentas(datosVendedores,cantVendedores,cantDatosVendedores,ventas,cantVentas,cantDatosVentas);
				Escribir "---------------------------------------------------------------";
			3:
				buscarVentaPorNumero(ventas,cantVentas,cantDatosVentas);
				Escribir "---------------------------------------------------------------";
			4:
				verVentasOrdenadasPorFecha(ventas,cantVentas,cantDatosVentas);
				Escribir "---------------------------------------------------------------";
			5:
				Escribir "Gracias por visitar nuestro programa";
		FinSegun
	Mientras Que opcionMenu<>5
	
FinAlgoritmo

Funcion return<- menu()
	Definir opt Como Entero;
	Repetir
		Escribir "Seleccionar una de las opciones que sigue:";
		Escribir "1. Registrar ventas";
		Escribir "--- (sólo si previamente se registraron los votos) ---";
		Escribir "2. Ver resumen ventas";
		Escribir "3. Buscar venta por numero venta";
		Escribir "4. Ver ventas ordenadas por fecha";
		Escribir "5. Salir";
		Leer opt;
	Mientras Que opt<1 o opt>5
	return<-opt;
FinFuncion

SubProceso registrarVentas(ventas,n,m)
	Definir idVendedor, fechaVenta Como Caracter;
	Definir montoVenta Como Real;
	Definir nroVendedor Como Entero;
	
	Escribir "Se registraran las ventas";
	
	Para i<-0 Hasta n-1 Hacer
		
		Repetir
			Escribir "Ingrese el id del vendedor de la venta";
			Leer nroVendedor
		Mientras Que no esNroVendedorValido(nroVendedor)
		ventas[i,1] <- ConvertirATexto(nroVendedor);
		
		Repetir
			Escribir "Ingrese el monto de la venta";
			Leer montoVenta
		Mientras Que montoVenta<0
		ventas[i,2] <- ConvertirATexto(montoVenta);
		
		Escribir "Ingrese la fecha DD/MM/AA";
		Leer fechaVenta
		ventas[i,3] <- fechaVenta;
		
		ventas[i,0] <- ConvertirATexto(100 + i); //Asigno el numero de la venta
		
		Escribir "La venta se ha registrado correctamente";
	Fin Para
	
	Escribir "Finaliza la carga de las ventas";
FinSubProceso

Funcion return <- esNroVendedorValido(nroVendedor)
	return <- nroVendedor >= 98 y nroVendedor <= 102
FinFuncion

SubProceso verResumenVentas(datosVendedores,n,m,ventas,p,q)
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar datosVendedores[i,j], "   ";
		Fin Para
		Escribir "$",calcularComisionVendedor(ventas,datosVendedores[i,0],p,q);
	Fin Para
	Escribir "TOTAL DE VENTAS CONTABILIZADAS   ", p;
FinSubProceso

Funcion return <- calcularComisionVendedor(ventas,nroVendedor,n,m)
	Definir totalMonto Como Real;
	Para i<-0 Hasta n-1 Hacer
		Si ventas[i,1] == nroVendedor Entonces
			totalMonto <- totalMonto + ConvertirANumero(ventas[i,2]);
		FinSi
	Fin Para
	Si totalMonto > 1000000 Entonces
		totalMonto <- totalMonto * 0.05
	SiNo
		totalMonto <- totalMonto * 0.03
	FinSi
	return <- ConvertirATexto(totalMonto);
FinFuncion

//COMO LA CANTIDAD DE VENTAS PROMEDIO ES GRANDE, ES MAS ÓPTIMO REALIZAR UNA BUSQUEDA BINARIA
SubProceso buscarVentaPorNumero(ventas,n,m)
	
	Definir i, indiceInferior, indiceSuperior, centro  Como Entero;
	Definir nroVenta Como Entero;
	Definir elementoEncontrado Como Logico;
	elementoEncontrado <- Falso;
	indiceInferior<-0; 
	indiceSuperior<-n-1;
	
	Escribir "Ingrese el numero de venta a buscar";
	Leer nroVenta;
	
	ordernarArregloASC(ventas,n,m,0);
	
	Mientras indiceInferior<=indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2); 
		si ConvertirANumero(ventas[centro,0]) == nroVenta Entonces
			elementoEncontrado <- Verdadero;
		SiNo 
			Si ConvertirANumero(ventas[centro,0]) > nroVenta Entonces
				indiceSuperior <- centro -1; 
			SiNo
				indiceInferior <- centro +1;  
			FinSi
		FinSi
	FinMientras
	
	Si elementoEncontrado Entonces
		Escribir ventas[centro,0], "  ", ventas[centro,1], "  ", ventas[centro,2], "   ", ventas[centro,3];
	SiNo
		Escribir "No se encontro el nro de venta";
	FinSi
FinSubProceso

//ORDENAMIENTO ASCENDENTTEMENTE 
SubProceso ordernarArregloASC(array,n,m,columnaAOrdenar)
	Definir aux Como caracter;
	para i<-0 hasta n-2 Hacer 
		para k<-i+1 hasta n-1 Hacer 
			si array[i,columnaAOrdenar] > array[k,columnaAOrdenar]  Entonces
				Para j<-0 Hasta m-1 Hacer
					aux <- array[i,j]; 
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso verVentasOrdenadasPorFecha(ventas,n,m)
	Escribir "Listado de ventas ordenado";
	ordernarArregloFechasDESC(ventas,n,m,3);
	mostrarArray(ventas,n,m);
FinSubProceso

//ORDENAMIENTO DESCENDENTEMENTE => ORDENO TODO EL ARRAY POR LA COLUMNA A ORDENAR (DEBE SER DE FECHA EN FORMATO DD/MM/AA)
SubProceso ordernarArregloFechasDESC(array,n,m,columnaAOrdenar)
	Definir aux Como caracter;
	para i<-0 hasta n-2 Hacer 
		para k<-i+1 hasta n-1 Hacer 
			si fechaUnoMenorFechaDos(array[i,columnaAOrdenar], array[k,columnaAOrdenar])  Entonces
				Para j<-0 Hasta m-1 Hacer
					aux <- array[i,j]; 
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

Funcion return<- fechaUnoMenorFechaDos(fechaUno, fechaDos)
	Definir aI, mI, dI, aK, mK, dK Como Entero;
	
	aI <- ConvertirANumero(Subcadena(fechaUno,6,7));
	mI <- ConvertirANumero(Subcadena(fechaUno,3,4));
	dI <- ConvertirANumero(Subcadena(fechaUno,0,1));
	aK <- ConvertirANumero(Subcadena(fechaDos,6,7));
	mK <- ConvertirANumero(Subcadena(fechaDos,3,4));
	dK <- ConvertirANumero(Subcadena(fechaDos,0,1));
	
	return <- ai<ak o (ai==ak y mi<mk) o (ai=ak y mi==mk y di<dk)
FinFuncion

// MUESTRO LOS DATOS DEL ARRAY
SubProceso mostrarArray(array,n,m)
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] "   ";
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso