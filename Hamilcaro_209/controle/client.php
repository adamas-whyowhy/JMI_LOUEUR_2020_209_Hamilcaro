<?php
	
	function saisie_correcte($nomU, $numU, $emailU) {
		if (trim($nomU) != "" && trim($emailU) != "" && trim($numU) != "" && preg_match("/^[[:alnum:]]{8,10}$/", $numU) == 1)
			return true;
		else
			return false;
	}
	
	function accueil() {
		require('././vue/client/accueilClient.tpl');
	}
	
	function connexion() {
		require('././controle/client/connexionClient.php');
	}
	
	function inscription() {
		require('././controle/client/inscriptionClient.php');
	}
	
	function locations() {
		require('././controle/client/locationsClient.php');
	}
	
	function factures() {
		require('././controle/client/facturesClient.php');
	}
	
?>