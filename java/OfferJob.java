

import java.io.IOException;
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


@WebServlet("/OfferJob")
public class OfferJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OfferJob() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int job_id = Integer.parseInt(request.getParameter("job_id"));
		int post_id =Integer.parseInt(request.getParameter("post_id"));
		try {
			Jdbc jd = new Jdbc();
			Connection conn = jd.get_Connection();
			String sql = "UPDATE job_user " +
		             "SET job_status = '未錄取' " +
		             "WHERE post_id = ? AND job_id = ? ";
			
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1,post_id);
			st.setInt(2,job_id);
			st.executeUpdate();
			sql = "UPDATE job_user " +
		          "SET job_status = '已錄取' " +
		    	  "WHERE post_id = ? AND job_id = ? AND(get_id IS NULL OR get_id =?) ";
			st = conn.prepareStatement(sql);
			st.setInt(1,post_id);
			st.setInt(2,job_id);
			st.setInt(3,user_id);
			st.executeUpdate();
			
			response.sendRedirect("MemberCenter.jsp?id="+post_id);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
