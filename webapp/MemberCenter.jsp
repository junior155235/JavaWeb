<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="userbean" class="JavaBean.User" scope="page"/>
<jsp:useBean id="job" class="JavaBean.Job" scope="page"/>
<jsp:useBean id="give_job" class="JavaBean.Job" scope="page"/>
<%@page import="java.sql.* ,JavaBean.Jdbc,JavaBean.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>會員中心</title>
	<meta name="description" content="Scarica gratis il nostro Template HTML/CSS GARAGE. Se avete bisogno di un design per il vostro sito web GARAGE può fare per voi. Web Domus Italia">
	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/job_list.css">
	<link rel="stylesheet" type="text/css" href="style/center.css">
	<script src="source/js/jquery-1.8.3.min.js"></script>
	<script src="source/js/index2.js"></script>

	
	<%
	if(session.getAttribute("user") == null)
	{
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		System.out.println("\n  jsp user is null");
		response.sendRedirect("PersonalHome.jsp");
	}
	else
	{
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		System.out.println("\n  jsp user not null\n");
		User u = (User) session.getAttribute("user");
	    int userId = u.getId();
	    session.setAttribute("user", session.getAttribute("user"));
		Jdbc jd = new Jdbc();
		Connection conn = jd.get_Connection();
		String sql = "SELECT um.user_mail, ud.user_name, ud.user_birthDate, ud.user_phone ,ud.user_password, ud.user_gender, ud.user_learn " +
		             "FROM user_main um " +
		             "JOIN user_data ud ON um.user_id = ud.user_id " +
		             "WHERE um.user_id = ?";
									
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, userId);
		ResultSet rs = st.executeQuery();
		if (rs.next()) 
		{
			userbean.setId(userId);
			userbean.setName(rs.getString("user_name"));
			userbean.setMail(rs.getString("user_mail"));
			userbean.setDate(rs.getString("user_birthDate"));
			userbean.setPassword(rs.getString("user_password"));
			userbean.setGender(rs.getString("user_gender"));
			userbean.setLearn(rs.getString("user_learn"));
			userbean.setPhone(rs.getString("user_phone"));
		}
	}

	%>
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
				
				<ul class="logreg"style="float: right; font-size: 16px;margin-top: 2px;">
					<li style="float: right; display: inline;">
					<form action="logout" method="get">
						<button type=submit style="color:black;font-size: 12px;">登出</button>
					</form>
					</li>				
						<li style="float: right; display: inline;">
						<span>歡迎 </span><a href="member_center" style="color: #FFC14F;"><span class="register">${user.name}</span></a>
					</li>
				</ul>			
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
					<button onclick="window.location.href='newjob.jsp'"><span class="postnewcar">刊登新工作</span></button>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="allcontain" style="overflow: hidden;">
		<div class="centers_ml">
			<!--列表go-->
			<div class="centers_listm">
				<div class="centers_listm_one">
					<img src="image/zshy.png"/>
					<em>會員中心</em>
				</div>
				<!--項目起始-->
				<div class="centers_listm_one_in">
					<img src="image/shezhi.png"/>
					<em>資料管理</em>
					<b></b>
				</div>
				<span class="left_menu">
					<a href="#" class="center_in_self" id="memberInfoLink"><font>個人資料</font></a>
				</span>
				<!--項目起始-->
				<div class="centers_listm_one_in">
					<img src="image/suo.png"/>
					<em>帳戶安全</em>
					<b></b>
				</div>
				<span class="left_menu">
					<a href="#" class="center_in_self" id="passwordLink"><font>更改密碼</font></a>
				</span>    
				<!--項目起始-->
				<div class="centers_listm_one_in">
					<img src="image/ddgl.png"/>
					<em>工作管理</em>
					<b></b>
				</div>
				<span class="left_menu">
					<a href="#" class="center_in_self" id="myJobLink"><font>我的工作</font></a>
					<a href="newjob.jsp?id=${user.id}" class="center_in_self"><font>刊登新工作</font></a>
					<a href="#" class="center_in_self" id="postJobLink"><font>已刊登工作管理</font></a>
				</span>
			</div>
			<script>
			$(function(){
				$(".centers_listm_one_in").click(function(){
				$(this).next(".left_menu").slideToggle().siblings("left_menu").slideUp()
				});
			})
			</script>
		</div>
		<div class="public_m1"style="margin-left:20px; flex:1;width:calc(100% - 170px);">
		    <div class="public_m1" id="memberInfoDiv">
				<div class="public_m2">資料管理</div>
					<div class="zp_nrm">
						<!--right-->
						<div class="zp_nrm_r">
							<p><em>用户名：</em><i>${userbean.getName()}</i></p>
							<p><em>信箱：</em><i>${userbean.getMail()}</i></p>
							<p><em>手機：</em><i>${userbean.getPhone()}</i></p>
							<p><em>性别：</em><i>${userbean.getGender()}</i></p>
							<p><em>生日：</em><i>${userbean.getDate()}</i></p>
							<p><em>學歷：</em><i>${userbean.getLearn()}</i></p>
						</div>
					</div>
				<div class="gezhong_szm_in">
					<input type="button" class="public_m3" value="修改會員資料" id="modifyButton">
				</div>
			</div>
			<!--要修改會員資料才會出現的DIV-->
			<div id="popupFormContainer">
			  <form id="modifyForm">
			    <!-- 表單元素 -->
			    <div class="">
			    <p>用戶名:<input type="text" id="user_name" name="user_name" placeholder="姓名"></p>
			    <p>手機號碼:<input type="text" id="phone_number" name="phone_number" placeholder="台灣地區手機"></p>
			    <p>性別:
			    	<select id="user_gender" name="user_gender" required>
					<option value="">--請選擇--</option>
					<option value="男">男性</option>
					<option value="女">女性</option>
					<option value="其他">其他</option>
					</select>
				</p>
				<p>學歷:
				    <select id="user_learn" name="user_learn" required>
						<option value="">--請選擇--</option>
						<option value="國中以下">國中以下</option>
						<option value="國中">國中</option>
						<option value="高中">高中</option>
						<option value="大專">大專</option>
						<option value="大專以上">大專以上</option>
					</select>
				</p>
			    <input type="button"  value="提交" onclick="doCheckUserInfo() ">
			    <input type="button"  value="取消" onclick="hidePopupForm()">
			    </div>
			  </form>
			</div>
			
			<div class="public_m1" id="passwordDiv">
				<div class="public_m2">更改密碼</div>
				<!--提示訊息-->	
				<div class="tip_notem">
					<ul>
						<li>1.請牢記登入密碼</li>
						<li>2.如果密碼遺失，可以透過綁定的手機或電子信箱尋回密碼</li>
					</ul>
				</div>
				<div class="public_m4">
					<form id="pw_form" name="pw_form" method="get" action="Update_password">
						<input type="hidden" name="user_id" id="user_id" value="${user.getId()}">
						<p>
							<em>原密碼：</em>
							<input type="password" id="user_password" name="user_password" style=" height:23px; border:1px solid #eaeaea; width:140px">
						</p>
						<p>
							<em>新的密碼：</em>
							<input type="password" id="new_password" name="new_password" style=" height:23px; border:1px solid #eaeaea; width:140px">
						</p>
						<p>
							<em>確認密碼：</em>
							<input type="password" id="password_confirm" name="password_confirm" style=" height:23px; border:1px solid #eaeaea; width:140px">
						</p>
						<input type="button" class="public_m3" value="確認修改" onclick="checkPW()">
					</form>
				</div>
			</div>
			
			<div class="public_m1" id="myJobDiv">
				<div class="public_m2">我應徵的工作</div>
				<!--一條訂單訊息-->
				<div class="public_m5">
					<table id="jobTable1" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style=" border-bottom:1px solid #000">       
								<th class="olist1">工作名稱</th>       
								<th class="olist2">支薪類型</th>       
								<th class="olist3">工作地區</th>		
								<th class="olist4">薪資</th>		
								<th class="olist5">發佈時間</th>
								<th class="olist4">工作狀態</th>		
								<th class="olist5">操作</th>
							</tr>	
						    <c:forEach var="data" items="${dataList}">
						      <tr class="jobRow1">		
									<td><a href="#">${data.getJob_name()}</a></td>	 
									<td>${data.getSalary_type()}</td>		
									<td>${data.getJob_city()}${data.getJob_district()}</td>
									<td>${data.getSalary()}</td>
									<td>${data.getJob_publishDate()}</td>
									<td><font class="jds_m">${data.getJob_status()}</font></td>		
									<td>
								      <c:choose>
								        <c:when test="${data.getJob_status() eq '已錄取'}">
								          <a href="${pageContext.request.contextPath}/doneGetJob?job_id=${data.getJob_id()}&id=${user.id}">完成</a>
								          <a href="${pageContext.request.contextPath}/delGetJob?job_id=${data.getJob_id()}&id=${user.id}">取消應徵</a>
								        </c:when>
								        <c:when test="${data.getJob_status() eq '已完成'}">
								        </c:when>
								        <c:when test="${data.getJob_status() eq '未錄取'}">
								        </c:when>
								        <c:otherwise>
								          <a href="${pageContext.request.contextPath}/delGetJob?job_id=${data.getJob_id()}&id=${user.id}">取消應徵</a>
								        </c:otherwise>
								      </c:choose>
								   </td>
							  </tr>
						    </c:forEach>
						</tbody>
					</table>
				</div>
				<!--當沒有東西時的圖片-->
				<div class="public_m6" id="noDataImage1">
					<img src="image/danmgydxm.png"/>
				</div>
				<!--查看更多-->
				<div class="chagd_m">
					<a href="#" id="more1"  onclick="showMore()">查看更多</a>
				</div>
			</div>
			
			<div class="public_m1" id="postJobDiv">
				<div class="public_m2">我刊登的工作 <a href="#"  onclick="showPopupWaitlisted()">應徵者管理</a></div>
				<!--一條訂單訊息-->
				<div class="public_m5">
					<table id="jobTable2"border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style=" border-bottom:1px solid #000">       
								<th class="olist1">工作名稱</th>       
								<th class="olist2">支薪類型</th>       
								<th class="olist3">工作地區</th>		
								<th class="olist4">薪資</th>		
								<th class="olist5">發佈時間</th>
								<th class="olist4">工作狀態</th>		
								<th class="olist5">操作</th>
							</tr>
						    <c:forEach var="data" items="${give_dataList}">
						      <tr class="jobRow2">		
									<td><a href="#">${data.getJob_name()}</a></td>	 
									<td>${data.getSalary_type()}</td>		
									<td>${data.getJob_city()}${data.getJob_district()}</td>
									<td>${data.getSalary()}</td>
									<td>${data.getJob_publishDate()}</td>
									<td><font class="jds_m">${data.getJob_status()}</font></td>
									<td style="display: none;">${data.getJob_id()}</td>	
									<td><a href="#" onclick="showPopupJobForm(this)">編輯</a><a href="${pageContext.request.contextPath}/delGiveJob?job_id=${data.getJob_id()}&id=${user.id}" onclick="warning()">刪除</a></td>
							  </tr>
						    </c:forEach>
						</tbody>
					</table>
				</div>
				<!--當沒有東西時的圖片-->
				<div class="public_m6" id="noDataImage2">
					<img src="image/danmgydxm.png"/>
				</div>
				<div class="chagd_m">
					<a href="#" id="more2" onclick="showMore()">查看更多</a>
				</div>
			</div>
			<!--要修改職缺資訊才會出現的DIV-->
			<div id="popupJobForm" style="display: none;">
			  <form method="get" id="newjob">
			  	<p>
					<label for="job_name">職缺名稱</label>
					<input type="text" id="job_name" name="job_name" placeholder="" required>
				</p>
				<p>
					<label for="job_info">職缺資訊</label>
					<textarea id="job_info" name="job_info" rows="10" cols="50" maxlength="200"required></textarea>
				</p>
				<p>
					<label for="job_city">工作城市</label>
					<select id="job_city" name="job_city" onchange="getDistrict()" >
						<option value="">--請選擇--</option>
					</select>
					<label for="job_district">工作區域</label>
					<select id="job_district" name="job_district" >
						<option value="">--請選擇--</option>
					</select>
				</p>
				<p>
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
				</p>
					<label for="salary">薪資金額</label>
					<input type="text" id="salary" name="salary" required>
					<input type="hidden" name="job_id" id="job_id" value="${data.getJob_id()}">
					<input type="hidden" name="id" id="id" value="${user.getId()}">
					<input type="button"  value="提交" onclick="doCheckJobInfo()">
				    <input type="button"  value="取消" onclick="hidePopupJobForm()">	
				</form>
			</div>
			
			<!--雇主要錄取人才會出現的DIV-->
			<div class="public_m1" id="WaitlistedDiv" style="display:none;">
				<div class="public_m5">
					<table id="jobTable3"border="0" cellspacing="0" cellpadding="0" ">
						<tbody>
							<tr style=" border-bottom:1px solid #000">       
								<th class="olist1">工作名稱</th>       
								<th class="olist2">應徵者編號</th>       
								<th class="olist3">應徵者</th>		
								<th class="olist4">學歷</th>		
								<th class="olist5">手機號碼</th>
								<th class="olist6">工作狀態</th>		
								<th class="olist7">操作</th>
							</tr>
						    <c:forEach var="data" items="${wait_dataList}">
						      <tr class="jobRow3">		
									<td><a href="#">${data.getJob_name()}</a></td>	 
									<td>${data.getUser_id()}</td>		
									<td>${data.getUser_name()}</td>
									<td>${data.getUser_learn()}</td>
									<td>${data.getUser_phone()}</td>
									<td>
										<font class="jds_m">${data.getJob_status()}</font>
										<input type="hidden" value="${data.getJob_id()}">
									</td>
									<td>
										<c:choose>
								        <c:when test="${data.getJob_status() eq '已錄取'}">
								        </c:when>
								        <c:when test="${data.getJob_status() eq '已完成'}">
								        </c:when>
								        <c:otherwise>
								          <a href="#" onclick="accept(this)" data-user_id="${data.getUser_id()}" data-job_id="${data.getJob_id()}">錄取</a>
								        </c:otherwise>
								      </c:choose>
									</td>
							  </tr>
						    </c:forEach>
						</tbody>
					</table>
					<div style="text-align: center;"><input type="button"  value="關閉" onclick="hidePopupWaitlisted()"></div>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- ______________________________________________________下方菜單 ______________________________-->
	<div class="bottommenu">
		<div class="footer">
			<div class="copyright">
				&copy; Copy right 2023 | <a href="#">隱私政策 </a>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="source/js/selectionForNewJob.js"></script>
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
	<script type="text/javascript" src="source/js/isotope.js"></script>
	<script type="text/javascript" src="source/js/myscript.js"></script> 
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
	<script src="source/js/MemberCenter.js"></script>
	
	

</body>
</html>