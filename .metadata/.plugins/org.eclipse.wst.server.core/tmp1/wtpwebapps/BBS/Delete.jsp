<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>게시글 삭제</title>
		<style>
			#pwbox {
				width:200px;
			}
		</style>
	</head>
	<body>
		<script language="javascript">
			function DelCheck()
			{
				var form = document.mdel;
				
				if(!form.writepw.value)
				{
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				form.submit();
			}
		</script>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	%>
		<form name="mdel" action="Delete_ok.jsp?num=<%=num %>" method="post">
			<table align="center" width="300px" >
				<tr><td align="center" colspan=2>비밀번호를 입력해주세요</td></tr>
				<tr><td align="center" colspan=2><input type="password" name="writepw" id="pwbox"></td></tr>
				<tr>
					<td align="center"><input type="button" value="확인" onclick="DelCheck()"></td>
			    	<td align="center"><input type="button" value="취소" onclick="history.back()"></td>
			    </tr>
			</table>
		</form>
	</body>
</html>