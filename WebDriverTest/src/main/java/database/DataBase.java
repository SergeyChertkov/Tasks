package database;

import java.sql.*;

/**
 * Created by Sergii_Chertkov on 2/17/2016.
 */
public class DataBase {
    private static final String DB_PATH = Propert.get("db_folder");
    private static final String DB_DRIVER = "org.h2.Driver";
    private static final String DB_CONNECTION = "jdbc:h2:" + DB_PATH + "/test;IGNORECASE=FALSE";
    private static final String DB_USER = "";
    private static final String DB_PASSWORD = "";
    private static Connection connection = null;
    private static boolean print = false;

    public static void setPrint(boolean p){print = p;}

    public static void connect(){
        if(DataBase.connection == null){
            DataBase.connection = getDBConnection();
        }
    }

    public static void close() {
        try {
            DataBase.connection.close();
            DataBase.connection = null;
        } catch (SQLException e) {
            if(print)e.printStackTrace();
        }
    }

    public static boolean execute (String query) {
        boolean result = false;
        PreparedStatement stmt = null;
        try {
            if(print)System.out.println("started: "+query);
            stmt = connection.prepareStatement(query);
            stmt.executeUpdate();
            result = true;
            if(print)System.out.println("complete: "+query);
        } catch (SQLException e) {
            if(print)e.printStackTrace();
        } catch (Exception e) {
            if(print)e.printStackTrace();
        } finally {
            return result;
        }
    }

    public static ResultSet select (String query) {
        ResultSet result = null;
        PreparedStatement stmt = null;
        try {
            if(print)System.out.println("started: "+query);
            stmt = connection.prepareStatement(query);
            result = stmt.executeQuery();
            if(print)System.out.println("complete: "+query);
        } catch (SQLException e) {
            if(print)e.printStackTrace();
        } catch (Exception e) {
            if(print)e.printStackTrace();
        } finally {
            return result;
        }
    }

    private static Connection getDBConnection() {
        Connection dbConnection = null;
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            if(print)e.printStackTrace();
        }
        try {
            dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
                    DB_PASSWORD);
            return dbConnection;
        } catch (SQLException e) {
            if(print)e.printStackTrace();
        }
        return dbConnection;
    }

}
