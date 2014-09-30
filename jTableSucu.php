<html>
  <head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Administracion Sucursales</title>

	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<link href="themes/redmond/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
	<link href="js/jtable/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css" />

       <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="js/jtable/jquery.jtable.js" type="text/javascript"></script>
	
  </head>

  
	<!-- Body -->
  <body>
	<div id="wrapper">
	
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			 <!-- navbar-header -->
			 <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Panel Navegacion</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Alfinte 1.0</a>
            </div>
            <!-- /.navbar-header -->
			
			<!-- navbar-navbar-top-links  -->
			<ul class="nav navbar-top-links navbar-right">
				
				<!-- dropdown -->
				<li class="dropdown">
				
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>				
					<ul class="dropdown-menu dropdown-messages">
						<li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
						<li class="divider"></li>
						<li>
                            <a class="text-center" href="ver_cita.php">
                                <strong>Ver las peticiones</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->						
                </li>
				 <!-- /.dropdown -->
				 
				 <!-- dropdown 2-->
				 <li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
						</a>
					<ul class="dropdown-menu dropdown-tasks">
					<li>
                            <a href="ver_orden.php">
                                <div>
                                    <p>
                                        <strong>Orden 1</strong>
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
                            <a class="text-center" href="#">
                                <strong>Ver Ordenes</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
					</ul>
                    <!-- /.dropdown-tasks -->	
				 </li>
				 <!-- dropdown 3-->
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
								<a class="text-center" href="#">
									<strong>See All Alerts</strong>
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
				  </li>
				  <!-- dropdown 4-->
				  <li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
                        <li><a href="profile_user.php"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="conf_user.php"><i class="fa fa-gear fa-fw"></i> Configuracion</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
				  </li>
				  
			</ul>
            <!-- /.navbar-top-links -->
		 
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li>
                            <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Panel de Control</a>
                        </li>
						<li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
						<li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
						<li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="logout.php">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
					</ul>
				</div>
			</div>
		 <!-- /.navbar-static-side -->
        </nav>
		<!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Blank</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
			<div class="row">
			 <h1 class="page-header">Tabla Sucursales</h1>
				<div id="PeopleTableContainer" style="width: 900px;"></div>
				<script type="text/javascript">

					$(document).ready(function () {

						//Prepare jTable
						$('#PeopleTableContainer').jtable({
							title: 'Tabla de Sucursales',
							paging: true,
							pageSize: 2,
							sorting: true,
							defaultSorting: 'descripcion ASC',
							actions: {
								listAction: 'SucurActions.php?action=list',
								createAction: 'SucurActions.php?action=create',
								updateAction: 'SucurActions.php?action=update',
								deleteAction: 'SucurActions.php?action=delete'
							},
							fields: {
								id_sucursal: {
									key: true,
									create: false,
									edit: false,
									list: false
								},
								descripcion: {
									title: 'Descripcion',
									width: '50%'
								},
								direccion: {
									title: 'Direccion',
									width: '30%'
								},
								nit: {
									title: 'Nit',
									width: '20%'
								},
								estado: {
									title: 'estado',
									width: '30%',
									options: { 'A': 'Activo', 'I': 'Inactivo' }
								},
								telefono: {
									title: 'Telefono',
									width: '30%'
								},
								email: {
									title: 'Email',
									width: '30%'
								},
								ciudad: {
									title: 'Ciudad',
									width: '20%',
									options: { '1': 'San Salvador', '2': 'Santa Tecla' }
								},
								ruta_imagen: {
									title: 'Imagen',
									width: '20%'
								},
								fecha_creacion: {
									title: 'Fecha',
									width: '30%',
									type: 'date',
									create: false,
									edit: false,
									list: false
								},
								usuario_crea: {
									title: 'Usuario',
									width: '20%',
									list:false
								}
							}
						});

						//Load person list from server
						$('#PeopleTableContainer').jtable('load');

					});

				</script>
			</div>
        </div>
        <!-- /#page-wrapper -->
		
		
		

	</div>	
    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>


  </body>
</html>
