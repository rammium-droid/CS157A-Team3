<%@ page import="java.sql.*"%>

<html lang="en" style="background-color:aquamarine">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Your Tickets Page</title>
</head>
  <body>
    <h1>YOUR TICKETS</h1>
  </body>
</html>

    <% 
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
            
            ResultSet rs = stmt.executeQuery("SELECT event.eventName, event.location, event.date_and_time, hastickets.eventID, tickets FROM easyticket.hastickets,easyticket.event where hastickets.userID = '"+session_username+"' AND easyticket.hastickets.eventID = easyticket.event.eventID");
            int i = 1;
            while(rs.next()) 
            {
                String eName = rs.getString(1);
                String location = rs.getString(2);
                String datentime = rs.getString(3);
                String eid = rs.getString(4);
                String tickets = rs.getString(5);

                out.println(i+". "+eName+" ("+eid+") - "+location+"   at "+datentime+"   : "+ tickets+" tickets");
                out.println("<BR>");
                i++;
            }

            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>

    <br>
    <br>
    <br>

    <form action="BuyerHomePage.html" method="POST">
        <input type="submit" value="Go Back">
    </form>
  
