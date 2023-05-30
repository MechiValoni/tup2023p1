Algoritmo sin_titulo
	Definir numeroEntero1, numeroEntero2, resultado Como Entero
	
	//EN C
	// monstrarMensajeBienvenida();
	monstrarMensajeBienvenida();
	
	Escribir "Ingrese los 2 números enteros a sumar:..";
	Leer numeroEntero1, numeroEntero2;
	
	//EN C
	//int resultado = sumarNumeros(5, 3);
	resultado <- sumarNumeros(numeroEntero1, numeroEntero2);
	Escribir "El resultado de la suma es : " resultado;

FinAlgoritmo

Funcion return<- sumarNumeros(num1 Por Valor, num2 Por Valor)
	return<- num1 + num2;
FinFuncion
//EN C
//int sumarNumeros(int x, int y) {
//return x + y;
//}

SubProceso monstrarMensajeBienvenida()
	Escribir "Bienvenido!..";
FinSubProceso
//EN C
//void monstrarMensajeBienvenida() {
// printf("Bienvenido!...");
//}
 
	