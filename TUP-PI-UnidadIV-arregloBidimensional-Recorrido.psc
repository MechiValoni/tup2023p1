Proceso ejemploArregloBidimensional
	//Utilizar indices en arreglos y cadenas en base 0 (activado).
	//Cantidad de Hombes y Mujeres en cada comisión de Programación I
	Definir alumnosComisionSexo Como Entero
	Dimension alumnosComisionSexo[5,2]; 
	
	Para i<-0 Hasta 4 Hacer
		Escribir Sin Saltar "Ingrese el la cantidad de Hombres para la comisión 1TUP", i+1 " :" 
		Leer alumnosComisionSexo[i,0];
	Fin Para
	
	Limpiar Pantalla
	
	Para i<-0 Hasta 4 Hacer
		Escribir Sin Saltar "Ingrese el la cantidad de Mujeres para la comisión 1TUP", i+1 " :"
		Leer alumnosComisionSexo[i,1];
	Fin Para
	
	Limpiar Pantalla
	
	Para i<-0 Hasta 4 Hacer
		Escribir "Cantidad de hombres y mujeres para la comisión 1TUP", i+1 " :"
		Para j<-0 Hasta 1 Hacer
			Escribir alumnosComisionSexo[i,j];
		Fin Para
	Fin Para
	
FinProceso