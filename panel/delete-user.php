<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    if(isset($_GET['id']) && !empty($_GET['id'])){
        $id = $func->escape_string($func->strip_all($_GET['id']));
        
        $query = "update ".PREFIX."user_master set isdelete = '1' where id = '".$id."' ";

        if($func->query($query)){
            header("location: user-master.php?deletesuccess");
        }else{
            header("location: user-master.php?deletefail");
        }     
    }
?>