<%-- 
    Document   : editora_ngn
    Created on : Apr 16, 2017, 8:36:46 PM
    Author     : deko
--%>

<%@page import="DAO.EditoraDAO"%>
<%@page import="domain.EditoraDom" %>
<%
//boolean flag_nomeOK =false;
//boolean flag_cidadeOK=false;
EditoraDom editora = new EditoraDom();
EditoraDAO ed_dao = new EditoraDAO();
/*while(request.getParameterNames().hasMoreElements()){
    String tmp=request.getParameterNames().nextElement().toString();
    if (tmp.contentEquals("nome"))
        flag_nomeOK=true;
    if (tmp.contentEquals("cidade"))
        flag_cidadeOK=true;
}
if (flag_nomeOK&&flag_cidadeOK){*/
    editora.setNome(request.getParameter("nome"));
    editora.setCidade(request.getParameter("cidade"));
    ed_dao.salvaEditora(editora);
// }
String[] editoras= ed_dao.listaEditora();
%>
<html><head></head>
    <body>
         
        <%
                    for(int i=0;i<editoras.length;i++)
                    {
                        out.println(editoras[i]);
                    }
        %>
    </body></html>