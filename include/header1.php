<?php
	$basename = basename($_SERVER['REQUEST_URI']);
	$currentPage = pathinfo($_SERVER['PHP_SELF'], PATHINFO_BASENAME);
?>
		<header class="header">
		    <nav class="navbar main-header" id="myHeader">
		        <div class="container">
		            <div class="navbar-header">
		                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		                    <!-- span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span -->
							<i class="fa fa-bars" aria-hidden="true" id="bars"></i>
							<i class="fa fa-times" aria-hidden="true" id="close" style="display:none;"></i>
		                </button>
		                <a href="index.php" class="logo">
		                    <img src="images/logo.png">
		                </a>
		            </div>
		            <div class="collapse navbar-collapse" id="myNavbar">
		                <ul class="nav navbar-nav menus navbar-right">
		                    <li <?php if($currentPage == 'index.php') { echo 'class="active"'; } ?> ><a href="index.php">Home</a></li>
		                    <li <?php if($currentPage == 'about-us.php') { echo 'class="active"'; } ?> ><a href="about-us.php">About Us</a></li>		           
		                    <li <?php if($currentPage == 'contact-us.php') { echo 'class="active"'; } ?> ><a href="contact-us.php">Contact Us</a></li>
		                    <?php if(empty($loggedInUserDetailsArr)){ ?>
								<li <?php if($currentPage == 'login.php') { echo 'class="active"'; } ?> ><a href="login.php" class="login-btn">Login</a></li>
							<?php }else{ ?>
								<li <?php if($currentPage == 'dashboard-engage.php') { echo 'class="active"'; } ?> ><a href="dashboard-engage.php">Dashboard</a></li>
								<li><a href="logout.php">Logout</a></li>
								<!-- <li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown"><?php echo $loggedInUserDetailsArr['fname']; ?>
									<span class=""><img src="images/d-ar.png"></span></a>
									<ul class="dropdown-menu login-menu">
										
									</ul>
								</li> -->
							<?php  } ?>
		                    
		                </ul>
		            </div>
		        </div>
		    </nav>
		</header>
		<a href="#" class="scrollToTop"><img src="images/top.png"></a>
		