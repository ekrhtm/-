<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String url = "jdbc:mysql://localhost:3306/jspexample";
String id = "root";
String pw = "as987656";
int num = Integer.parseInt(request.getParameter("num"));
String comment = request.getParameter("comment");
String name = request.getParameter("name");
String c_pw = request.getParameter("c_pw");
String sql = "INSERT INTO comment (c_name,c_comment,c_memonum,c_pw) VALUES (?,?,?,?)" ;

PreparedStatement pstmt;

try{
	Connection conn = DriverManager.getConnection(url,id,pw);
	
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, name);
	pstmt.setString(2, comment);
	pstmt.setInt(3, num);
	pstmt.setString(4, c_pw);

	pstmt.execute();
	
	pstmt.close();	
	conn.close();
	
}catch(SQLException e){
	e.printStackTrace();
}
%>    

<script language="javascript">
location.href="View.jsp?num=<%=num %>";
</script>
