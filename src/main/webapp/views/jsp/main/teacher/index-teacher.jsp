<jsp:include page="../base.jsp"></jsp:include>
<!DOCTYPE html>
<!-- 教师界面-首页 -->
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta charset="UTF-8">
        <title>Personal Center-teachers</title>
        <link href="static/css/per-studentcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <div class="header-pic" id="header-pic"><img src="static/image/title.png" width=100% height=100% /></div>
    <!-- 站头标题 -->
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
                <div class="col-md-10" style="padding-left: 40px">
                    <!-- 标题 -->
                    <h2 class="mb-2">INDEX-TEACHER</h2>
                    <br/>

                </div>

                <div>

                </div>
            </div>
        </div>
    </div>

    <!-- Footer板块 -->
    <jsp:include page="../footer.jsp"></jsp:include>

    </body>

</html>