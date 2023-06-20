Algoritmo EjIntegrador2
	
	Definir descripcionesSeguro, asegurados como caracter;
	Definir cuotasSeguro Como Real;
	Definir opcionMenu, cantidadAsegurados, cantidadCoberturas, cantidadTiposSeguros, cantidadDatosAsegurados Como Entero;
	cantidadAsegurados<-0;
	cantidadCoberturas <- 3;
	cantidadTiposSeguros <- 2;
	cantidadDatosAsegurados <- 5;
	Dimension descripcionesSeguro[cantidadCoberturas,cantidadTiposSeguros], cuotasSeguro[cantidadCoberturas, cantidadTiposSeguros], asegurados[100, cantidadDatosAsegurados];
	
	descripcionesSeguro[0,0] <- "Tercero Basico";
	descripcionesSeguro[0,1] <- "Hogar Base";
	descripcionesSeguro[1,0] <- "Tercero Completo";
	descripcionesSeguro[1,1] <- "Hogar Plus";
	descripcionesSeguro[2,0] <- "Todo Riesgo con Franquicia";
	descripcionesSeguro[2,1] <- "Hogar Completo";
	cuotasSeguro[0,0] <- 1000;
	cuotasSeguro[0,1] <- 500
	cuotasSeguro[1,0] <- 1500;
	cuotasSeguro[1,1] <- 750;
	cuotasSeguro[2,0] <- 3000;
	cuotasSeguro[2,1] <- 600;
	

	Repetir
		opcionMenu <- menu();
		Segun opcionMenu
			5:
				nuevoAsegurado(asegurados,cantidadAsegurados,descripcionesSeguro,cuotasSeguro,cantidadCoberturas,cantidadTiposSeguros);
				cantidadAsegurados <- cantidadAsegurados + 1; //INCREMENTO EN 1 LOS ASEGURADOS REGISTRADOS
			6:
				buscarAsegurado(asegurados,cantidadAsegurados,cantidadDatosAsegurados);
				Escribir "";
			7:
				verAseguradosOrdenados(asegurados,cantidadAsegurados,cantidadDatosAsegurados);
			8:
				Escribir "Gracias por visitar nuestro programa";
		FinSegun
	Mientras Que opcionMenu<>8
	
FinAlgoritmo

Funcion return<- menu()
	Definir opt Como Entero;
	Repetir
		Escribir "Ingrese una opción del MENU: ";
		Escribir "5- Registrar Nuevo Asegurado";
		Escribir "6- Buscar Asegurado por DNI";
		Escribir "7- Ver Asegurados Ordenados Por Tipo Seguro Y Cobertura";
		Escribir "8- Salir";
		Leer opt;
	Mientras Que opt<5 o opt>8
	return<-opt;
FinFuncion

//REGISTRA UN NUEVO ASEGURADO
SubProceso nuevoAsegurado(asegurados,i,descripcionesSeguro,cuotasSeguro,n,m)
	Definir dniAsegurado, tipoCobertura, esDebitoAutomatico Como Caracter;
	Definir montoAsegurar, cuotaFinal Como Real;
	
	Escribir "Ingrese nombre y apellido del Asegurado";
	Leer asegurados[i,0];
	
	Repetir
		Escribir "Ingrse el dni del Asegurado";
		Leer dniAsegurado;
	Mientras Que Longitud(dniAsegurado)<6 o Longitud(dniAsegurado)>8
	asegurados[i,1]<-dniAsegurado;
	
	mostrarCoberturas(descripcionesSeguro,cuotasSeguro,n,m);
	Repetir
		Escribir "Ingrse el tipo de cobertura";
		Leer tipoCobertura;
	Mientras Que no esCoberturaValida(descripcionesSeguro,n,m,tipoCobertura)
	asegurados[i,2]<-tipoCobertura;
	
	Repetir
		Escribir "Adhiere a débito automático? Si o No";
		Leer esDebitoAutomatico;
		esDebitoAutomatico <- Minusculas(esDebitoAutomatico);
	Hasta Que esDebitoAutomatico == "si" o esDebitoAutomatico == "no"
	asegurados[i,2]<-tipoCobertura;
	
	Escribir "Ingrse el monto a asegurar";
	Leer montoAsegurar;
	
	cuotaFinal <- calcularCuota(descripcionesSeguro,cuotasSeguro,n,m, tipoCobertura, montoAsegurar, esDebitoAutomatico);
	asegurados[i,3] <- ConvertirATexto(cuotaFinal);
	
	Escribir "Asegurado Registrado";
FinSubProceso

// ORDERNA Y MUESTRA LOS ASEGURADOS POR COBERTURA SELECCIONADA
SubProceso verAseguradosOrdenados(asegurados,n,m)
	Escribir "Los asegurados ordenados por Tipo Seguro y Cobertura son: ";
	ordernarArregloDESC(asegurados,n,m,2);
	mostrarArray(asegurados,n,m);
FinSubProceso

SubProceso buscarAsegurado(asegurados,n,m)
	Definir indiceCliente Como Entero;
	Definir dniAsegurado Como Caracter;
	indiceCliente <- -1;
	
	Repetir
		Escribir "Ingrse el dni del cliente";
		Leer dniAsegurado;
	Mientras Que Longitud(dniAsegurado)<6 o Longitud(dniAsegurado)>8
	
	indiceCliente <- buscarElemento(asegurados,n,1,dniAsegurado);
	
	Si indiceCliente >= 0 Entonces //Muestro los datos del asegurado
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar asegurados[indiceCliente,j], "   "
		FinPara
	SiNo
		Escribir "Asegurado no encontrado"; 
	FinSi
FinSubProceso

// CALCULA LA CUOTA FINAL PARA LOS DATOS INGRESADOS DEL ASEGURADO
Funcion return<- calcularCuota(descripcionesSeguro,cuotasSeguro,n,m, tipoCoberturaABuscar, montoAsegurar, esDebitoAutomatico)
	Definir i, j Como Entero;
	Definir cuota Como Real;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		j<-0;
		Mientras j <= m-1 y no elementoEncontrado
			si descripcionesSeguro[i,j] == tipoCoberturaABuscar Entonces
				elementoEncontrado <- Verdadero;
				cuota <- cuotasSeguro[i,j];
			FinSi
			j<-j+1;
		FinMientras
		i <- i +1; 
	FinMientras
	
	Si esDebitoAutomatico Entonces
		cuota <- cuota*0.95;  // Aplico descuento por debito automatico
	FinSi
	
	Si j == 0 Entonces // Es tipo seguro automotor
		cuota <- cuota + montoAsegurar*0.005; // Aplico recargo por monto a asegurar para seguro automotor
	SiNo
		cuota <- cuota + montoAsegurar*0.01; // Aplico recargo por monto a asegurar para seguro hogar
	FinSi
	
	cuota <- cuota*1.21; // Aplico IVA
	
	return <- cuota;
FinFuncion

// RETURNA VERDADERO SI tipoCoberturaABuscar EXISTE EN EL ARRAY DE descripcionesSeguro, EN CASO CONTRARIO RETORNA FALSO
Funcion return<- esCoberturaValida(descripcionesSeguro,n,m,tipoCoberturaABuscar)
	Definir i, j Como Entero;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		j<-0;
		Mientras j <= m-1 y no elementoEncontrado
			si descripcionesSeguro[i,j] == tipoCoberturaABuscar Entonces
				elementoEncontrado <- Verdadero; 
			FinSi
			j<-j+1;
		FinMientras
		i <- i +1; 
	FinMientras
	return <- elementoEncontrado;
FinFuncion

// RETORNO EL INDICE DEL ELEMENTO ENCONTRADO, EN CASO CONTRARIO (elemento no encontrado) RETORNO -1
Funcion return<- buscarElemento(array,n,columnaAbuscar,elementoABuscar)
	Definir i Como Entero;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si array[i,columnaAbuscar] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero;
		SiNo
			i <- i +1; 
		FinSi
	FinMientras
	Si elementoEncontrado Entonces
		return <- i;
	SiNo
		return <- -1;
	FinSi
FinFuncion

// MUESTRO LAS POR CADA TIPO DE SEGURO, LAS COBERTURA Y SU CUOTA BASE
SubProceso mostrarCoberturas(descripcionesSeguro, cuotasSeguro, n, m)
	Escribir "Las cobeturas y cuotas bases son:";
	Para j<-0 Hasta m-1 Hacer
		Para i<-0 Hasta n-1 Hacer
			Escribir descripcionesSeguro[i,j], "     " cuotasSeguro[i,j];
		Fin Para
	Fin Para
FinSubProceso

//ORDENAMIENTO DESCENDENTEMENTE => ORDENO TODO EL ARRAY POR LA COLUMNA A ORDENAR
SubProceso ordernarArregloDESC(array,n,m,columnaAOrdenar)
	Definir aux Como caracter; 
	para i<-0 hasta n-2 Hacer 
		para k<-i+1 hasta n-1 Hacer 
			si array[i,columnaAOrdenar]>array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta m-1 Hacer
					aux <- array[i,j]; 
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

// MUESTRO LOS DATOS DEL ARRAY
SubProceso mostrarArray(array,n,m)
	Escribir "Listado:";
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] "   ";
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso