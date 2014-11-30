<?php
include('libreria/conf.php');
 include("libreria/conexion.php") ;
try
{

if($_POST["fac"] != "")
{
  $query="UPDATE FACTURA SET ESTADO=3 where id_factura=".$_POST['fac']."')"	;
     $result=mysql_query($query) or die ("Problema al actualizar Registro"); 
     if($result==1)
     {
     echo "Factura Anulada Correctamente" ;
     }else
     {
       echo "Problemas al Anular Factura" ;
     }
}else{
   echo "Por favor, elija una factura" ;
  }
}
catch(Exception $ex)
{
    //Return error message
	echo  $ex->getMessage();
}

?>