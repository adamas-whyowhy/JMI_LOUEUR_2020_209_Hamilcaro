<?php

	function accueil() {
		require('./vue/accueil.tpl');
	}
	
	function deconnexion() {
		unset ($_SESSION['profil']);
		accueil();
	}
	
	function vehiculesdispo() {
		require('./modele/utilisateurBD.php');
		$vehicules=array();
		$vehicules=liste_vehicules();
		$_SESSION['vehicules']=$vehicules;
	}
?>