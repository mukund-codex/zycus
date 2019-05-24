<?php

	include('site-config.php');
	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: login.php");
		exit();
	}	

	$categorysql = $func->query("select * from ".PREFIX."category_master where active = '1' order by display_order ASC ");

	$countAll = $func->query("select count(*) as count from ".PREFIX."activity_master where active = '1' and isdelete != '1' ");
	$resall = $func->fetch($countAll);

	$allsql = $func->query("select * from ".PREFIX."activity_master where active = '1' and isdelete != '1' order by id DESC ");

	$already = $func->fetch($func->query("select count(*) as count from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'already done' and approved = 'Approved' "));

	$interested = $func->fetch($func->query("select count(*) as count from ".PREFIX."user_activity where userid = '".$loggedInUserDetailsArr['id']."' and status = 'interested' "));

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

	<style>

		.fancybox-content{
			width:600px !important;
		}
		
	</style>

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
						<li class="active"><a href="dashboard-engage.php"><img src="images/earn-points.png"> Engage & Earn Points</a></li>
						<li><a href="dashboard.php"><img src="images/my-points.png"> My Points</a></li>
						<li><a href="dashboard-redeem.php"><img src="images/redeem.png"> Redeem your Points</a></li>
					</ul>
					<div class="headind-l">
						<div class="heading width100 pull-left">
							<h3>Engage & Earn Points</h3>
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
													<input type="radio" name="all" id="all" value="all" hidden checked>
												</label>
											</li>
											<li id="already">
												<label for="all1" class="activityClass">
													<a class="activityBtn" >Already Done (<?php echo $already['count']; ?>)</a>
													<input type="radio" name="all" id="all1" value="already done" hidden>
												</label>
											</li>
											<li id="interested">
												<label for="all2" class="activityClass">
													<a class="activityBtn" >Interested (<?php echo $interested['count']; ?>)</a>
													<input type="radio" name="all" id="all2" value="interested" hidden>
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
									<?php while($row = $func->fetch($allsql)){ ?>

										<div class="my-points-box cross engage">
											<div class="row">
												<div class="pt-bx col-sm-7 col-md-7">
													<h4><?php echo $row['activity_name'] ?></h4>
													<p class=""><?php echo $row['description']; ?></p>
												</div>
												<div class="pt-bx col-sm-2 col-md-2 bor-left">
													<p>Points</p>
													<h1 class="orange"><?php echo $row['points']; ?></h1>
												</div>
												<div class="pt-bx col-sm-3 col-md-3 bor-left text-right">
													<a data-fancybox data-type="iframe" data-src="interested-pop.php?id=<?php echo $row['id']; ?>" href="javascript:;" class="interested-btn"> Interested </a>
													<a data-fancybox data-type="iframe" data-src="already-done-pop.php?id=<?php echo $row['id']; ?>" href="javascript:;" class="a-done-btn"> Already Done </a>
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
	<!-- remarksuccess-popup -->
	<!-- <button type="button" data-fancybox="thankyou" data-src="#thankyou" style="display: none"></button> -->
	<!-- thankyou -->
		<!-- <div style="display: none;" id="thankyou" class="text-center single-popup">
			<img src="<?php echo BASE_URL; ?>/images/icons/review-has-been-sent.svg" alt="" width="45"> -->
			<!-- <h5 class="red-text">Thank You!</h5>
			<h5 class="text-default">A Zycus representative will get in touch with you shortly.</h5>
		</div>  -->
	<!-- End thankyou -->
	<div id="myModal" class="modal" role="dialog">
		<div class="modal-dialog" id="custom" style="width:580px;margin: 325px auto;">

			<!-- Modal content-->
			<div class="modal-content" style="border-radius:0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal();" >&times;</button>
					<h4 class="modal-title">Thank You!</h4><br>
					<p>A Zycus representative will get in touch with you shortly.</p>
				</div>
			</div>

		</div>
	</div>
	<div class="modal-backdrop fade in" id="shade"></div>
	<!--Main End Code Here--> 

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/slick.min.js" type="text/javascript"></script>
<script src="js/jquery.fancybox.min.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<script>

	$( document ).ready(function() {
		$("#shade").hide();
		$.fancybox.defaults.hash = false;
		<?php if(isset($_GET['remarksuccess'])) { ?>			
			function my_onkeydown_handler( event ) { // F5 Key code
				switch (event.keyCode) {
					case 116 : // 'F5'
						event.preventDefault();
						event.keyCode = 0;
						console.log('blocked');
						break;
				}
			}
			$(document).bind('keypress keydown keyup', function(e) {
				if(e.which === 82 && e.ctrlKey) {    // Ctrl +R key code
					console.log('blocked');
					return false;
				}
			});   
			document.onkeydown = function (e) {  
				//return (e.which || e.keyCode) != 116; 
				if(e.which === 116 && e.ctrlKey) {    // Ctrl + F5 key code
					console.log('blocked');
					return false;
				} 
			};
			// document.addEventListener("keydown", my_onkeydown_handler);
			// $('[data-fancybox="thankyou"]').fancybox({
			// 	smallBtn : true,
			// 	fullScreen: false,
			// 	toolbar : false,
			// 	arrows : false,
			// 	infobar : false,
			// 	buttons: false,
			// 	touch: false,
			// 	clickSlide : false,
			// 	keyboard: false
			// }).trigger('click');
			$("#myModal").show();
			$("#shade").show();
		<?php } ?>

		

		allactivity();
		$(".activityBtn").click(function() {
			$(this).closest('.activityClass').find("input[name='all']").click();
			allactivity();
		});

		$('.a-done-btn').fancybox({
			toolbar  : false,
			smallBtn : true,
			iframe : {
				preload : false,
				css : {
					width : '600px',
					height : '400px'
				}
			}
		});

		$("#sortby").change(function() {
			allactivity();
		})

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

	function closeModal(){
		$("#myModal").hide();
		window.location = "dashboard-engage.php";
	}

	$("input[name='category[]']").click(allactivity);

	function allactivity(){
		var status = $("input[name='all']:checked").val();
		var category = [];
            $.each($("input[name='category[]']:checked"), function(){            
                category.push($(this).val());
            });
		var sort = $("#sortby").val();
		console.log(sort);
		var element = document.getElementById("show");
		element.innerHTML = '';
		if(status == 'all'){
			$("#all").addClass("active");
			document.getElementById("already").className = "";
			document.getElementById("interested").className = "";
		}else if(status == 'already done'){	
			$("#already").addClass("active");		
			document.getElementById("all").className = "";
			document.getElementById("interested").className = "";
		}else if(status == 'interested'){
			$("#interested").addClass("active");
			document.getElementById("already").className = "";
			document.getElementById("all").className = "";
		}
		
		$.ajax({
		    type: "POST",
		    url: "statusActivity.inc.php",
		    data: {status:status, category:category, sort:sort},               
		    success: function(response) {
		        // console.log(response);   
				var data = JSON.parse(response);
				element.innerHTML += data.display;             
		    }
		});
	}

</script>
</body>
</html>