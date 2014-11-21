<?php
include('libreria/motor.php');

//agregando las clases
$art=new articulo();
$art1=new articulo();
	
	//$volumen = $_POST['volumen'];
	//$area =$_POST['area'];
	
	//$total =$_POST['total'];


	//Viene el ID del Articulo
	$id_articulo = $_POST['id_articulo'];
	
	//Viene la Cantidad de lo solicitado
	$disponible = $_POST['disponible'];
	
	//Viene el Precio del Articulo
	$precio = $_POST['precio'];
	
	//Fecha desde
	$fecha_desde=$_POST['fecha_desde'];
	//Fecha hasta
	$fecha_hasta=$_POST['fecha_hasta'];
	/*
	//como actualizar esa bendita tabla
	$fecha_desde_antes='2014-11-01';
	$fecha_hasta_antes='2014-11-02';
	$id_articulo=2;*/
	
	$resp=$art1->actualizar_precio($id_articulo);
	
	/********** Extrar la Cotizacion Detalle***********/
	
	$tabla='articulo_pre';
	$id_art_pre= $art->secqnos($tabla);
	
	/******************************************/
	//echo $id_art_pre;
	/************Llenando el Objeto*************************************/
	
	$art->id_articulo=$id_articulo;
	$art->precio=$precio;
	$art->fecha_desde=$fecha_desde;
	$art->fecha_hasta=$fecha_hasta;
	$art->id_art_precio=$id_art_pre;
	
	/*************************************************/
		
	/************Ejecuta el Insert a la Cotizacion Detalle****************/	
	
	$rec=$art->agregar_precio();
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