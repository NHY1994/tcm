package login;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SignUp {
	public String su(String id,
	String username,
	String psd,
	String company,
	String reg_time,
	String last_login_time,
	String status,
	String role,
	String reg_ip) throws IOException{
		String mybatisconfig="MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(mybatisconfig); 
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		UserInfo userInfo=new UserInfo();
		userInfo.setId(id);
		userInfo.setUsername(username);
		userInfo.setPsd(psd);
		userInfo.setCompany(company);
		userInfo.setReg_time(reg_time);
		userInfo.setRole(role);
		userInfo.setStatus(status);
		userInfo.setReg_ip(reg_ip);
		userInfo.setLast_login_time(last_login_time);
		try{
		session.insert("SignUp", userInfo);
		session.commit();
		}
		finally{
			session.close();
			}
		return null;
	}
}
