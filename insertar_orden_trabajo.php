<?php
include('libreria/motor.php');

//agregando las clases
$cit= new cita();
$art=new articulo();


	/*********************Cita******************************************/
	$id_cita=$_POST['id_cita'];
	
	/******************************************************************/
	
		$tabla='orden_trabajo';
		$id_orden= $art->secqnos($tabla); //id_cotizacion
		$observacion=$_POST['observacion']; //resumen
		$materiales_adicionales=$_POST['materiales_adicionales']; //materiales_adicionales
		$id_trabajo_estado=$_POST['id_trabajo_estado']; //resumen
		$id_tipo_cortina=$_POST['id_tipo_cortina']; //resumen
		$id_tipo_documento=$_POST['id_tipo_documento']; //resumen
		$id_cliente=$_POST['id_cliente']; //resumen
		$id_empleado=$_POST['id_empleado']; //resumen
		$fecha_orden=date("Y-m-d H:i:s"); //Fecha de Creacion
		$fecha_creacion=date("Y-m-d H:i:s"); //Fecha de Creacion
		$id_cotizacion=$_POST['id_cotizacion'];
		
	
	/********************Llenando el Objeto************************************/
		$art->id_orden=$id_orden; //agregar a la clase 
		$art->observaciones=$observacion;
		$art->materiales_adicionales=$materiales_adicionales;
		$art->fecha_creacion=$fecha_creacion;
		$art->fecha_orden=$fecha_orden;
		$art->id_trabajo_estado=$id_trabajo_estado;
		$art->id_tipo_cortina=$id_tipo_cortina;
		$art->id_tipo_documento=$id_tipo_documento;
		$art->id_cliente=$id_cliente;
		$art->id_empleado=$id_empleado;
		$art->id_cotizacion=$id_cotizacion;
	/*****************************************************************************/
	
	/*************************Ejecuto el Metodo********************************************/
		$rec=$art->insertar_orden_trabajo();
		if ($rec==true || $rec==1){
			$art->Upsecqnos($tabla);
				//echo $res;
				//Se tiene que actualizar la cita que ya tiene cotizacion y detalle
				$id_estado=5; // En Orden de trabajo
				$cit->actualizar_cita_cotizacion($id_cita,$id_estado);
				
				$art->id_empleado=4;
				$art->descripcion="Se Ingreso una nueva orden";
				$art->estado='A';
				$art->fecha_creacion=date("Y-m-d H:i:s"); //Fecha de Creacion
				$resp1=$art->insertar_notificacion();
				if ($resp1==true || $resp1==1){
					mail("pedro822@hotmail.com", "Nueva Orden de Trabajo", "Se le ha creado una nueva orden de trabajo");
					}
				$res="Se ingreso correctamente";
				}
			else{
				$res="Hubo un error";
				echo $res;
			}	
	
	/********************************************************************************/
	

				
 ?>