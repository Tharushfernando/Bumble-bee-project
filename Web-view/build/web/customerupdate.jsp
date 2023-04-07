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
     String age = request.getParameter("age");
     String address = request.getParameter("address");
     String NIC = request.getParameter("NIC");
     String loan_balance = request.getParameter("loan_balance");
     String used_amount = request.getParameter("used_amount");
     String installment_plan = request.getParameter("installment_plan");
     
      
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
     pst = con.prepareStatement("update customers set name = ?,age = ?,address = ?, nic = ?, loan_balance = ?, used_amount = ?, installment_plan  = ? where id = ? ");
     pst.setString(1, name);
     pst.setString(2, age);
     pst.setString(3, address);
     pst.setString(4, NIC);
     pst.setString(5, loan_balance);
     pst.setString(6, used_amount);
     pst.setString(7, installment_plan);
  
     pst.setString(8, id);
     pst.executeUpdate();
     
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Record Updated Succssfull');");
          out.println("location='admincustomers.jsp';");
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
         <h3 class="alert-success" >Update Customers </h3>
        <form class="" method="POST" action="">
         
            
            <%       
            Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
      
     String id = request.getParameter("id");
     
     pst = con.prepareStatement("select * from customers where id = ?");
     pst.setString (1,id);
     rs = pst.executeQuery();
     
     while(rs.next())
     
     {
            %>
            
            <div align="left">
                <label class="form-label">Patient Name</label>
                <input type="text" class="form-control" placeholder=" Name" name="name" id="name" value="<%=rs.getString("name") %>"  >
                
            </div>
            <div align="left">
                <label class="form-label">Age</label>
                <input type="text" class="form-control" placeholder=" Age" name="age" id="age" value="<%=rs.getString("age") %>"  >
                
            </div>
             <div align="left">
                <label class="form-label">Address</label>
                <input type="text" class="form-control" placeholder=" Address" name="address" id="address" value="<%=rs.getString("address") %>"  >
                
            </div>
             <div align="left">
                <label class="form-label">NIC</label>
                <input type="text" class="form-control" placeholder=" NIC" name="NIC" id="NIC" value="<%=rs.getString("nic") %>"  >
              </div>  
           
           <div align="left">
                <label class="form-label">Loan Balance</label>
                <input type="text" class="form-control" placeholder=" Loan Balanace" name="loan_balance" id="loan_balance" value="<%=rs.getString("loan_balance") %>"  >
              </div>  
              <div align="left">
                <label class="form-label">Used Amount</label>
                <input type="text" class="form-control" placeholder=" Used Amount" name="used_amount" id="used_amount" value="<%=rs.getString("used_amount") %>"  >
              </div>  
              <div align="left">
                <label class="form-label">Installment Plan</label>
                <input type="text" class="form-control" placeholder=" Installment Plan" name="installment_plan" id="installment_plan" value="<%=rs.getString("installment_plan") %>"  >
              </div>  
        
  
                  
                <%
     
     }
     
                %>
            <hr>
              <div align="right">
                  <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
           
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                <p><a href="admincustomers.jsp">Click Back</a></p>
            </div> 
        </form> 
    </div>
            

        
    </div>   
        
    </body>
</html>
