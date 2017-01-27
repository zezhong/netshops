<%@ page language="java" import="java.util.*,proj.Product" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
   
 <style type="text/css">
   body{
		background: url(images/bg3.jpg) no-repeat;
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
      <td class="td1" width="120" align="center" valign="middle">productId</td>
      <td   class="td1"  width="145" align="center">catId</td>
      <td  class="td1" width="253" align="center">productName</td>
      <td  class="td1" width="148" align="center">costPrice</td>

      <td   class="td1"width="148" align="center">markprice</td>
        <td   class="td1" class="td1" width="148" align="center">qty</td>
          <td   class="td1"width="148" align="center">decribe</td>
            <td   class="td1"width="148" align="center">增加</td>
              <td  class="td1" width="148" align="center">修改</td>
                <td  class="td1" width="148" align="center">删除</td>
    </tr>
   
 
 	<%

 	request.setCharacterEncoding("utf-8");
 		List<Product> list=(List<Product>)session.getAttribute("ProductList");
 	//	System.out.println("成功执行集合");
 	//  System.out.println(list.size());
 		for(int i=0;i<list.size();i++)
 		{
 		//System.out.println("guifldhgio;");
 			Product product=new Product();
 			product=list.get(i);
 			%>
 			
 	
 	
 	<tr>
      <td class="td2" height="40" align="center" valign="middle"><%=product.getProductId()%></td>
      <td   class="td2" align="center" valign="middle"><%=product.getCataId()%></td>
      <td  class="td2"  valign="middle"><%=product.getProductName()%></td>    
       <td   class="td2" class="td2" align="center" valign="middle"><%=product.getCostPrice()%></td>  
          <td  class="td2" align="center" valign="middle"><%=product.getMarketPrice()%></td> 
          <td  class="td2" align="center" valign="middle"><%=product.getQty()%></td>   
            <td  class="td2" align="center" valign="middle"><%=product.getDecribe()%></td> 
             <td  class="td2" align="center" valign="middle"><a  class="a2" href="adminUpdateProduct.jsp">添加</a></td> 
              <td  class="td2" align="center" valign="middle"><a  class="a2"  href="/shops/adminDeleteProduct?productId=<%=product.getProductId()%>">删除</a></td> 
               <td  class="td2" align="center" valign="middle"><a  class="a2"  href="adminUpdateAlterProduct.jsp?productId=<%=product.getProductId()%>">修改</a></td> 
    </tr>
   
 	<%	}
 	 %>
 	  </table>
   <a class="a1" href="adminMaintain.jsp">返回维护页面</a>
  </body>
</html>
