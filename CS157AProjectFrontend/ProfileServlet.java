package com.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		if(session != null) { // This if statement makes it so the user page is accessible only if the user is logged in
			String name = (String) session.getAttribute("name");
			String emailAddress = (String) session.getAttribute("emailAddress");
			String userType = (String) session.getAttribute("userType");
			out.println("<body style='background-color:aquamarine;'>");
			out.println("<h1 align='center'>My Profile</h1>");
    		out.println("<b>Name: </b>'"+name+"'<br>");
    		out.println("<b>Email: </b>'"+emailAddress+"'<br>");
    		/* The seven lines above print out the first name and email address of the user, obtained from the database by the query
    		done in LoginServlet */
        	if(userType.equals("Event Planner")) { /* This if statement takes the userType, also obtained from the LoginServlet query,
        	and makes it so the user can only create an event if they are an event planner */
        		out.println("<a href='createevent.html'>Create an Event</a>");
        	}
        	out.println("<a href='./LogoutServlet'>Log Out</a>");
		}
		else {
			response.sendRedirect("login.html"); /* If the user tries to access their profile while they are logged out, redirect them
			to the login page */
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
