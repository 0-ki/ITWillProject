<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ArtShowDB Test</title>
</head>
<body>
	<h1>ArtShowDB Test</h1>
<%
Connection conn = null;
		String url="jdbc:mysql://localhost:3306/artshowdb";
		String id = "artmaster";
		String pw = "1111";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(url, id, pw);
		out.println(conn);
		System.out.println(conn);
%>
</body>
</html>