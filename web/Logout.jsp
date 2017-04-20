<%-- 
    Document   : Logout
    Created on : Apr 20, 2017, 12:18:56 AM
    Author     : deko
--%>
<%
       
    	response.setContentType("text/html");
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
            for(Cookie cookie : cookies){
    		if(cookie.getName().equals("JSESSIONID")){
    			System.out.println("JSESSIONID="+cookie.getValue());
    			break;
    		}
            }
    	}
    	//invalidate the session if exists
    	session = request.getSession(false);
    	System.out.println("User="+session.getAttribute("user"));
    	if(session != null){
    		session.invalidate();
    	}
    	response.sendRedirect("login.jsp");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
