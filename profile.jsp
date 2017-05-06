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
<% 

int ol;
        if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
            ol = 0;
        } else {
            ol = Integer.parseInt((String)application.getAttribute("online"));
     } %>

   <%
String user=(String)session.getAttribute("usernameSession");

  String query = "SELECT * FROM user where fullName = '"+user+"'";
    rs2=st.executeQuery(query);
   

    %>


     
     
     
          
                
   <!-- Page Content 
   
   -->
    <div class="container">

        <div class="row">
<p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true"></p>
           
            <div class="col-md-6 col-md-offset-3">
                <div class="row">
                <h1>Profile</h1>
                 <% while(rs2.next()) {%>

                   <img src="<%=rs2.getString(9)%>" class="img-circle" alt="Responsive image" style="width: 200px;height: 200px">
              <br><br>
                                        <table class="table">
                          <tbody>
                      
                            <tr>
                               <td>Name : </td>
                              <td><%=rs2.getString(2)%></td>
                            </tr>
                             <tr>
                               <td>Phone : </td>
                              <td><%=rs2.getString(3)%></td>
                            </tr>
                             <tr>
                               <td>Email : </td>
                              <td><%=rs2.getString(4)%></td>
                            </tr>
                             <tr>
                               <td>Gender : </td>
                              <td><%=rs2.getString(6)%></td>
                            </tr>
                             <tr>
                               <td>DOB : </td>
                              <td><%=rs2.getString(7)%></td>
                            </tr>
                             <tr>
                               <td>Address : </td>
                               <td><%=rs2.getString(8)%></td>
                            </tr>
                            <%}%>
                          </tbody>
                        </table>
                    </div>
                    <button class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModal" style="margin-bottom:5px">Edit Profile</button><br />
                    <%  
                String errMess=request.getParameter("errmess");
                if(errMess!=null){%>
        <div class="alert alert-danger" role="alert">
                <strong>Oh snap! <%=errMess%></strong> 
                </div>
        <%}%>

                    <!-- MODAL EDIT PROFILE -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Profile</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/doUpdateProfile.jsp" method="post">
          <fieldset>
            
         
            <div class="control-group">
              <label class="control-label" for="email">E-mail</label>
              <div class="controls">
                <input type="email" id="email" name="email" placeholder="Email" class="form-control input-lg">
                <p class="help-block">Please provide your E-mail</p>
              </div>
            </div>
            
             <div class="control-group">
              <label class="control-label">Phone</label>
              <div class="controls">
                <input type="text" name="phone" placeholder="Phone" class="form-control input-lg">
                <p class="help-block">Please provide your Phone</p>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" >Old Password</label>
              <div class="controls">
                <input type="password"  name="oldpass" placeholder=" Old Password" class="form-control input-lg">
                
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" > New Password</label>
              <div class="controls">
                <input type="password"  name="password" placeholder="Password" class="form-control input-lg">
                <p class="help-block">Password should be alphanumeric</p>
              </div>
            </div>
            
               <div class="control-group">
              <label class="control-label" >Confirm Password</label>
              <div class="controls">
                <input type="password"  name="confirmpassword" placeholder="Confirm Password" class="form-control input-lg">
              </div>
            </div>
            
                <div class="control-group">
              <label class="control-label" >Addresss</label>
              <div class="controls">
                <input type="text"  name="address" class="form-control input-lg">
                
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" >Photo</label>
              <div class="controls">
                <input type="file"  name="photo" class="form-control  accept=".jpg,.png" input-lg">
                
              </div>
            </div>
           
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" actio>Save changes</button>
      </div>
     
         
          </fieldset>
        </form>
      </div>
      
      
    </div>
  </div>
</div><!--end of modal EDIT PROFILE-->
                  
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

</body>

</html>

