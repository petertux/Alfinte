<?php
include('libreria/motor.php');
try
{

if($_POST["fac"] != "")
{
  $query="UPDATE FACTURA SET fa_estado=3 where id_factura=".$_POST['fac']	;
     $result=mysql_query($query) or die ("Problema al actualizar Registro"); 
     if($result>=1)
     {
     echo "Factura Anulada Correctamente" ;
     }else
     {
    echo "Problemas al actualizar registro";
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