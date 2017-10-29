package login;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.attribute.UserPrincipalLookupService;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class login_result {
	public String login(String username, String psd,HttpSession httpsession) throws IOException {
		String resource = "MybatisConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		LoginInterface loginInterface = session.getMapper(LoginInterface.class);
		UserInfo uerInfo;
		try {
			uerInfo = loginInterface.uerInfo(username, psd);
			
		} finally {
			session.close();
		}
		try {
			if (username.equals(uerInfo.getUsername()) && psd.equals(uerInfo.getPsd())) {
				httpsession.setAttribute("userid", uerInfo.getId());
				httpsession.setAttribute("username", uerInfo.getUsername());
				return "success";
			} else
				return "’À∫≈ªÚ’ﬂ√‹¬Î¥ÌŒÛ";
		} catch (Exception e) {
			    return "’À∫≈ªÚ’ﬂ√‹¬Î¥ÌŒÛ";
		}
		
	}
}
