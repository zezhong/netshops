package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import proj.Product;
import proj.ShopingCart;
import db.DBConn;
		 
public class ProductImpl {
	public String order;
	public ArrayList<Product> search(String productName){
		Connection con = null;
		ArrayList<Product> products = new ArrayList<Product>();
		PreparedStatement pre = null;
		ResultSet rs=null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("select * from product where productName like ?");
			order = String.valueOf((int)((Math.random()*1000000)));
			pre.setString(1,"%"+productName+"%");
			rs = pre.executeQuery();
			
			while(rs.next()){
				Product product = new Product();
				product.setProductId(rs.getString("productId"));
				product.setProductName(rs.getString("productName"));
				product.setQty(rs.getInt("qty"));
				product.setMarketPrice(rs.getInt("marketPrice"));
				products.add(product);
			}
			return products;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public void update(String buyqty,String orderId){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("update orderdetail set qty =? where orderId=?");
			pre.setString(1,buyqty);
			pre.setString(2,orderId);
			pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public Product check(String productId){
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs=null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("select * from product where productId=?");
			order = String.valueOf((int)((Math.random()*1000000)));
			pre.setString(1,productId);
			rs = pre.executeQuery();
			
			while(rs.next()){
				Product product = new Product();
				product.setProductId(rs.getString("productId"));
				product.setProductName(rs.getString("productName"));
				product.setQty(rs.getInt("qty"));
				product.setMarketPrice(rs.getInt("marketPrice"));
				System.out.println("product");
				return product;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public String purchase(String userId,String productId,String productPrice){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("insert into orders values(?,?,?,?)");
			order = String.valueOf((int)((Math.random()*100000)));
			pre.setString(1,order);
			pre.setString(2,userId);
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
			Date date = new Date();
			String time = sdf.format(date);
			pre.setString(3,time);
			pre.setString(4,productPrice);
			pre.execute();
			purchase2(userId, productId,productPrice);
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
		
	}
	public void purchase2(String userId,String productId,String productPrice){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("insert into orderDetail values(?,?,?,?)");
			pre.setString(1,productId);
			pre.setString(2,order);
			pre.setInt(3,1);
			pre.setString(4,productPrice);
			
			
			pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	public void deleteOrder(String orderId){
		
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("delete from orders where orderId=? ");
			pre.setString(1,orderId);
			pre.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<ShopingCart> queryProduct(String userId){
			ArrayList<ShopingCart> products = new ArrayList<ShopingCart>();
			Connection con = null;
			PreparedStatement pre = null;
			ResultSet rs=null;
			DBConn conns = new DBConn();
			con = conns.getConnection();
			try {
				pre=con.prepareStatement("select orders.orderId,userId,productName,orderDate,orderdetail.marketPrice " +
						"from product,orders,orderdetail where product.productId=orderdetail.productId and orders.orderId=orderdetail.orderId" +
						" and  orders.userId =?");
				pre.setString(1,userId);
				rs=pre.executeQuery();

				while(rs.next()){
					
					ShopingCart cart = new ShopingCart();
					cart.setOrderId(rs.getString("orderId"));
					cart.setUserId(rs.getString("userId"));
					cart.setProductName(rs.getString("productName"));
					cart.setOrderDate(rs.getDate("orderDate"));
					cart.setMarketPrice(rs.getInt("marketPrice"));
					products.add(cart);
				}
				return products;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
				return null;
		}
		
	
	
	
	
		
	}
	
	
	

