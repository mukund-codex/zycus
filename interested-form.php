<?php 

	include('site-config.php');
	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: login.php");
		exit();
    }
    
    if(isset($_POST) && !empty($_POST)){
        $id = $func->escape_string($func->strip_all($_POST['id']));
        $remark = $func->escape_string($func->strip_all($_POST['remark']));
        $status = $func->escape_string($func->strip_all($_POST['status']));
        $userid= $func->escape_string($func->strip_all($_POST['userid']));
        $select = $func->query("select * from ".PREFIX."activity_master where id = '".$id."' ");
        $res = $func->fetch($select);
        
        $count = '1';

        $query = "insert into ".PREFIX."user_activity (userid, category, activity, points, count, status, remark) values('".$userid."', '".$res['category']."', '".$res['id']."', '".$res['points']."', '".$count."', '".$status."', '".$remark."') ";
        $func->query($query);
    }

?>