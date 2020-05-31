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
<jsp:include page="admin-header.jsp"></jsp:include>

<!-- 主要的内容模块 -->
<div id="main-contain" class="container-fluid" style="margin: 1px 1px 10px 30px;padding-left: 20px;">
    <div class="row" style="width:100%; margin: 0px 0px 0px 10px;">
        <!-- 导航栏 -->
        <jsp:include page="admin-menu.jsp"></jsp:include>
        <div class="col-lg-1"></div>

        <!-- 内容显示 -->
        <div class="col-lg-8 content-main" style="display: inline-block">
            <!-- 副菜单栏 -->
            <div class="content">
                <!-- 标题 -->
                <table>
                    <tr>
                        <td style="width: 76%"><h2 class="mb-2" style="padding-left: 40px;">DATABASE MANAGEMENT QUESTIONNAIRE</h2></td>
<%--                        <td style="width: 10%"><a class="btn btn-primary btn-xl js-scroll-trigger" href="#" id="selectAll">Select All</a></td>--%>
<%--                        <td style="width: 7%"><a class="btn btn-primary btn-xl js-scroll-trigger" href="#" id="delete">Delete</a></td>--%>
                    </tr>
                </table>
                <br/>

                <div class="container-fluid">
                    <table style="width: 100%;">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${gradeList}" var="item">
                            <tr class="tr-href1" id="yitongyi"><!--已同意的问卷-->
                                <td>${item.no}</td>
                                <td>${item.name}</td>
                                <td>${item.description}</td><!--查看此问卷的详细内容-->
                                <td>
                                    <div class="tpl-table-black-operation">
                                        <a href="javascript:void(0);" onclick="edit(${item.id })">
                                            <i class="am-icon-pencil"></i> Edit
                                        </a>
                                        <a href="javascript:void(0);" onclick="del(${item.id })">
                                            <i class="am-icon-pencil"></i> Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<script>
  function edit(id) {
    //跳到对应的controller处理信息
    window.location.href = "grade/edit?id=" + id;
  }

  function del(id) {
    layer.confirm("Confirm Delete", {
      icon: 1,
      skin: 'layui-layer-lan',
      btn: ['Confirm', 'Cancel']
    }, function () {
      var url = "grade/delete";
      var data = {};
      data["id"] = id;
      fajax(url, data, delCallback);//调用下面的回调函数
    }, function () {

    })

  }

  function delCallback(data) {
    if (data.success) {
      layer.confirm("Delete Successfully", {
        icon: 1,
        skin: 'layui-layer-lan',
        btn: ['Confirm']
      }, function () {
        window.location.href = "grade/list";
      })

    } else {
      alert("Delete fail");
    }
  }
</script>
</body>
</html>