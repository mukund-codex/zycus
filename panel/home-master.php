<?php
	include_once 'include/config.php';
	include_once 'include/admin-functions.php';
	$func = new AdminFunctions();

	error_reporting(E_ALL);
	ini_set("display_errors","ON");

	$pageName = "Home Page";
	$pageURL = 'home-master.php';
	$addURL = 'home-carousel-add.php';
	$deleteURL = 'home-carousel-delete.php';
	$tableName = 'home_carousel';

	if(!$loggedInUserDetailsArr = $func->sessionExists()){
		header("location: admin-login.php");
		exit();
	}

	//include_once 'csrf.class.php';
	$csrf = new csrf();
	$token_id = $csrf->get_token_id();
	$token_value = $csrf->get_token($token_id);

	if(isset($_GET['page']) && !empty($_GET['page'])) {
		$pageNo = trim($func->strip_all($_GET['page']));
	} else {
		$pageNo = 1;
	}
	$linkParam = "";


	$query = "SELECT COUNT(*) as num FROM ".PREFIX.$tableName;
	$total_pages = $func->fetch($func->query($query));
	$total_pages = $total_pages['num'];
	
	if(isset($_POST['update'])) {
		$id = trim($func->escape_string($func->strip_all($_POST['id'])));
		$result = $func->updateWelcomeContent($_POST);
		header("location:".$pageURL."?updatesuccess");
		exit;
	}
	if(isset($_POST['update_detailing'])) {
		$id = trim($func->escape_string($func->strip_all($_POST['id'])));
		$result = $func->updateHomeDetailingContent($_POST, $_FILES);
		header("location:".$pageURL."?updatesuccess");
		exit;
	}
	if(isset($_POST['update_rewards'])) {
		$id = trim($func->escape_string($func->strip_all($_POST['id'])));
		$result = $func->updateRewardsContent($_POST, $_FILES);
		header("location:".$pageURL."?updatesuccess");
		exit;
	}

	include_once "include/pagination.php";
	$pagination = new Pagination();
	$paginationArr = $pagination->generatePagination($pageURL, $pageNo, $total_pages, $linkParam);
	$qry = $func->query("SELECT * FROM ".PREFIX."gallery_content where id='1' ");
	$data = $func->fetch($qry);
	// $sql = "SELECT * FROM ".PREFIX.$tableName." order by created DESC LIMIT ".$paginationArr['start'].", ".$paginationArr['limit']."";
	$sql = "SELECT * FROM ".PREFIX.$tableName." order by display_order ASC";
	$results = $func->query($sql);

	

	
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo TITLE ?></title><link rel="shortcut icon" href="favicon.ico" type="image/x-icon"><link rel="icon" href="favicon.ico" type="image/x-icon">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/londinium-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/styles.min.css" rel="stylesheet" type="text/css">
	<link href="css/icons.min.css" rel="stylesheet" type="text/css">

	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!--<link href="css/nanoscroller.css" rel="stylesheet">
	<link href="css/cover.css" rel="stylesheet">-->

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery.1.10.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.1.10.2.min.js"></script>
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
</head>
<body class="sidebar-wide">
	<?php include 'include/navbar.php' ?>

	<div class="page-container">

		<?php include 'include/sidebar.php' ?>

 		<div class="page-content">

			<div class="breadcrumb-line">
				<div class="page-ttle hidden-xs" style="float:left;"><?php echo $pageName; ?></div>
				<ul class="breadcrumb">
					<li><a href="banner-master.php">Home</a></li>
					<li class="active"><?php echo $pageName; ?></li>
				</ul>
			</div>
		<br/>
	
	<?php
		if(isset($_GET['deletesuccess'])){ ?>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-checkmark"></i> <?php echo $pageName; ?> successfully deleted.
			</div><br/>
	<?php	} ?>
	<?php
		if(isset($_GET['updatesuccess'])){ ?>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-checkmark"></i> Home Content successfully updated.
			</div><br/>
	<?php	} ?>
	
	<?php
		if(isset($_GET['deletefail'])){ ?>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<i class="icon-close"></i> <strong><?php echo $pageName; ?> not deleted.</strong> Invalid Details.
			</div><br/>
	<?php	} ?>
				<div class="panel panel-default">
			<form role="form" action="" method="post" id="formWelcome" enctype="multipart/form-data">
			<div class="panel panel-default">
					<div class="panel-heading">
						<h6 class="panel-title"><i class="icon-library"></i>Zycus Praemia Program Content</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
						<div class="row">
								<div class="col-sm-3">
									<label>Title <span style="color:red">*</span> </label>
									<input type="text"  class="form-control"  name="title" value="<?php if(!empty($data['title'])){ echo $data['title']; }?>" />
								</div>
								<div class="col-sm-3">
									<label>Sub Title <span style="color:red">*</span> </label>
									<input type="text"  class="form-control"  name="subtitle" value="<?php if(!empty($data['subtitle'])){ echo $data['subtitle']; }?>" />
								</div>
							</div><br>
							<div class="row">
								<div class="col-sm-12">
									<label>Description <span style="color:red">*</span> </label>
									<textarea col="5" rows="4"  class="form-control"  name="description" id="" /><?php if(!empty($data['description'])){ echo $data['description']; }?></textarea>
								</div>
							</div><br>
							<input type="hidden" name="<?php echo $token_id; ?>" value="<?php echo $token_value; ?>" />
							<input type="hidden" name="id" value="<?php echo $data['id'];  ?>">
							<button type="submit" name="update" class="btn btn-danger" style="float:right">Update <?php echo $pageName; ?></button>
						</div>	
					</div>
					
				</div>
			</form>
			<br/>
			<form role="form" action="" method="post" id="formdetailing" enctype="multipart/form-data">
			<div class="panel panel-default">
					<div class="panel-heading">
						<h6 class="panel-title"><i class="icon-library"></i>Ways to earn your points</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
					<?php	$qry1 = $func->query("SELECT * FROM ".PREFIX."gallery_content where id='3'");
							$data1 = $func->fetch($qry1);

					 ?>
					 		<div class="row">
								<div class="col-md-6">
									<label>Title<span style="color:red">*</span></label>
									<input type="text" class="form-control" name="title" id="title" value="<?php if(!empty($data1['title'])) { echo $data1['title']; } ?>"/>
								</div>
								<div class="col-sm-6">
									<label>Image <span style="color:red">*</span></label>
									<input type="file" class="form-control" name="image" id="image" accept="image/jpg,image/png,image/jpeg" id="" data-image-index="0" value="<?php echo $data1['image'] ?>" />
									<span class="help-text">
										Files must be less than <strong>3 MB</strong>.<br>
										Allowed file types: <strong>png jpg jpeg</strong>.<br>
										Images must be exactly <strong>472x378</strong> pixels.
									</span>
									<br>
									<?php
										$file_name = str_replace('', '-', strtolower( pathinfo($data1['image'], PATHINFO_FILENAME)));
										$ext = pathinfo($data1['image'], PATHINFO_EXTENSION);
									?>
										<img src="../images/<?php echo $file_name.'_crop.'.$ext ?>" width="100"  />
									
								</div> 
							</div>							
							<br>
							<div class="row">
								<div class="col-sm-12">
									<label>Description <span style="color:red">*</span> </label>
									<textarea col="5" rows="4"  class="form-control" name="detailing" id="" /><?php if(!empty($data1['description'])){ echo $data1['description']; }?></textarea>
								</div>
							</div><br>
							<input type="hidden" name="<?php echo $token_id; ?>" value="<?php echo $token_value; ?>" />
							<input type="hidden" name="id" value="<?php echo $data1['id'];  ?>">
							<button type="submit" name="update_detailing" class="btn btn-danger" style="float:right">Update Detailing</button>
						</div>	
					</div>
					
				</div>
			</form>

			<form role="form" action="" method="post" id="rewardsform" enctype="multipart/form-data">
			<div class="panel panel-default">
					<div class="panel-heading">
						<h6 class="panel-title"><i class="icon-library"></i>What’s in it for you?</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
					<?php	$qry1 = $func->query("SELECT * FROM ".PREFIX."gallery_content where id='4'");
							$data1 = $func->fetch($qry1);

					 ?>
					 		<div class="row">
								<div class="col-md-6">
									<label>Title<span style="color:red">*</span></label>
									<input type="text" class="form-control" name="title" id="title" value="<?php if(!empty($data1['title'])) { echo $data1['title']; } ?>"/>
								</div>
								<div class="col-sm-6">
									<label>Image <span style="color:red">*</span></label>
									<input type="file" class="form-control" name="images" id="images" accept="image/jpg,image/png,image/jpeg" id="" data-image-index="0"  value="<?php echo $data1['image'] ?>" />
									<span class="help-text">
										Files must be less than <strong>3 MB</strong>.<br>
										Allowed file types: <strong>png jpg jpeg</strong>.<br>
										Images must be exactly <strong>322x326</strong> pixels.
									</span>
									<br>
									<?php
										$file_name = str_replace('', '-', strtolower( pathinfo($data1['image'], PATHINFO_FILENAME)));
										$ext = pathinfo($data1['image'], PATHINFO_EXTENSION);
									?>
										<img src="../images/<?php echo $file_name.'_crop.'.$ext ?>" width="100"  />
									
								</div> 
							</div>							
							<br>
							<div class="row">
								<div class="col-sm-12">
									<label>Description <span style="color:red">*</span> </label>
									<textarea col="5" rows="4"  class="form-control" required  name="descriptions" id="" /><?php if(!empty($data1['description'])){ echo $data1['description']; }?></textarea>
								</div>
							</div><br>
							<input type="hidden" name="<?php echo $token_id; ?>" value="<?php echo $token_value; ?>" />
							<input type="hidden" name="id" value="<?php echo $data1['id'];  ?>">
							<button type="submit" name="update_rewards" class="btn btn-danger" style="float:right">Update Rewards</button>
						</div>	
					</div>
					
				</div>
			</form>
		

			<div class="row">
				<div class="col-md-12 clearfix">
					<nav class="pull-right">
						<?php //echo $paginationArr['paginationHTML']; ?>
					</nav>
				</div>
			</div>

<?php 	include "include/footer.php"; ?>

		</div>

	</div>

	<link href="css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="js/editor/ckeditor/ckeditor.js"></script>
 	<script type="text/javascript" src="js/editor/ckfinder/ckfinder.js"></script>
	<link href="css/crop-image/cropper.min.css" rel="stylesheet">
	<script src="js/crop-image/cropper.min.js"></script>
	<script src="js/crop-image/image-crop-app.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			jQuery.validator.addMethod("lettersonly", function(value, element) {
				return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
			}, "Please enter letters without space");

			$("#formWelcome").validate({
				rules: {
					title:{
						required: true,
					},
					subtitle: {
						required: true,
					},					
					description:{
						required:true
					},
				}
			});

			$("#formdetailing").validate({
				rules: {
					title:{
						required: true,
					},
					image: {
						extension: 'jpg|jpeg|png',
					},					
					detailing:{
						required:true,
					},
				}
			});

			$("#rewardsform").validate({
				rules: {
					title: {
						required: true,
					},
					images: {
						extension: 'jpg|jpeg|png',
					},
					descriptions: {
						required: true,
					},
				}
			});
		});
	</script>

	<script type="text/javascript">
		$('#img').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (387 / 334));
		});
		$('#image').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (472 / 378));
		});
		$('#images').change(function(){
			// loadImageInModal(this);
			loadImagePreview(this, (322 / 326));
		});
		$("#formWelcome").submit( function(e) {
           var messageLength = CKEDITOR.instances['description'].getData().replace(/<[^>]*>/gi, '').length;
           if( !messageLength ) {
               alert( 'Please enter Description' );
               e.preventDefault();
           }
       });
	   $("#formdetailing").submit( function(e) {
           var messageLength = CKEDITOR.instances['detailing'].getData().replace(/<[^>]*>/gi, '').length;
           if( !messageLength ) {
               alert( 'Please enter Description' );
               e.preventDefault();
           }
       });
		var editor = CKEDITOR.replace( 'description', {
			height: 200,
			filebrowserImageBrowseUrl : 'js/editor/ckfinder/ckfinder.html?type=Images',
			filebrowserImageUploadUrl : 'js/editor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			toolbarGroups: [
				
				{"name":"document","groups":["mode"]},
				{"name":"clipboard","groups":["undo"]},
				{"name":"basicstyles","groups":["basicstyles"]},
				{"name":"links","groups":["links"]},
				{"name":"paragraph","groups":["list"]},
				{"name":"insert","groups":["insert"]},
				{"name":"insert","groups":["insert"]},
				{"name":"styles","groups":["styles"]},
				{"name":"paragraph","groups":["align"]},
				{"name":"about","groups":["about"]},
				{"name":"colors","tems": [ 'TextColor', 'BGColor' ] },
			],
			removeButtons: 'Iframe,Flash,Strike,Smiley,Subscript,Superscript,Anchor,Specialchar'
		} );
		var editor = CKEDITOR.replace( 'detailing', {
			height: 200,
			filebrowserImageBrowseUrl : 'js/editor/ckfinder/ckfinder.html?type=Images',
			filebrowserImageUploadUrl : 'js/editor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			toolbarGroups: [
				
				{"name":"document","groups":["mode"]},
				{"name":"clipboard","groups":["undo"]},
				{"name":"basicstyles","groups":["basicstyles"]},
				{"name":"links","groups":["links"]},
				{"name":"paragraph","groups":["list"]},
				{"name":"insert","groups":["insert"]},
				{"name":"insert","groups":["insert"]},
				{"name":"styles","groups":["styles"]},
				{"name":"paragraph","groups":["align"]},
				{"name":"about","groups":["about"]},
				{"name":"colors","tems": [ 'TextColor', 'BGColor' ] },
			],
			removeButtons: 'Iframe,Flash,Strike,Smiley,Subscript,Superscript,Anchor,Specialchar'
		} );
		var editor = CKEDITOR.replace( 'descriptions', {
			height: 200,
			filebrowserImageBrowseUrl : 'js/editor/ckfinder/ckfinder.html?type=Images',
			filebrowserImageUploadUrl : 'js/editor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			toolbarGroups: [
				
				{"name":"document","groups":["mode"]},
				{"name":"clipboard","groups":["undo"]},
				{"name":"basicstyles","groups":["basicstyles"]},
				{"name":"links","groups":["links"]},
				{"name":"paragraph","groups":["list"]},
				{"name":"insert","groups":["insert"]},
				{"name":"insert","groups":["insert"]},
				{"name":"styles","groups":["styles"]},
				{"name":"paragraph","groups":["align"]},
				{"name":"about","groups":["about"]},
				{"name":"colors","tems": [ 'TextColor', 'BGColor' ] },
			],
			removeButtons: 'Iframe,Flash,Strike,Smiley,Subscript,Superscript,Anchor,Specialchar'
		} );
		
		CKFinder.setupCKEditor( editor, '../' );
	</script>
	<script>
		$(document).ready(function() {
			$('.datatable-selectable-data table').dataTable({
				"order": [[ 0, 'asc' ]],
			});
		});
	</script>
</body>
</html>