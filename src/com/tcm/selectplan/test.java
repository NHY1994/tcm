package com.tcm.selectplan;


import static org.junit.Assert.*;

import java.io.IOException;

import org.json.JSONObject;
import org.junit.Test;

import javafx.print.JobSettings;

public class test {

	@Test
	public void test() throws IOException {
		selcetPlan seletplan=new selcetPlan();	}
	
	@Test
	public void test1(){
		TestPlaninfo bean=new TestPlaninfo();
		JSONObject jsonObject=new JSONObject(bean);
		System.out.println(jsonObject.toString());
	}

}
