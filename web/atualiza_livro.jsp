<%-- 
    Document   : atualiza_livro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script>
$(document).ready(function(){
    $("#atualiza_form").hide();
    $("#atualiza_foto").hide();
    $("#input_foto_upd").change(function(){
        read_url(this);
    });
    $.getJSON("JsonLivros",function (result){
        jarr=result;
        create_table();
    });

    $("#salvar_upd").on("click",function (){
        send_file();
    });
});
function send_file(){
    //var formData = new FormData($('#image_upload_form_upd').files[0]);
    var myFile = $('#input_foto_upd').prop('files')[0];
    //formData.append('foto', $('input[type=file]')[0].files[0]);
    $.ajax({
        url: 'FileUploadHandler', // Url to which the request is send
        type: 'POST',             // Type of request to be send, called as method
        data: myFile,       // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        beforeSend: function(e,data){
           // Get the original filename
            var fileName = $('#input_foto_upd').prop('files')[0].name;
            var ext = fileName.substr(fileName.lastIndexOf('.')+1);
            var prename = padLeft($("#id_upd").val(),6);
            var newFileName = prename + "."+ext.trim();
            debugger;
            console.log(newFileName);
            // Update the form data with the new key value
            $(myFile).attr("key", newFileName);
            // Set the form data
            data.formData = myFile;
        },
        success:  function (data){ // A function to be called if request succeeds
            $("#foto_upd").val(JSON.parse(data).filename);
            console.log(newFileName);
            //send_form();
        }
    });
};

function send_form(){
    $.ajax({
        url: 'LivroNgn',
        type: 'POST',
        data: $('#form_livro_upd').serialize(),
        success: function () {
            alert('Livro atualizado com sucesso.');
            location.reload();
        }
    });
};
//Part of preview solution.
function read_url(input) {
    if (input.files && input.files[0]) {                    
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#preview_upd").empty();
            $("#preview_upd")
                .html("<img class=\"img-responsive\" src=\""
                + e.target.result +"\">");
        };
        reader.readAsDataURL(input.files[0]);
    };
};
function padLeft(nr, n){
    return Array(n-String(nr).length+1).join('0')+nr;
}
    
function clean_table(id) {
    $("#table_livros").remove();
    $("#atualiza_form").show();
    $("#atualiza_foto").show();
    $.getJSON("JsonEditoras",function(result){
        var select="";
        $.each(result, function (i, element){
           obj = element;
           select+="<option value=\""+obj.id+"\"";
           if (jarr[id].editora===obj.nome)
                select+=" selected=\"selected\" ";
           select+=">";
           select+=obj.nome+"</option>";
        });
        $('#editora_upd').html(select);
        fill_form(id);
    });
};
    
var jarr;
    
function create_table(){
    var myTable="";
    myTable="<table id=\"table_livros\" class=\"table table-striped "
    +" table-hover table-condensed\"><thead><tr>";
    myTable+="<th>ID</th>";
    myTable+="<th>Título</th>";
    myTable+="<th>Autor</th>";
    myTable+="<th>Ano</th>";
    myTable+="<th>Preço</th>";
    myTable+="<th>Editora</th>";
    myTable+="<th>Foto</th>";
    myTable+="</tr></thead>";
    myTable+="<tbody>";
    for (var i in jarr) {
        var id=parseInt(i)+1;
        myTable+="<tr id=tr"+id+" onClick=\"clean_table("+i+")\">";
        myTable+="<td>"+jarr[i].id+"</td>";
        myTable+="<td>"+jarr[i].titulo+"</td>";
        myTable+="<td>"+jarr[i].autor+"</td>";
        myTable+="<td>"+jarr[i].ano+"</td>";
        myTable+="<td>"+jarr[i].preco+"</td>";
        myTable+="<td>"+jarr[i].editora+"</td>";
        myTable+="<td>"+jarr[i].foto+"</td>";
        myTable+="</tr>";
    }
    myTable+="</tbody></table>";
    $("#content").html(myTable);
};
    
function fill_form(i){
    $("#id_upd").val(jarr[i].id);
    $("#titulo_upd").val(jarr[i].titulo);
    $("#autor_upd").val(jarr[i].autor);
    $("#ano_upd").val(jarr[i].ano);
    $("#preco_upd").val(jarr[i].preco);
    var my_foto="";
    my_foto="<img class=\"img-responsive\" src=\"assets/"
        + jarr[i].foto +"\" >";
    $("#preview_upd").html(my_foto);
    $("#foto_upd").val(jarr[i].foto);
};

</script>
<div id="content"></div>
<div id="atualiza_form" class="atualiza_form">
            <h2>Atualizar Livro</h2>
        <form action="LivroNgn" method="POST" target="this" id="form_livro_upd">
            <input type="hidden" name="id" id="id_upd" value="">
            <label class="control-label" for="titulo">Título: </label>
            <input class="form-control"  type="text" name="titulo" 
                   id="titulo_upd" placeholder="Digite o título...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" 
                   id="autor_upd" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" 
                   id="ano_upd" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Preço:</label>
            <input class="form-control"  type="text" name="preco" 
                   id="preco_upd" placeholder="R$" size="50">
            <input type="hidden" id="foto_upd" name="foto" >
            <div class="form-group">
                <label class="control-label" for="editora_upd">Editora:</label>
                <select class="form-control" name="editora" id="editora_upd">
                </select>
            </div>
        </form>
        <form id="image_upload_form_upd" method="POST" 
              enctype="multipart/form-data" 
              action='FileUploadHandler'  autocomplete="off">
            <label class="control-label" for="input_foto_upd" >Foto: </label>
            <input class="form-control" type="file" id="input_foto_upd" >
        </form>
        <br>
        <button id="salvar_upd" class="btn btn-default">Salvar</button>
</div>
<div class="atualiza_foto" id="atualiza_foto">
    <div id="preview_upd" >
    </div>
<p id="echo_upd"></p>
</div>

