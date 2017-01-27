<%@ page language="java" import="java.util.*,proj.message" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
  <style type="text/css">
  	body{
  		background-image:url("images/bg2.jpg");
  	}
  </style>
  
  <body>

 	<table width="740" border="1" cellspacing="0" cellpadding="6">
 	<caption >所有留言</caption>
    <tr> 
      <td class="td1" width="120" align="center" valign="middle">title</td>
      <td class="td1" width="145" align="center">userId</td>
      <td class="td1" width="253" align="center">time</td>
      <td class="td1" width="148" align="center">content</td>

      <td  class="td1" width="148" align="center">mail</td>
    
    </tr>
 
 
 	<%
 	//System.out.println("gfhk;ld");
 	request.setCharacterEncoding("utf-8");
 		List<message> list=(List<message>)session.getAttribute("messageList");

 		
 		for(int i=0;i<list.size();i++)
 		{
 	
 			message message1=new message();
 			message1=list.get(i);
 			%>
 			
 	
 	<tr>
      <td class="td2" height="40" align="center" valign="middle"><%=message1.getTitle()%></td>
      <td  class="td2"  align="center" valign="middle"><%=message1.getUserId()%></td>
      <td  class="td2" valign="middle"><%=message1.getTime()%></td>    
       <td  class="td2"  align="center" valign="middle"><%=message1.getContent()%></td>  
          <td class="td2"  align="center" valign="middle"><%=message1.getMail()%></td> 
          
          
    </tr>
    
 	<%	}
 	
 	 %>
 	 </table>
	<a href="index.html">返回主页</a></br>

  </body>
</html>
