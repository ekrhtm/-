<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String url = "jdbc:mysql://localhost:3306/jspexample";
String id = "root";
String pw = "as987656";
String name = request.getParameter("name");
String title = request.getParameter("title");
String memo = request.getParameter("memo");
String writepw = request.getParameter("writepw");
String dbpw = null;
int num = Integer.parseInt(request.getParameter("num"));

PreparedStatement pstmt;

try{
	Connection conn = DriverManager.getConnection(url,id,pw);
	String pwsql = "SELECT writepw from board where Num=" + num;
    
	pstmt = conn.prepareStatement(pwsql);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		dbpw = rs.getString(1);	
	
		if(dbpw.equals(writepw))
		{
			String sql = "UPDATE board SET Name=?, Title=?, Memo=? Where Num=" + num;

			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, memo);
		
			pstmt.execute();
			
			pstmt.close();			
			conn.close();
			rs.close();
			
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
}catch(SQLException e){
	e.printStackTrace();
}
%>
<script language="javascript">
location.href="javascript:history.go(-2)";
</script>
