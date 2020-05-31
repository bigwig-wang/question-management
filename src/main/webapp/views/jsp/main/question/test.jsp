<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 管理员界面-库管理-问卷库 -->
<jsp:include page="../base.jsp"></jsp:include>
<html lang="zh">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">--%>
    <title>Personal Center-administrators</title>
    <link href="static/css/per-studentcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <input type="button" value="Test" onclick="test()"/>
</body>

<script>
    function test() {
      var dataItem = {"a": 1};
      alert(1);
      $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/question/save",
        data: JSON.stringify(dataItem),
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {

          var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
            + JSON.stringify(data, null, 4) + "&lt;/pre&gt;";
          $('#feedback').html(json);

          console.log("SUCCESS : ", data);
          $("#btn-search").prop("disabled", false);

        }
      })
    }
</script>

</html>