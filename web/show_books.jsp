<%-- 
    Document   : books
    Created on : Apr 16, 2017, 11:29:25 AM
    Author     : deko
--%>
<%@page import="DAO.LivroDAO" %>
<%@page import="connectionfactory.connection"%>
<%@page import="domain.LivroDom" %>
<%
LivroDAO ldao= new LivroDAO();
connection con = new connection();
String result="";
if (con.connect()){
    LivroDom livro = new LivroDom();
    livro.setTitulo("");
    ldao.setConnection(con.getCon());
    while(request.getParameterNames().hasMoreElements()){
        String tmp=request.getParameterNames().nextElement().toString();
        if(tmp.contentEquals("buscar")){
            livro.setTitulo(request.getParameter(tmp).toString());
            break;
        }
    }
    LivroDom[] livros= ldao.ConsultaLivro(livro);
    String open_row="<div class=\"container\"><div class=\"row\">";
    String close_row="</div></div><br>";
    int i=0;
    boolean flag_ok=true;
    while (flag_ok){
        result+=open_row;
        for(int j=0;j<3;j++){
            result+="<div class=\"col-sm-4\"><div class=\" \">";
            result+="<div class=\"\">";
            if(i<livros.length){
                String titulo=livros[i].getTitulo();
                result+="<img src=\"assets/pics/"+ livros[i].getFoto() +"\"";
                result+="class=\"img-responsive\"";
                result+="style=\"width:100%\" alt=\""+titulo+"\"></div>";
                result+="<div class=\"titulo\">"+titulo+"</div>";
                String tmp=String.format("%.2f",livros[i].getPreco()).replace(".", ",");
                result+="<div><p class=\"preco\">R$ "+tmp+"</p></div>";
                i++;
                if((i==livros.length)&&(j==2))
                    flag_ok=false;
            }else{
                flag_ok=false;
                result+="<img src=\"images/placeholder.png\"";
                result+="class=\"img-responsive\"";
                result+="style=\"width:100%\" alt=\"\"></div>";
                result+="<div></div>";
                result+="<div><p></p></div>";
            }
            result+="</div></div>";

        }
        result+=close_row;
    }
}else{
    System.out.println("Connection failure.");
}
con.close();
%>

<%=result%>
<br>

