<?php

    include('include/config.php');
    include('include/admin-functions.php');
    $func = new AdminFunctions();
    $myObj = new stdClass();
    $activity = '';
    $points = '';
    $loggedInUserDetailsArr = $func->sessionExists();

    if(!empty($_POST['category'])){
        $category = $func->escape_string($func->strip_all($_POST['category']));
        $query = $func->query("select * from ".PREFIX."activity_master where category = '".$category."' ");

        while($res = $func->fetch($query)){
            $activity .= "<option value='".$res['id']."'>".$res['activity_name']."</option>";

        }

        $myObj->activity = $activity;
        $myObj->points = $points;
        $myJSON = json_encode($myObj);
        echo $myJSON;

    }

?>