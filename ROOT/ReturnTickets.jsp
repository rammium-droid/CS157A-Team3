<%@ page import="java.sql.*"%>
    <% 
    String rid = request.getParameter("returnID");
    String eid = request.getParameter("eventID");
    String tickets = request.getParameter("tickets");

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
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();
            ResultSet rs2 = stmt2.executeQuery("SELECT tickets.remainingTickets, price FROM easyticket.tickets where easyticket.tickets.eventID = "+eid);
            ResultSet rs = stmt5.executeQuery("SELECT Sum(hastickets.tickets) FROM easyticket.hastickets,easyticket.tickets where easyticket.tickets.eventID = "+eid+" AND userID = '"+session_username+"'");
            if(rs.next()) 
            {
                String have = rs.getString(1);
                int returns = Integer.parseInt(tickets);
                int h = Integer.parseInt(have);
                if(h<returns)
                {
                    out.println("Insufficient Tickets. Please select less number of tickets.");
                }
                else
                {
                    h = h - returns;
                }
                int r = stmt3.executeUpdate("Update easyticket.hastickets set tickets = "+h+" Where eventID = "+eid+" AND userID = '"+session_username+"'");
            }

            if(rs2.next()) 
            {
                String remaining = rs2.getString(1);
                int rem = Integer.parseInt(remaining);
                rem = rem + Integer.parseInt(tickets);
                int r = stmt4.executeUpdate("Update easyticket.tickets set remainingTickets = "+rem+" Where tickets.eventID = "+eid);
            }

            String ppt = rs2.getString(2);
            int priceperticket = Integer.parseInt(ppt);
            int intTickets = Integer.parseInt(tickets);
            int amt = intTickets * priceperticket * (-1);

            Statement stmt = con.createStatement();
            int rows1 = stmt.executeUpdate("insert into easyticket.return values("+rid+","+eid+",'"+session_username+"',"+tickets+")");
            int rows3 = stmt.executeUpdate("insert into easyticket.transaction values("+rid+", "+eid+", '"+session_username+"', "+tickets+", "+amt+")");

            stmt.close();
            con.close();

            response.sendRedirect("http://localhost:8080/BuyerHomePage.html");
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
