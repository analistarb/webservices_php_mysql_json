<?php
/*-----------------------------
 - 
 -
 - @author Rafael Barreto
 -
 ------------------------------
*/

ob_clean();
$json = file_get_contents('http://localhost:1234/webservicephp_json/index.php?id=2'); 


$json = json_decode($json);

if ($json->erro != '1'){
echo "Id: " . $json->Id . '<br />';
echo "ProdutoDesc: " . $json->ProdutoDesc . '<br />';
echo "DataCadastro: " . $json->DataCadastro . '<br />';
echo "CategoriaId: " . $json->CategoriaId . '<br />';
echo "CategoriaDesc: " . $json->CategoriaDesc . '<br />'. '<br />';
}

echo "Codigo de erro: " . $json->erro . '<br />';
echo "Mensagem de erro: " . $json->msgerro . '<br />';


#print_r($json);


?>