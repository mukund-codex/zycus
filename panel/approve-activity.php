<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    $loggedInUserDetailsArr = $func->sessionExists();
    if(isset($_GET['id']) && !empty($_GET['id'])){

        $approvedby = $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname'];

        $id = $func->escape_string($func->strip_all($_GET['id']));  

        $status = $func->escape_string($func->strip_All($_GET['status']));

        if($status == 'already done'){
            $approved = 'Approved';
        }else{
            $approved = 'Granted';
        }

        $approved_time = date("Y-m-d h:i:s");

        $getActivity = $func->fetch($func->query("select points, userid from ".PREFIX."user_activity where id = '".$id."' "));
        
        $actPoints = $getActivity['points'];
        $userid = $getActivity['userid'];

        $get = $func->fetch($func->query("select id, points from ".PREFIX."user_master where id = '".$userid."' "));

        $points = $get['points'];
        
        $total = $actPoints + $points; 

        $query = $func->query("update ".PREFIX."user_activity set approved = '".$approved."', approved_by = '".$approvedby."', approved_time = '".$approved_time."' where id = '".$id."' ");

        $updatePoints = $func->query("update ".PREFIX."user_master set points = '".$total."' where id = '".$userid."' ");

        header("location: user-activity.php");

    }

?>