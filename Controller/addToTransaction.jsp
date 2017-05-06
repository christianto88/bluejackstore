<%@ include file="connect.jsp"%>
<%
ResultSet rs;
String grandtotal=request.getParameter("grandtotal");
String jlhdata=request.getParameter("data");
String user=(String)session.getAttribute("usernameSession");
String insertTransaksi="INSERT INTO transaction(customer,grandTotal) VALUES ('"+user+"','"+grandtotal+"')";
int transID=0;
int counter=0;
int jumlahdata=Integer.parseInt(jlhdata);
String[] productName=new String[jumlahdata];
int []qty=new int[jumlahdata];
st.executeUpdate(insertTransaksi);
String query="SELECT transactionID FROM transaction WHERE customer='"+user+"' ORDER BY transactionID DESC LIMIT 1";
rs=st.executeQuery(query);
while(rs.next()){
	transID=rs.getInt(1);
};
String getdata="SELECT productName,qty FROM cart WHERE customer='"+user+"'";
rs=st.executeQuery(getdata);
while(rs.next()){
	productName[counter]=rs.getString(1);
	qty[counter]=rs.getInt(2);
	counter++;
};
for(int i=0;i<jumlahdata;i++){
	String insertDetail="INSERT INTO transactionDetail VALUES ('"+transID+"','"+productName[i]+"','"+qty[i]+"')"; 
	st.executeUpdate(insertDetail);

}
	
	String delete="DELETE FROM cart WHERE customer=  '"+user+"' ";
	st.executeUpdate(delete);
		con.close();
		response.sendRedirect("../cart.jsp");

%>