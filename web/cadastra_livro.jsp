<%-- 
    Document   : cadastra_livro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>

<script type="text/javascript">
    $(document).ready(function(){
        $.getJSON("JsonEditoras",function(result){
            var select="";
            $.each(result, function (i, element){
               obj = element;
               select+="<option value=\""+obj.id+"\">";
                    select+=obj.nome+"</option>";
            });
            $('#editora').html(select);
        });
//The preview funcion was possible thanks to 'Harrison Pickering' and his answer
//http://stackoverflow.com/questions/22038036/uploading-images-using-php-but-without-page-refresh
        $("#input_foto").change(function(){
            readURL(this);
        });
        
        $("#salvar").bind("click",function() { 
//This setting was hard to find out.
//Thanks to "chandoo" and his/her answer in Stackoverflow question
//http://stackoverflow.com/questions/21044798/how-to-use-formdata-for-ajax-file-upload
            var formData = new FormData($('#image_upload_form')[0]);//
            //the next line is commented because the data was been sent twice
            formData.append('tax_file', $('input[type=file]')[0].files[0]);
            $.ajax({
                url: 'FileUploadHandler', // Url to which the request is send
                type: 'POST',             // Type of request to be send, called as method
                data: formData,           // Data sent to server, a set of key/value pairs (i.e. form fields and values)
                contentType: false,       // The content type used when sending data to the server.
                cache: false,             // To unable request pages to be cached
                processData:false,        // To send DOMDocument or non processed data file it is set to false
                success: function(data){   // A function to be called if request succeeds
                
                    $("#foto").val(JSON.parse(data).filename);
                    $.ajax({
                        url: 'LivroNgn',
                        type: 'POST',
                        data: $('#form_livro').serialize(),
                        success: function () {
                            alert('Livro salvo com sucesso!');
                            location.reload();

                        }
                    });
                }
            });
        });
    });

//Part of preview solution.
    function readURL(input) {
        if (input.files && input.files[0]) {                    
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#preview")
                    .html("<img class=\"img-responsive\" src=\""
                    + e.target.result +"\">");
            };
            reader.readAsDataURL(input.files[0]);
        };
    };
    
</script>
<div class="atualiza_form">    
        <h2>Cadastrar Livro</h2>
        <form action="LivroNgn" method="POST" target="this" id="form_livro">
            <label class="control-label" for="titulo">Título: </label>
            <input class="form-control"  type="text" name="titulo" id="titulo" placeholder="Digite o título...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" id="autor" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" id="ano" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Preço:</label>
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
<div class="atualiza_foto">
    <div id="preview" >
    </div>
    <p id="echo"></p>
</div>
        
