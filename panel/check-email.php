<?php
	include_once 'include/config.php';
	include_once 'include/admin-functions.php';
	$admin = new AdminFunctions();
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);

	$email = $admin->escape_string($admin->strip_all($_REQUEST['email']));
	if(isset($_REQUEST['id'])) {
		$id = $admin->escape_string($admin->strip_all($_REQUEST['id']));
		$result=$admin->query("select * from ".PREFIX."user_master where email='$email' and id<>'$id' and isdelete=''");
	} else {
		$result=$admin->query("select * from ".PREFIX."user_master where email='$email' and isdelete=''");
	}
	if($admin->num_rows($result)>0){
		echo 'false';
		exit;
	} else{
		echo 'true';
		exit;
	}
?>