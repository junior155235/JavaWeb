

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.Jdbc;
import JavaBean.Job;
import JavaBean.User;

@WebServlet("/member_center")
public class member_center extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public member_center() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		if(session.getAttribute("user") == null)
		{
			System.out.println("\n java user is null\n");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.sendRedirect("PersonalHome.jsp");
		}
		else
		{
			System.out.println("\n java user not null\n");
			User u = (User) session.getAttribute("user");
			int id = u.getId();
			
			List<Job> dataList = new ArrayList<>();
			List<Job> give_dataList = new ArrayList<>();
			List<Job> wait_dataList = new ArrayList<>();
			try {
				dataList = get_current_job(id);
				give_dataList = give_job(id);
				wait_dataList = wait_dataList(id);
				if(dataList != null || give_dataList != null || wait_dataList != null) {
					System.out.print("datalist is not null");
				}
			} catch (SQLException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("user", u);
			session.setAttribute("dataList", dataList);
			session.setAttribute("give_dataList", give_dataList);
			session.setAttribute("wait_dataList", wait_dataList);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.sendRedirect("MemberCenter.jsp");
		}	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public List<Job> give_job(int id) throws SQLException, ClassNotFoundException 
	{
	    List<Job> dataList = new ArrayList<>();
	    String query ="SELECT * FROM chicken_job.job_data " +
	    	      "JOIN job_user ON job_data.job_id = job_user.job_id " +
	    		  "where job_user.post_id = ? and job_user.get_id is null";
	    	      

    	Jdbc jc = new Jdbc();
    	Connection conn = jc.get_Connection();
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery(); 
        while (rs.next()) 
        {
        	String job_name = rs.getString("job_name");
        	String salary_type = rs.getString("salary_type");
        	String job_city = rs.getString("job_city");
        	String job_district = rs.getString("job_district");
        	String job_status = rs.getString("job_status");
        	int salary = rs.getInt("salary");
        	String job_publishDate = rs.getString("job_publishDate");
        	int job_id = rs.getInt("job_id");
        	
        	Job j = new Job(job_name ,salary_type, salary , job_status , job_city , job_district , job_publishDate,job_id);
            dataList.add(j);
    	}
	    return dataList;
	}
	
	public List<Job> get_current_job(int id) throws SQLException, ClassNotFoundException 
	{
	    List<Job> dataList = new ArrayList<>();
	    String query ="SELECT jd.job_id , jd.job_name , jd.job_info , jd.job_city , jd.job_district , jd.job_publishDate , jd.job_require , jd.salary_type , jd.salary  ,js.job_status\r\n"
	    		+ "FROM chicken_job.job_data jd \r\n"
	    		+ "join job_user js on jd.job_id = js.job_id\r\n"
	    		+ "WHERE js.get_id = ? ";

	    Jdbc jc = new Jdbc();
	    
	    Connection conn = jc.get_Connection();
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery(); 
        while (rs.next()) 
        {
        	String job_name = rs.getString("jd.job_name");
        	String salary_type = rs.getString("jd.salary_type");
        	String job_city = rs.getString("jd.job_city");
        	String job_district = rs.getString("jd.job_district");
        	int salary = rs.getInt("jd.salary");
        	String job_status = rs.getString("js.job_status");
        	String job_publishDate = rs.getString("jd.job_publishDate");
        	int job_id = rs.getInt("job_id");
        	
        	Job j = new Job(job_name ,salary_type , salary , job_status , job_city , job_district , job_publishDate,job_id);
            dataList.add(j);
        }
	    return dataList;
	}
	
	public List<Job> wait_dataList(int id) throws SQLException, ClassNotFoundException 
	{
	    List<Job> dataList = new ArrayList<>();
	    String query ="SELECT j.job_name, j.job_id, j.job_city, j.job_district, u.user_name, u.user_learn, u.user_phone, ju.job_status,ju.get_id\r\n"
	    		+ "FROM chicken_job.user_data u \r\n"
	    		+ "JOIN chicken_job.job_user ju ON u.user_id = ju.get_id\r\n"
	    		+ "JOIN chicken_job.job_data j ON j.job_id = ju.job_id\r\n"
	    		+ "WHERE ju.post_id = ? AND (ju.job_status ='已錄取' OR ju.job_status ='應徵中') ";

	    Jdbc jc = new Jdbc();
	    
	    Connection conn = jc.get_Connection();
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setInt(1, id); 
		ResultSet rs = stmt.executeQuery();
        while (rs.next()) 
        {
        	String job_name = rs.getString("j.job_name");
        	int job_id = rs.getInt("j.job_id");
        	String job_city = rs.getString("j.job_city");
        	String job_district = rs.getString("j.job_district");
        	String user_name = rs.getString("u.user_name");
        	String user_learn = rs.getString("u.user_learn");
        	String user_phone = rs.getString("u.user_phone");
        	String job_status = rs.getString("ju.job_status");
        	int user_id = rs.getInt("ju.get_id");
        	
        	Job j = new Job(job_name ,job_id , job_city ,job_district, user_name , user_learn , user_phone , job_status,user_id);
            dataList.add(j);
        }
	    return dataList;
	}
}
