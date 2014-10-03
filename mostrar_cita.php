<?php
include('libreria/motor.php');
$emp=new empleado();
 $RegistrosAMostrar=4;

 //estos valores los recibo por GET
 if(isset($_GET['pag'])){
  $RegistrosAEmpezar=($_GET['pag']-1)*$RegistrosAMostrar;
  $PagAct=$_GET['pag'];
  //caso contrario los iniciamos
 }else{
  $RegistrosAEmpezar=0;
  $PagAct=1;
 }

	
	?>
	<div class="panel panel-default">
		<div class="panel-heading">
			Muestra el listado de los Vendedores con citas
        </div>
                        <!-- /.panel-heading -->
        <div class="panel-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover" id="dataTables-example">
					<thead>
						<tr>
							<th>No. Empleado</th>
							<th>Nombre</th>
							<th>Telefono</th>
							<th>Citas Asignadas</th>
							<th>Editar</th>
                        </tr>
                    </thead>
					<tbody>
									<?php
									$rempa=$emp->mostrar_empleado_paginado($RegistrosAEmpezar,$RegistrosAMostrar);
									foreach($remp as $re){
									echo "
										<tr>
											<td>{$re['id_empleado']}</td>
											<td>{$re['nombre']}</td>
											<td>{$re['telefono']}</td>
											<td>{$re['cita']}</td>
										</tr>";	
									}
									?>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
 
 <?php 
 //******--------determinar las páginas---------******//
 $NroRegistros=$emp->contar_filas();
 $PagAnt=$PagAct-1;
 $PagSig=$PagAct+1;
 $PagUlt=$NroRegistros/$RegistrosAMostrar;

 //verificamos residuo para ver si llevará decimales
 $Res=$NroRegistros%$RegistrosAMostrar;
 // si hay residuo usamos funcion floor para que me
 // devuelva la parte entera, SIN REDONDEAR, y le sumamos
 // una unidad para obtener la ultima pagina
 if($Res>0) $PagUlt=floor($PagUlt)+1;
 
 //desplazamiento
 echo "<a onclick=\"Pagina('1')\">Primero</a> ";
 if($PagAct>1) echo "<a onclick=\"Pagina('$PagAnt')\">Anterior</a> ";
 echo "<strong>Pagina ".$PagAct."/".$PagUlt."</strong>";
 if($PagAct<$PagUlt)  echo " <a onclick=\"Pagina('$PagSig')\">Siguiente</a> ";
 echo "<a onclick=\"Pagina('$PagUlt')\">Ultimo</a>";
?>