<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:forEach var="data" items="${dataList}">
    	<c:if test="${data.getJob_id() eq param.job_id}">
			<title>${data.getJob_name()}</title>
		</c:if>
	</c:forEach>
	<meta name="description" content="Scarica gratis il nostro Template HTML/CSS GARAGE. Se avete bisogno di un design per il vostro sito web GARAGE può fare per voi. Web Domus Italia">
	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/job_list.css">
    <link rel="stylesheet" type="text/css" href="style/job_detail.css">
	<script>
		var descriptionElements = document.getElementsByClassName('job-description');
		for (var i = 0; i < descriptionElements.length; i++) {
			var description = descriptionElements[i];
			var maxHeight = parseInt(description.getAttribute('data-max-height'));
	
			if (description.clientHeight > maxHeight) {
				var text = description.innerHTML;
				while (description.clientHeight > maxHeight) {
					text = text.replace(/\W*\s(\S)*$/, '...');
					description.innerHTML = text;
				}
			}
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
					<li>
						<a href="login.html">登入 </a> 
					</li>
					<li>
						<a href="signup.html"><span class="register">註冊</span></a>

					</li>
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
					<button onclick="checkLogin()"><span class="postnewcar">刊登新工作</span></button>
				</ul>
			</div>
		</nav>
	</div>
<!--_______________________________________ 上方輪換banner__________________________________ -->
	<div class="allcontain">
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
								<a class="btn  dropdown-toggle btn-costume" onclick="citySelect()" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ><span id="city_div">縣市</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
								<ul class="dropdown-menu" id="mydd" name="mydd" >
									
								</ul>
							</li>
							<li class="li-jobkind">
							    <a class="btn  dropdown-toggle btn-costume"  id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span id="district_div">鄉鎮市</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
								<ul class="dropdown-menu" id="mydd2" name="mydd2" >
									<li><a href="#" data-value="">請先選擇縣市</a></li>
								</ul>
							</li>
							<li class="li-jobtime">
							    <a class="btn dropdown-toggle btn-costume"  id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span id="salaryType_div">支薪類型</span><span class="glyphicon glyphicon-chevron-down downicon"></span></a>
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

				<c:forEach var="data" items="${dataList}">
    <c:if test="${data.getJob_id() eq param.job_id}">
        <div class="job_info_area">
            <div class="wrap-key-point">
                <div class="job_info_header">
                    <div class="job_info_header_item">
                        <h1 id="job-h1-title">${data.getJob_name()}</h1>
                        <div class="job_salary_address-block">
                            <h2>${data.getSalary_type()}\$${data.getSalary()}</h2>
                        </div>
                    </div>
                </div>
                
            </div>
            <section class="job-content">
                <div class="wrap-content">
                    <p class="litile_title"><img src="image/work.png" alt="X">工作內容</p>
                    <div class="text">
                        <p>${data.getJob_info()}</p>
                    </div>
                </div>
            </section>
            <section class="job-address">
                <div class="wrap-content">
                    <p class="litile_title"><img src="image/place.png" alt="X">工作地點</p>
                    <p class="text">${data.getJob_city()}${data.getJob_district()}</p>  
                </div>
            </section>
        </div>
    </c:if>
</c:forEach>
		
		
		<ul class="job-list" style="margin-top: 20px;">
			<div class="wrap-content">
				<p class="litile_title"><img src="image/work.png" alt="X">最新工作</p>
			</div>
				<c:forEach var="data" items="${dataList}">
					<li class="job-item">
		               <div class="job-info">
							<div>
							<h2 class="job-title">${data.getJob_name()}</h2>
							<span class="job-salary" >${data.getSalary_type()}\$${data.getSalary()}</span>
							<span class="job-place" >${data.getJob_city()}${data.getJob_district()}</span>
							</div>
							<p class="job-uploader">${data.getUser_name()}</p>
							<p class="up-date">${data.getJob_publishDate()}</p>
							<div class="apply-container">
							<%
									int current_page = Integer.parseInt(request.getParameter("page"));
								%>
								<a href="job_detail.jsp?job_id=${data.getJob_id()}&id=${user.id}&page=<%= current_page %>" class="apply-button">立即查看</a>   
							</div>
						</div>
					</li>
            	</c:forEach>
			<!-- 添加更多列表项 -->
		</ul>
	</div>
	<section id="call-to-action" class="call-to-action" style="background-color: rgb(255, 250, 244);">
		<div class="wrap-call-to-action">
			<form action="Get_job" method="get" id="apply">
				<%
					int job_id = Integer.parseInt(request.getParameter("job_id"));
					int current_page = Integer.parseInt(request.getParameter("page"));
				%>
				
				<input type="hidden" id="jobid" name="jobid" value="<%= job_id %>">
				<input type="hidden" id="current_page" name="page" value="<%= current_page %>">
				<input type="hidden" id="id" name="id" value="${user.id}">
				<button type="button" id="go-to-apply" name="go-to-apply" onclick="checkLoginForApply()">
					<div class="btn-text">立即應徵</div>
				</button>
			</form>
		</div>
	</section>
	
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
	<script type="text/javascript" src="source/js/checkLogin.js"></script>
	<script type="text/javascript" src="source/js/selection.js"></script> 
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
	<script type="text/javascript" src="source/js/isotope.js"></script>
	<script type="text/javascript" src="source/js/myscript.js"></script> 
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="source/js/job_detail.js"></script>
</body>
</html>