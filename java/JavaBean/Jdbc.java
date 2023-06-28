package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc {
	String url = "jdbc:mysql://localhost:3306/chicken_job";
	String username = "root";
	String pass = "12345678";
	
	public Jdbc() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
	}
	public Connection get_Connection() throws SQLException
	{
		Connection conn = DriverManager.getConnection(url, username, pass);
		return conn;
	}
}
