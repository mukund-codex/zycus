<?php

    include('include/config.php');
    include('include/admin-functions.php');
    $func = new AdminFunctions();
    $myObj = new stdClass();
    $activity = '';
    $points = '';
    $loggedInUserDetailsArr = $func->sessionExists();

    if(!empty($_POST['category']) && !empty($_POST['userid'])){
        $category = $func->escape_string($func->strip_all($_POST['category']));
        $userid = $func->escape_string($func->strip_all($_POST['userid']));

        $select = $func->fetch($func->query("select * from ".PREFIX."user_master where id = '".$userid."'"));
        $userpts = $select['points'];

        $query = $func->query("select * from ".PREFIX."redeem_master where category = '".$category."' and '".$userpts."' >= points");
        
        while($res = $func->fetch($query)){
            $activity .= "<option value='".$res['id']."'>".$res['reward_name']."</option>";
            
        }

        $myObj->activity = $activity;
        $myObj->points = $points;
        $myJSON = json_encode($myObj);
        echo $myJSON;

    }

?>