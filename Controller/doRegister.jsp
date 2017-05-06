<%@ include file="connect.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.text.*,java.util.Date" errorPage="" %>
<%
String user=(String)session.getAttribute("usernameSession");
String fullname=request.getParameter("fullName");
String email=request.getParameter("email");
String password=request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String foto=request.getParameter("photo");
String status=request.getParameter("status");
boolean isNum=true;
boolean errorfoto=false;
boolean spaceError=false;
boolean nameError=false;
boolean passError=false;
boolean dateError=false;

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
//validasi fullname
	//cek spasi
if(!fullname.contains(" ")){
	spaceError=true;
}
else
{
spaceError=false;
}
	//cek alphabet
if(spaceError==false){
	
	char c;
	for(int i=0;i<fullname.length();i++){
		if(fullname.toLowerCase().charAt(i)!=' '){
			if(fullname.toLowerCase().charAt(i)<'a' || fullname.toLowerCase().charAt(i)>'z'){
				nameError=true;
			}
			else nameError=false;
		}

	}
}

//validasi password
for(int i=0;i<password.length();i++){
		if((password.toLowerCase().charAt(i)<'a' || password.toLowerCase().charAt(i)>'z') && (password.charAt(i)<'0' || password.charAt(i)>'9')){
			passError=true;
			break;
		}
	}
//validasi date
if( dob!="" )
	{
		Date date = null;
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            date = sdf.parse(dob);
            if (!dob.equals(sdf.format(date))) {
                dateError=true;
            }
        }
        
if(fullname==null||fullname==""){
response.sendRedirect("../register.jsp?errmess=Name cannot be empty");
}
else if(spaceError){
	response.sendRedirect("../register.jsp?errmess=Name must have space ");
}
else if(nameError){
	response.sendRedirect("../register.jsp?errmess=Name must be alphabet ");
}
else if(email==null || email==""){
response.sendRedirect("../register.jsp?errmess=Email cannot be empty");
}
else if(!email.matches("^[A-Za-z0-9]+@[A-Za-z0-9]+.com$")){
response.sendRedirect("../register.jsp?errmess=Email format is wrong");
}
else if(phone==null || phone==""){
response.sendRedirect("../register.jsp?errmess=Phone cannot be empty");
}
else if(isNum==false){
response.sendRedirect("../register.jsp?errmess=Phone must be number");
}
else if(password==null || password==""){
response.sendRedirect("../register.jsp?errmess=password cannot be empty");
}
else if(passError){
	response.sendRedirect("../register.jsp?errmess=password must be alphanumeric");
}
else if(confirmpassword==null || confirmpassword==""){
response.sendRedirect("../register.jsp?errmess=Confirm password cannot be empty");
}
else if(!password.equals(confirmpassword)){
response.sendRedirect("../register.jsp?errmess=Password and Confirm Password is not the same");
}
else if(gender==null || gender==""){
response.sendRedirect("../register.jsp?errmess=Gender cannot be empty");
}
else if(dob==null || dob==""){
response.sendRedirect("../register.jsp?errmess=DOB cannot be empty");
}
else if(dateError){
	response.sendRedirect("../register.jsp?errmess=Date is in wrong format");
}
else if(address==null || address==""){
response.sendRedirect("../register.jsp?errmess=Address cannot be empty");
}else if(foto==""){
response.sendRedirect("../register.jsp?errmess=Photo cannot be empty");

}
else if( errorfoto){
		response.sendRedirect("../register.jsp?errmess=File must be jpg or png format");
}

else
{
		
			//insert to DATABASE
				String query = "INSERT INTO user VALUES(null,'"+fullname+"','"+phone+"','"+email+"','"+password+"','"+gender+"','"+dob+"','"+address+"','"+foto+"',2)";
				
				st.executeUpdate(query);
				con.close();
		response.sendRedirect("../index.jsp");
		
		
		
		
}

	
%>