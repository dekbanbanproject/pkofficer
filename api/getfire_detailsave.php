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
            $newweek = date('Y-m-d', strtotime($date . ' -1 week')); //ย้อนหลัง 1 สัปดาห์
            $newDate = date('Y-m-d', strtotime($date . ' -1 months')); //ย้อนหลัง 1 เดือน
            $newyear = date('Y-m-d', strtotime($date . ' -1 year')); //ย้อนหลัง 1 ปี 

            // $sqly = "SELECT leave_year_id FROM budget_year WHERE years_now = 'Y'";
            // $result_y = mysqli_query($conn, $sqly);
            // if ($result_y) {
            //     while($rows = mysqli_fetch_row($result_y))
            //     {
            //         $fire_year_niw   = $rows[0];
           
            //     }
            // }

            $fireNum                     = $_GET['fire_num'];

            $sql = "SELECT * FROM fire WHERE fire_num = '$fireNum' AND fire_year = '2568'";
            // $sql2 = "SELECT * FROM fire WHERE fireNum = '$fireNum' AND fire_year = '$fire_year_niw'";
            $result = mysqli_query($conn, $sql);
                    
            // if ($result) {
            //     while($row = mysqli_fetch_row($result))
            //     {
            //         $fire_id_              = $row[0];
            //         $fire_num              = $row[1];
            //         $fire_name             = $row[2];
            //         $fire_check_location   = $row[5]; 
            //         $fire_check_color      = $row[4];  
            //     }
            // }

            // $sql = "SELECT fire_id,fire_id,fire_name,fire_location,fire_color FROM fire WHERE fire_id = '$fire_id'";
            // $result = mysqli_query($conn, $sql);
            // while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
            // {
            //     $fire_id               = $row["fire_id"];
            //     $fire_name             = $row["fire_name"];
            //     $fire_check_location   = $row["fire_location"]; 
            //     $fire_check_color      = $row["fire_color"]; 
            // }
            // $result = mysqli_query($conn,"SELECT * FROM fire_check WHERE check_date BETWEEN '$newDate' AND '$date' ORDER BY check_date DESC");
 
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
            
        } else echo "Wellcome";
    }

		
    

