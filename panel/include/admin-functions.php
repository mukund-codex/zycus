<?php
	include('database.php');
	include('SaveImage.class.php');
	include('include/classes/CSRF.class.php');
	error_reporting(0);
	/*
	 * AdminFunctions
	 * v1 - updated loginSession(), logoutSession(), adminLogin()
	 */
	class AdminFunctions extends Database {
		private $userType = 'admin';

		// === LOGIN BEGINS ===
		function loginSession($userId, $userFirstName, $userLastName, $userType,$role) {
			/* DEPRECATED $_SESSION[SITE_NAME] = array(
				$this->userType."UserId" => $userId,
				$this->userType."UserFirstName" => $userFirstName,
				$this->userType."UserLastName" => $userLastName,
				$this->userType."UserType" => $this->userType
			); DEPRECATED */
			$_SESSION[SITE_NAME][$this->userType."UserId"] = $userId;
			$_SESSION[SITE_NAME][$this->userType."UserFirstName"] = $userFirstName;
			$_SESSION[SITE_NAME][$this->userType."UserLastName"] = $userLastName;
			$_SESSION[SITE_NAME][$this->userType."UserType"] = $this->userType;
			$_SESSION[SITE_NAME][$this->userType."role"] = $role;

			/*switch($userType){
				case:'admin'{
					break;
				}
				case:'supplier'{
					break;
				}
				case:'warehouse'{
					break;
				}
				
			}*/
		}
		
		
		function logoutSession() {
			if(isset($_SESSION[SITE_NAME])){
				if(isset($_SESSION[SITE_NAME][$this->userType."UserId"])){
					unset($_SESSION[SITE_NAME][$this->userType."UserId"]);
				}
				if(isset($_SESSION[SITE_NAME][$this->userType."UserFirstName"])){
					unset($_SESSION[SITE_NAME][$this->userType."UserFirstName"]);
				}
				if(isset($_SESSION[SITE_NAME][$this->userType."UserLastName"])){
					unset($_SESSION[SITE_NAME][$this->userType."UserLastName"]);
				}
				if(isset($_SESSION[SITE_NAME][$this->userType."UserType"])){
					unset($_SESSION[SITE_NAME][$this->userType."UserType"]);
				}
				return true;
			} else {
				return false;
			}
		}
		function adminLogin($data, $successURL, $failURL = "admin-login.php?failed") {
			$username = $this->escape_string($this->strip_all($data['username']));
			$password = $this->escape_string($this->strip_all($data['password']));
			$query = "select * from ".PREFIX."admin where username='".$username."'";
			$result = $this->query($query);

			if($this->num_rows($result) == 1) { // only one unique user should be present in the system
				$row = $this->fetch($result);
				if(password_verify($password, $row['password'])) {
					$this->loginSession($row['id'], $row['fname'], $row['lname'], $this->userType,$row['role']);
					$this->close_connection();
					header("location: ".$successURL);
					exit;
				} else {
					$this->close_connection();
					header("location: ".$failURL);
					exit;
				}
			} else {
				$this->close_connection();
				header("location: ".$failURL);
				exit;
			}
		}
		/* function sessionExists(){
			if( isset($_SESSION[SITE_NAME]) && 
				isset($_SESSION[SITE_NAME][$this->userType.'UserId']) && 
				isset($_SESSION[SITE_NAME][$this->userType.'UserType']) && 
				!empty($_SESSION[SITE_NAME][$this->userType.'UserId']) &&
				$_SESSION[SITE_NAME][$this->userType.'UserType']==$this->userType){

				return $loggedInUserDetailsArr = $this->getLoggedInUserDetails();
				// return true; // DEPRECATED
			} else {
				return false;
			}
		} */
		function sessionExists(){
			if($this->isUserLoggedIn()){
				return $loggedInUserDetailsArr = $this->getLoggedInUserDetails();
				// return true; // DEPRECATED
			} else {
				return false;
			}
		}
		function isUserLoggedIn(){
			if( isset($_SESSION[SITE_NAME]) && 
				isset($_SESSION[SITE_NAME][$this->userType.'UserId']) && 
				isset($_SESSION[SITE_NAME][$this->userType.'UserType']) && 
				!empty($_SESSION[SITE_NAME][$this->userType.'UserId']) &&
				$_SESSION[SITE_NAME][$this->userType.'UserType']==$this->userType){
				return true;
			} else {
				return false;
			}
		}
		function getSystemUserType() {
			return $this->userType;
		}
		function getLoggedInUserDetails(){
			$loggedInID = $this->escape_string($this->strip_all($_SESSION[SITE_NAME][$this->userType.'UserId']));
			$loggedInUserDetailsArr = $this->getUniqueUserById($loggedInID);
			return $loggedInUserDetailsArr;
		}
		
		function getUniqueUserById($userId) {
			$id = $this->escape_string($this->strip_all($userId));
			$query = "select * from ".PREFIX."admin where id='".$id."'";
			$sql = $this->query($query);
			return $this->fetch($sql);
		}

		// === LOGIN ENDS ====

		// == EXTRA FUNCTIONS STARTS ==
		function getValidatedPermalink($permalink){ // v2
			$permalink = trim($permalink, '()');
			$replace_keywords = array("-:-", "-:", ":-", " : ", " :", ": ", ":",
				"-@-", "-@", "@-", " @ ", " @", "@ ", "@", 
				"-.-", "-.", ".-", " . ", " .", ". ", ".", 
				"-\\-", "-\\", "\\-", " \\ ", " \\", "\\ ", "\\",
				"-/-", "-/", "/-", " / ", " /", "/ ", "/", 
				"-&-", "-&", "&-", " & ", " &", "& ", "&", 
				"-,-", "-,", ",-", " , ", " ,", ", ", ",", 
				" ", "\r", "\n", 
				"---", "--", " - ", " -", "- ",
				"-#-", "-#", "#-", " # ", " #", "# ", "#",
				"-$-", "-$", "$-", " $ ", " $", "$ ", "$",
				"-%-", "-%", "%-", " % ", " %", "% ", "%",
				"-^-", "-^", "^-", " ^ ", " ^", "^ ", "^",
				"-*-", "-*", "*-", " * ", " *", "* ", "*",
				"-(-", "-(", "(-", " ( ", " (", "( ", "(",
				"-)-", "-)", ")-", " ) ", " )", ") ", ")",
				"-;-", "-;", ";-", " ; ", " ;", "; ", ";",
				"-'-", "-'", "'-", " ' ", " '", "' ", "'",
				'-"-', '-"', '"-', ' " ', ' "', '" ', '"',
				"-?-", "-?", "?-", " ? ", " ?", "? ", "?",
				"-+-", "-+", "+-", " + ", " +", "+ ", "+",
				"-!-", "-!", "!-", " ! ", " !", "! ", "!");
			$escapedPermalink = str_replace($replace_keywords, '-', $permalink); 
			return strtolower($escapedPermalink);
		}
		function getUniquePermalink($permalink,$tableName,$main_menu,$newPermalink='',$num=1) {
			if($newPermalink=='') {
				$checkPerma = $permalink;
			} else {
				$checkPerma = $newPermalink;
			}
			$sql = $this->query("select * from ".PREFIX.$tableName." where permalink='$checkPerma' and main_menu='$main_menu'");
			if($this->num_rows($sql)>0) {
				$count = $num+1;
				$newPermalink = $permalink.$count;
				return $this->getUniquePermalink($permalink,$tableName,$main_menu,$newPermalink,$count);
			} else {
				return $checkPerma;
			}
		}
		function getActiveLabel($isActive){
			if($isActive){
				return 'Yes';
			} else {
				return 'No';
			}
		}
		function getImageUrl($imageFor, $fileName, $imageSuffix){
			$image_name = strtolower(pathinfo($fileName, PATHINFO_FILENAME));
			$image_ext = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
			switch($imageFor){
				case "banner":
					$fileDir = "../img/banner/";
					break;
				case "career":
					$fileDir = "../images/career/";
					break;
				case "products":
					$fileDir = "../img/products/";
					break;
				case "category":
					$fileDir = "../img/category/";
					break;
				case "sub_category":
					$fileDir = "../img/sub_category/";
					break;
				case "our-philosophy":
					$fileDir = "../images/our-philosophy/";
					break;
				case "team-testimonial":
					$fileDir = "../images/team-testimonial/";
					break;
				case "news":
					$fileDir = "../images/news/";
					break;
				case "csr-objectives":
					$fileDir = "../images/csr-objectives/";
					break;
				case "team":
					$fileDir = "../images/team/";
					break;
				case "vendor-guideline":
					$fileDir = "../images/vendor-guideline/";
					break;
				case "service":
					$fileDir = "../images/service/";
					break;
				case "our_presence":
					$fileDir = "../images/our_presence/";
					break;
				default:
					return false;
					break;
			}
			$imageUrl = $fileDir.$image_name."_".$imageSuffix.".".$image_ext;
			if(file_exists($imageUrl)){
				return $imageUrl;
				// $imageUrl = BASE_URL.'/'.$imageUrl;
			} else {
				return false;
				// $imageUrl = BASE_URL."/images/no_img.jpg";
			}
		}
		function unlinkImage($imageFor, $fileName, $imageSuffix){
			$imagePath = $this->getImageUrl($imageFor, $fileName, $imageSuffix);
			$status = false;
			if($imagePath!==false){
				$status = unlink($imagePath);
			}
			return $status;
		}
		function checkUserPermissions($permission,$loggedInUserDetailsArr) {
			$userPermissionsArray = explode(',',$loggedInUserDetailsArr['permissions']);
			if(!in_array($permission,$userPermissionsArray) and $loggedInUserDetailsArr['user_role']!='super') {
				header("location: dashboard.php");
				exit;
			}
		}
		
		// === CATEGORY STARTS ===
		function getUniqueCategoryById($id) {
			$id = $this->escape_string($this->strip_all($id));
			$query = "select * from ".PREFIX."category_master where id='".$id."'";
			$sql = $this->query($query);
			return $this->fetch($sql);
		}
		function getAllCategories() {
			$query = "select * from ".PREFIX."category_master where active='Yes'";
			$sql = $this->query($query);
			return $sql;
		}
		function getAllPackages() {
			$query = "select * from ".PREFIX."package_master order by display_order ASC";
			$sql = $this->query($query);
			return $sql;
		}
		function getAllFeatures() {
			$query = "select * from ".PREFIX."feature_master order by display_order ASC";
			$sql = $this->query($query);
			return $sql;
		}
		function addCategory($data,$file){
			
			$category_name = $this->escape_string($this->strip_all($data['category_name']));
			$active = $this->escape_string($this->strip_all($data['active']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			
			$query = "insert into ".PREFIX."category_master(category_name, active, display_order) values ('".$category_name."', '".$active."', '".$display_order."')";
			$this->query($query);
		
		}
		function updateCategory($data,$file) {
			
			$id = $this->escape_string($this->strip_all($data['id']));
			$category_name = $this->escape_string($this->strip_all($data['category_name']));
			$active = $this->escape_string($this->strip_all($data['active']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			
			$query = "update ".PREFIX."category_master set category_name='".$category_name."', active='".$active."', display_order='".$display_order."' where id='".$id."'";
			$this->query($query);

			$category_id = $id;

		}	
		
		
		//Add User functions starts

		function getUserById($userId) {
			$id = $this->escape_string($this->strip_all($userId));
			$query = "select * from ".PREFIX."user_master where id='".$id."'";
			$sql = $this->query($query);
			return $this->fetch($sql);
		}

		function addUser($data){

			$qery123 = $this->query("SELECT userid from ".PREFIX."user_master WHERE userid != '' order by id desc limit 1");
			if($this->num_rows($qery123) == 0){
				$userid = '0001';
			}else{
				$last_booking = $this->fetch($qery123);
				$series = $last_booking['userid'] + 1;
				$userid = str_pad($series, 4, "0", STR_PAD_LEFT);
			}

			$fname = $this->escape_string($this->strip_all($data['fname']));
			$lname = $this->escape_string($this->strip_all($data['lname']));
			$email = $this->escape_string($this->strip_all($data['email']));
			$password = password_hash($data['password'], PASSWORD_DEFAULT);
			$mobile = $this->escape_string($this->strip_all($data['mobile']));
			$points = '0';
			$active = $this->escape_string($this->strip_all($data['active']));
			$createdby = $this->escape_string($this->strip_all($data['createdby']));
			
			include("new-user-creation.inc.php");

			$mail = new PHPMailer();
			$mail->IsSMTP();
			$mail->SMTPAuth = true;
			$mail->AddAddress($_POST['email']);
			$mail->IsHTML(true);
			$mail->Subject = SITE_NAME." New User Creation";
			$mail->Body = $emailMsg;
			$mail->Send();

			$query = "insert into ".PREFIX."user_master (userid, fname, lname, email, mobile, password, active, points, created_by) values('".$userid."','".$fname."', '".$lname."', '".$email."', '".$mobile."', '".$password."', '".$active."', '".$points."', '".$createdby."') ";

			return $this->query($query);
		}

		function updateUser($data){
			//print_r($data);exit;
			$id = $this->escape_string($this->strip_all($data['id']));
			$fname = $this->escape_string($this->strip_all($data['fname']));
			$lname = $this->escape_string($this->strip_all($data['lname']));
			$email = $this->escape_string($this->strip_all($data['email']));
			
			$mobile = $this->escape_string($this->strip_all($data['mobile']));
			$active = $this->escape_string($this->strip_all($data['active']));
			$points = $this->escape_string($this->strip_all($data['points']));
			$last_modified = date("Y-m-d h:i:s");
			$createdby = $this->escape_string($this->strip_all($data['createdby']));
			if(!empty($data['password'])){
				$password = password_hash($data['password'], PASSWORD_DEFAULT);
				$query1 = $this->query("update ".PREFIX."user_master set password = '".$password."' where id = '".$id."' ");
			}

			$query =  "update ".PREFIX."user_master set fname = '".$fname."', lname = '".$lname."', email = '".$email."', mobile = '".$mobile."', active = '".$active."', last_modified = '".$last_modified."', points = '".$points."', created_by = '".$createdby."' where id = '".$id."'";

			return $this->query($query);

		}
		//Add User functions ends

		//Activity Functions Starts

		function getUniqueActivityById($id){
			$id = $this->escape_string($this->strip_all($id));

			$sql = "select * from ".PREFIX."activity_master where id = '".$id."' ";
			$res = $this->query($sql);
			return $this->fetch($res);
		}

		function addActivity($data){
			$category = $this->escape_string($this->strip_all($data['category']));
			$activity_name = $this->escape_string($this->strip_all($data['activity_name']));
			$description = $this->escape_string($this->strip_all($data['description']));
			$points = $this->escape_string($this->strip_all($data['points']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$query = "insert into ".PREFIX."activity_master (category, activity_name, description, points, active) value('".$category."', '".$activity_name."', '".$description."', '".$points."', '".$active."') ";

			return $this->query($query);
			
		}

		function updateActivity($data){
			$id = $this->escape_string($this->strip_all($data['id']));
			$category = $this->escape_string($this->strip_all($data['category']));
			$activity_name = $this->escape_string($this->strip_all($data['activity_name']));
			$description = $this->escape_string($this->strip_all($data['description']));
			$points = $this->escape_string($this->strip_all($data['points']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$sql = "update ".PREFIX."activity_master set category = '".$category."', activity_name = '".$activity_name."', description = '".$description."', points = '".$points."', active = '".$active."' where id = '".$id."'";

			return $this->query($sql);
		}

		//Activity Functions Ends

		//Reward Functions starts

		function getUniqueRewardById($id){
			$id = $this->escape_string($this->strip_all($id));
			
			$sql = "select * from ".PREFIX."redeem_master where id = '".$id."' ";
			$res = $this->query($sql);
			return $this->fetch($res);
		}

		function addReward($data){
			$category = $this->escape_string($this->strip_all($data['category']));
			$reward_name = $this->escape_string($this->strip_all($data['reward_name']));
			$points = $this->escape_string($this->strip_all($data['points']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$sql = "insert into ".PREFIX."redeem_master (category, reward_name, points, display_order, active) values('".$category."', '".$reward_name."', '".$points."', '".$display_order."', '".$active."') ";

			return $this->query($sql);
		}

		function updateReward($data){
			$id = $this->escape_string($this->strip_all($data['id']));
			$category = $this->escape_string($this->strip_all($data['category']));
			$reward_name = $this->escape_string($this->strip_all($data['reward_name']));
			$points = $this->escape_string($this->strip_all($data['points']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$sql = "update ".PREFIX."redeem_master set category = '".$category."', reward_name = '".$reward_name."', points = '".$points."', display_order = '".$display_order."', active = '".$active."' where id = '".$id."' ";
			return $this->query($sql);
		}

		//Reward Functions ends

		//Functions to add Activity to User.

		function addActivityUser($data){
			$userid = $this->escape_string($this->strip_all($data['email']));
			$category = $this->escape_string($this->strip_all($data['category']));
			$activity = $this->escape_string($this->strip_all($data['activity']));
			$status = $this->escape_string($this->strip_all($data['status']));
			$createdby = $this->escape_string($this->strip_all($data['createdby']));
			$approvedby = $this->escape_string($this->strip_all($data['createdby']));
			$approved = '';
			if($status == 'already done'){
				$approved = 'Approved';
			}

			$get = $this->fetch($this->query("select points from ".PREFIX."activity_master where id = '".$activity."' "));
			$points = $get['points'];

			$userPts = $this->query("update ".PREFIX."user_master set points = points + $points where id = '".$userid."' ");

			$query = "insert into ".PREFIX."user_activity (userid, category, activity, points, count, status, approved, approved_by, created_by) value('".$userid."', '".$category."', '".$activity."', '".$points."', '1','".$status."', '".$approved."', '".$approvedby."', '".$createdby."') ";

			return $this->query($query);
		}

		//About Us Functions

		function getUniqueAboutUsById($id){
			$id = $this->escape_string($this->strip_all($id));
			$sql = "SELECT `image_name` FROM ".PREFIX."about_us WHERE `id`='".$id."'";
			$this->query($sql);
		}

		function updateAboutUsPage($data,$file){
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$id = $this->escape_string($this->strip_all($data['id']));
			$desc1 = $this->escape_string($this->strip_selected($data['desc1'],$allowTags));
			$desc2 = $this->escape_string($this->strip_selected($data['desc2'],$allowTags));
			
			$SaveImage = new SaveImage();
			$imgDir = '../images/';
			if(isset($file['image_name']['name']) && !empty($file['image_name']['name'])) {
				$imageName = str_replace( " ", "-", $file['image_name']['name'] );
				$file_name = strtolower( pathinfo($imageName, PATHINFO_FILENAME));
				$file_name = $this->getValidatedPermalink($file_name);
				$Detail = $this->getUniqueAboutUsById($id);
				$cropData = $this->strip_all($data['cropData1']);
				$this->unlinkImage("", $Detail['image_name'], "large");
				$this->unlinkImage("", $Detail['image_name'], "crop");
				$image_name = $SaveImage->uploadCroppedImageFileFromForm($file['image_name'], 387, $cropData, $imgDir, $file_name.'-'.time().'-1');
				$this->query("update ".PREFIX."about_us set image_name='$image_name' ");
			}
			$query = "update ".PREFIX."about_us set desc1='$desc1',desc2='$desc2' where id = '".$id."' ";
			$this->query($query);
		}

		//Contact US functions

		function getUniqueContactById($id){
			$query = $this->query("select * from ".PREFIX."contactus where id = '".$id."' order by id DESC");
			return $this->fetch($query);
		}
		
		function addContact($data){
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$region = $this->escape_string($this->strip_all($data['region']));
			$address = $this->escape_string($this->strip_selected($data['address'], $allowTags));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$sql = "insert into ".PREFIX."contactus (region, address, display_order, active) values ('".$region."', '".$address."', '".$display_order."', '".$active."')";

			return $this->query($sql);

		}

		function updateContactUs($data){
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$id = $this->escape_string($this->strip_all($data['id']));
			$region = $this->escape_string($this->strip_selected($data['region']));
			$address = $this->escape_string($this->strip_selected($data['address'], $allowTags));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$active = $this->escape_string($this->strip_all($data['active']));

			$sql = "update ".PREFIX."contactus set region = '".$region."', address = '".$address."', display_order = '".$display_order."', active = '".$active."' where id = '".$id."' ";

			return $this->query($sql);
		}

		//Banner Functions

		// === BANNER STARTS ===
		function getAllBanners() {
			$query = "select * from ".PREFIX."banner_master";
			$sql = $this->query($query);
			return $sql;
		}

		function getUniqueBannerById($id) {
			$id = $this->escape_string($this->strip_all($id));
			$query = "select * from ".PREFIX."banner_master where id='$id'";
			$sql = $this->query($query);
			return $this->fetch($sql);
		}

		function addBanner($data,$file) {
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$title = $this->escape_string($this->strip_selected($data['title'], $allowTags));
			$link = $this->escape_string($this->strip_all($data['link']));
			$active = $this->escape_string($this->strip_all($data['active']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$date = date("Y-m-d H:i:s");
			$SaveImage = new SaveImage();
			$imgDir = '../images/banner/';
			if(isset($file['ipad_img']['name']) && !empty($file['ipad_img']['name'])){
				$ipad_img = str_replace( " ", "-", $file['ipad_img']['name'] );
				$file_name = strtolower( pathinfo($imageName, PATHINFO_FILENAME));
				$file_name = $this->getValidatedPermalink($file_name);
				$cropData = $this->strip_all($data['cropData1']);
				$ipad_img = $SaveImage->uploadCroppedImageFileFromForm($file['ipad_img'], 760, $cropData, $imgDir, $file_name.'-'.time().'-1');
			} else {
				$ipad_img = '';
			}
			// if(isset($file['phone_img']['name']) && !empty($file['phone_img']['name'])){
			// 	$phone_img = str_replace( " ", "-", $file['phone_img']['name'] );
			// 	$file_name = strtolower( pathinfo($imageName, PATHINFO_FILENAME));
			// 	$file_name = $this->getValidatedPermalink($file_name);
			// 	$cropData = $this->strip_all($data['cropData1']);
			// 	$phone_img = $SaveImage->uploadCroppedImageFileFromForm($file['phone_img'], 195, $cropData, $imgDir, $file_name.'-'.time().'-1');
			// } else {
			// 	$phone_img = '';
			// }

			$query = "insert into ".PREFIX."banner_master (ipad_img ,title,link,active,display_order) values ('$ipad_img', '$title','$link', '$active', '$display_order')";
			return $this->query($query);
		}
		
		function updateBanner($data,$file) {
			//print_r($data);exit;
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$id = $this->escape_string($this->strip_all($data['id']));
			$active = $this->escape_string($this->strip_all($data['active']));
			$title = $this->escape_string($this->strip_selected($data['title'], $allowTags));
			$link = $this->escape_string($this->strip_all($data['link']));
			$display_order = $this->escape_string($this->strip_all($data['display_order']));
			$SaveImage = new SaveImage();
			$imgDir = '../images/banner/';
			if(isset($file['ipad_img']['name']) && !empty($file['ipad_img']['name'])) {
				$ipad_img = str_replace( " ", "-", $file['ipad_img']['name'] );
				$file_name = strtolower( pathinfo($ipad_img, PATHINFO_FILENAME));
				$file_name = $this->getValidatedPermalink($file_name);
				$Detail = $this->getUniqueBannerById($id);
				$cropData = $this->strip_all($data['cropData1']);
				$this->unlinkImage("", $Detail['ipad_img'], "large");
				$this->unlinkImage("", $Detail['ipad_img'], "crop");
				$ipad_img = $SaveImage->uploadCroppedImageFileFromForm($file['ipad_img'], 760, $cropData, $imgDir, $file_name.'-'.time().'-1');
				$this->query("update ".PREFIX."banner_master set ipad_img='$ipad_img' where id='$id'");
			}
			$query = "update ".PREFIX."banner_master set title='$title', active='$active', link='$link', display_order='$display_order' where id='$id'";
			return $this->query($query);
		}

		function deleteBanner($id) {
			$id = $this->escape_string($this->strip_all($id));
			$Detail = $this->getUniqueBannerById($id);
			$this->unlinkImage("banner", $Detail['ipad_img'], "large");
			$this->unlinkImage("banner", $Detail['phone_img'], "crop");
			$query = "delete from ".PREFIX."banner_master where id='$id'";
			$this->query($query);
			return true;
		}

		//Home page content functions

		function updateWelcomeContent($data){
			$id = $this->escape_string($this->strip_all($data['id']));
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$title = $this->escape_string($this->strip_all($data['title']));
			$subtitle = $this->escape_string($this->strip_all($data['subtitle']));
			$description = $this->escape_string($this->strip_selected($data['description'],$allowTags));

			//echo $image_name;exit;
			$query = "update ".PREFIX."gallery_content set description='".$description."',title='".$title."', subtitle = '".$subtitle."' where id='".$id."'";
			$this->query($query);
		}

		function updateHomeDetailingContent($data, $file){
			$id = $this->escape_string($this->strip_all($data['id']));
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$title = $this->escape_string($this->strip_all($data['title']));
			$description = $this->escape_string($this->strip_selected($data['detailing'],$allowTags));

			$SaveImage = new SaveImage();
			$imgDir = '../images/';
			if(isset($file['image']['name']) && !empty($file['image']['name'])){
				$image = str_replace( " ", "-", $file['image']['name'] );
				$file_name = strtolower( pathinfo($imageName, PATHINFO_FILENAME));
				$file_name = $this->getValidatedPermalink($file_name);
				$cropData = $this->strip_all($data['cropData1']);
				$image = $SaveImage->uploadCroppedImageFileFromForm($file['image'], 472, $cropData, $imgDir, $file_name.'-'.time().'-1');
			} else {
				$image = '';
			}

			
			$query = "update ".PREFIX."gallery_content set title = '".$title."', description='".$description."', image = '".$image."' where id='".$id."'";
			$this->query($query);
		}

		function updateRewardsContent($data, $file){
			$id = $this->escape_string($this->strip_all($data['id']));
			$allowTags = "<strong><em><b><p><u><ul><li><ol><s><sub><sup><h1><img><h2><h3><h4><h5><h6><div><i><span><br><table><tr><th><td><thead><tbody><a>";
			$title = $this->escape_string($this->strip_all($data['title']));
			$description = $this->escape_string($this->strip_selected($data['descriptions'],$allowTags));

			$SaveImage = new SaveImage();
			$imgDir = '../images/';
			if(isset($file['images']['name']) && !empty($file['images']['name'])){
				$images = str_replace( " ", "-", $file['images']['name'] );
				$file_name = strtolower( pathinfo($imageName, PATHINFO_FILENAME));
				$file_name = $this->getValidatedPermalink($file_name);
				$cropData = $this->strip_all($data['cropData1']);
				$images = $SaveImage->uploadCroppedImageFileFromForm($file['images'], 322, $cropData, $imgDir, $file_name.'-'.time().'-1');
			} else {
				$images = '';
			}

			
			$query = "update ".PREFIX."gallery_content set title = '".$title."', description='".$description."', image = '".$images."' where id='".$id."'";
			$this->query($query);
		}

		//Add redeem activity functions

		function getRedeemActivityById($id){

			$id = $this->escape_string($this->strip_all($id));

			$query = "select * from ".PREFIX."redeem_activity where id='".$id."'";
			$sql = $this->query($query);
			return $this->fetch($sql);

		}

		function addRedeemActivity($data){
			$userid = $this->escape_string($this->strip_all($data['email']));
			$category = $this->escape_string($this->strip_all($data['category']));
			$activity = $this->escape_string($this->strip_all($data['activity']));
			$createdby = $this->escape_string($this->strip_all($data['createdby']));
			$status = 'Approved';

			$get = $this->fetch($this->query("select points from ".PREFIX."redeem_master where id = '".$activity."' "));
			$points = $get['points'];
			
			$userpts = $this->query("update ".PREFIX."user_master set points = points + $points where id = '".$userid."' ");

			$query = "insert into ".PREFIX."redeem_activity (userid, redeem, points, approved, approved_by, created_by) values('".$userid."', '".$activity."', '".$points."', '".$status."', '".$createdby."', '".$createdby."') ";
 
			return $this->query($query);

		}

		function updateRedeemActivity($data){
			$id = $this->escape_string($this->strip_all($data['id']));
			$userid = $this->escape_string($this->strip_all($data['email']));
			$category = $this->escape_string($this->strip_all($data['category']));
			$activity = $this->escape_string($this->strip_all($data['activity']));
			
			$status = 'Approved';

			$get = $this->fetch($this->query("select points from ".PREFIX."redeem_master where id = '".$activity."' "));
			$points = $get['points'];

			$userpts = $this->query("update ".PREFIX."user_master set points = points + $points where id = '".$userid."' ");

			$query = "update ".PREFIX."redeem_activity set userid = '".$userid."', redeem = '".$activity."', points = '".$points."', approved = '".$status."' where id = '".$id."' ";

			return $this->query($query);
		}

	} 
?>