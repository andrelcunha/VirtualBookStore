<%-- 
    Document   : valida
    Created on : Apr 19, 2017, 11:47:26 PM
    Author     : deko
--%>
<%@page import="java.util.Enumeration"%>
<%@page import="DAO.UsuarioDAO"  %>
<%
    String usuario=null;
    String senha=null;
    Enumeration e = request.getParameterNames();
    while(e.hasMoreElements()){
        String temp=(String)e.nextElement();
        if (temp.equals("usuario"))
            usuario=request.getParameter("usuario");
        else if(temp.equals("senha"))
            senha=request.getParameter("senha");
    }
    UsuarioDAO usrDao = new UsuarioDAO();
    
    if(usrDao.ConsultaUsuario(usuario, senha)){
        session = request.getSession();
        session.setAttribute("user", usuario);
        session.setMaxInactiveInterval(30*60); //30 minuts expiration
        Cookie userName = new Cookie("user", usuario);
        userName.setMaxAge(30*60);
        userName.setPath("/");
        response.addCookie(userName);
        //response.sendRedirect("../LoginSuccess.jsp");
        //Get the encoded URL string
        String encodedURL = response.encodeURL("../LoginSuccess.jsp");
        response.sendRedirect(encodedURL);
    }
    
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Senha incorreta!</h1>
        <br>
        <h2><%=usuario%></h2>
        
        <h2><%=senha%></h2>
    </body>
</html>
