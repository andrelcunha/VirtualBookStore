<%-- 
    Document   : login
    Created on : Apr 16, 2017, 2:07:04 AM
    Author     : deko
--%>
<%@include file="template.jsp" %>

<body>
    <%@include file="mainheader.jsp" %>
<div class="container">
  <h2>Acesso à área administrativa</h2>
  <p>Efetue o login para ter acesso funções administrativas</p>
  <form action="valida.jsp" method="POST">
    <div class="form-group">
      <label for="usuario">Nome:</label>
      <input type="text" class="form-control" id="usuario" name="usuario">
    </div>
    <div class="form-group">
      <label for="senha">Senha:</label>
      <input type="password" class="form-control" id="senha" name="senha">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-black btn-block">Salvar</button>  
    </div>
  </form>
</div>
          
</body>
</html>