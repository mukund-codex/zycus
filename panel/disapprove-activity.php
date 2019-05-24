<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();
    $loggedInUserDetailsArr = $func->sessionExists();
    if(isset($_GET['id']) && !empty($_GET['id'])){

        $approvedby = $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname'];

        $id = $func->escape_string($func->strip_all($_GET['id']));  

        $status = $func->escape_string($func->strip_All($_GET['status']));

        $approved = 'Rejected';

        $approved_time = date("Y-m-d h:i:s");

        $query = $func->query("update ".PREFIX."user_activity set approved = '".$approved."', approved_by = '".$approvedby."', approved_time = '".$approved_time."' where id = '".$id."' ");
        header("location: user-activity.php");

    }

?>