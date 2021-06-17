<%-- 
    Document   : pace
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PACE Club</title>
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="icon" href="../../img/extraCurricular/pace.jpg">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                    <a href="https://wcepace.org/">
                        <img src="../../img/extraCurricular/pace.jpg" alt="not available" width="40" height="50" class="img-thumbnail">
                    </a>
                      PACE Club
                  </li>
                </ul>
                
                <div>
                    <a href="../../index.html">
                        <img src="../../img/collegeLogo.png" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>
                <div>
                    
                    <a href="../../index.html" class="btn btn-light">
                        Home
                    </a>
                </div>
            </div>
        </nav>
        <section class="testimonials text-center bg-light" id="about">
            <div class="container">
              <h2 class="mb-5" >About Us</h2>
               <div class="row">
                       <p>
                        Personality Advancement Circle of Engineers (PACE) is a renowned, non-profit student body in 
                        Walchand College of Engineering, Sangli. We at PACE, recognize five essential qualities which 
                        are synonymous to being the five pillars of an individual personality. PACE works towards
                        fostering different competitive skills in college students so as to enhance their personality
                        and contribute towards their overall development.Personality Advancement Circle of Engineers 
                        aims to increase the skillset of the engineers produced from Walchand College of Engineering, 
                        Sangli and keep them on the technological as well as managerial edge in the rapidly evolving 
                        trends of the corporate world.
						</p>
               </div>
            </div>
        </section>
        <table class="table table-striped" width="50%" height="50%" align="center" style="text-align: center">
            <tr>
                <td>Staff Advisor</td>
                <td>Prof. A.B.Patil</td>
            </tr>
        </table>
        <h1 style="text-align: center">Events</h1>
        <table class="table table-hover" style="text-align: center">
            <thead class="thead-dark">
            <tr>
                <th>Sr No.</th>
                <th>Date</th>
                <th>Event Name</th>
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

                String sql = "select Date, eventname from event where club='pace' order by Date desc;";

                Class.forName(driverName);
                con = (Connection)DriverManager.getConnection(url, user, dbpsw);
                ps = (PreparedStatement)con.prepareStatement(sql);
                rs = (ResultSet)ps.executeQuery();

                int flag = 1;
                while(rs.next())
                {
                    String date_value = rs.getString("Date");
                    String event = rs.getString("eventname");
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
                        out.println(date_value);
                    %>
                    </td>
                    <td>
                    <%
                        out.println(event);
                    %>
                    </td>
                    </tr>
                    <%
                }
               %>
            </tr>
        </table>
		
		<br><br><br>
		<h1 style="text-align: center">Club Members</h1>
		<div id="viewMembers">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                            <sql:query var="ob">
                                select email, rollno, department from members where club='pace';
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Email</th>
                                    <th>ROLL NO</th>
                                    <th>DEPARTMENT</th>
                                </tr>
                                <c:forEach var="detail" items="${ob.rows}">
                                    <tr>
                                        <td><c:out value="${detail.email}" /></td>   
                                        <td class="text-uppercase"><c:out value="${detail.rollno}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.department}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
		
    </body>
</html>
