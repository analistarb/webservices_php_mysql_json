<?php
/*-----------------------------
 - Conexão com Banco de Dados
 -
 - @author Rafael Barreto
 -
 ------------------------------
*/

/*
mysql_connect('localhost', 'root', 'sa') or die('Erro ao conectar com o servidor');
mysql_select_db('webservices') or die ('Erro ao selecionar o banco de dados');
*/


try {
    $conn = new PDO('mysql:host=localhost;dbname=webservices', 'root', 'sa');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);   
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}



?>


