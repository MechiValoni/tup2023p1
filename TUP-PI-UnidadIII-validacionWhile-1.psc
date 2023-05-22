Proceso While
	//Validar que el numero sea un valo entre 0 y 10 (inclusive)
	Definir notaExamen Como Real
	Definir esNotaValida Como Logico
	esNotaValida <- Falso
	
	Mientras no esNotaValida Hacer
		Escribir "Ingrese la nota del Examen, sólo se admite valores del 0 al 10"
		Leer notaExamen
		si notaExamen >= 0 y notaExamen <= 10 Entonces
			esNotaValida <- Verdadero
		SiNo
			Escribir "Error, el valor ingresado no es valido"
		FinSi
	Fin Mientras
	
	Escribir "La nota ingresada correctamente es: " notaExamen
FinProceso
