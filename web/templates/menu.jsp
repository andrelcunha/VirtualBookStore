<%-- 
    Document   : menu
    Created on : Apr 16, 2017, 2:08:59 AM
    Author     : deko
--%>
<%
 String userLabel=" Login" ;
 String display="block";
 boolean flag_dsp_OK=true;
 while(request.getAttributeNames().hasMoreElements()){
    String tmp=request.getAttributeNames().nextElement().toString();
    flag_dsp_OK=(tmp.contentEquals("display")&&flag_dsp_OK);
}

//if(flag_dsp_OK)
//     display=request.getAttribute("display").toString();
%>    
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="#"><img src="images/book-stack-thumb_inverted.png" height="60%" width="60%" class="img-responsive"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar" >
      <ul class="nav navbar-nav" >
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li style="display:<%=display %>"><a href="admin.jsp" >Administrar</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li style="display:<%=display %>"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
