<!DOCTYPE HTML>
<html lang="fr">
	<?php 
		$nomLoueur = $_SESSION['profil']['Nom'];
	?>
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
			<?php require("menuLoueur.tpl"); ?>
		</div>
		
		<header>
			<h1>Paris Locations</h1>
			<h6><i>NOUS PARIONS SUR VOTRE BONHEUR</i></h6>
		</header>
		
		<main role="main" class="container">
			
			<div class="jumbotron" id="accueil">
				<div class="titre">
					<h3>BIENVENUE</h3> 
				</div>
				<div class="contenu">
					<p><?php echo($nomLoueur)?>, bienvenue sur votre espace personnel. Vous êtes bien identifié en tant que client. Utilisez le menu pour vous déplacer sur notre site.</p>
					<p>Nous nous remercions de faire confiance à Paris Locations.</p>
				</div>
			</div>
			
		</main>

	</body>
	
</html>
