<%@ include file="connect.jsp"%>
<%

String produk=request.getParameter("productName");

if(produk==null||produk==""){
response.sendRedirect("../product.jsp?errmess=Product Name cannot be empty");
}
else
{
//DELETE FROM DATABASE

		String query = "DELETE FROM nike WHERE productName='"+produk+"' ";
		st.executeUpdate(query);
		con.close();
response.sendRedirect("../product.jsp");
}


%>