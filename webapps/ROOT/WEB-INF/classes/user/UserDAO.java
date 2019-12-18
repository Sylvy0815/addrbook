package user;

import java.sql.*;
import java.util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
/*
	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs;

	public UserDAO(){
		try{
			String dbURL = "jdbc:mysql://127.0.0.1:3306/jspdb";
			String dbID = "jspbook";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
*/

	Connection conn = null;
//        PreparedStatement pstmt = null;
	ResultSet rs = null;

        /* Oracle 연결정보
        String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
        String jdbc_url = "jdbc:oracle:thin:@220.68.14.7:1521";
        */

        /* MySQL 연결정보 */
	
        String jdbc_driver = "com.mysql.jdbc.Driver";
        String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb";
//	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
//	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb?serverTimezone=UTC";

        // DB연결 메서드
/*        int connect() {
                try {
                        Class.forName(jdbc_driver);

                        conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
			return 1;
                } catch (Exception e) {
                        e.printStackTrace();
			return 0;
                }
        }

        void disconnect() {
                if(pstmt != null) {
                        try {
                                pstmt.close();
                        } catch (SQLException e) {
                                e.printStackTrace();
                        }
                }
                if(conn != null) {
                        try {
                                conn.close();
                        } catch (SQLException e) {
                                e.printStackTrace();
                        }
                }
        }*/
        public UserDAO(){
                try {
                        Class.forName(jdbc_driver);
                        conn = DriverManager.getConnection(jdbc_url,"jspbook", "1234");
                }catch(Exception e){
                        e.printStackTrace();
                }
        }


	public int login(String userID, String userPassword){	//sql injection hacking
		
		String SQL = "select userPassword from USER where userID=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1; // login success
				}
				else
					return 0; // pass word not equals
			}
			return -1; //no ID
		} catch (Exception e){
			e.printStackTrace();
		}
		finally{}
		return -2; // DB error
	}

	public int join(User user){
//		connect();
		String SQL = "insert into USER values (?, ?, ?, ?, ?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
                        pstmt.setString(2, user.getUserPassword());
                        pstmt.setString(3, user.getUserName());
                        pstmt.setString(4, user.getUserGender());
                        pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;	// DB ERROR
	}

	public User getUser(String userID){
		String SQL = "select * from USER where userID = ?";
                try{    
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setString(1,userID);
                        rs = pstmt.executeQuery();
                        if(rs.next()){
                                
                                User user = new User();
                                user.setUserID(rs.getString(1));
                                user.setUserPassword(rs.getString(2));
                                user.setUserName(rs.getString(3));
                                user.setUserGender(rs.getString(4));
                                user.setUserEmail(rs.getString(5));
                                
                                return user;
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return null;
        }

        public int update(User user){
                String SQL = "update USER set userPassword = ?, userName = ?, userGender = ?, userEmail = ? where userID = ?";

                try{    
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setString(1, user.getUserPassword());
                        pstmt.setString(2, user.getUserName());
                        pstmt.setString(3, user.getUserGender());
                        pstmt.setString(4, user.getUserEmail());
                        pstmt.setString(5, user.getUserID());
			return pstmt.executeUpdate();
                        
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
        }


        public int delete(String userID){
                String SQL = "delete from USER where userID = ?";

                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setString(1, userID);

                        return pstmt.executeUpdate();

                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
        }

}
		
		
