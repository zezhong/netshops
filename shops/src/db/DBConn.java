package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
private String url; // 存储SQLSever连接路径
    
	private String serverName;
    
	private String databaseName; 
    
	private String userName; 
    
	private String password;
	
	private String portNumber;


	
	public DBConn(){
		
		url = "jdbc:mysql://";
		
		serverName = "localhost";
		
        databaseName = "shops";
        
        userName = "root";
        
        password = "123456";
        portNumber = "3306";
		
	}
	

	
	private String getConnectionUrl() {
        
		return url + serverName + ":" +portNumber + "/" + databaseName + ";";
		
    }
	

	
	public  Connection getConnection() {
		
		Connection con=null;
		
        try {
            	Class.forName("com.mysql.jdbc.Driver");     
            	
            	con = DriverManager.getConnection("jdbc:mysql://localhost/shops?characterEncoding=utf-8&&useSSL=true",userName,password);
            	
        } catch (Exception e) {
            
        	e.printStackTrace();
            
        	System.out.println("getConnection()内部跟踪错误:"+ e.getMessage());
        }
        
        return con;
        
	}
	
}
