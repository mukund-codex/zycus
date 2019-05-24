<?php 

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $func = new AdminFunctions();

    if(isset($_GET['id']) && !empty($_GET['id'])){

        $id = $func->escape_string($func->strip_all($_GET['id']));

        $query = $func->query("delete from ".PREFIX."contactus where id = '".$id."' ");
        header("location: contactus-master.php");
        exit;

    }

?>