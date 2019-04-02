<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/15
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>addStudentUseAjax</title>
    <link href="<%=path %>/bootstrap-3.3.7-dist/css/bootstrap.css"rel="stylesheet">
    <style>
        .col-center-block {
            width: auto;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=path%>/js/jquery.js"></script>
    <script>
        $(function () {
            $("#button-submit").click(function () {
                $("#p-display").html($("#form1").serialize());
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "<%=path%>/student/add.do",//url
                    <%--url: "<%=path%>/student/addUseAjax.do",--%>
                    // contentType : "application/x-www-form-urlencoded; charset=utf-8",
                    // contentType : "application/json;charset=UTF-8",
                    contentType:"application/json",
                    data:$("#form1").serialize(),
                    success: function(result){
                        console.log(result);//打印服务端返回的数据（调试)
                            $("#h1-add").html("添加成功");
                    },
                    error: function () {
                        $("#h1-add").html("添加失败");
                    },
                });
            });
        });

    </script>
</head>

<body>

    <p id="h1-add">Welcome to addAjax.jsp</p>
    <p id="p-display">display form-json</p>
    <form id="form1" class="form-horizontal col-center-block">
        <fieldset>
            <div id="legend" class="">
                <legend class="">添加Student</legend>
            </div>


            <div class="control-group">
                <div class="controls">
                    <label class="control-label">姓名：</label><input type="text" placeholder="" class="input-xlarge" name="studentName">
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label">性别：</label><input type="text" placeholder="" class="input-xlarge" name="studentSex">
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="control-group">

                <div class="controls">
                    <label class="control-label">年龄：</label><input type="text" placeholder="" class="input-xlarge" name="studentAge">
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"></label>

                <!-- Button -->
                <div class="controls">
                    <botton type="button" class="btn btn-success" id="button-submit">提交</botton>
                </div>
            </div>

        </fieldset>
    </form>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</body>
</html>
