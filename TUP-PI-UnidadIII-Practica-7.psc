Proceso NuumeroMayorMenor
	Definir num, numMayor, numMenor, cantidadNumeros Como Entero;
	Definir primerNumero Como Logico;
	primerNumero <- Verdadero;
	numMayor <- 0;
	numMenor <- 0;
	
	Escribir Sin Saltar "Ingrese la cantidad de numeros: "
	Leer cantidadNumeros;
	Limpiar Pantalla
	
	//Bucle para iterar los numeros
	Para i<-1 Hasta cantidadNumeros Hacer
		Repetir
			Escribir Sin Saltar "Ingrese un numero Entero > o igual 0: "
			Leer num;
		Mientras Que num < 0
		Limpiar Pantalla
		
		Si primerNumero Entonces
			numMayor <- num;
			numMenor <- num;
		SiNo 
			Si num > numMayor
				numMayor <- num;
			FinSi
			Si num < numMenor
				numMenor <- num;
			FinSi	
		Fin Si
	Fin Para
	
	Escribir "El mayor numero es : " numMayor "y el menor es : " numMenor

FinProceso