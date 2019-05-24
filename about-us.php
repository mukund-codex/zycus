<?php

	include('site-config.php');
	$loggedInUserDetailsArr = $func->sessionExists();

	$query = $func->query("select * from ".PREFIX."about_us ");
	$res = $func->fetch($query);

	$file_name = str_replace('', '-', strtolower( pathinfo($res['image_name'], PATHINFO_FILENAME)));
	$ext = pathinfo($res['image_name'], PATHINFO_EXTENSION);

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
			<section class="dashboard-sec border-top abt-bg">
				<div class="container">
					<div class="inner-head text-center">
						<h1 class="title1 text-center">About Us</h1>
					</div>

					<div class="about-content">
						<img src="images/<?php echo $file_name.'_crop.'.$ext ?>" class="abt-img pull-right">
						<?php echo $res['desc1'] ?>
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
<script>
	$(document).ready(function(){
		$('.banner-slider').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  dots: false,
		  arrows: true
		});
	});

	
</script>
</body>
</html>