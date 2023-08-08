<%@ page import="java.sql.*"%>

<html lang="en" style="background-color:aquamarine">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>future</title>
</head>
<body>
<h1>FUTURE EVENTS</h1>
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
        Statement stmt2 = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT distinct easyticket.event.eventName,easyticket.event.date_and_time FROM easyticket.cart,easyticket.event,easyticket.buyer where easyticket.cart.cartID = '"+session_username+"' and easyticket.cart.eventID=easyticket.event.eventID order by event.date_and_time");
        int i = 1;
        while(rs.next())
        {
            String eName = rs.getString(1);
            String date = rs.getString(2);
            out.println(i+". "+eName+ " Date: "+date);
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
<button onclick="window.location.href = 'http://localhost:8080/BuyerHomePage.html'">GO BACK</button>
<br>
<br>
<br>