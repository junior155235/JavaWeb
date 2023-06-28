function doCheck() 
{   
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

    //檢查生日欄
    var birth = document.getElementById("user_birthDate").value;
    var birthDate = new Date(birth);
    var now = new Date();
    var age = now.getFullYear() - birthDate.getFullYear();
    if (birth === "") 
    {
      alert("請點選出生年月日！");
      document.getElementById("user_birthDate").focus();
      return false;
    }

    if (birthDate.getTime()>now.getTime())
    {
      alert("生日不能為未來日期！");
      document.getElementById("user_birthDate").focus();
      return false;
    }

    if (now.getMonth() < birthDate.getMonth() || 
    (now.getMonth() == birthDate.getMonth() && now.getDate() < birthDate.getDate())) 
    {
    age--;
    }

    if (age < 15) 
    {
      alert("您必須年滿15歲！");
      document.getElementById("user_birthDate").focus();
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

    //檢查電子信箱欄
    var email = document.getElementById("user_mail").value;
    if (email === "") 
    {
      alert("請輸入電子郵件！");
      document.getElementById("user_mail").focus();
      return false;
    }

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) 
    {
      alert("請輸入正確的電子郵件格式！");
      document.getElementById("user_mail").focus();
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

    //檢查密碼欄
    const PW = document.getElementById("user_password").value;
    const confirmPW = document.getElementById("password_confirm").value;
    const PWRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,20}$/;
    if (PW === "")
    {
        alert("請輸入密碼！");
        document.getElementById("user_password").focus();
         return false;
    }
    if (!PWRegex.test(PW))
    {
        alert("密碼至少要包含一個英文字母和一個數字，長度在 7 到 20 個字");
        document.getElementById("user_password").focus();
        return false;
    }
    if (confirmPW !== PW)
    {
        alert("兩次輸入的密碼不一致");
        document.getElementById("password_confirm").focus();
        return false;
    }
    clickHandler();
}

// 創建 XMLHttpRequest 對象
// 設置回呼函數
function clickHandler() 
{
	var user_name = document.getElementById('user_name').value;
	var user_gender = document.getElementById('user_gender').value;
	var user_birthDate = document.getElementById('user_birthDate').value;
	var user_learn = document.getElementById('user_learn').value;
	var user_mail = document.getElementById('user_mail').value;
	var user_password = document.getElementById('user_password').value;
	var phoneNumber = document.getElementById('phone_number').value;
	
	if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/signup?user_name="+user_name+
			   "&user_gender="+user_gender+
			   "&user_birthDate="+user_birthDate+
			   "&user_learn="+user_learn+
			   "&user_mail="+user_mail+
			   "&phone_number="+phoneNumber+
			   "&user_password="+user_password, true);
	
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("伺服器響應：" + responseData);
			      if(responseData.length > 0)
		    	  {
			    	  window.location.href = responseData;
		    	  }
			      else
			      {
			    	  
				      alert("輸入的電子信箱為已註冊的電子信箱");
				      document.getElementById('user_mail').value = responseData;
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
  
