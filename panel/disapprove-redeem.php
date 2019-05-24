<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    $loggedInUserDetailsArr = $func->sessionExists();
    if(isset($_GET['id']) && !empty($_GET['id'])){

        $approvedby = $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname'];

        $id = $func->escape_string($func->strip_all($_GET['id']));  

        $approved = 'Rejected';

        $approved_time = date("Y-m-d h:i:s");

        $get = $func->fetch($func->query("select * from ".PREFIX."redeem_activity where id= '".$id."' "));
        $userid = $get['userid'];
        $points = $get['points'];

        $query = $func->query("update ".PREFIX."redeem_activity set approved = '".$approved."', approved_by = '".$approvedby."', approved_time = '".$approved_time."' where id = '".$id."' ");

        $updateUser = $func->query("update ".PREFIX."user_master set points = points + $points where id = '".$userid."' ");

        header("location: redeem-activity-master.php");

    }

?>