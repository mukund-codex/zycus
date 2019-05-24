<?php
	include_once 'include/config.php';
	include_once 'include/admin-functions.php';
	$admin = new AdminFunctions();

	if(!$loggedInUserDetailsArr = $admin->sessionExists()){
		header("location: admin-login.php");
		exit();
	}
	
	if(isset($_GET['id'])){
		$id = $admin->escape_string($admin->strip_all($_GET['id']));
		
        $data = $admin->getUniqueActivityById($id);
        
		if($data['active'] == '1'){ //if user is active, make him inactive
			$admin->query("update ".PREFIX."activity_master set active='0' where id = '".$id."'");
		}else{
			$admin->query("update ".PREFIX."activity_master set active='1' where id = '".$id."'");		
		}
		header("location: activity-master.php");
		exit;
	}
?>