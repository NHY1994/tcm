package testcase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import javafx.util.converter.DateTimeStringConverter;

/**
 * Servlet implementation class creatcase
 * 测试用例编辑界面
 * 新增测试用例
 */
@WebServlet("/creatcase")
public class creatcase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creatcase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        String dateNowStr = sdf.format(d);  
        System.out.println("格式化后的日期：" + dateNowStr);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        String dateNowStr = sdf.format(d);  
        System.out.println("格式化后的日期：" + dateNowStr);
        Date date = new Date();  
        Timestamp timeStamp = new Timestamp(date.getTime());
		int id=1;
				//Integer.parseInt(request.getParameter("id")); 
		String create_time=dateNowStr;
		String status="1";
		String descript=request.getParameter("descript");
		String create_user=request.getParameter("create_user");
		String test_module=request.getParameter("test_module");
		String level=request.getParameter("level");
		String test_guidance=request.getParameter("test_guidance");
		String precondition=request.getParameter("precondition");
		String test_project=request.getParameter("test_project");
		String test_step=request.getParameter("test_step");
		String expected_results=request.getParameter("expected_results");
		String actual_result=request.getParameter("actual_result");
		String Attachment=request.getParameter("Attachment");
		System.out.print(descript+test_module);
		//doGet(request, response);
		
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/tcm";
		//String sql="INSERT INTO test_case_source (id,create_time,STATUS,descript,create_user,test_module,LEVEL,test_guidance,precondition,test_project,test_step,expected_results,Attachment) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql="INSERT INTO test_case_source (id,create_time,STATUS,descript,create_user,test_module,LEVEL,test_guidance,precondition,test_project,test_step,expected_results,Attachment) SELECT MAX(id),?,?,?,?,?,?,?,?,?,?,?,? FROM test_case_source";
		String name="null";
		try{
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps=null;
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setTimestamp(2, timeStamp);
			ps.setString(3, "1");
			ps.setString(4, descript);
			ps.setString(5, "nihongyan");
			ps.setString(6, test_module);
			ps.setString(7, "1");
			ps.setString(8, test_guidance);
			ps.setString(9, precondition);
			ps.setString(10, test_project);
			ps.setString(11, test_step);
			ps.setString(12, expected_results);
			ps.setString(13, "c://fujian/1.txt");
			int resule=ps.executeUpdate();
			if(resule>0)
				response.getWriter().append("success");
			else 
				response.getWriter().append("fail");
				
			/*jArray.put(map1);
	        try {
				jObject.put("rows", jArray);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
	        //System.out.println(jObject.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
