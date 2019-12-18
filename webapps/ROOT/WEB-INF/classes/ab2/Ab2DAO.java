package ab2;

import java.sql.*;
import java.util.*;

public class Ab2DAO{
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
	public Ab2DAO(){
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"jspbook", "1234");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
			
/*
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
*/

        public int getNext(){
//                connect();
                String SQL = "select ab2ID from ab2 ORDER BY ab2ID DESC";
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

	public int write(String ab2Name, String userID, String ab2Tel, String ab2Birth, String ab2Com, String ab2Memo){
//                connect();
		
                String SQL = "insert into ab2 values (?, ?, ?, ?, ?, ?, ?, ?)";
		
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
                        pstmt.setString(2, ab2Name);
                        pstmt.setString(3, ab2Tel);
                        pstmt.setString(4, ab2Birth);
                        pstmt.setString(5, ab2Com);
                        pstmt.setString(6, ab2Memo);
                        pstmt.setString(7, userID);
                        pstmt.setInt(8, 1);
                        return pstmt.executeUpdate();
			
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
		}
                return -1; //DB ERROR
	}

	public ArrayList<Ab2> getList(int pageNumber){
		String SQL = "select * from ab2 where ab2ID < ? and ab2Available = 1 order by ab2ID desc limit 10";
		ArrayList<Ab2> list = new ArrayList<Ab2>();
		try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
                        rs = pstmt.executeQuery();
                        while(rs.next()){
				Ab2 ab2 = new Ab2();
				ab2.setAb2ID(rs.getInt(1));
                                ab2.setAb2Name(rs.getString(2));
                                ab2.setAb2Tel(rs.getString(3));
                                ab2.setAb2Birth(rs.getString(4));
                                ab2.setAb2Com(rs.getString(5));
                                ab2.setAb2Memo(rs.getString(6));
                                ab2.setUserID(rs.getString(7));
                                ab2.setAb2Available(rs.getInt(8));
                                list.add(ab2);
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return list;
	}

	public boolean nextPage(int pageNumber){
                String SQL = "select * from ab2 where ab2ID < ? and ab2Available = 1";;
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
	
	public Ab2 getAb2(int ab2ID){
		String SQL = "select * from ab2 where ab2ID = ?";
                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setInt(1,ab2ID);
                        rs = pstmt.executeQuery();
                        if(rs.next()){
                                
                                Ab2 ab2 = new Ab2();
                                ab2.setAb2ID(rs.getInt(1));
                                ab2.setAb2Name(rs.getString(2));
                                ab2.setAb2Tel(rs.getString(3));
                                ab2.setAb2Birth(rs.getString(4));
                                ab2.setAb2Com(rs.getString(5));
                                ab2.setAb2Memo(rs.getString(6));
                                ab2.setUserID(rs.getString(7));
                                ab2.setAb2Available(rs.getInt(8));
                                return ab2;
                        }
                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }return null;
        }
//                connect();
		public int update(int ab2ID, String ab2Name, String ab2Tel, String ab2Birth, String ab2Com, String ab2Memo){
                String SQL = "update ab2 set ab2Name = ?, ab2Tel = ?, ab2Birth = ?, ab2Com = ?, ab2Memo = ? where ab2ID = ?";

                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setString(1, ab2Name);
                        pstmt.setString(2, ab2Tel);
                        pstmt.setString(3, ab2Birth);
                        pstmt.setString(4, ab2Com);
                        pstmt.setString(5, ab2Memo);
			pstmt.setInt(6, ab2ID);
                        return pstmt.executeUpdate();

                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
        }


	
	public int delete(int ab2ID){
                String SQL = "update ab2 set ab2Available = 0 where ab2ID = ?";

                try{
                        PreparedStatement pstmt = conn.prepareStatement(SQL);
                        pstmt.setInt(1, ab2ID);

                        return pstmt.executeUpdate();

                } catch(Exception e){
                        e.printStackTrace();
                } finally{// disconnect();}
                }
                return -1; //DB ERROR
	}


}
