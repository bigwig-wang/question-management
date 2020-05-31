<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="base.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <!-- viewport标记，用于指定用户是否可以缩放Web页面，并对相关的选项进行设定
     device-width，视区宽度应为设备的屏幕宽度
     initial-scale用于设置Web页面的初始缩放比例,设为1.0则显示未经缩放的Web页面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- 网页描述文字 -->
    <meta name="description" content=""/>
    <!-- -->
    <title>在线问卷/考试系统</title>
    <!-- 来自Font Awesome 图标库，crossorigin="anonymous是为了能跨域获取信息 -->
    <script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js" crossorigin="anonymous"></script>
    <!-- CSS (包含 Bootstrap)-->
    <link href="static/css/styles-new.css" rel="stylesheet" type="text/css"/>
</head>

<body id="page-top">
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">ONLINE EXAMINATION SYSTEM</a>
        <button class="navbar-toggler navbar-toggler-right"
                type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto my-2 my-lg-0">
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">ABOUT</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">QUEATIONNAIRE</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">TEST</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">FEEDBACK</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 刊头 -->
<header class="masthead">
    <div class="container h-100">
        <div class="row h-100 align-items-center justify-content-center text-center">
            <div class="col-lg-10 align-self-end">
                <h1 class="text-uppercase text-white font-weight-bold">ONLINE EXAMINATION SYSTEM OF COMPUTER
                    PRACTICAL OPERATION BASED ON JAVAWEB AND QUESTIONAIRE</h1>
                <hr class="divider my-4"/>
            </div>
            <div class="col-lg-8 align-self-baseline">
                <p class="text-white-75 font-weight-light mb-5">The system can not only meet the daily needs of the
                    questionnaire function, but also can be used as an online examination system on a certain
                    basis.</p>
                <a class="btn btn-primary btn-xl js-scroll-trigger tbox" href="javascript:void(0)">LOGIN</a>
            </div>
        </div>
    </div>
</header>

<!-- About 板块 -->
<section class="page-section bg-primary" id="about">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="text-white mt-0">ABOUT</h2>
                <hr class="divider light my-4"/>
                <!--在 HTML 页面中创建一条水平线-->
                <p class="text-white-50 mb-4">（对各功能的简单介绍）</p>
            </div>
        </div>
    </div>
</section>

<!-- QUEATIONNAIRE板块 -->
<section class="page-section" id="services">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-3 col-md-6 text-center">
                <h2 class="text-center mt-0">QUEATIONNAIRE</h2>
                <hr class="divider my-4"/>
                <p class="text-muted mb-0">对问卷功能的直接介绍</p>
                <a class="btn btn-light btn-xl js-scroll-trigger tbox" href="javascript:void(0)">Login and Get
                    Started!</a>
                <!--点击后跳转到登录页面，登录后跳转到问卷页面-->
            </div>
        </div>
    </div>
</section>

<!-- TEST板块 -->
<section class="page-section bg-primary" id="portfolio">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="text-white mt-0">TEST</h2>
                <hr class="divider light my-4"/>
                <p class="text-white-50 mb-4">（对考试功能介绍）</p>
                <a class="btn btn-light btn-xl js-scroll-trigger tbox" href="#">Login and Get Started!</a>
                <!--点击后跳转到登录页面，登录后跳转到考试页面-->
            </div>
        </div>
    </div>
</section>

<!-- FEEDBACK板块 -->
<section class="page-section" id="contact">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="mt-0">FEEDBACK</h2>
                <hr class="divider my-4"/>
                <p class="text-muted mb-5">Ready to start your next project with us? Give us a call or send us an
                    email and we will get back to you as soon as possible!</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                <div>+86-15868158619</div>
            </div>
            <div class="col-lg-4 mr-auto text-center">
                <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                <a class="d-block" href="mailto:contact@yourwebsite.com">lusijing@163.com</a>
            </div>
        </div>
    </div>
</section>

<!-- Footer板块 -->
<footer class="bg-light py-5">
    <div class="container">
        <div class="small text-center text-muted">——页脚——</div>
    </div>
</footer>

<!-- 登录框板块 -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" align="center">LOGIN</h4>
                <br/>
                <form action="user/login" class="form-horizontal" role="form"
                      method="post" id="user-login-form">
                    <!-- 水平布局的表单 -->
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">ACCOUNT</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="username" id="name"
                                   placeholder="please enter your ID">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">PASSWORD</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="please enter your password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">LOGIN IDENTITY</label>
                        <div class="col-sm-12 control-label">
                            <input type="radio" class="radio-id" id="radio-id1" name="role" value="STUDENT">
                            <span>student&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="radio" class="radio-id" id="radio-id2" name="role" value="TEACHER">
                            <span>teacher&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="radio" class="radio-id" id="radio-id3" name="role" value="ADMIN">
                            <span>administrator&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <span id="error-message">${mess}</span>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-12">
                            <button id="submitBtn" type="button" class="btn btn-default btn-block btn-primary"
                                    onclick="edit()">LOGIN
                            </button>
                            <button id="resetBtn" type="reset" class="btn btn-default btn-block btn-primary">RESET
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
        <!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script type="text/javascript">
  function edit() {
    var index = layer.load(1, {shade: [0.5, '#000']});

    fpost("user-login-form", function (data) {
      layer.close(index);
      if (data.success) {
        if(data.data == 'ADMIN') {
          window.location.href = "views/jsp/main/admin/index-admin.jsp";
        }
        else if(data.data == 'TEACHER') {
          window.location.href = "views/jsp/main/teacher/index-teacher.jsp";
        }
        else {
          window.location.href = "views/jsp/main/student/index-student.jsp";
        }

      } else {
        $("#error-message").text(data.message);
        // window.location.href = "views/jsp/main/index-login.jsp";
      }
    });
  }

  $(function () {
    $(".tbox").click(function () {
      $('#myModal').modal('show') //显示模态框
    })

  });
</script>
</body>

</html>