<%-- 
    Document   : books
    Created on : Apr 16, 2017, 11:29:25 AM
    Author     : deko
--%>
<%@page import="DAO.LivroDAO" %>
<%@page import="domain.LivroDom" %>
<%
LivroDAO ldao= new LivroDAO();
LivroDom livro = new LivroDom();
livro.setTitulo("");
LivroDom[] livros= ldao.ConsultaLivroTitulo(livro);
String open_row="<div class=\"container\"><div class=\"row\">";
String close_row="</div></div><br>";
String result="";
int i=0;
boolean flag_ok=true;
while (flag_ok){
    result+=open_row;
    for(int j=0;j<3;j++){
        result+="<div class=\"col-sm-4\"><div class=\" \">";
        result+="<div class=\"\">";
        if(i<livros.length){
            String titulo=livros[i].getTitulo();
            result+="<img src=\"assets/"+ livros[i].getFoto() +"\"";
            result+="class=\"img-responsive\"";
            result+="style=\"width:100%\" alt=\""+titulo+"\"></div>";
            result+="<div>"+titulo+"</div>";
            result+=String.format("<div><p class\"preco\">R$ %.2f</p></div>",livros[i].getPreco());
            i++;
        }else{
            flag_ok=false;
            result+="<img src=\"images/placeholder.png\"";
            result+="class=\"img-responsive\"";
            result+="style=\"width:100%\" alt=\"\"></div>";
            result+="<div></div>";
            result+="<div><p class\"preco\"></p></div>";
        }
        result+="</div></div>";

    }
    result+=close_row;
}

%>

<%=result%>
<br>

