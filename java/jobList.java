

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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



@WebServlet("/jobList")
public class jobList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jobList() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int page = Integer.parseInt(request.getParameter("page"));
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String salary_Type = request.getParameter("salary_Type");

        
        try {
            List<Job> dataList = getDataFromDatabaseAndSortByTime(page, city, district, salary_Type);
            
            HttpSession session = request.getSession();
            session.removeAttribute("dataList");
            session.setAttribute("dataList", dataList);

            response.sendRedirect("job_list.jsp?page=" + page + "&city=" + city + "&district=" + district + "&salary_Type=" + salary_Type);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.print("ClassNotFound");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    public List<Job> getDataFromDatabaseAndSortByTime(int page, String city, String district, String salary_Type)
            throws SQLException, ClassNotFoundException {
        if(city.equals("縣市")) {city=".*";}
        if(district.equals("鄉鎮市")) {district=".*";}
        if(salary_Type.equals("支薪類型")) {salary_Type=".*";}
        System.out.println("city: " + city);
        System.out.println("district: " + district);
        System.out.println("salary_Type: " + salary_Type);
        int curr_page = ((page-1)*10);
        List<Job> dataList = new ArrayList<>();
        String query = "SELECT user_data.user_name, j.job_id, j.job_name, j.salary_type, j.salary, j.job_city, j.job_district, j.job_publishDate,j.job_info "
                + "FROM job_data j "
                + "JOIN job_main jm ON j.job_id = jm.job_id "
                + "JOIN user_data ON jm.user_id = user_data.user_id "
                + "JOIN job_user on  j.job_id = job_user.job_id "
                + "WHERE job_user.job_status = '應徵中' AND job_user.get_id is null "
                + "ORDER BY j.job_publishDate DESC "
                + "LIMIT " + curr_page + " ,10";
                
        
        if (!city.isEmpty() || !district.isEmpty() || !salary_Type.isEmpty()) {
        	query = "SELECT user_data.user_name, j.job_id, j.job_name, j.salary_type, j.salary, j.job_city, j.job_district, j.job_publishDate,j.job_info "
                    + "FROM job_data j "
                    + "JOIN job_main jm ON j.job_id = jm.job_id "
                    + "JOIN user_data ON jm.user_id = user_data.user_id "
                    + "JOIN job_user on  j.job_id = job_user.job_id "
                    + "WHERE j.job_city REGEXP ? AND j.job_district REGEXP ? AND j.salary_type REGEXP ? AND job_user.job_status = '應徵中' AND job_user.get_id is null "
                    + "ORDER BY j.job_publishDate DESC "
                    + "LIMIT " + curr_page + " ,10";
        }
        
        Jdbc jc = new Jdbc();
        Connection conn = jc.get_Connection();
        PreparedStatement stmt = conn.prepareStatement(query);
        if (!city.isEmpty() || !district.isEmpty() || !salary_Type.isEmpty()) {
        stmt.setString(1, city);
        stmt.setString(2, district);
        stmt.setString(3, salary_Type);
        }
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            String user_name = rs.getString("user_name");
            int job_id = rs.getInt("job_id");
            String job_name = rs.getString("job_name");
            String salary_type = rs.getString("salary_type");
            int salary = rs.getInt("salary");
            String job_city = rs.getString("job_city");
            String job_district = rs.getString("job_district");
            String job_publishDate = rs.getString("job_publishDate");
            String job_info = rs.getString("job_info");
            Job j = new Job(user_name, job_id, job_name, salary_type, salary, job_city, job_district, job_publishDate,job_info);
            dataList.add(j);
        }

        return dataList;
    }
}
