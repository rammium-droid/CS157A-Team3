<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String answer = request.getParameter("userType");

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
            
            if(answer.equals("yes"))
            {
                int rs = stmt.executeUpdate("DELETE FROM easyticket.event where eventID = "+eid);
                response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
            }
            else
            {
                response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
            }
            stmt.close();
            con.close();

        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
