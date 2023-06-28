package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Job {
	private String user_name;
	private int user_id;
	private String job_name;
	private int job_id;
	private String job_info;
	private String job_city;
	private String job_district;
	private String job_publishDate;
	private String job_require;
	private String salary_type;
	private String job_status;
	private String user_phone;
	private String user_learn;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	public String getJob_status() {
		return job_status;
	}
	public void setJob_status(String job_status) {
		this.job_status = job_status;
	}

	private int salary;

	public void create_job() throws SQLException, ClassNotFoundException {

		String sql = "select chicken_job.create_job(?,?,?,?,?,?,?,?,?)";
		
		Jdbc jc = new Jdbc();
		Connection conn = jc.get_Connection();
	
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setInt(1, this.user_id);
		st.setString(2, this.job_name);
		st.setString(3, this.job_info);
		st.setString(4, this.job_city);
		st.setString(5, this.job_district);
		st.setString(6, this.job_publishDate);
		st.setString(7, this.job_require);
		st.setString(8, this.salary_type);
		st.setInt(9, this.user_id);
		
		ResultSet rs = st.executeQuery();
	}
	public Job(int user_id , String job_name , String job_info , String job_city , String job_district , String job_publishDate , String job_require , String salary_type , int salary)
	{
		this.user_id = user_id;
		this.job_name = job_name;
		this.job_info = job_info;
		this.job_city = job_city;
		this.job_district = job_district;
		this.job_publishDate = job_publishDate;
		this.job_require = job_require;
		this.salary_type = salary_type;
		this.salary = salary;
	};
	public Job(String user_name , int job_id , String job_name ,String salary_type, int salary , String job_city , String job_district , String job_publishDate) 
	{
		this.user_name = user_name;
		this.job_id = job_id;
		this.job_name = job_name;
		this.salary_type = salary_type;
		this.salary = salary;
		this.job_city = job_city;
		this.job_district = job_district;
		this.job_publishDate = job_publishDate;
	};
	public Job(String job_name ,String salary_type, int salary , String job_status , String job_city , String job_district , String job_publishDate,int job_id) 
	{
		this.job_name = job_name;
		this.salary_type = salary_type;
		this.salary = salary;
		this.job_status = job_status;
		this.job_city = job_city;
		this.job_district = job_district;
		this.job_publishDate = job_publishDate;
		this.job_id = job_id;
	};
	public Job(String user_name , int job_id , String job_name ,String salary_type, int salary , String job_city , String job_district , String job_publishDate,String job_info) 
	{
		this.user_name = user_name;
		this.job_id = job_id;
		this.job_name = job_name;
		this.salary_type = salary_type;
		this.salary = salary;
		this.job_city = job_city;
		this.job_district = job_district;
		this.job_publishDate = job_publishDate;
		this.job_info = job_info;		
	};
	public Job(String job_name ,int job_id,String job_city , String job_district , String user_name , String job_learn ,String user_phone,String job_status,int user_id) 
	{	
		this.job_name = job_name;
		this.job_id = job_id;
		this.job_city = job_city;
		this.job_district = job_district;
		this.user_name = user_name;
		this.user_learn = job_learn;
		this.user_phone = user_phone;
		this.job_status = job_status;
		this.user_id = user_id;
	};
	public Job(){};

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getJob_info() {
		return job_info;
	}

	public void setJob_info(String job_info) {
		this.job_info = job_info;
	}

	public String getJob_city() {
		return job_city;
	}

	public void setJob_city(String job_city) {
		this.job_city = job_city;
	}

	public String getJob_district() {
		return job_district;
	}

	public void setJob_district(String job_district) {
		this.job_district = job_district;
	}

	public String getJob_publishDate() {
		return job_publishDate;
	}

	public void setJob_publishDate(String job_publishDate) {
		this.job_publishDate = job_publishDate;
	}

	public String getJob_require() {
		return job_require;
	}

	public void setJob_require(String job_require) {
		this.job_require = job_require;
	}

	public String getSalary_type() {
		return salary_type;
	}

	public void setSalary_type(String salary_type) {
		this.salary_type = salary_type;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	};
	
	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	};
	
	public String getUser_learn() {
		return user_learn;
	}

	public void setUser_learn(String user_learn) {
		this.user_learn = user_learn;
	};
	
}
