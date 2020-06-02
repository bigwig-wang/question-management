<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
<jsp:include page="teacher-header.jsp"></jsp:include>

<!-- 主要的内容模块 -->
<div id="main-contain" class="container-fluid" style="margin: 1px 1px 10px 30px;padding-left: 20px;">
    <div class="row" style="width:100%; margin: 0px 0px 0px 10px;">
        <!-- 导航栏 -->
        <jsp:include page="teacher-menu.jsp"></jsp:include>
        <div class="col-lg-1"></div>

        <!-- 内容显示 -->
        <div class="col-lg-8 content-main" style="display: inline-block">
            <!-- 副菜单栏 -->
            <div class="content">
                <!-- 标题 -->
                <table>
                    <tr>
                        <td style="width: 76%"><h2 class="mb-2" style="padding-left: 40px;">QUESTION LIST</h2></td>
                    </tr>
                </table>
                <br/>

                <div class="container-fluid">
                    <table style="width: 100%;">
                        <thead>
                        <tr>
                            <th>Grade</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${questionDtoList}" var="item">
                            <tr class="tr-href1" id="yitongyi"><!--已同意的问卷-->
                                <td>${item.gradeName}</td>
                                <td>${item.title}</td>
                                <td>${item.status}</td>
                                <td>
                                    <c:if test="${item.status == 'DRAFT'}">
                                        <div class="tpl-table-black-operation">
                                            <a href="javascript:void(0);" onclick="edit(${item.id })">
                                                <i class="am-icon-pencil"></i> Edit
                                            </a>
                                            <a href="javascript:void(0);" onclick="del(${item.id })">
                                                <i class="am-icon-pencil"></i> Delete
                                            </a>
                                            <a href="javascript:void(0);" onclick="publish(${item.id})">
                                                <i class="am-icon-pencil"></i> Publish
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${item.status == 'PUBLISHED'}">
                                        <a href="javascript:void(0);" onclick="detail(${item.id})">
                                            <i class="am-icon-pencil"></i> View
                                        </a>
                                    </c:if>
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
  function detail(id) {
    //跳到对应的controller处理信息
    window.location.href = "question/edit?id=" + id;
  }

  function edit(id) {
    window.location.href = "/question/edit-page?id="+id;
  }

  function publish(id) {
    $.ajax({
      type: "GET",
      url: "/question/grade/list",
      dataType: 'json',
      cache: false,
      timeout: 600000,
      success: function (data) {
        console.log(data);
        var option = "";
        data.forEach(function(element) {
            option = option + '<option value="' + element.id + '">' + element.name + '</option>';
          }
        );

        layer.open({
          skin: 'demo-class',
          title: '发布试卷',
          closeBtn: 2
          , btn: ['确认发布']
          , content: '<div class="layui-form-item">' +
            '<label class="layui-form-label">选择班级</label>' +
            '<div class="layui-input-block">' +
            '<select name="grade" id="grade" lay-filter="range">' +
            '<option value="">请选择</option>' +
               option +
            '</select>' +
            '</div>' +
            '</div>'
          , yes: function () {
            var gradeId = $("#grade option:selected").val();
            var gradeName = $("#grade option:selected").text();

            var data = {
              id: id,
                gradeId: gradeId,
              gradeName: gradeName
            };
                $.ajax({
                  type: "POST",
                  contentType: "application/json",
                  url: "/question/publish",
                  data: JSON.stringify(data),
                  dataType: 'json',
                  cache: false,
                  timeout: 600000,
                  success: function (data) {
                    if(data.success) {
                      window.location.href = "question/list";
                    }
                    else {
                      alert(data.message);
                    }
                  }
                })
          }
        });
      }
    })
  }

  function del(id) {
    layer.confirm("Confirm Delete", {
      icon: 1,
      skin: 'layui-layer-lan',
      btn: ['Confirm', 'Cancel']
    }, function () {
      var url = "question/delete";
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
        window.location.href = "question/list";
      })

    } else {
      alert("Delete fail");
    }
  }
</script>
</body>
</html>