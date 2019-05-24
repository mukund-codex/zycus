<?php

	include('site-config.php');
	//print_r($_SESSION);exit;
	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: login.php");
		exit();
	}
	$total = 0;
	$categorysql = $func->query("select * from ".PREFIX."category_master where active = '1' order by display_order ASC ");

	$already = $func->query("select SUM(count) as count, activity from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and approved = 'Approved' group by activity");

	$total = $func->fetch($func->query("select points from ".PREFIX."user_master where id = '".$loggedInUserDetailsArr['id']."' "));

	$totalpoints = $total['points'];
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
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>
<body>
	<!--Main Start Code Here-->

	<div class="wrapper">
		
		<?php include('include/header1.php') ?>

		<main>
			<!-- login sec -->
			<section class="dashboard-sec border-top">
				<div class="container">
					<ul class="tab-top-ul">						
						<li><a href="dashboard-engage.php"><img src="images/earn-points.png"> Engage & Earn Points</a></li>
						<li class="active"><a href="dashboard.php"><img src="images/my-points.png"> My Points</a></li>
						<li><a href="dashboard-redeem.php"><img src="images/redeem.png"> Redeem your Points</a></li>
					</ul>
					<div class="headind-l">
						<div class="heading pull-left">
							<h3>My Points</h3>
						</div>
						<div class="coin-count pull-right">
							<div class="total-points">
								<div class="row">
									<div class="col-xs-9 col-sm-9 col-md-9">
										<img src="images/coins.png"> <span class="ct-txt" style="font-size:19px;">Available <strong>Points</strong></span>
									</div>
									<div class="col-xs-3 col-sm-3 col-md-3 bor-left">
										<span style="font-size:24px;"><?php echo $totalpoints; ?></span>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="content-box">
						<div class="row">
							<div class="col-md-3">
								<div class="category" id="div1">
								<span class="mob-cat-btn">
								<i class="fa fa-list-alt" aria-hidden="true" id="ishow"></i>
								<i class="fa fa-times" aria-hidden="true" id="ihide" style="display:none;"></i>
								</span>
									<h1>Categories</h1>
									<label class="container1">All
									  	<input type="checkbox" id="allcategory" name="category[]" checked="checked" value="all">
									  	<span class="checkmark"></span>
									</label>
									<?php while($res = $func->fetch($categorysql)){ ?>
										<label class="container1"><?php echo $res['category_name']; ?>
										<input type="checkbox" class="unchecked" name="category[]" value="<?php echo $res['id']; ?>">
										<span class="checkmark"></span>
								  		</label>
									<?php } ?>
								</div>
							</div>
							<div class="col-md-9">
								<div class="my-points-text" id="div2" style="height: auto !important;">
								<div id="show">
									<?php
									$already1 = $func->query("select SUM(count) as count, activity from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and approved = 'Approved' group by activity");
									while($row = $func->fetch($already1)){ 
										$getActivity = $func->fetch($func->query("select * from ".PREFIX."activity_master where id = '".$row['activity']."' "));
										$points = $row['count'] * $getActivity['points'];
										?>
										
											<div class="my-points-box">
												<div class="row">
													<div class="pt-bx col-sm-6 col-md-6">
														<h4><?php echo $getActivity['activity_name']; ?></h4>
														<p class=""><?php echo $getActivity['description']; ?></p>
													</div>
													<div class="pt-bx col-sm-3 col-md-3 text-center">
														<p>Activity count</p>
														<h1 class="blue"><?php echo $row['count']; ?></h1>
													</div>
													<div class="col-sm-3 col-md-3 bor-left">
														<p>Points earned</p>
														<h1 class="orange"><?php echo $points; ?></h1>
													</div>
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
<script src="js/jquery.fancybox.min.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<script>

	$( document ).ready(function() {

		$('#allcategory').click(function() {
		if($('#allcategory'). prop("checked") == true){
			$('input[name="category[]"]').not('#allcategory').removeAttr('checked');
			$('#allcategory').setAttribute("checked", "checked");
		}
		});

		$('input[name="category[]"]').click(function() {
			if($('input[name="category[]"]'). prop("checked") == true){
				$('#allcategory').removeAttr('checked');
			}
		});

	});
	
	

	$("input[name='category[]']").click(mypoints);

	function mypoints(){
		var category = [];
            $.each($("input[name='category[]']:checked"), function(){            
                category.push($(this).val());
            });
		console.log(category);
		var element = document.getElementById("show");
		element.innerHTML = '';
		$.ajax({
		    type: "POST",
		    url: "myPointsData.inc.php",
		    data: {category:category},               
		    success: function(response) {
		        console.log(response);  
				var data = JSON.parse(response)
				element.innerHTML += data.display;              
		    }
		});
	}

</script>

</body>
</html>