<%@ page language="java" import="java.util.*,proj.ShopingCart" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
  	 <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <title>你的专属商城</title>
	<style>
		#container{
				background:url(images/bg1.jpg) no-repeat;
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
		#form{
			width:400px;
			height:400px;
			float:right;
			margin-top:50px;
			margin-right:150px;
			background:rgb(255,239,230);
		}
		.input{
			width:250px;
			border-radius:5px;
			margin:15px;
			align:center;
		}
	</style>
	</head>
  <body>
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
  
  		<div style="height: 80px;">
  				<h1 align="center" style="color:#ff4401;font-family:tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important;">欢迎登陆</h1>
  			</div>
  		
  			
			 <div id="form">
					<h2 align="center" style="font-family:tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important; font-size:25px; margin-top:50px;">密码登陆</h2>
					<form action="/shops/UserSer" method="post">
						<table style="margin-left: 30px;">
						<tr>
							<td>
								用户名	
							</td>
							<td>
								<input style="height:45px; border-radius:5px;font-size:25px;font-family:tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important;" class="input" type="text" name="userId">
							</td>
						</tr>
						<tr>
							<td>
								密码	
							</td>
							<td>
								<input class="input" style="height:45px; border-radius:5px;font-size:25px;"  type="password" name="password" >
							</td>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="status" value="entry"/>
							</td>
							<td>
								
								<input class="submit btn" type="submit" name="submit" value="登录"  style="width:250px;height:40px;  margin:10px;background:#ff4401">
							</td>
						</tr>
						
					</table>
					</form>
					<a href="login.jsp" style="float:right; padding-right:80px; color:#ff4401;">免费注册</a>
			</div>
	</div>
  </body>
</html>
