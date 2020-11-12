<?php
	$hostname = "localhost";
	$base= "location_base";
	$loginBD= "root";
	$passBD="";

	try {
		$pdo = new PDO ("mysql:server=$hostname; dbname=$base", "$loginBD", "$passBD");
		$pdo->exec('SET NAMES utf8');
	}

	catch (PDOException $e) {
		die  ("Echec de connexion : " . utf8_encode($e->getMessage()) . "\n");
	}
?>