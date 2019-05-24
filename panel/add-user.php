<?php
	include_once 'include/config.php';
	include_once 'include/admin-functions.php';
	include('../smtp/class.phpmailer.php');
	$admin = new AdminFunctions();

	$pageName = "User";
	$parentPageURL = 'user-master.php';
	$pageURL = 'add-user.php';

	if(!$loggedInUserDetailsArr = $admin->sessionExists()){
		header("location: admin-login.php");
		exit();
	}
		
	if(isset($_POST['register'])){

		$admin->addUser($_POST);
		
		include("new-user-creation.inc.php");

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
		$mail->AddAddress($_POST['email']);
		$mail->IsHTML(true);
		$mail->Subject = SITE_NAME." New User Creation";
		$mail->Body = $emailMsg;
		$mail->send();
        header("location: user-master.php?registersuccess");
	}

	if(isset($_GET['edit'])){
		$id = $admin->escape_string($admin->strip_all($_GET['id']));
		$data = $admin->getUserById($id);
	}
	
    if(isset($_POST['id'])){
        $admin->updateUser($_POST);
        header("location: user-master.php?updatesuccess");
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

			jQuery.validator.addMethod("lettersonly", function(value, element) {
				return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
			}, "Please enter letters without space");

			$("#form").validate({
				rules: {
					fname:{
						required: true,
					},
					email: {
						required: true,
						remote:{
							url: "check-email.php",
							type: "post",
							<?php if(isset($_GET['edit'])){ ?>
							data: {
								id: function() {
									return $( "#id" ).val();
								}
							}
							<?php } ?>
						},
						email:true
					},
					lname: {
						required: true,
						lettersonly: true,
					},					
					active:{
						required:true
					},
					display_order:{
						required:true,
						number:true
					},
					mobile: {
						number: true,
						maxlength: 10,
						minlength: 10,
					},
					image_name: {
						extension: 'jpg|jpeg|png'
					},
					image_name2: {
						extension: 'jpg|jpeg|png'
					},
				},
				messages: {
					email: {
						remote: "This email id already exists"
					}
				}
			});
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
				<i class="icon-close"></i> <strong><?php echo $pageName; ?> not added.</strong> <?php echo $admin->escape_string($admin->strip_all($_GET['msg'])); ?>.
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
				<i class="icon-close"></i> <strong><?php echo $pageName; ?> not updated.</strong> <?php echo $admin->escape_string($admin->strip_all($_GET['msg'])); ?>.
			</div><br/>
<?php	} ?>
			<form role="form" method="post" id="form" enctype="multipart/form-data">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6 class="panel-title"><i class="icon-library"></i>User Details</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div class="row">
								<div class="col-sm-3">
									<label>User ID</label>
									<input type="text" name="userid" id="userid" class="form-control" value="<?php  if(isset($_GET['edit'])){ echo $data['userid']; } ?>" readonly>
								</div>
								<div class="col-sm-3">
									<label>First Name <span style="color:red">*</span></label>
									<input type="text" class="form-control" id ="fname" name="fname" value="<?php if(isset($_GET['edit'])){ echo $data['fname']; }  ?>" >			
							    </div>
                                <div class="col-sm-3">
									<label>Last Name <span style="color:red">*</span></label>
									<input type="text" class="form-control" id ="lname" name="lname" value="<?php if(isset($_GET['edit'])){ echo $data['lname']; }  ?>" >			
							    </div>
                                <div class="col-sm-3">
									<label>Email <span style="color:red">*</span></label>
									<input type="email" class="form-control" id ="email" name="email" value="<?php if(isset($_GET['edit'])){ echo $data['email']; }  ?>" >	
							    </div>     
								                      
							</div>
                            <br>
                            <div class="row">
								<div class="col-sm-3">
									<label>Mobile <span style="color:red">*</span></label>
									<input type="text" class="form-control" id ="mobile" name="mobile" value="<?php if(isset($_GET['edit'])){ echo $data['mobile']; }  ?>" >			
							    </div>  
								<div class="col-sm-3">
									<label>Points</label>
									<input type="text" name="points" id="points" class="form-control" value="<?php if(isset($_GET['edit'])){ echo $data['points']; }  ?>" readonly/>
								</div>
                                <div class="col-sm-3">
									<label>Password <span style="color:red">*</span></label>
									<input type="password" class="form-control" id ="password" name="password" <?php if(!isset($_GET['edit'])){
                                        echo " required"; } ?> >			
							    </div>
                                <div class="col-sm-3">
                                    <label>Active <span style="color:red;">*</span></label>
                                    <select class="form-control" name="active" id="active">
                                        <option value="">Select</option>
                                        <option value="1" <?php if(isset($_GET['edit']) && $data['active'] == '1'){ echo "selected"; } ?>>Yes</option>
                                        <option value="0" <?php if(isset($_GET['edit']) && $data['active'] == '0'){ echo "selected"; } ?>>No</option>
                                    </select>
                                </div>
                            </div>
                            <br>						
							
						</div>	
						
						
					</div>
				</div>
				<div class="form-actions text-right">
				<input type="hidden" name="createdby" value="<?php echo $loggedInUserDetailsArr['fname']." ".$loggedInUserDetailsArr['lname']; ?>" />
<?php
			if(isset($_GET['edit'])){ ?>
					<input type="hidden" class="form-control" name="id" id="id" required="required" value="<?php echo $id ?>"/>
					<button type="submit" name="updated" id="updated" class="btn btn-warning"><i class="icon-pencil"></i>Update <?php echo $pageName; ?></button>
<?php		} else { ?>
					<button type="submit" name="register" id="register" class="btn btn-danger"><i class="icon-signup"></i>Add <?php echo $pageName; ?></button>
<?php		} ?>
				</div>
			</form>

<?php 	include "include/footer.php"; ?>
    
		</div>
	</div>
	
	<!-- <script src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/additional-methods.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script> -->
	<link href="css/crop-image/cropper.min.css" rel="stylesheet">
	<script src="js/crop-image/cropper.min.js"></script>
	<script src="js/crop-image/image-crop-app.js"></script>
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery.dataTables.js" type="text/javascript"></script>
	<script>

	$(document).ready(function() {
		
		// $("#form").validate({ 
		// rules: { 
		// 	fname: { 
		// 		required:true, 
		// 		lettersonly: true 
		// 	}, 
		// 	lname: { 
		// 		required:true, 
		// 		lettersonly: true 
		// 	},  
		// }, 
		// 	messages:{ 
		// 		fname : { 
		// 		required: 'Please enter First Name' 
		// 	}, 
		// 	lname : { 
		// 		required: 'Please enter Last Name' 
		// 	}, 
		// }
		// });
		
		// jQuery.validator.addMethod("lettersonly", function(value, element) {
		// 	return this.optional(element) || /^[a-zA-Z ]+$/i.test(value);
		// }, "Letters only please");

		$('input[name="image_name"]').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (484 / 313));
		});
		$('input[name="image_name2"]').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (1300 / 300));
		});
		
		<?php /* if(!isset($_GET['edit'])){ ?>
			$("#register").button().click(function(){
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
		<?php } */ ?>

	});
	</script>
	
</body>
</html>