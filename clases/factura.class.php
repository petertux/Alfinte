<?php
    class ccfactura{
  public $id_factura;
  public $fecha_factura;
  public $fecha_creacion;
  public $direccion_factura;
  public $direccion_instalacion;
  public $nit;
  public $ncr;
  public $giro;
  public $sub_total;
  public $descuento;
  public $monto_descuento;
  public $total;
  public $fa_estado;
  public $id_cliente;
  public $id_tipo_doc;
  public $id_orden;
  public $id_forma_pago;


  public function mostrar_factura($articulo){
     $query="Select id_factura,
                    fecha_factura,
                    from factura
                    ";



     $rs=mysql_query($query);
            $array=array();
            while($fila=mysql_fetch_assoc($rs)){
              $array[]=$fila;
            }
                 return $array;
          }

    public $id_factura;

		public function encabezado($id_fac){
        $query="select Id_Factura,Fecha_Factura, estado.Descripcion as estado,Id_Orden,
        concat_ws(' ',  primer_nombre,
        primer_apellido) as cliente
        , factura.nit,
        factura.direccion_instalacion direccion, factura.NCR, factura.giro,
        forma_pago.descripcion as forma_pago, tipo_documento.descripcion as tipo_documento,
        Sub_Total, Descuento,total,id_orden
        from factura
        inner join
        factura_estado as estado on factura.fa_estado= estado.ID_ESTADO
        inner join
        cliente on factura.id_cliente = cliente.id_cliente
        inner join
        forma_pago on  factura.ID_FORMA_PAGO=forma_pago.id_forma_pago
        inner join
        tipo_documento on  factura.id_tipo_doc =  tipo_documento.Id_Tipo_Documento
        where id_factura ='". $id_fac ."'" ;
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }


        public function mostrar(){
        $query="select Id_Factura,Fecha_Factura, estado.Descripcion as estado,Id_Orden,
        concat_ws(' ',  primer_nombre,
        primer_apellido) as cliente
        , factura.nit,
        factura.direccion_instalacion direccion, factura.NCR, factura.giro,
        forma_pago.descripcion as forma_pago, tipo_documento.descripcion as tipo_documento,
        Sub_Total, Descuento,total
        from factura
        inner join
        factura_estado as estado on factura.fa_estado= estado.ID_ESTADO
        inner join
        cliente on factura.id_cliente = cliente.id_cliente
        inner join
        forma_pago on  factura.ID_FORMA_PAGO=forma_pago.id_forma_pago
        inner join
        tipo_documento on  factura.id_tipo_doc =  tipo_documento.Id_Tipo_Documento ";           

         $rs=mysql_query($query);
         echo $rs;
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }


        public function detalle($id_fac){
        $query="select fd.id_articulo, at.DESCRIPCION,
        medidas,sentido,CUBRES,CANTIDAD,PRECIO,TOTAL
        from factura_detalle fd
        inner join
        articulo_ter at on fd.id_articulo= at.id_articulo
        where id_factura ='". $id_fac ."'" ;
        $rs=mysql_query($query);
        $array=array();
        while($fila=mysql_fetch_assoc($rs)){
          $array[]=$fila;
        }
             return $array;
        }


}
?>