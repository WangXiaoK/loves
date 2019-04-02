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
<html>
<head>
    <title>studentTable</title>
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet"/>

    <script>

        $(function () {

            $.ajax({
                type:"post",
                datatype:"json",
                contentType:"application/json;charset=UTF-8",
                url:"<%=path%>/student/showStudentUseTable.do",
                success:function (result) {
                    var result = JSON.parse(result);
                    var result1 = result.result1;
                    str = "";
                    //thead
                    for(var i = 0; i < 1; i++){
                        str += "<thead><tr><th>编号</th><th>姓名</th><th>性别</th><th>年龄</th><th>操作</th></tr></thead>";
                        str += "<tbody>"
                    }
                    //tbody
                    for(var i = 0; i < result1.length; i++){
                        str += "<tr>";
                        str += "<td>" + i + "</td><td>" + result1[i].name + "</td><td>" + result1[i].sex + "</td><td>" + result1[i].age + "</td>";
                        str += "<td>" + "<button type='button' class='btn btn-info'>信息按钮</button> <button type='button' class='btn btn-danger'>危险按钮</button>" + "</td>";
                        str += "</tr>";
                    }
                    str +="</tbody>"
                    str += "<tfoot>"
                    str += "<button type='button' class='btn btn-primary'>首页</button><button type='button' class='btn btn-primary'>前一页</button>" +
                        "<button type='button' class='btn btn-primary'>后一页</button>'" +
                        "<button type='button' class='btn btn-primary'>尾页</button>"
                    str +="</tfoot>"
                    $("#studentTable").append(str);
                },
                error:function () {
                    alert("error");
                },
            });
        })
    </script>
    <style>

    </style>
</head>
<body>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">studentTable</h3>
    </div>
    <div class="panel-body">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <table class="table table-condensed table-hover" id="studentTable"></table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
