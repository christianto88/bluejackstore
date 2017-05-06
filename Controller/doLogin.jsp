<%@include file="connect.jsp"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String remember=request.getParameter("remember");
	int online=0;
	if((String)session.getAttribute("usernameSession")==null){
	
	
		if(username == null || username == "" ){
			response.sendRedirect("../login.jsp?err= Username Cannot be empty");
		}
		else if(password == null || password == "" ){
			response.sendRedirect("../login.jsp?err= Password Cannot be empty");
		}
		else{
			String query="SELECT*FROM user WHERE fullName= '"+username+"' AND password='"+password+"'";
			ResultSet rs;
			rs=st.executeQuery(query);
			if(rs.next()){
			int role=rs.getInt("role");
						String i=(String)application.getAttribute("online");
					if(	i==null || i==""){
					application.setAttribute("online","1");
					}
					else{
					online=Integer.parseInt(i);
					online++;
					application.setAttribute("online",online+"");
					}
					session.setAttribute("roleSession",role);
					session.setAttribute("usernameSession",username);
					session.setAttribute("passwordSession",password);
					if(remember!=null){
					Cookie userCookie=new Cookie("usernameCookie",username);
					Cookie passCookie=new Cookie("passwordCookie",password);
					userCookie.setMaxAge(3600);
					passCookie.setMaxAge(3600);
					userCookie.setPath("/");
					passCookie.setPath("/");
					response.addCookie(userCookie);
					response.addCookie(passCookie);
					}
					response.sendRedirect("../index.jsp");
			}
			else{
			response.sendRedirect("../login.jsp?err= Username or Password Invalid");
			}
			
		}
	}
	else
	{
	response.sendRedirect("../index.jsp");
	}
	
	
%>