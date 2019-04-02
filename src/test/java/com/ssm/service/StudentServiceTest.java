package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.dao.StudentDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



/**
 * create by Gordon on 2019/2/23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class StudentServiceTest {
    @Autowired
    StudentDao studentDao;
    @Autowired
    StudentService studentService;
    @Test
    public void testSelectByPage1(){
        PageInfo pageInfo = studentService.selectByPage1(35,5);
        System.out.println(pageInfo.getList().size());
    }


}