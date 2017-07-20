<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/tcm";
	String sql="SELECT username FROM `user` WHERE id=001";
	String name="null";
	try{
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, "root", "123456");
		PreparedStatement ps=null;
		ResultSet rs=null;
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		name=rs.getString("username");
		}
	}
	catch (ClassNotFoundException e) {
		System.out.println("Sorry,can`t find the Driver!");
		e.printStackTrace();
	}
	%>
	<%=name %>
</body>
</html>