
<%@page import="com.example.jspwebapp.entity.Student"%>
<%@page import="com.example.jspwebapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.example.jspwebapp.dao.StudentDAO"%>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        
        int id=Integer.parseInt(request.getParameter("id"));
        StudentDAO stdDAO = new StudentDAOImpl();
        Student s = stdDAO.getById(id);
        
        s.setFirstName(request.getParameter("first_name"));
        s.setLastName(request.getParameter("last_name"));
        s.setStatus(request.getParameter("status") != null);
        s.setId(id);
        try{
            stdDAO.update(s);
            response.sendRedirect("index.jsp?success");
        }catch(Exception ex){
            out.println(ex.getMessage() + s.getId() + "update error");
        }
    }else{
        response.sendRedirect("index.jsp?error");
    }
       
%>