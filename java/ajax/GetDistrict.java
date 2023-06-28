package ajax;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Jdbc;

@WebServlet("/GetDistrict")
public class GetDistrict extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetDistrict() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8");
		
			String selectedCity = request.getParameter("selectedCity");
			try {
				Jdbc jd = new Jdbc();
				Connection conn = jd.get_Connection();
				String sql = "SELECT d.district_name " +
						     "FROM district d " +
						     "JOIN city c ON d.city_id = c.id " +
						     "WHERE c.city_name = ?";
				PreparedStatement st = conn.prepareStatement(sql);
				st.setString(1, selectedCity);
				ResultSet rs = st.executeQuery();
				List<String> districtList = new ArrayList<>();
				while (rs.next()) {
					String districtName = rs.getString("district_name");
					districtList.add(districtName);
			    }
				String outPrintString = "";
				for(int i=0;i<districtList.size();i++) {
					outPrintString += "<li><a href=\"#\" data-value=\""+districtList.get(i)+"\" onclick=\"liDistrictSelect(event)\">"+districtList.get(i)+"</a></li>";	
				}
				PrintWriter out=response.getWriter();
				out.print(outPrintString);

				

				
			}  catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
