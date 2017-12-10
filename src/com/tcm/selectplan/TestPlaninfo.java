package com.tcm.selectplan;

import java.util.Date;

public class TestPlaninfo {
	private String id;
	private String test_plan_version;
	private String project;
	private Date star_time;
	private Date end_time;
	private String status;
	private String software_version;
	private String plan_version;
	private String note;
	private String star_timetoString;
	private String end_timetoString;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public Date getStar_time() {
		return star_time;
	}

	public void setStar_time(Date star_time) {
		this.star_time = star_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSoftware_version() {
		return software_version;
	}

	public void setSoftware_version(String software_version) {
		this.software_version = software_version;
	}

	public String getPlan_version() {
		return plan_version;
	}

	public void setPlan_version(String plan_version) {
		this.plan_version = plan_version;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getTest_plan_version() {
		return test_plan_version;
	}

	public void setTest_plan_version(String test_plan_version) {
		this.test_plan_version = test_plan_version;
	}

	public String getStar_timetoString() {
		return star_timetoString;
	}

	public void setStar_timetoString(String star_timetoString) {
		this.star_timetoString = star_timetoString;
	}

	public String getEnd_timetoString() {
		return end_timetoString;
	}

	public void setEnd_timetoString(String end_timetoString) {
		this.end_timetoString = end_timetoString;
	}

}
