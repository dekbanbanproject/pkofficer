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
            $fire_num                     = $_GET['fire_num'];
            $fire_num_chang               = $_GET['fire_num_chang'];
            $userid                       = $_GET['userid'];
            $fire_chang_comment           = $_GET['fire_chang_comment'];
            
            $fire_chang_date              = $date; 

            $sql2 = "SELECT * FROM fire WHERE fire_id = '$fire_id'";
            $result2 = mysqli_query($conn, $sql2);
                   
            // $datacount_ = mysqli_query($conn,"SELECT * FROM fire_check WHERE check_date = '$date' AND fire_num = '$fire_num'");
            // $datacount = mysqli_num_rows($datacount_);  
            // if ($datacount > 0) {
            //     echo "false";
            // } else {
    
                    $sql = "INSERT INTO `fire_chang` (`fire_chang_id`,`fire_id`,`fire_num`,`fire_chang_date`,`userid`,`fire_chang_comment`,`fire_num_chang`) 
                    VALUES(Null,'$fire_id','$fire_num','$fire_chang_date','$userid','$fire_chang_comment','$fire_num_chang')";
                    $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());

                    $sqlup1    = "UPDATE `fire` SET `active` = 'N',`fire_backup` = 'N',`fire_edit` = 'Chang' WHERE fire_id = '$fire_num_chang'"; 
                    $resultup1 = mysqli_query($conn, $sqlup1) or die ("Error : $sqlup1" .mysqli_error()); 
                    // if ($fire_check_injection =='1' || $fire_check_joystick == '1' || $fire_check_body=='1' || $fire_check_gauge == '1' || $fire_check_drawback =='1') {
                    $sqlup    = "UPDATE `fire` SET `active` = 'Y' WHERE fire_id = '$fire_id'"; 
                    $resultup = mysqli_query($conn, $sqlup) or die ("Error : $sqlup" .mysqli_error()); 
                    // } 

                    if ($resultup) { 
                        echo "true";
                    }else{
                        echo "false";
                    }
               
            // }
               
        } else echo "Wellcome";
    }

		
    

