<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/20
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ page isELIgnored="false" %>--%>
<html>
<head>
    <title>studentTable</title>
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet"/>

    
</head>
<body>
<div class="container">
    <!--员工修改模态框  -->
    <!-- Modal -->
    <div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">student修改</h4>
                </div>
                <!--表单内容  -->
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="name_update_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" id="name_update_input" placeholder="Name">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="age_update_input" class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="age" id="age_update_input" placeholder="18">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex_update_input" value="男"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex2_update_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <!--表单内容结束  -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 添加Modal -->
    <div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Student添加</h4>
                </div>
                <!--表单内容  -->
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="name_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" id="name_add_input" placeholder="Name">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="age_add_input" class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="age" id="age_add_input" placeholder="18">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex_add_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex2_add_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <!--表单内容结束  -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!--标题  -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM增删改查实例</h1>
        </div>
    </div>
    <!--按钮  -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="stu_add_model_btn">新增</button>
            <button class="btn btn-danger" id="stu_delete_all_btn">删除</button>
        </div>
    </div>
    <!--显示表格数据  -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <!--表格头  -->
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>学生姓名</th>
                    <th>学生性别</th>
                    <th>学生年龄</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!--表格体  -->
                <tbody></tbody>
            </table>
        </div>
    </div>
    <!--显示分页信息  -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area">
            <!-- 当前页，总页，总条记录 -->
        </div>
        <!--分页条信息  -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
    <script>

        //定义全局变量，总记录数
        var totalRecord,currentPage;

        //页面加载完成以后，直接去发送ajax请求，要到分页数据
        $(function(){
            //页面加载完默认进首页
            to_page(1);
        });

        //点击页面时，实现页码跳转
        function to_page(pn){
            var page = new Object();
            page.pageNum = pn;
            // console.log(pn);
            $.ajax({
                type:"post",
                url:"<%=path%>/student/studentJson.do",
                dataType:"json",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(page),//pn是用户指定跳转的页码数
                //请求成功的回调函数，result是服务器响应给浏览器的数据
                success:function(result){
                    // console.log(result);//需要在浏览器的控制台中查看
                    //1.解析并显示员工数据
                    build_stu_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //3.解析显示分页条
                    build_page_nav(result);
                },
                error:function () {
                    console.log("获取失败");
                }
            });
        }

        //解析并显示员工数据
        function build_stu_table(result){
            var result = result.studentList;
            var list = result.list;
            // console.log(list);//测试表格数据
           // $.each(list,function (index,item) {
           //     console.log("index:",index);
           //     console.log(item.valueOf());
           // })
            //清空table表格
            $("#emps_table tbody").empty();

            //获取json串中返回的结果集（库表中的数据）
            // var emps = result.list;
            // $.each(result,function (index,item) {
            //     console.log(item);
            // })

            //循环遍历结果集==>循环遍历所有员工数据
            //参数1：要遍历的emps集合，参数2:每次遍历的回调函数
            //回调函数：参数1：索引，参数2：当前对象
            $.each(list,function(index,item){
                //alert(item.empName);
                //把解析的数据放到表格中展示，以下的DOM解析表格
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'></td>");
                var id=$("<td></td>").append(index);
                var name=$("<td></td>").append(item.name);
                var sex=$("<td></td>").append(item.sex);
                var age=$("<td></td>").append(item.age);
                /*
                <button class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;编辑
                </button>
                <button class="btn btn-danger btn-sm">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;删除
                </button>
                */
                var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("&nbsp;").append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",name);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("&nbsp;").append("删除");
                //为删除按钮添加一个自定义的属性，来表示当前删除的员工id
                delBtn.attr("del-id",item.name);
                var btnTd=$("<td></td>").append(editBtn).append("&nbsp;").append(delBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd).append(id).append(name)
                    .append(sex)
                    .append(age)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }

        //解析显示分页信息
        function build_page_info(result){
            var list = result.studentList;
            //清空分页信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+list.pageNum+"页，总"+
                list.pages+"页，总"+
                list.total+"条记录");
            totalRecord=list.total;
            currentPage=list.pageNum;
        }

        //解析显示分页条
        function build_page_nav(result){
            var list = result.studentList;
            //清空分页导航
            $("#page_nav_area").empty();
            //page_nav_area
            //创建ul
            var ul=$("<ul></ul>").addClass("pagination");
            //首页
            var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            //前一页
            var prePageLi=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")));
            //如果没有了前一页，首页和前一页按钮不可用
            if(list.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");

            }
            //为元素添加点击翻页事件
            //首页单击事件
            firstPageLi.click(function(){
                to_page(1);
            });
            //上一页单击事件:当前页-1
            prePageLi.click(function(){
                to_page(list.pageNum-1);
            });

            //后一页
            var nextPageLi=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")));
            //末页
            var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            //如果没有了下一页，末页和下一页按钮不可用
            if(list.hasNextPage==false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");

            }
            //下一页的单击事件：当前页+1
            nextPageLi.click(function(){
                to_page(list.pageNum+1);
            });
            lastPageLi.click(function(){
                to_page(list.pages);
            });


            //添加首页和前一页的提示
            ul.append(firstPageLi).append(prePageLi);
            //循环遍历给ul中添加页码提示，取出页码号 1,2,3,4,5，
            $.each(list.navigatepageNums,function(index,item){
                var numLi=$("<li></li>").append($("<a></a>").append(item));
                //如果当前页码等于正在循环遍历的页码，则页码变色
                if(list.pageNum==item){
                    numLi.addClass("active");
                }
                //给页码添加单击事件
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            });
            //添加下一页和末页的提示
            ul.append(nextPageLi).append(lastPageLi);
            //创建nav,将ul标签添加到nav标签中
            var nav=$("<nav></nav>").append(ul);
            //将分页条添加到上面id中
            nav.appendTo("#page_nav_area");
        }

        // 清除表单数据（表单重置--表单的数据，表单的样式）
        function reset_form(ele){
            $(ele)[0].reset();//清空表单数据，防止再次打开模态框时，带有之前添加的的数据
            //清空模态框表单中上次残留的样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框
        $("#stu_add_model_btn").click(function(){
            //1.清除表单数据（表单重置--表单的数据，表单的样式）,获取表单,jquery没有reset()方法，需要转成原生对象
            // $("#stuAddModal form")[0].reset(); -->统一写一个函数，见上面
            reset_form("#stuAddModal form");
            //设置模态框中的按钮的值

            //2.弹出模态框
            $("#stuAddModal").modal({
                backdrop:"static"
            });
        });

        //点击保存按钮
        $("#stu_save_btn").click(function () {
            var student = new Object();

            student.name = $("#name_add_input").val();
            student.sex = $('#stuAddModal form input[name=\"sex\"]:checked').val();
            student.age = $('#age_add_input').val();
            // console.log(JSON.stringify(student));//测试学生数据

            // console.log(student.sex);//测试获取form下radio
            $.ajax({
                type:"post",
                dataType:"json",
                url:"<%=path%>/student/addUseAjax.do",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(student),
                success:function (result) {
                    // alert(result.success);
                    //1、隐藏模态框
                    $('#stuAddModal').modal('hide');
                    // 2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求，显示最后一页数据即可
                    console.log("totalRecord: ",totalRecord);
                    var tot = totalRecord +1;
                    to_page(parseInt(tot/5));
                },
                error:function () {
                    alert("添加失败！");
                }
            });

        });

        //给编辑按钮添加点击事件
        $(document).on("click",".edit_btn",null,function () {
            reset_form("#stuAddModal form");
            //点击编辑按钮显示模态框,修改模态框中的值
            var student = new Object();
            student.age = $(this).parent().prev().text();
            student.sex = $(this).parent().prev().prev().text();
            student.name = $(this).parent().prev().prev().prev().text();
            // console.log( $(this).parent().prev().text());
            // console.log(student);
            $("#name_update_input").attr("placeholder",student.name);
            $("#age_update_input").attr("placeholder",student.age);


            // console.log("student.sex:",student.sex);
            // console.log($('#sex_update_input').val());
            // console.log(student.sex == $('#sex_update_input').val());

            $('#sex_update_input').attr('checked',student.sex);
            if($('#sex_update_input').val() == student.sex){
                console.log("change begin");
                $('#sex_update_input').prop('checked','checked');
                console.log("change end");
            }else{
                $('#sex2_update_input').prop('checked','checked');
            }
            // if($('#sex2_update_input').val() == student.sex){
            //     $('#sex2_update_input').attr('checked',student.sex);
            // }
            // $('#stuUpdateModal form input[name=\"sex\"]').attr('checked',student.sex);
            $("#stuUpdateModal").modal({
                backdrop:"static"
            });
        })
        //点击更新按钮
        $("#stu_update_btn").click(function () {
            var student = new Object();
            student.name = $('#name_update_input').val();
            student.age = $('age_update_input').val();
            student.sex = $('#stuUpdateModal form input[name=\"sex\"]:checked').val();

            console.log(student);

            $.ajax({
                type:'post',
                dataType:'json',
                contentType:'application/json;charset=utf-8',
                data:JSON.stringify(student),
                url:'<%=path%>/student//studentUpdate.do',
                success:function (result) {
                    alert(result.success);
                },
                error:function () {
                    alert("修改失败！");
                }
            })
            $()
        })

        //给删除按钮添加点击事件
        $(document).on('click','.delete_btn',function(){
            var student = new Object();
            student.name = $(this).parent().prev().prev().prev().text();
            console.log(student.name);
            $.ajax({
                type:'post',
                dataType:'json',
                contentType:'application/json;charset=utf-8',
                success:function (result) {
                    alert(result.success);
                },
                error:function () {
                    alert('删除失败')
                }
            })
        })

    </script>
</body>
</html>
