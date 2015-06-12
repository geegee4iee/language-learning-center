package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ConnectionFactory {

	private static SessionFactory fac = null;
	
	private ConnectionFactory(){
		
	}
	
	@SuppressWarnings("deprecation")
	public static SessionFactory getSessionFactory(){
		if(fac == null){
			fac = new Configuration().configure().buildSessionFactory();
		}
		
		return fac;
	}
	
	public static Connection getConnection() {
		Connection conn = null;

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Properties pro = new Properties();
			pro.put("user", "sa");
			pro.put("password", "123456");

			conn = DriverManager.getConnection("jdbc:sqlserver://"
					+ "localhost:1433;databaseName=TrungTamNgoaiNguENVN", pro);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return conn;
	}
}
