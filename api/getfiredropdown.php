<?php
    include('config.php');
        
    header("Access-Control-Allow-Origin: *"); 
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
        
             $sql = "SELECT * FROM fire WHERE fire_backup = 'Y' ORDER BY fire_num DESC";
             $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
          
            // if ($result) {
            //     echo "true";
            // } else {
            //     echo "false";
            // }  
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }       

        } else echo "Wellcome";
        
    }

		
    

