<?php

	include('site-config.php');
	$loggedInUserDetailsArr = $func->sessionExists();

	$query = $func->query("select * from ".PREFIX."contactus order by display_order ASC ");

	$userDetails = $func->getUserById($loggedInUserDetailsArr['id']);
	
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
	<style>

		.error{
			color:red;
		}

	</style>

</head>
<body>
	<!--Main Start Code Here-->

	<div class="wrapper">
		
		<?php include('include/header.php') ?>

		<main>
			<section class="dashboard-sec border-top abt-bg">
				<div class="container">
					<div class="inner-head text-center">
						<h1 class="title1 text-center">Contact Us</h1>
					</div>

					<div class="contact-content">
						<div class="row">
							<div class="col-md-6">
								<div class="contact-form">
									<form method="post" action="emailpro.php" id="contactForm"> 
										<p class="fm-title">Get In Touch</p>
										<div class="form-group">
											<input type="text" name="name" class="form-control" placeholder="Name *" value="<?if(!empty($loggedInUserDetailsArr['fname']) && !empty($loggedInUserDetailsArr['lname'])) {  echo $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname'];  } ?>">
										</div>
										<div class="form-group">
											<input type="text" name="mobile" class="form-control" placeholder="Contact Number *" value="<?php if(!empty($loggedInUserDetailsArr['mobile'])) { echo $loggedInUserDetailsArr['mobile']; } ?>">
										</div>
										<div class="form-group">
											<input type="email" name="email" class="form-control" placeholder="Email Id *" value="<?php if(!empty($loggedInUserDetailsArr['email'])) { echo $loggedInUserDetailsArr['email']; } ?>">
										</div>
										<div class="form-group">
											<textarea type="text" name="message" class="form-control" rows="4" placeholder="Message"></textarea>
										</div>
										<div class="form-group">
											<button type="submit" name="submit" class="submit-btn">Submit</button>
										</div>

									</form>
								</div>
							</div>
							<div class="col-md-6">
								<div class="contact-details">
									<p class="fm-title">Our Address:</p>
									<br>
									<div class="address">
										<div class="accordion">
											<?php while($res = $func->fetch($query)){ ?>
												<div class="accordion-item">
												<a><?php echo $res['region']; ?></a>
												<div class="content">
													<?php echo $res['address']; ?>
												</div>
											</div>
											<?php } ?>	
										</div>
								    </div>
							</div>
						</div>
					</div>
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
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="js/additional-methods.js" type="text/javascript"></script>

<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>

<script>
	$(document).ready(function(){

		$("#contactForm").validate({
			rules: {
				name:{
					required: true,
				},
				email: {
					required: true,
				},					
				message:{
					required:true
				},
				mobile: {
					required: true,
					number: true,
					maxlength: 10,
					minlength: 10,
				},
			},
		});

		$('.banner-slider').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  dots: false,
		  arrows: true
		});

		$(".accordion a").click(function(){
			if (($(this).hasClass('active'))) {
				$(this).toggleClass('active');
				$(this).next('.content').toggleClass('active');
			}else{
				$('.accordion a').removeClass('active');
				$('.accordion .content').removeClass('active');
				$(this).toggleClass('active');
				$(this).next('.content').toggleClass('active');
			}
			
			
		});
	});

	
</script>
<script src="js/application.js" type="text/javascript"></script>
</body>
</html>