<?php 

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    if(isset($_GET['id']) && !empty($_GET['id'])){
        $id = $func->escape_string($func->strip_all($_GET['id']));

        $sql = "delete from ".PREFIX."category_master where id = '".$id."' ";
        if($func->query($sql)){
            header("location: category-master.php?deletesuccess");
        }else{
            header("location: category-master.php?deletefail");
        }   
    }

?>