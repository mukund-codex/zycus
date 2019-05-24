<?php

    include('site-config.php');

    $loggedInUserDetailsArr = $func->sessionExists();
    $myObj = new stdClass();
    $detail = '';
    if(isset($_POST['category']) && !empty($_POST['category'])){
        //print_r($_POST['category']);exit;
        $category = $_POST['category'];

        //$cat = implode(" , ", $category[])
        for($i = 0; $i< count($category); $i++){
            if($category[$i] == 'all'){
                $query = $func->query("select * from ".PREFIX."activity_master where active = '1'");

                while($row = $func->fetch($query)){
        
                    $detail .= "<div class='my-points-box cross engage'>
                    <div class='row'>
                        <div class='col-md-7'>
                            <h4>".$row['activity_name']." </h4>
                            <p class=''> ".$row['description']." </p>
                        </div>
                        <div class='col-md-2 bor-left'>
                            <p>Points</p>
                            <h1 class='orange'>".$row['points']."</h1>
                        </div>
                        <div class='col-md-3 bor-left text-right'>
                            <a data-fancybox data-type='iframe' data-src='interested-pop.php?id=".$row['id']."' href='javascript:;' class='interested-btn'> Interested </a>
                            <a data-fancybox data-type='iframe' data-src='already-done-pop.php?id=".$row['id']."' href='javascript:;'' class='a-done-btn'> Already Done </a>
                        </div>
                    </div>
                </div>"; 
                }

                $myObj->display = $detail;
                $myJSON = json_encode($myObj);
                echo $myJSON;exit;

            }else{

                $query = $func->query("select * from ".PREFIX."activity_master where category = '".$category[$i]."' ");

                while($row = $func->fetch($query)){
        
                    $detail .= "<div class='my-points-box cross engage'>
                    <div class='row'>
                        <div class='col-md-7'>
                            <h4>".$row['activity_name']." </h4>
                            <p class=''> ".$row['description']." </p>
                        </div>
                        <div class='col-md-2 bor-left'>
                            <p>Points</p>
                            <h1 class='orange'>".$row['points']."</h1>
                        </div>
                        <div class='col-md-3 bor-left text-right'>
                            <a data-fancybox data-type='iframe' data-src='interested-pop.php?id=".$row['id']."' href='javascript:;' class='interested-btn'> Interested </a>
                            <a data-fancybox data-type='iframe' data-src='already-done-pop.php?id=".$row['id']."' href='javascript:;'' class='a-done-btn'> Already Done </a>
                        </div>
                    </div>
                </div>"; 
                }

            }
        }

        $myObj->display = $detail;
        $myJSON = json_encode($myObj);
        echo $myJSON;exit;

    }
?>
