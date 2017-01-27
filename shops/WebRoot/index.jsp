<%@ page language="java" import="java.util.*,proj.User,proj.ShopingCart" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>你的专属商城</title>
    
	<link rel="stylesheet" type="text/css" href="./images/reset.css">
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
        width:710px;
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
    #second{
        height: 40px;
        margin:30px;
    }
    #search{
        width: 700px;
        margin: 0 auto;
        background: #F40;
    }
    .input{
        border:5px solid #F40;
        width: 510px;
        height: 40px;
    }
    .btnn{
        color: white;
        font-size: 16px;
        background: #F40;
        width: 173px;
        height: 50px;
    }
    #third{
        border-top:1px solid #F40;
        height: 600px;
    }
    #content{
        margin: 5px auto;
        width: 1024px;
        height: 800px;
    }
    .goods{
        width: 310px;
        height: 350px;
        border:2px solid #F40;
        margin: 5px;
        float: left;
    }
    .images{
        width: 280px;
        height: 280px;
        margin: 0 auto;
    }
	
    </style>


  </head>
  
  <body>
		<div id="container">
		  <%
		  		User user = (User)session.getAttribute("user");
		  		
		  		if(user==null){		  			
		  			response.sendRedirect("index.html");
		  		}
		  		else{
		   %>
		
        <div id="header">
            <div id="top">
                <ul>
                    <li><a class="top" href="userInfor.jsp?userId=<%=user.getUserId() %>" ><%=user.getUserId() %></a></li>
                    <li><a href="index.jsp" style="color:#F40 ">主页</a></li>
                    <li><a class="top" href="userInfor.jsp?userId=<%=user.getUserId() %>">我的信息</a></li>
                    <li><a class="top" href="goodsList.jsp">我的订单</a></li>
                    <li><a class="top" href="adminlogin.jsp">我是卖家</a></li>
                    <li><a class="top" href="insertMessage.jsp">发表评论</a></li>
                </ul>
            </div>
        </div>
        
			<div id="main">
				<%
				ShopingCart cart = new ShopingCart();
				 String userId=  user.getUserId();
				 session.setAttribute("userId",userId);
			 %>
             <div id="second">
                <div id="search">
                     <form action="/shops/ProductSer" >
                        <input type="text" name="productName" class="input">
                        <input type="submit" name="submit" value="搜 索"class="btnn">
                         <input type="hidden" name="status" value="search"/>
                    </form>
                </div>
            </div>
            <div id="third">
                    <div id="content">
                            <div class="goods">
                                <a href="purchase.jsp?userId=<%=userId%>&productId=cup-01&status=purchase&productPrice=100">
                                    <img src="images/cup.png" class="images">
                                    <p>时尚水杯</p>
                                </a>
                            </div>
                            <div class="goods">
                            <a href="purchase.jsp?userId=<%=userId%>&productId=tea-01&status=purchase&productPrice=100">
                                <img src="images/teas.png" class="images">
                                <p>养生茶叶，信阳毛尖</p>
                            </a>
                            </div>
                            <div class="goods">
                            <a href="purchase.jsp?userId=<%=userId%>&productId=glasses-01&status=purchase&productPrice=100">
                                <img src="images/glasses.png" class="images">
                                <p>装饰眼镜</p>
                            </a>
                            </div>
                            <div class="goods">
                                <a href="purchase.jsp?userId=<%=userId%>&productId=book-01&status=purchase&productPrice=16">
                                    <img src="images/books.png" class="images">
                                    <p>哲理人生，感悟生活</p>
                                </a>
                            </div>
                            <div class="goods">
                                <a href="purchase.jsp?userId=<%=userId%>&productId=computer&status=purchase&productPrice=6999">
                                    <img src="images/computer.png" class="images">
                                    <p>性价比高，游戏专享</p>
                                </a>
                            </div>
                            <div class="goods">
                                <a href="purchase.jsp?userId=<%=userId%>&productId=baggage&status=purchase&productPrice=13290">
                                    <img src="images/bag.png" class="images">
                                    <p>可爱包包</p>
                                </a>
                            </div>
                    </div>
            </div>

        </div>
				
				
		<%} %>		
				
	</div>
				
			

  </body>
</html>
