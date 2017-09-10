package testcase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import jdk.nashorn.internal.runtime.JSONListAdapter;

/**
 * Servlet implementation class testcase
 */
// @WebServlet("/testcase")
public class testcase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public testcase() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String userid = request.getParameter("name");
		String psd = request.getParameter("psd");
		// System.out.print(userid+"-"+psd);
		String planid = request.getParameter("planid");
		String node = request.getParameter("node");
		if (node.equals("")) {

		} else {
			node = new String(node.getBytes("ISO8859-1"), "UTF-8");
		}
		System.out.println(planid + "-" + node);
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/tcm";
		String sql = "SELECT * FROM test_case_source_implement WHERE plan_number='" + planid + "' AND test_module='"
				+ node + "'";
		System.out.println(sql);
		String name = "null";
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			Map<String, Object> map1 = new HashMap<String, Object>();
			JSONArray jArray = new JSONArray();
			JSONObject jObject = new JSONObject();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			while (rs.next()) {
				JSONObject jObject2 = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					try {
						jObject2.put(columnName, value);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				try {
					jObject.put("rows", jArray.put(jObject2));
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				/*
				 * map.put("hidden", rs.getString("id")); map.put("id",
				 * rs.getString("id")); System.out.println(rs.getRow());
				 * map.put("status", rs.getString("status"));
				 * map.put("implement_user", rs.getString("implement_user"));
				 * map.put("level", rs.getString("level"));
				 * map.put("test_module", rs.getString("test_module"));
				 * map.put("test_step", rs.getString("test_step"));
				 * map.put("expected_results",
				 * rs.getString("expected_results")); map.put("implement_time",
				 * rs.getString("implement_time")); map1.put("rows",map);
				 */

				System.out.println(jObject);
			}
			/*
			 * jArray.put(map1); try { jObject.put("rows", jArray); } catch
			 * (JSONException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); }
			 */
			response.getWriter().append(jObject.toString());
			// System.out.println(jObject.toString());
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
