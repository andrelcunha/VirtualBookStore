<%-- 
    Document   : login_ngn
    Created on : Apr 19, 2017, 4:58:37 PM
    Author     : luiscunha
--%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="DAO.UsuarioDAO "%>
<%
   
   Enumeration e = request.getParameterNames();
   String sRequest = "";
   while (e.hasMoreElements()) {
        String name = (String)e.nextElement();
        String value = request.getParameter(name).toString();
        sRequest += (name + " = " + value + "\n");
        }
  
    // Get session creation time.
   Date createTime = new Date(session.getCreationTime());
   // Get last access time of this web page.
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Welcome Back to my website";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   String userIDKey = new String("userID");
   String userID = new String("ABCD");
   // Check if this is new comer on your web page.
   /*if (session.isNew()){
      title = "Welcome to my website";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   }*/ 
   if (session.getAttribute(visitCountKey)!=null)
    visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
%>
<html>
<head>
<title>Session Tracking</title>
</head>
<body>
<center>
<h1>Session Tracking</h1>
</center>
<table border="1" align="center"> 
<tr bgcolor="#949494">
   <th>Session info</th>
   <th>Value</th>
</tr> 
<tr>
   <td>id</td>
   <td><%=session.getId()%></td>
</tr> 
<tr>
   <td>Creation Time</td>
   <td><%=createTime%></td>
</tr> 
<tr>
   <td>Time of Last Access</td>
   <td><%=lastAccessTime%></td>
</tr> 
<tr>
   <td>User ID</td>
   <td><%=userID%></td>
</tr> 
<tr>
   <td>Number of visits</td>
   <td><%=visitCount%></td>
</tr>
<%
        Enumeration e1 = session.getAttributeNames();
        while (e1.hasMoreElements()) {
            String name = (String)e1.nextElement();
            String value = session.getAttribute(name).toString();
            
            out.println("<tr><td>"+name + "</td>");
            out.println("<td>" +value +"</td></tr>"); 
        }
%>
</table> 

<p><%=sRequest%></p>

<%=String.valueOf(session.isNew())%>
</body>
</html>