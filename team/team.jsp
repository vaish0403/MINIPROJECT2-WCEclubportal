<%-- 
    Document   : addEvent.jsp
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!DOCTYPE html>
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Our Team</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
        <script type="text/javascript" src="../js/click.js"></script>
	   
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="stylesheet.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style >
  	img{
			border: 4px solid black;
		}
  </style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Our Team
                  </li>
                </ul>
                
                
                <div>
                    <a href="http://localhost:8080/WCEclubportal/index.html" class="btn btn-light">
                        Home
                    </a>&nbsp;&nbsp;&nbsp;
                    
                </div>
            </div>
        </nav>



	<h1 style="text-align: center;">Developed By</h1>
	<table width="100%">
		<tr>
			<td style="text-align: center;">
				<figure>
					<img src="vaishnavi.jpg" width="200px" height="250px">
					<figcaption>Vaishnavi Patil<br>(2018BTECS00060)<br>
						
      <a href="https://www.linkedin.com/in/vaishnavi-patil-15236616a" target="_blank">
        <i class="fab fa-linkedin-in"></i>
      </a><br>
      <a href="mailto:patilvaishnavi021@gmail.com" target="_blank">
        <i class="fa fa-envelope"></i>
      </a>
					</figcaption>
				</figure>
				
			</td>
			<td style="text-align: center;">
				<figure>
					<img src="gauri.jpg" width="220px" height="250px ">
					<figcaption>Gouri Sutar<br>(2018BTECS00069)<br>
						<a href="https://www.linkedin.com/in/gouri-sutar-542103187" target="_blank">
        <i class="fab fa-linkedin-in"></i>
      </a><br>
      <a href="mailto:sutar0205@gmail.com" target="_blank">
        <i class="fa fa-envelope"></i></a>
					</figcaption>
				</figure>
				
			</td>
			<td style="text-align: center;">
				<figure>
					<img src="shivani.jpeg" width="200px" height="250px">
					<figcaption>Shivani Avasare<br>(2018BTECS00027)<br>
						<a href="https://www.linkedin.com/in/shivani-avasare-05a0641a8/" target="_blank">
        <i class="fab fa-linkedin-in"></i>
      </a><br>
      <a href="mailto:avasareshivani2000@gmail.com" target="_blank">
        <i class="fa fa-envelope"></i></a>
					</figcaption>
				</figure>
				
			</td>
		</tr>
	</table>
</body>
</html>