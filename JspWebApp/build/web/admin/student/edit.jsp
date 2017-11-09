

<%@page import="com.example.jspwebapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.example.jspwebapp.dao.StudentDAO"%>
<%@page import="com.example.jspwebapp.entity.Student"%>

<%  
    int id=Integer.parseInt(request.getParameter("id"));
    StudentDAO stdDAO= new StudentDAOImpl();
    Student s= stdDAO.getById(id);
    
    
%>

<%@include file="../header.jsp" %>
<h1>Edit Student Record</h1>
<form method="post" action="update.jsp?&id=<%=id%>">
    <div class="form-group">
        <label>First Name</label>
        <input type="text" value="<%=s.getFirstName()%>" name="first_name" required="required" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Last Name</label>
        <input type="text" value="<%=s.getLastName()%>" name="last_name" required="required" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Status</label>
        <label><input type="checkbox" name="status"/>Active</label>
    </div>
    <button type="submit" class="btn btn-success btn-sm">Update</button>
</form>