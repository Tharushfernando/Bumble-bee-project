<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*"%>
<%

    if(request.getParameter("submit")!=null)
    {
     String id = request.getParameter("id");   
     String name = request.getParameter("name");
 
  
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
     pst = con.prepareStatement("insert into brands (name)values(?)") ;
     
     pst.setString(1, name);
     pst.executeUpdate();
     
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Record Added Succssfull');");
          out.println("location='adminbrands.jsp';");
          out.println("</script>");

%>
<script>
    alert("Record Added");
</script>    
<% 

}

%>



<html>
    <head>
      <title>BUMBLE BEE STORE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
     
<link rel="icon"  type="image/png" href="228-2285847_emblem-of-sri-lanka-national-emblem-of-sri.png">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div align="center">
            <a><img src="css/abc.jfif" width="15%" ></a>   	</div>
<div class="topnav" style="padding-left: 30px">
    
<a   href="adminindex.jsp"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;  Main Menu</a>
<a href="admincustomers.jsp">Customers</a>
<a  href="adminadministrators.jsp">Administrators</a>
<a class="active"  href="adminbrands.jsp">Brands</a>
<a href="admincategories.jsp">Categories</a>
<a href="adminproducts.jsp">Products</a>
 
<a href="adminappointments.jsp">Products</a>
<a href="index.jsp">Log Out</a>
<a style="color: #06F">
<%
    out.println("User Name - " + session.getAttribute("uname"));
%>
</a>
<h3  align="right" style="font-family:Cambria, 'Hoefler Text', 'Liberation Serif', Times, 'Times New Roman', 'serif'"></h3>
</div>	
<div class="section1" align="center" style="margin-top:40px; background-color: white" >
<h1 class="alert-danger" >Manage Brands</h1>
 	  
<hr>
<div class="row" style="margin-left: 20px; border-color:#06F; border: thick">
    <div class="col-sm-4">
         <h3 class="alert-danger" >Add Brands </h3>
        <form class="" method="POST" action="">
           
            <div align="left">
                <label class="form-label"> Name</label>
                <input type="text" class="form-control" placeholder="Name" name="name" id="name" required>
                
            </div>
 
             <hr>
              <div align="right">
                  <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
            </div> 
        </form> 
    </div>
    
  <div class="col-sm-8">   
      <div class="panel-body">
           <h3 class="alert-danger" >All Brands </h3>
          <table id="tbl-patients" class="table table-responsive table-bordered" cellpadding="0" width="100%">
              <thead>
                  <tr>
                      <th>ID</th>
                       <th>Name</th>
                      
                           <th>Edit</th>
                            <th>Delete</th>
                  </tr>
                  
                  <%
                    
                  Connection con;
                  PreparedStatement pst;
                  ResultSet rs;
     
                  Class.forName("com.mysql.jdbc.Driver");
                  con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
                  
                  String  query = "select * from brands";
                  Statement st = con.createStatement();
                  
                  rs = st.executeQuery(query);
                  while(rs.next())
                  {
                   String id = rs.getString("id");
                   
                  %>
                  
              </thead>
              <tr>
                  <td><%=rs.getString("id") %></td>
                  <td><%=rs.getString("name") %></td>
           
               
                  <td><a href="brandupdate.jsp?id=<%=id%>">Edit</a></td>
                  <td><a href="branddelete.jsp?id=<%=id%>">Delete</a></td>
              </tr>
              
              <%
              
              }
                  
                  %>
              
              
          </table>
       
      </div>

  </div>
</div>
	  </div>
 		
<footer class="footer-distributed">

			<div class="footer-left">

			<a><img src="css/abc.jfif" width="150px"></i>  </a>

				<p class="footer-links">
	 
		 
				</p>

				<p class="footer-company-name">BUMBLE BEE</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p>BUMBLE BEE STORE,<br> De Saram Place, Colombo 10</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+94-11-2681548 </p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
						<p><a href="">  BEE@sltnet.lk  , BUMBLE@BEE.lk  </a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>Copyright © BUMBLE BEE - 2023</span>
					Fast fashion giant Boohoo has unveiled that it will be opening its first ever pop-up shop on Great Portland Street, Central London.

The location will be accessible from March 25 to 26, with its opening times for both days set from 11am to 5pm.

The pop-up will house the brand?s latest collections and newest arrivals, including a range of transitional pieces with multiple sizes available.
				</p>

				 

			</div>

		</footer>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/slider.js"></script>	
</html>
