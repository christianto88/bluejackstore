<%@ include file="navbar.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.text.*" errorPage="" %>

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
    <link href="css/half-slider.css" rel="stylesheet">

  <script>
  $(document).ready(function(){
   $("[data-toggle=popover]").popover('show');
     $("[data-toggle=popover]").css("width:20px");
});
  </script>
</head>

<body>

    

    <!-- Half Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/adidas-Stellar-pack-Ace-Pogba.jpg');"></div>
                
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/Messi-10-10-2016-adidas.jpg');"></div>
                
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/Vardy-Mahrez-Hypervenom.jpg');"></div>
               
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
             </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
    
            <div class="col-lg-12">
            <% int ol;
			
			
		if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
			ol = 0;
		} else {
			ol = Integer.parseInt((String)application.getAttribute("online"));
	 } %>
          <%
            String user;
            if((String)session.getAttribute("usernameSession")==null){
            user="guest";%>
            <h1 id="pop" data-toggle="popover" data-container="body" data-placement="left" data-content="<a href=#>Hello <%=user%></a>" title="User Online : <%=ol%>" data-html="true" >BlueJack Store</h1>
            <%}
            else
            {
            user=(String)session.getAttribute("usernameSession");%>
            <h1 id="pop" data-toggle="popover" data-container="body" data-placement="left" data-content="<a href=profile.jsp>Hello <%=user%></a>" title="User Online : <%=ol%>" data-html="true" >BlueJack Store</h1>
            <%}%>
          
                
                     
                <p>Welcome to BlueJack Store BlueJack Store is established in 2016.Our main goal is to provide customer with the latest sports products from various brands with affordable price. Register yourself and happy shopping!</p>
         
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

