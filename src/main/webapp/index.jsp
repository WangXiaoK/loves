<html>
<head>
    <meta charset="UTF-8">
    <title>test</title>
</head>
<body>
<script>
    function selectStudent() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function (ev) {
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                document.getElementById("test").innerHTML = xmlhttp.responseText;
            }
        }
        var id = 0;
        var url = "student/showStudent.do?id=" + id;
        xmlhttp.open("POST",url,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoed");
        xmlhttp.send(null);
    }

</script>
<p id="test">Hello world!</p>
<button type="button" onclick="selectStudent()">onclick test</button>
</body>
</html>
