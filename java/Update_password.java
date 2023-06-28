

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Jdbc;


@WebServlet("/Update_password")
public class Update_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Update_password() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String old_password = request.getParameter("user_password"); 
		String new_password = request.getParameter("new_password");
		int id = Integer.parseInt(request.getParameter("user_id"));
		try {
			Jdbc jd = new Jdbc();
			Connection conn = jd.get_Connection();
			String sql = "select user_password from chicken_job.user_data where user_id=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString("user_password").equals(old_password))
				{
					sql = "update chicken_job.user_data set user_password = ? where user_id=?";
					st = conn.prepareStatement(sql);
					st.setString(1, new_password);
					st.setInt(2, id);
					st.addBatch();
					st.executeBatch();
					
					// 處理 GET 請求
					String responseData = "http://localhost:8080/chicken_job/MemberCenter.jsp?id="+id;
				    
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
