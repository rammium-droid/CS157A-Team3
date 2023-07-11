<%@ page import="java.sql.*"%>
<html style="background-color:aquamarine;>
  <head>
    <title>EasyTicket Events</title>
    </head>
    <meta charset="UTF-8">
  <body align="center">
  <h1 align="center">EasyTicket Events</h1>
    <table align="center" border="1">
      <tr>
        <td>Event Name</td>
        <td>Description</td>
        <td>Location</td>
        <td>Date and Time</td>
   </tr>
    <%
     String db = "easyTicket";
        String user;
          user = "root";
        String password = "Teaotic757!";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyTicket?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name,description,location,DateAndTime FROM Event");
            while (rs.next()) {
                %><button name="event1">View Details</button><%
                out.println("  " + rs.getString(1) + "  -  " + rs.getString(2) + "  |  " + rs.getString(3) + "  |  " +
                            rs.getString(4) + "<br/>  <br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
  </body>
</html>
