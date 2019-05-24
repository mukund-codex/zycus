<?php
    include('site-config.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zycus</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/slick.css">
	<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
    <link rel="icon" type="image/ico" href="images/favicon.png">
</head>

<body>
    <?php 
        include 'include/header.php';
    ?>
        <!-- section class="inner-banner-sec">
            <img src="images/inner-banner.jpg">
        </section -->
       
        <section class="terms-sec dashboard-sec border-top abt-bg contact-pg">
            <div class="container text-center">
                <h1 class="title1">Thank <span>You !</span></h1>
                <span class="bar-center"></span>
                <br>
                <a href="index.php" class="blue-btn a-btn round-corner">Back To Home</a>
            </div>
        </section>

    <?php 
        include 'include/footer.php';
    ?>

            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
            <script src='js/slick.min.js'></script>
            <script src='js/owl.carousel.js'></script>
            <script src='js/owl.navigation.js'></script>
            <script src='js/jquery-ui.min.js'></script>
            <script src="js/jquery.timepicker.min.js"></script>
            <script src="js/bootstrap-select.min.js"></script>
            <script src="js/index.js"></script>
            <script type="text/javascript">
                $(window).scroll(function() {
                    if ($(window).scrollTop() > 100) {
                        $(".header-fix").addClass("fix_nav");
                    } else {
                        $(".header-fix").removeClass("fix_nav");
                    }
                });
                $(document).ready(function() {

                });
            </script>
</body>

</html>
</html>