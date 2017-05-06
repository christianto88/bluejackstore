<%@ include file="navbar.jsp"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date"  errorPage="" %>

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
 int total;
 int grandtotal;;
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
    String query = "SELECT  cart.productName, cart.qty,nike.price,nike.img FROM cart INNER JOIN nike ON nike.productName=cart.productName WHERE customer = '"+user+"' ";

    rs2=st.executeQuery(query);
    
   %>


     
     
     
          
                
   <!-- Page Content 
   
   -->
    <div class="container">

        <div class="row">
<p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true"></p>
           
            <div class="col-md-8 col-md-offset-2">
                <div class="row">
                <h1>Your Cart</h1>
                

                   
                    <table class="table">
                    <thead>
                    <th>Image</th>
                      <th>Product Name</th>
                      <th>Quantity</th>
                      <th>Total Price</th>

                    </thead>
                          <tbody>
                       <% 
                        total=0;grandtotal=0;
                        int jlhdata=0;
                       while(rs2.next()) {
                       total=rs2.getInt(2)*rs2.getInt(3);
                       grandtotal=grandtotal+total;
                       jlhdata++;
                       %>
                            <tr>
                            <td><img src="<%=rs2.getString(4)%>" /></td>
                              <td><%=rs2.getString(1)%></td>
                              <td><%=rs2.getInt(2)%></td>
                              <td><%=total%></td>
                              <form action="Controller/deleteFromCart.jsp?product=<%=rs2.getString(1)%>&qty=<%=rs2.getInt(2)%>" method="post" ><td><button class="btn btn-md btn-primary"  type="submit" >Delete From Cart</button></td>
                              </form>

                            </tr>
                            <%}%>
                            <tr>
                            <td>Grandtotal : </td>
                            <td><%=grandtotal%></td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                    <form action="Controller/addToTransaction.jsp?data=<%=jlhdata%>&grandtotal=<%=grandtotal%>" method="post">
                    <button class="btn btn-md btn-primary "  type="submit" data-toggle="modal" data-target="#myModal" style="margin-bottom:5px">Complete Payment </button><br /></form>

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

