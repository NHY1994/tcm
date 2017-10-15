package testcase;

import java.io.IOException;
import java.io.InputStream;
import com.test.mybatis;
import com.test.mybatis1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * Servlet implementation class selectcreatcase 用例库点击tree编辑指定用例
 */
@WebServlet("/selectcreatcase")
public class selectcreatcase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public selectcreatcase() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		System.out.println(id+"---");
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource); 
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlsession = sqlSessionFactory.openSession();
		caseinfo caseinfo=new caseinfo();
		try{
		caseinfo = sqlsession.selectOne("selectid", id);
		System.out.println(caseinfo.getId());
		System.out.println(caseinfo.getTest());
		}
		finally{
			sqlsession.close();
			}
		request.setAttribute("caseinfo", caseinfo);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("casecenter.jsp").forward(request, response);;
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
