<?php
/*-----------------------------
 - 
 -
 - @author Rafael Barreto
 -
 ------------------------------
*/

require_once('config.php');


$erro = 0;
$msgerro = '.';

$idproduto = $_GET['id'];

#define o encoding do cabeçalho para utf-8
@header('Content-Type: text/html; charset=utf-8');

// Criando um elemento raiz vazio
$xml = new SimpleXMLElement('<?xml version="1.0" ?><Registros />');



if(($idproduto == '') || ($idproduto == '0')){
  $erro = 1;
  $msgerro = 'Codigo invalido!';
}
else{


$stmt = $conn->prepare('select * from vproduto_categoria where id = :id');
    $stmt->execute(array('id' => $idproduto));

    while($row = $stmt->fetch()) {

      $xml->Id = $row['Id'];
      $xml->ProdutoDesc = $row['ProdutoDesc'];
      $xml->DataCadastro = $row['DataCadastro'];
      $xml->CategoriaId = $row['CategoriaId'];
      $xml->CategoriaDesc = $row['CategoriaDesc'];

    }  
}



//Clean (erase) the output buffer
ob_clean();

$xml->erro = $erro;
$xml->msgerro = $msgerro;

// Exibindo o XML
echo json_encode($xml);

?>






















