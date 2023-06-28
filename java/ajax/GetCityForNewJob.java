package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Jdbc;

/**
 * Servlet implementation class GetCity
 */
@WebServlet("/GetCityForNewJob")
public class GetCityForNewJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetCityForNewJob() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			Jdbc jd = new Jdbc();
			Connection conn = jd.get_Connection();
			
			String sql = "SELECT * FROM city order by id asc";
			PreparedStatement st = conn.prepareStatement(sql);
			
			ResultSet rs = st.executeQuery();
			List<String> cityList = new ArrayList<>();
			cityList.add("--請選擇--");
			while (rs.next()) {
				String districtName = rs.getString("city_name");
				cityList.add(districtName);
		    }
			
			String outPrintString = "";
			for(int i=0;i<cityList.size();i++) {
				
				outPrintString += "<option value=\"" + cityList.get(i) + "\">" + cityList.get(i) + "</option>";		
			}
			//System.out.println(outPrintString);
			PrintWriter out=response.getWriter();
			out.print(outPrintString);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
