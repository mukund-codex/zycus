<?php 
	include_once 'site-config.php';
	$response = array();
	$response['zonal_id'] = '';
	$response['pmDetail'] = '';
	
	$zonalStr = '';
	$emp_id = '';
	$zonalParent = '';
	
	if(isset($_GET['pincode_id']) && $_GET['pincode_id']!=''){
		$pincode_id = $func->escape_string($func->strip_all($_GET['pincode_id']));
		$product = $func->escape_string($func->strip_all($_GET['product']));
		$sql="select * from ".PREFIX."go2marketpincode where pincode='".$pincode_id."'";
		$cityResult=$func->query($sql);
		$zonalStr='<option value="">Please select user</option>';
		$userStr='<option value="">Please select user</option>';
		$selectedValue = '';
		$selectedZoanl = '';
		$default_zonal_id = '';
		$default_zonal_value = '';
		$default_emp_id = '';
		$default_emp_value = '';
		if($func->num_rows($cityResult) > 0) {
			$cityFetch = $func->fetch($cityResult);
			//echo $cityFetch['rigion'];exit;
			if($cityFetch['user_id'] == 'null' or $cityFetch['user_id']=='') {
				// echo "select * from ".PREFIX."gotomarketadmin where designation='Zonal Head'";
				$zonalQs = $func->query("select * from ".PREFIX."gotomarketadmin where designation='Zonal Head'");
				while($zonalfs = $func->fetch($zonalQs)) {
					$zonalStr.="<option value='".$zonalfs['id']."'>".$zonalfs['full_name']."</option>";	
				}
			} else {
				$EmpId = json_decode($cityFetch['user_id']);
			
				// print_r($EmpIdArray);
				$EmpIdArrays = array();
				$EmpIdListArray = array();
				$EmpIdArray = array();
				$icsManager = array('1875','1884','1902','1903','1928','1944','3758','2048');

				$brodbandManager = array("3734","3735","3739","3740","3741","3742","3744","3745","3749","3737","3747","3748","3752","3756","3750","3751","3753","3754","3755","3736","3738","3743","3746");

				$prodBasePMQuery =  $func->query("select distinct(user_id) FROM ".PREFIX."go2market_product_base_pm");
						$specialProdBasePM =array();
						while($row = $func->fetch($prodBasePMQuery)){
							$specialProdBasePM[] = $row['user_id'];
						}

 				//print_r($specialProdBasePM);exit;
				$specialProdquery = $func->query("select distinct(prouct_name) FROM ".PREFIX."go2market_product_base_pm");
						$specialProd =array();
						while($row = $func->fetch($specialProdquery)){
							$specialProd[] = $row['prouct_name'];
						}
						

				for($i = 0; $i < sizeof($EmpId); $i++) {
					// if((in_array($EmpId[$i], $icsManager)) ||(in_array($EmpId[$i], $specialProdBasePM) ) ){//if product base PM only get specific product
					if(in_array($EmpId[$i], $icsManager) || in_array($EmpId[$i], $brodbandManager) ){

						//break;
					}else{
						
						// if(($product=='AUDIO CONFERENCING (ACS PLANS)' || $product=='IOT Plans' || $product=='MPLS (HUB Location)' || $product=='MPLS Plans (Spoke location)' || $product=='Retail Wireline ( Broadband)') && $pincode_id != '999999'){
						
						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='".$EmpId[$i]."' and present_status='Present' and active='Yes' and resigned='No' order by full_name asc");
						if($func->num_rows($empQuery) > 0) {
							$empFetch = $func->fetch($empQuery);
							$empId = $empFetch['id'];
							$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
				}

				for($i = 0; $i < sizeof($EmpId); $i++) {
						if( (in_array($product, $specialProd)) && (in_array($EmpId[$i], $specialProdBasePM))  && $pincode_id != '999999' ){
							$empQuery = $func->query("select a.id as id, full_name from ".PREFIX."gotomarketadmin a inner join ".PREFIX."go2market_product_base_pm b on a.id=b.user_id where a.id='".$EmpId[$i]."' and b.prouct_name='".$product."' and a.present_status='Present' and a.active='Yes' order by a.full_name asc");
							// $EmpIdArrays = array();
							// $EmpIdListArray = array();
							// $EmpIdArray = array();

							if($func->num_rows($empQuery) > 0) {
								while($empFetch = $func->fetch($empQuery)){
									$empId = $empFetch['id'];
									$EmpIdListArray[$empId] = $empFetch['full_name'];
								}
							}
						}
				}

				$brodmgr =array();
				for($i = 0; $i < sizeof($EmpId); $i++) {
					if( in_array($EmpId[$i], $brodbandManager) ){
						$empQuery = $func->query("select a.id as id, full_name from ".PREFIX."gotomarketadmin a inner join ".PREFIX."go2market_product_base_pm b on a.id=b.user_id where a.id='".$brodmgr[$i]."' and b.prouct_name='".$product."' and a.present_status='Present' and a.active='Yes' order by a.full_name asc");
							if($func->num_rows($empQuery) > 0) {
								while($empFetch = $func->fetch($empQuery)){
									$EmpIdArrays = array();
									$EmpIdListArray = array();
									$EmpIdArray = array();
									array_push($brodmgr,$EmpId[$i]);
								}
							}
						
					}
				}

				//print_r($specialProd);
				if(sizeof($brodmgr)>0){

						for($i = 0; $i < sizeof($brodmgr); $i++) {

							if( in_array($product, $specialProd) && $pincode_id != '999999' ){
									//echo "1";
									$empQuery = $func->query("select a.id as id, full_name from ".PREFIX."gotomarketadmin a inner join ".PREFIX."go2market_product_base_pm b on a.id=b.user_id where a.id='".$brodmgr[$i]."' and b.prouct_name='".$product."' and a.present_status='Present' and a.active='Yes' order by a.full_name asc");
							// $EmpIdArrays = array();
							// $EmpIdListArray = array();
							// $EmpIdArray = array();

							if($func->num_rows($empQuery) > 0) {
								while($empFetch = $func->fetch($empQuery)){
									$empId = $empFetch['id'];
									$EmpIdListArray[$empId] = $empFetch['full_name'];
								}
							}
								}	

						}
				}
				
				if($product == 'AUDIO CONFERENCING (ACS PLANS)' || $product == 'IOT Plans'){
					
					if($cityFetch['rigion'] == 'MADHYA PRADESH' || $cityFetch['rigion'] == 'Chattisgarh' || $cityFetch['rigion'] == 'West'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1875'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
				// }
				// if($product == 'AUDIO CONFERENCING (ACS PLANS)' || $product == 'IOT Plans'){

					if($cityFetch['rigion'] == 'Tamilnadu' || $cityFetch['rigion'] == 'Kerala'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1884'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
				// }
				// if($product == 'AUDIO CONFERENCING (ACS PLANS)' || $product == 'IOT Plans'){

					if($cityFetch['rigion'] == 'Andhra Pradesh' || $cityFetch['rigion'] == 'Telangana'){

						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1902'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
					if($cityFetch['rigion'] == 'Uttar Pradesh' || $cityFetch['rigion'] == 'Delhi'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1903'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
					if($cityFetch['rigion'] == 'Maharashtra'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1928'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
					if($cityFetch['rigion'] == 'Karnataka'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='1944'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
					if($cityFetch['rigion'] == 'West Bengal'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='2048'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
					if($cityFetch['rigion'] == 'Mumbai'){
						$EmpIdArrays = array();
						$EmpIdListArray = array();
						$EmpIdArray = array();

						$empQuery = $func->query("select id,full_name from ".PREFIX."gotomarketadmin where id='3758'");
						if($func->num_rows($empQuery) > 0) {
						$empFetch = $func->fetch($empQuery);
						$empId = $empFetch['id'];
						$EmpIdListArray[$empId] = $empFetch['full_name'];
						}
					}
				}

				//print_r($EmpIdListArray);exit;
			//	asort($EmpIdListArray); //Sort array according name
			
				foreach($EmpIdListArray as $key=> $value){
					$EmpIdArray[] = $key;
				}
				if(sizeof($EmpIdArray)>0){
				 $empCommaSeparate = implode(",", $EmpIdArray);
				$response['test'] = $empCommaSeparate;
				$getlastempResult = $func->query("select * from ".PREFIX."go2market_leads where 
				cluster='".$cityFetch['city']."' and emp_id!='' and zonal_id !='' and individual_assign='No' and pincode_category='".$cityFetch['category']."' 
				and emp_id in(".$empCommaSeparate.") and version='1' order by id desc limit 0,1");
				}
				if(sizeof($EmpIdArray)>0){
					if($func->num_rows($getlastempResult) > 0) {
						$getlastempRow = $func->fetch($getlastempResult);
						foreach($EmpIdArray as $key=> $value){
							if($getlastempRow['emp_id'] == $value) {
								if(end($EmpIdArray) == $getlastempRow['emp_id']) {
									$emp_id = $EmpIdArray[0];
									
									$zonalQuerys = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$emp_id."'");
									$zonalFetchs = $func->fetch($zonalQuerys);
									$zonalParent = $zonalFetchs['parent'];
								} else {
									$emp_id = $EmpIdArray[$key+1];
									
									$zonalQueryss = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$emp_id."'");
									$zonalFetchss = $func->fetch($zonalQueryss);
									$zonalParent = $zonalFetchss['parent'];
								}
							}
						}
						if($emp_id == ''  && $zonalParent == '') {
							$emp_id = $EmpIdArray[0];
					
							$zonalQuerysss = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$emp_id."'");
							$zonalFetchsss = $func->fetch($zonalQuerysss);
							$zonalParent = $zonalFetchsss['parent'];
						}
					}  else {
						$emp_id = $EmpIdArray[0];
						
						$zonalQuerysss = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$emp_id."'");
						$zonalFetchsss = $func->fetch($zonalQuerysss);
						$zonalParent = $zonalFetchsss['parent'];
					}
				}
				
				// echo "select * from ".PREFIX."gotomarketadmin where parent='".$zonalParent."'";
				$zonalQuery = $func->query("select * from ".PREFIX."gotomarketadmin where parent='".$zonalParent."' and active='Yes'");
				while($zonalFetch = $func->fetch($zonalQuery)) {
					if($zonalFetch['id'] == $emp_id)  {
						$default_emp_id = $zonalFetch['full_name'];
						$default_emp_value = $zonalFetch['id'];
						$selectedValue = 'selected';
					} else {
						$selectedValue = '';
					}

					$userStr.="<option value='".$zonalFetch['id']."' ".$selectedValue.">".$zonalFetch['full_name']."</option>";	
				}
				
				$zonalVal = array();
				for($z = 0; $z < sizeof($EmpIdArray); $z++) {
					$zonalQuerys = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$EmpIdArray[$z]."'");
					while($zonalFetchs = $func->fetch($zonalQuerys)) {
						$zonalVal[] = $zonalFetchs['parent'];
					}
				}
				$zonalVals = array_values(array_unique($zonalVal));

				// echo $zonalParent;
				// echo "select * from ".PREFIX."gotomarketadmin where designation='Zonal Head'";
				// for($a = 0; $a < sizeof($zonalVals); $a++) {
					//$zonalQ = $func->query("select * from ".PREFIX."gotomarketadmin where id='".$zonalVals[$a]."'");
					$zonalQ = $func->query("select * from ".PREFIX."gotomarketadmin where designation='Zonal Head'");
					while($zonalf = $func->fetch($zonalQ)) {
						if($zonalf['id'] == $zonalParent) {
							$default_zonal_id = $zonalf['full_name'];
							$default_zonal_value = $zonalf['id'];
							$selectedZoanl = 'Selected';
						} else {
							$selectedZoanl = '';
						}
						
						//echo $selectedZoanl;
						$zonalStr.="<option value='".$zonalf['id']."' ".$selectedZoanl.">".$zonalf['full_name']."</option>";	
					}
				// }
			}
			
		}
		//$userStr='<option value="">Please select user</option>';
		$response['pmDetail'] = $userStr;
		$response['zonal_id'] = $zonalStr;
		$response['default_emp_id'] = $default_emp_id;
		$response['default_emp_value'] = $default_emp_value;
		$response['default_zonal_id'] = $default_zonal_id;
		$response['default_zonal_value'] = $default_zonal_value;
		echo json_encode($response);
	}
?>