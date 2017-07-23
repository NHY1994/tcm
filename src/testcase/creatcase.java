package testcase;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class creatcase
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
		//int id=Integer.parseInt(request.getParameter("id")); 
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
