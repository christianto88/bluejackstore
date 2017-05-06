<%@ include file="connect.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.lang.*" errorPage="" %>
<%
String user=(String)session.getAttribute("usernameSession");
String email=request.getParameter("email");
String oldpassword=request.getParameter("oldpass");
String password=request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String foto=request.getParameter("photo");
ResultSet rs;
boolean isNum=true;
boolean errorfoto=false;
boolean passError=false;
String oldpass="";
String query1="SELECT Password FROM user WHERE fullName='"+user+"'";
rs=st.executeQuery(query1);
while(rs.next()){
	oldpass=rs.getString(1);
};
//validasi foto
if(foto!=""){
	if(foto.contains(".jpg")==false && foto.contains(".png")==false){
	errorfoto=true;
	}
}
//validasi phone
for(int i=0;i<phone.length();i++){
		if(phone.charAt(i)>=48 && phone.charAt(i)<57 ){
		isNum=true;
		}
		else{
			isNum=false;
			break;		
		}
}


 if(email==null || email==""){
response.sendRedirect("../profile.jsp?errmess=Email cannot be empty");
}
else if(!email.matches("^[A-Za-z0-9]+@[A-Za-z0-9]+.com$")){
response.sendRedirect("../profile.jsp?errmess=Email format is wrong");
}
else if(phone==null || phone==""){
response.sendRedirect("../profile.jsp?errmess=Phone cannot be empty");
}
else if(isNum==false){
response.sendRedirect("../profile.jsp?errmess=Phone must be number");
}
else if(oldpassword.equals(oldpass)==false){
	response.sendRedirect("../profile.jsp?errmess=Old password is wrong");
}
else if(password==null || password==""){
response.sendRedirect("../profile.jsp?errmess=password cannot be empty");
}
else if(confirmpassword==null || confirmpassword==""){
response.sendRedirect("../profile.jsp?errmess=Confirm password cannot be empty");
}
else if(!password.equals(confirmpassword)){
response.sendRedirect("../profile.jsp?errmess=Password and Confirm Password is not the same");
}
else if(address==null || address==""){
response.sendRedirect("../profile.jsp?errmess=Address cannot be empty");
}else if(foto==""){
response.sendRedirect("../profile.jsp?errmess=Photo cannot be empty");
}
else if( errorfoto){
		response.sendRedirect("../profile.jsp?errmess=File must be jpg or png format");
}
else{

		//update profile
		String query = "UPDATE user SET Phone='"+phone+"',Email='"+email+"',Password='"+password+"',Address='"+address+"',Image='"+foto+"' WHERE fullName LIKE '%"+user+"%'	"  ;
		
		st.executeUpdate(query);
		con.close();
			response.sendRedirect("../profile.jsp");
}	
%>