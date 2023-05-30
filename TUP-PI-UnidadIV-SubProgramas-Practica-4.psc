Algoritmo ejercicio4
	//Realizar un programa que permita cargar los datos de un cliente, Nombre, apellido, DNI. La
	//carga del DNI debe validarse a partir de una función llamada esDniValido, dicha función
	//recibirá como parámetro de entrada el dni ingresado y devolverá una variable del tipo lógica
	//Verdadero/Falso. Nota: El DNI debe estar formado por números y tener una longitud máxima
	//de 8 caracteres y una longitud mínima de 6 caracteres
	
	Definir nombreCliente, apellidoCliente, dniCliente Como Caracter;
	
	Escribir "Ingrese el nombre del cliente";
	Leer nombreCliente;
	
	Escribir "Ingrese el apellido del cliente";
	Leer apellidoCliente;
	
	Repetir
		Escribir "Ingrese el dni del cliente";
		Leer dniCliente;
	Mientras Que no esDniValido(dniCliente)
	
FinAlgoritmo

Funcion return<- esDniValido(dni Por Valor)
	Definir respuesta Como Logico;
	Definir caracterDni Como Caracter;
	respuesta <- Verdadero;

	si (Longitud(dni)<6 o Longitud(dni)>8) Entonces
		respuesta <- falso;
	SiNo
		Para i<-0 Hasta Longitud(dni)-1 Hacer
			caracterDni <- SubCadena(dni,i,i);
			si caracterDni<>"0" y caracterDni<>"1" y caracterDni<>"2" y caracterDni<>"3" y caracterDni<>"4" y caracterDni<>"5" y caracterDni<>"6" y caracterDni<>"7" y caracterDni<>"8" y caracterDni<>"9"
				respuesta <- falso;
			FinSi
		FinPara
	FinSi
	
	return <- respuesta;
FinFuncion


