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
            $fire_check_id          = $_GET['fire_check_id'];
            $fire_num               = $_GET['fire_num'];
            $user_id                = $_GET['user_id'];
            $injection              = $_GET['fire_check_injection'];
            $joystick               = $_GET['fire_check_joystick'];
            $body                   = $_GET['fire_check_body'];
            $gauge                  = $_GET['fire_check_gauge'];
            $drawback               = $_GET['fire_check_drawback'];

            if ($injection == '0') {
                $fire_check_injection_name = 'ปกติ';
            } else {
                $fire_check_injection_name = 'ชำรุด';
            }
            if ($joystick == '0') {
                $fire_check_joystick_name = 'ปกติ';
            } else {
                $fire_check_joystick_name = 'ชำรุด';
            }
            if ($body == '0') {
                $fire_check_body_name = 'ปกติ';
            } else {
                $fire_check_body_name = 'ชำรุด';
            }
            if ($gauge == '0') {
                $fire_check_gauge_name = 'ปกติ';
            } else {
                $fire_check_gauge_name = 'ชำรุด';
            }
            if ($drawback == '0') {
                $fire_check_drawback_name = 'ปกติ';
            } else {
                $fire_check_drawback_name = 'ชำรุด';
            }
            //Qury article_data
            // $sql3 = "SELECT `article_num` FROM cctv_check WHERE cctv_check_id = '$cctv_check_id'";
            // $resline3 = mysqli_query($conn, $sql3) or die ("Error : $sql3" .mysqli_error());
            // while($obje2 = mysqli_fetch_array($resline3,MYSQLI_ASSOC))
            // {
            //     $article_num_s         = $obje2["article_num"];
            //     // $category_             = $obje2["category"]; 
            //     // $cctv_type_         = $obje2["cctv_type"]; 
            //     // $fire_              = $obje2["fire"]; 
            //     // $cctv_location_     = $obje2['cctv_location'];   
            // }

             //Qury article_data
             $sql2 = "SELECT `fire_name`,`fire_location`,`fire_color` FROM fire WHERE fire_num = '$fire_num'";
             $resline2 = mysqli_query($conn, $sql2) or die ("Error : $sql2" .mysqli_error());
             while($obje = mysqli_fetch_array($resline2,MYSQLI_ASSOC))
             {
                 $fire_name          = $obje["fire_name"];
                 $fire_location      = $obje["fire_location"]; 
                 $fire_color         = $obje["fire_color"];   
             }
             $sql = "UPDATE `fire_check` SET `fire_name` = '$fire_name',`fire_check_location` = '$fire_location',`fire_check_color` = '$fire_color',`fire_check_injection` = '$injection',`fire_check_injection_name` = '$fire_check_injection_name',`fire_check_joystick` = '$joystick',`fire_check_joystick_name` = '$fire_check_joystick_name',`fire_check_body` = '$body',`fire_check_body_name` = '$fire_check_body_name',`fire_check_gauge` = '$gauge',`fire_check_gauge_name` = '$fire_check_gauge_name',`fire_check_drawback` = '$drawback',`fire_check_drawback_name` = '$fire_check_drawback_name' WHERE fire_check_id = '$fire_check_id'";
            // $sql = "UPDATE `cctv_check` SET `cctv_camera_screen` = '$screen',`cctv_camera_corner` = '$corner',`cctv_camera_drawback` = '$drawback',`cctv_camera_save` = '$camera_save',`cctv_camera_power_backup` = '$power_backup',`cctv_type` = '$cctv_type_',`cctv_location` = '$cctv_location_' WHERE cctv_check_id = '$cctv_check_id'";
            $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());

            // if ($injection =='1' || $joystick == '1' || $body=='1' || $gauge == '1' || $drawback =='1') {
            //     $sqlup    = "UPDATE `fire` SET `active` = 'N' WHERE fire_num = '$fire_num'"; 
            //     $resultup = mysqli_query($conn, $sqlup) or die ("Error : $sqlup" .mysqli_error()); 
            // } 
            if ($injection =='1' || $joystick == '1' || $body=='1' || $gauge == '1' || $drawback =='1') {
                $sqlup    = "UPDATE `fire` SET `active` = 'N' WHERE fire_num = '$fire_num'"; 
                $resultup = mysqli_query($conn, $sqlup) or die ("Error : $sqlup" .mysqli_error()); 
            } else {
                $sqlup    = "UPDATE `fire` SET `active` = 'Y' WHERE fire_num = '$fire_num'"; 
                $resultup = mysqli_query($conn, $sqlup) or die ("Error : $sqlup" .mysqli_error()); 
            }
            
            
            // $article_num = $_GET['article_num'];
            // $sql = "DELETE FROM cctv_check WHERE article_num = '$article_num'";
            // $result = mysqli_query($conn,$sql);

           if ($result) {
            echo "true";
           } else {
            echo "false";
           }
            
            // if ($result) {
            //     while($row=mysqli_fetch_assoc($result)){
            //         $output[]=$row;
            //     }
            //     echo json_encode($output);
            // }
        // } elseif($_GET['isEditRepaire'] == 'true') { 
        //     // $fire_id      = $_GET['fire_id']; 
        //     // $result = mysqli_query($conn,"SELECT * FROM fire_check WHERE fire_id = '$fire_id'");
        //     $resultrepaire = mysqli_query($conn,"SELECT * FROM fire WHERE active = 'R' ORDER BY fire_num DESC");
        //     if ($resultrepaire) {
        //         while($rowre=mysqli_fetch_assoc($resultrepaire)){
        //             $outputrepaire[]=$rowre;
        //         }
        //         echo json_encode($outputrepaire);
        //     }
        } else echo "Wellcome";
    }

		
    

