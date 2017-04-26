<%-- 
    Document   : vertmenu
    Created on : Apr 16, 2017, 3:11:43 PM
    Author     : deko
--%>
<script>
function load_table() {
     document.getElementById("content").innerHTML='<object type="text/html" data="atualiza_livro.jsp" ></object>';
}

</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#home">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Livro<span class="caret"></span></a>
                    <ul class="dropdown-menu">    
                        <li><a data-toggle="pill" href="#cadastrar_livro">Cadastrar</a></li>
                        <li><a data-toggle="pill" href="#atualizar_livro" onclick="load_table()">Atualizar</a></li>
                    </ul>
              </li>
              <li><a data-toggle="pill" href="#editora">Editora</a></li>
              <li><a data-toggle="pill" href="#usuario">Usuário</a></li>
            </ul>
        </div>
        <div class="col-md-8">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <%@include file="/home_admin.jsp" %>
                </div>
                <div id="cadastrar_livro" class="tab-pane fade ">
                    <%@include file="/livro.jsp" %>
                </div>
                <div id="atualizar_livro" class="tab-pane fade ">
                    <div id="content">
                    </div>
                </div>
                <div id="editora" class="tab-pane fade">
                    <%@include file="/editora.jsp" %>
                </div>
                <div id="usuario" class="tab-pane fade">
                    <%@include file="/usuario.jsp" %>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div id="side_border" >
                <p></p>
            </div>
        </div>
    </div>
</div>    