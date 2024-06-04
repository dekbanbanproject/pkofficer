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
            $date = date('Y-m-d');

            $fire_id                      = $_GET['fire_id']; 
            // $fire_num                     = $_GET['fire_num'];
            $user_id                      = $_GET['user_id'];
            $fire_check_injection         = $_GET['fire_check_injection'];
            $fire_check_joystick          = $_GET['fire_check_joystick'];
            $fire_check_body              = $_GET['fire_check_body'];
            $fire_check_gauge             = $_GET['fire_check_gauge'];
            $fire_check_drawback          = $_GET['fire_check_drawback'];

            $sql2 = "SELECT * FROM fire WHERE fire_id = '$fire_id'";
            $result2 = mysqli_query($conn, $sql2);
                    
            if ($result2) {
                while($row = mysqli_fetch_row($result2))
                {
                    $fire_id_              = $row[0];
                    $fire_num              = $row[1];
                    $fire_name             = $row[2];
                    $fire_check_location   = $row[5]; 
                    $fire_check_color      = $row[4]; 
                    // $fire_id               = $row["fire_id"];
                    // $fire_name             = $row["fire_name"];
                    // $fire_check_location   = $row["fire_location"]; 
                    // $fire_check_color      = $row["fire_color"]; 
                }
            }

            $datacount_ = mysqli_query($conn,"SELECT * FROM fire_check WHERE check_date = '$date' AND fire_num = '$fire_num'");
            $datacount = mysqli_num_rows($datacount_);  
            if ($datacount > 0) {
                echo "false";
            } else {
    
                    $sql = "INSERT INTO `fire_check` (`fire_check_id`,`check_date`,`fire_num`,`user_id`,`fire_check_injection`,`fire_check_joystick`,`fire_check_body`,`fire_check_gauge`,`fire_check_drawback`,`fire_name`,`fire_check_location`,`fire_check_color`,`fire_id`) 
                    VALUES(Null,'$date','$fire_num','$user_id','$fire_check_injection','$fire_check_joystick','$fire_check_body','$fire_check_gauge','$fire_check_drawback','$fire_name','$fire_check_location','$fire_check_color','$fire_id_')";
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

		
    

