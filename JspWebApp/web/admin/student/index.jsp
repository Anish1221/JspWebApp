<%@page import="com.example.jspwebapp.entity.Student"%>
<%@page import="com.example.jspwebapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.example.jspwebapp.dao.StudentDAO"%>

<%
    StudentDAO stdDAO = new StudentDAOImpl();
    if(request.getParameter("action")!=null && request.getParameter("action").equalsIgnoreCase("delete") && request.getParameter("id")!=null){
        int id= Integer.parseInt(request.getParameter("id"));
        stdDAO.delete(id);
        response.sendRedirect("index.jsp");
    }
    
    
    
%>

<%@include file="../header.jsp" %>
            <h1>Students</h1>
            <div class="pull-right">
                <p>
                    <a href="add.jsp" class="btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-plus"></span>Add</a>
                </p>
                
                <form action="search.jsp" method="post">
                    <input size="40" height="30" type="text" name="searchName"  placeholder="Search by First Name, Last Name, Id, Status"  >
                    <button type="submit" class="btn btn-info btn-lg">
                    <span class="glyphicon glyphicon-search"></button>

                </form>
            </div>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <%
                    
                    for (Student student : stdDAO.getAll()) {
                %>
                <tr>
                    <td><%=student.getId()%></td>
                    <td><%=student.getFirstName()%> <%=student.getLastName()%></td>
                    <td><%=student.isStatus()%></td>
                    <td>
                        <a href="edit.jsp?&id=<%=student.getId()%>" class="btn btn-success btn-sm">
                            <span class="glyphicon glyphicon-pencil"></span>Edit</a>
                        <a href="index.jsp?action=delete&id=<%=student.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?')">
                            <span class="glyphicon glyphicon-trash"></span>Delete</a>
                    </td>

                </tr>

                <% }%>
            </table>
    </body>
</html>
