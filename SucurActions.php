<?php

try
{
	//Open database connection
	$con = mysql_connect("localhost","root","usbw");
	mysql_select_db("bdatos", $con);

	//Getting records (listAction)
	if($_GET["action"] == "list")
	{
				//Get record count
		$result = mysql_query("SELECT COUNT(*) AS SucCount FROM sucursal");
		$row = mysql_fetch_array($result);
		$recordCount = $row['SucCount'];
		
		//Get records from database
		//$result = mysql_query("SELECT id_sucursal,descripcion,direccion,nit,estado,telefono,email,ruta_imagen,fecha_creacion,usuario_crea,(select valor from ciudad where id_ciudad=sucursal.id_ciudad) FROM sucursal,cita where id_ciudad in (select id_ciudad from ciudad)");
		$result=mysql_query("SELECT id_sucursal,
								descripcion,
								direccion,
								nit,
								sucursal.estado,
								telefono,
								email,
								ruta_imagen,
								fecha_creacion,
								usuario_crea,
								(select valor from ciudad where id_ciudad=sucursal.id_ciudad) 'ciudad'
								FROM sucursal,ciudad 
								where sucursal.id_ciudad=ciudad.id_ciudad
								ORDER BY " . $_GET["jtSorting"] . " LIMIT " . $_GET["jtStartIndex"] . "," . $_GET["jtPageSize"] . ";");
		
		//Add all records to an array
		$rows = array();
		while($row = mysql_fetch_array($result))
		{
		    $rows[] = $row;
		}

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['TotalRecordCount'] = $recordCount;
		$jTableResult['Records'] = $rows;
		print json_encode($jTableResult);
	}
	//Creating a new record (createAction)
	else if($_GET["action"] == "create")
	{
		//Insert record into database
		$result = mysql_query("INSERT INTO sucursal(descripcion,direccion,nit,estado,telefono,email,id_ciudad,ruta_imagen,fecha_creacion,usuario_crea)
														VALUES('" . $_POST["descripcion"] . "',
														   '" . $_POST["direccion"] . "',
														   '" . $_POST["nit"] . "',
														   '" . $_POST["estado"] . "',
														   '" . $_POST["telefono"] . "',
														   '" . $_POST["email"] . "',
														   " . $_POST["ciudad"] . ",
														   '" . $_POST["ruta_imagen"] . "',
														   now(),
														   '" . $_POST["usuario_crea"] . "')");
		
		//$result = mysql_query("INSERT INTO sucursal(id_sucursal,descripcion, nit,estado,telefono,email,id_ciudad,ruta_imagen,fecha_creacion,usuario_crea)VALUES(".$_POST["id_sucursal"].",'" . $_POST["descripcion"] . "','" . $_POST["nit"] . "','" . $_POST["estado"] . "','" . $_POST["email"] . "', " . $_POST["id_ciudad"] . ",now(),'" . $_POST["usuario_crea"] . "');");
		//Get last inserted record (to return to jTable)
		$result = mysql_query("SELECT id_sucursal,
								descripcion,
								direccion,
								nit,
								sucursal.estado,
								telefono,
								email,
								ruta_imagen,
								fecha_creacion,
								usuario_crea,
								(select valor from ciudad where id_ciudad=sucursal.id_ciudad) 'ciudad'
								FROM sucursal,ciudad 
								where sucursal.id_ciudad=ciudad.id_ciudad
								and id_sucursal = LAST_INSERT_ID();");
		$row = mysql_fetch_array($result);

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['Record'] = $row;
		print json_encode($jTableResult);
	}
	//Updating a record (updateAction)
	else if($_GET["action"] == "update")
	{
		//Update record in database
		//$result = mysql_query("UPDATE people SET Name = '" . $_POST["Name"] . "', Age = " . $_POST["Age"] . " WHERE PersonId = " . $_POST["PersonId"] . ";");
		$result= mysql_query("UPDATE sucursal set descripcion='".$_POST["descripcion"]."',nit='".$_POST["nit"]."',estado='".$_POST["estado"]."',telefono='".$_POST["telefono"]."',email='".$_POST["id_ciudad"]."',ruta_imagen='".$_POST["ruta_imagen"]."',fecha_creacion='".$_POST["fecha_creacion"]."'");
		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}
	//Deleting a record (deleteAction)
	else if($_GET["action"] == "delete")
	{
		//Delete from database
		$result = mysql_query("DELETE FROM sucursal WHERE id_sucursal = " . $_POST["id_sucursal"] . ";");

		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		print json_encode($jTableResult);
	}

	//Close database connection
	mysql_close($con);

}
catch(Exception $ex)
{
    //Return error message
	echo $result;
	$jTableResult = array();
	$jTableResult['Result'] = "ERROR";
	$jTableResult['Message'] = $ex->getMessage();
	print json_encode($jTableResult);
}
	
?>