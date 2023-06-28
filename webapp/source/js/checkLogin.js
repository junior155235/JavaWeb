function checkLogin() {
    var loginStatus = document.getElementById("id").value;
    if (loginStatus === "") {
      alert("請先登入");
      window.location.href = "login.html";
      return false;
    }
    window.location.href = 'newjob.jsp';  
}
