<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script>
    function clean_table(i) {
        var myForm="";
        create_form(myForm);
        document.
        document.getElementById("titulo").value="Teste";
        document.getElementById("autor").value=jarr[i].autor;
        document.getElementById("ano").value=jarr[i].ano;
        document.getElementById("preco").value=jarr[i].preco;
        //document.getElementById("editora").value=jarr[i].editora;
        //document.getElementById("foto").value=jarr[i].foto;

    };

    var myTable="";
    myTable="<table class=\"table table-striped table-hover table-condensed\"><thead><tr>";
    myTable+="<th>ID</th>";
    myTable+="<th>Título</th>";
    myTable+="<th>Autor</th>";
    myTable+="<th>Ano</th>";
    myTable+="<th>Preço</th>";
    myTable+="<th>Editora</th>";
    myTable+="<th>Foto</th>";
    myTable+="</tr></thead>";
    myTable+="<tbody>";

    function createXMLHttpRequest(){ 
        // See http://en.wikipedia.org/wiki/XMLHttpRequest 
        // Provide the XMLHttpRequest class for IE 5.x-6.x: 
        if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.6.0") 
            } catch(e) {}
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.3.0") 
            } catch(e) {}
            try {
                return new ActiveXObject("Msxml2.XMLHTTP") 
            } catch(e) {}
            try {
                return new ActiveXObject("Microsoft.XMLHTTP") 
            } catch(e) {}
            throw new Error( "This browser does not support XMLHttpRequest." ) 
        };return new XMLHttpRequest(); 
    };
    var AJAX = createXMLHttpRequest();
    var jarr;
    function handler() {
        if(AJAX.readyState == 4 && AJAX.status == 200) {
            jarr = eval('(' + AJAX.responseText +')');
            create_table();
        }else if (AJAX.readyState == 4 && AJAX.status != 200) {
            alert('Something went wrong...'); 
        }; 
    }function show(){
        AJAX.onreadystatechange = handler;
        AJAX.open("GET", "atualizaLivro");
        AJAX.send(""); 
    };
    
    function create_table(){
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
        document.getElementById("content").innerHTML = myTable;
        myTable="";
    };
    function create_form(){
        myForm="<h2>Atualizar Livro</h2>";
        myForm+="<form action=\"\" method=\"POST\" enctype=\"multipart/form-data\">";
        myForm+="<label class=\"control-label\" for=\"titulo\">Título: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"titulo\" id=\"titulo\" >";
        myForm+="<label class=\"control-label\" for=\"autor\">Autor: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"autor\" id=\"autor\" >";
        myForm+="<label class=\"control-label\" for=\"Ano\">Ano: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"ano\" id=\"ano\" size=\"5\">";
        myForm+="<label class=\"control-label\" for=\"preco\">Preço:</label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"preco\" id=\"preco\" size=\"50\">";
        myForm+="<label class=\"control-label\" for=\"foto\">Foto: </label>";
        myForm+="<input class=\"form-control\"  type=\"file\" name=\"foto\"  id=\"foto\" size=\"7\">";
        myForm+="<div class=\"form-group\">";
        myForm+="<label class=\"control-label\" for=\"editora\">Editora:</label>";
        myForm+="<select name=\"editora\">";
        myForm+="</select>";
        myForm+="</div>";
        myForm+="<input class=\"btn btn-default\" type=\"submit\" value=\"Salvar\">";
        myForm+="</form>";
        document.getElementById("content").innerHTML=myForm;
    };
</script>
        
            
<a href="#" onclick="show()">Click here to get JSON data from the server side</a>

        <div id="content"></div>
