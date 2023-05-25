Algoritmo dadoLadosDefinirTriangulo
	Definir lado1, lado2, lado3 como Real
	Definir  ladosFormanTriangulo Como Logico
	
	Repetir
		Escribir "Ingrese los 3 lados de un triangulo"
		Leer lado1, lado2, lado3
		ladosFormanTriangulo <- ((lado1+lado2)>lado3) y ((lado3+lado2)>lado1) y ((lado1+lado3)>lado2)
		Si no ladosFormanTriangulo Entonces
			Escribir "Error, los lados ingresados no forman un triangulo"
		Fin Si
	Hasta Que ladosFormanTriangulo
	
	Si (lado1 = lado2) y (lado2 = lado3) Entonces
        Escribir "El triangulo es equilatero"
    Sino
        Si (lado1 = lado2) o (lado1 = lado3) o (lado2 = lado3) Entonces
            Escribir "El triangulo es isosceles"
        Sino
            Escribir "El triangulo es escaleno"
        Fin Si
    Fin Si
	
FinAlgoritmo

