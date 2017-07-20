package testcase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class selectcase
 */
@WebServlet("/selectcase")
public class selectcase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectcase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String caseid=request.getParameter("id");
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/tcm";
		String sql="SELECT * FROM test_case_source_implement WHERE id='"+caseid+"'";
		try{
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps=null;
			ResultSet rs=null;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			JSONArray jArray = new JSONArray();
			JSONObject jObject=new JSONObject();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount(); 
			while (rs.next()) {
				JSONObject jObject2=new JSONObject();
				for (int i = 1; i <= columnCount; i++) {  
		            String columnName =metaData.getColumnLabel(i);  
		            String value = rs.getString(columnName);  
		            try {
						jObject2.put(columnName, value);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
		        }   
				try {
					jObject.put("data", jArray.put(jObject2));
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				System.out.println(jObject);
			}
	        response.getWriter().append(jObject.toString());
		}
		catch (ClassNotFoundException | SQLException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
