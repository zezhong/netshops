<%@ page language="java" import="java.util.* ,impl.ProductImpl,proj.Product,proj.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'purchase.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#header {
            height: 30px;
            color: #999;
            border-bottom: 1px solid #ddd;
            background-color: #e3e4e5;
            
            }
    #top{
        width:610px;
        height:30px;
        margin:0 auto;
    }
    #header li{
        width: 100px;
        float: left;
        list-style: none;
        text-align: center;
    }
    #header a{
        color: #6C6C6C;
        text-decoration: none;
        display: block;
        font-size: 12px;
        line-height: 30px;
        font-family: tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important;
    }
    #header a:visited{

    }
    #header a:active{

    }
    #header a:hover{
        color: #F40;
    }
	</style>

  </head>
  
  <body>
  		<%
  				User user= (User)session.getAttribute("user");
  		 %>
  		<div id="header">
            <div id="top">
                <ul>
                    <li><a class="top" href="userInfor.jsp?userId=<%=user.getUserId() %>" ><%=user.getUserId() %></a></li>
                    <li><a href="index.jsp" style="color:#F40 ">主页</a></li>
                    <li><a class="top" href="userInfor.jsp?userId=<%=user.getUserId() %>">我的信息</a></li>
                    <li><a class="top" href="goodsList.jsp">我的订单</a></li>
                     <li><a class="top" href="adminlogin.jsp">我是卖家</a></li>
                </ul>
            </div>
        </div>
   		
   		 <div align="center">
   		 		<% 
   					String productId= request.getParameter("productId"); 
   					ProductImpl productimpl = new ProductImpl(); 
   					Product product = productimpl.check(productId); 
   					  
   		 		%>
				<form action="/shops/ProductSer" method="post">
						<input type="hidden" name="userId" value=<%=session.getAttribute("userId")%>>
						<input type="hidden" name="productId" value=<%=productId%>>
						<input type="hidden" name="status" value="purchase">
						<input type="hidden" name="productPrice" value=<%=product.getMarketPrice() %>>
						
					<table>
						<tr>
							<td>商品名</td>
							<td><input type="text" name="text" value=<%=product.getProductName() %> disabled="disabled"></td>
						</tr>
						<tr>
							<td>价格</td>
							<td><input type="text"  value=<%=product.getMarketPrice() %> disabled="disabled"></td>
						</tr>
						<tr>
							<td>剩余数量</td>
							<td><input type="text" name="qty" value=<%=product.getQty() %> disabled="disabled"></td>
						</tr>
						<tr>
							<td>购买数量</td>
							<td><input type="text" name="buyqty"></td>
						</tr>
						<tr>
							<td> </td>
							<td><input type="submit" name="submit" value="购买"></td>
						</tr>
					</table>
					
				</form>   		 		
   		 </div>
  </body>
</html>
