<?php
include('libreria/motor.php');

//agregando las clases
$cit= new cita();
$art=new articulo();



//aqui iria el encabezado
	/*
	$nombre=$_POST['nombre'];
	$apellido=$_POST['apellido'];
	$direccion=$_POST['direccion'];
	$coment=$_POST['coment'];
	$telefono=$_POST['telefono'];
	$nit='00000000001';
	*/

		/*
	$id_cliente = $cit->secqnos_cliente();
	
	$cit->id_cliente=$id_cliente;
	$cit->nombre=$nombre;
	$cit->apellido=$apellido;
	$cit->direccion=$direccion;
	$cit->telefono=$telefono;
	$cit->nit=$nit;
	*/
	//$re=$cit->agregar_cliente();
	
	/*
if ($re==true || $re==1){
		$cit->Upsecqnos_cliente();
			$res="Se ingreso correctamente";
			echo $res;
		}
		else{
			$res="Hubo un error";
			echo $res;
		}				
				
*/
	/*********************Cita******************************************/
	$id_estado=4; //estado de cita cotizada por ejemplo. puede ser otro estado
	$id_cita=$_POST['id_cita'];
	
	/******************************************************************/
	
	/**********************Cotizacion**************************/
		/*
		Prueba de encabezado de cotizacion, mas o menos asi deberian de ser los parametros
		que deben caer.
		
		$id_cotizacion= $art->secqnos($tabla); //id_cotizacion
		$resumen='Suministro e instalacion de cortinas verticales en tela color a elegir, a se instaladas
		 en proyecto Metropoli San Gabriel Sur'; //resumen
		$fecha_creacion=date("Y-m-d H:i:s"); //Fecha de Creacion
		$dia_validez=30; //Dia validez
		$tiempo_entrega=8; //Tiempo de entrega
		$porcentaje_an=50; //Porcentaje de Anticipo
		$porcentaje_des=5; //Porcentaje Descuento
		$id_cotizacion_estado=1; //Cotizacion 1, es activa o iniciada depende del estado
		$id_cita=1;
		*/
	/************************************************/
		
		
		$tabla='cotizacion';
		$id_cotizacion= $art->secqnos($tabla); //id_cotizacion
		$resumen=$_POST['comment2']; //resumen
		$fecha_creacion=date("Y-m-d H:i:s"); //Fecha de Creacion
		$dia_validez=$_POST['diaval']; //Dia validez
		$tiempo_entrega=$_POST['timeen']; //Tiempo de entrega
		$porcentaje_an=$_POST['porcentaje_an']; //Porcentaje de Anticipo
		$porcentaje_des=$_POST['porcentaje_des']; //Porcentaje Descuento
		$id_cotizacion_estado=1; //Cotizacion 1, es activa o iniciada depende del estado
		
		
		
		//Calcular los Descuentos y Totales
		
		$porcentaje_des1=$porcentaje_des/100;
		$porcentaje_an1=$porcentaje_an/100;
		
		//Trae Sub Total
		$sub_total=$art->total_cotizacion($id_cotizacion);
		
		//Calcula el Monto de Descuento
		$monto_descuento=$sub_total * $porcentaje_des1;
		
		//Calcula el Total
		$total=$sub_total - $monto_descuento;
	
	/************************************************************/
	
	/********************Llenando el Objeto************************************/
		$art->id_cotizacion=$id_cotizacion;
		$art->resumen=$resumen;
		$art->fecha_creacion=$fecha_creacion;
		$art->monto_descuento=$monto_descuento;
		$art->total=$total;
		$art->sub_total=$sub_total;
		$art->porcentaje_anticipo=$porcentaje_an;
		$art->dia_validez=$dia_validez;
		$art->porcentaje_descuento=$porcentaje_des;
		$art->id_tiempo_entrega=$tiempo_entrega;
		$art->id_cotizacion_estado=$id_cotizacion_estado;
		$art->id_cita=$id_cita;
	/*****************************************************************************/
	
	/*************************Ejecuto el Metodo********************************************/
		$rec=$art->cotizacion();
		if ($rec==true || $rec==1){
			$art->Upsecqnos($tabla);
				//echo $res;
				//Se tiene que actualizar la cita que ya tiene cotizacion y detalle
				$cit->actualizar_cita_cotizacion($id_cita,$id_estado);
				$res="Se ingreso correctamente";
				}
			else{
				$res="Hubo un error";
				echo $res;
			}	
	
	/********************************************************************************/
	

				
 ?>