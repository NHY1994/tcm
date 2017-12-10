package com.tcm.selectplan;

import java.util.List;
import java.util.Map;

import com.tcm.bean.TestPlan;

public interface testPlanmap {
	public List<TestPlaninfo> testPlanlist(String id);
	public TestPlaninfo gettestPlanlists(Map<String, Object>map);
}
