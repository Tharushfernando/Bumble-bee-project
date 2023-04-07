<%-- 
    Document   : patientupdate
    Created on : 03-Oct-2021, 23:28:46
    Author     : Malith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%

    if(request.getParameter("submit")!=null)
    {
     String id = request.getParameter("id");   
     String name = request.getParameter("name");
     String email = request.getParameter("email");
     String password = request.getParameter("password");
      
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
     pst = con.prepareStatement("update admin set name = ?, email = ? ,password = ?  where id = ? ");
      
     pst.setString(1, name);
     pst.setString(2, email); 
     pst.setString(3, password);
     pst.setString(4, id);
     
     pst.executeUpdate();
     
       out.println("<script type=\"text/javascript\">");
          out.println("alert('Record Updated Succssfull');");
          out.println("location='adminadministrators.jsp';");
          out.println("</script>");
%>
<script>
    alert("Record Updated");
    
</script>    
<% 

}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="icon"  type="image/png" href="228-2285847_emblem-of-sri-lanka-national-emblem-of-sri.png">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="section1s" align="center" style="margin-top:20px; background-color: white;   >
 
<div class="row" style="margin-left: 20px; border-color:#06F; border: thick">
    <div class="col-sm-4">
         <h3 class="alert-warning" >Update Administrators </h3>
        <form class="" method="POST" action="">
         
            
            <%       
            Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
      
     String id = request.getParameter("id");
     
     pst = con.prepareStatement("select * from admin where id = ?");
     pst.setString (1,id);
     rs = pst.executeQuery();
     
     while(rs.next())
     
     {
            %>
            
           
            
       
                
                      <div align="left">
                <label class="form-label"> Name</label>
                <input type="text" class="form-control" placeholder="Name" name="name" id="name" value="<%=rs.getString("name") %>" required>
                
            </div>
             <div align="left">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" placeholder="Email" name="email" id="email" value="<%=rs.getString("email") %>" required>
                
            </div>
             <div align="left">
                <label class="form-label">Password</label>
                <input type="text" class="form-control" placeholder="Password" name="password" id="password" value="<%=rs.getString("password") %>" required>            
            </div>
                
                
            <hr>
                  
                <%
     
     }
     
                %>
            <hr>
              <div align="right">
                  <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                <p><a href=adminadministrators.jsp>Click Back</a></p>
            </div> 
        </form> 
    </div>
            
            <div class="col-sm-8"> 
            
            
                <img src="css/abc.jfif" style="width: 100%; margin-top: 20%">
            
            
            
            
            </div>
        
    </div>   
        
    </body>
</html>
