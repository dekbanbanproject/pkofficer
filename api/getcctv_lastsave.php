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
            $y           = date('Y') + 543;
            $newweek     = date('Y-m-d', strtotime($date . ' -2 week')); //ย้อนหลัง 2 สัปดาห์
            $newDate     = date('Y-m-d', strtotime($date . ' -1 months')); //ย้อนหลัง 1 เดือน
            $newyear     = date('Y-m-d', strtotime($date . ' -1 year')); //ย้อนหลัง 1 ปี 

            // $sql = mysqli_query($conn, "SELECT c.*,a.*\n"		
            // . "FROM cctv_check c\n"
            // . "LEFT JOIN article_data a ON a.article_num = c.article_num\n"    	
            // . "WHERE a.cctv = 'Y'\n"
            // . "AND c.cctv_check_date BETWEEN '$newDate' AND '$date' ORDER BY c.cctv_check_date DESC ");	
  
            // $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error()); 
         
            $result = mysqli_query($conn,"SELECT * FROM cctv_check WHERE cctv_check_date BETWEEN '$newDate' AND '$date' ORDER BY cctv_check_date DESC");
 
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
            
        } else echo "Wellcome";
    }

		
    

