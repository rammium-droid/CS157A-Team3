<%@ page import="java.sql.*"%>

<html lang="en" style="background-color:aquamarine">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Cards</title>
</head>
<body>
<h1>YOUR SAVED CARDS</h1>
</body>
</html>

<%
    String session_username = (String)session.getAttribute("username");

    String db = "easyticket";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "Teaotic757!";
    try
    {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyticket?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT DISTINCT card.cardNo,card.cardName FROM easyticket.card,easyticket.buyer where card.userID = '"+session_username+"'");
        int i = 1;
        while(rs.next())
        {
            String cardNo = rs.getString(1);
            String cardName = rs.getString(2);

            out.println(i+". "+cardName+" ("+cardNo+")");
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
<form action="BuyerHomePage.html" method="POST">
    <input type="submit" value="Go Back">
</form>

