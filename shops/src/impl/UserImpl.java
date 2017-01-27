package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.omg.CORBA.Request;

import proj.User;


import db.DBConn;

public class UserImpl {
	
	public void update(String name,String password,String phone,String userId){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			System.out.println("进入更新页面");
			pre=con.prepareStatement("update user set name=?,password=?,phone=? where userId=?");
			pre.setString(1,  name);
			pre.setString(2,  password);
			pre.setString(3,  phone);
			pre.setString(4,userId);
			pre.executeUpdate();
		
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
	
	
	public void registe(String userId,String name,String password,String gender,String phone){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("insert into user values(?,?,?,?,?)");
			pre.setString(1,  userId);
			pre.setString(2,  name);
			pre.setString(3,  password);
			pre.setString(4,  gender);
			pre.setString(5,  phone);
			pre.executeUpdate();
		
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
	public boolean queryUser(String userId,String password){
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs=null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM user WHERE userId = ?");
			pre.setString(1,userId);
			rs=pre.executeQuery();

			while(rs.next()){
				User user = new User();
				user.setUserId(rs.getString("userId"));
				user.setPassword(rs.getString("password"));
				if(user.getPassword().equals(password)){
					System.out.println(user.getUserId());
					System.out.println(user.getPassword());
					return true;
				}
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
			return false;
	}
	
	public User queryInfor(String userId){
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs=null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM user WHERE userId = ?");
			pre.setString(1,userId);
			rs=pre.executeQuery();

			while(rs.next()){
				
				User user = new User();
				user.setUserId(rs.getString("userId"));
				user.setGender(rs.getString("gender"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				return user;
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
}
