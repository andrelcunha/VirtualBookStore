<%-- 
    Document   : login_ngn
    Created on : Apr 19, 2017, 11:47:26 PM
    Author     : deko
--%>
<%@page import="DAO.UsuarioDAO"  %>
<%@page import="java.util.Enumeration"%>

<%
    String sUsr="";
    String sPwd="";
    Enumeration e = request.getParameterNames();
    while(e.hasMoreElements()){
        String temp=(String)e.nextElement();
        if (temp.equals("user"))
            sUsr=request.getParameter("user");
        else if(temp.equals("password"))
            sPwd=request.getParameter("password");
    }
    if (!((sUsr.equals(""))&&(sPwd.equals("")))){
        UsuarioDAO usrDao = new UsuarioDAO();
        int test_usr=usrDao.ConsultaUsuario(sUsr, sPwd);
        if(test_usr==1){
            session = request.getSession();
            session.setAttribute("user", sUsr);
            session.setMaxInactiveInterval(30*60); //30 minuts expiration
            Cookie userName = new Cookie("user", sUsr);
            userName.setMaxAge(30*60);
            userName.setPath("/");
            response.addCookie(userName);
            //Login ok message
            session.setAttribute("login_ok", "true");
            //response.sendRedirect("../LoginSuccess.jsp");
            //Get the encoded URL string
            String encodedURL = response.encodeURL("../index.jsp");
            response.sendRedirect(encodedURL);
        }
        else if(test_usr==0) {
        /*User and password doesn't match*/
        session.setAttribute("login_ok", "false");
        response.sendRedirect("../login.jsp");
        }
        else {
            System.out.println("Error. Cannot authenticate.");
        }
    }
    else{
        /*Do something if there is no user set up*/
        out.println("<Strong>ERRO</Strong>");
        }   
%>
