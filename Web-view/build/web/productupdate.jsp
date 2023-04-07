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
     String description = request.getParameter("description");
     String brand = request.getParameter("brand");
     String category = request.getParameter("category");
     String qty = request.getParameter("qty");
     String unitprice = request.getParameter("unitprice");
     String stock = request.getParameter("stock");
      
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
     pst = con.prepareStatement("update categories set name = ?,description = ?,brand = ?,category = ?,qty = ?,unitprice = ?,stock = ? where id = ? ");
      
     pst.setString(1, name);
     pst.setString(2, description);
     pst.setString(3, brand);
     pst.setString(4, category);
     pst.setString(5, qty);
     pst.setString(6, unitprice);
     pst.setString(7, stock);
   
     pst.setString(8, id);
     
     pst.executeUpdate();
     
       out.println("<script type=\"text/javascript\">");
          out.println("alert('Record Updated Succssfull');");
          out.println("location='adminproducts.jsp';");
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
        <title>BUMBLE BEE STORE</title>
        
        <link rel="icon"  type="image/png" href="228-2285847_emblem-of-sri-lanka-national-emblem-of-sri.png">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="section1s" align="center" style="margin-top:20px; background-color: white;   >
 
<div class="row" style="margin-left: 20px; border-color:#06F; border: thick">
    <div class="col-sm-4">
         <h3 class="alert-warning" >Update Products </h3>
        <form class="" method="POST" action="">
         
            
            <%       
            Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
      
     String id = request.getParameter("id");
     
     pst = con.prepareStatement("select * from products where id = ?");
     pst.setString (1,id);
     rs = pst.executeQuery();
     
     while(rs.next())
     
     {
            %>
            
           
            
       
                
    <div align="left">
                <label class="form-label"> Name</label>
                <input type="text" class="form-control" placeholder="Name" name="name" id="name"  value="<%=rs.getString("name") %>"required>
                
            </div>
            <div align="left">
                <label class="form-label"> Description</label>
                <input type="text" class="form-control" placeholder="Description" name="description" id="description"  value="<%=rs.getString("description") %>" required>
                
            </div>
            <div align="left">
                <label class="form-label"> Brand</label>
                 <select name="brand"    class="form-control">
                      <options value="<%=rs.getString("brand") %>"><%=rs.getString("brand") %></options>
                      <% 
                      try{
                      Connection cont;
                      PreparedStatement pstt;
                      ResultSet rst;
                      Class.forName("com.mysql.jdbc.Driver");
                      con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
                      Statement st = con.createStatement();
                      String query = "select * from brands";
                      ResultSet rs2 = st.executeQuery(query);
                      
                      while(rs2.next()){
                      %>
                      <option><%=rs2.getString("name")%></option>
                      <%
                      }
             
                      }catch (Exception e){
                 
                      }
                      
                      %>
                  </select>
                
            </div>
            <div align="left">
                <label class="form-label">Category</label>
                 <select name="category" class="form-control">
                       <options><%=rs.getString("category")%></options>
                      <% 
                      try{
                      Connection cont;
                      PreparedStatement pstt;
                      ResultSet rst;
                      Class.forName("com.mysql.jdbc.Driver");
                      con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
                      Statement st = con.createStatement();
                      String query = "select * from categories";
                      ResultSet rs2 = st.executeQuery(query);
                      
                      while(rs2.next()){
                      %>
                      <option><%=rs2.getString("name")%></option>
                      <%
                      }
             
                      }catch (Exception e){
                 
                      }
                      
                      %>
                  </select>
                
            </div>
  <div align="left">
                <label class="form-label"> Qty</label>
                <input type="text" class="form-control" placeholder="Qty" name="qty" id="qty"  value="<%=rs.getString("qty") %>" required>
                
            </div>
             <div align="left">
                <label class="form-label"> Unit Price</label>
                <input type="text" class="form-control" placeholder="Unitprice" name="unitprice"  id="unitprice"  value="<%=rs.getString("unitprice") %>" required>
                
            </div>
              <div align="left">
                <label class="form-label"> Stock</label>
                <input type="text" class="form-control" placeholder="Stock" name="stock" id="stock" value="<%=rs.getString("stock") %>" required>
                
            </div>
           
           
                
                
            <hr>
                  
                <%
     
     }
     
                %>
            <hr>
              <div align="right">
                  <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                <p><a href=adminproducts.jsp>Click Back</a></p>
            </div> 
        </form> 
    </div>
            
            <div class="col-sm-8"> 
            
            
                <img src="css/abc.jfif" style="width: 100%; margin-top: 20%">
            
            
            
            
            </div>
        
    </div>   
        
    </body>
</html>
