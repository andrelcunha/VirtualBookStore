<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script>
    $(document).ready(function(){
        AJAX.onreadystatechange = table_handler;
        AJAX.open("GET", "JsonLivros");
        AJAX.send(""); 
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
    var AJAX = createXMLHttpRequest();
    var id=0;
    function clean_table(i) {
        id=i;
        $("#table_livros").remove();
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                jarr_form = eval('(' + xhttp.responseText +')');
                create_form(i);
            }else if (AJAX.readyState === 4 && AJAX.status !== 200) {
                alert('Something went wrong...');    
            }
        };
        xhttp.open("GET", "JsonEditoras", true);
        xhttp.send();
    };
            
    var myTable="";
    myTable="<table id=\"table_livros\" class=\"table table-striped table-hover table-condensed\"><thead><tr>";
    myTable+="<th>ID</th>";
    myTable+="<th>Título</th>";
    myTable+="<th>Autor</th>";
    myTable+="<th>Ano</th>";
    myTable+="<th>Preço</th>";
    myTable+="<th>Editora</th>";
    myTable+="<th>Foto</th>";
    myTable+="</tr></thead>";
    myTable+="<tbody>";

    
    var jarr;
    var jarr_form;

    function table_handler() {
        if(AJAX.readyState === 4 && AJAX.status === 200) {
            jarr = eval('(' + AJAX.responseText +')');
            create_table();
        }else if (AJAX.readyState === 4 && AJAX.status !== 200) {
            alert('Something went wrong...'); 
        }; 
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
        $("#content").html(myTable);
        myTable="";
    };
    function create_form(i){
        myForm="<div id=\"atualiza_form\" class=\"atualiza_form\"><h2>Atualizar Livro</h2>";
        myForm+="<form action=\"LivroNgn\" method=\"POST\" >";
        myForm+="<input type=\"hidden\" name=\"id\""+
                " id=\"id\" value=\""+jarr[i].id+"\">";
        myForm+="<label class=\"control-label\" for=\"titulo\">Título: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"titulo\""+
                " id=\"titulo\" value=\""+jarr[i].titulo+"\">";
        myForm+="<label class=\"control-label\" for=\"autor\">Autor: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"autor\""+
                "id=\"autor\" value=\""+jarr[i].autor+"\">";
        myForm+="<label class=\"control-label\" for=\"Ano\">Ano: </label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"ano\""+
                "id=\"ano\" size=\"5\" value=\""+jarr[i].ano+"\">";
        myForm+="<label class=\"control-label\" for=\"preco\">Preço:</label>";
        myForm+="<input class=\"form-control\"  type=\"text\" name=\"preco\"" +
                "id=\"preco\" size=\"50\" value=\""+jarr[i].preco+"\">";
        //myForm+="<label class=\"control-label\" for=\"foto\">Foto: </label>";
        //myForm+="<input class=\"form-control\"  type=\"file\" name=\"upload_foto\""+
        //        "id=\"upload_foto\" >";
        myForm+="<input type=\"hidden\" name=\"foto\""+
                " id=\"foto\" value=\""+jarr[i].foto+"\">";
        myForm+="<div class=\"form-group\">";
        myForm+="<label class=\"control-label\" for=\"editora\">Editora:</label>";
        myForm+="<select name=\"editora\">";
        for (var j in jarr_form){
            myForm+="<option value=\""+jarr_form[j].id;
            if (jarr[i].editora===jarr_form[j].nome)
                myForm+=" selected=\"selected\" ";
            myForm+="\">"+jarr_form[j].nome+"</option>";
        }
        myForm+="</select>";
        myForm+="</div>";
        myForm+="<input class=\"btn btn-default\" type=\"submit\" value=\"Salvar\">";
        myForm+="</form>";
        myForm+="</div><div class=\"atualiza_foto\"><img class=\"img-responsive\" src=\"assets/"+ jarr[i].foto +"\"></div>";
        $("#content").html(myForm);
    };
</script>

    <div id="content"></div>
