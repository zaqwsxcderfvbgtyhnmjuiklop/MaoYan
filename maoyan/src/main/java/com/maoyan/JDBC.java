package com.maoyan;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC {
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/maoyan?serverTimezone=GMT";
    private static String user = "root";
    private static String pwd = "1164193177qq";

    public static Connection getConnection() throws Exception {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, user, pwd);
        return connection;
    }
}
