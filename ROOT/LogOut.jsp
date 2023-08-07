<%@ page import="java.sql.*"%>
    <% 
    session.removeAttribute("username");  
    response.sendRedirect("http://localhost:8080/FirstPage.html");
    %>
  
