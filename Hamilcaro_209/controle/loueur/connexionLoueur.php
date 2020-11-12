<?php
	//session_start();
	$emailL = isset($_POST['email'])?($_POST['email']):'';
	$numL = isset($_POST['num'])?($_POST['num']):'';
	$msg = '';

	if  (count($_POST)==0)
		require ("././vue/loueur/connexionLoueur.tpl");
    else {
		require("././modele/loueur/loueurBD.php");
		$profil=array();
		if (existe_utilisateur_co($numL,$emailL,$profil)) {
			$_SESSION['profil']=$profil;
			$url="index.php?controle=loueur&action=accueil";
			$action = 'accueil';
			header ('Location:' . $url);
		}
	    else { 
			unset($_SESSION['profil']);
			$msg ="Les informations saisies ne permettent pas de vous identifier";
	        require ("././vue/loueur/connexionLoueur.tpl") ;
		}
    }	

?>