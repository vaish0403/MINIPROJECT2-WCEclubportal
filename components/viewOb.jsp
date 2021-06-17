<%-- 
    Document   : addEvent.jsp
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
            String dbpsw = "system";
            String redirectUrl = "http://localhost:8080/WCEclubportal/components/";
        %>
        
        <%
            Cookie cookie[] = request.getCookies();
            String redirect="";
            String cook_user="";
            String cook_type="";
            if(cookie==null){
                redirect = redirectUrl+"Login.jsp";
                out.println(redirect);
                response.sendRedirect(redirect);
            }
            else{
                for(int i=0;i<cookie.length;i++){
                    //out.println("<script>alert('"+cookie[i].getValue()+" "+cookie[i].getName()+"');</script>");
                    if(cookie[i].getName().equals("username"))
                    {
                        cook_user = cookie[i].getValue();
                        //out.println("<script>alert('"+cook_user+"');</script>");
                    }
                    if(cookie[i].getValue().equals("admin")){
                        out.println("<input type='hidden' value='admin' id='displaySubmenu'/>");
                    }
                    if(cookie[i].getValue().equals("ob")){
                        cook_user = cookie[i].getName();
                        out.println("<input type='hidden' value='ob' id='displaySubmenu'/>");
                    }    
                }
            }
        %>


		
		<nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Club Representatives
                  </li>
                </ul>
                
                
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
        
		<div id="viewOb">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                            <sql:query var="ob">
                                select * from detail where type='ob';
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Name</th>
                                    <th>ROLL NO</th>
                                    <th>DEPARTMENT</th>
                                    <th>CLUB</th>
                                </tr>
                                <c:forEach var="detail" items="${ob.rows}">
                                    <tr>
                                        <td><c:out value="${detail.email}" /></td>   
                                        <td class="text-uppercase"><c:out value="${detail.rollno}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.department}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.club}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
        </div>      
    </body>