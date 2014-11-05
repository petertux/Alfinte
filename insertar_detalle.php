<?php
include('libreria/motor.php');

//agregando las clases
$art=new articulo();
	
	//$volumen = $_POST['volumen'];
	//$area =$_POST['area'];
	
	//$total =$_POST['total'];


	//Viene el ID del Articulo
	$id_articulo = $_POST['id_articulo'];
	
	//Viene la Cantidad de lo solicitado
	$cantidad = $_POST['cantidad'];
	
	//Viene el Precio del Articulo
	$precio = $_POST['precio'];
	
	//**************Para Sacar el Area*******/
	$ancho = $_POST['ancho'];
	$largo = $_POST['largo'];
	$alto=$_POST['alto'];
	//***************************************/

	/*************************** Area y Volumen*********************************/
		$area= $ancho * $largo;
		$volumen= $ancho * $largo * $alto;
	/*************************************************************************/
	
	/********** el Total***********/
		$total= $cantidad * $precio;
	/******************************/
	
	
	/********** Extrar la Cotizacion***********/
	$tabla1='cotizacion';
	$id_cotizacion= $art->secqnos($tabla1);
	/******************************************/
	
		
	
	/********** Extrar la Cotizacion Detalle***********/
	$tabla='cotizacion_detalle';
	$id_cotizacion_detalle= $art->secqnos($tabla);
	/******************************************/
	
	/************Llenando el Objeto*************************************/
	$art->id_articulo=$id_articulo;
	$art->cantidad=$cantidad;
	$art->largo=$largo;
	$art->volumen=$volumen;
	$art->area=$area;
	$art->ancho=$ancho;
	$art->precio=$precio;
	$art->total=$total;
	$art->alto=$alto;
	$art->id_cotizacion=$id_cotizacion;
	$art->id_coti_detalle=$id_cotizacion_detalle;
	/*************************************************/
		
	/************Ejecuta el Insert a la Cotizacion Detalle****************/	
	$rec=$art->cotizacion_detalle();
	if ($rec==true || $rec==1){
		$art->Upsecqnos($tabla);
			$res="Se ingreso correctamente";
			echo $res;
		}
		else{
			$res="Hubo un error";
			echo $res;
		}	
	/*************************************************/
//	$art->Upsecqnos($tabla);

				
 ?>