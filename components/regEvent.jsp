<%-- 
    Document   : regEvent.jsp
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
        <title>Event Registration</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
    </head>
    <body>
		<nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Event Registration
                  </li>
                </ul>
                
                <div>
                    <a href="../index.html">
                        <img src="../img/collegeLogo.png" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>
                <div>
                    <a href="http://localhost:8080/WCEclubportal/club/clubwise.jsp" class="btn btn-light">
							Back
					</a>&nbsp;&nbsp;&nbsp;
                    <a href="../components/viewParticipants.jsp" class="btn btn-light">
                        Participants
                    </a>
                </div>
            </div>
        </nav>
		
	
		<%
					Connection con= null;
					PreparedStatement ps = null;
					ResultSet rs = null;

					String driverName = "com.mysql.jdbc.Driver";
					String url = "jdbc:mysql://localhost:3306/club";
					String user = "root";
					String dbpsw = "vaishna432001";
					String sql_today = " select * from event order by club ;";
					
					Class.forName(driverName);
					con = (Connection)DriverManager.getConnection(url, user, dbpsw);
					
					ps = con.prepareStatement(sql_today);
					rs = ps.executeQuery();
					
		%>

        
	
        <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center"><img src="../img/hack.ico" alt="WillBeUpdatedSoon" width="50" height="50"></h5>
                <h5 class="card-title text-center">Register Here</h5>
                <form class="form-signin" action="/WCEclubportal/RegEvent" method="POST">
                  
                  <div class="form-label-group">
                      <input type="email" class="form-control" name="email" placeholder="Email address" required><br>
                  </div>
                  
                  <div class="form-label-group">
                    <select name="dept" class="form-control">
                        <option value="it">IT</option>
                        <option value="cse" selected>CSE</option>
                        <option value="electronics">Electronics</option>
                        <option value="civil">Civil</option>
						 <option value="electrical">Electrical</option>
						  <option value="mechanical">Mechanical</option>
                    </select>
                  </div><br>  
                    
                  <div class="form-label-group">
                      <input type="text" id="inputEmail" class="form-control" name="rollno" placeholder="Roll number" required><br>
                  </div>

                  
				  
				  <div class="form-label-group">
                      <select name="eventname" class="form-control" placeholder="Event name" required>
                          
							 <%  while(rs.next()){ %>
								<option><%= rs.getString(2)%></option>
							<% } %>
							
							 
                        </select> 
                  </div><br>
                  <button class="btn btn-lg btn-info btn-block" type="submit">Register</button>
                  <hr class="my-4">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
