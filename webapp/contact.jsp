<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>聯絡我們</title>
	<meta name="description" content="Scarica gratis il nostro Template HTML/CSS GARAGE. Se avete bisogno di un design per il vostro sito web GARAGE può fare per voi. Web Domus Italia">
	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/mystyle.css">
	<link rel="stylesheet" type="text/css" href="style/contactstyle.css">
</head>
<body>
<!-- Header -->
<div class="allcontain">
	<div class="header">
			<ul class="socialicon">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
			</ul>
			<% 
			    	if (session.getAttribute("user") == null) { 
			  	%>
			  	<ul class="logreg"style="float: right;">
					<li><a href="login.html">登入 </a> </li>
					<li><a href="signup.html"><span class="register">註冊</span></a></li>
				</ul>
			  <% 
			    } else {
			  %>
				<ul class="logreg"style="float: right; font-size: 16px;margin-top: 2px;">
					<li style="float: right; display: inline;">
					<form action="logout" method="get">
						<button type=submit style="color:black;font-size: 12px;">登出</button>
					</form>
					</li>				
						<li style="float: right; display: inline;">
						<span>歡迎 </span><a href="member_center?id=${user.id}" style="color: #FFC14F;"><span class="register">${user.name}</span></a>
					</li>
				</ul>
			  <% 
			    }
			   %>			
	</div>
	<!-- Navbar Up -->
	<nav class="topnavbar navbar-default topnav">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed toggle-costume" data-toggle="collapse" data-target="#upmenu" aria-expanded="false">
					<span class="sr-only"> Toggle navigaion</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" href="#"><img src="image/WebLogo.jpg" alt="logo" style="width: 100%;"></a>
			</div>	 
		</div>
		<div class="collapse navbar-collapse" id="upmenu">
			<ul class="nav navbar-nav" id="navbarontop">
				<li class="active"><a href="PersonalHome.jsp">主頁</a> </li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">找工作 <span class="caret"></span></a>
					<ul class="dropdown-menu dropdowncostume">
						<li><a href="#">打工</a></li>
						<li><a href="#">任務</a></li>
					</ul>
				</li>
				<li>
					<a href="contact.jsp">聯絡我們</a>
 
				</li>
				
				<button onclick="window.location.href='newjob.jsp'"><span class="postnewcar">刊登新工作</span></button>
				
			</ul>
		</div>
	</nav>
</div>
<!--_______________________________________ Carousel__________________________________ -->
<div class="allcontain">
	<div id="carousel-up" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner " role="listbox">
			<div class="item active">
				<img src="image/pexels-bee1.jpg" alt="公告1">
				<div class="carousel-caption">
					<h2>歡迎</h2>
					<p>職場機會盡在眼前，找到工作快速上工！ </p>
				</div>
			</div>
			<div class="item">
				<img src="image/pexels-bee2.jpg" alt="公告2">
				<div class="carousel-caption">
					<h2>找工作</h2>
						<p>要成功，先發瘋，下定決心往前衝！ </p>
				</div>
			</div>
			<div class="item">
				<img src="image/pexels-bee3.jpg" alt="公告3">
				<div class="carousel-caption">
					<h2>為生活</h2>
					<p>拚搏創造價值，努力成就未來! </p>
				</div>
			</div>
		</div>
		
	</div>
</div>
<div class="allcontain">
	<div class="contact">
		<div class="newslettercontent">
			<div class="leftside">
				<img id="image_border" src="image/border.png" alt="border">
					<div class="contact-form">
						<h1>聯絡我們</h1>
							<div class="form-group group-coustume">
								<input type="text" class="form-control name-form" placeholder="姓名">
								<input type="text" class="form-control email-form" placeholder="E-mail">
								<input type="text" class="form-control subject-form" placeholder="標題">
								<textarea rows="4" cols="50" class="message-form"></textarea>
								<button type="submit" class="btn btn-default btn-submit">送出</button>
							</div>
					</div>
			</div>
			<div class="google-maps">
			 <div id="googleMap"></div>

			</div>
		</div>

	</div>
</div>
<!-- ______________________________________________________下方菜單 ______________________________-->
<div class="bottommenu">
	<div class="bottomlogo">
	<span class="dotlogo">&bullet;</span><img src="image/WebLogo.jpg" alt="logo" style="width: 10%;"><span class="dotlogo">&bullet;</span>
	</div>
	<ul class="nav nav-tabs bottomlinks" >
		<li role="presentation" ><a href="#/">求職服務</a></li>
		<li role="presentation"><a href="#/">關於我們</a></li>
		<li role="presentation"><a href="#/">聯絡我們</a></li>
		<li role="presentation"><a href="#/">平台規範</a></li>
	</ul>
	<p>一個快速找工作、找人材的平台</p>
	 <img src="image/line.png" alt="line"> <br>
	 <div class="bottomsocial">
		 <a href="#"><i class="fa fa-facebook"></i></a>
		<a href="#"><i class="fa fa-twitter"></i></a>
		<a href="#"><i class="fa fa-google-plus"></i></a>
		<a href="#"><i class="fa fa-pinterest"></i></a>
	</div>
		<div class="footer">
			<div class="copyright">
			  &copy; Copy right 2023 | <a href="#">隱私政策 </a>
			</div>
		</div>
</div>



<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>

var myCenter=new google.maps.LatLng(24.930900665948382, 121.17203534834745);

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:16,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}



</script>

<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
<script type="text/javascript" src="source/js/myscript.js"></script> <script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>

<script>
	$(window).resize(function(){
		var new_height = $("#image_border").height();
		console.log(new_height);
		$("#googleMap").height(new_height);
	});

	$(window).load(function(){
		var new_height = $("#image_border").height();
		console.log(new_height);
		$("#googleMap").height(new_height);
		google.maps.event.addDomListener(window, 'load', initialize());
	});
	
</script>
<script type="text/javascript" src="source/js/myscript.js"></script>
<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
</body>
</html>