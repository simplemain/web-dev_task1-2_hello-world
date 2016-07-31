<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true"%> <!-- jsp标签，用来清除多余的空格 -->
<%@ page contentType="text/html; charset=UTF-8" %> <!-- jsp标签，用来设置编码和内容格式 -->
<%@ page import="java.lang.String,java.lang.Integer"%>
<html>
	<head>
		<meta name="referrer" content="always" />
		<meta charset="utf-8" />
		<title>hello world</title>
	</head>
	
	<body style="font-family:Courier New;text-align:center">
	
		<div style="padding:100px 0 30px 0;">
			<!-- jsp标签，用来获取参数，并输出到网页上 -->
			用户请求参数：
			<%
			String a = request.getParameter("a");
			String b = request.getParameter("b");
			%>
			
			a=<%out.println(a);%>, 
			b=<%out.println(b);%>
		</div>
		
	</body>

</html>
