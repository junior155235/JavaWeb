function citySelect()
{
	var job_city = document.getElementById("job_city");
	if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }
	// 設置請求方式和 URL
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/GetCityForNewJob", true);
	
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      if(responseData.length > 0)
		    	  {
			    	 job_city.innerHTML = responseData;
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

function getDistrict() {
  
  var dropDown = document.getElementById("job_city")
  var selectedIndex = dropDown.selectedIndex;
  var selectedCity = dropDown.options[selectedIndex].value;

  console.log(selectedCity);
  //show selecting city
  
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
	 xmlHTTP.open("GET", "http://localhost:8080/chicken_job/GetDistrictForNewJob?selectedCity=" +selectedCity , true);
	
	//get second menu
	var job_district = document.getElementById("job_district");
	
	 xmlHTTP.onreadystatechange=function get_data()
      {
		 if (xmlHTTP.readyState === 4) {
			    if (xmlHTTP.status === 200) {
		    	// 請求成功
			      var responseData = xmlHTTP.responseText;
			      console.log("response: " + responseData);
			      
			      
			      if(responseData.length > 0)
		    	  {
			    	 job_district.innerHTML = responseData;
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