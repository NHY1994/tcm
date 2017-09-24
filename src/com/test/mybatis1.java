package com.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import testcase.caseinfo;

public class mybatis1 {
public static void mybatis1() throws IOException{
	String resource = "MybatisConfig.xml";
	InputStream inputStream = Resources.getResourceAsStream(resource); 
	SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	SqlSession session = sqlSessionFactory.openSession();
	try{
	caseinfo caseinfo = session.selectOne("selectid", "001");
	System.out.println(caseinfo.getId());
	}
	finally{
		session.close();
		}
}
}
