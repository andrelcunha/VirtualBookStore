<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
        <h2>Cadastrar Usuário</h2>
        <form action="engine/usuario_ngn.jsp" method="POST">
            <div class="form-group">
                <label for="nome" >Nome do usuário:</label>
                <input class="form-control" type="text" name="nome" id="nome" placeholder="Digite o Nome...">
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input class="form-control" type="password" name="senha" id="senha" placeholder="Digite a Senha...">
            </div>
            <input type="submit" value="Salvar" class="btn btn-default"><br>
        </form>
