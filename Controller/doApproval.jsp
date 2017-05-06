
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date,java.text.*" errorPage="" %>
<%@ include file="connect.jsp"%>

<%
String id=request.getParameter("trans");
ResultSet rs;
Date date=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");
	String queryupdate="UPDATE transaction SET status='APPROVED',approvedDate='"+sdf.format(date)+"' WHERE transactionID='"+id+"' " ;
		st.executeUpdate(queryupdate);
	
		con.close();
		response.sendRedirect("../transaction.jsp");

%>