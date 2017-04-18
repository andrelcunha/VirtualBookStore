<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<%@page import="DAO.EditoraDAO"%>
<%@page import="domain.EditoraDom"%>


<%
EditoraDAO ed_dao1 = new EditoraDAO();
EditoraDom[] ed_livros = ed_dao1.listaEditora();

%>
        <h2>Cadastrar Livro</h2>
        <form action="engine/livro_ngn.jsp" method="POST" target="this" enctype="multipart/form-data">
            <input type="text" name="titulo" placeholder="Digite o título..."><br>
            <input type="text" name="autor" placeholder="Digite o autor..."><br>
            <input type="text" name="ano"   placeholder="Ano" size="5"><br>
            <input type="text" name="preco" placeholder="" size="50" ><br>
            <input type="file" name="foto" placeholder="R$" size="7"><br>
            <label for="editora">Editora:</label><br>
            <select name="editora">
                <%
                    for(int i=0;i<ed_livros.length;i++)
                    {
                        out.println(String.format("<option value=\"%s\">%s</option>",Integer.toString(ed_livros[i].getId()),ed_livros[i].getNome()));
                    }
                %>
            </select><br>
            <input type="submit" value="Salvar">
     </form>
