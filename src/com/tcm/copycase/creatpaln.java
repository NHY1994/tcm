package com.tcm.copycase;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.chart.PieChart.Data;

/**
 * Servlet implementation class creatpaln
 */
@WebServlet("/creatpaln")
public class creatpaln extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creatpaln() {
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
		CopyCase copyCase=new CopyCase();
		String test_project=request.getParameter("test_project");
		String software_version=request.getParameter("software_version");
		String plan_version=request.getParameter("plan_version");
		String star_time=request.getParameter("star_time")+" 00:00:00";
		String end_time=request.getParameter("end_time")+" 00:00:00";
		String note=request.getParameter("note");
		String case_level=request.getParameter("case_level");
		String test_plan_version=request.getParameter("testversion");
		System.out.println(star_time);
		Timestamp star_time1 = Timestamp.valueOf(star_time); 
		Timestamp end_time1 = Timestamp.valueOf(end_time); 
		//String testversion=request.getParameter("testversion");
		CreatPlan creatPlan=new CreatPlan();
		creatPlan.creatplan(end_time1,test_plan_version, note, plan_version, test_project, software_version, star_time1, "1");
		for (String retval: case_level.split(",")){
			copyCase.copycase("1", test_project, retval);
        }
	}

}
