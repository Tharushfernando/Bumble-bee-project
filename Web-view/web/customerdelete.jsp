<%@page import="java.sql.*"%>
<%

   
     String id = request.getParameter("id");

     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");  
     pst = con.prepareStatement("delete from customers where id = ? ");
     pst.setString(1, id);
     pst.executeUpdate();
     
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Record Deleted Succssfull');");
          out.println("location='admincustomers.jsp';");
          out.println("</script>");

%>
  
 