 <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String url = "jdbc:mysql://localhost:3306/jspexample";
String id = "root";
String pw = "as987656";
int num = Integer.parseInt(request.getParameter("num"));
String writepw = request.getParameter("writepw");
String password=null;

try{
	Connection conn = DriverManager.getConnection(url,id,pw);
	
	Statement stmt = conn.createStatement(); 
	String sql = "SELECT writepw FROM board WHERE Num=" + num; 
	ResultSet rs = stmt.executeQuery(sql); 
	
	if(rs.next()){
		password = rs.getString(1);
	}	
	
	if(password.equals(writepw))
	{
		sql = "DELETE FROM board WHERE Num=" + num;
		stmt.executeUpdate(sql);	
		
		sql = "DELETE FROM comment WHERE c_memonum=" + num;
		stmt.executeUpdate(sql);
	}
	else 
	{
%>
<script language="javascript">
alert("비밀번호가 틀렸습니다.");
location.href="javascript:history.back()";
</script>
<%
	}
	conn.close();
	stmt.close();
	rs.close();
}catch(Exception e){
	e.printStackTrace();
}

%>  

<script language="javascript">
location.href="index.jsp";
</script>