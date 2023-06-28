<%@   page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<meta charset="UTF-8">
	<title>首頁</title>
	<meta name="description" content="Scarica gratis il nostro Template HTML/CSS GARAGE. Se avete bisogno di un design per il vostro sito web GARAGE può fare per voi. Web Domus Italia">
	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/js/jquery.js">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/mystyle.css">
	<%
		session.removeAttribute("dataList");
	%>
	
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
					<li>
						<a href="login.html">登入 </a> 
					</li>
					<li>
						<a href="signup.html"><span class="register">註冊</span></a>
						<input type="hidden" id="id" name="id" value="${user.id}">
					</li>
				</ul>
			  <% 
			    } else {
			    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
					response.setHeader("Pragma", "no-cache");
					response.setDateHeader("Expires", 0);
			    	HttpSession session_new = request.getSession();
			    	session_new.setAttribute("user", session.getAttribute("user"));

			  %>
				<ul class="logreg"style="float: right; font-size: 16px;margin-top: 2px;">
					<li style="float: right; display: inline;">
					<form action="logout" method="get">
						<button type=submit style="color:black;font-size: 12px;">登出</button>
						<input type="hidden" id="id" value="${user.id}">
					</form>
					</li>				
					<li style="float: right; display: inline;">
						<span>歡迎 </span><a href="member_center" style="color: #FFC14F;"><span class="register">${user.name}</span></a>
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
							<li><a href="#">時薪打工</a></li>
							<li><a href="#">單次任務</a></li>
						</ul>
					</li>
					<li>
						<a href="contact.jsp">聯絡我們</a>
	 
					</li>
					
					<button onclick="checkLogin()"><span class="postnewcar">刊登新工作</span></button>
					
				</ul>
			</div>
		</nav>
	</div>
<!--_______________________________________ 上方輪換banner__________________________________ -->
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
						<h2>努力</h2>
							<p>要成功，先發瘋，下定決心往前衝！ </p>
					</div>
				</div>
				<div class="item">
					<img src="image/pexels-bee3.jpg" alt="公告3">
					<div class="carousel-caption">
						<h2>生活</h2>
						<p>拚搏創造價值，努力成就未來! </p>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-default midle-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed textcostume" data-toggle="collapse" data-target="#navbarmidle" aria-expanded="false">
							<h1>找好工作！</h1>
						<span class="sr-only">切換導覽</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navbarmidle">
					<div class="searchtxt">
						<h1>找好工作！</h1>
					</div>
					<form id="jobForm" action="jobList" method="get">
						<ul class="nav navbar-nav navbarborder">
							<li class="li-category">
								<a class="btn  dropdown-toggle btn-costume" onclick="citySelect()" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" >
								<span id="city_div">縣市</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
								<ul class="dropdown-menu" id="mydd" name="mydd" >
									
								</ul>
							</li>
							<li class="li-jobkind">
							    <a class="btn  dropdown-toggle btn-costume"  id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    <span id="district_div">鄉鎮市</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
								<ul class="dropdown-menu" id="mydd2" name="mydd2" >
									<li><a href="#" data-value="">請先選擇縣市</a></li>
								</ul>
							</li>
							<li class="li-jobtime">
							    <a class="btn dropdown-toggle btn-costume"  id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    <span id="salaryType_div">支薪類型</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
								<ul class="dropdown-menu" id="mydd3" name="mydd3" >
									<li><a href="#" data-value="時薪" onclick="liSalaryTypeSelect(event)">時薪</a></li>
									<li><a href="#" data-value="一次性" onclick="liSalaryTypeSelect(event)">一次性</a></li>
								</ul>
							</li>
							<li>
								<input type="hidden" id="newpage" name="page" value="">
								<input type="hidden" id="newcity" name="city" value="">
								<input type="hidden" id="newdistrict" name="district" value=""> 
								<input type="hidden" id="newsalary_Type" name="salary_Type" value="">
								<span class="navbar-form navbar-left searchformmargin" role="search">
									
								</span>
							</li>
							
							<li class="li-search"> <button class="searchbutton" onclick="doSearch(event)"><span class="glyphicon glyphicon-search "></span></button></li>
				    	</ul>
					</form>
	 
				</div>
			</nav>
		</div>
	</div>
	<div class="job">
		<ul class="job-list">
			<ul class="job-line">
				<li>
					<div class="list-title">
						<span>工作 / 待遇 / 地點</span>
						<span>刊登案主</span>
						<span>更新日期</span>
						<div class="space">
							<span>詳細資訊</span>   
						</div>
					</div>
				</li>
			</ul>
			<li class="job-item">
				<div class="job-info">
					<div>
					<h2 class="job-title">快剪1</h2>
					<span class="job-salary" >時薪$200</span>
					<span class="job-place" >桃園市楊梅區</span>
					</div>
					<p class="job-uploader">羅小姐</p>
					<p class="up-date">2023-05-17</p>
					<div class="apply-container">
						<a href="#" class="apply-button">立即查看</a>   
					</div>
				</div>
				
			</li>
			<li class="job-item">
				<div class="job-info">
					<div>
					<h2 class="job-title">快剪2</h2>
					<span class="job-salary" >時薪$200</span>
					<span class="job-place" >桃園市楊梅區</span>
					</div>
					<p class="job-uploader">羅小姐</p>
					<p class="up-date">2023-05-17</p>
					<div class="apply-container">
						<a href="#" class="apply-button">立即查看</a>   
					</div>
				</div>
				
			</li>
			<li class="job-item">
				<div class="job-info">
					<div>
					<h2 class="job-title">快剪3</h2>
					<span class="job-salary" >時薪$200</span>
					<span class="job-place" >桃園市楊梅區</span>
					</div>
					<p class="job-uploader">羅小姐</p>
					<p class="up-date">2023-05-17</p>
					<div class="apply-container">
						<a href="#" class="apply-button">立即查看</a>   
					</div>
				</div>
				
			</li>
		<li style="background: black;"><span style="font-size: 2rem; "><a href="jobList?page=1&city=&district=&salary_Type=" style="color: #E9B33E;">點此查看更多工作機會</a></span></li>
		</ul>
		
		
	</div>
<!-- _______________________________電子報____________________-->
	<div class="allcontain">
		<div class="newslettercontent">
			<div class="leftside">
				<img src="image/border.png" alt="border">
				<h1>通訊電子報</h1>
				<p>立即訂閱本網站電子報，定期發送好康訊息及全新工作機會！</p>
			</div>
			<div class="rightside">
				<img class="newsimage" src="image/newsletter.jpg" alt="newsletter">
				<input type="text" class="form-control" id="subemail" placeholder="EMAIL">
				<button>訂閱</button>
			</div>
		</div>
	</div>
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

	


	<script type="text/javascript" src="source/js/checkLogin.js"></script> 
	<script type="text/javascript" src="source/js/selection.js"></script> 
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
	<script type="text/javascript" src="source/js/isotope.js"></script>
	<script type="text/javascript" src="source/js/myscript.js"></script> 
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
	
	
</body>
</html>