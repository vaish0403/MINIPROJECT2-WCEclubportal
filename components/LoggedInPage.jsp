<%-- 
    Document   : AdminLoggedInPage.jsp
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged In</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
        <script type="text/javascript" src="../js/click.js"></script>
    </head>
    <body onload="setIt()">
        <%
            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/club";
            String user = "root";
            String dbpsw = "system";
            String redirectUrl = "http://localhost:8080/WCEclubportal/components/";
			String userName = request.getParameter("inputEmail");
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
        <div>
            <table  width="100%"  border="1" >
                <tr>
                    <td colspan="2">
                          <jsp:include page="HeaderLogout.jsp"></jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" ><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome</h3></td>
                </tr>
                <tr>
                    <td><center>
                            <div class="list-group">
                                <span href="#" class="list-group-item active">
                                    Actions
                                    <span class="pull-right" id="slide-submenu">
                                        <i class="fa fa-times"></i>
                                    </span>
                                </span>
                                <span class="adminSubMenu">
                                <a href="#" class="list-group-item" onclick="displayAddOb()" id="adminSubMenu">
                                    Add Club Representative
                                </a>
                                </span>
                                <span class="adminSubMenu">
                                <a href="#" class="list-group-item" onclick="displayRemoveOb()" id="adminSubMenu">
                                    Remove Club Representative
                                </a>
                                </span>
                                <span class="adminSubMenu" >
                                <a href="http://localhost:8080/WCEclubportal/components/viewOb.jsp" class="list-group-item">
                                    View Club Representative
                                </a>
                                </span>

                                 <span class="adminSubMenu" >
                                <a href="http://localhost:8080/WCEclubportal/components/allIdeas.jsp" class="list-group-item">
                                    All Ideas
                                </a>
                                </span>


                                <span class="obSubMenu" >
                                <a href="http://localhost:8080/WCEclubportal/components/addEvent.jsp " class="list-group-item">
                                    Add Event
                                </a>
                                </span>
                                <span class="obSubMenu">
                                <a href="#" class="list-group-item" onclick="displayRemoveEvent()" >
                                    View Events
                                </a>
                                </span>
                                <span class="obSubMenu" onclick="displayViewMembers()">
                                <a href="#" class="list-group-item" >
                                    View Club Members
                                </a>
								
								
								<span>
                                <a href="http://localhost:8080/WCEclubportal/club/joinMembers.jsp" class="list-group-item" >
                                    Add Club Members
                                </a>
                                </span>
								
                                <span>
                                <a href="http://localhost:8080/WCEclubportal/components/submitIdea.jsp" class="list-group-item" >
                                    Submit Idea
                                </a>
                                </span>

                                  <span>
                                <a href="http://localhost:8080/WCEclubportal/components/viewIdea.jsp" class="list-group-item" >
                                    View Event Idea Status
                                </a>
                                </span>



                                </span>
                                <span>
                                <a href="#" class="list-group-item" onclick="displayChangePassword()">
                                    Change Password
                                </a>
                                </span>
                                </div>        
                </center>
                    </td>
                     <td id="intro"><h5>You can do some operations by choosing the sub menu</h5></td>
                    <td>
                        <div id="addOb">
                            <form action="/WCEclubportal/AddOb" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Choose Club: </td>
                                    <td>
                                        <select name="club">
                                            <option value="acses">ACSES</option>
                                            <option value="acm">ACM</option>
                                            <option value="wlug">WLUG</option>
                                            <option value="elesa">ELESA</option>
                                            <option value="artcirle">Art Circle</option>
                                            <option value="softa">SOFTA</option>
                                            <option value="rotaract">ROTARACT</option>
                                            <option value="pace">PACE</option>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="email" name="username" size="30" required></td>
                                </tr>
                                <tr>
                                    <td>Roll Number: </td>
                                    <td><input type="text" name="rollno" size="10" required></td>
                                </tr>
                                <tr>
                                    <td>Department: </td>
                                    <td>
                                        <select name="dept">
                                            <option value="it">IT</option>
                                            <option value="cse" selected>CSE</option>
                                            <option value="ece">ECE</option>
                                            <option value="others">Other</option>
                                        </select>
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
                        <div id="removeOb">
                            <form action="/WCEclubportal/RemoveOb" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                <tr>
                                    <td>Choose User: </td>
                                    <td>
                                    <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                                    <sql:query var="ob">
                                        select * from detail where type='ob';
                                    </sql:query> 
                                    <input list="users" name="users">
                                        <datalist id="users">
                                            <c:forEach var="detail" items="${ob.rows}">
                                                <option size="30">
                                                    <c:out value="${detail.email}" />   
                                                    <c:out value="${detail.rollno}" />
                                                </option>
                                            </c:forEach>
                                        </datalist>
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
                                    
                        <div id="addEvent">
                            <form action="/WCEclubportal/AddEvent" method="POST" >
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Choose Club: </td>
                                    <td>
                                        <select name="club">
                                            <option value="acses">ACSES</option>
                                            <option value="acm">ACM</option>
                                            <option value="wlug">WLUG</option>
                                            <option value="elesa">ELESA</option>
                                            <option value="artcirle">Art Circle</option>
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
                                            <option value="Mini-CCF">
                                            <option value="CCF">
                                            <option value="PG Lab">
                                            <option value="Tilak Hall">
                                            <option value="Classroom Number 20">
                                            <option value="Physics Lab">
                                            <option value="Graphics Seminar Hall">
                                            <option value="IT Lab">
                                            <option value="Orange Lab">
                                        </datalist>
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
                         
                        <div id="removeEvent">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                            <sql:query var="ob">
                                select * from event order by Date asc;
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Date</th>
                                    <th>Event Name</th>
                                    <th>Venue</th>
                                    <th>CLUB</th>
                                </tr>
                                <c:forEach var="event" items="${ob.rows}">
                                    <tr>
                                        <td><c:out value="${event.date}" /></td>   
                                        <td class="text-uppercase"><c:out value="${event.eventname}" /></td>
                                        <td class="text-uppercase"><c:out value="${event.venue}" /></td>
                                        <td class="text-uppercase"><c:out value="${event.club}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>  
                        </div>
                            
                        
                         <div id="viewMembers">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="vaishna432001"/>
                            <sql:query var="ob">
                                select * from members;
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Email</th>
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
                            
                           
                        <!------------------------------------------------------------------>            
                        <div id="changePassword">
                            <form action="/WCEclubportal/ChangePassword" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>UserName</td>
                                    <td>
                                        <input type="text" name="emailGet">
                                    </td>
                                </tr>
                                <tr>
                                    <td>New Password: </td>
                                    <td>
                                        <input type="password" name="chpwd" id="retypeIt1">
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
                    </td>
                </tr>
            </table>
        </div>
        
    </body>
</html>
