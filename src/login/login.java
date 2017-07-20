package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class log
 */
//@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("name");
		String psd=request.getParameter("psd");
		System.out.print(userid+"-"+psd);
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/tcm";
		String sql="SELECT username FROM `user` WHERE psd="+psd;
		String name="null";
		try{
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, "root", "123456");
			PreparedStatement ps=null;
			ResultSet rs=null;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
			name=rs.getString("username");
			System.out.println(name);
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		}
		if(name.equals("nihongyan")){
			LoginBean loginBean=new LoginBean();
			loginBean.setName("123");
			loginBean.setPsd("456");
			//response.getWriter().append("success");
			}
		else{
			LoginBean loginBean=new LoginBean();
			loginBean.setName("123");
			loginBean.setPsd("456");
		}
			//response.getWriter().append("fail");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
