package com.playerDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/insert")
public class InsertionServerlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	PlayerObject player = new PlayerObject();
		
	String name = request.getParameter("name");
	String position = request.getParameter("position");
	int age = Integer.parseInt(request.getParameter("age"));
	
	
	player.setAge(age);
	player.setName(name);
	player.setPosition(position)
	;
	RequestDispatcher dispatcher = null;
	Connection connection = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");		
			connection = ConnectionProvider.getCon();

				PreparedStatement pst = connection
						.prepareStatement("insert into player (name, position, age) values (?,?,?)");
		
				pst.setString(1, player.getName());
				pst.setString(2, player.getPosition());
				pst.setInt(3, player.getAge());

			
			System.out.println(pst);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("insert");
			
			if(rowCount > 0) {
			//	request.setAttribute("status", "success");
				response.sendRedirect("sucess.jsp");

			}
			else {
				HttpSession session = request.getSession();

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
	
	public InsertionServerlet() {
		// TODO Auto-generated constructor stub
	}

}
