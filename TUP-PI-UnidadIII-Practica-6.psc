Proceso promedioParcial
	definir cantAlumnos Como entero
	definir notaParcial, promedioParciales, sumaNotas Como real
	
	cantidadAlumnos<-20
	sumaNotas<-0
	
	Para i<-1 Hasta cantidadAlumnos Con Paso 1 Hacer
		Escribir "ingrese la nota del alumno " i " :"
		leer notaParcial
		sumaNotas<-sumaNotas+notaParcial
	Fin Para
	
	promedioParciales <- sumaNotas/cantAlumnos
	
	Escribir "El promedio de notas de los " cantidadAlumnos " alumnos es: " promedioParciales

FinProceso
