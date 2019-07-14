<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>글 보기</title>
	</head>
	<body>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String url = "jdbc:mysql://localhost:3306/jspexample";
	String id = "root";
	String pw = "as987656";
	String SQL = "SELECT * from board";
	PreparedStatement pstmt;
	
	Connection conn = DriverManager.getConnection(url,id,pw);
	
	String sql = "SELECT Title, Name, Memo, Date FROM board WHERE Num=" + num;
	
	try
	{
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			String title = rs.getString(2);
			String name = rs.getString(1);
			String memo = rs.getString(3);
	%>
		<table width="100%" height="100%" align="center" border="0">
			<tr><td width="500px" height="100%" align="left">제목: <%=title %></td></tr>
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>
			<tr><td align="left">작성자: <%=name %></td></tr>
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>
			<tr height="200px">
				<td colspan=2><%=memo %></td>
			</tr>
			<tr align="right">
				<td colspan=2>
					<a href="Delete.jsp?num=<%=num %>"><input type="submit" value="삭제"></a>
					<a href="modify.jsp?num=<%=num %>"><input type="submit" value="수정"></a>
				</td>
			</tr>
	<%
		}
		sql = "SELECT * FROM comment WHERE c_memonum=" + num;
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		rs.last();
	%>
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>			
			<tr><td>댓글(<%=rs.getRow() %>)</td></tr>	
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>				
	
	<%	
		rs.beforeFirst();
	
		while(rs.next())
		{
			String c_name = rs.getString(1);
			String c_comment = rs.getString(2);		
		    int c_no = rs.getInt(6);
			
	%>
	
			<tr>
				<td align="left" rospan=2>작성자: <%=c_name %></tr>
				<td align="left"><%=c_comment %></td>
				<td align="right"><a href="DelComment.jsp?num=<%=num%>&c_no=<%=c_no%>">삭제</a></td>		
			</tr>
			<tr><td height=0.1 style="background-color:black" colspan=3></td></tr>
	<%
		}
	%>		
			<form method=post action="WriteComment.jsp?num=<%=num%>">
				<tr>
					<td colspan=2>
						<textarea name="comment" rows="5" cols="97" placeholder="내용"></textarea>
				    </td>
				</tr>
				<tr>
					<td align="right" colspan=2>
						<input name="name" type="text" placeholder="이름">
						<input name="c_pw" type="password" placeholder="비밀번호">
						<input type="submit" value="등록">
					</td>
				</tr>
			</form>
		</table>
	<%
		conn.close();
		rs.close();
		pstmt.close();
	}catch(Exception e){
		e.printStackTrace();	
	}
	%>
	
	</body>
</html>