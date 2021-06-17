<%-- 
    Document   : acm
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
        <title>ACM Club</title>
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="icon" href="../../img/coCurricular/acm.jpg">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                    <a href="http://wce.acm.org/">
                        <img src="../../img/coCurricular/acm.jpg" alt="not available" width="40" height="50" class="img-thumbnail">
                    </a>  
                    ACM Club
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
                        WCE ACM Student Chapter is a recently formed ACM student chapter in Walchand College of 
                        Engineering, Sangli. The chapter aims to conduct various technical & non-technical activities
                        for overall development of the students of the institute. The chapter has received official
                        authorization from the WCE India Council to operate at a local level. ACM local chapters 
                        engage members through talks by local practitioners, visits from prominent speakers from the
                        ACM Distinguished Speakers Program, technical and career workshops, field trips to computing
                        installations, and social activities. Chapters are the engines that drive networking and 
                        learning on a local level.    
                        </p>
               </div>
            </div>
        </section>
        <table class="table table-striped" width="50%" height="50%" align="center" style="text-align: center">
            <tr>
                <td>Staff Advisor</td>
                <td>Dr. M A Shah</td>
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
                String sql = "select Date, eventname from event where club='acm' order by Date desc;";

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
                                select email, rollno, department from members where club='acm';
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
