<%
	session.invalidate();
	int online =  Integer.parseInt((String)application.getAttribute("online"));
	online-=1;
	
	application.setAttribute("online", online + "");
	response.sendRedirect("index.jsp");
	
%>