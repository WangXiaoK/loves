package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.model.Student;

import java.util.List;

/**
 * create by Gordon on 2019/2/12
 */
public interface StudentService {
    //修改学生信息
    boolean updateStuInfo(Student student);
    //分页查找学生
    PageInfo selectByPage1(int currentPage, int pageSize);
    //通过ID查找
    Student selectStudent(Integer id);
    //通过姓名查找
    Student selectStudentByName(String StudentName);
    //添加学生
    boolean addStudent(Student student);
    //删除学生
    boolean deleteStudentByName(String studentName);
    //查询所有学生
    List<Student> selectAllStudent();

}
