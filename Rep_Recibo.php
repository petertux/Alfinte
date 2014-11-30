<?php
require('Reporte/fpdf.php');
require('libreria/motor.php');


class PDF extends FPDF
{
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
function CreateData($data)
{
    $borde=3;
      
    $this->Write( $borde,"Recibo Provisional");
    $this->Ln();
      
    foreach($data as $row){
          $this->Write( $borde," POR: {$row['monto']} ");
          $this->Ln();
          $this->Write( $borde," RECIBI DE: {$row['nombre']} {$row['apellido']} ");
          $this->Ln();
          $this->Write( $borde," LA CANTIDAD DE: {$row['monto']} ");
          $this->Ln();
          $this->Write( $borde," EN CONCEPTO DE: {$row['descripcion']} ");
          $this->Ln();
          $this->Write( $borde," FECHA: {$row['fecha_recibo']} ");
          $this->Ln();           
          }
}//metodo

} //fin clase

$pdf = new PDF();
// Carga de datos
$data = $pdf->LoadData('');
$pdf->SetFont('Arial','',8);
$pdf->AddPage();
$pdf->CreateData($data);
$pdf->Output();
?>