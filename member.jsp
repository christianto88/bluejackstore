<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date" errorPage="" %>
<%@ include file="navbar.jsp"%>
<%@ include file="Controller/connect.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="css/bootstrap.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/tether.min.js"></script>
    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

  <script>
  $(document).ready(function(){
   $("[data-toggle=popover]").popover('show');
     $("[data-toggle=popover]").css("width:20px");
});
  </script>
</head>

<body>
<%!int i=0;
ResultSet rs2;
%>
<% int ol;
		if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
			ol = 0;
		} else {
			ol = Integer.parseInt((String)application.getAttribute("online"));
	 } %>
   <%

String search=request.getParameter("search");
  if(request.getParameter("search")!=null)
  {
    String querysearch="SELECT * FROM user where fullName LIKE '%"+search+"%'";
    rs2=st.executeQuery(querysearch);
  }
  
  else
  {
    
    String query = "SELECT * FROM user";
    rs2=st.executeQuery(query);
    }

   %>


     
     
     
          
                
   <!-- Page Content 
   
   -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true">BlueJack Store</p>
                <div class="list-group">
                   
                    <div class="list-group-item">
                    <form action="member.jsp" method="post">
                    <input type="text" placeholder="Search" name="search"/>
                    <button class="btn btn-md btn-primary" aria-label="Left Align" type="submit" value="Search" >
                      <span class="glyphicon glyphicon-search" aria-hidden="true" </span>
                    </button>
					</form>
                    </div>
                    
                </div>
                
            </div>
			<div class="col-md-9">
                <div class="row">
                                        <table class="table">
                                        <thead>
                            <tr>
                              <th>Full Name</th>
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Gender</th>
                              <th>DOB</th>
                              <th>Address</th>
                              <th>Image</th>
                              
                            </tr>
                          </thead>
                          <tbody>
                        <% while(rs2.next()){
						i++;%>
                          
                            <tr>
                               <td><%=rs2.getString(2)%></td>
                              <td><%=rs2.getString(3)%></td>
                              <td><%=rs2.getString(4)%></td>
                              <td><%=rs2.getString(6)%></td>
                              <td><%=rs2.getString(7)%></td>
                              <td><%=rs2.getString(8)%></td>
                             <td> <img src="<%=rs2.getString(9)%>" class="img-circle" alt="Responsive image" style="width: 50px;height: 50px"></td>
                            </tr>
                            <%}%>
                          </tbody>
                        </table>
					</div>
                  
            </div>

        </div>

    </div>
    
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
   

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
		
    })
	$(document).ready(function(){
    $('.popover').popover();   
});
    </script>

</body>

</html>

