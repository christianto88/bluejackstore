<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BlueJack Store</title>
</head>

<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">BlueJack Store</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <% if(session.getAttribute("roleSession") == null) { %>
        <li> <a href="register.jsp"> Register </a> </li>
        <li> <a href="login.jsp"> Login </a> </li>
        
        <% } else if((Integer)session.getAttribute("roleSession") == 2) {%>
        		<li> <a href="product.jsp"> Product  </a> </li>
        <li> <a href="member.jsp"> Member </a> </li>
        <li> <a href="transaction.jsp"> Transaction </a> </li>
        <li> <a href="cart.jsp"> Cart </a> </li>
        <li> <a href="profile.jsp"> Profile </a> </li>
        <li> <a href="logout.jsp"	> Logout </a> </li>
        
        
        <%}else if((Integer)session.getAttribute("roleSession") == 1) {%>
        	<li> <a href="product.jsp"> Product  </a> </li>
        <li> <a href="member.jsp"> Member </a> </li>
        <li> <a href="transaction.jsp"> Transaction </a> </li>
        <li> <a href="profile.jsp"> Profile </a> </li>
        <li> <a href="logout.jsp"	> Logout </a> </li>
		
		<%}%>
                    
                </ul>
                <div style="float:right ; margin-top:15px;"><%
        Date waktu = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd MMMM yyyy , hh:mm:ss a");
        
    %>         <span style="color:white"><%=sdf.format(waktu)%></span></div>
            <!-- /.navbar-collapse -->
            
        </div>
            </div>
           
        <!-- /.container -->
        
    </nav>
</body>
</html>
