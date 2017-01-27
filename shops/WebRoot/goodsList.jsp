<%@ page language="java" import="java.util.*,impl.ProductImpl,proj.ShopingCart,proj.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    		String userId1 =(String) session.getAttribute("userId");
    		if(userId1==null){
    			response.sendRedirect("entry.jsp");
    		}
    	 %>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsList.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
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
    #table{
		margin:0 auto;
    }
    
	
	</style>

  </head>
  
  <body >
  <div>
  		
 
    	<%
    		String userId =(String) session.getAttribute("userId");
    		ProductImpl productimpl = new ProductImpl();
    		//ShopingCart cart = productimpl.queryProduct(userId);
    		ArrayList<ShopingCart> products = productimpl.queryProduct(userId);
    		User user = (User)session.getAttribute("user");
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
        
    	 <div class="row col-lg-11">
                <div class="table-responsive">
    	 <table id="table" class="table table-striped table-bordered table-hover table-condensed">
    	 	<thead>
    	 	<tr class="danger">
    	 		<td>订单编号</td>
    	 		<td>用户名</td>
    	 		<td>产品名称</td>
    	 		<td>订单创建时间</td>
    	 		<td>价格</td>
    	 		<td>操作</td>
    	 	</tr>
    	 	</thead>
    	 	<%
					if(products!=null){
						for(int i=0;i<products.size();i++){
							%>
							<tbody>
							<tr class="success">
								<td><%=products.get(i).getOrderId() %></td>
								<td><%=products.get(i).getUserId() %></td>
								<td><%=products.get(i).getProductName() %></td>
								<td><%=products.get(i).getOrderDate() %></td>
								<td><%=products.get(i).getMarketPrice() %></td>
								<td><a href="ProductSer?OrderId=<%=products.get(i).getOrderId()%>&status=deleteOrder" >取消订单</a></td>
							</tr>
							</tbody>
							<%
						}
					}
    	 	 %>
    	 	
    	 </table>
    	 </div>
    	 </div>
        </div>
    
    
  </body>
</html>
