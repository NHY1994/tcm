package com.tcm.log4j;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * Servlet implementation class log4j
 */
@WebServlet(initParams={@WebInitParam(name="log4j", value="log4j.properties")}) 
public class log4j extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private static final long serialVersionUID = 1L;  
	  
    @Override  
    public void init(ServletConfig config) throws ServletException {  
        String path = config.getServletContext().getRealPath("WEB-INF\\classes");  
        path  = path + File.separator + config.getInitParameter("log4j");  
        PropertyConfigurator.configure(path);  
    }  
	
    public log4j() {
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
		doGet(request, response);
	}

}
