package com.tcm.updatacase;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class updata {
	public void up(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		caseinfo caseinfo1=new caseinfo();
		caseinfo1.setId(request.getParameter("id"));
		caseinfo1.setStatus("1");
		caseinfo1.setDescript(request.getParameter("descript"));
		caseinfo1.setTest_module(request.getParameter("test_module"));
		caseinfo1.setLevel(request.getParameter("level"));
		caseinfo1.setTest_guidance(request.getParameter("test_guidance"));
		caseinfo1.setPrecondition(request.getParameter("precondition"));
		caseinfo1.setTest_project(request.getParameter("test_project"));
		caseinfo1.setTest_step(request.getParameter("test_step"));
		caseinfo1.setExpected_results(request.getParameter("expected_results"));
		caseinfo1.setAttachment(request.getParameter("attachment"));
		try {
			System.out.println(caseinfo1.toString());
			session.update("updatacase", caseinfo1);
			session.commit();
		} finally {
			session.close();
		}
	}

}
