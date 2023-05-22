Proceso sin_titulo
	//Realice un algoritmo que lea en un arreglo las marcas obtenidas por n corredores en una carrera e imprimir cuántos tienen una
	//marca mayor, cuántos tienen una marca menor que el promedio y el promedio
	// promedio -> acumulador     40.5
	// contador para mayor y igual sobre promedio (Peores corredores)
	// contador para menor bajo promedio (Mejores corredores)
	
	Definir marcasCorredores, promedioMarcas Como Real
	Definir cantidasCorredores, cantMejoresCoredores, cantPeoresCoredores Como Entero
	Escribir Sin Saltar "Ingrese la catidad de corredores: "
	Leer cantidasCorredores
	Dimension marcasCorredores[cantidasCorredores]
	//Rango (0..cantidasCorredores-1)
	
	promedioMarcas <- 0
	cantMejoresCoredores <- 0
	cantPeoresCoredores <- 0
	
	//Carga array
	Para  i<-0 Hasta cantidasCorredores -1 Hacer
		Escribir Sin Saltar "Ingrese la marca del corredor " i ": "
		Leer marcasCorredores[i]
	FinPara
	
	//Caluclo el promedio
	//(0 .. n-1)
	Para  i<-0 Hasta cantidasCorredores -1 Hacer
		promedioMarcas <- promedioMarcas + marcasCorredores[i]
	FinPara
	promedioMarcas <- promedioMarcas/cantidasCorredores //calculo promedio
	
	//Recorro y cuento los peores y mejores corredores
	//(n-1 .. 0)
	Para  i<-cantidasCorredores -1 Hasta 0 Con Paso -1 Hacer
		Si marcasCorredores[i] >= promedioMarcas
			cantPeoresCoredores <- cantPeoresCoredores + 1
		SiNo
			cantMejoresCoredores <- cantMejoresCoredores + 1
		FinSi
	FinPara
	
	Escribir cantMejoresCoredores " " cantPeoresCoredores " " promedioMarcas

FinProceso
