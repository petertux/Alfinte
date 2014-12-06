<?php
require('Reporte/fpdf.php');
require('libreria/motor.php');
  $fac = new ccfactura;
	//aqui ya esta listo para recibir el parametro solo descomentar
	//$id_factura=$_GET['id_factura'];
	//$arrfac = $fac->encabezado($id_factura);
	//y comentar esta siguiente linea
	$arrfac = $fac->encabezado("1");
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
	$pdf=new FPDF();
	$pdf->AddPage();
	$pdf->SetFont('Arial', 'B', 16);
	//Inserto la cabecera poniendo una imagen dentro
	$pdf->Cell(700,85,$pdf->Image('logo.png',30,12,80),0,0,'C');
	$pdf->Ln(20);
	$pdf->Cell(100,12,'Cotizacion: '.$id_orden);
	$pdf->Cell(100,12,"Fecha: ". date('d/m/Y'));
	$pdf->Line(35,40,190,40);
	$pdf->Ln(7);
	$pdf->Cell(100,12,"Nombre : ". $cliente);
	$pdf->Cell(90,12,"NIT : ".$nit);
	$pdf->Line(35,48,190,48);
	$pdf->Ln(7);
	$pdf->Cell(100,12,"Domicilio: ".$direccion);
	$pdf->Line(35,56,190,56);
	$pdf->Ln(7);
	$pdf->Cell(100,12,"Telefono: 22123004");
	$pdf->Line(35,62,190,62);
	$pdf->Ln(7);
	$pdf->Cell(100,12,"Equipo: ");
	$pdf->Line(35,68,190,68);
	$pdf->Ln(9);
	$pdf->SetFont('Arial','B',10);
	$pdf->Cell(60,12,'PRESUPUESTO');
	$pdf->Ln(2);
	$pdf->SetFont('Arial','',8);
 

 $pdf->Ln(7);
     
    $pdf->Cell(110,7);
     
    $pdf->Cell(29,8,"TOTAL",1,0,'R');
     
    $pdf->Cell(15,8,chr(128)." ".number_format(100,2,'.',''),1,0,'R');
    $pdf->Ln(20);
     
    $pdf->Multicell(400,4, "Nota: 100");
	$fichero='presupuesto-00.pdf';
     
    $pdfdoc = $pdf->Output($fichero, "D");
    ?>