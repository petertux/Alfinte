<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php 
include('../libreria/motor.php');
require_once('../clases/sesion.class.php');
$cit=new cita();


       
//$login=new Login();
   $sesion = new Sesion();
   $usuario = $sesion->get("usuario");
   
   if( $usuario == false )  {
      header("Location: login.php");
   }  else  {
   

   

$art=new articulo();
$materiales=new materia();
$emp=new empleado();
	$cargo=$cit->sabercargo($usuario);
	if ($cargo==1)
	{
		$mensaje1="Nuevos Pedidos";
                $mensaje1_1="Ver citas pendientes";
		$mensaje2="Total Asignadas";
		$mensaje3="Nuevas Ordenes";
		$mensaje4="Instalaciones";
		$url1="modulo_ventas_supervisor.php";
		$url2="citas_asignadas_vendedores.php";
	}
	else if($cargo==2)
	{
		$mensaje1="Citas Pendientes";
                $mensaje1_3="Ver Citas Pendientes";
		$mensaje2="Citas Confirmadas";
                $mensaje2_3="Ver Citas Confirmadas";
		$mensaje3="Cotizacion Pendientes";
		$mensaje4="Recibos Provicionales";
		$url1="modulo_ventas.php";
		$url2="citas_programadas.php";
                $urlasig="index.php";
                $envio="Cita";
                $urlasig2="crear_cita_local.php";
                $urlasig3="citas_asignadas.php";
                $urlasig4="cancelar_cita.php";
                $urlasig5="index.php";
                $urlasig6="citas_programadas.php";
                $urlasig7="consultar_cotizacion.php";
                $urlasig8="consultar_recibo_provisional.php";
                $urlasig9="consultar_orden_trabajo.php";
                $urlasig10="index.php";
                $urlasig11="crear_cotizacion.php";
                $urlasig12="crear_recibo_provisional.php";
                $urlasig13="crear_factura.php";
                $envio2="Crear Cita";
                $envio3="Confrmar Cita";
                $envio4="Cancelar Cita";
                $envio5="Consultas";
                $envio6="Citas Programadas";
                $envio7="Cotizacion";
                $envio8="Recibo Provisional";
                $envio9="Orden de Trabajo";
                $envio10="Procesos";
                $envio11="Crear Cotizacion";
                $envio12="Crear Recibo Provisional";
                $envio13="Crear Factura";
                if(isset($_POST['enviar'])){
        if($_POST['nombre'] == ''){
        }else if($_POST['apellido'] == ''){
        }else if($_POST['direccion'] == ''){
        }else if($_POST['telefono'] == ''){
        }else if($_POST['email'] == ''){
        }else if($_POST['mensaje'] == ''){
        }elseif($_POST['hora_programada'] == '') { 
        }elseif($_POST['fecha_programada'] == ''){
        }else{
            $nombre = $_POST['nombre'];
            $email = $_POST['email'];
            $cuerpo = $_POST['mensaje'];
            //se ingresan los datos a la entidad cita
                 if(1==1){
                           $cit=new cita();
                           $id_cita=$cit->secqnos();
                           $cit->id_cita=$id_cita;
                           $cit->fecha_creacion=date("Y-m-d H:i:s");
                           $cit->fecha_programada=$_POST['fecha_programada'];
                           $cit->hora=$_POST['hora_programada'];
                           $cit->nombre=$nombre;
                           $cit->apellido=$_POST['apellido'];
                           $cit->telefono=$_POST['telefono'];
                           $cit->direccion=$_POST['direccion'];
                           $cit->email=$email;
                           $cit->id_canal=2;
                           $cit->id_estado=2;
                           $cit->comentario=$cuerpo;
						   $cit->id_empleado=$usuario;

                           $result=$cit->agregar();
                           if($result>0){
                              $result = 'se ingreso registro';
                               $cit->Upsecqnos();
                           }else{
                              $result = 'error al enviar el msj';
                           }

               // $sql = "INSERT INTO `cf` (`nombre`,`email`,`asunto`,`mensaje`) VALUES ('{$_POST['nombre']}','{$_POST['email']}','{$_POST['asunto']}','{$_POST['mensaje']}')";
               // mysql_query($sql) or die(mysql_error());
 

                // si el envio fue exitoso reseteamos lo que el usuario escribio:
//                $_POST['nombre'] = '';
//                $_POST['email'] = '';
//                $_POST['asunto'] = '';
//                $_POST['mensaje'] = '';
 
            }
        }
    }
	
	}
	
function fechainteligente($timestamp) 
{
	if (!is_int($timestamp)) 
	{
		$timestamp=strtotime($timestamp, 0);
	}
	$diff = time() - $timestamp;
	if ($diff <= 0) return 'Ahora';
	else if ($diff < 60) return "hace ".ConSoSinS(floor($diff), ' segundo(s)');
	else if ($diff < 60*60) return "hace ".ConSoSinS(floor($diff/60), ' minuto(s)');
	else if ($diff < 60*60*24) return "hace ".ConSoSinS(floor($diff/(60*60)), ' hora(s)');
	else if ($diff < 60*60*24*30) return "hace ".ConSoSinS(floor($diff/(60*60*24)), ' día(s)');
	else if ($diff < 60*60*24*30*12) return "hace ".ConSoSinS(floor($diff/(60*60*24*30)), ' mes(es)');
	else return "hace ".ConSoSinS(floor($diff/(60*60*24*30*12)), ' año(s)');
}


function ConSoSinS($val, $sentence) 
{
	if ($val > 1) return $val.str_replace(array('(s)','(es)'),array('s','es'), $sentence); 
	else return $val.str_replace('(s)', '', $sentence);
} 




?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <input type="number" min="1" max="10" required>
    </body>
</html>
<?php
   };      // put your code here
  ?>