<?php
include('libreria/conf.php');
 include("libreria/conexion.php") ;
try
{

if($_POST["accion"] == "crear")
{
  $query="INSERT INTO RECIBO(id_recibo,fecha_creacion,fecha_recibo,id_cotizacion,monto,descripcion)
                                        VALUES (
                                        '1',
                                        now(),
                                        '".$_POST['fecha_recibo']."',
										'".$_POST['id_cotizacion']."',
                                        '".$_POST['monto']."',
										'".$_POST['descripcion']."')"	;
     $result=mysql_query($query) or die ("Problema al guardar Registro");

     if($result==1)
     {
     echo "Recibo Guardado Correctamente" ;
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