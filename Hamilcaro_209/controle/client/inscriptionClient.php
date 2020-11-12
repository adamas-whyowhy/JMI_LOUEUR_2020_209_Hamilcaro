<?php
	//session_start();
	
	// à enlever qd il y aura l'accueil
	$nomC = isset($_POST['nom'])?($_POST['nom']):'';
	$emailC = isset($_POST['email'])?($_POST['email']):'';
	$numC = isset($_POST['num'])?($_POST['num']):'';
	$msg = '';

	if  (count($_POST)==0)
		require ("././vue/client/inscriptionClient.tpl");
    else {
		if (!saisie_correcte($nomC, $numC, $emailC)) {	// fonction de client.php
			$msg ="Champs incorrectement remplis, merci de vérifier ce que vous avez rempli.</br>Pour rappel :</br>Pas de chaîne vide</br>Adresse mail contient un @</br>Mot de passe entre 8 et 10 caractères";
	        require ("././vue/client/inscriptionClient.tpl");
		}
		else {
			require("././modele/client/clientBD.php");
			if (!existe_utilisateur($nomC,$numC,$emailC,$profil)) {
				ajout($nomC, $emailC, $numC);
				$_SESSION['profil']['Nom']=$nomC;
				$_SESSION['profil']['Mdp']=$numC;
				$_SESSION['profil']['Email']=$emailC;
				$url="index.php?controle=client&action=accueil";
				header ('Location:' . $url);
			}
			else {
				$msg ="L'utilisateur existe déjà";
				require ("././vue/client/inscriptionClient.tpl");
			}
		}
    }


?>

