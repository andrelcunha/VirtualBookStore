<%-- 
    Document   : menu
    Created on : Apr 16, 2017, 2:08:59 AM
    Author     : deko
--%>

<%
String btnLogin="";
String btnAdmin="";
String user = "";
String userName = "";
String sessionID = null;
if(session.getAttribute("user") == null){
	//response.sendRedirect("index.jsp");
}else user = (String) session.getAttribute("user");
Cookie[] cookies = request.getCookies();
if(cookies !=null){
    for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")) 
                userName = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) 
                sessionID = cookie.getValue();
    }
}


if(!((user.equals(""))&&(userName.equals("")))){
    btnAdmin = "<li class=\"dropdown\">"
            + "<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" "
            + "href=\"#\">Administrar<span class=\"caret\"></span></a>"
            + "<ul class=\"dropdown-menu\">"
            + "<li><a href=\"?content=cad_u\">Cadastrar Usuário</a></li>"
            + "<li><a href=\"?content=cad_e\">Cadastrar Editora</a></li>"
            + "<li><a href=\"index.jsp?content=cad_l\">Cadastrar Livro</a></li>"
            + "<li><a href=\"index.jsp?content=atu_l\">Atualizar Livro</a></li></ul></li>";                    
    btnLogin ="<li><a href=\"logout.jsp\">"+userName+" <span class=\"glyphicon glyphicon-log-out\"></span></a></li>";
}
else{
    btnLogin ="<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>";
}

%>    
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#"><span class="glyphicon"><img src="images/book-stack-thumb_inverted.png" class="img-responsive logo_thumb"></span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" >
      <ul class="nav navbar-nav" >
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="#">Produtos</a></li>
        <li><a href="#">Promoções</a></li>
        <li><a href="#">Contato</a></li>
        <%=btnAdmin%>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <%=btnLogin%>
      </ul>
    </div>
  </div>
</nav>
