Proceso sin_titulo
	Definir  numerosEnteros Como Entero
	Definir cantidadElementos, mayorNumero Como Entero
	mayorNumero <- 0 
	Leer cantidadElementos
	Dimension numerosEnteros[cantidadElementos]
	
	//Cargar array
	Para i<-0 Hasta cantidadElementos-1 Hacer
		Escribir "Restan ingresar " cantidadElementos - i " Numeros"
		//Valido que el numero entero ingresado sea >0
		Repetir
			Escribir "Ingresar un numero entero mayor a 0"
			Leer numerosEnteros[i]
		Hasta Que numerosEnteros[i] > 0
	Fin Para
	
	//Recorro el array para encontrar el mayor numero de tdos
	Para i<-0 Hasta cantidadElementos-1 Hacer
		Si numerosEnteros[i] > mayorNumero Entonces
			mayorNumero <- numerosEnteros[i]
		Fin Si
	Fin Para
	
	Limpiar Pantalla
	
	//Muestro el mayor numero ingresado
	Escribir mayorNumero
	
FinProceso
