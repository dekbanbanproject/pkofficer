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
        if ($_GET['isAddGREEN'] == 'true') {
            $date = date('Y-m-d');
            $article_num                  = $_GET['article_num'];  
            $datacount_ = mysqli_query($conn,"SELECT COUNT(fire_id) fire_id FROM fire WHERE fire_color = 'green' AND active ='Y'"); 
           
            while($objet = mysqli_fetch_array($datacount_,MYSQLI_ASSOC))
            {
                $countdata =$objet['fire_id'];    
            } 

             #ตัดขีด, ตัด : ออก
            $pattern_date = '/-/i';
            $countdata_cut = preg_replace('"',$countdata,'"');
            // $f = '/"/i';
            // $b = '/i/"';
            // $sss_time_now_preg = preg_replace($pattern_time, '', $sss_time_now);
            #ตัดขีด, ตัด : ออก
            
            echo json_encode($countdata);
            
        } else echo "Wellcome";
    }

		
    

