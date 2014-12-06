<?php
include('libreria/conf.php');
 include("libreria/conexion.php") ;
 include("clases/articulo.class.php");
 $art=new articulo();
try
{

if($_POST["accion"] == "crear")
{
	//crear el metodo de extraer numero de recibo
	$tabla1='recibo';
	$tabla2='orden_trabajo';
	$id_recibo= $art->secqnos($tabla1);
	$id_orden= $art->secqnos($tabla2);
  $query="INSERT INTO RECIBO(id_recibo,fecha_creacion,fecha_recibo,id_cotizacion,monto,descripcion)
                                        VALUES (
                                        $id_recibo,
                                        now(),
                                        '".$_POST['fecha_recibo']."',
										'".$_POST['id_cotizacion']."',
                                        '".$_POST['monto']."',
										'".$_POST['descripcion']."')"	;
     $result=mysql_query($query) or die ("Problema al guardar Registro");
	 
	 
	 insertar_orden_trabajo
	 $art->id_orden=$id_orden;
	 $art->fecha_orden=$fecha_orden;
	 $art->id_trabajo_tipo=1;
	 $art->materiales_adicionales=1;
	 $art->observaciones=$_POST['descripcion'];
	 $art->fecha_creacion=$_POST['fecha_creacion'];
	 $art->id_trabajo_estado=1;
	 $art->id_tipo_documento=1;
	 $art->id_cotizacion=$_POST['id_cotizacion'];
	 $art->id_cliente=$cliente;
	 $art->id_empleado=$id_empleado;
     
                                        '{$this->id_trabajo_tipo}',
										'{$this->materiales_adicionales}',
										'{$this->observaciones}',
										'{$this->fecha_creacion}',
										'{$this->id_trabajo_estado}',
										'{$this->id_tipo_cortina}',
										'{$this->id_tipo_documento}',
										'{$this->id_cotizacion}',
										'{$this->id_cliente}',
										'{$this->id_empleado}')";
	 $query2="INSERT INTO orden_trabajo(id_recibo,fecha_creacion,fecha_recibo,id_cotizacion,monto,descripcion)
                                       VALUES (
                                       $id_recibo,
                                       now(),
                                       '".$_POST['fecha_recibo']."',
										'".$_POST['id_cotizacion']."',
                                       '".$_POST['monto']."',
										'".$_POST['descripcion']."')"	;
    $result2=mysql_query($query2) or die ("Problema al guardar Registro");
    
    if($result>0 && $result2>0)
    {
		$art->Upsecqnos($tabla2);
		$art->Upsecqnos($tabla1);
		//echo "Recibo Guardado Correctamente" ;
	 echo $id_recibo;
    }else
    {
      echo "Problemas al Guardar Recibo" ;
    }
}
}
catch(Exception $ex)
{
    //Return error message
	echo  $ex->getMessage();
}

?>