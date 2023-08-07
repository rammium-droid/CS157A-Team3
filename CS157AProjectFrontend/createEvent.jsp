<%@ page import="java.sql.*"%>
<%
    String eventName = request.getParameter("eventName");
    String description = request.getParameter("desc");
    String when = request.getParameter("date");
    String location = request.getParameter("loc");

    String db = "easyTicket";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "Teaotic757!";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easyticket?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();
        int rows = stmt.executeUpdate("insert into easyticket.Event values('"+1+","+eventName+"','"+description+"','"+location+"','"+when+"')");
        %><dialog open>
        <p>Event succesfully created!</p>
        <form method="dialog">
        <button>OK</button>
        </form>
        </dialog><%
        stmt.close();
        con.close();
    }

    catch(SQLException e)
    {
        out.println("SQLException caught: " + e.getMessage());
    }
%>

