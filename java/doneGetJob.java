

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Jdbc;

/**
 * Servlet implementation class doneGetJob
 */
@WebServlet("/doneGetJob")
public class doneGetJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public doneGetJob() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int job_id = Integer.parseInt(request.getParameter("job_id"));
		int id = Integer.parseInt(request.getParameter("id"));
		Jdbc jd = null;
		try {
			jd = new Jdbc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection conn = jd.get_Connection();
			// '已完成'
			String sql = "update chicken_job.job_user set job_status='已完成' where job_id=? and get_id = ?";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, job_id);
		    pstmt.setInt(2, id);
		    pstmt.executeUpdate();
		    response.sendRedirect("member_center?id="+ id);
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
