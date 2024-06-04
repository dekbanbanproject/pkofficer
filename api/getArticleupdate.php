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
            $cctv_check_id = $_GET['cctv_check_id'];
            $screen        = $_GET['cctv_camera_screen'];
            $corner        = $_GET['cctv_camera_corner'];
            $drawback      = $_GET['cctv_camera_drawback'];
            $camera_save   = $_GET['cctv_camera_save'];
            $power_backup  = $_GET['cctv_camera_power_backup'];

            //Qury article_data
            $sql3 = "SELECT `article_num` FROM cctv_check WHERE cctv_check_id = '$cctv_check_id'";
            $resline3 = mysqli_query($conn, $sql3) or die ("Error : $sql3" .mysqli_error());
            while($obje2 = mysqli_fetch_array($resline3,MYSQLI_ASSOC))
            {
                $article_num_s         = $obje2["article_num"];
                // $category_             = $obje2["category"]; 
                // $cctv_type_         = $obje2["cctv_type"]; 
                // $fire_              = $obje2["fire"]; 
                // $cctv_location_     = $obje2['cctv_location'];   
            }

             //Qury article_data
             $sql2 = "SELECT `article_name`,`cctv_location`,`cctv_type`,`fire` FROM article_data WHERE article_num = '$article_num_s'";
             $resline2 = mysqli_query($conn, $sql2) or die ("Error : $sql2" .mysqli_error());
             while($obje = mysqli_fetch_array($resline2,MYSQLI_ASSOC))
             {
                 $article_num_       = $obje["article_num"];
                 $fire_              = $obje["fire"]; 
                 $cctv_type_         = $obje["cctv_type"];  
                 $cctv_location_     = $obje['cctv_location'];   
             }
             $sql = "UPDATE `cctv_check` SET `cctv_camera_screen` = '$screen',`cctv_camera_corner` = '$corner',`cctv_camera_drawback` = '$drawback',`cctv_camera_save` = '$camera_save',`cctv_camera_power_backup` = '$power_backup',`cctv_type` = '$cctv_type_',`cctv_location` = '$cctv_location_',`category` = 'cctv' WHERE cctv_check_id = '$cctv_check_id'";
            // $sql = "UPDATE `cctv_check` SET `cctv_camera_screen` = '$screen',`cctv_camera_corner` = '$corner',`cctv_camera_drawback` = '$drawback',`cctv_camera_save` = '$camera_save',`cctv_camera_power_backup` = '$power_backup',`cctv_type` = '$cctv_type_',`cctv_location` = '$cctv_location_' WHERE cctv_check_id = '$cctv_check_id'";
            $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
            
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
            
        } else echo "Wellcome";
    }

		
    

