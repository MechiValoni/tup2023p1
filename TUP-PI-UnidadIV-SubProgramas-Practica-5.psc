Algoritmo ejercicio5
	
	Definir nombres_alumnos Como Caracter;
	Definir notas_alumnos Como Real;
	Definir cantidadAlumnos Como Entero;
	cantidadAlumnos <- 4;
	
	Dimension nombres_alumnos[cantidadAlumnos], notas_alumnos[cantidadAlumnos];
	
	cargarAlumnos(nombres_alumnos,notas_alumnos,cantidadAlumnos);
	
	Escribir "El promedio es: " promedioNotas(notas_alumnos,cantidadAlumnos);
	Escribir "La mayor nota es: " mayorNota(notas_alumnos,cantidadAlumnos);
	Escribir "La menor nota es: " menorNota(notas_alumnos,cantidadAlumnos);
	
FinAlgoritmo

SubProceso cargarAlumnos(arrayNombres Por Referencia, arrayNotas Por Referencia, n Por Valor)
	Para i<-0 Hasta n-1 Hacer
		Escribir "Ingere el nombre del alumno";
		Leer arrayNombres[i];
		
		Repetir
			Escribir "Ingrese la nota del alumno";
			Leer arrayNotas[i];
		Mientras Que no esNotaValida(arrayNotas[i])
		
	Fin Para
FinSubProceso

Funcion return<- promedioNotas(array Por Referencia, n Por Valor)
	Definir sumaTotalNotas Como Real;
	sumaTotalNotas <- 0;
	Para i<-0 Hasta n-1 Hacer
		sumaTotalNotas <- sumaTotalNotas + array[i];
	Fin Para
	return <- sumaTotalNotas/n;
FinFuncion

Funcion return<- mayorNota(array,n)
	Definir mejorNota Como Real;
	mejorNota <- array[0];
	Para i<-1 Hasta n-1 Hacer
		si array[i] > mejorNota Entonces
			mejorNota <- array[i];
		FinSi
	Fin Para
	return <- mejorNota;
FinFuncion

Funcion return<- menorNota(array,n)
	Definir peorNota Como Real;
	peorNota <- array[0];
	Para i<-1 Hasta n-1 Hacer
		si array[i] < peorNota Entonces
			peorNota <- array[i];
		FinSi
	Fin Para
	return <- peorNota;
FinFuncion

Funcion return<- esNotaValida(nota Por Valor)
	si nota<0 o nota>10
		return <- falso;
	SiNo
		return <- Verdadero;
	FinSi
FinFuncion
	