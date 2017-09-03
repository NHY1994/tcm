package testcase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class selecttree
 */
@WebServlet("/selecttree")
public class selecttree extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selecttree() {
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
		String sql="SELECT distinct test_module FROM test_case_source_implement WHERE plan_number=10010";
		try {
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps=null;
			ResultSet rs=null;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount(); 
			JSONObject jsonObject=new JSONObject();
			JSONArray jsonArray=new JSONArray();
			while(rs.next()){
				for (int i = 1; i <= columnCount; i++) {
					JSONObject jsonObject2=new JSONObject();
		            String columnName =metaData.getColumnLabel(i);  
		            String value = rs.getString(columnName); 
		            jsonObject2.put("text", value);
		            jsonObject2.put("checked", true);
		            jsonObject.put("children", jsonArray.put(jsonObject2));
		            System.out.println(jsonObject);
		        }
				
			}
			jsonObject.put("id",1)
			.put("text", "lopscoop");
			System.out.println("["+jsonObject+"]");
			response.getWriter().append("["+jsonObject+"]");
		} catch (Exception e) {
			// TODO: handle exception
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
