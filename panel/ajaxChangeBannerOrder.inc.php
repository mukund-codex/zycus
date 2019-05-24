<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    $admin = new AdminFunctions();
    
    if(isset($_POST['id']) && !empty($_POST['id'])){
        $id = $admin->escape_string($admin->strip_all($_POST['id']));
        $display_order = $admin->escape_string($admin->strip_all($_POST['order']));

        $details = $admin->getUniqueBannerById($id);

        if($details['display_order'] > $display_order){
            $new_venue_ordering	= $display_order;
            $query = "update ".PREFIX."banner_master set display_order = (display_order + 1) where display_order >= '".$display_order."' and display_order < '".$details['display_order']."' and display_order != '' order by display_order asc";
            $admin->query($query);
            $query = "update ".PREFIX."banner_master set display_order = '".$display_order."' where id = '".$id."' ";
            $admin->query($query);
        }else if($details['display_order'] < $display_order){
            $new_venue_ordering	= $details['display_order'];
            $query = "update ".PREFIX."banner_master set display_order = (display_order - 1) where display_order > '".$details['display_order']."' and display_order <= '".$display_order."' and display_order != '' order by display_order asc";
            $admin->query($query);
            $query = "update ".PREFIX."banner_master set display_order = '".$display_order."' where id = '".$id."' ";
            $admin->query($query);
        }

    }   
    
?>