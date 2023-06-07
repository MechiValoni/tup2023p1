Algoritmo ejemploBusquedaBinaria
	
FinAlgoritmo

// muestra un mensaje si el elemento a buscar fue o no encontrado en el array
// EL ARRAY DEBE ESTAR ORDENADO
SubProceso busquedaBinaria(array, n, elementoABuscar)
	Definir i, indiceInferior, indiceSuperior, centro Como Entero;
	Definir elementoEncontrado Como Logico;
	elementoEncontrado <- Falso;
	//rango del array (0..n-1)
	indiceInferior<-0; //al comienzo el indice inferior es 0
	indiceSuperior<-n-1; //al comienzo el indice superior es n+1
	
	//POR EJEMPLO:
	//indice: 		0  1  2   3  4		5		6  7  8   9 10
	// elementos: 	11 23 30 35 39      5       40 50 58 90 101
	// 				array inferior - centro - array superior
	
	Mientras indiceInferior<=indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2); //busco el centro del array
		si array[centro] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		SiNo 
			Si array[centro] > elementoABuscar Entonces
				indiceSuperior <- centro -1; //modifico el indice superior, para buscar en el "array inferior"
			SiNo
				indiceInferior <- centro +1;  //modifico el indice inferior, para buscar en el "array superior" 
			FinSi
		FinSi
	FinMientras
	
	Si elementoEncontrado Entonces
		Escribir "Se encontro el elemento"; 
	SiNo
		Escribir "No se encontro el elemento";
	FinSi
FinSubProceso

// retorna verdadero si el elemento a buscar fue encontrado en el array
// EL ARRAY DEBE ESTAR ORDENADO
Funcion return<- busquedaSecuencial2(array, n, elementoABuscar)
	Definir i, indiceInferior, indiceSuperior, centro Como Entero;
	Definir elementoEncontrado Como Logico;
	elementoEncontrado <- Falso;
	//rango del array (0..n-1)
	indiceInferior<-0; //al comienzo el indice inferior es 0
	indiceSuperior<-n-1; //al comienzo el indice superior es n+1
	
	Mientras indiceInferior<=indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2); //busco el centro del array
		si array[centro] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
		SiNo 
			Si array[centro] > elementoABuscar Entonces
				indiceSuperior <- centro -1; //modifico el indice superior, para buscar en el "array inferior"
			SiNo
				indiceInferior <- centro +1;  //modifico el indice inferior, para buscar en el "array superior" 
			FinSi
		FinSi
	FinMientras
	return	<- elementoEncontrado;
FinFuncion