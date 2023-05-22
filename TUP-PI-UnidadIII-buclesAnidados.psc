Proceso buclesAnidados
	Definir cantidadHolaMundo Como Entero
	cantidadMaxPrimerBucle <- 3
	cantidadMaxSegundoBucle <- 2
	cantidadHolaMundo <- cantidadMaxPrimerBucle * cantidadMaxSegundoBucle
	
	Escribir "Se imprimiran " cantidadHolaMundo " la frase HOLA MUNDO"	
	
	Para i<-1 Hasta cantidadMaxPrimerBucle Hacer
		Para j<-1 Hasta cantidadMaxSegundoBucle Hacer 
			Escribir "HOLA MUNDO"
		Fin Para
	Fin Para
	
FinProceso