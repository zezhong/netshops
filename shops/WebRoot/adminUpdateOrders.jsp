<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
   
<style type="text/css">
	body {
		background: url(images/bg3.jpg) no-repeat;
}
</style>
  </head>
  
  <body>
  <center>
    <form action="/shops/adminUpdateOrders" method="post" name="form">
    
    <table>
    <tr><td>orderId</td> <td><input type="text" name="orderId" value="<%=request.getParameter("orderId")%>" /> </td></tr> 
  	 <tr>  <td> userId   </td><td> 	<input type="text"  name="userId" /></td>  </tr>
       <tr>  <td> orderDate </td> <td>	<input type="text"  name="orderDate" /> </td>  </tr>
         <tr>  <td> totalPrice  </td>  <td> <input type="text" name="totalPrice" /></td> </tr>
       <tr><td></td> <td>  <input type="submit" value="修改单信息" /></td></tr>
  	</table>
  		
  	<a href="adminShowOrders.jsp" >返回到订单页面</a>
  	</form>
  	</center>
  </body>
</html>
