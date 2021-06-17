<%-- 
    Document   :datewise.jsp
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
        <script type="text/javascript" src="../js/click.js"></script>
    </head>
    
       
        
 <body>
 <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <div>
                    <a href="https://gouri7030.github.io/df/" class="btn btn-light">
                        Discuss Here
                    </a>
                </div>
                  
                <div>
                    &nbsp;&nbsp;&nbsp;
                    <a href="../components/regEvent.jsp" class="btn btn-light">
                        Register Here
                    </a>
                </ul>
                
                <div>
                    <a href="../index.html">
                        <img src="../img/collegeLogo.png" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>
                <div>
                    
                    <a href="../club/clubwise.jsp" class="btn btn-light">
                        Club-wise
                    </a>
					&nbsp;&nbsp;&nbsp;
					<a href="../club/venuewise.jsp" class="btn btn-light">
                        Venue-wise
                    </a>
                </div>
            </div>
        </nav>
 
 
 
 
        <div>
        <h1 style="text-align: center">Date-wise Events</h1>
        <table class="table table-hover" style="text-align: center">
            <thead class="thead-dark">
            <tr>
                <th>Sr No.</th>
                <th>Date</th>
                <th>Event Name</th>
                <th>CLUB</th>
                <th>Venue</th>
            </tr>
            </thead>
            <%
                Connection con= null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/club";
                String user = "root";
                String dbpsw = "vaishna432001";
                String sql_today = " select * from event order by date asc ;";
                
                Class.forName(driverName);
                con = (Connection)DriverManager.getConnection(url, user, dbpsw);
                
                ps = con.prepareStatement(sql_today);
                rs = ps.executeQuery();
                int flag = 1;
                try{
                    while(rs.next())
                    {
                        String date_value = rs.getString("Date");
                        String event = rs.getString("eventname");
                        String clubName = rs.getString("club");
                        String venue = rs.getString("venue");

                        String arr_date[] = date_value.split("-");
                        String datePrint = arr_date[2]+"-"+arr_date[1]+"-"+arr_date[0];
                        %>
                        <tr>
                        <td>
                        <%
                            out.println(flag);
                            flag++;
                        %>
                        </td>
                        <td>
                        <%
                            out.println(datePrint);
                        %>
                        </td>
                        <td>
                        <%
                            out.println(event);
                        %>
                        </td>
                        <td class="text-uppercase">
                        <%
                            out.println(clubName);
                        %>
                        </td>
                        <td>
                        <%
                            out.println(venue);
                        %>
                        </td>
                        </tr>
                        <%
                    }
                }
                catch(Exception ex){
                    out.println("<tr><td colspan='5'>No Events</td></tr>");
                }
                %>
        </table>
        </div>
        
  </body>      
 </html>       
        