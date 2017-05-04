<%-- 
    Document   : login
    Created on : Apr 16, 2017, 2:07:04 AM
    Author     : deko
--%>
<%@include file="templates/template.jsp" %>
<%@include  file="engine/login_flag.jsp" %>
<%@page import="java.util.Enumeration"%>

<%
    String msg="";
    if(login_ok.equals("false")){
        msg=String.format("<div id=\"msg\" class=\"alert alert-warning\">"
        + "    <strong>Usu�rio e senha n�o conferem!</strong>"
        + "    Tente novamente" 
        + "</div>");
    }
%>

<body>
    <%@include file="templates/smlheader.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-sm-6" style="padding: 20px;padding-left: 40px">
            <h2>Acesso � �rea administrativa</h2>
            <p>Efetue o login para ter acesso fun��es administrativas.</p>
            <form action="LoginNgn" method="POST">
             <div class="form-group">
                <label for="user">Nome:</label>
                <input type="text" class="form-control" id="user" name="user">
              </div>
              <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="password" name="password">
              </div>
              <div class="form-group">
                  <button type="submit" class="btn btn-black btn-block">Entrar</button>  
              </div>
            </form>
            <br>
            <%=msg%>
        </div>
        <div class="col-sm-1">
            <p>	&nbsp</p>
        </div>
        <div class="col-sm-4" style="padding: 20px">
            <br>
            <br>
            <b style="padding-top:40px; padding-bottom:40px">
                Caso n�o tenha login, entre em contato com o administrador.</b>
            <a href="index.jsp">
                <button type="button" class="btn btn-black btn-block" style="margin-top: 20px">
                Voltar</button>
            </a>
        </div>
        <div class="col-sm-1">
            <p>	&nbsp</p>
        </div>
    </div>
</div>
          
</body>
</html>