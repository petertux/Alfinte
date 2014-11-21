<?php
include('libreria/motor.php');
$articulos= new articulo();

if(isset($_POST['q'])){
	$q=$_POST['q'];
} else {
	$q=@$_GET['q'];
}

$json= @$_GET['json'];

if(isset($json) && $json != "" && $json == "1"){

	$res= $articulos->buscar_articulo($q);
	//echo $res[0];
	$resjson = json_encode($res);
	
	echo $resjson;
	die();

} else {
	die();
	//$res= $articulos->mostrar_articulo2($q);
	//$res=mysql_query("select * from pais where cod_cont=".$q."",$con);
	?>

<?php } ?>