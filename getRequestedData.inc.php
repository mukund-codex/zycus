<?php

    include('site-config.php');

    $loggedInUserDetailsArr = $func->sessionExists();

    $total = $func->fetch($func->query("select points from ".PREFIX."user_master where id = '".$loggedInUserDetailsArr['id']."' "));
    $totalpoints = $total['points'];
    
    $myObj = new stdClass();
    $detail = '';
    $detail = '';
    $Cate_all = '';
    $wherecondition = '';
    $sort = '';
   
    if(isset($_POST['sort']) && !empty($_POST['sort'])){
        if($_POST['sort'] == 'latest'){
            $sort = ' order by id desc';    
        }elseif($_POST['sort'] == 'points'){
            $sort = ' order by points desc';
        }
    }
    if(isset($_POST['status']) && !empty($_POST['status'])){
        $status = $func->escape_string($func->strip_all($_POST['status']));

        if(isset($_POST['category']) && !empty($_POST['category'])){
            $category = $_POST['category'];
            if(in_array("all",$category) || sizeOf($category) < 0){
                $wherecondition = '';
            }else{
                $cate = implode("', '", $category);
                $wherecondition = "and category IN ('".$cate."')";
            }
        }
        if($status == 'all'){
            $query = $func->query("select * from ".PREFIX."redeem_master where active = '1' and isdelete != '1' ".$wherecondition." ".$sort." ");

            while($row = $func->fetch($query)){

                $class="disabled";
                $link = "#";
                $style="style='cursor: not-allowed;'";
                if($totalpoints >= $row['points']){
                    $class= "active";
                    $link = "request-to-claim.php?id=".$row['id'];
                    $style="";
                }


                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='pt-bx col-sm-6  col-md-7'>
                        <h4>".$row['reward_name']." </h4>
                    </div>
                    <div class='pt-bx col-sm-2 col-md-2 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$row['points']."</h1>
                    </div>
                    <div class='col-sm-4 col-md-3 bor-left text-center'>
                        <a href=".$link." class='req-claim ".$class."' ".$style."  onclick='loader();' > Request To Claim </a>
                    </div>
                </div>
            </div>"; 
            }

        }else if($status == 'requested'){
           
            $query = $func->query("select * from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and approved = '' and status = '".$status."' ".$wherecondition." ".$sort." ");


            while($row = $func->fetch($query)){

                $getActivity = $func->fetch($func->query("select * from ".PREFIX."redeem_master where id = '".$row['redeem']."' "));

                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='col-sm-9 col-md-9'>
                        <h4>".$getActivity['reward_name']." </h4>
                    </div>
                    <div class='col-sm-3 col-md-3 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$getActivity['points']."</h1>
                    </div>
                </div>
            </div>"; 
            }

        }else if($status == 'Rejected'){
            $query = $func->query("select * from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'requested' and approved = 'Rejected' ".$wherecondition." ".$sort." ");


            while($row = $func->fetch($query)){

                $getActivity = $func->fetch($func->query("select * from ".PREFIX."redeem_master where id = '".$row['redeem']."' "));

                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='col-sm-9 col-md-9'>
                        <h4>".$getActivity['reward_name']." </h4>
                    </div>
                    <div class='col-sm-3 col-md-3 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$getActivity['points']."</h1>
                    </div>
                </div>
            </div>"; 
            }
        }else if($status = 'Approved'){
            $query = $func->query("select * from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'requested' and approved = 'Approved' ".$wherecondition." ".$sort." ");


            while($row = $func->fetch($query)){

                $getActivity = $func->fetch($func->query("select * from ".PREFIX."redeem_master where id = '".$row['redeem']."' "));

                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='col-sm-9 col-md-9'>
                        <h4>".$getActivity['reward_name']." </h4>
                    </div>
                    <div class='col-sm-3 col-md-3 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$getActivity['points']."</h1>
                    </div>
                </div>
            </div>"; 
            }       
        }
        if($detail == ''){
            $detail = " Sorry, currently there are no rewards under this category.";
        }

        $myObj->display = $detail;
        $myJSON = json_encode($myObj);
        echo $myJSON;
        
    }

?>