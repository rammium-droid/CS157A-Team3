<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String ename = request.getParameter("eventName");
    String category = request.getParameter("userType");
    String desc = request.getParameter("description");
    String date = request.getParameter("date");
    out.println(date);
    String time = request.getParameter("time");

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
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();


                ResultSet rs = stmt.executeQuery("SELECT event.eventID, eventName, category, description, date_and_time FROM easyticket.event, easyticket.createevent where event.eventID = "+eid+" AND EventPlannerUserID = '"+session_username+"' AND event.eventID = createevent.EventID");
                if (rs.next()) 
                {
                    if((rs.getString(2).equals(ename) == false) && (ename != ""))
                    {
                        int r = stmt2.executeUpdate("Update easyticket.event set eventName = '"+ename+"' Where eventID = "+eid);
                    }

                    if((rs.getString(3).equals(category) == false) && (category != null))
                    {
                        int r = stmt3.executeUpdate("Update easyticket.event set category = '"+category+"' Where eventID = "+eid);
                    }

                    if((rs.getString(4).equals(desc) == false) && (desc != ""))
                    {
                        int r = stmt4.executeUpdate("Update easyticket.event set description = '"+desc+"' Where eventID = "+eid);
                    }

                    if((rs.getString(5).equals(date+" "+time) == false) && (date != "" || time != ""))
                    {
                        int r = stmt5.executeUpdate("Update easyticket.event set date_and_time = '"+date+" "+time+"' Where eventID = "+eid);
                    }

                    response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
                }
                else
                {
                    response.sendRedirect("http://localhost:8080/WrongEventID.html");
                }


            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
