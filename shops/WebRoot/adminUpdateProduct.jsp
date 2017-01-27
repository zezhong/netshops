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
   <form action="/shops/adminUpdateProduct" method="post" name="form">
    <table>
    <tr><td>  productId  </td><td>  <input type="text" name="productId" />  </td></tr>
     <tr><td>  cataId  </td><td>  <input type="text"name="cataId" />  </td></tr>
      <tr><td>  	productName  </td><td> <input type="text"  name="productName"/>   </td></tr>
       <tr><td>  costPrice  </td><td>  	<input type="text"  name="costPrice"/>  </td></tr>
        <tr><td>  markPrice  </td><td>  	<input type="text" name="marketPrice"/>  </td></tr>
         <tr><td> qty</td> <td> <input type="text"  name="qty"/> </td></tr>
          <tr><td>  decrible  </td><td>    	<input type="text" name=decribe /> </td></tr>
           <tr> <td></td> <td>  <input type="submit" value="增加商品信息" style="width:100px; height:30px;background:rgb(164,18,21)" /> </td></tr>

 	<tr> <td></td><td> <a href="adminShowProduct.jsp">返回到商品页面</a></td></tr>
 	</table>
   </form>
   </center>
  </body>
</html>
