<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <title>test</title>
</head>
<body>
<script>

</script>
    <form name="studentForm" method="post" action="<%=path%>/student/add.do">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="studentName"  ></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><input type="text" name="studentSex"></td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" name="studentAge"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="提交">
                </td>
                <td>
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
