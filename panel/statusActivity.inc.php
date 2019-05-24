<?php

    include('site-config.php');

    $loggedInUserDetailsArr = $func->sessionExists();
    $myObj = new stdClass();
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

        if($status == "all"){  
            $query = $func->query("select * from ".PREFIX."activity_master where active = '1' and isdelete != '1' ".$wherecondition." ".$sort." ");         
            
            while($row = $func->fetch($query)){

                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='pt-bx col-sm-7 col-md-7'>
                        <h4>".$row['activity_name']." </h4>
                        <p class=''> ".$row['description']." </p>
                    </div>
                    <div class='pt-bx col-sm-2 col-md-2 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$row['points']."</h1>
                    </div>
                    <div class='col-sm-3 col-md-3 bor-left text-right'>
                        <a data-fancybox data-type='iframe' data-src='interested-pop.php?id=".$row['id']."' href='javascript:;' class='interested-btn'> Interested </a>
                        <a data-fancybox data-type='iframe' data-src='already-done-pop.php?id=".$row['id']."' href='javascript:;'' class='a-done-btn'> Already Done </a>
                    </div>
                </div>
            </div>"; 
            }

        }else{
            $query = $func->query("select * from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = '".$status."' ".$wherecondition." ".$sort." ");            
            while($row = $func->fetch($query)){

                $getActivity = $func->fetch($func->query("select * from ".PREFIX."activity_master where id = '".$row['activity']."' "));
    
                $detail .= "<div class='my-points-box cross engage'>
                <div class='row'>
                    <div class='col-sm-9 col-md-9'>
                        <h4>".$getActivity['activity_name']." </h4>
                        <p class=''> ".$getActivity['description']." </p>
                    </div>
                    <div class='col-sm-3 col-md-3 bor-left'>
                        <p>Points</p>
                        <h1 class='orange'>".$getActivity['points']."</h1>
                    </div>
                </div>
            </div>"; 
            }
        }       

        $myObj->display = $detail;
        $mjObj->status = $status;
        $myJSON = json_encode($myObj);
        echo $myJSON;
        
    }

?>