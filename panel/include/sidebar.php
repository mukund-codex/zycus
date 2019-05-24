<?php
	$basename = basename($_SERVER['REQUEST_URI']);
	$currentPage = pathinfo($_SERVER['PHP_SELF'], PATHINFO_BASENAME);
?>
<!-- Sidebar -->
<div class="sidebar collapse">
    <div class="sidebar-content">
		<!-- Main navigation -->
		<ul class="navigation">
			
			<li <?php if($currentPage=='user-master.php') { echo 'class="active"'; }?>><a href="user-master.php"><span>User Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='activity-master.php') { echo 'class="active"'; }?>><a href="activity-master.php"><span>Activity Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='redeem-master.php') { echo 'class="active"'; }?>><a href="redeem-master.php"><span>Redeem Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='redeem-activity-master.php') { echo 'class="active"'; }?>><a href="redeem-activity-master.php"><span>Redeem Activity Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='category-master.php') { echo 'class="active"'; }?>><a href="category-master.php"><span>Category Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='user-activity.php') { echo 'class="active"'; }?>><a href="user-activity.php"><span>User Activity</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='about_us.php') { echo 'class="active"'; }?>><a href="about_us.php"><span>About Us</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='contactus-master.php') { echo 'class="active"'; }?>><a href="contactus-master.php"><span>Contact Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='banner-master.php') { echo 'class="active"'; }?>><a href="banner-master.php"><span>Banner Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='home-master.php') { echo 'class="active"'; }?>><a href="home-master.php"><span>Home Master</span> <i class="icon-diamond"></i></a></li>
			<li <?php if($currentPage=='contactus-enquiry.php') { echo 'class="active"'; }?>><a href="contactus-enquiry.php"><span>Contact Us Enquiry</span> <i class="icon-diamond"></i></a></li>
		</ul>
      <!-- /main navigation -->
	</div>
</div>
<!-- /sidebar -->
