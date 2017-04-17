<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<%@page import="DAO.EditoraDAO"%>

<%
EditoraDAO ed_dao1 = new EditoraDAO();
String[] ed_livro = ed_dao1.listaEditora();

%>
        <h2>Cadastrar Livro</h2>
        <form action="cadastrarlivro.jsp" method="POST" target="this">
            <input type="text" name="titulo" placeholder="Digite o título..."><br>
            <input type="text" name="autor" placeholder="Digite o autor..."><br>
            <input type="text" name="ano"   placeholder="Ano" size="5"><br>
            <input type="text" name="preco" placeholder="R$" size="7"><br>
            <label for="rbeditora">Editora:</label><br>
            <select name="editora">
                <%
                    for(int i=0;i<ed_livro.length;i++)
                    {
                        out.println(String.format("<option value=\"%s\">%s</option>",ed_livro[i],ed_livro[i]));
                    }
                %>
            </select><br>
            <input type="submit" value="Salvar">
     </form>
