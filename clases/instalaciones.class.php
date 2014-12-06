<?php

    class instalacion{
        

			//Se necesitaba saber el cargo del usuario
        public function sabercargo($user){
        $query="SELECT id_cargo FROM `empleado`,`usuario` where `empleado`.id_empleado = `usuario`.id_empleado and usuario.usuario='".$user."'";
        $rs=mysql_query($query);
        if (!$rs) {
                   echo 'No se pudo ejecutar la consulta: ' . mysql_error();
                    exit;}
        $fila = mysql_fetch_row($rs);
        $num=$fila[0];
         $num = (int)$num;
             return $num;
        }
        
            // mostrar todas las Instalaciones creadas
		public function mostrar_instalaciones(){
        $query = "SELECT id_instalacion, estado, fecha_creacion, fecha_instalacion
					FROM instalacion";						
			$rs=mysql_query($query);
			$array=array();
			while($fila=mysql_fetch_assoc($rs)){
				$array[]=$fila;
			}
             return $array;
        }

			// mostrar asignaciones
		        public function mostrar_InstalacionesAsi(){
				$query="SELECT `empleado`.`id_empleado`,`instalacion`.`id_instalacion`,
				concat(`empleado`.`nombre`,' ',`empleado`.`apellido`) as nombre,
				COUNT(`instalacion`.`id_instalacion`) as instalacion 
				FROM (`empleado` INNER JOIN `instalacion` on `instalacion`.`id_empleado`=`empleado`.`id_empleado`)WHERE empleado.`id_cargo`=5
				GROUP BY `empleado`.`id_empleado`
				";
			$rs=mysql_query($query);
			$array=array();
			while($fila=mysql_fetch_assoc($rs)){
			$array[]=$fila;
			}
			return $array;
			}
			
			
			// mostrar todas las Instalaciones Finalizadas
		public function mostrar_instalacionesFin(){
        $query = "SELECT id_instalacion, estado, fecha_creacion, fecha_instalacion
					FROM instalacion where estado='f'";						
			$rs=mysql_query($query);
			$array=array();
			while($fila=mysql_fetch_assoc($rs)){
				$array[]=$fila;
			}
             return $array;
        }		
		
        
        // Actaulizacion de estado "a" y id_empleado de la Instalaciones
  	public function actualizar_instalacion($cod_emp,$id_instalacion){
    $query="UPDATE  instalacion  SET estado='a', id_empleado=".$cod_emp." where id_instalacion=".$id_instalacion."";
    //$query="UPDATE  instalacion  SET estado='a', id_empleado=".$cod_emp." where id_instalacion=".$id_instalacion."";
    $result=mysql_query($query) or die ("Problema con query de Actualizar Instalacion Asignada");
     return $result;
    }
    // Actaulizacion de estado "f"y id_empleado de la Instalaciones
  	public function actualizar_instalacionF($id_instalacion){
    $query="UPDATE  instalacion  SET estado='f', fecha_instalacion='".date('Y-m-d')."' where id_instalacion=".$id_instalacion."";
    //$query="UPDATE  instalacion  SET estado='a', id_empleado=".$cod_emp." where id_instalacion=".$id_instalacion."";
    $result=mysql_query($query) or die ("Problema con query de Actualizar Instalacion Asignada");
     return $result;
    }    


            // saber cantidad de intalaciones: Numero
		public function cantidad_instalaciones(){
		$query="SELECT count(id_instalacion) as numeroInstalaciones 
				from instalacion";
		$rs=mysql_query($query);
		$array=array();
		while($fila=mysql_fetch_assoc($rs)){
			$array[]=$fila;
		}
			return $array;
		}

            // Cantidad de Instalaciones Asignadas: Numero
		public function cantidad_asi(){
		$query="SELECT count(id_instalacion) as numeroAsi from instalacion where estado='a'";
		$rs=mysql_query($query);
		$array=array();
		while($fila=mysql_fetch_assoc($rs)){
			$array[]=$fila;
		}
			return $array;
		}

            // Cantidad de Instalaciones Finalizadas: Numero
		public function cantidad_fin(){
		$query="SELECT count(id_instalacion) as numeroFin from instalacion where estado='f'";
		$rs=mysql_query($query);
		$array=array();
		while($fila=mysql_fetch_assoc($rs)){
			$array[]=$fila;
		}
			return $array;
		}

            // Mostrar solo tecnicos 
		public function mostrarTec(){
        $query="SELECT id_empleado, concat(`nombre`,' ',`apellido`) as nombre
				FROM empleado
				WHERE id_cargo =5";
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }
        

		        
  
       
}//FIN CLASE


?>