<?php
    include('config.php');
    
    header("Access-Control-Allow-Origin: *");
    // $conn = mysqli_connect('192.168.0.217', 'pkoffice', 'pkoffice10978','pkbackoffice'); 

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
           
            $id = $_GET['id'];		
            // $Password = $_GET['password']; 

            // $result = mysqli_query($conn,"SELECT * FROM info_users");
            $result = mysqli_query($conn,"SELECT * FROM users WHERE id = '$id'");
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                // header('Content-type: application/json');
                echo json_encode($output);
            }
        } else echo "Wellcome";
    }

		
    

