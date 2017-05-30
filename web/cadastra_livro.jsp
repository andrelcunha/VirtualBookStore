<%-- 
    Document   : cadastra_livro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script type="text/javascript">
$(document).ready(function(){
    //
    //
    //
    getEditorasSelect($('#editora'));
    $("#input_foto").change(function(){
        readNewPicURL(this);
    });
    $("#salvar").on("click",function() { 
        send_file();
    });
});
</script>
<div class="atualiza_form">    
        <h2>Cadastrar Livro</h2>
        <form action="LivroNgn" method="POST" target="this" id="form_livro">
            <label class="control-label" for="titulo">T�tulo: </label>
            <input class="form-control"  type="text" name="titulo" id="titulo" placeholder="Digite o t�tulo...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" id="autor" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" id="ano" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Pre�o:</label>
            <input class="form-control"  type="text" name="preco" id="preco" placeholder="R$" size="50">
            <input type="hidden" id="foto" name="foto" >
            <div class="form-group">
                <label class="control-label" for="editora">Editora:</label>
                <select class="form-control" name="editora" id="editora">
                </select>
            </div>
        </form>
        <form id="image_upload_form" method="POST"
              enctype="multipart/form-data"
              action='FileUploadHandler' autocomplete="off">
            <label class="control-label" >Foto: </label>
            <input class="form-control"  type="file"  id="input_foto" size="7">
        </form>
        <br>
        <button id="salvar" class="btn btn-default">Salvar</button>
</div>
<div id="atualiza_foto" class="atualiza_foto">
    <div id="preview" >
    </div>
</div>
        
