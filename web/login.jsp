<%-- 
    Document   : login
    Created on : Apr 16, 2017, 2:07:04 AM
    Author     : deko
--%>
<%@include file="templates/template.jsp" %>
<%@page import="java.util.Enumeration"%>

<%
    String login_ok="";
    Enumeration e = session.getAttributeNames();
    while(e.hasMoreElements()){
        String temp=(String)e.nextElement();
        if (temp.equals("login_ok"))
            login_ok=session.getAttribute("login_ok").toString();
            session.removeAttribute("login_ok");
    }
%>
<script>
    $(document).ready(function(){
        login_ok;
    });
function login_ok(){
    
        var login_flag = ($("#login_flag")==='true');
        alert(login_flag);
        var msg="<div id=\"msg\" class=\"alert alert-danger\">";
        if (!login_flag){
            msg+= "<strong>Usuário e senha não conferem!</strong>"
            + "Tente novamente."; 
        }else{
            msg+= "Você já está autenticado.";
        }
        msg+="</div>";
        $("#msg").html(msg);
    
}
</script>
<body>
    <%@include file="templates/smlheader.jsp" %>
    
    
<div class="container" id="container">
    <div class="row">
        <div class="col-sm-6" style="padding: 20px;padding-left: 40px">
            <h2>Acesso à Área administrativa</h2>
            <p>Efetue o login para ter acesso funções administrativas.</p>
            <form action="LoginNgn" method="POST">
                <%="<input type=\"hidden\" id=\"login_flag\" value=\""+login_ok+"\">"%>
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
            <div id="msg">
            </div>
            
        </div>
        <div class="col-sm-1">
            <p>	&nbsp</p>
        </div>
        <div class="col-sm-4" style="padding: 20px">
            <br>
            <br>
            <b style="padding-top:40px; padding-bottom:40px">
                Caso não tenha login, entre em contato com o administrador.</b>
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