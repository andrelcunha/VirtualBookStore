<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<jsp:useBean id="ldao1" class="DAO.LivroDAO"></jsp:useBean>
<jsp:useBean id="livro" class="domain.LivroDom">
    <jsp:setProperty name="livro" property="titulo" value=""/>
</jsp:useBean>
<jsp:useBean id="edao1"  class="DAO.EditoraDAO"></jsp:useBean>
<jsp:useBean id="editora" class="domain.EditoraDom"></jsp:useBean>
<%@page import="domain.LivroDom"%>
<%@page import="domain.EditoraDom"%>
<%@include file="/templates/template.jsp" %>
<%
LivroDom[] livros = ldao1.ConsultaLivroTitulo(livro);
EditoraDom[] editoras = edao1.listaEditora();

%>
<body>
        <h2>Atualizar Livro</h2>
        <br>
        <table class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Autor</th>
                    <th>Ano</th>
                    <th>Preço</th>
                    <th>Editora</th>
                    <th>Foto</th>
                </tr>
            </thead>
            <tbody>
            <%
            for(int i=0;i<livros.length;i++){%>
            <tr>
                <td><%=livros[i].getId()%></td>
                <td><%=livros[i].getTitulo().substring(0, 20)+"..." %></td>
                <td><% 
                    if (livros[i].getAutor().length()>20)
                        out.println(livros[i].getAutor().substring(0, 20)+"...");
                    else
                        out.println(livros[i].getAutor());
                    %></td>
                <td><%=livros[i].getAno()%></td>
                <td><%=String.format("%.2f",livros[i].getPreco()).replace(".", ",")%></td>
                <td><%=editoras[livros[i].getIdEditora()-1].getNome()%></td>
                <td><%=livros[i].getFoto()%></td>
            </tr>        
            <%}%>
            </tbody>
        </table>
            <%
//For debugging purposes.
                /*
                for (int i=0;i<editoras.length;i++){
            out.println("<p>"+editoras[i].getId()+" - "+editoras[i].getNome()+"</p>");
            }
*/
            %>
</body>