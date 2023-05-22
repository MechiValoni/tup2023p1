Proceso sin_titulo
	//El array materiasTUP contiene todas las materias de la carrera
	//En las filas (N) tengo los cuatrimestres y en las columnas las materias (M)
	//La cantidad de elementos es N * M 
	//Rango para las filas (0..N-1)
	//Rango para las columnas (0..M-1)
	Definir materiasTUP Como Cadena;
	Definir cantidadMaterias, cantidadCuatrimestres Como Entero;
	cantidadMaterias <- 3;
	cantidadCuatrimestres <- 2;
	Dimension materiasTUP[cantidadCuatrimestres,cantidadMaterias];
	
	//Cargo el array columna a columna de cada fila
	Para cuatrimestre<-0 Hasta (cantidadCuatrimestres - 1) Hacer
		Para materia<-0 Hasta (cantidadMaterias - 1 ) Hacer
			Escribir "ingrese la materia " materia+1 " del cuatrimestre " cuatrimestre+1
			Leer materiasTUP[cuatrimestre,materia];
		Fin Para
	Fin Para
	
	//Recorro el array columna a columna de cada fila
	Para cuatrimestre<-0 Hasta (cantidadCuatrimestres - 1) Hacer
		Escribir "La materias del cuatrimestre " cuatrimestre+1 " son : "
		Para materia<-0 Hasta (cantidadMaterias - 1 ) Hacer
			Escribir "La materia " materia+1 " es: " materiasTUP[cuatrimestre,materia];
		Fin Para
	Fin Para
	
	//Recorro el array por fila a fila de cada columna
	Para materia<-0 Hasta (cantidadMaterias - 1 ) Hacer
		Escribir "La materia " materia+1 " para cada cuatrimestre es: "
		Para cuatrimestre<-0 Hasta (cantidadCuatrimestres - 1) Hacer
			Escribir "Del cuatrimestre " cuatrimestre+1 " es: " materiasTUP[cuatrimestre,materia];
		Fin Para
	Fin Para
	
FinProceso
