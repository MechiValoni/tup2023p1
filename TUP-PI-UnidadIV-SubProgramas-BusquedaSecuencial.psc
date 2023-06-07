Algoritmo ejemploBusquedaSecuencial
	
FinAlgoritmo

// muestra un mensaje si el elemento a buscar fue o no encontrado en el array
SubProceso busquedaSecuencial(array, n, elementoABuscar)
	Definir i Como Entero;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si array[i] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		FinSi
		i <- i +1; 
	FinMientras
	
	Si elementoEncontrado Entonces
		Escribir "Se encontro el elemento"; 
	SiNo
		Escribir "No se encontro el elemento";
	FinSi
FinSubProceso

// retorna verdadero si el elemento a buscar fue encontrado en el array
Funcion return<- busquedaSecuencial2(array, n, elementoABuscar)
	Definir i Como Entero;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si array[i] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		FinSi
		i <- i +1; 
	FinMientras
	return	<- elementoEncontrado;
FinFuncion