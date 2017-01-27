<%@ page language="java" import="java.util.*,proj.Orders" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
   <style type="text/css">
   body{
   	background: activeborder;
   }
   	.td1{
   	background:lime;
   	}
   	.td2{
   	background:teal;
   	}
   	.a1{
   		font-size: 18px;
   		color: red;
   		font-style: italic;
   	}
   	.a2{
   		color: fuchsia;
   	}
   </style>
   

  </head>
  
  <body>
   <table width="740" border="1" cellspacing="0" cellpadding="6">
 	
    <tr> 
      <td class="td1" width="120" align="center" valign="middle">orderId</td>
      <td class="td1" width="145" align="center">userId</td>
      <td class="td1"  width="253" align="center">orderDate</td>
      <td class="td1" width="148" align="center">totalPrice</td>

     
            <td class="td1" width="148" align="center">增加</td>
              <td class="td1" width="148" align="center">修改</td>
                <td class="td1" width="148" align="center">删除</td>
    </tr>
   
 
 	<%

 	request.setCharacterEncoding("utf-8");
 		List<Orders> list=(List<Orders>)session.getAttribute("OrdersList");
 	//	System.out.println("成功执行集合");
 	//  System.out.println(list.size());
 		for(int i=0;i<list.size();i++)
 		{
 		//System.out.println("guifldhgio;");
 			Orders order=new Orders();
 			order=list.get(i);
 			%>
 			
 	
 	
 	<tr>
      <td class="td2" height="40" align="center" valign="middle"><%=order.getOrderId()%></td>
      <td class="td2" align="center" valign="middle"><%=order.getUserId()%></td>
      <td class="td2" valign="middle"><%=order.getOrderDate()%></td>    
       <td class="td2" align="center" valign="middle"><%=order.getTotalPrice()%></td>  
         
              <td class="td2" align="center" valign="middle"><a class="a2"  href="adminInsertOrders.jsp">添加</a></td> 
               <td class="td2" align="center" valign="middle"><a class="a2"  href="adminUpdateOrders.jsp?orderId=<%=order.getOrderId()%>">修改</a></td> 
               <td class="td2" align="center" valign="middle"><a class="a2"  href="/shops/adminDeleteOrders?orderId=<%=order.getOrderId()%>">删除</a></td> 
              
           
    </tr>
   
 	<%	}
 	 %>
 	  </table>
 	   <a class="a1" href="adminMaintain.jsp">返回维护页面</a>
  </body>
</html>
