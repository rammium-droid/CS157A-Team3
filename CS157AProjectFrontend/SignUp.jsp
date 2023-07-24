<%@ page import="java.sql.*"%>
    <% 
    String uid = request.getParameter("userID");
    String fname = request.getParameter("name");
    String em = request.getParameter("email");
    String pass = request.getParameter("pw");
    String utype = request.getParameter("userType");

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
            
            if(utype.equals("buyer"))
            {
                int rows = stmt.executeUpdate("insert into easyticket.buyer values('"+uid+"','"+fname+"','"+em+"','"+pass+"')");
            }
            else if(utype.equals("seller"))
            {
                int rows = stmt.executeUpdate("insert into easyticket.eventplanner values('"+uid+"','"+fname+"','"+em+"','"+pass+"')");
            }
            else
            {
                out.println("No radiobox selected.");
            }

            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
