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
 int total;
 int grandtotal;
 ResultSet rs;
 %>
 <%
 String user=(String)session.getAttribute("usernameSession");
String produk=request.getParameter("productID");
String foto="";
String queryfoto="SELECT img FROM nike WHERE productID='"+produk+"'";
rs=st.executeQuery(queryfoto);
while(rs.next()){
  foto=rs.getString(1);
}
String query="SELECT user.fullName,comment.comment,comment.rating,user.image,comment.commentID FROM comment JOIN user ON user.fullName=comment.customerName WHERE comment.productID='"+produk+"'";
rs=st.executeQuery(query);

 %>
<% 
int ol;
        if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
            ol = 0;
        } else {
            ol = Integer.parseInt((String)application.getAttribute("online"));
     } %>

 
     
     
     
          
                
   <!-- Page Content 
   
   -->
    <div class="container">

        <div class="row">
<p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true"></p>
           
            


            <div class="col-lg-8 ">
               <img src="<%=foto%>">
               <h2>Comment</h2>      
               
                     <button  class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModaladd" style="margin-bottom:5px" >Add Comment</button>

               <%while(rs.next()){%>
                <div  style="border:2px solid red" class="row">
                  <div class="col-lg-3">
                  <img src="<%=rs.getString(4)%>" class="img-circle" alt="Responsive image" style="width: 100px;height: 100px">  
                  </div>

                  <div class="col-lg-4"  style="margin-top: 20px;">
                    User : <%=rs.getString(1)%><br>
                    Comment : <%=rs.getString(2)%><br>
                    Rating : <%=rs.getInt(3)%> star
                    
                  </div>
                  <% if(rs.getString(1).equals(user)){%>
                  <div class="col-lg-2">
                   
                                <button  class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModalupdate" style="margin-bottom:5px" >Update Comment</button>
                                <!--modal UPDATE comment-->
            <div class="modal fade" id="myModalupdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Update Comment</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/addComment.jsp?user=<%=user%>&produk=<%=produk%>&status=update&commentID=<%=rs.getInt(5)%>" method="post">
          <fieldset>
            
            <div class="control-group">
              <label class="control-label">Add Comment</label>
              <div class="controls">
                <input type="text" name="comment" placeholder="Product Name " class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label">Rating</label>
              <div class="controls">
                <input type="number"  name="rating" placeholder="Input Rating 1-5" class="form-control input-lg">
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
</div>
            <!--end of modal UPDATEcomment-->
                              
                  <form action="Controller/deleteComment.jsp?commentID=<%=rs.getInt(5)%>" method="post">
                                <button type="submit" class="btn btn-md btn-info " >Delete Comment</button>
                              </form>
                  </div>
                  
                  <%}%>
                  
                </div> 

               <%}%>
                    <%  
                String errMess=request.getParameter("errmess");
                if(errMess!=null){%>
        <div class="alert alert-danger" role="alert">
                <strong>Oh snap! <%=errMess%></strong> 
                </div>
        <%}%>
            </div>

        </div>

    </div>
    
    <!-- /.container -->
    <!--modal add comment-->
            <div class="modal fade" id="myModaladd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Comment</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/addComment.jsp?user=<%=user%>&produk=<%=produk%>" method="post">
          <fieldset>
            
            <div class="control-group">
              <label class="control-label">Add Comment</label>
              <div class="controls">
                <input type="text" name="comment" placeholder="Product Name " class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label">Rating</label>
              <div class="controls">
                <input type="number"  name="rating" placeholder="Input Rating 1-5" class="form-control input-lg">
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
</div>
            <!--end of modal add/update comment-->
             


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

