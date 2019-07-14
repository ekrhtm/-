<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>게시판 글쓰기</title>
	</head>
	<body>
		<script language="javascript">
			function CheckMemo()
			{
				var form = document.mwrite;			

				
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
				
				if (!form.writepw.value)
				{
					alert("비밀번호를 입력해주세요");
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
		
		<form name="mwrite" method=post action="Write_ok.jsp">
			<table align="center" border="0">			
				<tr>
					<td width="100px">제목: </td>
					<td><input style="width:100%" name="title" type="text"></td>
				</tr>
				<tr>
					<td>작성자: </td>
					<td><input style="width:100%" name="name"  type="text"></td></tr>
				<tr>
					<td>비밀번호: </td>
					<td><input style="width:100%" name="writepw"  type="password"></td></tr>	
				<tr>					
				 	<td colspan=2>
				 		<textarea name="memo" rows="25" cols="76" ></textarea>
					</td>
				</tr>	
				<tr align="center">
					<td colspan=2>
						<input type="button" value="작성" onclick="CheckMemo()">
						<input type="button" value="취소" onclick="location.href='javascript:history.back()';">
					</td>
				</tr>
			</table>
		 </form>
	</body>
</html>