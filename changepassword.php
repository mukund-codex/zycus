<?php

	include('site-config.php'); 
    error_reporting(E_ALL);
	ini_set("display_errors","ON");

	if(isset($_GET['v']) && !empty($_GET['v'])){
		$code = $func->escape_string($func->strip_all($_GET['v']));
	}

	if(isset($_POST['changepass'])){
		
		$password = $func->escape_string($func->strip_all($_POST['password']));
        $password1 = $func->escape_string($func->strip_all($_POST['repassword']));

        $check = $func->query("select * from ".PREFIX."user_master where password_reset_code = '".$code."' ");
        
        if($func->num_rows($check) > 0){
            $password = password_hash($password, PASSWORD_DEFAULT);
            $update = $func->query("update ".PREFIX."user_master set password = '".$password."' where password_reset_code = '".$code."' ");
            header("location: login.php?updatedpass");
            exit;
        }else{
            header("location: changepassword.php?notexists");
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
</head>
<body>
	<!--Main Start Code Here-->

	<div class="wrapper">
		
		<?php include('include/header.php') ?>

		<main>
			<section class="login-sec border-top">

			<?php if(isset($_GET['notexists'])){ ?>
				<div class="alert alert-danger">
				<p>Given login ID is not created/Email ID is incorrect.</p>
				</div>
			<?php } ?>

				<div class="container">
					<form method="post" class="login-form text-center" id="login">
						<h1 class="title1" style="font-size: 20px;">Change Password</h1>
						<!-- <p></p> -->
                        <br>
                        <!-- <div class="form-group">
							<input type="email" name="email" class="form-control" placeholder="Enter Email">
						</div> -->
						<div class="form-group">
							<input type="password" id="password" name="password" class="form-control" placeholder="Enter Password">
						</div>
						<div class="form-group">
							<input type="password" name="repassword" class="form-control" placeholder="Re-enter Password">
						</div>
						<div class="form-group">
							<input type="submit" name="changepass" class="form-control login-btn1" value="Submit" />
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
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
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

    jQuery('#login').validate({
    rules: {
        password: {
            required: true,
        },
        repassword: {
            required: true,
            equalTo: "#password"
        }
    },
    messages: {
        repassword: {
            equalTo: 'Password does not match',
        }
    }
});

</script>
</body>
</html>