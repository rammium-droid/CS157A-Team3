<%@page import="java.sql.*"%>
<html lang="en" style="background-color:aquamarine">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Added success.</title>
</head>
    <h1>EVENT TICKET SUCCESFULLY ADDED TO CART</h1><button onclick="window.location.href = 'http://localhost:8080/AllEvents.jsp'">GO BACK</button><%String session_username = (String)session.getAttribute("username"); String db = "easyticket";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "mgnmgn";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyticket?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();
stmt.executeUpdate("INSERT INTO easyticket.cart (cartID,eventID) VALUES ('roberto2',36523)");
    }catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }%>