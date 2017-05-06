<%@ include file="connect.jsp"%>
<%
String produk=request.getParameter("product");
String jlh=request.getParameter("qty");
String user=(String)session.getAttribute("usernameSession");
ResultSet rs;
int newjlh=0;
String queryjlh="SELECT qty FROM nike WHERE productName LIKE '"+produk+"'	";
rs=st.executeQuery(queryjlh);
	while(rs.next()){
		newjlh=rs.getInt(1);
		}
	newjlh=newjlh+Integer.parseInt(jlh);
	String queryupdate="UPDATE nike SET qty='"+newjlh+"' WHERE productName = '"+produk+"'	"  ;
		st.executeUpdate(queryupdate);
	String delete="DELETE FROM cart WHERE productName = '"+produk+"' AND customer='"+user+"' ";
	st.executeUpdate(delete);
		con.close();
		response.sendRedirect("../cart.jsp");

%>