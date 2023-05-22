Proceso preguntarSeguir
	Definir imprimirMensaje Como Logico
	Definir  mensaje Como Texto
	mensaje <- "Esto es un mensaje"
	imprimirMensaje <- Verdadero
	
	//Se ejecutara el bucle hasta que el usuario lo desee
	Mientras imprimirMensaje Hacer
		Escribir mensaje
		Escribir "Desea seguir imprimiendo el mensaje, Ingrese: V / F"
		Leer imprimirMensaje
	Fin Mientras
	
	Escribir "Hasta luego"
FinProceso
