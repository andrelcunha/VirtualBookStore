/*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : May 6, 2017, 7:42:16 PM
    Author     : deko
*/

//Part of preview solution.
var BOOK_TABLE_FIELDS=["ID","T&iacute;tulo","Autor","Ano","Pre&ccedil;o",
    "Editora","Foto"];
var BOOK_BD_FIELDS=["id","titulo","autor","ano","preco","editora","foto"];

var ROW_SIZE=4;

var jarr;

function numberToBrReal(number){
    return number.toFixed(2).toString().replace(".",",");
}

function readNewPicURL(input) {
    if (input.files && input.files[0]) {                    
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#preview").html(imgSrcHtml(e.target.result));
        };
        reader.readAsDataURL(input.files[0]);
    };
}

function imgSrcHtml(url){
    return "<img class=\"img-responsive\" src=\""
                + url +"\">";
}

function create_table(jarr){
    var myTable="";
    var book;
    myTable="<table id=\"table_livros\" class=\"table table-striped "
    +" table-hover table-condensed\"><thead><tr>";
    BOOK_TABLE_FIELDS.forEach(function (field){
        myTable+="<th>"+field+"</th>";
    });
    myTable+="</tr></thead>";
    myTable+="<tbody>";
    for (book in jarr) {
        var id=parseInt(book)+1;
        myTable+="<tr id=tr"+id+" onClick=\"clean_table("+book+")\">";
        BOOK_BD_FIELDS.forEach(function (field){
            var tmp;
            if (typeof jarr[book][field] ==="number" && field==="preco"){
                tmp="R$ "+numberToBrReal(jarr[book][field]);
            }else{ 
                tmp=jarr[book][field];
                if (tmp.length>40){
                    var space=0;
                    tmp=tmp.slice(0,37);
                    space=tmp.lastIndexOf(" ");
                    tmp=tmp.slice(0,space)+" ...";
                }
            }
            myTable+="<td>"+tmp+"</td>";
        });
        myTable+="</tr>";
    }
    myTable+="</tbody></table>";
    return myTable;
}

function create_table1(jarr){
    var myTable="";
    myTable="<table id=\"table_livros\" class=\"table table-striped "
    +" table-hover table-condensed\"><thead><tr>";
    myTable+="<th>ID</th>";
    myTable+="<th>T&iacute;tulo</th>";
    myTable+="<th>Autor</th>";
    myTable+="<th>Ano</th>";
    myTable+="<th>Pre&ccedil;o</th>";
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
    return myTable;
}

function getEditorasSelect(select){
    var options="";
    $.getJSON("JsonEditoras",function (result){
        $.each(result, function (i, element){
            obj = element;
            options+="<option value=\""+obj.id+"\">";
                options+=obj.nome+"</option>";
        });
        select.html(options);
    });
}

function padLeft(nr, n){
    return Array(n-String(nr).length+1).join('0')+nr;
}

function sendForm(form){
    $.ajax({
        url: 'LivroNgn',
        type: 'POST',
        data: form.serialize(),
        success: function () {
            alert('Livro atualizado com sucesso.');
            location.reload();
        }
    });
}

function send_file(){
    var formData = new FormData($('#image_upload_form'));
    var photo = $("#input_foto")[0].files[0];
    var fileName = photo.name;
    var newFileName=getNewFileName(fileName);
    formData.set('foto', photo, newFileName);
    $.ajax({
        url: 'FileUploadHandler', // Url to which the request is send
        type: 'POST',             // Type of request to be send, called as method
        data: formData,       // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success:  function (){// A function to be called if request succeeds
            $("#foto").val(newFileName);
            sendForm($('#form_livro'));
        }
    });
}

function getNewFileName(fileName){
    var ext = fileName.substr(fileName.lastIndexOf('.')+1);
    var prename = padLeft($("#id").val(),6);
    return (prename + "."+ext.trim());
}

function clean_table(id) {
    $("#table_livros").remove();
    $("#atualiza_form").show();
    $("#atualiza_foto").show();
    fill_form(id);
}
    
function fill_form(i){
    $("#id").val(jarr[i].id);
    $("#titulo").val(jarr[i].titulo);
    $("#autor").val(jarr[i].autor);
    $("#ano").val(jarr[i].ano);
    $("#preco").val(jarr[i].preco);
    for (var j = 0 ; j<$("#editora")[0].options.length ;j++){
        if ($("#editora")[0].options[j].innerText===jarr[i].editora){
            $("#editora").val(j).change();
        }
    }
    var imgSrc=imgSrcHtml("assets/pics/"+ jarr[i].foto);
    $("#preview").html(imgSrc);
    $("#foto").val(jarr[i].foto);
}

function loadDataTable(content){
    $.getJSON("JsonLivros",function (result){
        jarr=result;
        var table = create_table(jarr);
        content.html(table);
    });
}

function setTable(){
    
}

function sizeJarr(jarr){
    var count=0;
    var i=0;
    for(i in jarr)
        count++;
    return count;
}

function numOfRows(){
    var totalBooks = sizeJarr(jarr);
    return Math.ceil(totalBooks/ROW_SIZE);
}

function showBooks(jarr){
    var divContainer;
    var i;
    var j;
    var aux;
    var colSize = 12/ROW_SIZE;
    var totalRows=numOfRows();
    var totalBooks=sizeJarr(jarr);
    var setRow;
    var setDivBook;
    divContainer = document.createElement("div");
    divContainer.setAttribute("class","container");
    setRow = function(id){
        var divRow;
        divRow=document.createElement("div");
        divRow.setAttribute("id","row"+id);
        divRow.setAttribute("class","row");
        return divRow;
    };
    setDivBook=function(jsonBook){
        var divBook, divImg, divTitle, divPrice;
        var imgBook, txtTitle, txtPrice;
        divBook=document.createElement("div");
        divImg=document.createElement("div");
        divTitle=document.createElement("div");
        divPrice=document.createElement("div");
        imgBook=document.createElement("img");
        imgBook.setAttribute("class","img-responsive");
        imgBook.setAttribute("style","width:100%");
        if (arguments.length>0){
            divBook.setAttribute("id","book"+jsonBook.id);
            divBook.setAttribute("class","col-sm-"+colSize);
            divImg.setAttribute("class","imgBook");
            imgBook.setAttribute("src","assets/pics/"+jsonBook.foto);
            imgBook.setAttribute("alt",jsonBook.titulo);
            divImg.appendChild(imgBook);
            divTitle.setAttribute("class","titulo");
            txtTitle=document.createTextNode(jsonBook.titulo);
            divTitle.appendChild(txtTitle);
            divPrice.setAttribute("class","preco");
            txtPrice=document.createTextNode("R$"+numberToBrReal(jsonBook.preco));
            divPrice.appendChild(txtPrice);
        }
        else{
            imgBook.setAttribute("src","images/placeholder.png");
            imgBook.setAttribute("alt","");
        }
        divBook.appendChild(divImg);
        divBook.appendChild(divTitle);
        divBook.appendChild(divPrice);
        return divBook;
    };
    booksAndPlaceholders=totalRows*ROW_SIZE;
    console.log("Size of jarr: "+sizeJarr(jarr));
    console.log("Total Rows: ",totalRows);
    console.log("Total books: ",booksAndPlaceholders);
    var row_count=0;
    for(i=0;i<booksAndPlaceholders;i++){
        if ((i%ROW_SIZE)=== 0)
            var row=setRow(row_count++);
        if (i<totalBooks){
            row.appendChild(setDivBook(jarr[i]));
        }else
            row.appendChild(setDivBook());
        if ((i%ROW_SIZE)===(ROW_SIZE-1))
            divContainer.appendChild(row);
    }
    return divContainer;
}