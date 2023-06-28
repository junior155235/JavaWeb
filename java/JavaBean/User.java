package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	private int id;
	private String mail;
	private String name;
	private String date;
	private String password;
	private String gender;
	private String learn;
	private String phone;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User(String m) throws SQLException, ClassNotFoundException{
		String sql = "Select um.user_id , um.user_mail , ud.user_name\r\n"
				+ "from user_main um \r\n"
				+ "join user_data ud\r\n"
				+ "on um.user_id = ud.user_id\r\n"
				+ "where um.user_mail = ? ;";
		
		Jdbc jc = new Jdbc();
		Connection conn = jc.get_Connection();
	
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, m);
		
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			this.id  = rs.getInt("user_id");
			this.mail  = rs.getString("user_mail");
			this.name = rs.getString("user_name");
        }
		
	}
	public void update_user(String mail , String name , String phone , String password , String date , String gender , String learn) throws ClassNotFoundException, SQLException
	{
		String sql = "select chicken_job.create_user(?, ?, ? , ?, ?, ?, ?);";
		
		Jdbc jc = new Jdbc();
		Connection conn = jc.get_Connection();
	
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, mail);
		st.setString(2, name);
		st.setString(3, date);
		st.setString(4, phone);
		st.setString(5, password);
		st.setString(6, gender);
		st.setString(7, learn);
		ResultSet rs = st.executeQuery();
	}
	public boolean check_mail(String mail) throws ClassNotFoundException, SQLException {
		
		String sql = "Select * from chicken_job.user_main where user_main.user_mail=?";
		
		
		Jdbc jc = new Jdbc();
		Connection conn = jc.get_Connection();
	
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, mail);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next())
		{
			return false;
		}
		
		return true;
	}
	public boolean check_login(String account , String password) throws ClassNotFoundException, SQLException {
		String sql = "select um.user_mail , ud.user_password \r\n"
					+ "from user_main um \r\n"
					+ "join user_data ud\r\n"
					+ "on um.user_id = ud.user_id where um.user_mail = ? and ud.user_password = ?;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Jdbc jc = new Jdbc();
		Connection conn = jc.get_Connection();
	
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, account);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next())
		{
			//means have same account and password in db => login success
			return true;
		}
		
		return false;
	}
	public User(){};
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLearn() {
		return learn;
	}

	public void setLearn(String learn) {
		this.learn = learn;
	}
	
	
}
