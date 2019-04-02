package com.ssm.dao;

import com.ssm.model.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * create by Gordon on 2019/2/12
 */
//加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class StudentDaoTest {
    @Autowired
    private StudentDao dao;

    @Test
    public void testUpdateStudent(){
        Student student = dao.selectStudentByName("王晓康");
        System.out.println(student);
        student.setAge(10);
        dao.updateStudent(student);
    }

    @Test
    public void testSelectAll(){
        List<Student> list = dao.selectAllStudent();
        for(Student student:list){
            System.out.println(student);
        }
    }
    @Test
    public void testDeleteByName(){
        String name = "abc";
        dao.deleteStudentByName(name);
    }
    @Test
    public void testAddStudent(){

        for(int i=0; i<20; i++){
            Student student = new Student();
            student.setName("student" + i);
            student.setSex("men");
            student.setAge((int)(Math.random()*50));
            dao.insertStudent(student);
        }
//        student.setName("W");
//        student.setSex("female");
//        student.setAge(30);
//        dao.insertStudent(student);
//        Student student1 = dao.selectStudentByName("W");
//        System.out.println(student.toString());
    }

    @Test
    public void testSelectStudentByName(){
        String studentName = "Gordon";
        Student student = dao.selectStudentByName(studentName);
        System.out.println(student.toString());
    }

    @Test
    public void testSelectStudent(){
        Integer id = 0;
        Student student = dao.selectStudent(id);
        System.out.println(student.getName());
    }
}