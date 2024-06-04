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

            $fire_num   = $_GET['fire_num'];
            $check_date = $_GET['check_date'];

            $sql = "DELETE FROM fire_check WHERE fire_num = '$fire_num' AND check_date = '$check_date'";
            $result = mysqli_query($conn,$sql);

           if ($result) {
            echo "true";
           } else {
            echo "false";
           }
           
            
        } else echo "Wellcome";
    }

		
    

