<%@ page import="java.sql.*"%>

<html lang="en" style="background-color:aquamarine">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Your Events Page</title>
</head>
  <body>
    <h1>YOUR EVENTS</h1>
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
            
            ResultSet rs = stmt.executeQuery("SELECT createevent.EventID,event.eventName FROM easyticket.createevent,easyticket.event where EventPlannerUserID = '"+session_username+"' AND easyticket.createevent.EventID = easyticket.event.eventID");
            int i = 1;
            while(rs.next()) 
            {
                String eid = rs.getString(1);
                String eName = rs.getString(2);

                out.println(i+". "+eName+" ("+eid+")");
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

    <form action="PlannerHomePage.html" method="POST">
        <input type="submit" value="Go Back">
    </form>
  
