<?php
	
	function saisie_correcte($nomU, $numU, $emailU) {
		if (trim($nomU) != "" && trim($emailU) != "" && trim($numU) != "" && preg_match("/^[[:alnum:]]{8,10}$/", $numU) == 1)
			return true;
		else
			return false;
	}
	
	function saisie_vehicule_correcte($typeV, $nbV, $nbplacesV, $nbportesV, $moteurV, $vitesseV) {
		if (trim($typeV) != "" && preg_match("/^[[:alnum:]]{5,100}$/", $typeV) == 1 && preg_match("/^[0-9]{1,}$/", $nbV) == 1 && preg_match("/^[0-9]{1,}$/", $nbplacesV) == 1 && preg_match("/^[0-9]{1,}$/", $nbportesV) == 1 && trim($vitesseV) != "" && trim($moteurV) != "")
			return true;
		else
			return false;
	}
	
	function saisie_image($nom_image) {
		if (preg_match("/(jpg|jpeg|png|gif|svg)$/", $nom_image) == 1)
			return true;
		else
			return false;
	}
	
	function enregistrer_image($image) {
		$dossier = '././vue/images/vehicules/';
		return move_uploaded_file($image['tmp_name'], $dossier . $image['name']);
	}
	
	function accueil() {
		require('././vue/loueur/accueilLoueur.tpl');
	}
	
	function connexion() {
		require('././controle/loueur/connexionLoueur.php');
	}
	
	function inscription() {
		require_once('././controle/loueur/inscriptionLoueur.php');
	}
	
	function ajouter() {
		require('././controle/loueur/ajoutVehicule.php');
	}
	
	function listerV() {
		require('././controle/loueur/affVLoueur.php');
	}
	
	function locations() {
		require('././controle/loueur/locationsLoueur.php');
	}
	
	function factures() {
		require('././controle/loueur/facturesLoueur.php');
	}
?>