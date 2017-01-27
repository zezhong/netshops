package impl;



import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import proj.Orders;
import proj.Product;
import proj.User;
import proj.admin;
import proj.message;




import db.DBConn;



public class adminDao {
	

	
	public List<admin> query() throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		List<admin> list= new ArrayList<admin>();
		
		String sql="select * from admin";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next())
		{
			admin ad=new admin();
			ad.setAdminID(rs.getString(1));
			ad.setName(rs.getString(2));
			ad.setPassword(rs.getString(3));
			ad.setGender(rs.getString(4));
			ad.setPhone(rs.getString(5));
		
			list.add(ad);
			
		}
		//System.out.println(list.size()+"几合一的大小");
		return list;
		

	}


	public List<User> selectUser() throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		List<User> list1= new ArrayList<User>();
		
		String sql="select * from user";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next())
		{
			User ad=new User();
			ad.setUserId(rs.getString(1));
			ad.setName(rs.getString(2));
			ad.setPassword(rs.getString(3));
			ad.setGender(rs.getString(4));
			ad.setPhone(rs.getString(5));
		
		
			list1.add(ad);
			
		}
	//	System.out.println(list1.size()+"几合二的大小");
		return list1;
		
	}

	public List<Product> selectProduct() throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		List<Product> list2= new ArrayList<Product>();
		
		String sql="select * from product";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next())
		{
			Product ad=new Product();
			ad.setProductId(rs.getString(1));
			ad.setCataId(rs.getInt(2));
			ad.setProductName(rs.getString(3));
			ad.setCostPrice(rs.getInt(4));
			ad.setMarketPrice(rs.getInt(5));
			ad.setQty(rs.getInt(6));
			ad.setDecribe(rs.getString(7));
		
		
			list2.add(ad);
			
		}
		
		return list2;
		
	}
	
	
	
	
	public void  deleteUsert( String id) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="delete from user where userId=?";
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setString(1,id);
		ptmt.execute();
		//System.out.print("执行了delete方法");

	}
	
	
	
	public void  updateProduct(Product product) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="insert into product values(?,?,?,?,?,?,?)";
		
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setString(1,product.getProductId());
		ptmt.setInt(2,product.getCataId());
		ptmt.setString(3,product.getProductName());
		ptmt.setDouble(4,product.getCostPrice());
		ptmt.setDouble(5,product.getMarketPrice());
		ptmt.setInt(6,product.getQty());
		ptmt.setString(7,product.getDecribe());
		
		ptmt.execute();
		System.out.println("成功执行添加商品的方法");
		
	}
	
	

	
	
	
	
	public void  deleteProduct( String ProductId) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="delete from Product where productId=?";
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setString(1,ProductId);
		ptmt.execute();
		

	}
	
	
	
	public void  updateAlterProduct(Product product) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="update  product set cataID=?, productName=?," +
				"costPrice=?, marketPrice=?, qty=? ,decribe=? where productId=?";
		
		PreparedStatement ptmt =conn.prepareStatement(sql);
		//ptmt.setString(1,product.getProductId());
		ptmt.setInt(1,product.getCataId());
		ptmt.setString(2,product.getProductName());
		ptmt.setDouble(3,product.getCostPrice());
		ptmt.setDouble(4,product.getMarketPrice());
		ptmt.setInt(5,product.getQty());
		ptmt.setString(6,product.getDecribe());
		ptmt.setString(7,product.getProductId());
		
		
		ptmt.executeUpdate();
		System.out.println("成功执行修改商品的方法");
		
	}
	
	
	
	
	
	
	
	public List<Orders> selectOrder() throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		List<Orders> list1= new ArrayList<Orders>();
		
		String sql="select * from orders";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next())
		{
			Orders ad=new Orders();
			ad.setOrderId(Integer.valueOf(rs.getString(1)));
			ad.setUserId(Integer.valueOf(rs.getString(2)));
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String date=sdf.format(rs.getDate(3));
			
			ad.setOrderDate(date);
			ad.setTotalPrice(Integer.valueOf(rs.getString(4)));
		
		
			list1.add(ad);
			
		}
		return list1;
	}
	
	
	
	
	public void  insertOrders(Orders order) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="insert into Orders values(?,?,?,?)";
		
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setInt(1,order.getOrderId());
		ptmt.setInt(2,order.getUserId());
		
		
		
		ptmt.setString(3,order.getOrderDate());
		
		ptmt.setInt(4, order.getTotalPrice());
		
		
		ptmt.execute();
		System.out.println("成功执行添加订单的方法");
		
	}
	
	public void  deleteOrders( String orderId) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="delete from orders where orderId=?";
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setString(1,orderId);
		ptmt.execute();
		

	}
	
	
	
	public void  updateOrders(Orders order) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="update Orders set userId=?,orderDate=?,totalPrice=? where orderId=?";
		
		PreparedStatement ptmt =conn.prepareStatement(sql);
		
		ptmt.setInt(1,order.getUserId());
		ptmt.setString(2, order.getOrderDate());
		ptmt.setInt(3, order.getTotalPrice());
		ptmt.setString(4,String.valueOf(order.getOrderId()));
		
		
		ptmt.execute();
		System.out.println("成功执行修改订单的方法");
		
	}
	

	public List<message> selectMessage() throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		List<message> list1= new ArrayList<message>();
		
		String sql="select * from message";
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		while(rs.next())
		{
			message ad=new message();
			ad.setTitle(rs.getString(1));
			ad.setUserId(rs.getString(2));
			ad.setTime(rs.getString(3));
			ad.setContent(rs.getString(4));
			ad.setMail(rs.getString(5));
		
		
			list1.add(ad);
			
		}
	//	System.out.println(list1.size()+"几合二的大小");
		return list1;
		
	}
	
	
	
	
	public void  insertMessage(message message1) throws SQLException
	{
		DBConn DB = new DBConn();
		Connection conn=DB.getConnection();
		
		
		String sql="insert into message (message.tiltle ,userId,time,content)values(?,?,?,?)";
		
		PreparedStatement ptmt =conn.prepareStatement(sql);
		ptmt.setString(1,message1.getTitle());
		ptmt.setString(2,message1.getUserId());
		
		
		
		ptmt.setString(3,message1.getTime());
		
		ptmt.setString(4, message1.getContent());
		
		
		ptmt.execute();
		System.out.println("成功执行添加订单的方法");
		
	}
	
	
}
