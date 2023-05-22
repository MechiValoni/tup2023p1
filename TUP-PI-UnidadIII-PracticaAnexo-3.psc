Proceso buclesAnidados
	//UNIDAD 3 ANEXO PRACTICA EJERCICIO 3
	//SE CALCULARA EL ALUMNO CON EL MEJOR PROMEDIO DE UNA COMISION DE 30 ALUMNOS
	//(si dos alumnos tienen igual promedio se considerará "mejor promedio" al primero ingresado).
	
	//Definiciones
	Definir notaAlumno, promedioAlumno, mayorPromedioAlumnos Como Real
	Definir nombreAlumno, nombreAlumnoMayorPromedio Como Texto
	Definir cantidadAlumnos, cantidadParciales Como Entero
	cantidadAlumnos <- 3
	cantidadParciales <- 3
	mayorPromedioAlumnos <- 0 //Inicializo la variable en 0 
	
	Escribir "Bienvenidos, se calculara el mejor promedio de la comisión"
	
	//Bucle para iterar los alumnos
	Para i<-1 Hasta cantidadAlumnos Hacer
		promedioAlumno <- 0 //Inicializo la variable en 0 para cada alumno al comienzo del bucle
		Escribir "Ingrese el nombre del alumno: " i
		Leer nombreAlumno
		//Bucle para iterar los parciales
		Para j<-1 Hasta cantidadParciales Hacer
			Escribir "Ingrese la nota del parcial: " j
			Leer notaAlumno
			promedioAlumno <- promedioAlumno + notaAlumno //Acumulo las notas para posteriormente sacar el promedio
		Fin Para
		promedioAlumno <- promedioAlumno / cantidadParciales //calculo el promedio para el alumno
		//Comparo par ver si es el mejor promedio de la comision
		Si promedioAlumno>mayorPromedioAlumnos Entonces
			mayorPromedioAlumnos <- promedioAlumno //Asigno el promedio del alumno
			nombreAlumnoMayorPromedio <- nombreAlumno //Asigno el nombre del alumno
		Fin Si
		Escribir "El alumno " nombreAlumno " tiene un promedio de: " promedioAlumno
	Fin Para
	Escribir "El alumno con el mejor promedio es: " nombreAlumnoMayorPromedio " y su promedio es: " mayorPromedioAlumnos
FinProceso