<?php
	require("././modele/loueur/loueurBD.php");
	$factures_loueur=array();
	$factures_loueur=listeFactures($_SESSION['profil']['IdLoueur']);
	require("././vue/loueur/facturesloueur.tpl");
?>

