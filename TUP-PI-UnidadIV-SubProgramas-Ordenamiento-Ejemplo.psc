Algoritmo ejemploOrdenamiento
	Definir notasAlumnos, cantidad, opMenu Como Entero;
	cantidad<-5;
	Dimension notasAlumnos[cantidad];
	
	Escribir "Bienvenidos";
	
	cargarArray(notasAlumnos,cantidad);
	
	Repetir
		menu();
		Leer opMenu;
		
		Segun opMenu Hacer
			2:
				ordenarArray(notasAlumnos,cantidad);
			4:
				mostrarArray(notasAlumnos,cantidad);
			De Otro Modo:
				
		Fin Segun
		
	Hasta Que opMenu==0;
	
	Escribir "Chau, hasta luego";
	
FinAlgoritmo

SubProceso menu()
	Escribir "Seleccione una opción de menú";
	Escribir "1. So some ****";
	Escribir "2. Ordenar notas alumnos";
	Escribir "3. So some ****";
	Escribir "4. Listar notas";
	Escribir "0. SALIR";
FinSubProceso

SubProceso cargarArray(array,n)
	Para i<-0 Hasta n-1 Hacer
		Escribir "ingresar la nota del alumno";
		Leer array[i];
	Fin Para
	Limpiar Pantalla;
FinSubProceso

SubProceso mostrarArray(array,n)
	Limpiar Pantalla;
	Escribir "El array tiene los elementos:";
	Para i<-0 Hasta n-1 Hacer
		Escribir array[i];
	Fin Para
FinSubProceso

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

SubProceso ordernarArregloASC(array, n)
	Definir aux Como Entero;
	//ORDENAMIENTO ASCENDENTE => TRAIGO NUMERO MENOR HACIA DELANTE
	para i<-0 hasta n-2 Hacer //recorro el array hasta el penultimo elemento
		para j<-i+1 hasta n-1 Hacer //recorro el array hasta el ultimo elemento
			si array[i]>array[j] Entonces
				aux <- array[i]; //almaceno momentaniamente el valor a empujar hacia atras en una variable auxiliar
				array[i] <- array[j]; //traigo el numero siguiente (que es menor) hacia delante
				array[j] <- aux; //guardo e numero a	empujar atras
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso ordernarArregloDESC(array, n)
	Definir aux Como Entero;
	//ORDENAMIENTO DESCENDENTEMENTE => TRAIGO NUMERO MAYOR HACIA DELANTE
	para i<-0 hasta n-2 Hacer //recorro el array hasta el penultimo elemento
		para j<-i+1 hasta n-1 Hacer //recorro el array hasta el ultimo elemento
			si array[i]<array[j] Entonces
				aux <- array[i]; //almaceno momentaniamente el valor a empujar hacia atras en una variable auxiliar
				array[i] <- array[j]; //traigo el numero siguiente (que es mayor) hacia delante
				array[j] <- aux; //guardo e numero a	empujar atras
			FinSi
		FinPara
	FinPara
FinSubProceso
