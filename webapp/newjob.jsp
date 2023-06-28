<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.* ,JavaBean.Jdbc" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<meta charset="UTF-8">
	<title>新增職缺</title>
	<meta name="description" content="Scarica gratis il nostro Template HTML/CSS GARAGE. Se avete bisogno di un design per il vostro sito web GARAGE può fare per voi. Web Domus Italia">
	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/mystyle.css">
	<link rel="stylesheet" type="text/css" href="style/signup.css">
<script>
	window.onload = function citylist()
	{
		 citySelect();
		 
	}
</script>
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
						<span>歡迎 </span>
						<a href="member_center?id=${user.id}" style="color: #FFC14F;"><span class="register">${user.name}</span></a>
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
				<li>
					<a href="contact.jsp">聯絡我們</a>
 
				</li>
			</ul>
		</div>
	</nav>
</div>
<!--_______________________________________ 上方輪換banner__________________________________ -->

<div class="signup-page" style="max-height: 1366px;">
	<h1>新增職缺資訊</h1>
	<form action="new_Job" method="get" id="newjob">
		<label for="job_name">職缺名稱</label>
		<input type="text" id="job_name" name="job_name" required>
		<label for="job_info">職缺資訊</label>
		<textarea id="job_info" name="job_info" rows="10" cols="50" maxlength="255"required></textarea>
		<label for="job_city">工作城市</label>
		<select id="job_city" name="job_city" onchange="getDistrict()" >
			<option value="">--請選擇--</option>
		</select>
		<label for="job_district">工作區域</label>
		<select id="job_district" name="job_district" >
			<option value="">--請選擇--</option>
		</select>
		<label for="job_require">學歷需求</label>
		<select id="job_require" name="job_require" required>
			<option value="">--請選擇--</option>
			<option value="國中以下">國中以下</option>
			<option value="國中">國中</option>
			<option value="高中">高中</option>
			<option value="大專">大專</option>
			<option value="大專以上">大專以上</option>
		</select>
		
		<label for="salary_type">薪資類型</label>
		<select id="salary_type" name="salary_type" required>
			<option value="">--請選擇--</option>
			<option value="時薪">時薪</option>
            <option value="一次性">一次性</option>
		</select>
		<label for="salary">薪資金額</label>
		<input type="text" id="salary" name="salary" required>
		
		<input type="hidden" name="id" id="id" value="${user.getId()}">
		<input type="button" value="新增職缺" onclick="doCheckJobInfo()" >	
	</form>
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
<script type="text/javascript" src="source/js/selectionForNewJob.js"></script>
<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
<script type="text/javascript" src="source/js/isotope.js"></script>
<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="source/js/newJob.js"></script>


</body>
</html>