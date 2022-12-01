package com.playerDB;
import java.sql.*;


public class playerDAO {

	static Connection conn;
	static PreparedStatement pst;
	
	public static int insertPlayer(PlayerObject player) {
		int status = 0;
		try {
			conn = ConnectionProvider.getCon();
			pst = conn.prepareStatement("insert into player (name, position, age) values (?,?,?)");
			pst.setString(1, player.getName());
			pst.setString(2, player.getPosition());
			pst.setInt(3, player.getAge());
			status = pst.executeUpdate();
			conn.close();
			
		}catch(Exception e) {
			System.out.println(e);
			
		}
		
		return status;
		
		
	}
	
	
	
	public playerDAO() {
		// TODO Auto-generated constructor stub
	}

}
