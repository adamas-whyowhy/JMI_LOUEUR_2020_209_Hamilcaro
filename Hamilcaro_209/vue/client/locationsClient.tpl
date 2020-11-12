<?php 
	$vehicules = $vehicules_client;
?>

<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="Chloé Hamilcaro">
		
		<title>Vos locations | Location de voitures</title>
		
		<link rel="icon" type="image/x-icon" href="images/icon-u-paris.png"/>
		<link href="./vue/style/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="./vue/style/style.css" />
		<script src="./vue/style/jquery/jquery-3.5.1.slim.min.js"></script><script src="./vue/style/js/bootstrap.bundle.min.js"></script>
	</head>

	<body>
		
		<div>
			<?php require("menuClient.tpl"); ?>
		</div>
		
		<header>
			<h1>Paris Locations</h1>
			<h6><i>NOUS PARIONS SUR VOTRE BONHEUR</i></h6>
		</header>
		
		<main role="main" class="container">
			<div class="jumbotron" id="formulaire">
				<h3>Liste de vos locations en cours :</h3> 
				<?php
					echo '<div class="card-deck mb-3 text-center">';
					foreach ($vehicules as $v) {	// pour chaque tableau de voitures
						echo '
						<div class="card mb-4 box-shadow">
							<div class="card-header">
								<h4 class="my-0 font-weight-normal">' . $v['Type'] . '</h4>
							</div>';
							echo '<div class="card-body">
							<img src="./vue/' . $v['Photo'] . '" width="100%">
							Caractéristiques : ' . $v['Caract'] . '</br>
							Loué du ' . $v['DateD'] . ' au ' . $v['DateF'] . '</br>
							</div>							
						</div>';
					}
					echo '</div>';
				
				?>
			</div>
		</main>

	</body>
</html>

