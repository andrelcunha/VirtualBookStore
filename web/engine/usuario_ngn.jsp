<%-- 
    Document   : usuario_ngn
    Created on : Apr 16, 2017, 8:37:14 PM
    Author     : deko
--%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="domain.UsuarioDom" %>

<%
UsuarioDAO usr_dao = new UsuarioDAO();
UsuarioDom usuario  = new UsuarioDom();
boolean flag_OK=true;
while(request.getParameterNames().hasMoreElements()){
    String tmp=request.getParameterNames().nextElement().toString();
    flag_OK=(tmp.contentEquals("nome")&&flag_OK);
}

usuario.setNome(request.getParameter("nome"));
String senha = request.getParameter("senha");
String hidden = "";
if (flag_OK){
    usr_dao.SalvaUsuario(usuario);
}
%>

