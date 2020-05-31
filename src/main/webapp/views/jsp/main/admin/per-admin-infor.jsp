<jsp:include page="../base.jsp"></jsp:include>

<!DOCTYPE html>
<!-- 管理员界面-信息修改 -->
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta charset="UTF-8">
        <title>Personal Center-administrators</title>
        <link href="static/css/per-studentcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="header-pic" id="header-pic"><img src="static/image/title.png" width=100% height=100% /></div>
        <!-- 站头标题 -->
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
                    <div class="col-md-10" style="padding-left: 40px">
                        <!-- 标题 -->
                        <h2 class="mb-2">INFORMATION MODIFY</h2>
                        <br/>
                        <form class="form-horizontal" role="form" method="post" style="padding-left: 80px"
                              id="user-login-form" action="user/editPassword">
                            <div class="form-group">
                                <label for="name" class="col-sm-10 control-label">Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="name" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <tr><label for="university" class="col-sm-4 control-label">University</label></tr>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="university" name="school">
                                </div>
                            </div>
                            <div class="form-group">
                                <tr><label for="id" class="col-sm-10 control-label">ID</label></tr>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="id" name="username">
                                </div>
                            </div>
                            <div class="form-group">
                                <tr><label for="oldpassword" class="col-sm-10 control-label">Old Password</label></tr>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="oldpassword" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <tr><label for="newpassword" class="col-sm-10 control-label">New Password</label></tr>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="newpassword" name="newPassword">
                                </div>
                            </div>
                            <div class="form-group">
                                <tr><label for="newpassword2" class="col-sm-10 control-label">New Password Again</label></tr>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="newpassword2" name="repeatPassword">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4 text-center">
                                    <button id="submitBtn" type="button" class="btn btn-default btn-block btn-primary" onclick="edit()">save</button>
                                </div>
                            </div>

                        </form>

                    </div>

                    <div>

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">

          function edit() {
            var index = layer.load(1, {shade: [0.5, '#000']});
            fpost("user-login-form", function (data) {
              layer.close(index);
              if (data.success) {
                alert("modify password success");
                window.location.href = "views/jsp/main/admin/index-admin.jsp";

              } else {
                alert(data.message);
              }
            });
          }
        </script>
        <!-- Footer板块 -->
        <jsp:include page="../footer.jsp"></jsp:include>


    </body>
</html>
