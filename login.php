<?php

	include('site-config.php'); 

	if($loggedInUserDetailsArr = $func->sessionExists()){
		header("location: dashboard-engage.php");
		exit();
	}
	
	if(isset($_POST['loginsubmit'])){

		$email = $func->escape_string($func->strip_all($_POST['email']));
		$password = $func->escape_string($func->strip_all($_POST['password']));

		$invalidquery = $func->query("select * from ".PREFIX."user_master where email = '".$email."' and active = '0' order by id desc limit 1 ");
		$deletedquery = $func->query("select * from ".PREFIX."user_master where email = '".$email."' and isdelete != '1' order by id desc limit 1 ");
		if($func->num_rows($invalidquery) > 0){
			header("location: login.php?deactivated");
			exit;
		}else if($func->num_rows($deletedquery) < 1){
			header("location: login.php?deleted");
			exit;
		}
		else{
			//server side validation
			if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$param = "login.php?failed";
			}else{
				$param = $func->adminLogin($_POST,"dashboard-engage.php");
			}
			//check result of login
			if(isset($param) && $param=="dashboard-engage.php")
			{	
				header("location: ".$param);
				exit;
			}
		}

	}
	if(isset($_POST['forgotbutton'])){
		$errorArr = array();
			if(isset($_POST['forgotemail']) && !empty($_POST['forgotemail'])){
				$email = $func->escape_string($func->strip_all($_POST['forgotemail']));
				if( (empty($email) || !preg_match("/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/", $email)) ){
					$errorArr[] = "ENTERVALIDEMAIL";
				}
			} else {
				$errorArr[] = "ENTEREMAIL";
			}
		
			if(count($errorArr)>0){
				$errorStr = implode("|", $errorArr);
				header("location: index.php?e=".$errorStr);
				exit;
			} else {
				$passwordResetResponse = $func->setCustomerPasswordResetCode($email);

					include("customer-forget-password-email.inc.php");

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
					$mail->AddAddress($passwordResetResponse['email']);
					$mail->IsHTML(true);
					$mail->Subject = SITE_NAME." account password";
					$mail->Body = $emailMsg;
					$mail->Send();
					header("location: login.php?s");
					exit;
			}
	}

?>

<!DOCTYPE>
<html>
<head>
	<title>ZYCUS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
  	<link rel="icon" type="image/ico" href="images/favicon.png">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/slick.css">
	<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>
<body>
	<!--Main Start Code Here-->

	<div class="wrapper">
		
		<?php include('include/header.php') ?>

		<main>
			<!-- login sec -->
			<section class="login-sec border-top">

			<?php if(isset($_GET['updatedpass'])){ ?>
				<div class="alert alert-success">
					<p>Password Update successfully.</p>
				</div>
			<?php } ?>

			<?php if(isset($_GET['deactivated'])){ ?>
				<div class="alert alert-danger">
					<p>User ID deactivated.</p>
				</div>
			<?php } ?>

			<?php if(isset($_GET['deleted'])){ ?>
				<div class="alert alert-danger">
					<p>User ID does not exists.</p>
				</div>
			<?php } ?>

			<?php if(isset($_GET['s'])){ ?>
				<div class="alert alert-success">
					<p>Mail has been send to your email id to change password.</p>
				</div>
			<?php } ?>

			<?php if(isset($_GET['user-does-not-exists']) || isset($_GET['failed'])){ ?>
				<div class="alert alert-danger">
				<p>User name and password does not matched.</p>
				</div>
			<?php } ?>

				<div class="container">
					<form method="post" class="login-form text-center" id="login">
						<h1 class="title1">Login</h1>
						<p>Welcome! Login to access the Zycus.</p>
						<div class="form-group">
							<input type="email" name="email" class="form-control" placeholder="Corporate Email ID">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control" placeholder="Password">
						</div>
						<p class="text-right">Did you <a href="javascript:;" class="toforgot">forget your Password?</a></p>
						<div class="form-group">
							<input type="submit" name="loginsubmit" class="form-control login-btn1" value="Login" />
							<!-- <button type="submit" class="form-control login-btn1" name="loginsubmit">Login</button> -->
						</div>
					</form>

					<form class="login-form text-center" method="post" id="forgot">
						<h1 class="title1">Forgot Password</h1>
						<br>
						<div class="form-group">
							<input type="email" name="forgotemail" class="form-control" placeholder="Corporate Email ID">
						</div>
						<p class="text-right"><a href="javascript:;" class="tologin">Back To Login?</a></p>
						<div class="form-group">
							<button class="form-control login-btn1" name="forgotbutton">Reset Password</button>
						</div>
					</form>
				</div>
			</section>

		</main>

		<?php include('include/footer.php') ?>
		
	</div>
	
	<!--Main End Code Here--> 

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/slick.min.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		$('.toforgot').click(function(){
			$('#login').hide();
			$('#forgot').show();
		});
		$('.tologin').click(function(){
			$('#forgot').hide();
			$('#login').show();
		});
	});
</script>
</body>
</html>