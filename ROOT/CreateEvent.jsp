<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String ename = request.getParameter("eventName");
    String category = request.getParameter("userType");
    String desc = request.getParameter("description");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

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
            int rows = stmt.executeUpdate("insert into easyticket.event values('"+eid+"','"+ename+"','"+category+"','"+desc+"','"+date+" "+time+"')");
            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
