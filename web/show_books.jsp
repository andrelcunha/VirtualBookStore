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
    result+="<div class=\"container\">";
    String open_row="<div class=\"row\">";
    String close_row="</div>";
    int i=0;
    int row_size=4;
    int col_size=12/row_size;
    boolean flag_ok=true;
    while (flag_ok){
        result+=open_row;
        for(int j=0;j<row_size;j++){
            result+="<div class=\"col-sm-"+col_size+"\">";
            result+="<div class=\"imgBook\">";
            if(i<livros.length){
                String titulo=livros[i].getTitulo();
                result+="<img src=\"assets/pics/"+ livros[i].getFoto() +"\"";
                result+="class=\"img-responsive\"";
                result+="style=\"width:100%\" alt=\""+titulo+"\"></div>";
                result+="<div class=\"titulo\">"+titulo+"</div>";
                String tmp=String.format("%.2f",livros[i].getPreco()).replace(".", ",");
                result+="<div class=\"preco\">R$ "+tmp+"</div>";
                i++;
                if((i==livros.length)&&(j==2))
                    flag_ok=false;
            }else{
                flag_ok=false;
                result+="<img src=\"images/placeholder.png\"";
                result+="class=\"img-responsive\"";
                result+="style=\"width:100%\" alt=\"\"></div>";
                result+="<div></div>";
                result+="<div></div>";
            }
            result+="</div>";

        }
        result+=close_row;
    }
    result+="</div>";
}else{
    System.out.println("Connection failure.");
}
con.close();
%>

<%=result%>
<br>

