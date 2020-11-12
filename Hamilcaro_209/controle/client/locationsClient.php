<?php
	require("././modele/client/clientBD.php");
	$vehicules_client=array();
	$vehicules_client=listeLocations($_SESSION['profil']['IdClient']);
	require("././vue/client/locationsClient.tpl");
?>

