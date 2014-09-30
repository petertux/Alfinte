<?php
    class empleado{

    public $id_empleado;
    public $fecha_creacion;
    public $nombre;
    public $apellido;
    public $email;
    public $telefono;


     public function agregar(){
    $query="INSERT INTO empleado VALUES ('{$this->id_empleado}',
                                        '{$this->nombre}',
                                        '{$this->apellido}',
                                        '{$this->telefono}',
                                        '{$this->fecha_creacion}',										
                                        '{$this->id_cargo}',
                                        '{$this->id_usuario}',
                                        '{$this->codigo_emp}')";
    $result=mysql_query($query) or die ("Problema con query de Insertar");
     return $result;
    }

        public function secqnos(){
        $query="SELECT siguiente from seqnos where tabla='empleado'";
        $rs=mysql_query($query);
        if (!$rs) {
                           echo 'No se pudo ejecutar la consulta: ' . mysql_error();
                    exit;}
        $fila = mysql_fetch_row($rs);
        $num=$fila[0];
         $num = (int)$num;
             return $num;
        }

        public function Upsecqnos(){
        $query2="SELECT siguiente from seqnos where tabla='empleado'";
        $rs=mysql_query($query2);
        if ($row = mysql_fetch_row($rs)) {
        $num = trim($row[0]);}
         $num = (int)$num+1;
      $query= "UPDATE seqnos set siguiente='".$num."'where tabla='empleado'";
        $resultado = mysql_query($query) or die ("Problema con query");
           return $resultado;
		}
		 
		public function mostrar(){
        $query="SELECT  `empleado`.`id_empleado`,
						`empleado`.`nombre`,
						`empleado`.`apellido`,
						`empleado`.`telefono`,
						COUNT(`cita`.`id_cita`) cita 
						FROM (`empleado` INNER JOIN `cita` on `cita`.`id_empleado`=`empleado`.`id_empleado`)
						GROUP BY  `empleado`.`id_empleado` ";
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }
		
		public function mostrar_byid($id){
        $query="SELECT  `empleado`.`id_empleado`,
						`empleado`.`nombre`,
						`empleado`.`apellido`,
						`empleado`.`telefono`,
						FROM `empleado`
						where `empleado`.`id_empleado` =".$id;
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }
}
?>