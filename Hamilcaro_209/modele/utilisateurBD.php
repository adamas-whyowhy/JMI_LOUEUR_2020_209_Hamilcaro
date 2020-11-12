<?php
	function lister_vehicules() {
		require ("connect.php");
		$sql="SELECT * FROM vehicules";
		$v=array();
		try {
			$commande = $pdo->prepare($sql);
			$commande->execute();
			if ($commande->rowCount() > 0) {
				$v = $commande->fetch(PDO::FETCH_ASSOC);
			}
			return $v;
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
?>