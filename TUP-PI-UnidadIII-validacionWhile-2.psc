Proceso While
	//Validar que el numero sea un valo entre 0 y 10 (inclusive)
	Definir notaExamen Como Real
	
	Escribir "Ingrese la nota del Examen"
	Leer notaExamen
	
	Mientras notaExamen < 0 o notaExamen > 10 Hacer
		Escribir "Ingrese la nota del examen, sólo se admite valores del 0 al 10"
		Leer notaExamen
	Fin Mientras
	
	Escribir "La nota ingresada correctamente es: " notaExamen
FinProceso
