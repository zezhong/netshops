<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
 
<style type="text/css"> 
body{
	background-image: url("images/bg2.jpg");
	
}
</style>
  </head>
  
  <body>
	
	<form action="/shops/insertMessage" method="post" name="form">
	
	<center><table>
		<tr>  <td>主题</td><td> <input type="text" name="title" /></td></tr>
		<tr> <td>内容</td><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
		<tr> <td> &nbsp;</td><td><input type="submit" value="发表"/></td></tr>
		</table>
		</center>
	</form>
  </body>
</html>
