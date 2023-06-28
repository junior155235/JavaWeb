

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


@WebServlet("/Update_post_job")
public class Update_post_job extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Update_post_job() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("user_id"));
		String job_name = request.getParameter("job_name");
		String job_info = request.getParameter("job_info");
		String job_city = request.getParameter("job_city");
		String job_district = request.getParameter("job_district");
		String job_require = request.getParameter("job_require");
		String salary_type = request.getParameter("salary_type");
		int salary = Integer.parseInt(request.getParameter("salary"));
		int job_id = Integer.parseInt(request.getParameter("job_id"));
		
		
		String sql = "update chicken_job.job_data set job_name= ? "
				+ ", job_info= ? "
				+ ", job_city= ? "
				+ ", job_district= ?"
				+ ", job_require= ?"
				+ ", salary_type= ?"
				+ ", salary= ? "
				+ "where job_id= ?";
		Jdbc jd = null;
		try {
			jd = new Jdbc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection conn = null;
		try {
			 conn = jd.get_Connection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, job_name);
			st.setString(2, job_info);
			st.setString(3, job_city);
			st.setString(4, job_district);
			st.setString(5, job_require);
			st.setString(6, salary_type);
			st.setInt(7, salary);
			st.setInt(8, job_id);
			st.addBatch();
			st.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String responseData = "member_center?id="+id;
	    
		response.setContentType("text/plain");
	    PrintWriter out = response.getWriter();
	    out.print(responseData);
	    out.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
