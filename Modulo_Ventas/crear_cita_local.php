<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
include'../libreria/conf.php';
include'../libreria/conexion.php';
include('../clases/usuario.php');
include('../clases/login.class.php');
//include('clases/sesion.class.php');
include('../clases/cita.class.php');
include('../clases/materia.class.php');
include('../clases/articulo.class.php');
include('../clases/empleado.class.php');
require_once '../clases/sesion.class.php';
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
                $urlasig4="citas_cancelar.php";
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
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modulo Ventas</title>

        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Alfinte S.A de CV</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>

					
					
					
                    <ul class="dropdown-menu dropdown-messages">
						<?php
					$com=$cit->mostrar_mensaje($usuario);
						foreach($com as $co){
							$hace=fechainteligente($co['fecha_creacion']);
							echo"<li>
									<a href='ver_citas.php?id_cita=".$co['id_cita']."'>
										<div>
											<strong>{$co['nombre']}</strong>
											<span class='pull-right text-muted'>
											<em>.$hace.</em>
											</span>
										</div>
										<div> Ha recibido un nuevo mensaje de cita</div>
									</a>
								</li>
								 <li class='divider'></li>";
						
						};
					?>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Leer Todos</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Tareas 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Tarea 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Tarea 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Tarea 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Ver Todas las Tareas</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
					<ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> <?php echo $sesion->get("usuario"); ?> Profile</a>
                        </li>
                        <li><a href="/Alfinte/manuales/manuales.php"><i class="fa fa-gear fa-fw"></i> Manules</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li>
                            <a class="active" href="modulo_ventas.php"><i class="fa fa-dashboard fa-fw"></i> Panel de Control</a>
                        </li>
                        <li>
                            <a href="index.php"><i class="fa fa-bar-chart-o fa-fw"></i> Ventas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               <li>
                                   <?php
										if ($cargo==1)
											{
											$url_asignada=$urlasig;
                                                                                        $ir_a=$envio;
											}
											else if($cargo==2)
											{
                                                                                            $url_asignada=$urlasig;
                                                                                            $ir_a=$envio;
                                                                                            $url_asignada2=$urlasig2;
                                                                                            $url_asignada3=$urlasig3;
                                                                                            $url_asignada4=$urlasig4;
                                                                                            $url_asignada5=$urlasig5;
                                                                                            $url_asignada6=$urlasig6;
                                                                                            $url_asignada7=$urlasig7;
                                                                                            $url_asignada8=$urlasig8;
                                                                                            $url_asignada9=$urlasig9;
                                                                                            $url_asignada10=$urlasig10;
                                                                                            $url_asignada11=$urlasig11;
                                                                                            $url_asignada12=$urlasig12;
                                                                                            $url_asignada13=$urlasig13;
                                                                                            $ir_a2=$envio2;
                                                                                            $ir_a3=$envio3;
                                                                                            $ir_a4=$envio4;
                                                                                            $ir_a5=$envio5;
                                                                                            $ir_a6=$envio6;
                                                                                            $ir_a7=$envio7;
                                                                                            $ir_a8=$envio8;
                                                                                            $ir_a9=$envio9;
                                                                                            $ir_a10=$envio10;
                                                                                            $ir_a11=$envio11;
                                                                                            $ir_a12=$envio12;
                                                                                            $ir_a13=$envio13;
                                                                                            echo"<a href='".$url_asignada."'>".$ir_a."<span class='fa arrow'></span></a> 
                                                                                            <ul class='nav nav-third-level'>
                                                                                                <li>
                                                                                                    <a href='".$url_asignada2."'>".$ir_a2."</a>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <a href='".$url_asignada3."'>".$ir_a3."</a>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <a href='".$url_asignada4."'>".$ir_a4."</a>
                                                                                                </li>
                                                                                            </ul>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href='".$url_asignada5."'>".$ir_a5."<span class='fa arrow'></span></a> 
                                                                                                <ul class='nav nav-third-level'>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada6."'>".$ir_a6."</a>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada7."'>".$ir_a7."</a>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada8."'>".$ir_a8."</a>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada9."'>".$ir_a9."</a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </li>
                                                                                            <li>
                                                                                                <a href='".$url_asignada10."'>".$ir_a10."<span class='fa arrow'></span></a> 
                                                                                                <ul class='nav nav-third-level'>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada11."'>".$ir_a11."</a>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada12."'>".$ir_a12."</a>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                        <a href='".$url_asignada13."'>".$ir_a13."</a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </li>";
                                                                                        }
									?>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="index.php"><i class="fa fa-bar-chart-o fa-fw"></i>Taller<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="orden_trabajo.php">Orden de Trabajo</a>
                                </li>
								<li>
                                    <a href="orden_trabajo.php">Consultar Orden de Trabajo</a>
                                </li>
								<li>
                                    <a href="solicitar_materiales.php">Materiales</a>
                                </li>
								<li>
                                    <a href="instalaciones.php">Instalaciones</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="index.php"><i class="fa fa-sitemap fa-fw"></i>Inventario<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ver_categoria.php">Consultar Articulos</a>
                                </li>
								<li>
                            <a href="ver_categoria.php">Categoria de Articulos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
							<?php
									$rcate=$materiales->mostrar_categoria();
									foreach($rcate as $ci){
									echo "
										<li>
											<a href='".$ci['url']."?id_categoria=".$ci['id_categoria']."'>".$ci['descripcion']."</a>

										</li>";
									}
							?>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                                <li>
                                    <a href="ver_materia.php">Consultar Materiales</a>
                                </li>
								<li>
                                    <a href="index.php">Ajustes <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="ver_categoria.php">Ajustes de Materiales</a>
                                        </li>
                                        <li>
                                            <a href="ver_categoria.php">Ajustes de Articulos</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
								<li>
                                    <a href="index.php">Traslados <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="ver_categoria.php">Traslados Materiales</a>
                                        </li>
                                        <li>
                                            <a href="ver_categoria.php">Traslados Articulos</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                                <li>
                                    <a href="index.php">Solicitar Materiales <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="ver_categoria.php">Verificar Existencia</a>
                                        </li>
                                        <li>
                                            <a href="ver_categoria.php">Ubicaciones</a>
                                        </li>
                                        <li>
                                            <a href="ver_categoria.php">Sucursales</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="index.php"><i class="fa fa-files-o fa-fw"></i> Administrar<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.php">Mantenimiento Sucursales</a>
                                </li>
                                <li>
                                    <a href="index.php">Mantenimiento Bodegas </a>
                                </li>
								<li>
                                    <a href="index.php">Mantemiento Paises <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="ver_categoria.php">Mantenimiento Ciudades</a>
                                        </li>
                                        <li>
                                            <a href="ver_categoria.php">Mantenimiento Provincias</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						 <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
            <div class="row">
                <form role="form" action="crear_cita_local.php"  method="post">
                                    <div class="col-lg-8">
                                            <div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    Ingreso de Nueva Cita
                                                </div>

                                                <div class="panel-body">
                                                    <div class="col-xs-6">
                                                        <div class="form-group">
                                                            <label>Nombre</label>
                                                            <input class="form-control" name="nombre" placeholder="nombre" required="Ingrese el nombre" pattern="[a-Z]">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Telefono</label>
                                                            <input class="form-control" type="number"name="telefono" required="Ingrese el telefono" placeholder="7xxx-xxx o 2xxx-xxxx" pattern="\d{4}[\-]\d{4}" min="2000">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input type="email" class="form-control" name="email" placeholder="email" required="Ingrese el email">

                                                        </div>

                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div class="form-group">
                                                            <label>Apellido</label>
                                                            <input class="form-control" name="apellido" placeholder="apellido" required="Ingrese el apellido" pattern="[a-Z]">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Direccion</label>
                                                            <input class="form-control" name="direccion"placeholder="direccion" required="Direccion" >

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Fecha de visita</label>
                                                           
                                                            <input class='form-control' type='date' name='fecha_programada'  required  min='<?php echo date("Y")?>-<?php echo date("m")?>-<?php echo date("d")?>' max='2015-12-31'>        

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Hora de visita</label>
                                                            <input class="form-control" type="time" name="hora_programada" required="Ingrese la hora de visita" min="08:30:00" max="17:30:00">

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class="form-group">
                                                            <label>Asunto de la cita</label>
                                                            <textarea class="form-control" placeholder="comentarios" name="mensaje" rows="4" required="Ingrese el asunto" pattern="[a-Z-0-9]{100}"></textarea>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                </div> 
                                                <div class="panel-footer">
                                                    <button type="submit" class="btn btn-outline btn-success" name="enviar">Aceptar</button>
                                                     <?php if(isset($result)) { echo $result; } ?>
                                                    <button type="button" class="btn btn-outline btn-danger"><a href="modulo_ventas.php">Cancelar</a></button>
                                                     <button type="reset" class="btn btn-outline btn-warning">Comenzar de nuevo</button>
                                                </div>
                                            </div>
                                        </div>
					
					
				</form>
                    </div>
            </div>
            <!-- /.row -->
            </div>
            <!-- /#wrapper -->
        </div>
            <!-- jQuery Version 1.11.0 -->
             <!-- jQuery Version 1.11.0 -->
            <script src="../js/jquery-1.11.0.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="../js/bootstrap.min.js"></script>

            <!-- Metis Menu Plugin JavaScript -->
            <script src="../js/plugins/metisMenu/metisMenu.min.js"></script>

            <!-- Custom Theme JavaScript -->
            <script src="../js/sb-admin-2.js"></script>

            <!-- DataTables JavaScript -->
            <script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
            <script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
            <script>
        $(document).ready(function() {
            $('#dataTables-example').dataTable();
        });
                </script>
    
    </body>
    

</html>

<?php 
   };
?>