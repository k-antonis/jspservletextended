<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/store","root","");
        pst = con.prepareStatement("update product set id = ?,name = ?,price = ? where id = ?");
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, price);
        pst.setString(4, id);
        pst.executeUpdate();  
        
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
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <h1>Product Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/store","root","");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from product where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Product ID</label>
                        <input type="text" class="form-control" placeholder="id" value="<%= rs.getString("id")%>" name="id" id="id" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="name" name="name" value="<%= rs.getString("name")%>" id="name" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="price" name="price" id="price" value="<%= rs.getString("price")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="index.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html>