

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.User;

/*
	check if mail and password in jap and database is same
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("user_mail");
		String password = request.getParameter("user_password");
		
		User us = new User();
		
		try {
			if(us.check_login(account, password))
			{
				// 取得該位user
				User u = new User(account);
				//login success
				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				
				// 處理 GET 請求
			    String responseData = "http://localhost:8080/chicken_job/PersonalHome.jsp";
			    
			    // 設置響應的內容類型
			    response.setContentType("text/plain");
			    
			    // 將數據寫入響應
			    PrintWriter out = response.getWriter();
			    out.print(responseData);
			    out.flush();
			}else {
				// 處理 GET 請求
			    String responseData = "";
			    
			    // 設置響應的內容類型
			    response.setContentType("text/plain");
			    
			    // 將數據寫入響應
			    PrintWriter out = response.getWriter();
			    out.print(responseData);
			    out.flush();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
