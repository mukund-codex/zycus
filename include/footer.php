		<footer class="footer">
			<div class="container">
				<div class="row br-bot pad15">
					<div class="col-sm-3 col-md-3 text-left">
						<a href="index.php" class="f-logo"><img src="images/logo.png"></a>
					</div>
					<div class="col-sm-7 col-md-6 text-center">
						<ul class="menus">
		                    <li><a href="index.php">Home</a></li>
		                    <li><a href="about-us.php">About Us</a></li>		           
		                    <li><a href="contact-us.php">Contact Us</a></li>
							<?php if(empty($loggedInUserDetailsArr)){ ?>
		                    	<li><a href="login.php" class="login-btn">Login</a></li>
							<?php }else{ ?>
								<li><a href="" class="login-btn" style="padding: 0 12px 0 12px !important;"><?php echo $loggedInUserDetailsArr['fname']; ?></a></li>
							<?php } ?>
		                </ul>
					</div>
					<div class="col-sm-2 col-md-3 text-right">
						<ul class="social-li">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="row pad15">
					<div class="col-sm-12 col-md-12 text-center">
						<p>&copy; 2019 zycus. All rights reserved. Design & Developed by <a href="http://innovins.com/" target="_blank">Innovins</a></p>
					</div>
				</div>
			</div>
		</footer>