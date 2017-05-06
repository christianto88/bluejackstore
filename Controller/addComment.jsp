<%@ include file="connect.jsp" %>
<%
String produk=request.getParameter("produk");
String user=request.getParameter("user");
String status=request.getParameter("status");
String rating=request.getParameter("rating");
String comment=request.getParameter("comment");
String commentID=request.getParameter("commentID");

// validasi 
if(comment=="" || comment==null){
	response.sendRedirect("../comment.jsp?productID="+produk+"&errmess=comment must be filled");
}
else if(comment.length()>255){
	response.sendRedirect("../comment.jsp?productID="+produk+"&errmess=comment length exceed");
}
else if(rating=="" || rating==null){
	response.sendRedirect("../comment.jsp?productID="+produk+"&errmess=rating must be filled");
}
else if(Integer.parseInt(rating)<1 || Integer.parseInt(rating)>5){
	response.sendRedirect("../comment.jsp?productID="+produk+"&errmess=rating must between 1-5");
}
else
{
			if(status=="update"){
			//update comment
			String update="UPDATE comment SET comment='"+comment+"',rating='"+rating+"' WHERE commentID='"+commentID+"'";
			st.executeUpdate(update);
			response.sendRedirect("../product.jsp");
		}
		else if(status==null)
		{
		//insert new comment
		String insert="INSERT INTO comment VALUES ('"+produk+"','"+user+"','"+comment+"','"+rating+"',null)";
		st.executeUpdate(insert);
			response.sendRedirect("../product.jsp");
		}	
}


%>