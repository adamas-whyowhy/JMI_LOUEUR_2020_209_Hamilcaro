<?php
	require("././modele/loueur/loueurBD.php");
	$vehicules_loueur=array();
	$vehicules_loueur=listeLocations($_SESSION['profil']['IdLoueur']);
	require("././vue/loueur/locationsLoueur.tpl");
?>

