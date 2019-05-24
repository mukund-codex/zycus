<?php
	include_once 'site-config.php';
	$loggedInUserDetailsArr = $func->sessionExists();

	$loggedIn = $_SESSION[SITE_NAME]['userUserLoggedIn'];

	$outTime = date("d-m-Y h:i:s");
	$sql = "update ".PREFIX."user_login_logs set loggedout = '".$outTime."' where userid = '".$loggedInUserDetailsArr['id']."' and loggedin = '".$loggedIn."' ";
	
	$func->query($sql);

	$func->logoutSession();

	header("location:login.php");
?>