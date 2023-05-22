Proceso doWhile
	//Validar que el numero sea un valo entre 0 y 10 (inclusive)
	Definir notaExamen Como Real
	
	Repetir
		Escribir "Ingrese la nota del examen, sólo se admite valores del 0 al 10"
		Leer notaExamen
	Hasta Que notaExamen >= 0 y notaExamen <= 10 
	
	Escribir "La nota ingresada correctamente es: " notaExamen
FinProceso
