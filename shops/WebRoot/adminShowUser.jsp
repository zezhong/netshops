<%@ page language="java" import="java.util.*,proj.User" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
      <td class="td1" width="120" align="center" valign="middle">用户ID</td>
      <td class="td1" width="145" align="center">姓名</td>
      <td class="td1" width="253" align="center">密码</td>
      <td class="td1" width="148" align="center">性别</td>

      <td  class="td1" width="148" align="center">电话</td>
        <td  class="td1" width="148" align="center">操作</td>
    </tr>
 
 
 	<%
 	//System.out.println("gfhk;ld");
 	request.setCharacterEncoding("utf-8");
 		List<User> list=(List<User>)session.getAttribute("userList");
 		//System.out.println("成功执行集合");
 		System.out.println(list.size());
 		for(int i=0;i<list.size();i++)
 		{
 		System.out.println("guifldhgio;");
 			User user=new User();
 			user=list.get(i);
 			%>
 			
 	
 	<tr>
      <td class="td2" height="40" align="center" valign="middle"><%=user.getUserId()%></td>
      <td  class="td2"  align="center" valign="middle"><%=user.getName()%></td>
      <td  class="td2" valign="middle"><%=user.getPassword()%></td>    
       <td  class="td2"  align="center" valign="middle"><%=user.getGender()%></td>  
          <td class="td2"  align="center" valign="middle"><%=user.getPhone()%></td> 
           <td  class="td2" align="center" valign="middle"><a class="a2" href="/shops/adminDeleteUser?userId=<%=user.getUserId()%>">删除</a></td>   
          
    </tr>
    
 	<%	}
 	 %>
 	 </table>
    <a class="a1"  href="adminMaintain.jsp">返回维护页面</a>
  </body>
</html>
