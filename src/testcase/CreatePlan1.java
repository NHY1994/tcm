package testcase;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreatePlan
 */
@WebServlet("/CreatePlan")
public class CreatePlan1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePlan1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String test_project=request.getParameter("test_project");
		String software_version=request.getParameter("software_version");
		String plan_version=request.getParameter("plan_version");
		String star_time=request.getParameter("star_time");
		String end_time=request.getParameter("end_time");
		String note=request.getParameter("note");
		String case_level=request.getParameter("case_level");
		String testversion=request.getParameter("testversion");
		String where="WHERE ";
		for (String retval: case_level.split(",")){
			where+="level="+retval+" or ";
            System.out.println(where);
        }
		System.out.println(where.substring(0, where.length()-4));
		System.out.print(case_level+"---"+test_project+"--"+software_version+"---"+plan_version+"---"+star_time+"-"+end_time+"-"+note);
	}

}
