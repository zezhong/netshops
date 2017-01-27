<%@ page language="java" import="java.util.*,proj.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
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
  		<div id="container">
  		 <div id="header">
  		 	<%
		  		User user = (User)session.getAttribute("user");
		   %>
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
  		
  		<h1 align="center">修改个人信息</h1>
  		<%
  			String userId= (String)session.getAttribute("userId");
  			String name= (String)session.getAttribute("name");
  			String password= (String)session.getAttribute("password");
  			String phone= (String)session.getAttribute("phone");
  			
  			
  		 %>
				 <form action="/shops/UserSer" method="post">
		 				<table align="center">
    				<tr>
    					<td>用户名</td>
    					<td><input type="text" name="userId" style="width:200px;height:35px;" value=<%=userId%> disabled></td>
    				</tr>
    				<tr>
    					<td>姓名</td>
    					<td><input type="text" name="name" style="width:200px;height:35px;" value=<%= name%>></td>
    				</tr>
    				<tr>
    					<td>密码</td>
    					<td><input type="password" name="password" style="width:200px;height:35px;" value=<%=password %>></td>
    				</tr>
    				
    				<tr>
    					<td>手机号</td>
    					<td><input type="text" name="phone" style="width:200px;height:35px;" value=<%=phone %>></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" name="submit" style="width:200px;height:35px;" value="提交"></td>
    				</tr>
    		</table>
    			<input type="hidden" name="userId" style="width:200px;height:35px;" value=<%=userId%> >
    			<input type="hidden" name="status" value="update"/>
    		</form>
	</div>

  </body>
</html>
