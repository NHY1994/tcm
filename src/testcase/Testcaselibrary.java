package testcase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import netscape.javascript.JSObject;

/**
 * Servlet implementation class Testcaselibrary
 */
@WebServlet("/Testcaselibrary")
public class Testcaselibrary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Testcaselibrary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/tcm";
		String sql="SELECT distinct test_module FROM test_case_source WHERE test_project='Lopscoop'";
		String name="null";
		JSONArray jArray1 = new JSONArray();
		JSONObject jsObject3=new JSONObject();
		try {
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps=null,ps1=null;
			ResultSet rs=null,rs1=null;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				JSONObject jObject=new JSONObject();
				JSONArray jArray = new JSONArray();
				System.out.println(rs.getString(1));
				ps1=con.prepareStatement("SELECT id FROM test_case_source WHERE test_module='"+rs.getString(1)+"'");
				rs1=ps1.executeQuery();
				while(rs1.next()){
					JSONObject jObject2=new JSONObject();
					System.out.println(rs1.getString(1));
					jObject2.put("text", rs1.getString(1));
					jObject2.put("checked", true);
					jObject.put("children", jArray.put(jObject2)) ;
					System.out.println(jObject);
				}
				jObject.put("text", rs.getString(1));
				jObject.put("state", "close");
				
				jArray1.put(jObject);
				System.out.println(jArray1);
			}
			jsObject3.put("id", 1);
			jsObject3.put("text", "lopscoop");
			jsObject3.put("children", jArray1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		response.getWriter().append("["+jsObject3.toString()+"]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
