Algoritmo ejemploOrdenamientoArrayUnidimensional
	//DEFINIR UN ARRAY Y LLAMAR A LOS SUBPROGRAMAS
	//EL ARRAY PUEDE SER DE TIPO ENTERO, REAL O CARACTER
	
FinAlgoritmo

SubProceso cargarArray(array,n)
	Para i<-0 Hasta n-1 Hacer
		Escribir "Ingresar el valor: " i+1;
		Leer array[i];
	Fin Para
FinSubProceso

SubProceso mostrarArray(array,n)
	Escribir "El array tiene los elementos:";
	Para i<-0 Hasta n-1 Hacer
		Escribir array[i];
	Fin Para
FinSubProceso

//ALGORTIMO PARA DEFINIR SI SE QUIERE ORDENAR ASCENDENTEMENTE O DESCENDENTEMENTE
SubProceso ordenarArray(array,n)
	Definir orderBy Como Caracter;
	Repetir
		Escribir "Ingrese ASC si quiere ordenarlo ascendentemente o DESC si quiere ordenarlo descendentemente";
		Leer orderBy;
		orderBy <- Mayusculas(orderBy);
	Mientras Que orderBy<>"ASC" y orderBy<>"DESC"
	
	si orderBy="ASC" Entonces
		ordernarArregloASC(array,n);
	SiNo
		ordernarArregloDESC(array,n);
	FinSi
FinSubProceso

//ORDENAMIENTO ASCENDENTE => TRAIGO VALOR MENOR HACIA DELANTE
SubProceso ordernarArregloASC(array, n)
	Definir aux Como Entero; //cambiar el tipo de dato según el tipo de datos del array
	para i<-0 hasta n-2 Hacer //recorro el array hasta el penultimo elemento
		para j<-i+1 hasta n-1 Hacer //recorro el array hasta el ultimo elemento
			si array[i]>array[j] Entonces
				aux <- array[i]; //almaceno momentaniamente el valor mayor
				array[i] <- array[j]; //traigo el valor menor hacia delante
				array[j] <- aux; //guardo el valor mayor atras
			FinSi
		FinPara
	FinPara
FinSubProceso

//ORDENAMIENTO DESCENDENTEMENTE => TRAIGO VALOR MAYOR HACIA DELANTE
SubProceso ordernarArregloDESC(array, n)
	Definir aux Como Entero; //cambiar el tipo de dato según el tipo de datos del array
	para i<-0 hasta n-2 Hacer //recorro el array hasta el penultimo elemento
		para j<-i+1 hasta n-1 Hacer //recorro el array hasta el ultimo elemento
			si array[i]<array[j] Entonces
				aux <- array[i]; //almaceno momentaniamente el valor menor
				array[i] <- array[j]; //traigo el valor mayor hacia delante
				array[j] <- aux; //guardo el valor menor atras
			FinSi
		FinPara
	FinPara
FinSubProceso
