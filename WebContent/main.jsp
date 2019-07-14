<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		html, body {height:100%;}		
	</style>
<title>메인 페이지</title>
</head>
<body>
	<script language="javascript">
		function homeclick()
		{
			document.getElementById("frame").src = "index.jsp";
		}
	</script>
	<div style="width:100%;height:20%;background-color:red">111</div>
	<div style="width:100%;height:10%;background-color:gray">
		<a href="#" onclick="homeclick()">Home</a>
	</div>
	<div style="width:20%;height:70%;float:left;background-color:yellow">
		<div>카테고리1</div>
		<div>카테고리2</div>
	</div>	
	<div style="width:80%;height:70%;float:right">
		<iframe id="frame" src="index.jsp" width="100%" height="100%" frameborder=0></iframe>
	</div>
</body>
</html>