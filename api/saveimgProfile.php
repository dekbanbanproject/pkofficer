<?php    
        error_reporting(E_ERROR | E_PARSE);
    
        //Response 
        $reponse = new stdClass;
        $reponse->status = null;
        $reponse->message = null;

        //Upload Image  file
        $destination_dir = "images/Profile/";
        $base_filename = basename($_FILES["file"]["name"]);
        $target_file = $destination_dir . $base_filename;

        if (!$_FILES["file"]["error"]) {
        if (move_uploaded_file($_FILES["file"]["tmp_name"],$target_file)) {
                $reponse->status = true;
                $reponse->message = "File Uploaded SuccessFully";
        } else {
                $reponse->status = false;
                $reponse->message = "File Uploaded Failed";
        }
        
        } else {
                $reponse->status = false;
                $reponse->message = "File Uploaded Failed";
        }

        header('Content-Type: application/json');
        echo json_encode($reponse);
 
?>