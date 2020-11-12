<?php
	require("././modele/loueur/loueurBD.php");
	$vehicules_loueur=array();
	$vehicules_loueur=listeTousVehicules($_SESSION['profil']['Email']);
	require("././vue/loueur/afficherVehicules.tpl");
?>