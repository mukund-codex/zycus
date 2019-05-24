<?php
	include_once 'include/config.php';
	include_once 'include/admin-functions.php';
	include('../smtp/class.phpmailer.php');
	$func = new AdminFunctions();

	$pageName = "Redeem Activity";
	$parentPageURL = 'redeem-activity-master.php';
	$pageURL = 'add-redeem-activity.php';

	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: admin-login.php");
		exit();
	}
		
	if(isset($_POST['register'])){

		$userDetails = $func->getUserById($_POST['email']);
        
		$rewardDetails = $func->getUniqueRewardById($_POST['activity']);

		include('user-redeem-activity.inc.php');

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
		
        $func->addRedeemActivity($_POST);
        header("location: redeem-activity-master.php?registersuccess");
	}
	if(isset($_GET['edit'])){
		$id = $func->escape_string($func->strip_all($_GET['id']));
        $data = $func->getRedeemActivityById($id);
    }
    
    if(isset($_POST['update'])){
        $func->updateRedeemActivity($_POST);
        header("location: redeem-activity-master.php?updatesuccess");
    }   
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo TITLE ?></title>
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/londinium-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/styles.min.css" rel="stylesheet" type="text/css">
	<link href="css/icons.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
	
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/nanoscroller.css" rel="stylesheet">
	<link href="css/emoji.css" rel="stylesheet">
	<link href="css/cover.css" rel="stylesheet">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/plugins/charts/sparkline.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/uniform.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/select2.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/inputmask.js"></script>
	<script type="text/javascript" src="js/plugins/forms/autosize.js"></script>
	<script type="text/javascript" src="js/plugins/forms/inputlimit.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/listbox.js"></script>
	<script type="text/javascript" src="js/plugins/forms/multiselect.js"></script>
	<script type="text/javascript" src="js/plugins/forms/validate.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/tags.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/switch.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/uploader/plupload.full.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/uploader/plupload.queue.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
	<script type="text/javascript" src="js/plugins/forms/wysihtml5/toolbar.js"></script>
	<script type="text/javascript" src="js/plugins/interface/daterangepicker.js"></script>
	<script type="text/javascript" src="js/plugins/interface/fancybox.min.js"></script>
	<script type="text/javascript" src="js/plugins/interface/moment.js"></script>
	<script type="text/javascript" src="js/plugins/interface/jgrowl.min.js"></script>
	<script type="text/javascript" src="js/plugins/interface/datatables.min.js"></script>
	<script type="text/javascript" src="js/plugins/interface/colorpicker.js"></script>
	<script type="text/javascript" src="js/plugins/interface/fullcalendar.min.js"></script>
	<script type="text/javascript" src="js/plugins/interface/timepicker.min.js"></script>
	<script type="text/javascript" src="js/plugins/interface/collapsible.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/application.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#form").validate({
				rules: {
					email:{
						required:true,
					},					
					category:{
						required:true
					},
					activity:{
						required:true,
					},
					points: {
						required:true,
					},
				}
			});
			jQuery.validator.addMethod("letterswithspaceonly", function(value, element) {
			return this.optional(element) || /^[^-\s][a-zA-Z\s-]+$/i.test(value);
			}, "Please enter valid value");
		});
	</script>
</head>
<body class="sidebar-wide">
	<?php include 'include/navbar.php' ?>

	<div class="page-container">

		<?php include 'include/sidebar.php' ?>

		<div class="page-content">

		<div class="breadcrumb-line">
			<div class="page-ttle hidden-xs" style="float:left;">
<?php
				if(isset($_GET['edit'])){ ?>
					<?php echo 'Edit '.$pageName; ?>
<?php			} else { ?>
					<?php echo 'Add New '.$pageName; ?>
<?php			} ?>
			</div>
			<ul class="breadcrumb">
				<li><a href="banner-master.php">Home</a></li>
				<li><a href="<?php echo $parentPageURL; ?>"><?php echo $pageName; ?></a></li>
				<li class="active">
<?php
				if(isset($_GET['edit'])){ ?>
					<?php echo 'Edit '.$pageName; ?>
<?php			} else { ?>
					<?php echo 'Add New '.$pageName; ?>
<?php			} ?>
				</li>
			</ul>
		</div>

		<a href="<?php echo $parentPageURL; ?>" class="label label-primary">Back to <?php echo $pageName; ?></a><br/><br/>
<?php
		if(isset($_GET['registersuccess'])){ ?>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-checkmark3"></i> <?php echo $pageName; ?> successfully added.
			</div><br/>
<?php	} ?>
	
<?php
		if(isset($_GET['registerfail'])){ ?>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-close"></i> <strong><?php echo $pageName; ?> not added.</strong> <?php echo $func->escape_string($func->strip_all($_GET['msg'])); ?>.
			</div><br/>
<?php	} ?>

<?php
		if(isset($_GET['updatesuccess'])){ ?>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-checkmark3"></i> <?php echo $pageName; ?> successfully updated.
			</div><br/>
<?php	} ?>
	
<?php
		if(isset($_GET['updatefail'])){ ?>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-close"></i> <strong><?php echo $pageName; ?> not updated.</strong> <?php echo $func->escape_string($func->strip_all($_GET['msg'])); ?>.
			</div><br/>
<?php	} ?>
			<form role="form" action="" method="post" id="form" enctype="multipart/form-data">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6 class="panel-title"><i class="icon-library"></i>User Details</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div class="row">
								<div class="col-sm-3">
									<label>User Email<span style="color:red">*</span></label>
									<select class="select-multiple" name="email" id="email">
										<option value="">Select</option>
										<?php 
											$select = $func->query("select * from ".PREFIX."user_master where active = '1' and isdelete != '1'");
											while($res = $func->fetch($select)){ ?>
												<option value="<?php echo $res['id']; ?>"><?php echo $res['email']; ?></option>
										<?php }
										?>
									</select>			
							    </div>
								<div class="col-sm-3">
									<label>Category<span style="color:red">*</span></label>
									<select class="select-multiple" name="category" id="category" onchange="getDetails();">
										<option value="">Select</option>
										<?php
											$select = $func->query("select * from ".PREFIX."category_master ");
											while($res = $func->fetch($select)){ ?> 
												<option value="<?php echo $res['id']; ?>"><?php echo $res['category_name']; ?></option>
										<?php }
										?>		
									</select>
								</div>  
								<div class="col-sm-3">
									<label>Activity<span style="color:red">*</span></label>
									<select class="select-multiple" name="activity" id="activity" onchange=getPoints();>
									</select>
								</div>                  
							</div>
						</div>	
						
						
					</div>
				</div>
				<div class="form-actions text-right">
				<input type="hidden" name="createdby" id="createdby" value="<?php echo $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname']; ?>" />
<?php
			if(isset($_GET['edit'])){ ?>
					<input type="hidden" class="form-control" name="id" id="" required="required" value="<?php echo $id ?>"/>
					<button type="submit" name="update" class="btn btn-warning"><i class="icon-pencil"></i>Update <?php echo $pageName; ?></button>
<?php		} else { ?>
					<button type="submit" name="register" class="btn btn-danger"><i class="icon-signup"></i>Add <?php echo $pageName; ?></button>
<?php		} ?>
				</div>
			</form>

<?php 	include "include/footer.php"; ?>
    
		</div>
	</div>
	
	<link href="css/crop-image/cropper.min.css" rel="stylesheet">
	<script src="js/crop-image/cropper.min.js"></script>
	<script src="js/crop-image/image-crop-app.js"></script>
	<script>
	$(document).ready(function() {
		$('input[name="image_name"]').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (484 / 313));
		});
		$('input[name="image_name2"]').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (1300 / 300));
		});

		$(document).on("focusout","#email",function(){
			var email = $("#email").val();
			console.log(email);
			$.ajax({
                type: "POST",
                url: "checkEmail.inc.php",
                data: {email:email,},               
                success: function(response) {
                    console.log(response);  
					if(response == 'exists'){
						$('#email-error').show();
					}else{
						$('#email-error').hide();
					} 
                }
            });
		});

	});

	function getDetails(){
		var userid = $("#email").val();
		var category = $("#category").val();
		console.log(category);
		console.log(userid);
		var element = document.getElementById("activity");
		element.innerHTML = '';
		
		$.ajax({
		    type: "POST",
		    url: "getRedeembyCategory.inc.php",
		    data: {category:category, userid:userid},               
		    success: function(response) {
		        console.log(response);  
				var data = JSON.parse(response);
				element.innerHTML += data.activity;          
		    }
		});
	}

	</script>
	
</body>
</html>