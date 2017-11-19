package com.tcm.copycase;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import com.tcm.bean.TestPlan;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import testcase.caseinfo;

public class CreatPlan {
	public void creatplan(Date end_time, String id, String note, String plan_version, String project,
			String software_version, Date star_time, String status) throws IOException {
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		TestPlan testPlan = new TestPlan();
		testPlan.setEnd_time(end_time);
		testPlan.setId(id);
		testPlan.setNote(note);
		testPlan.setPlan_version(plan_version);
		testPlan.setProject(project);
		testPlan.setSoftware_version(software_version);
		testPlan.setStar_time(star_time);
		testPlan.setStatus(status);
		try {
			session.insert("creatplan", testPlan);
			session.commit();
		} finally {
			session.close();
		}
	}
}
