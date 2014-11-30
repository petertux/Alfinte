<?php
    class ccrecibo{

    public $id_recibo;
                
		public function mostrar_recibo($id_recibo){
        $query=" select r.monto,c.nombre,c.apellido,r.descripcion,r.fecha_recibo
        from  recibo r
        inner join cotizacion co on r.id_cotizacion = co.id_cotizacion
        inner join cita c on co.id_cita = c.id_cita                                                   
        where r.id_recibo='". $id_recibo ."'" ;
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }  
        
}//fin clase
?>