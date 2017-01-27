package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
private String url; // �洢SQLSever����·��
    
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
            
        	System.out.println("getConnection()�ڲ����ٴ���:"+ e.getMessage());
        }
        
        return con;
        
	}
	
}
