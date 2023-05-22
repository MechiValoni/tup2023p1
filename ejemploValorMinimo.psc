Proceso ejemploValorMinimo
	Definir numeroNatural, numeroMinimo Como Entero
	Definir ingresarNumero, primeraIteracion Como Logico
	ingresarNumero <- Verdadero
	primeraIteracion <- Verdadero
	numeroMinimo <- 0
	
	//Se ejecutara el bucle hasta que el usuario lo desee
	Mientras ingresarNumero Hacer
		Escribir "Ingrese un numero natural"
		Leer numeroNatural
		
		Si numeroNatural < numeroMinimo o primeraIteracion Entonces
			numeroMinimo <- numeroNatural
		Fin Si
		
		Escribir "Desea ingresar otro numero, Ingrese: V / F"
		Leer ingresarNumero
		
		primeraIteracion <- Falso
		
	Fin Mientras
	
	Escribir "Hasta luego"
	Escribir "EL minimo es: " numeroMinimo
FinProceso
