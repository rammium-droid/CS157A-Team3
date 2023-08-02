package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String emailAddress= request.getParameter("emailAddress");
		String password = request.getParameter("password");
		// The two lines above take the email address and password entered by the user
		try {
			java.sql.Connection con; 
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aproject?autoReconnect=true&useSSL=false", "root", "root");
	        Statement stmt = con.createStatement();
	        // The four lines above establish a connection to the MySQL database
	        ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE email = '"+emailAddress+"' AND password = '"+password+"'");
	        // The line above executes a SQL command to see if the user entered the right credentials
	        HttpSession session = request.getSession();
	        if(rs.next()) {
	        	String name = rs.getString(1);
	        	session.setAttribute("name", name);
	        	session.setAttribute("emailAddress", emailAddress);
	        	String userType = rs.getString(4);
	        	session.setAttribute("userType", userType);
	        	response.sendRedirect("./ProfileServlet");
	        	/* This if block sets the attributes of the session that is created if the credentials entered are recognized, then
	        	logs the user into their account with the redirect */
	        }
	        else {
	        	out.println("Incorrect email or password"); /* If the credentials entered are not recognized, redirect the user back to
	        	the login page */
	        }
	        rs.close();
	        stmt.close();
	        con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
