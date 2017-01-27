<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
 <head>
	<style type="text/css">
	body{
	background:url(images/bg3.jpg) no-repeat;
	margin: 0 auto;
	}
	.input1{
		margin: 100px auto  ;
	}
	
	.input2{
		margin: 0 auto ;
	}
	.c{
		font-size: 36px;
		font-weight: bold;
	}
	
	</style>
	
  
  </head>
  
  <body>
  <div class="div1">
  
  <center>
  
 
 <form action="/shops/adminServlet" method="post" name="adminform">
 					
  <table cellpadding="0" cellspacing="0">
  			<tr><td class="c" colspan="4">管理员登陆</td></tr> 
			<tr><td class="input1">用户ID:</td> <td><input class="input1" type="text" name="adminId"></td> </tr>
			<tr><td>密　码:</td>  <td><input  class="input2" type="password" name="adminPassword" ></td></tr>
			<tr> <td>&nbsp;&nbsp;</td><td><input type="submit" name="adminsubmit" value="登录" style="width:100px; height:30px;background:rgb(164,18,21)"></td></tr>
			
	</table>
	<p> <a href="index.html"> 返回主页</a></p>
</form>

</center>
</div>
  </body>
</html>
