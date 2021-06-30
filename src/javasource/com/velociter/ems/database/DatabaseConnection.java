package com.velociter.ems.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection connection = null;

	public static Connection getDBConnection() {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "VelociterHBM", "velociter");

		} catch (ClassNotFoundException e) {
			System.err.println("Class Not Found ! Plases cheack");

		} catch (SQLException sqle) {
			System.err.println("have some Database issues ! please Check");
		}
		return connection;
	}

}
