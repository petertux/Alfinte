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
      
// Cargar los datos
function LoadData($file)
{
    // Leer las líneas del fichero
    $id=$_GET['id_recibo'];
    $data = array();
    $rec = new ccrecibo;
    $data= $rec->mostrar_recibo($id);
    return $data;
}

// Impresion Documento
function CreateData($header, $data)
{

     $borde=3;
    $this->Write( $borde,"RECIBO PROVISIONAL");
    $this->Ln();
    $this->Ln();
  foreach($data as $row){
    
  $this->Ln();
	$this->Cell(120,-3," POR: {$row['monto']} ");

	$this->Line(10,65,180,65);
	$this->Ln(7);
	$this->Cell(120,-3," RECIBI DE: {$row['nombre']} {$row['apellido']} ");
	
	$this->Line(10,73,180,73);
	$this->Ln(7);
	$this->Cell(120,-3," LA CANTIDAD DE: {$row['monto']} ");

	$this->Line(10,80,180,80);
	$this->Ln(7);
  	$this->Cell(120,-3," EN CONCEPTO DE: {$row['descripcion']} ");

	$this->Line(10,88,180,88);
	$this->Ln(7);
  $this->Cell(120,-3," FECHA: {$row['fecha_recibo']} ");

	$this->Line(10,96,180,96);
	$this->Ln(7);
    
              
          }
	
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