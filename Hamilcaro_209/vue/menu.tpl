	<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="menu">
		<a class="navbar-brand" href="index.php">Location de voitures</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.php">Accueil</a></li>
			</ul>
			<ul class="navbar-nav" id="navbar-right">
				<li class="nav-item dropdown">
					<button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Client</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="index.php?controle=client&action=connexion">Connexion</a>
						<a class="dropdown-item" href="index.php?controle=client&action=inscription">Inscription</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Loueur</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="index.php?controle=loueur&action=connexion">Connexion</a>
						<a class="dropdown-item" href="index.php?controle=loueur&action=inscription">Inscription</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>