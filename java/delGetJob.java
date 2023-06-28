
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.Jdbc;
import JavaBean.User;


@WebServlet("/delGetJob")
public class delGetJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int jobId = Integer.parseInt(request.getParameter("job_id"));
		int userId = Integer.parseInt(request.getParameter("id"));
		Jdbc jd = null;
		try {
			jd = new Jdbc();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			Connection conn = jd.get_Connection();
			String sql = "DELETE FROM job_user WHERE get_id=? AND job_id=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1,userId);
			st.setInt(2,jobId);
			st.executeUpdate();
			
			sql = "UPDATE job_user SET job_status='應徵中' WHERE get_id is null AND job_id=?";
			st = conn.prepareStatement(sql);
			st.setInt(1,jobId);
			st.executeUpdate();
			
			HttpSession session = request.getSession();
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			User u = (User) session.getAttribute("user");
			int id = u.getId();
			
			response.sendRedirect("member_center?id="+ id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
