<?php

	include('site-config.php');
	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: login.php");
		exit();
	}

	$categorysql = $func->query("select * from ".PREFIX."category_master where active = '1' order by display_order ASC ");

	$countAll = $func->query("select count(*) as count from ".PREFIX."redeem_master where active = '1' and isdelete != '1' ");
	$resall = $func->fetch($countAll);

	$allsql = $func->query("select * from ".PREFIX."redeem_master where active = '1' and isdelete != '1' order by id DESC ");

	$requested = $func->fetch($func->query("select count(*) as count from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'requested' and approved = ''  "));

	$approved = $func->fetch($func->query("select count(*) as count from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'requested' and approved = 'Approved' "));

	$rejected = $func->fetch($func->query("select count(*) as count from ".PREFIX."redeem_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'requested' and approved = 'Rejected' "));

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

					<?php if(isset($_GET['success'])){ ?>
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<i class="icon-checkmark3"></i> Activity successfully updated.
						</div><br/>
					<?php } ?>

					<ul class="tab-top-ul">
						<li><a href="dashboard-engage.php"><img src="images/earn-points.png"> Engage & Earn Points</a></li>
						<li><a href="dashboard.php"><img src="images/my-points.png"> My Points</a></li>						
						<li class="active"><a href="dashboard-redeem.php"><img src="images/redeem.png"> Redeem your Points</a></li>
					</ul>
					<div class="headind-l">
						<div class="heading width100 pull-left">
							<h3>Redeem your Points</h3>
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
								<div class="my-points-text" id="div2">
									<div class="">
										<ul class="sub-tabs-ul pull-left">
											<li id="all">
												<label for="all" class="activityClass">
													<a class="activityBtn" >All (<?php echo $resall['count']; ?>)</a>
													<input type="radio" name="all" id="allr" value="all" hidden checked>
												</label>
											</li>
											<li id="requested">
												<label for="all1" class="activityClass">
													<a class="activityBtn" >Requested (<?php echo $requested['count']; ?>)</a>
													<input type="radio" name="all" id="allrr" value="requested" hidden>
												</label>
											</li>
											<li id="redeemed">
												<label for="all1" class="activityClass">
													<a class="activityBtn" >Redeemed (<?php echo $approved['count']; ?>)</a>
													<input type="radio" name="all" id="allrr" value="Approved" hidden>
												</label>
											</li>
											<li id="rejected">
												<label for="all1" class="activityClass">
													<a class="activityBtn" >Rejected (<?php echo $rejected['count']; ?>)</a>
													<input type="radio" name="all" id="allrr" value="Rejected" hidden>
												</label>
											</li>
										</ul>
										<div class="pull-right select-box">
											<select name="sortby" id="sortby">
												<option value="">Sort By</option>
												<option value="latest" selected>Latest</option>
												<option value="points">Points</option>
											</select>
										</div>
										<div class="clearfix"></div>
									</div>

									<div id="show">
									<?php while($row = $func->fetch($allsql)){ 
																				
										$class="disabled";
										$link = "#";
										$style="style='cursor: not-allowed;'";
										if($totalpoints >= $row['points']){
											$class= "active";
											$link = "request-to-claim.php?id=".$row['id'];
											$style="";
										}

										?>

										<div class="my-points-box cross engage">
											<div class="row">
												<div class="pt-bx col-sm-6 col-md-6">
													<h4><?php echo $row['reward_name'] ?></h4>
													<!-- <p class=""><?php echo $row['reward_name']; ?></p> -->
												</div>
												<div class="pt-bx col-sm-2 col-md-2 bor-left">
													<p>Points</p>
													<h1 class="orange"><?php echo $row['points']; ?></h1>
												</div>
												<div class="col-sm-4 col-md-4 bor-left text-center">
													<a href="<?php echo $link; ?>" class="req-claim <?php echo $class; ?>" <?php echo $style; ?> onclick="loader();" > Request To Claim </a>
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
<script src="js/index.js" type="text/javascript"></script>
<script>

	$( document ).ready(function() {

		//requested();

		$(".activityBtn").click(function() {
			$(this).closest('.activityClass').find("input[name='all']").click();
			requested();
		});
	});

	$("#sortby").change(function() {
		requested();
	})

	$('#allcategory').click(function() {
		if($('#allcategory'). prop("checked") == true){
			$('input[name="category[]"]').not('#allcategory').removeAttr('checked');
			//$('#allcategory').removeAttr('checked');
			$('#allcategory').setAttribute("checked", "checked");
		}
	});

	$('input[name="category[]"]').click(function() {
		if($('input[name="category[]"]'). prop("checked") == true){
			$('#allcategory').removeAttr('checked');
		}
	});

	$("input[name='category[]']").click(requested);

	function loader(){
		$(".req-claim").hide();
	}

	function requested(){
		var status = $("input[name='all']:checked").val();
		var category = [];
            $.each($("input[name='category[]']:checked"), function(){            
                category.push($(this).val());
            });
		var sort = $("#sortby").val();
		if(status == 'all'){
			$("#all").addClass("active");
			document.getElementById("requested").className = "";
			document.getElementById("redeemed").className = "";
			document.getElementById("rejected").className = "";
		}else if(status == 'requested'){	
			$("#requested").addClass("active");		
			document.getElementById("all").className = "";
			document.getElementById("redeemed").className = "";
			document.getElementById("rejected").className = "";
		}else if(status == 'Approved'){	
			$("#redeemed").addClass("active");		
			document.getElementById("all").className = "";
			document.getElementById("requested").className = "";
			document.getElementById("rejected").className = "";
		}else if(status == 'Rejected'){	
			$("#rejected").addClass("active");		
			document.getElementById("all").className = "";
			document.getElementById("requested").className = "";
			document.getElementById("redeemed").className = "";
		}
		var element = document.getElementById("show");
		element.innerHTML = '';
		$.ajax({
		    type: "POST",
		    url: "getRequestedData.inc.php",
		    data: {status:status, category:category, sort:sort},               
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