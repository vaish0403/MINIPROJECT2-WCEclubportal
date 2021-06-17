<%-- 
    Document   :viewIdea.jsp
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
        <title>Idea Status</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
        <script type="text/javascript" src="../js/click.js"></script>
    </head>
    
       
        
 <body>
 <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Idea Status
                  </li>
                  

                </ul>
                
                <div>
                    <a href="../index.html">
                        <img src="../img/collegeLogo.png" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>

                <div>
                    <a href="http://localhost:8080/WCEclubportal/components/LoggedInPage.jsp" class="btn btn-light">
                        Back
                    </a>&nbsp;&nbsp;&nbsp;
                    <a href="http://localhost:8080/WCEclubportal/components/Login.jsp" class="btn btn-light">
                        Logout
                    </a>
                </div>
                
            </div>
        </nav>
 
 
 
 <form class="form-signin" action="/WCEclubportal/AllIdeas" method="POST">
        <div>
        <h1 style="text-align: center">All Ideas</h1>
        <table class="table table-hover" style="text-align: center">
            <thead class="thead-dark">
            <tr>
                <th>Sr.No.</th>
                <th>Club</th>
                <th>Tentative Event Date</th>
                <th>Idea</th>
                <th>Status</th>
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
                String sql_idea = " select * from eventidea where status is NULL";
                
                Class.forName(driverName);
                con = (Connection)DriverManager.getConnection(url, user, dbpsw);
                
                ps = con.prepareStatement(sql_idea);
                rs = ps.executeQuery();
                int flag = 1;
                try{
                    while(rs.next())
                    {
                        String clubName = rs.getString("club");
                        String date_value = rs.getString("eventdate");
                        String idea = rs.getString("idea");
                      
                        String status = rs.getString("status");

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
                            out.println(clubName);
                        %>
                        </td>
                        <td>
                        <%
                            out.println(date_value);
                        %>
                        </td>
                        <td class="text-uppercase">
                        <%
                            out.println(idea);
                        %>
                        </td>
                        <td>
                        
                   <div class="form-label-group">
                     <select name="status" class="form-control">
                        <option value="null" selected>Null</option>
                        <option value="approved" >Approved</option>
                        <option value="notapproved">Not Approved</option>
                    </select>
                  </div>  
                       
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

         <button class="btn btn-lg btn-info btn-block" type="submit">Save Changes</button>
 </form>       
  </body>      
 </html>       
        