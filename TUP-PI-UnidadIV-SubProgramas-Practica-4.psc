Algoritmo ejercicio4
	//Realizar un programa que permita cargar los datos de un cliente, Nombre, apellido, DNI. La
	//carga del DNI debe validarse a partir de una funci�n llamada esDniValido, dicha funci�n
	//recibir� como par�metro de entrada el dni ingresado y devolver� una variable del tipo l�gica
	//Verdadero/Falso. Nota: El DNI debe estar formado por n�meros y tener una longitud m�xima
	//de 8 caracteres y una longitud m�nima de 6 caracteres
	
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


