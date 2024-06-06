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
            // img_path
            $id                   = $_GET['id'];  
            $username             = $_GET['username'];
            $passapp              = $_GET['password']; 
            $password_            = $_GET['password']; 
            $img_path            = $_GET['img_path']; 
            // $password             = Hash::make($password_);
            $password             = password_hash($password_, PASSWORD_DEFAULT);
            $sql = "UPDATE `users` SET `username` = '$username',`password` = '$password',`passapp` = '$passapp',`img_path` = '$img_path' WHERE id = '$id'";
            $result = mysqli_query($conn, $sql) or die ("Error : $sql" .mysqli_error());
            if ($result) {
                echo "true";
               } else {
                echo "false";
               }

            
               
        } else echo "Wellcome";
    }

		
    

