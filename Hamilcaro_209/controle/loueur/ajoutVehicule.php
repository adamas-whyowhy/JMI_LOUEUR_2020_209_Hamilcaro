<?php
	$imageV=isset($_FILES['image'])?($_FILES['image']):'';
	$typeV=isset($_POST['type'])?($_POST['type']):'';
	$nbV=isset($_POST['nb'])?($_POST['nb']):'';
	$nbplacesV=isset($_POST['nbplaces'])?($_POST['nbplaces']):'';
	$nbportesV=isset($_POST['nbportes'])?($_POST['nbportes']):'';
	$moteurV=isset($_POST['moteur'])?($_POST['moteur']):'';
	$vitesseV=isset($_POST['vitesse'])?($_POST['vitesse']):'';
	$msg = '';
	
	
	if (count($_FILES)==0)
		require ("././vue/loueur/ajoutVehicule.tpl");
    else {
		require("././modele/loueur/loueurBD.php");
		
		// s'il n'y a pas eu de problème au moment de l'upload
		if (isset($_FILES['image'])) {
			// si l'extension de l'image est correcte et que les autres champs sont remplis correctement
			if (saisie_image($_FILES['image']['name'])  && saisie_vehicule_correcte($typeV, $nbV, $nbplacesV, $nbportesV, $moteurV, $vitesseV)) {
				// si move_uploaded_file a fonctionné comme prévu
				if (enregistrer_image($_FILES['image'])) {
					$caract= array(
						'Moteur' => trim($moteurV),
						'Vitesse' => trim($vitesseV),
						'Nombre de places' => $nbplacesV,
						'Nombre de portes' => $nbportesV
					);
					ajoutVehicule($typeV, $nbV, $imageV['name'], $_SESSION['profil']['IdLoueur'], $caract);
					$msg='Véhicule ajouté avec succès !';
					require ("././vue/loueur/ajoutVehicule.tpl");
				}
				else {
					$msg="L'enregistrement de l'image a échoué.";
					require ("././vue/loueur/ajoutVehicule.tpl");
					die();
				}
			}
			else {
				$msg="Erreur dans la saisie :</br>Le type du véhicule doit comporter au moins 5 caractères.</br>L'image doit être au format .gif, .png, .jpg, .jpeg, .svg";
				require ("././vue/loueur/ajoutVehicule.tpl");
			}
		}
		else {
			$msg="Erreur au moment de la transmission de l'image. Veuillez réessayer.";
			require ("././vue/loueur/ajoutVehicule.tpl");
		}
    }


?>

