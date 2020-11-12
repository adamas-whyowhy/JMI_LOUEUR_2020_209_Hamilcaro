<?php
	function existe_utilisateur($nomC,$numC, $emailC, &$profil) {
		require ("././modele/./connect.php");
		$sql="SELECT * FROM client WHERE Nom=:nom AND Email=:email AND Mdp=:mdp";
			
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':nom', $nomC, PDO::PARAM_STR);
			$commande->bindParam(':email', $emailC, PDO::PARAM_STR);
			$commande->bindParam(':mdp', $numC, PDO::PARAM_STR);
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
	
	function existe_utilisateur_co($numC, $emailC, &$profil) {
		require ("././modele/./connect.php");
		$sql="SELECT * FROM client WHERE Email=:email AND Mdp=:mdp";
			
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $emailC, PDO::PARAM_STR);
			$commande->bindParam(':mdp', $numC, PDO::PARAM_STR);
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
		
	function ajout($nomC, $emailC, $numC) {
		require ("././modele/./connect.php");
		$sql="INSERT INTO client(nom, email, mdp) VALUES (:nom, :email, :mdp)";
		
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':nom', $nomC);
		$commande->bindParam(':email', $emailC);
		$commande->bindParam(':mdp', $numC);
		$commande->execute();
	}
	
	function listeLocations($idC) {
		require ("./modele/connect.php");
		
		$locations=array();
		$sql="SELECT * FROM facturation INNER JOIN vehicule ON facturation.IdVehicule=vehicule.IdVehicule WHERE facturation.IdClient=:idC AND DateF > CURDATE() ORDER BY facturation.DateD";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idC', $idC);
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
	
	function listeFactures($idC) {
		require ("./modele/connect.php");
		
		$locations=array();
		$sql="SELECT * FROM facturation INNER JOIN (vehicule INNER JOIN loueur ON vehicule.idLoueur=loueur.idLoueur) ON facturation.IdVehicule=vehicule.IdVehicule WHERE facturation.IdClient=:idC AND DateF < CURDATE() ORDER BY facturation.DateF";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idC', $idC);
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