<?php
    include('config.php');
        
    header("Access-Control-Allow-Origin: *");
    // $conn = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91','gtw'); 

    if (!$conn) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
        exit;
    }
    if (!$conn->set_charset("utf8")) {
        printf("Error loading character set utf8: %s\n", $conn->error);
        exit();
    }
    if(isset($_GET)){
        if ($_GET['isAdd'] == 'true') {
            $date        = date('Y-m-d');
            $y = date('Y') + 543;
            $m = date('m');
            $newweek = date('Y-m-d', strtotime($date . ' -1 week')); //ย้อนหลัง 1 สัปดาห์
            $newDate = date('Y-m-d', strtotime($date . ' -1 months')); //ย้อนหลัง 1 เดือน
            $newyear = date('Y-m-d', strtotime($date . ' -1 year')); //ย้อนหลัง 1 ปี 
   
             //Qury article_data
            //  $sql = "SELECT * FROM cctv_check WHERE article_num = '$article_num'";
            //  $sql2 = "SELECT `article_name`,`cctv_location`,`cctv_type`,`fire` FROM article_data WHERE article_num = '$article_num'";
            //  $resline2 = mysqli_query($conn, $sql2) or die ("Error : $sql2" .mysqli_error());
            //  while($obje = mysqli_fetch_array($resline2,MYSQLI_ASSOC))
            //  {
            //      $article_num_       = $obje["article_num"];
            //      $fire_              = $obje["fire"]; 
            //      $cctv_type_         = $obje["cctv_type"]; 
            //      $fire_              = $obje["fire"]; 
            //      $cctv_location_     = $obje['cctv_location'];   
            //  }
            // $result = mysqli_query($conn,"SELECT article_id,article_num, article_name,article_price ,article_year,article_recieve_date,article_typeid,article_typename\n"
            //         . ",article_categoryid,article_categoryname,article_groupid,article_groupname,article_status_id,article_img,article_img_name,store_id,cctv,cctv_location\n"
            //         . ",cctv_location_detail,cctv_type,cctv_code,cctv_monitor,cctv_status\n"
            //         . "FROM article_data WHERE fire ='Y'
            // ");
            $fire_num                     = $_GET['fire_num'];
            $sql_year = "SELECT leave_year_id FROM budget_year WHERE years_now = 'Y' ";
            $result_year = mysqli_query($conn, $sql_year);
            if ($result_year) {
                while($row_y = mysqli_fetch_row($result_year))
                {
                    $budget_year      = $row_y[0]; 
                }
            }
            $result = mysqli_query($conn,"SELECT * FROM fire WHERE fire_num = '$fire_num'");
            // $result = mysqli_query($conn,"SELECT * FROM fire WHERE fire_num = '$fire_num' AND fire_year = '$budget_year'");

            // $sql = "SELECT * FROM cctv_check WHERE cctv_check_date BETWEEN '$newDate' AND '$date' AND fire_extinguisher='Y' ORDER BY cctv_check_date DESC";
            // $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
            // if ($result) {
            //     while($row=mysqli_fetch_assoc($result)){
            //         $output[]=$row;
            //     }
            //     echo json_encode($output);
            // }
            // $sql = mysqli_query($conn, "SELECT c.*,a.*\n"		
            // . "FROM cctv_check c\n"
            // . "LEFT JOIN article_data a ON a.article_num = c.article_num\n"    	
            // . "WHERE a.fire = 'Y'\n"
            // . "AND c.cctv_check_date BETWEEN '$newDate' AND '$date' ORDER BY c.cctv_check_date DESC ");	
  
            // $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error()); 
 
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
            
        } else echo "Wellcome";
    }

		
    

