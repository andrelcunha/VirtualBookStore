<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>

<script type="text/javascript">
    $(document).ready(function(){
        AJAX_cadastro.onreadystatechange = handler_cadastro;
        AJAX_cadastro.open("GET", "JsonEditoras");
        AJAX_cadastro.send("");
        $("#mybutton").bind("click",function() { 
            var mimeType = "image/jpeg";
            var myFile = $('#input_foto').prop('files');
            var fileName = $('#input_foto').val();
            alert(fileName);
            AJAX_file.onreadystatechange = handler_file;
            AJAX_file.open("POST", "FileUploadHandler");
            AJAX_file.setRequestHeader('Content-Type', mimeType);
            AJAX_file.setRequestHeader('Content-Disposition', 'attachment; filename="' + fileName + '"');
            AJAX_file.send(myFile);
        });
    });
    function createXMLHttpRequest(){ 
        // See http://en.wikipedia.org/wiki/XMLHttpRequest 
        // Provide the XMLHttpRequest class for IE 5.x-6.x: 
        if( typeof XMLHttpRequest === "undefined" ) XMLHttpRequest = function() {
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.6.0"); 
            } catch(e) {}
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.3.0"); 
            } catch(e) {}
            try {
                return new ActiveXObject("Msxml2.XMLHTTP"); 
            } catch(e) {}
            try {
                return new ActiveXObject("Microsoft.XMLHTTP"); 
            } catch(e) {}
            throw new Error( "This browser does not support XMLHttpRequest." ); 
        };return new XMLHttpRequest(); 
    };
    var AJAX_cadastro = createXMLHttpRequest();
    var AJAX_file = new XMLHttpRequest();
    var jarr_cadastro;
    var json_file;

    function handler_cadastro() {
        if(AJAX_cadastro.readyState === 4 && AJAX_cadastro.status === 200) {
            jarr_cadastro = eval('(' + AJAX_cadastro.responseText +')');
            fill_select();// Select from "Cadastra Livro".
        }else if (AJAX_cadastro.readyState === 4 && AJAX_cadastro.status !== 200) {
            alert('Something went wrong...'); 
        }; 
    };
    function handler_file() {
        if(AJAX_file.readyState === 4 && AJAX_file.status === 200) {
            json_file = eval('(' + AJAX_file.responseText +')');
            UploadResult();// 
        }else if (AJAX_file.readyState === 4 && AJAX_file.status !== 200) {
            alert('Something went wrong...'); 
        }; 
    };
    var select="";
    function fill_select(){
        $('#teste').text("fill...");
        for (var i in jarr_cadastro){
                select+="<option value=\""+jarr_cadastro[i].id+"\">";
                select+=jarr_cadastro[i].nome+"</option>";
        }
        $('#editora').html(select);
    };
    var image_name="";
    function UploadResult(){
        //trata o json_file
        image_name=json_file.filename;
        $("#preview").html("<img class=\"img-responsive\" src=\"assets/"
                + json_file.filename +"\">");
    };
</script>
<script>
    
    
</script>
<div class="atualiza_form">    
        <h2>Cadastrar Livro</h2>
        <form action="LivroNgn" method="POST" target="this">
            <label class="control-label" for="titulo">Título: </label>
            <input class="form-control"  type="text" name="titulo" id="titulo" placeholder="Digite o título...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" id="autor" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" id="ano" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Preço:</label>
            <input class="form-control"  type="text" name="preco" id="preco" placeholder="R$" size="50">
            <div class="form-group">
                <label class="control-label" for="editora">Editora:</label>
                <select class="form-control" name="editora" id="editora">
                </select>
            </div>
            <input class="btn btn-default" type="submit" value="Salvar">
        </form>
        <form id="image_upload_form" method="POST" enctype="multipart/form-data" action='FileUploadHandler' autocomplete="off">
        <label class="control-label" for="foto">Foto: </label>
        <input class="form-control"  type="file" name="input_foto"  id="input_foto" size="7">
        </form>
        <button id="mybutton">My Button</button>
</div>
<div class="atualiza_foto">
    <div id="preview" >
        
    </div>
</div>
        
