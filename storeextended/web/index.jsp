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
        pst = con.prepareStatement("insert into product(id,name,price)values(?,?,?)");
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, price);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Added");     
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
        <h1>Product Registation System</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Product ID</label>
                        <input type="text" class="form-control" placeholder="id" name="id" id="id" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="name" name="name" id="name" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="price" name="price" id="price" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-16">
                 <div class="panel-body">
                     <table id="tbl-product" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Product ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/store","root","");
                                
                                  String query = "select * from product";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("id") %></td>
                                 <td><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("price") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
 
            </div>  
        </div>
 
    </body>
</html>