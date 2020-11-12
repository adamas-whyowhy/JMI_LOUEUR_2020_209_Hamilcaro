<?php 
	$factures = $factures_loueur;
?>

<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="Chloé Hamilcaro">
		
		<title>Vos factures | Location de voitures</title>
		
		<link rel="icon" type="image/x-icon" href="images/icon-u-paris.png"/>
		<link href="./vue/style/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="./vue/style/style.css" />
		<script src="./vue/style/jquery/jquery-3.5.1.slim.min.js"></script><script src="./vue/style/js/bootstrap.bundle.min.js"></script><script>$(document).ready(function(){ $('[data-toggle="tooltip"]').tooltip(); });</script>
	</head>

	<body>
		
		<div>
			<?php require("menuLoueur.tpl"); ?>
		</div>
		
		<header>
			<h1>Paris Locations</h1>
			<h6><i>NOUS PARIONS SUR VOTRE BONHEUR</i></h6>
		</header>
		
		<main role="main" class="container">
			<div class="jumbotron" id="formulaire">
				<h3>Vos factures :</h3> 
				
				<table class="table table-responsive-sm">
					<thead>
						<tr>
							<th scope="col" data-toggle="tooltip" title="Date d'émission de la facture">Date</th>
							<th scope="col" data-toggle="tooltip" title="Locataire du véhicule">Client</th>
							<th scope="col" data-toggle="tooltip" title="Nom du véhicule">Véhicule</th>
							<th scope="col" data-toggle="tooltip" title="Statut du paiement">Statut</th>
							<th scope="col" data-toggle="tooltip" title="Montant de la facture">Montant</th>
						</tr>
					</thead>
					<tbody>
				<?php
					foreach ($factures as $f) {	// pour chaque tableau de factures
						echo
							'<tr>' .
							'<td>' . $f['DateF'] . '</td>' .
							'<td>' . $f['Nom'] . '</td>' .
							'<td>' . $f['Type'] . '</td>' .
							'<td>' . $f['Etat'] . '</td>' .
							'<td>' . $f['Valeur'] . ' €</td>' .
							'</tr>';
					}				
				?>
					</tbody>
				</table>
			</div>
		</main>
	</body>
</html>

