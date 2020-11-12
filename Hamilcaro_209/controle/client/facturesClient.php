<?php
	require("././modele/client/clientBD.php");
	$factures_client=array();
	$factures_client=listeFactures($_SESSION['profil']['IdClient']);
	require("././vue/client/facturesClient.tpl");
?>

