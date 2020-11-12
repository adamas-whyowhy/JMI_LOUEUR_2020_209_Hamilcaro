<?php
	session_start();

	if (isset($_GET['controle']) & isset($_GET['action'])) {
		$controle = "./controle/" . $_GET['controle'];
		$action= $_GET['action'];
	}
	else {
		$controle = "./controle/utilisateur";
		$action= "accueil";
	}
	require ($controle . '.php');   
	$action(); 
?>
