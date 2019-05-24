<?php

    include('site-config.php');
    $loggedInUserDetailsArr = $func->sessionExists();
    
    if(isset($_GET['id']) && !empty($_GET['id'])){
        $id = $func->escape_string($func->strip_all($_GET['id']));

        $get = $func->fetch($func->query("select * from ".PREFIX."redeem_master where id = '".$id."' "));

        $userid = $loggedInUserDetailsArr['id'];
        $redeem = $get['id'];
        $status = 'Requested';
        $points = $get['points'];

        $update = $func->query("insert into ".PREFIX."redeem_activity (userid, redeem, points, status) values ('".$userid."',  '".$redeem."', '".$points."', '".$status."') ");

        $updateuser = $func->query("update ".PREFIX."user_master set points = points - $points where id = '".$userid."' ");

		$userDetails = $func->getUserById($userid);
        
		$rewardDetails = $func->getRewardById($id);

		include('user-redeem-activity.inc.php');

        $mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->Host = "shareittofriends.com";

		$mail->SMTPAuth = true;
		$mail->Port = 587;
		$mail->Username = "noreply@shareittofriends.com";
		$mail->Password = "noreply@1234";
		//$mail->SMTPDebug = 2;
		$mail->From = "noreply@shareittofriends.com";
		$mail->FromName = "Zycus";
        $mail->AddAddress($userDetails['email']);
        $mail->IsHTML(true);
        $mail->Subject = SITE_NAME." Activity Notification";
        $mail->Body = $emailMsg;
        $mail->Send();

        header("location: dashboard-redeem.php?success");
    }

?>