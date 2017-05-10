<%-- 
    Document   : index
    Created on : Apr 16, 2017, 2:06:09 AM
    Author     : deko
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String content="";
content=request.getParameter("content");
pageContext.setAttribute("content", content);

%>

<%@include file="templates/template.jsp" %>
<body>
<%@include file="templates/mainheader.jsp" %><%-- Jumbotron --%>
<%@include file="templates/menu.jsp"%><%-- Menu--%>
<c:choose>
    <c:when test="${content eq 'cad_u'}">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <jsp:include page="cadastra_usuario.jsp"></jsp:include>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
    </c:when>
        <c:when test="${content eq 'cad_e'}">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <jsp:include page="cadastra_editora.jsp"></jsp:include>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        </c:when>
    <c:when test="${content eq 'cad_l'}">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                     <jsp:include page="cadastra_livro.jsp"></jsp:include>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
    </c:when>
    <c:when test="${content eq 'atu_l'}">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                   <jsp:include page="atualiza_livro.jsp"></jsp:include>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <jsp:include page="show_books.jsp"></jsp:include>
    </c:otherwise>
</c:choose>
                

<br>
<%@include file="templates/footer.jsp"%>
</body>
</html>
