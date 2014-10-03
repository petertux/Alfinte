<?php
include('libreria/motor.php');

$citas = new cita;
//var_dump($_POST);
//die();
//$res=mysql_query("select * from pais where cod_cont=".$q."",$con);

$empleado=$_POST['q'];
$cita=$_POST['citaid'];
$resp=$citas->actualizar_cita($empleado,$cita);
if ($resp>0 || $resp=="true"){
	}
	else{}
?>
			