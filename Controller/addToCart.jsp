<%@ include file="connect.jsp"%>
<%
String pembeli=(String)session.getAttribute("usernameSession");
String produk=request.getParameter("product");
String jlh=request.getParameter("qty");
boolean duplicate=false;
int newjlh=0; 
int a=0;
ResultSet rs;
String queryjlh="SELECT qty FROM nike WHERE productName LIKE '%"+produk+"%'	";
rs=st.executeQuery(queryjlh);
while(rs.next()){
	newjlh=rs.getInt(1);
};
//validate qty 
if(jlh==null || jlh==""){
	response.sendRedirect("../product.jsp?errmess=Please input qty");
}
else if(Integer.parseInt(jlh) > newjlh){
			response.sendRedirect("../product.jsp?errmess=Stok tidak mencukupi");
}
else
{
			//insert to cart
			String cekDB="SELECT qty FROM cart WHERE productName='"+produk+"' AND customer='"+pembeli+"' ";
			rs=st.executeQuery(cekDB);
			while(rs.next()){
				a=rs.getInt(1);
				duplicate=true;
			};
			if(duplicate==true)
			{
					a=a+Integer.parseInt(jlh);
				 	String addQty="UPDATE cart SET qty='"+a+"' WHERE productName='"+produk+"' AND customer='"+pembeli+"'  ";
				 	st.executeUpdate(addQty);
				 	newjlh=newjlh-Integer.parseInt(jlh);
			}
			else
			{
					String query = "INSERT INTO cart VALUES('"+pembeli+"','"+produk+"','"+jlh+"',null)";
					newjlh=newjlh-Integer.parseInt(jlh);
					st.executeUpdate(query);
			}
					String queryupdate="UPDATE nike SET qty='"+newjlh+"' WHERE productName LIKE '%"+produk+"%'	"  ;
					st.executeUpdate(queryupdate);
					con.close();
					response.sendRedirect("../product.jsp");

}



%>