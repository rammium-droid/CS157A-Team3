<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html lang="en" style="background-color:aquamarine">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>All Events</title>
</head>
  <body>
    <h1>ALL EVENTS</h1>
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
            Statement stmt2 = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT event.EventID,event.eventName,event.category,event.description,event.date_and_time,event.location FROM easyticket.event");
            int i = 1;
            while(rs.next()) 
            {
                String eid = rs.getString(1);
                String eName = rs.getString(2);
                String cat = rs.getString(3);
                String desc = rs.getString(4);
                String when = rs.getString(5);
                String loc = rs.getString(6);
                String p = "<", p1 = "%";
                String p2 = ">";
                String q = ""+"\""+"";
                out.println(i+". "+eName+" ("+eid+")");
                String query = "stmt2.executeUpdate(\"INSERT INTO easyticket.cart (cartID,eventID) VALUES ('\"+session_username+\"',\"+eid+\")\")";
                out.println("<button onclick=\"window.location.href = 'http://localhost:8080/"+eid+"hi.jsp';\">DETAILS</button>");
                out.println("<button onclick=\"window.location.href = 'http://localhost:8080/"+eid+"add.jsp';\">ADD TO CART</button>");
                out.println("<BR>");
                FileOutputStream details = new FileOutputStream(eid+"hi.jsp");
                FileOutputStream addCart = new FileOutputStream(eid+"add.jsp");
                FileWriter writeCart = new FileWriter("/Library/Tomcat/webapps/ROOT/"+eid+"add.jsp");
                writeCart.write(p+p1+"@page import=\"java.sql.*\""+p1+p2+"\n"+"<html lang=\"en\" style=\"background-color:aquamarine\">\n" +
                        "<head>\n" +
                        "\t<meta charset=\"UTF-8\">\n" +
                        "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                        "\t<title>Added success.</title>\n" +
                        "</head>\n" +
                        "    <h1>EVENT TICKET SUCCESFULLY ADDED TO CART</h1>"+"<button onclick=\"window.location.href = 'http://localhost:8080/AllEvents.jsp'\">GO BACK</button>"+p+p1+
                                "String session_username = (String)session.getAttribute(\"username\"); String db = \"easyticket\";\n" +
                                "    String user; // assumes database name is the same as username\n" +
                                "    user = \"root\";\n" +
                                "    String password = \"Teaotic757!\";\n" +
                                "    try {\n" +
                                "        java.sql.Connection con;\n" +
                                "        Class.forName(\"com.mysql.jdbc.Driver\");\n" +
                                "        con = DriverManager.getConnection(\"jdbc:mysql://localhost:3306/easyticket?autoReconnect=true&useSSL=false\",user, password);\n" +
                                "        Statement stmt = con.createStatement();\n" +
                                "stmt.executeUpdate(\"INSERT INTO easyticket.cart (cartID,eventID) VALUES (" + "'"+session_username+"'"+","+eid+")"+"\""+");\n" +
                                "    }catch(SQLException e) {\n" +
                                "        out.println(\"SQLException caught: \" + e.getMessage());" +
                                "\n" + "    }"+p1+p2);
                writeCart.close();
                FileWriter writeDetails = new FileWriter("/Library/Tomcat/webapps/ROOT/"+eid+"hi.jsp");
                writeDetails.write("<html lang=\"en\" style=\"background-color:aquamarine\">\n" +
                        "<head>\n" +
                        "\t<meta charset=\"UTF-8\">\n" +
                        "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                        "\t<title>EVENT DETAILS</title>\n" +
                        "</head>\n" +
                        "  <body>\n" +
                        "    <h1>EVENT DETAILS</h1>");
                writeDetails.write(eName+"<BR>"+"Category: "+cat+"<BR>"+"Location: "+loc+"<BR>"+"Date and time: "+when+"<BR>"+"Description: "+desc+"<BR>");
                writeDetails.write("</body>\n" +
                        "</html>");
                writeDetails.close();
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
  
