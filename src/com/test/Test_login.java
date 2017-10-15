package com.test;


import java.io.IOException;

import org.junit.Test;

import login.SignUp;
import login.login_result;

public class Test_login {

	@Test
	public void test() throws IOException {
		login_result result=new login_result();
		System.out.println(result.login("nihongyan1","123456"));
	}
	
	@Test
	public void testsignup() throws IOException {
		SignUp signUp =new SignUp();
		signUp.su("00001", "123", "123", "123","2017-06-18 17:30:59" ,"2017-06-18 17:30:59" , "1", "1", "123");
	}

}
