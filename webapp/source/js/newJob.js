function doCheckJobInfo() 
{   
    // 檢查職缺名稱
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
    document.getElementById('newjob').submit();
    
}