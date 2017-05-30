<%-- 
    Document   : showbooks
    Created on : May 15, 2017, 6:28:54 AM
    Author     : deko
--%>

<%-- 
    Document   : atualiza_livro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<script type="text/javascript">
$(document).ready(function(){
    var node;
    var footer=document.getElementsByTagName("footer");
    var body=footer.parentNode();
    $.getJSON("JsonLivros",function (result){
        jarr=result;
        node=showBooks(jarr);
        body.insertBefore(node,footer); 
    });
});
</script>
