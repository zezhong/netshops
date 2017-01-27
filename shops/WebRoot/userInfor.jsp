<%@ page language="java" import="java.util.*,impl.UserImpl,proj.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userInfor.jsp' starting page</title>
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
		
	#infor{
			width:600px;
			height:400px;
			background:#ff4401;
			margin:0 auto;
			
	}
	#infor li{
		margin-left:30px;
		width:100px;
		height:30px;
		
	}
	#infor a{
		color:#fff;
		font-size:16px;
		font-family: tahoma,arial,'\5fae\8f6f\96c5\9ed1','Hiragino Sans GB',sans-serif!important;
		text-decoration: none;
		line-height:30px;
	}
	
	</style>
  </head>
  
  <body>
		<%
			String userId = request.getParameter("userId");
			UserImpl userimpl = new UserImpl();
			User user = userimpl.queryInfor(userId);
			session.setAttribute("userId",userId);
			session.setAttribute("name",user.getName());
			session.setAttribute("password",user.getPassword());
			session.setAttribute("phone",user.getPhone());
		 %>
		 <div id="container">
        <div id="header">
            <div id="top">
                <ul>
                    <li><a href="index.jsp">主页</a></li>
                    <li><a class="top" href="userInfor.jsp?userId=<%=user.getUserId() %>">我的信息</a></li>
                    <li><a class="top" href="goodsList.jsp">我的订单</a></li>
                     <li><a class="top" href="adminlogin.jsp">我是卖家</a></li>
                </ul>
            </div>
        </div>
        <div id="infor">
        	<ul>
        		<li><a href="update.jsp">修改信息</a><br/></li>
        		<li><a href="goodsList.jsp">我的订单</a></li>
        		<li><a href="index.html">退出账号</a></li>
        	</ul>
        </div>
	</div>
  </body>
</html>
