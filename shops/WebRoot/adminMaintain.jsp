<%@ page language="java" import="java.util.*,proj.User,ser.adminSelectAllUser" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
   
	<style type="text/css">
		body{
	background: url(images/bg3.jpg) no-repeat;
	margin: 0 auto;
	}
		p{
			font: 36px;
			color: red;
		}
		.input1{
			font-size: 24px;
			color: navy;
		}
	.a1{
		font-size: 20px;
		color: fuchsia;
	}
	</style>
  </head>
  
  <body >
  	<p align="center">管理员维护后台操作</p>
 <form action="/shops/adminSelectAllUser" name="form1" method="post">
 <input class="input1" type="submit" value="维护用户"/>
 </form>
 
 <form action="/shops/adminSelectProduct" name="form1" method="post">
 <input class="input1" type="submit" value="维护商品"/>
 </form>
 
 
  <form action="/shops/adminSelectOrders" name="form1" method="post">
 <input  class="input1" type="submit" value="维护订单"/>
 </form>
 
 	
 	
 <a class="a1" href="adminlogin.jsp"> 返回管理员登陆页面</a>
  </body>
</html>
