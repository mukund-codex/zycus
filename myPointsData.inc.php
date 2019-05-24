<?php

    include('site-config.php');
    
    $loggedInUserDetailsArr = $func->sessionExists();
    $myObj = new stdClass();
    $detail = '';
    $detail = '';
    $Cate_all = '';
    $wherecondition = '';
    
    if(isset($_POST['category']) && !empty($_POST['category'])){
        $category = $_POST['category'];
        if(in_array("all",$category) || sizeOf($category) < 0){
            $wherecondition = '';
        }else{
            $cate = implode("', '", $category);
            $wherecondition = "and category IN ('".$cate."')";
        }
        $already = $func->query("select SUM(count) as count, activity from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and approved = 'Approved' ".$wherecondition." group by activity");

        while($row = $func->fetch($already)){ 
            $getActivity = $func->fetch($func->query("select * from ".PREFIX."activity_master where id = '".$row['activity']."' "));
            $total += $getActivity['points'];

            $activityPoints = $row['count'] * $getActivity['points'];

            $detail .= "<div class='my-points-box'>
                <div class='row'>
                    <div class='col-md-6'>
                        <h4>".$getActivity['activity_name']."</h4>
                        <p class=''>".$getActivity['description']."</p>
                    </div>
                    <div class='col-md-3 text-center'>
                        <p>Activity count</p>
                        <h1 class='blue'>".$row['count']."</h1>
                    </div>
                    <div class='col-md-3 bor-left'>
                        <p>Points earned</p>
                        <h1 class='orange'>".$activityPoints."</h1>
                    </div>
                </div>
            </div>";

        }

        $myObj->display = $detail;
        $myJSON = json_encode($myObj);
        echo $myJSON;

    }

?>