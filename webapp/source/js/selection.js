window.onload = function citySelect() {
	var mydd_El = document.getElementById("mydd");
	if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/GetCity", true);
	
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      if(responseData.length > 0)
		    	  {
			    	 mydd_El.innerHTML = responseData;
		    	  }
			      else
			      {
			    	  
				      alert("something went wrong");
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

function liCitySelect(event) {
  var dropDown = document.getElementById("city_div")

  // 阻止默認點擊行為（如果需要的话）
  event.preventDefault();

  // 獲取被點的<a>元素
  var clickedElement = event.target;

 // 獲取被點的<a>元素的 data-value 屬性值
  var dataValue = clickedElement.getAttribute('data-value');

  //show selecting city
  dropDown.innerText=dataValue;
  
  //ajax
  if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/GetDistrict?selectedCity=" +dataValue , true);
	
	//get second menu
	var mydd2_El = document.getElementById("mydd2");
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      
			      if(responseData.length > 0)
		    	  {
			    	 mydd2_El.innerHTML = responseData;
		    	  }
			      else
			      {
			    	  
				      alert("something went wrong");
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

function liDistrictSelect(event)
{
	event.preventDefault();
	var clickedElement = event.target;
	
	// 獲取被點的<a>元素的 data-value 屬性值
	var dataValue = clickedElement.getAttribute('data-value');
  
  	//change text
	var dropDown2 = document.getElementById("district_div")
	dropDown2.innerText=dataValue;
  
}

function liSalaryTypeSelect(event)
{
	event.preventDefault();
	var clickedElement = event.target;
	
	
	var dataValue = clickedElement.getAttribute('data-value');
  
  	
	var dropDown3 = document.getElementById("salaryType_div")
	dropDown3.innerText=dataValue;
  
}

 function doSearch(event)
{
	event.preventDefault();
	var cityValue = document.getElementById("city_div").textContent;
	var districtValue = document.getElementById("district_div").textContent;
	var salaryTypeValue = document.getElementById("salaryType_div").textContent;
	console.log("cityValue: "+ cityValue);
	console.log("districtValue: "+ districtValue);
	console.log("salaryTypeValue: "+ salaryTypeValue);
	// 取得表單元素
	var form = document.getElementById("jobForm");
	
	
	// 建立隱藏的輸入欄位，用於傳遞參數
	var newpage_El = document.getElementById("newpage");
	newpage_El.value = '1';

	
	var newcity_El = document.getElementById("newcity");
	newcity_El.value = cityValue;
	
	var newdistrict_El = document.getElementById("newdistrict");
	newdistrict_El.value = districtValue;
	
	var newsalary_Type_El = document.getElementById("newsalary_Type");
	newsalary_Type_El.value = salaryTypeValue;
	
	// 提交表單
	form.submit();

}