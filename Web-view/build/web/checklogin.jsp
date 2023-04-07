<%@ page import="java.sql.*"%>
<%
    String action=request.getParameter("action");
    if(action.equals("signin")){
      String username=request.getParameter("username");
      String password=request.getParameter("password");
      
      
      try{
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bumblebee", "root", "");        
      Statement st = con.createStatement();
      ResultSet rs=st.executeQuery("select * from admin where email='"+username+"' and password='"+password+"'");
      if(rs.next()){
      
      session.setAttribute("uname", username);
      response.sendRedirect("adminindex.jsp");
      
      }
      else{
      
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Username and password not match');");
          out.println("location='index.jsp';");
          out.println("</script>");
      }
      }
      catch(Exception e)
       {
      
      out.println(e);
      
      
      }
      
    }
%>