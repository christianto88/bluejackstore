<%@ include file="Controller/connect.jsp"%>
<%@ include file="navbar.jsp"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date" errorPage="" %>


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
<%!int i=0;%>
<% int ol;
		if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
			ol = 0;
		} else {
			ol = Integer.parseInt((String)application.getAttribute("online"));
	 } %>
    
<% 
	int counter=0;
	int paging=0;
	int start=0;
	ResultSet rs2;
	String search=request.getParameter("search");
	if(request.getParameter("search")!=null)
	{
		String querysearch="SELECT * FROM nike where productName LIKE '%"+search+"%'";
		rs2=st.executeQuery(querysearch);
		while(rs2.next()){
		counter++;
			}
		paging=counter/5+1;
		if(request.getParameter("pageid")!=null){
		
		start=Integer.parseInt(request.getParameter("pageid").toString())-1;
		}
		String querypaging="SELECT * FROM nike  where productName LIKE '%"+search+"%'  LIMIT "+5*start+",5";
		rs2=st.executeQuery(querypaging);
	}
	
	else
	{
		counter=0;
		String query = "SELECT * FROM nike";
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
		counter++;
			}
		paging=counter/5+1;
		if(request.getParameter("pageid")!=null){
		
		start=Integer.parseInt(request.getParameter("pageid").toString())-1;
		}
		String querypaging="SELECT * FROM nike LIMIT "+5*start+",5";
		rs2=st.executeQuery(querypaging);
	}
	
	int id;
	
%>


     
     
     
          
                
   <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true">BlueJack Store</p>
                <div class="list-group">
                   
                    <div class="list-group-item">
                    <form action="product.jsp" method="post">
                    <input type="text" placeholder="Search" name="search"/>
                    <button class="btn btn-md btn-primary" aria-label="Left Align" type="submit" value="Search" >
                      <span class="glyphicon glyphicon-search" aria-hidden="true" </span>
                    </button>
					</form>
                    </div>
                    
                </div>

                <%if((Integer)session.getAttribute("roleSession") == 1) {%>
					<button class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModal" style="margin-bottom:5px">Add New Product</button><br />
                    <button  class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModalupdate" style="margin-bottom:5px">Edit Product</button><br />
                    <button class="btn btn-md btn-primary "  type="button" data-toggle="modal" data-target="#myModaldelete" style="margin-bottom:5px">Delete Product</button><br />
                    
                 
                    
                    <!-- MODAL add -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add New Product</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/doAddNew.jsp" method="post">
          <fieldset>
            
            <div class="control-group">
              <label class="control-label">Product Name</label>
              <div class="controls">
                <input type="text" name="productName" placeholder="Product Name " class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label">Price</label>
              <div class="controls">
                <input type="number"  name="price" placeholder="Price" class="form-control input-lg">
                  </div>
            </div>
            
             <div class="control-group">
              <label class="control-label">Weight</label>
              <div class="controls">
                <input type="number" name="weight" placeholder="Weight" class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" >Stock</label>
              <div class="controls">
                <input type="number"   name="stock" placeholder="Stock" class="form-control input-lg">
              </div>
            </div>
            
               <div class="control-group">
              <label class="control-label" >Image</label>
              <div class="controls">
                <input type="file"  name="img"  class="form-control input-lg">
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
</div><!--end of modal add-->

<!-- MODAL UPDATE -->
                    <div class="modal fade" id="myModalupdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Edit Product</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/doUpdate.jsp" method="post">
          <fieldset>
            
            <div class="control-group">
              <label class="control-label">Product Name</label>
              <div class="controls">
                <input type="text" name="productName" placeholder="Product Name " class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label">Price</label>
              <div class="controls">
                <input type="number"  name="price" placeholder="Price" class="form-control input-lg">
                  </div>
            </div>
            
             <div class="control-group">
              <label class="control-label">Weight</label>
              <div class="controls">
                <input type="number" name="weight" placeholder="Weight" class="form-control input-lg">
              </div>
            </div>
         
            <div class="control-group">
              <label class="control-label" >Stock</label>
              <div class="controls">
                <input type="number"   name="stock" placeholder="Stock" class="form-control input-lg">
              </div>
            </div>
            
               <div class="control-group">
              <label class="control-label" >Image</label>
              <div class="controls">
                <input type="file"  name="img"  class="form-control input-lg">
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
</div><!--end of modal UPDATE-->

<!-- MODAL delete -->
                    <div class="modal fade" id="myModaldelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Delete Product</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Controller/doDelete.jsp" method="post">
          <fieldset>
            
            <div class="control-group">
              <label class="control-label">Product Name</label>
              <div class="controls">
                <input type="text" name="productName" placeholder="Product Name " class="form-control input-lg">
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
</div><!--end of modal delete-->

					<%}%>
          <%  
                String errMess=request.getParameter("errmess");
                if(errMess!=null){%>
        <div class="alert alert-danger" role="alert">
                <strong>Oh snap! <%=errMess%></strong> 
                </div>
        <%}%>
            </div>
			<div class="col-md-9">
                <div class="row">
                                        <table class="table">
                                        <thead>
                            <tr>
                              <th>Product ID </th>
                              <th>Name</th>
                              <th>Price</th>
                              <th>Availability</th>
                              <th>Weight</th>
                              <th>Image</th>
                              
                            </tr>
                          </thead>
                          <tbody>
                        <%	
						        while(rs2.next()){
								i++;%>
                          
                            <tr>
                               <td><%=rs2.getString(5)%></td>
                              <td><%=rs2.getString(1)%></td>
                              <td><%=rs2.getString(2)%></td>
                              <td><%=rs2.getInt(3)%></td>
                              <td><%=rs2.getInt(6)%></td>
                              <td><img src="<%=rs2.getString(4)%>" /></td>
                              <td><%if((Integer)session.getAttribute("roleSession") != 1){%>
                              <form action="Controller/addToCart.jsp?product=<%=rs2.getString(1)%>" method="post">
                              QTY : <input type="text" name="qty"/><button type="submit" class="btn btn-md btn-primary " >Add to Cart</button>
                              </form> <%}%>
                              <form action="comment.jsp?productID=<%=rs2.getString(5)%>" method="post">
                                <button type="submit" class="btn btn-md btn-info " ><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></button>
                              </form>
                              </td>
                              
                            </tr>
                            <%}%>
                          </tbody>
                        </table>
					
                    
                   

                </div>
                    <ul class="pagination">
                              <% for(int i=0;i<paging;i++){%>
          		<li><a href="product.jsp?pageid=<%=i+1%> "><%=i+1%></a><li>
          		<%}%>                 
                    </ul>
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

