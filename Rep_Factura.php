<?php
require('Reporte/fpdf.php');
require('libreria/motor.php');


class PDF extends FPDF
{
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
    $arrfac = $fac->encabezado("1");

    $borde=3;
    foreach($arrfac as $ci){
      $this->Write( $borde," COD. FACTURA: {$ci['Id_Factura']} ");
       $this->Ln();
      $this->Write( $borde," CLIENTE: {$ci['cliente']} ");
       $this->Ln();
        $this->Write( $borde," FECHA: {$ci['Fecha_Factura']} ");
        $this->Ln();
        $this->Write( $borde," NRC: {$ci['NCR']} ");
         $this->Ln();
      $this->Write( $borde," NIT: {$ci['nit']} ");
       $this->Ln();
      $this->Write( $borde," GIRO: {$ci['giro']} ");
             $this->Ln();

       $this->Write( $borde," DIRECCION: {$ci['direccion']} ");
        $this->Ln();
       $this->Write( $borde," NRC: {$ci['NCR']} ");
      }

             $this->Ln();
             $this->Ln();

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

       $this->Ln();           $this->Ln();     $this->Ln();   $this->Ln();   $this->Ln();   $this->Ln();
     foreach($arrfac as $ci){
      $this->Write( $borde," SUB TOTAL: $ {$ci['Sub_Total']} ");
       $this->Ln();
      $this->Write( $borde," DESCUENTO: $ {$ci['Descuento']} ");
       $this->Ln();
      $this->Write( $borde," TOTAL: $ {$ci['total']} ");
      }

}//fin FancyTable

} //fin clase

$pdf = new PDF();
// Títulos de las columnas
$header = array('Articulo', 'Descripcion', 'Medidas', 'Sentido','Cubres','Cantidad','Precio','Total');
// Carga de datos
$data = $pdf->LoadData('');
$pdf->SetFont('Arial','',8);
$pdf->AddPage();
$pdf->CreateData($header,$data);
$pdf->Output();
?>