<%-- 
    Document   : atualiza_livro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script type="text/javascript">
$(document).ready(function(){
    if (true){
        $("#atualiza_form").hide();
        $("#atualiza_foto").hide();
        loadDataTable($("#content"));
        $("h2").text("Atualizar Livro");
    }else{
        $("h2").text("Cadastrar Livro");
    }
    getEditorasSelect($('#editora'));
    $("#input_foto").change(function(){
        readNewPicURL(this);
    });
    $("#salvar").on("click",function (){
        send_file();
    });
});
</script>
<div id="content"></div>
<div id="atualiza_form" class="atualiza_form">
            <h2></h2>
        <form action="LivroNgn" method="POST" target="this" id="form_livro">
            <input type="hidden" name="id" id="id" value="">
            <label class="control-label" for="titulo">Título: </label>
            <input class="form-control"  type="text" name="titulo" 
                   id="titulo" placeholder="Digite o título...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" 
                   id="autor" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" 
                   id="ano" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Preço:</label>
            <input class="form-control"  type="text" name="preco" 
                   id="preco" placeholder="R$" size="50">
            <input type="hidden" id="foto" name="foto" >
            <div class="form-group">
                <label class="control-label" for="editora">Editora:</label>
                <select class="form-control" name="editora" id="editora">
                </select>
            </div>
        </form>
        <form id="image_upload_form" method="POST" 
              enctype="multipart/form-data" 
              action='FileUploadHandler'  autocomplete="off">
            <label class="control-label" for="input_foto" >Foto: </label>
            <input class="form-control" type="file" id="input_foto" >
        </form>
        <br>
        <button id="salvar" class="btn btn-default">Salvar</button>
</div>
<div id="atualiza_foto" class="atualiza_foto" >
    <div id="preview" >
    </div>
</div>

