<?php

    include_once 'include/config.php';
    include_once 'include/admin-functions.php';
    include("../smtp/class.phpmailer.php");
    $func = new AdminFunctions();

    $loggedInUserDetailsArr = $func->sessionExists();
    if(isset($_GET['id']) && !empty($_GET['id'])){

        $approvedby = $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname'];

        $id = $func->escape_string($func->strip_all($_GET['id']));  

        $approved = 'Approved';

        $approved_time = date("Y-m-d h:i:s");

        $query = $func->query("update ".PREFIX."redeem_activity set approved = '".$approved."', approved_by = '".$approvedby."', approved_time = '".$approved_time."' where id = '".$id."' ");

        $details = $func->getRedeemActivityById($id);

        $rewardDetails = $func->getUniqueRewardById($details['redeem']);

        $userDetails = $func->getUserById($details['userid']);

        include("user-approval-mail.inc.php");

        //echo $emailMsg;exit;

        $mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->Host = "shareittofriends.com";
		$mail->SMTPAuth = true;
		$mail->Port = 587;
		$mail->Username = "noreply@shareittofriends.com";
		$mail->Password = "noreply@1234";
		$mail->SMTPDebug = 2;
		$mail->From = "noreply@shareittofriends.com";
		$mail->FromName = "Zycus";
        $mail->AddAddress($userDetails['email']);
        $mail->IsHTML(true);
        $mail->Subject = SITE_NAME." Approval Notification";
        $mail->Body = $emailMsg;
        $mail->Send();

        header("location: redeem-activity-master.php");

    }

?>