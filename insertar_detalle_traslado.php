<?php
include('libreria/motor.php');

//agregando las clases
$inv=new inventario();
	
	//$volumen = $_POST['volumen'];
	//$area =$_POST['area'];
	
	//$total =$_POST['total'];


	//Viene el ID del Articulo
	$id_articulo = $_POST['id_articulo'];
	
	//Viene la Cantidad de lo solicitado
	$cantidad = $_POST['cantidad'];
	
	//Viene el Precio del Articulo
	$precio = $_POST['precio'];
	
		
	/********** el Total***********/
		$total= $cantidad * $precio;
	/******************************/
	
	
	/********** Extraer El Movimiento***********/
	$tabla1='traslado_inv_articulo';
	$id_movimiento= $inv->secqnos($tabla1);
	/******************************************/
	
		
	
	/********** Extrar la Cotizacion Detalle***********/
	$tabla='traslado_detalle';
	$id_detalle= $inv->secqnos($tabla);
	/******************************************/
	
	/************Llenando el Objeto*************************************/
	$inv->id_detalle=$id_detalle;
	$inv->id_articulo=$id_articulo;
	$inv->cantidad=$cantidad;
	$inv->ubicacion_origen=$ubicacion_origen;
	$inv->ubicacion_destino=$ubicacion_destino;
	$inv->precio=$precio;
	$inv->total=$total;
	$inv->id_movimiento=$id_movimiento;
	
	/*************************************************/
		
	/************Ejecuta el Insert a la Cotizacion Detalle****************/	
	$rec=$inv->agregar_detalle();
	if ($rec==true || $rec==1){
		$inv->Upsecqnos($tabla);
			$res="Se ingreso correctamente";
		}
		else{
			$res="Hubo un error";
		}	
		echo $res;
	/*************************************************/
//	$art->Upsecqnos($tabla);

				
 ?>