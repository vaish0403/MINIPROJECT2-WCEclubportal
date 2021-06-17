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
        <title>Admin- Add Event</title>
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
                      Add Event
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
<br><br><br><br><br><br><br>
		
		
			<div id="addEvent">
                            <form action="/WCEclubportal/AddEvent" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Choose Club: </td>
                                    <td>
                                        <select name="club">
											<option value="acses">ACSES</option>
                                            <option value="acm">ACM</option>
                                            <option value="wlug">WLUG</option>
                                            <option value="elesa">ELESA</option>
                                            <option value="artcircle">Art Circle</option>
                                            <option value="softa">SOFTA</option>
                                            <option value="rotaract">ROTARACT</option>
                                            <option value="pace">PACE</option>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>Event Name: </td>
                                    <td><input type="text" name="eventName" size="30" required></td>
                                </tr>
                                <tr>
                                    <td>Date: </td>
                                    <td><input type="date" name="eventDate" required></td>
                                </tr>
                                <tr>
                                    <td>Venue: </td>
                                    <td>
                                        <input list="venue" name="venue">
                                        <datalist id="venue">
                                            <option value="MINI CCF">
                                            <option value="CCF">
                                            <option value="IT Lab">
                                            <option value="Room No. 20">
                                            <option value="Tilak Hall">
                                            <option value="PG lab">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" width="50%">
                                    </td> 
                                </tr>
                            </table>
                            </form>
                        </div>

 
						
</body>