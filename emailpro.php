<?php
	include('site-config.php');
	error_reporting(E_ALL);
	ini_set("display_errors","on");
	if(isset($_POST['submit'])) {
		$res = $func->addContactForm($_POST);

		$mail = new PHPMailer();

		$table_cellpadding = "5";
		$table_cellspacing = "1";
		$table_background_color = "#000000";
		$table_left_column_color = "#ececec";
		$table_left_column_font = "arial";
		$table_left_column_font_size = "2";
		$table_left_column_font_color = "#000000";
		$table_right_column_color = "#ffffff";
		$table_right_column_font = "arial";
		$table_right_column_font_size = "2";
		$table_right_column_font_color = "#000000";
		 
		$mybody = "<table cellpadding=\"".$table_cellpadding."\" cellspacing=\"".$table_cellspacing."\" bgcolor=\"".$table_background_color."\">
			

			<tr>
				<td valign=\"top\" bgcolor=\"".$table_left_column_color."\" nowrap><font face=\"".$table_left_column_font."\" size=\"".$table_left_column_font_size."\" color=\"".$table_left_column_font_color."\"><b>Name: </b></font></td>
				<td bgcolor=\"".$table_right_column_color."\"><font face=\"".$table_right_column_font."\" size=\"".$table_right_column_font_size."\" color=\"".$table_right_column_font_color."\">".$_REQUEST['name']."</font>				</td>
			</tr>
				   
			<tr>
				<td valign=\"top\" bgcolor=\"".$table_left_column_color."\" nowrap><font face=\"".$table_left_column_font."\" size=\"".$table_left_column_font_size."\" color=\"".$table_left_column_font_color."\"><b>Mobile: </b></font></td>
				<td bgcolor=\"".$table_right_column_color."\"><font face=\"".$table_right_column_font."\" size=\"".$table_right_column_font_size."\" color=\"".$table_right_column_font_color."\">".$_REQUEST['mobile']."</font>				</td>
			</tr>

            <tr>
				<td valign=\"top\" bgcolor=\"".$table_left_column_color."\" nowrap><font face=\"".$table_left_column_font."\" size=\"".$table_left_column_font_size."\" color=\"".$table_left_column_font_color."\"><b>Email ID: </b></font></td>
				<td bgcolor=\"".$table_right_column_color."\"><font face=\"".$table_right_column_font."\" size=\"".$table_right_column_font_size."\" color=\"".$table_right_column_font_color."\">".$_REQUEST['email']."</font>				</td>
			</tr>
			
			<tr>
				<td valign=\"top\" bgcolor=\"".$table_left_column_color."\" nowrap><font face=\"".$table_left_column_font."\" size=\"".$table_left_column_font_size."\" color=\"".$table_left_column_font_color."\"><b>details: </b></font></td>
				<td bgcolor=\"".$table_right_column_color."\"><font face=\"".$table_right_column_font."\" size=\"".$table_right_column_font_size."\" color=\"".$table_right_column_font_color."\">".$_REQUEST['message']."</font>				</td>
			</tr>
		</table>
		";
		
		$mail->IsSMTP();
		$mail->Host = "shareittofriends.com";

		$mail->SMTPAuth = true;
		//$mail->SMTPSecure = "ssl";
		$mail->Port = 587;
		$mail->Username = "noreply@shareittofriends.com";
		$mail->Password = "noreply@1234";
		$mail->SMTPDebug = 2;
		$mail->From = "noreply@shareittofriends.com";
		$mail->AddAddress($_POST['email']);
		$mail->AddAddress("ridhi.malhotra@zycus.com");
		
		$mail->IsHTML(true);

		$mail->Subject = "Enquiry - Contact Us";
		$mail->Body = $mybody;

		$mail->Send();
		header("location: contact-us.php");
		exit;
	}
?> 
	}
?> 