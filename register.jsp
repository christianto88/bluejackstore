<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.text.*,java.lang.*"  errorPage="" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 <link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <!-- Page Content -->
    <div class="container" style="margin-top:55px">

       <div class="row">
  	<div class="col-md-6">
    
          <form class="form-horizontal" action="Controller/doRegister.jsp" method="post">
          <fieldset>
            <div id="legend">
              <legend class="">Register</legend>
            </div>
            <div class="control-group">
              <label class="control-label">Full Name</label>
              <div class="controls">
                <input type="text" name="fullName" placeholder="Full Name" class="form-control input-lg">
                <p class="help-block">Full Name must be filled with alphabet and space</p>
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" for="email">E-mail</label>
              <div >
                <input type="email" id="email" name="email" placeholder="Email" class=" input-lg">
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
              <label class="control-label" >Password</label>
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
              <label class="control-label" style="margin-right:15px">Gender</label> 
              <input type="radio" name="gender" value="Male"/>Male &nbsp &nbsp
              <input type="radio" name="gender" value="Female"/>Female
            </div>
       
              <div class="control-group">
              <label class="control-label" >Date of Birth</label>
              <div class="controls">
                <input type="date"  name="dob" class="form-control input-lg">
                
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
            </div><br />
           <%  
                String errMess=request.getParameter("errmess");
                if(errMess!=null){%>
        <div class="alert alert-danger" role="alert">
                <strong>Oh snap! <%=errMess%></strong> 
                </div>
        <%}%>
                <br />
         
            <div class="control-group">
              <!-- Button -->
              <div class="controls">
                <button class="btn btn-success">Register</button>
              </div>
            </div>
          </fieldset>
        </form>
    
    </div> 
  </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Bluejack Store 2016</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    

   
</body>

</html>

