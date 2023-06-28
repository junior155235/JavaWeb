

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Jdbc;


@WebServlet("/new_Job")
public class new_Job extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public new_Job() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job_name = request.getParameter("job_name");
		String job_info = request.getParameter("job_info");
		String job_city = request.getParameter("job_city");
		String job_district = request.getParameter("job_district");
		String job_require = request.getParameter("job_require");
		String salary_type = request.getParameter("salary_type");
		
		Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
	      
		int salary = Integer.parseInt(request.getParameter("salary"));
		
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
			String sql = "select chicken_job.create_job(?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1,userId);
			st.setString(2,job_name);
			st.setString(3,job_info);
			st.setString(4,job_city);
			st.setString(5,job_district);
			st.setString(6,ft.format(dNow));
			st.setString(7,job_require);
			st.setString(8,salary_type);
			st.setInt(9,salary);
			ResultSet rs = st.executeQuery();
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
