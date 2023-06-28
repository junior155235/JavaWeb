function checkLoginForApply()
{
	var loginStatus = document.getElementById("id").value;
    if(loginStatus==="")
    {
	  alert("請先登入");
	  window.location.href = "login.html";
      return false;
    }
	  clickHandler();
	 /*document.getElementById('apply').submit();*/
}


// 設置回呼函數
function clickHandler() 
{
	var id = document.getElementById('id').value;
	var jobid = document.getElementById('jobid').value;
	var current_page = document.getElementById('current_page').value;
	//創建 XMLHttpRequest 對象
	var xmlHTTP;
	if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/Get_job?id="+id+
	 					 "&jobid="+jobid+
	 					 "&current_page="+current_page, true);
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData === "same")
		    	  {
					  alert("無法應徵自己刊登的工作！");
		    	  }
			      else
			      {
			    	  alert("應徵成功！可至會員中心查看已應徵的工作！");
			      }
			    } else {
			      // 請求失敗
			      console.log("請求失敗，狀態碼：" + xmlHTTP.status);
			    }
			  }
      }
// 發送請求
xmlHTTP.send();
};