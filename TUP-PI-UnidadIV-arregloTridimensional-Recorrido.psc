Proceso ejemploArregloTridimensional
	//Utilizar indices en arreglos y cadenas en base 0 (activado).
	//Estado Inicial cubo rubik
	Definir cuboRubik Como Caracter
	Definir tamanioCuboRubik Como Entero
	tamanioCuboRubik <- 4
	Dimension cuboRubik[tamanioCuboRubik,tamanioCuboRubik,tamanioCuboRubik];
	//Es similar a hacer Dimension cuboRubik[4,4,4];
	
	Escribir "Ingrese el estado inicial del cubo rubik"
	Para i<-0 Hasta 3 Hacer
		Para j<-0 Hasta 3 Hacer
			Para k<-0 Hasta 3 Hacer
				Escribir "Ingrese el color de la fila " i " columna " j " pagina " k
				Leer cuboRubik[i,j,k]
			Fin Para
		Fin Para
	Fin Para
	
FinProceso