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
ResultSet rs2;
ResultSet rs;
String query;
 int counter=0;
  int paging=0;
  int start=0;
    String[]product;
  String[]user;
%>
<% 

int ol;
        if(application.getAttribute("online") == null || Integer.parseInt((String)application.getAttribute("online")) <= 0) { 
            ol = 0;
        } else {
            ol = Integer.parseInt((String)application.getAttribute("online"));
     } %>

   <%
   if((Integer)session.getAttribute("roleSession") == 1){
   counter=0;
    query = "SELECT  transactionID FROM transaction "; 
rs=st.executeQuery(query); 
    while(rs.next()){
    counter++;
  };
   paging=counter/5+1;
   if(request.getParameter("pageid")!=null){
    
    start=Integer.parseInt(request.getParameter("pageid").toString())-1;
    }
    String querypaging="SELECT  transactionID,customer,approvedDate,status,grandTotal FROM transaction LIMIT "+5*start+",5";
    rs2=st.executeQuery(querypaging);

}
 else
 {
    counter=0;
    String user=(String)session.getAttribute("usernameSession");
    query = "SELECT  transactionID  FROM transaction WHERE  customer='"+user+"'"; 
    rs=st.executeQuery(query);
    while(rs.next()){
    counter++;
    };
    paging=counter/5+1;
    if(request.getParameter("pageid")!=null){
    
    start=Integer.parseInt(request.getParameter("pageid").toString())-1;
    }
    String querypaging="SELECT transactionID,customer,approvedDate,status,grandTotal FROM transaction WHERE  customer='"+user+"' LIMIT "+5*start+",5";
    rs2=st.executeQuery(querypaging);

}
    
   %>


     
     
     
          
                
   <!-- Page Content 
   
   -->
    <div class="container">

        <div class="row">
<p class="lead" id="pop" data-toggle="popover" data-container="body" data-placement="left"  data-content="<a href=profile.jsp>Hello , <%=(String)session.getAttribute("usernameSession")%></a>" title="User Online : <%=ol%>"  data-html="true"></p>
           
            <div class="col-lg-12 ">
                <h1>Your Transaction</h1>
                <%
                 while(rs2.next()){
                 String id=rs2.getString(1);
                %>
                
                
                <div class="row" style="border: 1px solid black">
                  <h2>TR0<%=rs2.getString(1)%>      <span style="float:right;">Customer : <%=rs2.getString(2)%> </span> </h2>
                  <span><b>Approved Date : <%=rs2.getString(3)%> <br>Status : <%=rs2.getString(4)%><br>
                  Grand Total : <%=rs2.getInt(5)%></b></span>
                  <table class="table">
                  <%
                    String a="SELECT productName,qty FROM transactiondetail WHERE  transactionID='"+id+"' ";
                    rs=st2.executeQuery(a);
                    while(rs.next()){
                  %>
                    <tr>
                      <td><%=rs.getString(1)%></td>
                      <td><%=rs.getInt(2)%></td>
                    </tr>
                  

                  <%}%>
                  </table>
                  <%if(rs2.getString(4).equals("NOT APPROVED")&&(Integer)session.getAttribute("roleSession") == 1 ){%>
                      <form action="Controller/doApproval.jsp?trans=<%=id%>" method="POST">
                      <button class="btn btn-md btn-primary ">Approve</button>
                      </form>
                 <% }%>
                  </div>
                <%}%>
                      <ul class="pagination">
                              <% for(int i=0;i<paging;i++){%>
              <li><a href="transaction.jsp?pageid=<%=i+1%> "><%=i+1%></a><li>
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

</body>

</html>

