package bbs;

import java.sql.*;
import java.util.*;

public class BbsDAO{
	Connection conn = null;
	ResultSet rs = null;
        /* Oracle 연결정보
        String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
        String jdbc_url = "jdbc:oracle:thin:@220.68.14.7:1521";
        */

        /* MySQL 연결정보 */

        String jdbc_driver = "com.mysql.jdbc.Driver";
        String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb";
//      String jdbc_driver = "com.mysql.cj.jdbc.Driver";
//      String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb?serverTimezone=UTC";

/*        // DB연결 메서드
        int connect() {
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
	public BbsDAO(){
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"jspbook", "1234");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
			

	public String getDate(){
//		connect();
		String SQL = "select now()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{// disconnect();}
		}return ""; //DB ERROR
	}


        public int getNext(){
//                connect();
                String SQL = "select bbsID from bbs ORDER BY bbsID DESC";
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        rs = pstmt.executeQuery();
                        if(rs.next()){
                                return rs.getInt(1)+1;
                        }
			return 1; //first bbs
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return -1; //DB ERROR
        }

	public int write(String bbsTitle, String userID, String bbsContent){
//                connect();
		
                String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)";
		
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
                        pstmt.setString(2, bbsTitle);
                        pstmt.setString(3, userID);
                        pstmt.setString(4, getDate());
                        pstmt.setString(5, bbsContent);
                        pstmt.setInt(6, 1);
                        return pstmt.executeUpdate();
			
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
		}
                return -1; //DB ERROR
	}

	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
                        rs = pstmt.executeQuery();
                        while(rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
                                bbs.setBbsTitle(rs.getString(2));
                                bbs.setUserID(rs.getString(3));
                                bbs.setBbsDate(rs.getString(4));
                                bbs.setBbsContent(rs.getString(5));
                                bbs.setBbsAvailable(rs.getInt(6));
                                list.add(bbs);
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return list;
	}

	public boolean nextPage(int pageNumber){
                String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1";;
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
                        rs = pstmt.executeQuery();
	                if(rs.next()){
				return true;
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return false; 
	}
	
	public Bbs getBbs(int bbsID){
		String SQL = "select * from bbs where bbsID = ?";
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setInt(1,bbsID);
                        rs = pstmt.executeQuery();
                        if(rs.next()){
                                
                                Bbs bbs = new Bbs();
                                bbs.setBbsID(rs.getInt(1));
                                bbs.setBbsTitle(rs.getString(2));
                                bbs.setUserID(rs.getString(3));
                                bbs.setBbsDate(rs.getString(4));
                                bbs.setBbsContent(rs.getString(5));
                                bbs.setBbsAvailable(rs.getInt(6));
                                return bbs;
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return null;
        }
	
	public int update(int bbsID, String bbsTitle, String bbsContent){
                String SQL = "update bbs set bbsTitle = ?, bbsContent = ? where bbsID = ?";
                
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL); 
                        pstmt.setString(1, bbsTitle);
                        pstmt.setString(2, bbsContent);
                        pstmt.setInt(3, bbsID);
                        
                        return pstmt.executeUpdate();
                        
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
        }
	
	public int delete(int bbsID){
                String SQL = "update bbs set bbsAvailable = 0 where bbsID = ?";

                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setInt(1, bbsID);

                        return pstmt.executeUpdate();

                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
	}


}
