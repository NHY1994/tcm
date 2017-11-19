package com.tcm.copycase;

import java.io.IOException;
import java.io.InputStream;
import testcase.caseinfo;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CopyCase {
	public void copycase(String plan_number, String test_project, String level) throws IOException {
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		caseinfo caseinfo = new caseinfo();
		caseinfo.setPlan_number("001");
		caseinfo.setTest_project(test_project);
		caseinfo.setLevel(level);
		try {
			session.insert("copycase", caseinfo);
			session.commit();
		} finally {
			session.close();
		}
	}

}
