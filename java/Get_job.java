

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

import com.mysql.cj.exceptions.RSAException;

import JavaBean.Jdbc;

@WebServlet("/Get_job")
public class Get_job extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Get_job() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			int jobid = Integer.parseInt(request.getParameter("jobid"));
			int current_page = Integer.parseInt(request.getParameter("current_page"));
			try {
				Jdbc jd = new Jdbc();
				Connection conn = jd.get_Connection();
				String sql = "SELECT post_id FROM chicken_job.job_user where job_id = ?";
				PreparedStatement st = conn.prepareStatement(sql);
				st.setInt(1, jobid);
				ResultSet rs = st.executeQuery();
				int post_id = 0;
				if(rs.next()) 
				{
					post_id = rs.getInt("post_id");
				}
				
				if (id == post_id) {
					response.getWriter().write("same");
					return; // 停止後續動作
				}
				
				sql = "insert into chicken_job.job_user(job_id , post_id , get_id) values(?,?,?)";
				st = conn.prepareStatement(sql);
				st.setInt(1, jobid);
				st.setInt(2, post_id);
				st.setInt(3, id);
				st.addBatch();
				st.executeBatch();
				
				response.sendRedirect("jobList?page="+current_page+"&city=&district=&salary_Type=");
				
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
