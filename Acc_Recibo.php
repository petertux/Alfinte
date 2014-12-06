<?php
include('libreria/conf.php');
 include("libreria/conexion.php") ;
 $art=new articulo();
try
{

if($_POST["accion"] == "crear")
{
	//crear el metodo de extraer numero de recibo
	$tabla1='recibo';
	$tabla2='orden_trabajo';
	$id_recibo= $art->secqnos($tabla1);
  $query="INSERT INTO RECIBO(id_recibo,fecha_creacion,fecha_recibo,id_cotizacion,monto,descripcion)
                                        VALUES (
                                        $id_recibo,
                                        now(),
                                        '".$_POST['fecha_recibo']."',
										'".$_POST['id_cotizacion']."',
                                        '".$_POST['monto']."',
										'".$_POST['descripcion']."')"	;
     $result=mysql_query($query) or die ("Problema al guardar Registro");
	 
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