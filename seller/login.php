<?php include '../classes/Seller.php' ?>
<?php 
$Sle = new Seller();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sellerEmail = $_POST['sellerEmail'];
    $sellerPass = md5($_POST['sellerPass']);

    $loginChk= $Sle->sellerLogin($sellerEmail, $sellerPass);
}


 ?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Seller Login</title>
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css" media="screen" />
</head>
<body>
<div class="container">
	<section id="content">
		<form action="" method="post">
			<h1>Seller Login</h1>
			<span style="color:red; font-size:18px;">
				<?php 
                if (isset($loginChk)) {
                    echo $loginChk;
                }
                ?>
			</span>
			<div>
				<input type="text" placeholder="Email" name="sellerEmail"/>
			</div>
			<div>
				<input type="password" placeholder="Password" name="sellerPass"/>
			</div>
			<div>
				<input type="submit" value="Log in" />
			</div>
		</form>

	</section>
</div>
</body>
</html>
