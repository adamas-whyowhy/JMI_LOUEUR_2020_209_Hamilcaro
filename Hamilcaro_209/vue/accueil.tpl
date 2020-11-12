<!DOCTYPE HTML>
<html lang="fr">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="Chloé Hamilcaro">
		
		<title>Accueil | Location de voitures</title>
		
		<link rel="icon" type="image/x-icon" href="images/icon-u-paris.png"/>
		<link href="./vue/style/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="./vue/style/style.css" />
		<script src="./vue/style/jquery/jquery-3.5.1.slim.min.js"></script><script src="./vue/style/js/bootstrap.bundle.min.js"></script>
	</head>

	<body>
		
		<div>
			<?php require("menu.tpl"); ?>
		</div>
		
		<header>
			<h1>Paris Locations</h1>
			<h6><i>NOUS PARIONS SUR VOTRE BONHEUR</i></h6>
		</header>
		
		<main role="main" class="container">
			<div id="vehicules">
				<div class="titre">
					<h3>LES VÉHICULES</h3>
					<h6><i>VOICI LES VÉHICULES QUE NOUS PROPOSONS À LA LOCATION</i></h6>
					<center>
				</div>
				<div class="contenu">
				<?php
					require ("./modele/connect.php");
					$sql="SELECT * FROM vehicule";
					$v=array();
					try {
						$commande = $pdo->prepare($sql);
						$commande->execute();
						if ($commande->rowCount() > 0) {
							$v = $commande->fetchAll(PDO::FETCH_ASSOC);
						}
					}
					catch (PDOException $e) {
						echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
						die();
					}
					//print_r($v);
					$_SESSION['vehicules']=$v;
					echo '<div class="card-deck mb-3 text-center">';
					foreach ($_SESSION['vehicules'] as $ve) {	// pour chaque tableau de voitures
						echo '
						<div class="card mb-4 box-shadow">
							<div class="card-header">
								<h4 class="my-0 font-weight-normal">' . $ve['Type'] . '</h4>
							</div>';
							echo '<div class="card-body">
							<img src="./vue/' . $ve['Photo'] . '" width="100%">
							Nombre de véhicules : ' . $ve['Nb'] . '</br>
							Disponible à la location : ' . $ve['Location'] . '</br>
							Caractéristiques : ' . $ve['Caract'] . '</br>
							</div>							
						</div>';
					}
					echo '</div>';
				?>
				</div>
				</center>
			</div>
		</main>
	</body>
	
</html>
