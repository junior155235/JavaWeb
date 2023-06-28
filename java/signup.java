

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
 	check mail if validate 
*/
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public signup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User us = new User();
		String name = request.getParameter("user_name");
		String gender = request.getParameter("user_gender");
		String date = request.getParameter("user_birthDate");
		String learn = request.getParameter("user_learn");
		String mail = request.getParameter("user_mail");
		String phone = request.getParameter("phone_number");
		System.out.println("phone: " + phone);
		String password = request.getParameter("user_password");
		
		//
		
		try {
			if(us.check_mail(mail)) 
			{
				//no duplicate=>set session =>send to home page with personal button
				us.update_user(mail, name , phone, password, date, gender, learn);
				
				
				//session
				HttpSession session = request.getSession();
				User u = new User(mail);
				session.setAttribute("user", u);
				
				// 處理 GET 請求
			    String responseData = "http://localhost:8080/chicken_job/PersonalHome.jsp";
			    
			    // 設置響應的內容類型
			    response.setContentType("text/plain");
			    
			    // 將數據寫入響應
			    PrintWriter out = response.getWriter();
			    out.print(responseData);
			    out.flush();
			}
			else 
			{
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
