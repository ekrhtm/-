<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>게시판 리스트</title>
	</head>
	<body>
<%
		String url = "jdbc:mysql://localhost:3306/jspexample";
		String id = "root";
		String pw = "as987656";
		String sql = "SELECT * from board";
		
%>
		<table align="center" width="100%"  border="0">
			<tr align="center">
				<th align="center" width="80px">번호</td>
				<th align="center" width="500px">제목</td>
				<th align="center">작성자</td>
			</tr>
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>
  <%
	try{	
			Connection conn = DriverManager.getConnection(url,id,pw);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
		    ResultSet rs = pstmt.executeQuery();    
		    
		    if (rs.next())
		    {	
	    		rs.beforeFirst();	    	
				while(rs.next())
				{
					String name = rs.getString(1);
					String title = rs.getString(2);			
					int num = rs.getInt(5);		
%>
			<tr>
				<td align="center"><%=num %></td>
				<td align="center"><a href="View.jsp?num=<%=num %>"><%=title %></a></td>
				<td align="center"><%=name %></td>
			</tr>

<%	
				}		
		    }
		    else
		    {
%>
			<tr>
				<td align="center" colspan=3>작성된 글이 없습니다.</td>
			</tr>
<%  	
		    }
			conn.close();
			rs.close();
			pstmt.close();    
		}catch(Exception e){
			e.printStackTrace();	
		}	
%>				
			<form method=post action="Write.jsp">
				<tr>  	
					<td align="right" colspan=3><input type=submit value="글쓰기"></td>	   
				</tr>
			</form>
		</table>
	</body>
</html>