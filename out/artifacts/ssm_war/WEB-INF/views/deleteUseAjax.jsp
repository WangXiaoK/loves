<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/19
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>deleteUseAjax</title>
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet">
    <style>
        .row-fluid{
            width: auto;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script>
        $(function () {
            //删除学生
            $(".btn.btn-danger").click(function () {
                var student = new Object();
                student.name = $(".input-medium.search-query").val();
                $.ajax({
                    type:"post",
                    dataType:"json",
                    url:"<%=path%>/student/deleteUseAjax.do",
                    contentType:"application/json;charset=utf-8",
                    data:JSON.stringify(student),
                    success:function (result) {
                        $("#displayInfo > h3 ").html(JSON.stringify(result));
                    },
                    error:function () {
                        $("#displayInfo > h3").html("查找失败！");
                    },
                });
            });
            $(".btn.btn-info").click(function () {
                var student = new Object();
                // student.name = "abc";
                // student.age = 17;
                // student.sex = "男";
                student.name = $(".input-medium.search-query").val();
                // $(".input-medium.search-query").val(JSON.stringify(student));//将对象转换为json字符串
                // data:'{"name":"abc"}',
                // '{"name":"李晓璐"}'

                $.ajax({
                    type:"post",
                    datatype:"json",
                    <%--url:"<%=path%>/student/deleteUseAjax.do",--%>
                    url:"<%=path%>/student/showStudentUseAjax.do",
                    // contentType:"application/x-javascript;charset=utf-8",
                    contentType:"application/json;charset=utf-8",
                    data:JSON.stringify(student),
                    // data:'{"name":"abc","sex":"男","age":18}',
                    // data:JSON.stringify(student),
                    success:function (result) {
                        alert(result);
                        $("#displayInfo > h3 ").html(result);
                    },
                    error:function () {
                        $("#displayInfo > h3").html("查找失败！");
                    },
                });
            });
        });
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">你好</h3>
            </div>
            <div class="panel-body">
                <div class="row-fluid">
                    <div class="span2">
                    </div>
                    <div class="span6" id="displayInfo">
                        <h3 class="text-info">
                            deleteUseAjax
                        </h3>
                            <input class="input-medium search-query" type="text" name="studentName"/> <button class="btn btn-info" type="submit">查找</button><button class="btn btn-danger" type="button">删除</button>
                    </div>
                    <div class="span4">
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
