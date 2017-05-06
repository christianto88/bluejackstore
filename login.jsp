<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   

    <title>BlueJack Store</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    

    
   
<style>
.form-control{
width:57%;}

</style>
    
  </head>

  <body>
  <%

Cookie [] myCookie=request.getCookies();
String username="";
String password="";
for(int i=0;i<myCookie.length;i++){
if(myCookie[i].getName().equals("usernameCookie")){
username=myCookie[i].getValue();
}else if(myCookie[i].getName().equals("passwordCookie")){
password=myCookie[i].getValue();
}
}
%>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" >
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">BlueJack Store</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="login.jsp">Login</a>
                    </li>
                    <li>
                        <a href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container" style="margin-top:55px">

      <form class="form-signin" action="Controller/doLogin.jsp" method="post" >
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="username" class="form-control" placeholder="Username" value="<%=username%>" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" value="<%=password%>" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remembered" name="remember"> Remember me
          </label>
        </div>
        <%  
                String errMess=request.getParameter("err");
                if(errMess!=null){%>
        <div class="alert alert-danger" role="alert">
                <strong>Oh snap! <%=errMess%></strong> 
                </div>
        <%}%>
        <button class="btn btn-lg btn-primary " type="submit">Sign in</button>
      </form>

    </div>  
  </body>
</html>


