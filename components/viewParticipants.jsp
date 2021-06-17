<%-- 
    Document   : viewParticipants.jsp
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Participants</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
        <script type="text/javascript" src="../js/click.js"></script>
    </head>
    <body>
        <%
            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/club";
            String user = "root";
            String dbpsw = "vaishna432001";
            String redirectUrl = "http://localhost:8080/WCEclubportal/components/";
        %>
        
        

		
		<nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Participants
                  </li>
                </ul>
                
                <div>
                    <a href="../index.html">
                        <img src="../img/collegeLogo.png" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>
                <div>
                <div>
                    <a href="http://localhost:8080/WCEclubportal/components/regEvent.jsp" class="btn btn-light">
                        Back
                    </a>&nbsp;&nbsp;&nbsp;
                    
                </div>
            </div>
        </nav>
        
		<div id="viewOb">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                            <sql:query var="pt">
                                select * from participants order by eventname;
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Email</th>
                                    <th>ROLL NO</th>
                                    <th>DEPARTMENT</th>
                                    <th>EVENT</th>
                                </tr>
                                <c:forEach var="participants" items="${pt.rows}">
                                    <tr>
                                        <td><c:out value="${participants.email}" /></td>   
                                        <td class="text-uppercase"><c:out value="${participants.rollno}" /></td>
                                        <td class="text-uppercase"><c:out value="${participants.department}" /></td>
                                        <td class="text-uppercase"><c:out value="${participants.eventname}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
        </div>      
    </body>