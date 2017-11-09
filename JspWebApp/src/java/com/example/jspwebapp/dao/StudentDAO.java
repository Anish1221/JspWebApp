/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.jspwebapp.dao;

import com.example.jspwebapp.entity.Student;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ayusha
 */
public interface StudentDAO {
    
    List<Student> getAll() throws ClassNotFoundException, SQLException;
    int insert(Student s)throws ClassNotFoundException, SQLException;
    int delete(int id)throws ClassNotFoundException, SQLException;
    int update(Student s) throws ClassNotFoundException, SQLException;
    Student getById(int id) throws ClassNotFoundException, SQLException;
    Student getByAny(String str)  throws ClassNotFoundException, SQLException ;
    
    
    
    
}
