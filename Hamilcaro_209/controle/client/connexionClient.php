<?php
	//session_start();
	$emailC = isset($_POST['email'])?($_POST['email']):'';
	$numC = isset($_POST['num'])?($_POST['num']):'';
	$msg = '';

	if  (count($_POST)==0)
		require ("././vue/client/connexionClient.tpl");
    else {
		require("././modele/client/clientBD.php");
		$profil=array();
		if (existe_utilisateur_co($numC,$emailC,$profil)) {
			$_SESSION['profil']=$profil;
			$url="index.php?controle=client&action=accueil";
			$action = 'accueil';
			header ('Location:' . $url);
		}
	    else { 
			unset($_SESSION['profil']);
			$msg ="Les informations saisies ne permettent pas de vous identifier";
	        require ("././vue/client/connexionClient.tpl") ;
		}
    }	

?>