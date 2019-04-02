package com.ssm.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.model.Student;
import com.ssm.service.StudentService;
import com.ssm.util.PageObject1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * create by Gordon on 2019/2/12
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    static int number = 0;
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/studentUpdate.do")
    @ResponseBody
    public JSONObject studentUpdate(@RequestBody Student student){
        JSONObject jsonObject = new JSONObject();
        if(studentService.updateStuInfo(student)){
            jsonObject.put("success","修改成功！");
        }else {
            jsonObject.put("error","该学生不存在！");
        }
            return jsonObject;
    }

    @RequestMapping(value = "/studentJson.do")
    @ResponseBody
    public JSONObject showStudentJson(@RequestBody PageObject1 pageObject1){
        System.out.println(number++);
        int pn = pageObject1.getPageNum();
        System.out.println(pn);
        PageInfo<Student> pageInfo = studentService.selectByPage1(pn,5);
        JSONObject jsonObject = new JSONObject();
        System.out.println(pageInfo.toString());
        jsonObject.put("studentList",pageInfo);
        return jsonObject;
    }

    @RequestMapping(value = "/showStudentUseTable.do")
    @ResponseBody
    public JSONObject showAllStudent(){
        JSONObject jsonObject1 = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        List<Student> students = studentService.selectAllStudent();
//        for(Student student : students) {jsonArray.add(student);}

        for (Student student: students){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name",student.getName());
            jsonObject.put("sex",student.getSex());
            jsonObject.put("age",student.getAge());
            jsonArray.add(jsonObject);
        }
        jsonObject1.put("result1",jsonArray);

        return jsonObject1;
    }


    @RequestMapping(value = "/studentList")
    public String showStudentTable1(){
        return "studentTable1";
    }

    @RequestMapping(value = "/showStudentUseAjax.do")
    @ResponseBody
    public JSONObject showStudentUseAjax(@RequestBody Student showStudent){
        Student student = studentService.selectStudentByName(showStudent.getName());
        JSONObject jsonObject = new JSONObject();
        if(student != null){
            jsonObject.put("name",student.getName());
            jsonObject.put("age",student.getAge());
            jsonObject.put("sex",student.getSex());
        }else {
            jsonObject.put("state","对不起没有这个人！");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/deleteUseAjax.do")
    @ResponseBody
    public JSONObject deleteUserAjax(@RequestBody Student student2){
        JSONObject jsonObject = new JSONObject();
                if(studentService.deleteStudentByName(student2.getName())){
                    jsonObject.put("state","删除成功");
                }else {
                    jsonObject.put("state","删除失败");
                }
        return jsonObject;
    }

    //返回deleteUseAjax
    @RequestMapping(value = "/delete")
    public String returnDeleteUseAjax(){
        return "deleteUseAjax";
    }

    //addAjax.do
    @RequestMapping(value = "/addUseAjax.do")
    @ResponseBody
    public JSONObject addUseAjax(@RequestBody Student addStudent){
        System.err.println(addStudent.toString());
        JSONObject jsonObject = new JSONObject();
            Student student = new Student();
            student.setName(addStudent.getName());
            student.setAge(addStudent.getAge());
            student.setSex(addStudent.getSex());
            if (studentService.addStudent(student)) {
                jsonObject.put("success","添加成功");
            } else {
                jsonObject.put("error","添加失败");
            }
           /* JSONObject jsonObject = new JSONObject();
            if (studentService.addStudent(student)) {
                jsonObject.put("name",student.getName());
                jsonObject.put("age",student.getAge());
                jsonObject.put("sex",student.getSex());
                return jsonObject;
            } else {
                jsonObject.put("state","fail");
                return jsonObject;
            }*/
        return jsonObject;
    }

    //跳转到add界面
    @RequestMapping(value = "/add")
    public String add(){
        return "addUseAjax";
//        return "add";
    }

    //使用request.getParameter(String str)获取参数
    @RequestMapping(value = "/add.do")
    @ResponseBody
    public JSONObject addStudent(HttpServletRequest request,HttpServletResponse response) throws  IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            //输出得到的数据
            System.out.println(request.getParameter("studentName"));
            System.out.println((request.getParameter("studentAge")));
            System.out.println(request.getParameter("studentSex"));
            //解析成对象
            String studentName = request.getParameter("studentName");
            int studentAge = Integer.parseInt(request.getParameter("studentAge"));
            String studentSex = request.getParameter("studentSex");
            Student student = new Student();
            student.setName(studentName);
            student.setAge(studentAge);
            student.setSex(studentSex);
            //添加数据，并返回JSON对象
            JSONObject jsonObject = new JSONObject();
            if (studentService.addStudent(student)) {
                jsonObject.put("name",student.getName());
                jsonObject.put("age",student.getAge());
                jsonObject.put("sex",student.getSex());
                return jsonObject;
            }else {
                jsonObject.put("state","fail");
                return jsonObject;
            }}catch (NullPointerException e) {
            e.printStackTrace();
        }

         /*   if (studentService.addStudent(student)) {
               return "success";
            } else {
                return "fail";
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return null;*/
        return  null;
    }


    @RequestMapping(value = "/showStudent.do")
    public void selectStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.err.println(request.getParameter("id"));
        Integer id = Integer.parseInt(request.getParameter("id"));
        Student student = this.studentService.selectStudent(id);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(student));
        response.getWriter().close();
    }
}
