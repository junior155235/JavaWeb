function checkPW() 
{   
    
    const PW = document.getElementById("user_password").value;
    const newPW = document.getElementById("new_password").value;
    const confirmPW = document.getElementById("password_confirm").value;
    const id = document.getElementById("user_id").value;
    
    const PWRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,20}$/;
    if (PW === "")
    {
        alert("請輸入密碼！");
        document.getElementById("user_password").focus();
         return false;
    }
    if (!PWRegex.test(newPW))
    {
        alert("密碼至少要包含一個英文字母和一個數字，長度在 7 到 20 個字");
        document.getElementById("new_password").focus();
        return false;
    }
    if (confirmPW !== newPW)
    {
        alert("兩次輸入的密碼不一致");
        document.getElementById("password_confirm").focus();
        return false;
    }
    /*ajax*/
   if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/Update_password?"+
	 					"user_password="+PW+
	 					"&new_password="+newPW
	 					+"&user_id="+id, true);
	
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData.length > 0)
		    	  {
					  alert("修改成功");
			    	  window.location.href = responseData;
		    	  }
			      else
			      {
			    	  
				      alert("密碼錯誤");	      
			      }
			    } else {
			      // 請求失敗
			      console.log("請求失敗，狀態碼：" + xmlHTTP.status);
			    }
			  }
      }
// 發送請求
xmlHTTP.send();
}

function checkTable()
{
	var table1 = document.getElementById("jobTable1");
    var table2 = document.getElementById("jobTable2");
 
    var image1 = document.getElementById("noDataImage1");
    var image2 = document.getElementById("noDataImage2");

    var more1 = document.getElementById("more1");
    var more2 = document.getElementById("more2");

    // 判斷表格是否有數據
    if (table1 && table1.getElementsByTagName("tr").length <= 1) 
    {
      // 隱藏表格
      table1.style.visibility = "collapse";
      // 顯示特定圖片
      image1.style.display = "block";
      // 隱藏查看更多按鈕
      more1.style.display="none"; 
    } else 
    {
      //顯示表格
      table1.style.visibility = "visible";
      //隱藏特定圖片
      image1.style.display = "none";
    }
    
    // 判斷表格是否有數據
    if (table2 && table2.getElementsByTagName("tr").length <= 1) 
    {
      // 隱藏表格
      table2.style.visibility = "collapse";
      // 顯示特定圖片
      image2.style.display = "block";
      // 隱藏查看更多按鈕
      more2.style.display="none"; 
    } else 
    {
      //顯示表格
      table2.style.visibility = "visible";
      //隱藏特定圖片
      image2.style.display = "none";
    }
}
checkTable();

function readClick()
{	
	var memberInfoLink = document.getElementById("memberInfoLink");
	var memberInfoDiv = document.getElementById("memberInfoDiv");
	var passwordLink = document.getElementById("passwordLink");
	var passwordDiv = document.getElementById("passwordDiv");
	var myJobLink = document.getElementById("myJobLink");
	var myJobDiv = document.getElementById("myJobDiv");
	var postJobLink = document.getElementById("postJobLink");
	var postJobDiv = document.getElementById("postJobDiv");


	// 點擊事件處理
	memberInfoLink.addEventListener("click", function() 
	{
	  // 顯示 "個人資料" 相關的 div，隱藏其他 div
	  memberInfoDiv.style.display = "block";
	  passwordDiv.style.display = "none";
	  myJobDiv.style.display = "none";
	  postJobDiv.style.display = "none";
	  
	});
	
	passwordLink.addEventListener("click", function() 
	{
	  // 顯示 "個人資料" 相關的 div，隱藏其他 div
	  memberInfoDiv.style.display = "none";
	  passwordDiv.style.display = "block";
	  myJobDiv.style.display = "none";
	  postJobDiv.style.display = "none";
	  
	});
	
	myJobLink.addEventListener("click", function() 
	{
	  // 顯示 "個人資料" 相關的 div，隱藏其他 div
	  memberInfoDiv.style.display = "none";
	  passwordDiv.style.display = "none";
	  myJobDiv.style.display = "block";
	  postJobDiv.style.display = "none";
	 
	});
	
	postJobLink.addEventListener("click", function() 
	{
	  // 顯示 "個人資料" 相關的 div，隱藏其他 div
	  memberInfoDiv.style.display = "none";
	  passwordDiv.style.display = "none";
	  myJobDiv.style.display = "none";
	  postJobDiv.style.display = "block";
	  
	});
	
}
readClick();

//跳出修改會員資料的DIV
function showPopupForm() 
{
  var popupFormContainer = document.getElementById("popupFormContainer");
  popupFormContainer.style.display = "flex";
}


function hidePopupForm() 
{
  var popupFormContainer = document.getElementById("popupFormContainer");
  popupFormContainer.style.display = "none";
}


function changeMemberInfo()
{
	var modifyButton = document.getElementById("modifyButton");
	modifyButton.addEventListener("click", function() 
	{
  	showPopupForm();
	});
}

changeMemberInfo();

//檢查更改的會員資料
function doCheckUserInfo() 
{   
	const id = document.getElementById("id").value;
    // 檢查姓名欄
    var name = document.getElementById("user_name").value;
    var regex = /^[a-zA-Z\u4e00-\u9fa5]+$/; // 限制只能輸入中英文
    if(name==="")
    {
    alert("請輸入姓名！");
      document.getElementById("user_name").focus();
      return false;
    }

    if (!regex.test(name)) 
    {
      alert("會員姓名不能包含特殊字元及數字！");
      document.getElementById("user_name").focus();
      return false;
    }
    
    //檢查性別欄
    var gender = document.getElementById("user_gender").value;
    if (gender === "") 
    {
      alert("請選擇性別！");
      document.getElementById("user_gender").focus();
      return false;
    }

    //檢查學歷欄
    var learn = document.getElementById("user_learn").value;
    if (learn === "") 
    {
      alert("請選擇學歷！");
      document.getElementById("user_learn").focus();
      return false;
    }
    
    //檢查手機號碼
    var phoneNumber = document.getElementById("phone_number").value;
    if (phoneNumber === "") 
    {
      alert("請輸入手機號碼");
      document.getElementById("phone_number").focus();
      return false;
    }

    var phonePattern = /^09\d{2}-?\d{3}-?\d{3}$/;
    if (!phonePattern.test(phoneNumber)) 
    {
      alert("請輸入台灣地區的手機號碼！");
      document.getElementById("phone_number").focus();
      return false;
    }
    if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/Update_personal_data?"+
	 					"user_id="+id+
	 					"&user_name="+name+
	 					"&phone="+phoneNumber
	 					+"&gender="+gender
	 					+"&learn="+learn, true);
	
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData.length > 0)
		    	  {
					  alert("修改成功");
			    	  window.location.href = responseData;
		    	  }
			      else
			      {
			    	  
				      alert("出現錯誤");	      
			      }
			    } else {
			      // 請求失敗
			      console.log("請求失敗，狀態碼：" + xmlHTTP.status);
			    }
			  }
      }
// 發送請求
	xmlHTTP.send();
	hidePopupForm();
}

//修改以刊登的職缺
function showPopupJobForm(link) 
{ 
  var jobName = link.parentNode.parentNode.querySelector("td:nth-child(1) a").innerText;
  var jobNameInput = document.getElementById("job_name"); 
  jobNameInput.value = jobName;
  jobNameInput.placeholder = jobName;
  
  var job_id = link.parentNode.parentNode.querySelector("td[style='display: none;']").innerText;	
  var popupJobForm = document.getElementById("popupJobForm");
  var job_idInput = document.getElementById("job_id");
  job_idInput.value = job_id;
  popupJobForm.style.display = "flex";
}


function hidePopupJobForm() 
{
  var popupJobForm = document.getElementById("popupJobForm");
  popupJobForm.style.display = "none";
}

function doCheckJobInfo() 
{   
	const id = document.getElementById("id").value;
    // 檢查職缺名稱
    var job_id = document.getElementById("job_id").value;
    var job_name = document.getElementById("job_name").value;
    
    if(job_name==="")
    {
    alert("請輸入職缺名稱！");
      document.getElementById("job_name").focus();
      return false;
    }
    
    //檢查職缺資訊
    var job_info = document.getElementById("job_info").value;
    if (job_info === "") 
    {
      alert("請輸入職缺資訊！");
      document.getElementById("job_info").focus();
      return false;
    }

    //檢查工作城市
    var job_city = document.getElementById("job_city").value;
    if (job_city === "") 
    {
      alert("請選擇工作城市！");
      document.getElementById("job_city").focus();
      return false;
    }

    //檢查工作區域
    var job_district = document.getElementById("job_district").value;
    if (job_district === "") 
    {
      alert("請選擇工作區域！");
      document.getElementById("job_district").focus();
      return false;
    }
    
    //檢查學歷需求
    var job_require = document.getElementById("job_require").value;
    if (job_require === "") 
    {
      alert("請選擇學歷需求！");
      document.getElementById("job_require").focus();
      return false;
    }

    //檢查支薪類型
    var salary_type = document.getElementById("salary_type").value;
    if (salary_type === "") 
    {
      alert("請選擇支薪類型！");
      document.getElementById("salary_type").focus();
      return false;
    }
    
    //薪資金額
    var salary = document.getElementById("salary").value;
    var regex = /^[1-9]\d*$/; // 限制只能輸入正整數數字，第一數字不能為0
    if (salary === "") 
    {
      alert("請輸入薪資金額");
      document.getElementById("salary").focus();
      return false;
    }
    if (!regex.test(salary)) 
    {
      alert("薪資金額只能為非0開頭的正整數！");
      document.getElementById("salary").focus();
      return false;
    }
    xmlHTTP.open("GET", "http://localhost:8080/chicken_job/Update_post_job?"+
    					"user_id="+id+
	 					"&job_name="+job_name+
	 					"&job_info="+job_info+
	 					"&job_city="+job_city+
	 					"&job_district="+job_district+
	 					"&job_require="+job_require+
	 					"&salary_type="+salary_type+
	 					"&salary="+salary+
	 					"&job_id="+job_id, true);
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData.length > 0)
		    	  {
					  alert("修改成功");
			    	  window.location.href = responseData;
		    	  }
			      else
			      {
				      alert("出現錯誤");	      
			      }
			    } else {
			      // 請求失敗
			      console.log("請求失敗，狀態碼：" + xmlHTTP.status);
			    }
			  }
      }
// 發送請求
	xmlHTTP.send();
	hidePopupJobForm()
    
}

//查看更多按鈕
function showMore()
{
	var moreButton1 = document.getElementById("more1");
	var jobRows1 = document.getElementsByClassName("jobRow1");
	var rowsToShow1 = 5;
	var visibleRows1 = rowsToShow1;

	// 一開始隱藏超過(5)行數的數據行
	for (var i = visibleRows1; i < jobRows1.length; i++) 
	{
		jobRows1[i].style.display = "none";
	}
	// 判斷是否還有更多數據能加載，沒有就隱藏按鈕
	if (visibleRows1 >= jobRows1.length) 
    {
     	moreButton1.style.display = "none";
    }
	

	// 點擊"查看更多"按鈕加載更多數據
	moreButton1.addEventListener("click", function(event) 
	{
    	event.preventDefault();

	    // 判斷是否還有剩餘行數未顯示
  		var remainingRows = jobRows1.length - visibleRows1;
  		var rowsToAdd = Math.min(rowsToShow1, remainingRows);
	
	    // 顯示指定行數的數據
	    for (var i = visibleRows1; i < visibleRows1 + rowsToAdd; i++) 
	    {
    		jobRows1[i].style.display = "";
  		}
	    // 更新可見行數
		visibleRows1 += rowsToAdd;
		
	    // 判斷是否還有更多數據能加載
	    if (visibleRows1 >= jobRows1.length) 
	    {
	      moreButton1.style.display = "none";
	    }
	});

	var moreButton2 = document.getElementById("more2");
	var jobRows2 = document.getElementsByClassName("jobRow2");
	var rowsToShow2 = 5;
	var visibleRows2 = rowsToShow2;

	// 一開始隱藏超過(5)行數的數據行
	for (var i = visibleRows2; i < jobRows2.length; i++) 
	{
		jobRows2[i].style.display = "none";
	}
	// 判斷是否還有更多數據能加載，沒有就隱藏按鈕
	if (visibleRows2 >= jobRows2.length) 
    {
     	moreButton2.style.display = "none";
    }

	// 點擊"查看更多"按鈕加載更多數據
	moreButton2.addEventListener("click", function(event) 
	{
    	event.preventDefault();

	    // 判斷是否還有剩餘行數未顯示
  		var remainingRows = jobRows2.length - visibleRows2;
  		var rowsToAdd = Math.min(rowsToShow2, remainingRows);
	
	    // 顯示指定行數的數據
	    for (var i = visibleRows2; i < visibleRows2 + rowsToAdd; i++) 
	    {
    		jobRows2[i].style.display = "";
  		}
	    // 更新可見行數
		visibleRows2 += rowsToAdd;
		
	    // 判斷是否還有更多數據能加載
	    if (visibleRows2 >= jobRows2.length) 
	    {
	      moreButton2.style.display = "none";
	    }
	});
}
showMore();

//跳出應徵者列表的DIV
function showPopupWaitlisted() 
{
  var popupFormContainer = document.getElementById("WaitlistedDiv");
  popupFormContainer.style.display = "flex";
}


function hidePopupWaitlisted() 
{
  var id = document.getElementById('id').value;
  var popupFormContainer = document.getElementById("WaitlistedDiv");
  popupFormContainer.style.display = "none";
  window.location.href ="member_center?id="+id;
}

function accept(link)
{
	if(confirm("確定要錄取嗎?")==false){
		return false;
	}
	
	var user_id = link.getAttribute('data-user_id');
	var job_id = link.getAttribute('data-job_id');
	var post_id = document.getElementById('id').value;
	
	console.log(user_id)
	console.log(job_id)
	console.log(post_id)
	
	if(window.ActiveXObject)
	{
		xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
		xmlHTTP=new XMLHttpRequest();
	}
	
	xmlHTTP.open("GET", "http://localhost:8080/chicken_job/OfferJob?"+
    					"user_id="+user_id+
	 					"&job_id="+job_id+
	 					"&post_id="+post_id, true);
	
	
	xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData.length > 0)
		    	  {
					  alert("已錄取該應徵者");
			    	  hidePopupWaitlisted(); 
		    	  }
			      else
			      {
				      alert("出現錯誤");	      
			      }
			    } else {
			      // 請求失敗
			      console.log("請求失敗，狀態碼：" + xmlHTTP.status);
			    }
			  }
      }
      xmlHTTP.send();
      
}

function warning(){
	if(confirm("確定要刪除這項工作嗎?")==false){
		return false;
	}
}