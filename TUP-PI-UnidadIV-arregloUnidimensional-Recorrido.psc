Proceso ejemploArregloUnidimensional
	//Utilizar indices en arreglos y cadenas en base 0 (activado).
	Definir frutas Como Caracter
	Dimension furtas[5];
	
	Para i<-0 Hasta 4 Hacer
		Escribir "Ingrese un nombre de fruta: "
		Leer furtas[i];
		Escribir "Restan " (4 - i) " ingresos"
	Fin Para
	
	Limpiar Pantalla
	
	Escribir "Los datos ingresados en el array fueron"
	Para i<-0 Hasta 4 Hacer
		Escribir "Indice " i " : " furtas[i];
	Fin Para
	
FinProceso