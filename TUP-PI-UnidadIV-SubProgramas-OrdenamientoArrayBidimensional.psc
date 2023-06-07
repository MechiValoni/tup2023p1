Algoritmo ejemploOrdenamientoArrayBidimencional
	//DEFINIR UN ARRAY Y LLAMAR A LOS SUBPROGRAMAS
	//EL ARRAY PUEDE SER DE TIPO ENTERO, REAL O CARACTER

FinAlgoritmo

SubProceso cargarArray(array,n,m)
	Para i<-0 Hasta n-1 Hacer
		Escribir "Ingrese los valores para la fila " i+1; 
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar "Ingresar el valor para la columna " j+1;
			Leer array[i,j];
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso

SubProceso mostrarArray(array,n,m)
	Escribir "El array tiene los elementos:";
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] " ";
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso

//ALGORTIMO PARA DEFINIR SI SE QUIERE ORDENAR ASCENDENTEMENTE O DESCENDENTEMENTE
SubProceso ordenarArray(array,n,m)
	Definir orderBy Como Caracter;
	Definir columnaAOrdenar Como Entero;
	Repetir
		Escribir "Ingrese ASC si quiere ordenarlo ascendentemente o DESC si quiere ordenarlo descendentemente";
		Leer orderBy;
		orderBy <- Mayusculas(orderBy);
	Mientras Que orderBy<>"ASC" y orderBy<>"DESC"
	
	Repetir
		Escribir "Ingrese la columna por la que quiere ordenar de 0 a " m-1;
		Leer columnaAOrdenar;
	Mientras Que columnaAOrdenar<0 o columnaAOrdenar>m-1
	
	si orderBy="ASC" Entonces
		ordernarArregloASC(array,n,m,columnaAOrdenar);
	SiNo
		ordernarArregloDESC(array,n,m,columnaAOrdenar);
	FinSi
FinSubProceso

//ORDENAMIENTO ASCENDENTE => ORDENO TODO EL ARRAY POR UNA COLUMNA
SubProceso ordernarArregloASC(array,n,m,columnaAOrdenar)
	Definir aux Como Entero; //cambiar el tipo de dato según el tipo de datos del array
	para i<-0 hasta n-2 Hacer //recorro las filas del array hasta la penultima
		para k<-i+1 hasta n-1 Hacer //recorro las filas del array hasta la última
			si array[i,columnaAOrdenar]>array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta m-1 Hacer //recorro las columnas del array
					aux <- array[i,j];
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

//ORDENAMIENTO DESCENDENTEMENTE => ORDENO TODO EL ARRAY POR UNA COLUMNA
SubProceso ordernarArregloDESC(array,n,m,columnaAOrdenar)
	Definir aux Como Entero; //cambiar el tipo de dato según el tipo de datos del array
	para i<-0 hasta n-2 Hacer //recorro las filas del array hasta la penultima
		para k<-i+1 hasta n-1 Hacer //recorro las filas del array hasta la última
			si array[i,columnaAOrdenar]<array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta m-1 Hacer //recorro las columnas del array
					aux <- array[i,j]; 
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso
