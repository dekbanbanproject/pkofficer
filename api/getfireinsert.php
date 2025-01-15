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
            $date   = date('Y-m-d');
            $months = date('m');
            $m = date('H');
            $mm = date('H:m:s');
            $datefull = date('Y-m-d H:m:s');

            $fire_id                      = $_GET['fire_id']; 
            $firenum                      = $_GET['fire_num'];
            $user_id                      = $_GET['user_id'];
            $fire_check_injection         = $_GET['fire_check_injection'];
            $fire_check_joystick          = $_GET['fire_check_joystick'];
            $fire_check_body              = $_GET['fire_check_body'];
            $fire_check_gauge             = $_GET['fire_check_gauge'];
            $fire_check_drawback          = $_GET['fire_check_drawback'];
            if ($fire_check_injection == '0') {
                $fire_check_injection_name = 'ปกติ';
            } else {
                $fire_check_injection_name = 'ชำรุด';
            }
            if ($fire_check_joystick == '0') {
                $fire_check_joystick_name = 'ปกติ';
            } else {
                $fire_check_joystick_name = 'ชำรุด';
            }
            if ($fire_check_body == '0') {
                $fire_check_body_name = 'ปกติ';
            } else {
                $fire_check_body_name = 'ชำรุด';
            }
            if ($fire_check_gauge == '0') {
                $fire_check_gauge_name = 'ปกติ';
            } else {
                $fire_check_gauge_name = 'ชำรุด';
            }
            if ($fire_check_drawback == '0') {
                $fire_check_drawback_name = 'ปกติ';
            } else {
                $fire_check_drawback_name = 'ชำรุด';
            }

            $sql_year = "SELECT leave_year_id FROM budget_year WHERE years_now = 'Y' ";
            $result_year = mysqli_query($conn, $sql_year);
            if ($result_year) {
                while($row_y = mysqli_fetch_row($result_year))
                {
                    $budget_year      = $row_y[0]; 
                }
            }
            // $sql2 = "SELECT * FROM fire WHERE fire_num = '$fire_num' AND fire_year = '$budget_year'";
            // $sql2 = "SELECT * FROM fire WHERE fire_id = '$fire_id' AND fire_year = '$budget_year'";
            $sql2 = "SELECT * FROM fire WHERE fire_id = '$fire_id'";
            // $sql2 = "SELECT * FROM fire WHERE fire_num = '$fire_num' AND fire_year = '2568'";
            $result2 = mysqli_query($conn, $sql2);
            // FR020201
            if ($result2) {
                while($row = mysqli_fetch_row($result2))
                {
                    $fire_id_              = $row[0];
                    $fire_year             = $row[1];
                    $fire_num              = $row[2];
                    $fire_name             = $row[3];
                    $fire_size             = $row[4];
                    $fire_color            = $row[5]; 
                    $fire_location         = $row[6]; 
                  

                    // $fire_id_              = $row["fire_id"];
                    // $fire_year             = $row["fire_year"];
                    // $fire_num              = $row["fire_num"];
                    // $fire_name             = $row["fire_name"];
                    // $fire_size             = $row["fire_size"];
                    // $fire_check_location   = $row["fire_location"]; 
                    // $fire_check_color      = $row["fire_color"]; 
                }
            }

            $datacount_ = mysqli_query($conn,"SELECT COUNT(fire_num) FROM fire_check WHERE month(check_date) = '$months' AND fire_num = '$firenum'");
            $datacount = mysqli_num_rows($datacount_);  
            if ($datacount > 0) {
                echo "false";
            } else {
    
                    $sql = "INSERT INTO `fire_check` (`fire_check_id`,`fire_year`,`fire_backup`,`check_date`,`check_time`,`fire_num`,`fire_name`,`user_id`,`fire_check_injection`,`fire_check_injection_name`,`fire_check_joystick`,`fire_check_joystick_name`,`fire_check_body`,`fire_check_body_name`,`fire_check_gauge`,`fire_check_gauge_name`,`fire_check_drawback`,`fire_check_drawback_name`,`fire_check_location`,`fire_check_color`,`fire_id`,`fire_size`) 
                    VALUES(Null,'$fire_year','N','$date','$mm','$fire_num','$fire_name','$user_id','$fire_check_injection','$fire_check_injection_name','$fire_check_joystick','$fire_check_joystick_name','$fire_check_body','$fire_check_body_name','$fire_check_gauge','$fire_check_gauge_name','$fire_check_drawback','$fire_check_drawback_name','$fire_location','$fire_color','$fire_id','$fire_size')";
                    $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());

                    if ($fire_check_injection =='1' || $fire_check_joystick == '1' || $fire_check_body=='1' || $fire_check_gauge == '1' || $fire_check_drawback =='1') {
                        $sqlup    = "UPDATE `fire` SET `active` = 'N' WHERE fire_num = '$fire_num'"; 
                        $resultup = mysqli_query($conn, $sqlup) or die ("Error : $sqlup" .mysqli_error()); 
                    } 

                    if ($result) { 
                        echo "true";
                    }else{
                        echo "false";
                    }
               
            }
               
        } else echo "Wellcome";
    }

		
    

