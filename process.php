<?php
$target_dir = "uploads/";
$compressrate = $_POST["compressrate"];
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
echo ("aaaaaaa");
echo shell_exec("python /usr/local/bin/youtube-dl -f 18 https://www.youtube.com/watch?v=6WP43WfbXTU --prefer-ffmpeg -o '/home/ubuntu/%(title)s.(ext).s'");

?>
