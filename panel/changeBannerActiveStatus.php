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
		
        $data = $admin->getUniqueBannerById($id);
        
		if($data['active'] == 'Yes'){ //if user is active, make him inactive
			$admin->query("update ".PREFIX."banner_master set active='No' where id = '".$id."'");
		}else{
			$admin->query("update ".PREFIX."banner_master set active='Yes' where id = '".$id."'");		
		}
		header("location: banner-master.php");
		exit;
	}
?>