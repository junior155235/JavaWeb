<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>尋回密碼</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Arial", "Microsoft JhengHei", sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>忘記密碼了嗎？</h2>
					<p>通過簡單的三步驟找回你的密碼</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span>在下方輸入您註冊會員使用的電子信箱</li>
						<li><span class="text-primary text-medium">2. </span>系統會寄送OTP驗證碼到您的信箱</li>
						<li><span class="text-primary text-medium">3. </span>請在下個頁面輸入您收到的OTP驗證碼</li>
					</ol>
				</div>
				<form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">輸入您的電子信箱</label> 
							<input class="form-control" type="text" name="email" id="email-for-pass" required>
							<small class="form-text text-muted">輸入您註冊會員使用的電子信箱，稍後會寄送OTP驗證碼到此信箱。</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">更改密碼</button>
						<button class="btn btn-danger" type="button" onclick="redirectToLogin()">返回登入頁面</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
	<script>
		function redirectToLogin() {
  		window.location.href = "login.html";
		}
</script>
</body>
</html>