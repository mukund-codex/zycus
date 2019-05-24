<?php 

	include('site-config.php');
	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: login.php");
		exit();
	}

	if(!empty($_GET['id'])){
		$id = $func->escape_string($func->strip_all($_GET['id']));

		$userDetails = $func->getUserById($_POST['userid']);

		$activityDetails = $func->getActivityById($id);

		include('user-already-done-mail.inc.php');

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

	}

	// if(isset($_POST['submit'])){
	// 	echo '<script>$("#buttonId").css({ "display": "none"});</script>';
	// 	$func->addUserActivity($_POST);
	// 	echo '<script>parent.$.fancybox.close();parent.location.replace("dashboard-engage.php?remarksuccess");</script>';
	// }
?>

<!DOCTYPE html>
<html>
<head>
	<title>ZYCUS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
  	<link rel="icon" type="image/ico" href="images/favicon.png">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/slick.css">
	<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
</head>
<body>

	<form method="post" id="myform" class="already-done-fm">
		<h1 class="title1 text-center">Remark</h1>
		<br>
		<div class="form-group">
			<textarea type="text" id="remark" name="remark" class="form-control" required rows="4" placeholder="Please share details on the activity and the Zycus Contact you engaged with."></textarea>
		</div>
		<div class="form-group">
			<input type="hidden" name="userid" id="userid" value="<?php echo $loggedInUserDetailsArr['id']; ?>" />
			<input type="hidden" name="status" id="status" value="already done" />
			<input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
			<button type="submit" id="submit" onclick="btnDisable();" name="submit" class="submit-btn">Submit</button>
		</div>
	</form>

	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/slick.min.js" type="text/javascript"></script>
	<script src="js/jquery.fancybox.min.js" type="text/javascript"></script>
	<script src="js/index.js" type="text/javascript"></script>

	<script>
		function btnDisable(){
			$("#submit").hide();
			parent.$.fancybox.close();
			$("#myform").submit(function(event) {
			var remark = $("#remark").val();
			var userid = $("#userid").val();
			var status = $("#status").val();
			var id = $("#id").val();
			$("#submit").attr("disabled", true);
			$.ajax({
				type: "POST",
				url: "already-done-form.php",
				data: {remark:remark, userid:userid, status:status, id:id},               
				success: function(response) {
					// console.log(response);   
					var data = JSON.parse(response);       

					}
				});				
			});
			parent.location.replace("dashboard-engage.php?remarksuccess");			
		}
		

		// $("#submit").onclick(function(event) {
		// 	// var loaderEle = $('<i class="fa fa-refresh fa-spin"></i>');
		// 	// $(".form-div").append(loaderEle);
		// 	$("#submit").attr("disabled", true);
		// });
	</script>

</body>
</html>