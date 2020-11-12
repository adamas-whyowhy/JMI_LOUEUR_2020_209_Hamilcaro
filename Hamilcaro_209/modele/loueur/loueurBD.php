<?php
	function existe_utilisateur($nomL,$numL, $emailL, &$profil) {
		require ("././modele/./connect.php");
		$sql="SELECT * FROM Loueur WHERE Nom=:nom AND Email=:email AND Mdp=:mdp";
			
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':nom', $nomL, PDO::PARAM_STR);
			$commande->bindParam(':email', $emailL, PDO::PARAM_STR);
			$commande->bindParam(':mdp', $numL, PDO::PARAM_STR);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$profil = $commande->fetch(PDO::FETCH_ASSOC);
				return true;
			}
			else {
				return false;
			}
		}
			
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
	
	function existe_utilisateur_co($numL, $emailL, &$profil) {
		require ("././modele/./connect.php");
		$sql="SELECT * FROM Loueur WHERE Email=:email AND Mdp=:mdp";
			
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $emailL, PDO::PARAM_STR);
			$commande->bindParam(':mdp', $numL, PDO::PARAM_STR);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$profil = $commande->fetch(PDO::FETCH_ASSOC);
				return true;
			}
			else {
				return false;
			}
		}
			
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
		
	function ajout($nomL, $emailL, $numL) {
		require ("././modele/./connect.php");
		$sql="INSERT INTO Loueur(nom, email, mdp) VALUES (:nom, :email, :mdp)";
		
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':nom', $nomL);
		$commande->bindParam(':email', $emailL);
		$commande->bindParam(':mdp', $numL);
		$commande->execute();
	}
	
	function ajoutVehicule($type, $nb, $image, $idLoueur, $car) {
		require ("././modele/./connect.php");
		$sql="INSERT INTO Vehicule(type, location, nb, photo, idLoueur, Caract) VALUES (:type, 'Disponible', :nb, :image, :idLoueur, :Caracteristiques)";
		
		$nomImage = './images/vehicules/' . $image;
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':type', $type);
			$commande->bindParam(':nb', $nb);
			$commande->bindParam(':image', $nomImage);
			$commande->bindParam(':idLoueur', $idLoueur);
			$commande->bindValue(':Caracteristiques', json_encode($car));
			$commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
			die();
		}
	}
	
	function listeTousVehicules($email) {
		require ("./modele/connect.php");
		
		$v=array();
		$sql="SELECT * FROM vehicule INNER JOIN loueur ON vehicule.IdLoueur=loueur.IdLoueur WHERE loueur.Email LIKE :email";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $email);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$v = $commande->fetchAll(PDO::FETCH_ASSOC);
				}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		return $v;
	}
	
	function listeLocations($idL) {
		require ("./modele/connect.php");
		
		$locations=array();
		$sql="SELECT * FROM vehicule INNER JOIN (facturation INNER JOIN client ON facturation.IdClient=client.IdClient) ON vehicule.IdVehicule=facturation.IdVehicule WHERE vehicule.IdLoueur=:idL AND DateF > CURDATE() ORDER BY facturation.DateD";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idL', $idL);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$locations = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		return $locations;
	}
	
	function listeFactures($idL) {
		require ("./modele/connect.php");
		
		$locations=array();
		$sql="SELECT * FROM vehicule INNER JOIN (facturation INNER JOIN client ON facturation.IdClient=client.IdClient) ON vehicule.IdVehicule=facturation.IdVehicule WHERE vehicule.IdLoueur=:idL AND DateF < CURDATE() ORDER BY facturation.DateF";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idL', $idL);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$locations = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		return $locations;
	}
?>