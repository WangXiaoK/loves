package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.StudentDao;
import com.ssm.model.Student;
import com.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * create by Gordon on 2019/2/12
 */
@Service("studentService")
public class  StudentServiceImpl implements StudentService{

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student selectStudentByName(String studentName) {
        return studentDao.selectStudentByName(studentName);
    }

    @Override
    public PageInfo selectByPage1(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Student> students = studentDao.selectAllStudent();
        PageInfo<Student> pageInfo = new PageInfo<>(students);
        return pageInfo;
    }

    @Override
    public Student selectStudent(Integer id) {
        return studentDao.selectStudent(id);
    }

    @Override
    public boolean updateStuInfo(Student student) {
        if(studentDao.selectStudentByName(student.getName()) != null){
            studentDao.updateStudent(student);
            return true;
        }
        return false;
    }

    /*
    * 遗留问题，当姓名重复的时候，去执行修改而不是添加
    * 解决方案：1.全部比较其他信息
    *           2.使用2个模态框
    *           3.(唯一识别码-身份证号)
    * */
    @Override
    public boolean addStudent(Student student) {
        Student student1 = studentDao.selectStudentByName(student.getName());
        if(student1 != null){
            return false;
        }else {
            studentDao.insertStudent(student);
            return true;
        }
    }

    @Override
    public boolean deleteStudentByName(String studentName) {
        studentDao.deleteStudentByName(studentName);
        if(studentDao.selectStudentByName(studentName) == null){
            return true;
        }
        return false;
    }

    @Override
    public List selectAllStudent() {
        return studentDao.selectAllStudent();
    }
}
