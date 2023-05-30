Algoritmo dadoLadosDefinirTriangulo
	Definir ladoUno, ladoDos, ladoTres como Entero
	Definir  ladosFormanTriangulo Como Logico
	
	Repetir
		Escribir "Ingrese los 3 lados de un triangulo"
		Leer ladoUno, ladoDos, ladoTres
		Si no esUnTriagulo(ladoUno, ladoDos, ladoTres) Entonces
			Escribir "Error, los lados ingresados no forman un triangulo"
		Fin Si
	Hasta Que esUnTriagulo(ladoUno, ladoDos, ladoTres)
	
	mostrarTipoTriangulo(ladoUno, ladoDos, ladoTres);
	
	Escribir "CHAU";
	
FinAlgoritmo

Funcion return<- esUnTriagulo(lado1 Por Valor, lado2 Por Valor, lado3 Por Valor)
	return <- ( ((lado1+lado2)>lado3) y ((lado3+lado2)>lado1) y ((lado1+lado3)>lado2) );
FinFuncion

subProceso mostrarTipoTriangulo(lado1 Por Valor, lado2 Por Valor, lado3 Por Valor)
	Si (lado1 = lado2) y (lado2 = lado3) Entonces
        Escribir "El triangulo es equilatero"
    Sino
        Si (lado1 = lado2) o (lado1 = lado3) o (lado2 = lado3) Entonces
            Escribir "El triangulo es isosceles"
        Sino
            Escribir "El triangulo es escaleno"
        Fin Si
    Fin Si
FinSubProceso
	


