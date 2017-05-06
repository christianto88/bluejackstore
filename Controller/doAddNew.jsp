<%@ include file="connect.jsp"%>
<%
String user=(String)session.getAttribute("usernameSession");
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
ResultSet rs;
String proID="SELECT productID FROM nike ORDER BY productID DESC LIMIT 1;";
int id=0;
rs=st.executeQuery(proID);
	while(rs.next()){
		id=Integer.parseInt(rs.getString(1).substring(2));
		}
		id++;
		String newId="PR0"+id;
	String query = "INSERT INTO nike VALUES('"+produk+"','"+harga+"','"+stok+"','"+img+"','"+newId+"','"+weight+"','"+user+"')";
		
		st.executeUpdate(query);
		con.close();
response.sendRedirect("../product.jsp");
}


%>