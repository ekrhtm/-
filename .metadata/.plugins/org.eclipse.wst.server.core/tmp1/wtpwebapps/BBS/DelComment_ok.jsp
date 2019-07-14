 <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String url = "jdbc:mysql://localhost:3306/jspexample";
String id = "root";
String pw = "as987656";

int c_no = Integer.parseInt(request.getParameter("c_no"));
int num = Integer.parseInt(request.getParameter("num"));

String writepw = request.getParameter("writepw");
String password=null;
PreparedStatement pstmt;



try{
	Connection conn = DriverManager.getConnection(url,id,pw);
	
	Statement stmt = conn.createStatement(); 
	String sql = "SELECT c_pw FROM comment WHERE c_no=" + c_no; 
	ResultSet rs = stmt.executeQuery(sql); 
	
	if(rs.next()){
		password = rs.getString(1);
		
		if(password.equals(writepw))
		{
			sql = "DELETE FROM comment WHERE c_no=" + c_no;
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
	}
	conn.close();
	rs.close();
	stmt.close();
	
}catch(Exception e){
	e.printStackTrace();
}
%>  

<script language="javascript">
location.href="View.jsp?num=<%=num %>";
</script>