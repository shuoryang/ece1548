<html>
<head>
<title>Downloading</title>
</head>
<body>
<?php
$URL = $_POST["URL"];
$type = $_POST["type"];

// Check if image file is a actual image or fake image
echo ("");
shell_exec("python /usr/local/bin/youtube-dl $URL -f $type --restrict-filenames --prefer-ffmpeg -o 'data/%(title)s-%(resolution)s.%(ext)s'");
$fileName = shell_exec("python /usr/local/bin/youtube-dl $URL -f $type --restrict-filenames --prefer-ffmpeg -o 'data/%(title)s-%(resolution)s.%(ext)s' --get-filename");
//header("Location: input.html"); /* Redirect browser */

?>

<form action='download.jsp' method='post' name='frm'>
<?php
foreach ($_POST as $a => $b) {
echo "<input type='hidden' name='".htmlentities($a)."' value='".htmlentities($b)."'>";
}
echo "<input type='hidden' name='fileName' value='$fileName'>";
?>
<div align="center" style="position:fixed; top:20%; left:50%; margin-left:-8em">
<h2 align='center'> Enjoy your Video!<h2>
<noscript><input type="submit" value="Click here if you are not downloading."/></noscript>
<input type="button" value="Start a new download" onclick="location.href='input.html'" />
</div>
</form>
<script language="JavaScript">
document.frm.submit();
</script>
</body>
</html>

