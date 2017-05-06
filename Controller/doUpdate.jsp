<%@ include file="connect.jsp"%>
<%

String produk=request.getParameter("productName");
String harga=request.getParameter("price");
String stok=request.getParameter("stock");
String weight=request.getParameter("weight");
String img=request.getParameter("img");
boolean errorfoto=false;


if(img!=""){
	if(img.contains(".jpg")==false && img.contains(".png")==false){
	errorfoto=true;
	}
}


if(produk==null||produk==""){
response.sendRedirect("../product.jsp?errmess=Product Name cannot be empty");
}
else if(harga==null || harga==""){
response.sendRedirect("../product.jsp?errmess=Price cannot be empty");
}
else if(weight==null||weight==""){
response.sendRedirect("../product.jsp?errmess=Weight cannot be empty");
}
else if(stok==null || stok==""){
response.sendRedirect("../product.jsp?errmess=Stock cannot be empty");
}

else if(Integer.parseInt(stok) <=0){
response.sendRedirect("../product.jsp?errmess=Stock must be greater than 0");
}
else if(img==""){
response.sendRedirect("../product.jsp?errmess=Image cannot be empty");
}
else
{
//insert to DATABASE

		String query = "UPDATE nike SET qty='"+stok+"', weight='"+weight+"',img='"+img+"',price='"+harga+"' WHERE productName LIKE '%"+produk+"%'	"  ;
		
		st.executeUpdate(query);
		con.close();
response.sendRedirect("../product.jsp");
}


%>