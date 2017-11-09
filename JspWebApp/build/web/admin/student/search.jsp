
<%@page import="java.util.List"%>
<%@page import="com.example.jspwebapp.entity.Student"%>
<%@page import="com.example.jspwebapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.example.jspwebapp.dao.StudentDAO"%>
<%
    String searchText = request.getParameter("searchName");

    if (request.getMethod().equalsIgnoreCase("post")) {
        //out.println("Search  sent is " + searchText + "</br>");
        try {
%>

<%@include file="../header.jsp" %>

<h1>Search Results</h1>
<div class="pull-left">
    <p>
        <a href="index.jsp" class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-home"></span> Home</a>
    </p>
</div>
<div class="pull-right">
    <form action="search.jsp" method="post">
        <input size="40" height="30" type="text" name="searchName"  placeholder="Search by First Name & Last Name"  >
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
        StudentDAO stdDAO = new StudentDAOImpl();
        Student student = stdDAO.getByAny(searchText);
        if (student != null) {

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


<%
} else {

%>
<tr>
    <td>No result found</td>
</tr>

</table>
<%       }
        } catch (Exception ex) {
            out.println(ex.getMessage() + " Error search.jsp");
        }
    } else {
        out.println("<h1>Access Denied!!!</h1>");
    }


%>

</table>
</body>
</html>

