<?php
include('libreria/motor.php');

//agregando las clases
//$cit= new cita();
//$art=new articulo();
$inv=new inventario();
		
		//Esto es del Encabezado de la tabla Traslado inventario Articulo
		$tabla='traslado_inv_articulo'; //Pasandole la tabla
		$id_movimiento= $inv->secqnos($tabla); //id_cotizacion
		$cantidad= $inv->cantidad_detalle($id_movimiento); //Cuantos Articulos van para traslado
		$fecha_creacion=date("Y-m-d H:i:s"); //Fecha de Creacion
		$id_tipo_movimiento=$_POST['id_tipo_movimiento'];
		$factura_referencia=$_POST['factura']; //resumen
		
		
	/************************************************************/
	
	/********************Llenando el Objeto************************************/
	
	//clase inventario
	
		$inv->id_movimiento=$id_movimiento;
		$inv->cantidad=$cantidad;
		$inv->fecha_crea=$fecha_creacion;
		$inv->id_tipo_movimiento=$id_tipo_movimiento;
		$inv->factura_referencia=$factura_referencia;
		
	/*****************************************************************************/
	
	/*************************Ejecuto el Metodo********************************************/
		$rec=$inv->agregar_encabezado();
		if ($rec==true || $rec==1){
				$inv->Upsecqnos($tabla);
				$res="Se ingreso correctamente";
				}
			else{
				$res="Hubo un error";
				
			}	
		echo $res;
	/********************************************************************************/
	

				
 ?>