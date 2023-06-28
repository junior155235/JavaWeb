
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

import JavaBean.Jdbc;


@WebServlet("/delGiveJob")
public class delGiveJob extends HttpServlet {
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
			String sql = "DELETE FROM job_data WHERE job_id=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1,jobId);
			st.executeUpdate();
			sql = "DELETE FROM job_user WHERE job_id=?";
			st = conn.prepareStatement(sql);
			st.setInt(1,jobId);
			st.executeUpdate();
			response.sendRedirect("member_center?id="+ userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
