<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String ename = request.getParameter("eventName");
    String category = request.getParameter("userType");
    String desc = request.getParameter("description");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    String session_username = (String)session.getAttribute("username");

     String db = "easyticket";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "mgnmgn";
        try 
        {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyticket?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
            int rows1 = stmt.executeUpdate("insert into easyticket.event values('"+eid+"','"+ename+"','"+category+"','"+desc+"','"+date+" "+time+"')");
            int rows2 = stmt.executeUpdate("insert into easyticket.createevent values('"+session_username+"',"+eid+")");
            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
