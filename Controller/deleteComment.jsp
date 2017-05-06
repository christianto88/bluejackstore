<%@ include file="connect.jsp" %>
<%
String commentID=request.getParameter("commentID");
int a=Integer.parseInt(commentID);

String query="DELETE FROM comment WHERE commentID='"+a+"'";
st.executeUpdate(query);
response.sendRedirect("../product.jsp");
%>