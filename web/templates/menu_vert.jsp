<%-- 
    Document   : vertmenu
    Created on : Apr 16, 2017, 3:11:43 PM
    Author     : deko
--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#home">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Livro<span class="caret"></span></a>
                    <ul class="dropdown-menu">    
                        <li><a data-toggle="pill" href="#cadastra_livro">Cadastrar</a></li>
                        <li><a data-toggle="pill" href="#atualiza_livro">Atualizar</a></li>
                    </ul>
              </li>
              <li><a data-toggle="pill" href="#cadastra_editora">Editora</a></li>
              <li><a data-toggle="pill" href="#cadastra_usuario">Usuário</a></li>
            </ul>
        </div>
        <div class="col-md-8">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <%@include file="/home_admin.jsp" %>
                </div>
                <div id="cadastra_livro" class="tab-pane fade ">
                    <%@include file="/cadastra_livro.jsp" %>
                </div>
                <div id="atualiza_livro" class="tab-pane fade">
                    <%@include file="/atualiza_livro.jsp" %>
                </div>
                <div id="cadastra_editora" class="tab-pane fade">
                    <%@include file="/cadastra_editora.jsp" %>
                </div>
                <div id="cadastra_usuario" class="tab-pane fade">
                    <%@include file="/cadastra_usuario.jsp" %>
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