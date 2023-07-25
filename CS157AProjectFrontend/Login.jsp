<%@ page import="java.sql.*"%>
    <% 
    String uid = request.getParameter("userID");
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
                ResultSet rs = stmt.executeQuery("SELECT * FROM easyticket.buyer where userID = '"+uid+"'");
                if (rs.next()) 
                {
                    if(rs.getString(4).equals(pass))
                    {  
                        response.sendRedirect("http://localhost:8080/BuyerHomePage.html");
                    }
                    else
                    {
                        out.println("Incorrect password");
                    }
                }
                else
                {
                    out.println("Incorrect userID");
                }
            }
            else if(utype.equals("seller"))
            {
                ResultSet rs = stmt.executeQuery("SELECT * FROM easyticket.eventplanner where userID = '"+uid+"'");
                if (rs.next()) 
                {
                    if(rs.getString(4).equals(pass))
                    {
                        response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
                    }
                    else
                    {
                        out.println("Incorrect password");
                    }
                }
                else
                {
                    out.println("Incorrect userID");
                }
            }
            else
            {
            }

            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
