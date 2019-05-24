<?php

	include('site-config.php');
	$loggedInUserDetailsArr = $func->sessionExists();
	$sql = $func->query("select * from ".PREFIX."banner_master where active = 'Yes' order by display_order ASC ");

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
			<!-- banner sec -->
			<section class="banner-section">
				<div class="banner-slider">
				<?php while($res = $func->fetch($sql)){ 

				$file_name = str_replace('', '-', strtolower( pathinfo($res['ipad_img'], PATHINFO_FILENAME)));
				$ext = pathinfo($res['ipad_img'], PATHINFO_EXTENSION);

				// $file_name1 = str_replace('', '-', strtolower( pathinfo($res['phone_img'], PATHINFO_FILENAME)));
				// $ext1 = pathinfo($res['phone_img'], PATHINFO_EXTENSION);

					?>
					<div class="banner">
						<div class="container">
							<div class="banner-text">
								<div class="title">
									<?php echo $res['title']; ?>
								</div>								
								<div class="btn-grp">
									<a href="#" class="get-started"><img src="images/white-r.png"> Get Started</a>
									<?php if(empty($loggedInUserDetailsArr)){ ?>
										<a href="login.php" class="Login"><img src="images/black-r.png"> Login</a>
									<?php }else{ ?>
										<a href="" class="Login"><img src="images/black-r.png"> <?php echo $loggedInUserDetailsArr['fname']; ?></a>
									<?php } ?>									
								</div>
								<div class="mobile-div">
									<img class="phone" src="images/banner/<?php echo $file_name.'_crop.'.$ext ?>">
									<!-- <img class="ipad" src="images/banner/<?php echo $file_name1.'_crop.'.$ext1 ?>"> -->
								</div>
							</div>
						</div>	
					</div>
				<?php  } ?>
				</div>
			</section>
			<section class="zucus-preaima">
				<div class="container">
					<div class="text-center">
					<?php $sql = $func->query("select * from ".PREFIX."gallery_content where id='1'");
						$res = $func->fetch($sql);
					?>
						<h1 class="title1"><?php echo $res['title']; ?></h1>
						<h4 class="blue"><?php echo $res['subtitle']; ?></h4>
						<?php echo $res['description']; ?>
					</div>
				</div>
			</section>
			<section class="way-to-earn">
				<div class="container">
					<div class="row">
					<?php $query = $func->query("select * from ".PREFIX."gallery_content where id='3' ");
						$data = $func->fetch($query);

						$file_name = str_replace('', '-', strtolower( pathinfo($data['image'], PATHINFO_FILENAME)));
						$ext = pathinfo($data['image'], PATHINFO_EXTENSION);

					?>
						<div class="col-sm-5">
							<div class="text-center">
								<img src="images/<?php echo $file_name.'_crop.'.$ext ?>">
							</div>
						</div>
						<div class="col-sm-7">
							<div class="way-to-earn-text">
								<h1 class="title1"><?php echo $data['title']; ?></h1>
								<?php echo $data['description']; ?>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="what-in-it">
				<div class="container">
					<div class="row">
					<?php $query = $func->query("select * from ".PREFIX."gallery_content where id='4' ");
						$data = $func->fetch($query);
					?>
						<div class="col-sm-5">
							<div class="text-right hm-rewards">
								<img src="images/rewards1.png">
							</div>
						</div>
						<div class="col-sm-7">
							<div class="what-in-it-text">
								<h1 class="title1"><?php echo $data['title']; ?></h1>
								<?php echo $data['description']; ?>
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