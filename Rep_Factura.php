<?php
require('Reporte/fpdf.php');
require('libreria/motor.php');


class PDF extends FPDF
{

//Cabecera de pagina
function Header(){
	//Logo
	$this->Image('logo.png',10,8,34);
	//Arial Bold 15
	$this->SetFont('Arial','B',15);
	//Movernos a la derecha
	$this->Cell(80);
	//Titulo
	$this->SetFont('Arial','B',15);
	$this->Cell(40,10,'VENTAS DE ALFOMBRAS Y OTROS','C');
	$this->ln(3);
	$this->Cell(110);
	$this->SetFont('Arial','B',7);
	$this->Cell(100,10,'Urbanizacion Buenos Aireas No. 3,','C');
	$this->ln(3);
	$this->Cell(110);
	$this->Cell(40,10,'Calle Gabriela Mistral No. 560,','C');
	$this->ln(3);
	$this->Cell(110);
	$this->Cell(40,10,'San Salvador, El Salvador,C.A.,','C');
	$this->ln(3);
	$this->Cell(110);
	$this->Cell(40,10,'Tels: 2235-0138/2235-0140/ Fax 2225-1519','C');
	$this->ln(3);
	$this->Cell(110);
	$this->Cell(40,10,'Email: alfintesadecv@hotmail.com','C');
	//Salto de Linea
	$this->Ln(30);

}

//Pie de Pagina
function Footer(){
	//Posicion: a 1,5 cm del final
	$this->SetY(-15);
	//Arial italic 8
	$this->SetFont('Arial','I',8);
	//Numero de pagina
	$this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}

// Cargar los datos
function LoadData($file)
{
    // Leer las líneas del fichero
    $id=$_GET['id_factura'];
    $data = array();
    $fac = new ccfactura;
    $data= $fac->detalle($id);
    return $data;
}

// Impresion Documento
function CreateData($header, $data)
{

    $fac = new ccfactura;
    $arrfac = $fac->encabezado($_GET['id_factura']);
	  foreach($arrfac as $ci){
		$id_factura=$ci['Id_Factura'];
		$cliente=$ci['cliente'];
		$fecha_fac=$ci['Fecha_Factura'];
		$ncr=$ci['NCR'];
		$nit=$ci['nit'];
		$giro=$ci['giro'];
		$direccion=$ci['direccion'];
		$id_orden=$ci['id_orden'];
		
		}
    $borde=3;
//   foreach($arrfac as $ci){
//     $this->Write( $borde," COD. FACTURA: {$ci['Id_Factura']} ");
//      $this->Ln();
//     $this->Write( $borde," CLIENTE: {$ci['cliente']} ");
//      $this->Ln();
//       $this->Write( $borde," FECHA: {$ci['Fecha_Factura']} ");
//       $this->Ln();
//       $this->Write( $borde," NRC: {$ci['NCR']} ");
//        $this->Ln();
//     $this->Write( $borde," NIT: {$ci['nit']} ");
//      $this->Ln();
//     $this->Write( $borde," GIRO: {$ci['giro']} ");
//            $this->Ln();
//
//      $this->Write( $borde," DIRECCION: {$ci['direccion']} ");
//       $this->Ln();
//      $this->Write( $borde," NRC: {$ci['NCR']} ");
//     }
	$this->Ln();
	$this->Cell(120,-3,'Numero de Factura: '.$id_orden);
	$this->Cell(90,-3,"Fecha y Hora: ". date('d/m/Y H:i:s'));
	$this->Line(10,65,180,65);
	$this->Ln(7);
	$this->Cell(120,-3,"Nombre : ". $cliente);
	$this->Cell(140,-3,"NIT : ".$nit);
	$this->Line(10,73,180,73);
	$this->Ln(7);
	$this->Cell(120,-3,"Domicilio: ".$direccion);
	$this->Cell(100,-3,"Telefono: 22123004");
	$this->Line(10,80,180,80);
	$this->Ln(7);
	
	//$this->Line(20,62,140,62);
	$this->Cell(20,-3,"Detalle Factura: ");
	//$this->Line(20,68,140,68);
	$this->Ln(10);
	//$this->Ln(2);

// Colores, ancho de línea y fuente en negrita
    $this->SetFillColor(35,48,160);
    $this->SetTextColor(255);
    $this->SetDrawColor(0);
    $this->SetLineWidth(.3);
    $this->SetFont('','B');
    // Cabecera
    $w = array(15, 50, 15, 15, 15, 15, 15, 15);
    for($i=0;$i<count($header);$i++)
        $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
    $this->Ln();
    // Restauración de colores y fuentes
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(0);
    $this->SetFont('');
    // Datos
    $fill = false;
    foreach($data as $row)
    {
        $this->Cell($w[0],6,$row["id_articulo"],'LR',0,'L',$fill);
        $this->Cell($w[1],6,$row["DESCRIPCION"],'LR',0,'L',$fill);
        $this->Cell($w[2],6,$row["medidas"],'LR',0,'L',$fill);
        $this->Cell($w[3],6,$row["sentido"],'LR',0,'L',$fill);
        $this->Cell($w[4],6,$row["CUBRES"],'LR',0,'L',$fill);
        $this->Cell($w[5],6,$row["CANTIDAD"],'LR',0,'R',$fill);
        $this->Cell($w[6],6,$row["PRECIO"],'LR',0,'R',$fill);
        $this->Cell($w[7],6,$row["TOTAL"],'LR',0,'R',$fill);
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),0,'','T');

       $this->Ln(10);
	foreach($arrfac as $ci){
		$sub_total=$ci['Sub_Total'];
		$descuento=$ci['Descuento'];
		$total=$ci['total'];
      }
	  /* 
     foreach($arrfac as $ci){
      $this->Write( $borde," SUB TOTAL: $ {$ci['Sub_Total']} ");
       $this->Ln();
      $this->Write( $borde," DESCUENTO: $ {$ci['Descuento']} ");
       $this->Ln();
      $this->Write( $borde," TOTAL: $ {$ci['total']} ");
      }*/
	$this->Cell(110,7);
	$this->Cell(29,8,"DESCUENTO",1,0,'R');
	$this->Cell(15,8,chr(128)." ".number_format($descuento,2,'.',''),1,0,'R');
	$this->Ln();
	$this->Cell(110,7);
	$this->Cell(29,8,"SUB TOTAL",1,0,'R');
	$this->Cell(15,8,chr(128)." ".number_format($sub_total,2,'.',''),1,0,'R');
	$this->Ln();
	$this->Cell(110,7);
	$this->Cell(29,8,"TOTAL",1,0,'R');
	$this->Cell(15,8,chr(128)." ".number_format($total,2,'.',''),1,0,'R');
	$this->Ln(25);
	$this->Line(10,190,50,190);
	$this->Cell(100,50, "Firma de Cliente: ");
	//$this->Multicell(400,4, "Firma de Cliente: ");
	$this->Line(90,190,150,190);
	$this->Cell(80,50, "Firma de Instalador: ");
	$this->Ln(30);
	$this->Multicell(400,4, "Nota: La garantia consiste en la reparacion sin costo alguno por defectos de fabricacion previa evaluacion de compra para hacerla efectiva.
	Todo Producto ha sido revisado y recibido a entera satisfaccion del cliente.");
	
	
	
}//fin FancyTable

} //fin clase

$pdf = new PDF();
$pdf->AliasNbPages();
// Títulos de las columnas
$header = array('Articulo', 'Descripcion', 'Medidas', 'Sentido','Cubres','Cantidad','Precio','Total');
// Carga de datos
$data = $pdf->LoadData('');
$pdf->SetFont('Arial','',8);
$pdf->AddPage();
$pdf->CreateData($header,$data);
$pdf->Output();
?>