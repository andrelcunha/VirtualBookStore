<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
    
<script type="text/javascript">

function submitdata()
{
 var nome=document.getElementById( "nome" );
 var cidade=document.getElementById( "cidade" );

 $.ajax({
  type: 'post',
  url: 'engine/editora_ngn.jsp',
   data: {
   nome:nome,
   cidade:cidade
  },
  success: function (response) {
      
   $('#teste').html("ok");
  }
 });
	
 return false;
}


</script>

<h2>Cadastrar Editora</h2>
<form method="POST" <%--onsubmit="return submitdata();" --%>action="engine/editora_ngn.jsp" target="_blank">
            <input type="text" name="nome" id="nome" placeholder="Digite o Nome..."><br>
            <input type="text" name="cidade" id="cidade" placeholder="Digite a Cidade..."><br>
            <input type="submit" value="Salvar">
</form>
            <p id="teste"></p>