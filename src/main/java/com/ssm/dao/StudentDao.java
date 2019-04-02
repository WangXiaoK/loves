package com.ssm.dao;

import com.ssm.model.Student;

import java.util.List;


/**
 * create by Gordon on 2019/2/12
 */
public interface StudentDao {

    Student selectStudent(Integer id);

    void insertStudent(Student student);

    Student selectStudentByName(String studentName);

    void deleteStudentByName(String studentName);

    List<Student> selectAllStudent();

    void updateStudent(Student student);
}
