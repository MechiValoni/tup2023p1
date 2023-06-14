Algoritmo Unidad4EjercicioIntegrador1
	//DEFINO VARIABLES
	Definir productosDescripcion, ventasDiarias Como Caracter;
	Definir productosPrecio, descuentos Como Real;
	Definir finPrograma Como Logico;
	Definir opcionMenu, cantidadVentasDiarias Como Entero;
	//DIMENSIONO LOS ARRAY
	Dimension descuentos[3];
	Dimension productosDescripcion[4,2], productosPrecio[4,2];
	Dimension ventasDiarias[15,5];
	//INICIALIZO VARIABLES
	finPrograma <- Falso;
	cantidadVentasDiarias<-0;
	//INICIALIZO LOS ARRAY CON DATOS PRECARGADOS
	descuentos[0]<-0.15; //efectivo
	descuentos[1]<-0.10; //debito
	descuentos[2]<-0;	//credito
	
	productosDescripcion[0,0] <- "1";
	productosDescripcion[0,1] <- "Mantel 2x2";
	productosDescripcion[1,0] <- "2";
	productosDescripcion[1,1] <- "plato playo 24 cm";
	productosDescripcion[2,0] <- "3";
	productosDescripcion[2,1] <- "Copa Vino";
	productosDescripcion[3,0] <- "4";
	productosDescripcion[3,1] <- "Plato hondo 22 cm";
	
	productosPrecio[0,0] <- 1;
	productosPrecio[0,1] <- 3500.00;
	productosPrecio[1,0] <- 2;
	productosPrecio[1,1] <- 800.99;
	productosPrecio[2,0] <- 3;
	productosPrecio[2,1] <- 1450.50;
	productosPrecio[3,0] <- 4;
	productosPrecio[3,1] <- 650.50;

	
	listadoProductos(productosDescripcion, productosPrecio, 4); //MUESTRO EL LISTADO INICIAL DE LOS PRODCUTOS
	
	//BUCLE PARA EL MENU
	Repetir
		opcionMenu <- menu();
		Segun opcionMenu Hacer
			1:
				registrarVenta(ventasDiarias,15,5,productosDescripcion,productosPrecio,4,2,descuentos,3,cantidadVentasDiarias);
			2:
				listarProductosPorDescripcion(productosDescripcion,4,2);
			3:
				si cantidadVentasDiarias > 0 Entonces
					verResumenDiario(ventasDiarias,cantidadVentasDiarias,5);
				SiNo
					Escribir "Debe registrar al menos una venta para ver el resumen";
				FinSi

		Fin Segun
	Hasta Que opcionMenu == 4
	
	Escribir "SALUDOS"; //MENSAJE DE DESPEDIDA
	
FinAlgoritmo

//RETORNA UNA OPCION DE MENU VÁLIDA PARA EL PROGRAMA
Funcion return<-menu()
	Definir opt_menu Como Entero;
	Repetir
		Escribir "Elija una opcion correcta: ";
		Escribir "1. Registrar Venta";
		Escribir "2. Ver listado de productos ordenados por descripción (sólo descripción y código)";
		Escribir "3. Ver resumen del día (debe tener al menos una venta generada)";
		Escribir "4. Salir";
		Leer opt_menu;
	Mientras Que (opt_menu<1 o opt_menu>4)
	return <- opt_menu;
FinFuncion

//MUESTRA EL LISTADO DE CODIGOPROD-PRECIOPROD-DESCRIPCIONPROD
SubProceso listadoProductos(productosDescripcion, productosPrecio, n)
	Escribir "Listado de productos: "
	Escribir "COD - PRECIO - DESCRIPCION ";
	Para i<-0 Hasta n-1 Hacer
		Escribir productosDescripcion[i,0], "    ", productosPrecio[i,1], "    ",productosDescripcion[i,1]
	Fin Para
	Escribir "-----------------------------------";
FinSubProceso

//REGISTRA UNA VENTA EN EL ARRAY VENTASDIARIAS
SubProceso registrarVenta(ventasDiarias,n,m,productosDescripcion,productosPrecio,p,t,descuentos,r,indiceVenta Por Referencia)
	Definir codProducto, cantidad, medioPago Como Entero;
	Definir dniCliente Como Caracter;
	
	Repetir
		Escribir "Ingrese el dni del cliente";
		Leer dniCliente;
	Mientras Que Longitud(dniCliente)<6 o Longitud(dniCliente)>8
	
	listadoProductos(productosDescripcion, productosPrecio,p);
	
	Repetir
		Escribir "Ingrese el codigo del producto";
		Leer codProducto;
	Mientras Que codProducto<1 o codProducto>4
	
	Escribir "Ingrese la cantidad pedida";
	Leer cantidad;
	
	Repetir
		Escribir "Ingrese el medio de pago 0-Efectivo, 1-Debito, 2-Credito"
		Leer medioPago;
	Mientras Que medioPago<0 o medioPago>2
	
	precioProducto <- buscarPrecioProducto(productosPrecio,p,codProducto); //Recupero el precio del producto con el codigo que ingreso el usuario
	
	ventasDiarias[indiceVenta,0]<-dniCliente;
	ventasDiarias[indiceVenta,1]<-ConvertirATexto(descuentos[medioPago]*100);
	ventasDiarias[indiceVenta,2]<-ConvertirATexto(codProducto);
	ventasDiarias[indiceVenta,3]<-ConvertirATexto(cantidad);
	ventasDiarias[indiceVenta,4]<-ConvertirATexto(cantidad*precioProducto*(1-descuentos[medioPago])*1.21); //CALCULO EL MONTO FINAL
	
	indiceVenta<-indiceVenta+1;
	Limpiar Pantalla;
	Escribir "LA VENTA SE A REGISTRADO EXITOSAMENTE!";
	Escribir "-----------------------------------";
FinSubProceso

//DEVUELVE EL PRECIO DE UN PRODUCTO BUSCADO POR EL CODIGO
Funcion return<- buscarPrecioProducto(productosPrecio,n,codProducto)
	Definir i Como Entero;
	Definir precioProducto Como Real;
	precioProducto <- 0;
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si productosPrecio[i,0] == codProducto Entonces
			elementoEncontrado <- Verdadero; //fuerzo la salida del bucle
			precioProducto <- productosPrecio[i,1]
		FinSi
		i <- i +1; 
	FinMientras
	return	<- precioProducto;
FinFuncion

//MUESTRA EL LISTADO DE PRODUCTOS ORDERNADOS POR DESCRIPCION ASC
SubProceso listarProductosPorDescripcion(productosDescripcion,n,m)
	Limpiar Pantalla
	Escribir "Listado de productos ordenados por descripcion: "
	Escribir "COD - DESCRIPCION ";
	ordernarArregloASC(productosDescripcion,n,m,1); //ORDENO DEL ARRAY ANTES DE MOSTRARLO
	mostrarArray(productosDescripcion,n,m);
	ordernarArregloASC(productosDescripcion,n,m,0); //ORDENO EL ARRAY LUEGO DE MOSTRARLO, PARA DERJALO EN SU ESTADO ORIGINAL
	Escribir "-----------------------------------";	
FinSubProceso

//MUESTRA EL RESUMEN DIARIO DE LAS VENTAS
SubProceso verResumenDiario(ventas,n,m)
	Limpiar Pantalla
	Escribir "Resumen diario: ";
	Escribir "  DNI  - % DESC - CODPROD -  CANT - $ TOTAL ";
	mostrarArray(ventas,n,m);
	Escribir "-----------------------------------";
FinSubProceso

//MUESTRA UN ARRAY BIDIMENCIONAL
SubProceso mostrarArray(array,n,m)
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] "      ";
		Fin Para
		Escribir "";
	Fin Para
FinSubProceso

//ORDENAMIENTO ASCENDENTE => ORDENO TODO EL ARRAY POR UNA COLUMNA
SubProceso ordernarArregloASC(array,n,m,columnaAOrdenar)
	Definir aux Como Texto; //cambiar el tipo de dato según el tipo de datos del array
	para i<-0 hasta n-2 Hacer //recorro las filas del array hasta la penultima
		para k<-i+1 hasta n-1 Hacer //recorro las filas del array hasta la última
			si array[i,columnaAOrdenar]>array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta m-1 Hacer //recorro las columnas del array
					aux <- array[i,j];
					array[i,j] <- array[k,j]; 
					array[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso