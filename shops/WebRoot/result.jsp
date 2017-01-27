<%@ page language="java" import="java.util.*,proj.Product,proj.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'result.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  		 <%
		  		User user = (User)session.getAttribute("user");
		   %>
		<table border="1" class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<td>类别编号</td>
				<td>产品编号</td>
				<td>产品名称</td>
				<td>价格</td>
				<td>剩余数量</td>
				<td>描述</td>
			</tr>
			<%
				ArrayList<Product> products = (ArrayList) request.getAttribute("products");
				if(products !=null ){
					if( user == null){
				for (int i = 0; i < products.size(); i++) {
				
			%>
			<tr  class="success">
				<td><%=products.get(i).getCataId()%></td>
				<td><%=products.get(i).getProductId()%></td>
				<td><%=products.get(i).getProductName()%></td>
				<td><%=products.get(i).getMarketPrice()%></td>
				<td><%=products.get(i).getQty()%></td>
				<td><%=products.get(i).getDecribe()%></td>
				<td><a href="entry.jsp">购买</a></td>
			</tr>
			<%
				}
				}else{
				for (int i = 0; i < products.size(); i++) {
				%>
						<tr class="success">
				<td><%=products.get(i).getCataId()%></td>
				<td><%=products.get(i).getProductId()%></td>
				<td><%=products.get(i).getProductName()%></td>
				<td><%=products.get(i).getMarketPrice()%></td>
				<td><%=products.get(i).getQty()%></td>
				<td><%=products.get(i).getDecribe()%></td>
				
				<td><a href="purchase.jsp?userId=<%=user.getUserId()%>&productId=<%= products.get(i).getProductId()%>">购买</a></td>
			</tr>
					
				<%}
				}
			}
			%>
		</table>

  </body>
</html>
