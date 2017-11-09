<%@page import="com.example.jspwebapp.entity.Student"%>
<%@page import="com.example.jspwebapp.dao.impl.StudentDAOImpl"%>
<%@page import="com.example.jspwebapp.dao.StudentDAO"%>

<%
    if(request.getMethod().equalsIgnoreCase("post")){
        StudentDAO stdDAO= new StudentDAOImpl();
        
        Student s= new Student();
        s.setFirstName(request.getParameter("first_name"));
        s.setLastName(request.getParameter("last_name"));
        s.setStatus(request.getParameter("status")!=null);
        stdDAO.insert(s);
        response.sendRedirect("index.jsp?success");
        
    }else{
        response.sendRedirect("index.jsp?error");
    }
%>