<?php 
	$type=htmlspecialchars($typeV);
	$image=$imageV;
	$nb=htmlspecialchars($nbV);
	$moteur=htmlspecialchars($moteurV);
	$vitesse=htmlspecialchars($vitesseV);
	$nbplaces=htmlspecialchars($nbplacesV);
	$nbportes=htmlspecialchars($nbportesV);
?>

<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="Chloé Hamilcaro">
		
		<title>Ajout d'un véhicule | Location de voitures</title>
		
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
			<div class="jumbotron" id="formulaire">
				<h3>Ajout d'un véhicule</h3> 
				
				<form action="index.php?controle=loueur&action=ajouter" method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Nom/Type du véhicule</label>
							<input class="form-control col-sm-9" name="type" type="text" required="required"/><br/>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Caractéristiques</label>
							<div class="col">
								<input class="form-control" name="moteur" type="text" placeholder="Moteur" required="required"/>
							</div>
							<div class="col">
								<input class="form-control" name="vitesse" type="text" placeholder="Vitesse" required="required"/>
							</div>
							<div class="col">
								<input class="form-control" name="nbplaces" type="text" placeholder="Nombre de places" required="required"/>
							</div>
							<div class="col">
								<input class="form-control" name="nbportes" type="text" placeholder="Nombre de portes" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Nombre de véhicules</label>
							<input class="form-control col-sm-9" name="nb" type="text" required="required"/><br/>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">Image</label>
							<input class="form-control-file col-sm-9" name="image" type="file" required="required"/><br/>
						</div>
						
						<input class="btn btn-secondary" type="submit"  value="AJOUTER LE VÉHICULE">
				</form>
				<p id ="message"><?php echo $msg; ?></p>
			</div>
		</main>

	</body>
</html>

