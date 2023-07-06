Algoritmo Tema2
	Definir precandidatosVoleta, votos Como Caracter;
	Definir cantPrecandidatos, cantDatosPrecandidatos, cantVotos, cantDatosVotos Como Entero;
	Definir opcionMenu Como Entero;
	cantPrecandidatos <- 8;
	cantDatosPrecandidatos <- 5;
	cantDatosVotos <- 3;
	cantVotos <- 4;
	Dimension precandidatosVoleta[cantPrecandidatos,cantDatosPrecandidatos];
	Dimension votos[cantVotos,cantDatosVotos];
	
	precandidatosVoleta[0,0] <- "105";
	precandidatosVoleta[0,1] <- "1";
	precandidatosVoleta[0,2] <- "Enrique Estévez";
	precandidatosVoleta[0,3] <- "Adelante";
	precandidatosVoleta[0,4] <- "Unidos para cambiar Santa Fe";
	precandidatosVoleta[1,0] <- "105";
	precandidatosVoleta[1,1] <- "2";
	precandidatosVoleta[1,2] <- "Pablo Javkin";
	precandidatosVoleta[1,3] <- "Es con vos";
	precandidatosVoleta[1,4] <- "Unidos para cambiar Santa Fe";
	precandidatosVoleta[2,0] <- "105";
	precandidatosVoleta[2,1] <- "3";
	precandidatosVoleta[2,2] <- "Martín Malaponte";
	precandidatosVoleta[2,3] <- "Unidos en acción";
	precandidatosVoleta[2,4] <- "Unidos para cambiar Santa Fe";
	precandidatosVoleta[3,0] <- "105";
	precandidatosVoleta[3,1] <- "4";
	precandidatosVoleta[3,2] <- "Miguel Tessandori";
	precandidatosVoleta[3,3] <- "Santa Fe puede";
	precandidatosVoleta[3,4] <- "Unidos para cambiar Santa Fe";
	precandidatosVoleta[4,0] <- "70";
	precandidatosVoleta[4,1] <- "1";
	precandidatosVoleta[4,2] <- "Juan Monteverde";
	precandidatosVoleta[4,3] <- "Un futuro sin miedo";
	precandidatosVoleta[4,4] <- "Juntos avancemos";
	precandidatosVoleta[5,0] <- "70";
	precandidatosVoleta[5,1] <- "2";
	precandidatosVoleta[5,2] <- "Roberto Sukerman";
	precandidatosVoleta[5,3] <- "Vamos Rosario";
	precandidatosVoleta[5,4] <- "Juntos avancemos";
	precandidatosVoleta[6,0] <- "18";
	precandidatosVoleta[6,1] <- "1";
	precandidatosVoleta[6,2] <- "Héctor Chiappini ";
	precandidatosVoleta[6,3] <- "Justicia y libertad";
	precandidatosVoleta[6,4] <- "Unite por la libertad y la dignidad";
	precandidatosVoleta[7,0] <- "18";
	precandidatosVoleta[7,1] <- "2";
	precandidatosVoleta[7,2] <- "Miguel Bondi";
	precandidatosVoleta[7,3] <- "Por Rosario, por vos";
	precandidatosVoleta[7,4] <- "Unite por la libertad y la dignidad";
	
	Repetir
		opcionMenu <- menu();
		Segun opcionMenu
			1:
				registrarVotos(votos,cantVotos,cantDatosVotos);
				Escribir "---------------------------------------------------------------";
			2:
				verResumenVotacion(precandidatosVoleta,cantPrecandidatos,cantDatosPrecandidatos,votos,cantVotos,cantDatosVotos);
				Escribir "---------------------------------------------------------------";
			3:
				buscarVotoPoridBoleta(votos,cantVotos,cantDatosVotos);
				Escribir "---------------------------------------------------------------";
			4:
				verVotosPorNumeroListaDesc(votos,cantVotos,cantDatosVotos);
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
		Escribir "1. Registrar votos";
		Escribir "--- (sólo si previamente se registraron los votos) ---";
		Escribir "2. Ver resumen votación";
		Escribir "3. Buscar voto por id boleta";
		Escribir "4. Ver votos ordenados por número de lista desc";
		Escribir "5. Salir";
		Leer opt;
	Mientras Que opt<1 o opt>5
	return<-opt;
FinFuncion

SubProceso registrarVotos(votos,n,m)
	Definir idBoleta, nroLista, nroPrecandidato Como Caracter;
	
	Escribir "Comienza la carga de los vtos";
	Para i<-0 Hasta n-1 Hacer
		
		Repetir
			Escribir "Ingrese el id de la Boleta";
			Leer idBoleta
		Mientras Que no poseeMinimoCaracteres(idBoleta, 4)
		votos[i,0] <- idBoleta;
		
		Repetir
			Escribir "Ingrese el nro de lista / BLANCO / NULO";
			Leer nroLista
		Mientras Que no poseeMinimoCaracteres(nroLista, 2)
		votos[i,1] <- nroLista;
		
		Repetir
			Escribir "Ingrese el nro de precandidato / BLANCO / NULO";
			Leer nroPrecandidato
		Mientras Que no poseeMinimoCaracteres(nroPrecandidato, 1)
		votos[i,2] <- nroPrecandidato;
		
		Escribir "Voto registrado";
	FinPara
	Escribir "Finaliza la carga de los votos";
FinSubProceso

Funcion return<- poseeMinimoCaracteres(cadenaVar, minCaracteres)
	return <- Longitud(cadenaVar) >= minCaracteres;
FinFuncion

SubProceso verResumenVotacion(precandidatosVoleta,n,m,votos,p,q)
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar precandidatosVoleta[i,j], "   ";
		FinPara
		Escribir calcularProcentajeVotos(precandidatosVoleta[i,0],precandidatosVoleta[i,1],votos,p,q), "%";
	Fin Para
	Escribir  "BLANCOS     " calcularProcentajeVotos("BLANCO","BLANCO",votos,p,q), "%";
	Escribir  "NULOS     " calcularProcentajeVotos("NULO","NULO",votos,p,q), "%";
	Escribir "TOTAL DE VOTOS CONTABILIZADOS    ", p;
FinSubProceso

Funcion return <- calcularProcentajeVotos(nroLista,nroPrecandidato,votos,p,q)
	Definir cantVotos Como Entero
	cantVotos <- 0;
	Para i<-0 Hasta p-1 Hacer
		Si Minusculas(votos[i,1]) == Minusculas(nroLista) y Minusculas(votos[i,2]) == Minusculas(nroPrecandidato) Entonces
			cantVotos <- cantVotos + 1 ;
		FinSi
	Fin Para
	return <- ConvertirATexto((cantVotos/p)*100);
FinFuncion

SubProceso buscarVotoPoridBoleta(votos,n,m)
	Definir i Como Entero;
	Definir idBoleta Como Caracter;
	i<-0;
	
	Escribir "Ingresar el id de la boleta a buscar";
	Leer idBoleta;
	
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si votos[i,0] == idBoleta Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		FinSi
		i <- i +1; 
	FinMientras
	
	Si elementoEncontrado Entonces
		Escribir votos[i,0], "     ", votos[i,1], "      ", votos[i,2];
	SiNo
		Escribir "No se encontro el elemento";
	FinSi
FinSubProceso

SubProceso verVotosPorNumeroListaDesc(votos,n,m)
	Escribir "Votos ordenados por lista";
	ordernarArregloDESC(votos,n,m,1);
	mostrarArray(votos,n,m);
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