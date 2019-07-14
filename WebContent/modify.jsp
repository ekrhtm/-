<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>글 수정</title>
	</head>
<%
String num = request.getParameter("num");

String url = "jdbc:mysql://localhost:3306/jspexample";
String id = "root";
String pw = "as987656";
String sql = "SELECT * FROM board WHERE Num=" + num;

PreparedStatement pstmt;
%>

<script language="javascript">
function CheckMemo()
{
	var form = document.mwrite;	
	
	if(!form.writepw.value)
	{
		alert("비밀번호를 입력해주세요");
		return;
	}
	
	if (!form.memo.value)
	{
		alert("내용을 적어주세요");
		return;
	}
	
	if (!form.name.value)
	{
		alert("이름을 입력해주세요");
		return;
	}

	if (!form.title.value)
	{
		alert("제목을 입력해주세요");
		return;
	}
	
	form.submit();
}
</script>
<body>
	<form name="mwrite" method=post action="Modify_ok.jsp?num=<%=num%>">
		<table align="center">
<%
try{
	Connection conn = DriverManager.getConnection(url,id,pw);

	pstmt = conn.prepareStatement(sql);

	ResultSet rs = null;
	rs = pstmt.executeQuery();

	if (rs.next())
	{
		String Name = rs.getString(1);
		String Title = rs.getString(2);		
		String Memo = rs.getString(3);
%>
			<tr align="center">
				<tr>
					<td width="100px">제목: </td>
					<td><input style="width:100%" name="title" type="text" value="<%=Title %>"></td>
				</tr>
				<tr>
					<td>작성자: </td>
					<td><input style="width:100%" name="name"  type="text" value="<%=Name %>"></td></tr>
				<tr>
					<td>비밀번호: </td>
					<td><input style="width:100%" name="writepw"  type="password"></td></tr>	
				<tr>
			<tr>
				<td colspan=2>
					<textarea name="memo" rows="25" cols="76" ><%=Memo%></textarea>
				</td>
			</tr>

<%		
	}
	
	pstmt.execute();
	
	pstmt.close();	
	conn.close();
	rs.close();
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
			<tr align="center">
				<td colspan=2>
					<input type="button" value="수정" onclick="CheckMemo()">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>