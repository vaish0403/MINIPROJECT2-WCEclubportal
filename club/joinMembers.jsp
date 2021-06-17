<%-- 
    Document   : joinClub
    Author     : Vaishnavi, Gouri, Shivani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Members</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.png">
    </head>
    <body>
	
	<nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Add Member
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
	
	
        <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center"><img src="../img/hack.ico" alt="WillBeUpdatedSoon" width="50" height="50"></h5>
                <h5 class="card-title text-center">Add Member</h5>
                <form class="form-signin" action="/WCEclubportal/AddMembers" method="POST">
                  
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
                      <select name="club" class="form-control">
                            <option value="acses">ACSES</option>
                            <option value="acm">ACM</option>
                            <option value="wlug">WLUG</option>
                            <option value="elesa">ELESA</option>
                            <option value="artcircle">Art Circle</option>
                            <option value="softa">SOFTA</option>
                            <option value="rotaract">ROTARACT</option>
                            <option value="pace">PACE</option>
                        </select> 
                  </div><br>
                  <button class="btn btn-lg btn-info btn-block" type="submit">ADD</button>
                  <hr class="my-4">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
