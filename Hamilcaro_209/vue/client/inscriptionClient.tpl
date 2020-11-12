<?php 
	$nom=htmlspecialchars($nomC);	
	$email=htmlspecialchars($emailC);
	$num=htmlspecialchars($numC);
?>

<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="author" content="Chloé Hamilcaro">
		
		<title>Inscription | Location de voitures</title>
		
		<link rel="icon" type="image/x-icon" href="images/icon-u-paris.png"/>
		<link href="./vue/style/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="./vue/style/style.css" />
		<script src="./vue/style/jquery/jquery-3.5.1.slim.min.js"></script><script src="./vue/style/js/bootstrap.bundle.min.js"></script>
	</head>

	<body>
	
		<div>
			<?php require("././vue/./menu.tpl"); ?>
		</div>
		
		<header>
			<h1>Paris Locations</h1>
			<h6><i>NOUS PARIONS SUR VOTRE BONHEUR</i></h6>
		</header>
		
		<main role="main" class="container">
			<div class="jumbotron" id="formulaire">
				<div class="titre">
					<h3>Formulaire d'inscription : Client</h3> 
				</div>
				<div class="contenu">
					<form action="index.php?controle=client&action=inscription" method="post">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">Nom</label>
							<input class="form-control col-sm-10" name="nom" type="text" value= "<?php echo($nom);?>" placeholder ="NOM" required="required"/><br/>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">Adresse mail</label>
							<input class="form-control col-sm-10" name="email" type="email" value= "<?php echo($email);?>" placeholder ="adresse@domaine.fr" pattern="(.+)@(.+)\.(.+)" required= "required"/></br>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">Mot de passe</label>
							<input class="form-control col-sm-10" name="num" type="password" value= "<?php echo($num);?>" placeholder="Mot de passe" required="required"/><br/>
						</div>
						
						<input class="btn btn-secondary" type="submit"  value="ENREGISTRER">
					</form>
					<p id ="message"><?php echo $msg; ?></p>
				</div>
			</div>
		</main>

	</body>
</html>
