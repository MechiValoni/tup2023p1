Proceso sin_titulo
	Definir numerosEnteros Como Entero
	Dimension numerosEnteros[5]
	//(0..4)
	Definir sumaNumeros Como Entero
	sumaNumeros <- 0 //inicializo acumulador
	
	//Cargar array
	Para i<-0 Hasta 4 Hacer
		Escribir Sin Saltar "Ingrese un numero entero: "
		Leer numerosEnteros[i]
	Fin Para
	
	Limpiar Pantalla
	
	//Recorro el array para sumar los numeros
	Para i<-0 Hasta 4 Hacer
		sumaNumeros <- sumaNumeros + numerosEnteros[i]
	Fin Para
	
	Escribir sumaNumeros
	
FinProceso
