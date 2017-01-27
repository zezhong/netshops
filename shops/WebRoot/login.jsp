<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎注册</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/reset.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#container{
				mrgin-top:100px;
				background:url(images/bg2.jpg);
				height:800px;
			}
		#header {
            height: 30px;
            color: #999;
            border-bottom: 1px solid #ddd;
            background-color: #e3e4e5;
            
            }
    #top{
        width: 610px;
        height: 30px;
        margin: 0 auto;
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
		.inpput{
			width:250px;
			height:40px;
			border-radius:5px;
			margin:15px;
		}
	</style>
  </head>
  
  
  <body >
			<div id="container">
				      <div id="header">
            <div id="top">
                <ul>
                    <li><a href="index.html">主页</a></li>
                    <li><a class="top" href="entry.jsp" style="color:#F40 ">你好，请登录</a></li>
                    <li><a class="top" href="login.jsp">免费注册</a></li>
                    <li><a class="top" href="entry.jsp">我的信息</a></li>
                    <li><a class="top" href="entry.jsp">我的订单</a></li>
                    <li><a class="top" href="adminlogin.jsp">我是卖家</a></li>
                   
                </ul>
            </div>
        </div>
				
				<div id="content">
  				<h1 align="center" style="font-size:30px; font-family:tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important;"> 用户注册</h1>
    	
				<form action="/shops/UserSer" method="post">
    			<table align="center">
    				<tr>
    					<td>用户名</td>
    					<td><input class="inpput" type="text" name="userId"/></td>
    				</tr>
    				<tr>
    					<td>姓名</td>
    					<td><input class="inpput" type="text" name="name"/></td>
    				</tr>
    				<tr>
    					<td>密码</td>
    					<td><input   class="inpput" type="password" name="password"/></td>
    				</tr>
    				<tr>
    					<td>性别</td>
    					<td><input type="radio" name="gender" value="男"/>男
    						<input  style="margin-left: 30px;" type="radio" name="gender" value="女"/>女
    					</td>
    				</tr>
    				<tr>
    					<td>手机号</td>
    					<td><input class="inpput" type="text" name="phone"/></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input class="btn"  type="submit" name="submit" value="注册" style="width:250px;height:40px; color:rgb(228,239,220); margin:10px;background:rgb(8,88,125)"></td>
    				</tr>
    			</table>
    			<input type="hidden" name="status" value="registe">
    	</form>
          </div>
    </div>
    
  </body>
</html>
