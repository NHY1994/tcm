package com.tcm.selectplan;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class selcetPlan {
	public String select(String userinput) throws IOException, JSONException{
		JSONArray array=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		try{
			List<TestPlaninfo> testlpan=session.selectList("selectPlan1", userinput);
			for(int i = 0;i<testlpan.size();i++){
				System.out.println(testlpan.get(i).getTest_plan_version());
				String starttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(testlpan.get(i).getStar_time());
				String endtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(testlpan.get(i).getEnd_time());
				testlpan.get(i).setStar_timetoString(starttime);
				testlpan.get(i).setEnd_timetoString(endtime);
				JSONObject jsonObject1=new JSONObject(testlpan.get(i));
				System.out.println(jsonObject1.toString());
				array.put(jsonObject1);
				System.out.println(array.toString());
			}
			jsonObject.put("rows", array);
			System.out.println(jsonObject.toString());
		}
		finally{
			session.close();
			}
		return jsonObject.toString();
	}

}
