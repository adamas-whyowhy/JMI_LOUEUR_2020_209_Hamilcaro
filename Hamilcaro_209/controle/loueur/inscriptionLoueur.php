<?php
	// session_start();
	
	// à enlever qd il y aura l'accueil
	$nomL = isset($_POST['nom'])?($_POST['nom']):'';
	$emailL = isset($_POST['email'])?($_POST['email']):'';
	$numL = isset($_POST['num'])?($_POST['num']):'';
	$msg = '';

	if  (count($_POST)==0)
		require ("././vue/loueur/inscriptionLoueur.tpl");
    else {
		if (!saisie_correcte($nomL, $numL, $emailL)) {	// fonction de loueur.php
			$msg ="Champs incorrectement remplis, merci de vérifier ce que vous avez rempli.</br>Pour rappel :</br>Pas de chaîne vide</br>Adresse mail contient un @</br>Mot de passe entre 8 et 10 caractères";
	        require ("././vue/loueur/inscriptionLoueur.tpl");
		}
		else {
			require("././modele/loueur/loueurBD.php");
			if (!existe_utilisateur($nomL,$numL,$emailL,$profil)) {
				ajout($nomL, $emailL, $numL);
				$_SESSION['profil']['Nom']=$nomL;
				$_SESSION['profil']['Mdp']=$numL;
				$_SESSION['profil']['Email']=$emailL;
				$url="index.php?controle=loueur&action=accueil";
				$action = 'accueil';
				header ('Location:' . $url);
			}
			else {
				$msg ="L'utilisateur existe déjà";
				require ("././vue/loueur/inscriptionLoueur.tpl");
			}
		}
    }


?>

