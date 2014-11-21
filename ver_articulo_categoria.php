<?php
include('libreria/motor.php');
$articulos= new articulo();
$q=$_POST['q'];
if ($q == ' '){
		$articulo=$articulos->mostrar_imagen();
	}
	else{
		$articulo=$articulos->mostrar_articulo_media($q);		
	};


?>
	<div class="row">
		<?php
					foreach($articulo as $at){
					echo "<div class='col-sm-6 col-md-4'>
							<div class='thumbnail'>
								<img src='".$at['imagen']."' alt='...'width='150' height='150'>
								<div class='caption'>
									<h3>{$at['descripcion']}</h3>
									<p>Precio:$ {$at['precio']}</p>
									<p>Dsiponible en la WEB:<b> {$at['disponible_web']}</b></p>
									<p><a href='ver_articulo.php?id_articulo=".$at['id_articulo']."' class='btn btn-primary' role='button' name='boton'>Ver Articulo</a> <a href='ver_mod_articulo.php?id_articulo=".$at['id_articulo']."' class='btn btn-default' role='button'>Modificar</a></p>
								</div>
							</div>
						</div>";
				}
		?>
	 </div>