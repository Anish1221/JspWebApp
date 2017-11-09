/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.jspwebapp.dao.impl;

import com.example.jspwebapp.dao.StudentDAO;
import com.example.jspwebapp.dbutil.DbConnection;
import com.example.jspwebapp.entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ayusha
 */
public class StudentDAOImpl implements StudentDAO{

    private DbConnection db= new DbConnection();
    
    
    @Override
    public List<Student> getAll() throws ClassNotFoundException, SQLException{
        List<Student> studentList = new ArrayList<>();
        String sql="SELECT * FROM tbl_students";
        db.open();
        db.initStatement(sql);
        ResultSet rs= db.executeQuery();
        while(rs.next()){
            Student s= new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setStatus(rs.getBoolean("status"));
            studentList.add(s);
        }
        db.close();
        return studentList;
        
    }

    @Override
    public int insert(Student s) throws ClassNotFoundException, SQLException{
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String sql="INSERT INTO tbl_students(first_name,last_name,status) VALUES(?,?,?)";
        
        db.open();
        PreparedStatement stmt=db.initStatement(sql);
        stmt.setString(1, s.getFirstName());
        stmt.setString(2, s.getLastName());
        stmt.setBoolean(3, s.isStatus());
        int result = db.executeUpdate();
        db.close();
        return result;
    
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException{
        
        String sql="DELETE FROM tbl_students WHERE student_id=?";
        db.open();
        PreparedStatement stmt=db.initStatement(sql);
        stmt.setInt(1, id);
        int result = db.executeUpdate();
        db.close();
        return result;
        
    }

    @Override
    public int update(Student s) throws ClassNotFoundException, SQLException {
     
        String sql="UPDATE tbl_students SET first_name=?,last_name=?,status=? WHERE student_id=?";
        db.open();
        PreparedStatement stmt=db.initStatement(sql);
        stmt.setString(1, s.getFirstName());
        stmt.setString(2, s.getLastName());
        stmt.setBoolean(3, s.isStatus());
        stmt.setInt(4, s.getId());
        int result = db.executeUpdate();
        db.close();
        return result;
    }
    
    @Override
    public Student getById(int id) throws ClassNotFoundException, SQLException {
        Student s = null;
        db.open();
        PreparedStatement stmt = db.initStatement("SELECT * FROM tbl_students WHERE student_id = ?");
        stmt.setInt(1, id);
        ResultSet rs = db.executeQuery();
        if (rs.next()) {
            s = new Student();
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setStatus(rs.getBoolean("status"));
            s.setId(rs.getInt("student_id"));
            db.close();
            return s;

        }
        return null;
    }

    @Override
    public Student getByAny(String str) throws ClassNotFoundException, SQLException {
        StudentDAO studentDAO = new StudentDAOImpl();

        List<Student> stdList = studentDAO.getAll();
        
        Student std= null;
        for(Student student : stdList) {
            if(student.getFirstName().equalsIgnoreCase(str) || student.getLastName().equalsIgnoreCase(str)) {
                std = student;
            }               
         }
        return std;
        
    }

}

