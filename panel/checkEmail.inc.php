<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    if(isset($_POST['email']) && !empty($_POST['email'])){
        $email = $func->escape_string($func->strip_all($_POST['email']));

        $select = $func->query("select * from ".PREFIX."user_master where email = '".$email."' ");
        if($func->num_rows($select) == 0){
            echo "not exists";exit;
        }else{
            echo "exists";exit;
        }
    }

?>