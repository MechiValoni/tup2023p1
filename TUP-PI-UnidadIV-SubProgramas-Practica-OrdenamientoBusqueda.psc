Algoritmo practicaUnidadIVOrdernamientoBusqueda
	Definir pacientes Como Caracter;
	Definir optMenu, cantidadPacientes, cantidadColumnas Como Entero;
	cantidadPacientes <- 8;
	cantidadColumnas <- 5;
	Dimension pacientes[cantidadPacientes,5];
	
	Escribir "Bienvenido!"
	cargarPacientes(pacientes);
	
	Repetir
		menu()
		Leer optMenu
		
		Segun optMenu Hacer
			1:
				buscarPacienteDNI(pacientes, cantidadPacientes, cantidadColumnas);
			3:
				ordernarPacientesPorApellidoYNombre(pacientes, cantidadPacientes, cantidadColumnas);
			4: 
				buscarPacienteApellidoNombre(pacientes,cantidadPacientes,cantidadColumnas);
			De Otro Modo:
				Escribir "Ingrese una opción de menú válida";
		Fin Segun
		
	Hasta Que optMenu == 0 
FinAlgoritmo

SubProceso menu()
	Escribir "Ingrese una de las opciones abajo descriptas"
	Escribir "1. Buscar paciente por DNI";
	Escribir "2. Listado de pacientes ordenados por apellido";
	Escribir "3. Listado de pacientes ordenado";
	Escribir "4. Buscar paciente por apellido y nombre";
	Escribir "0. Salir!!";
FinSubProceso

SubProceso buscarPacienteDNI(array,n,m)
	Definir dniABuscar Como Caracter;
	Definir indicePaciente Como Entero;
	Escribir "Ingrese el dni del paciente a buscar";
	Leer dniABuscar;
	indicePaciente <- buscarPaciente(array,n,dniABuscar,2);
	
	Si indicePaciente>0 Entonces
		mostrarPaciente(indicePaciente,array,m);
	SiNo
		Escribir "Paciente con el dni: " dniABuscar " no encontrado.";
	FinSi
FinSubProceso

SubProceso buscarPacienteApellidoNombre(array,n,m)
	Definir apellidoABuscar, nombreABuscar Como Caracter;
	Definir indicePacienteApellido, indicePacienteNombre Como Entero;
	Definir elementoEncontrado Como Logico;
	elementoEncontrado<- Falso;
	
	Escribir "Ingrese el apellido del paciente a buscar";
	Leer apellidoABuscar;
	Escribir "Ingrese el nombre del paciente a buscar";
	Leer nombreABuscar;
	
	
	Definir i, indiceInferior, indiceSuperior, centro Como Entero;
	elementoEncontrado <- Falso;
	//rango del array (0..n-1)
	indiceInferior<-0; //al comienzo el indice inferior es 0
	indiceSuperior<-n-1; //al comienzo el indice superior es n+1
	
	Mientras indiceInferior<=indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2); //busco el centro del array
		si array[centro,0] == nombreABuscar y array[centro,1] == apellidoABuscar Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		SiNo 
			Si array[centro,1] > apellidoABuscar Entonces
				indiceSuperior <- centro -1; //modifico el indice superior, para buscar en el "array inferior"
			SiNo
				indiceInferior <- centro +1;  //modifico el indice inferior, para buscar en el "array superior" 
			FinSi
		FinSi
	FinMientras
	
	Si elementoEncontrado Entonces
		mostrarPaciente(centro,array,m);
	SiNo
		Escribir "Paciente con el nombre y apellido: " nombreABuscar " " apellidoABuscar " no encontrado.";
	FinSi
FinSubProceso

// RETORNA EL INDICE DEL PACIENTE SI LO ENCUENTRA, EN CASO CONTRARIO RETORNA -1
Funcion return<- buscarPaciente(array,n,elementoABuscar,columnaABuscar)
	Definir i Como Entero;
	Definir elementoEncontrado Como Logico;
	i<-0;
	elementoEncontrado<- Falso;
	
	Mientras (no elementoEncontrado) y i<n Hacer
		Si array[i,columnaABuscar] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero;
		SiNo
			i <- i +1
		FinSi
	FinMientras
	
	Si elementoEncontrado Entonces
		return <- i;
	SiNo
		return <- -1;
	FinSi
FinFuncion

SubProceso mostrarPaciente(indice, array, m)
	Limpiar Pantalla;
	Escribir "Los datos del paciente son: "
	Para j<-0 Hasta m-1 Hacer
		Escribir Sin Saltar array[indice,j],"   ";
	Fin Para
	Escribir Sin Saltar "Presione una tecla para continuar......";
	Leer var;
	Limpiar Pantalla;
FinSubProceso


SubProceso ordernarPacientesPorApellidoYNombre(array,n,m)
	Definir aux Como Caracter;
	Definir apellidoNombrei, apellidoNombrek Como Caracter;
	para i<-0 hasta n-2 Hacer //recorro las filas del array hasta la penultima
		para k<-i+1 hasta n-1 Hacer //recorro las filas del array hasta la última
			apellidoNombrei <-  concatenar(array[i,1],array[i,0]);
			apellidoNombrek <-  concatenar(array[k,1],array[k,0]);
			si apellidoNombrei>apellidoNombrek Entonces
				Para j<-0 Hasta m-1 Hacer //recorro las columnas del array
					aux <- array[i,j];
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso mostrarPacientes(array,n,m)
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j], "   ";
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso

SubProceso cargarPacientes(array)
	array[0,0] <- "Ana" 
	array[0,1] <- "Martinez"
	array[0,2] <- "17.123456"
	array[0,3] <- "+541141200011" 
	array[0,4] <- "56"
	array[1,0] <- "Camila"
	array[1,1] <- "Noe" 
	array[1,2] <- "25.789101" 
	array[1,3] <- "+543419485831" 
	array[1,4] <- "45"
	array[2,0] <- "Bruno" 
	array[2,1] <- "Noe" 
	array[2,2] <- "39.121314" 
	array[2,3] <- "+541145565789"
	array[2,4] <- "26"
	array[3,0] <- "Dardo"
	array[3,1] <- "Pistilli"
	array[3,2] <- "21.151617"
	array[3,3] <- "+541158637543"
	array[3,4] <- "48"
	array[4,0] <- "Ernestina"
	array[4,1] <- "Quesada"
	array[4,2] <- "33.181920"
	array[4,3] <- "+541161294758"
	array[4,4] <- "35"
	array[5,0] <- "Fausto"
	array[5,1] <- "Ramirez"
	array[5,2] <- "15.212223"
	array[5,3] <- "+543423444567"
	array[5,4] <- "60"
	array[6,0] <- "Jasmín"
	array[6,1] <- "Sosa"
	array[6,2] <- "40.242526"
	array[6,3] <- "+543402512345"
	array[6,4] <- "25"
	array[7,0] <- "Leonardo"
	array[7,1] <- "Tolosa"
	array[7,2] <- "11.272829"
	array[7,3] <- "+541151234567"
	array[7,4] <- "70"
FinSubProceso
