
<%@include file="../header.jsp" %>
<h1>Add Student</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>First Name</label>
        <input type="text" name="first_name" required="required" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="last_name" required="required" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Status</label>
        <label><input type="checkbox" name="status"/>Active</label>
    </div>
    <button type="submit" class="btn btn-success btn-sm">Save</button>
    
</form>