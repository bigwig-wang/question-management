<!--<!DOCTYPE html>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<!--问卷/试卷页面-->
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>create questionnaire</title>
    <link href="static/css/create.css" rel="stylesheet" type="text/css"/>
    <link href="static/css/wenjuan.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="header-pic" id="header-pic"><img src="static/image/title.png" width=100% height=100%/></div>
<!-- 主要的内容模块 -->
<div id="ss-cont" class="ss-cont clearfix">
    <input type="hidden" value="${id}" id="questionId">
    <div class="overflowBarStyle" style="height: 662px; visibility: visible;">
        <!-- 内容显示 -->
        <div class="overflowBarStyle clearfix" id="wj_header_tab">
            <!-- 副菜单栏 -->
            <div class="content">
                <!--内容主体-->
                <div class="contex_body">
                    <!--内容主体-->
                    <div class="content_question_answer">
                        <!--选择题-->
                        <div class="yd_box border_div"></div>
                        <div style="clear: both">
                            <input id="answer" type="button" value="提交"/>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear: both">
            </div>
        </div>

        <div class="container-fluid">
        </div>
    </div>
</div>


<!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
<div class="xxk_box">
    <div class="xxk_conn hide">
        <%--单选，判断--%>
        <div class="movie_box radio" boxtype="4" style="border: 1px solid rgb(255, 255, 255);">
            <ul class="wjdc_list">
                <li>
                    <div class="tm_btitlt"><i class="nmb">5</i>. <i class="btwenzi">法撒旦发射点发安抚</i><span class="tip_wz">【判断题】</span>
                    </div>
                </li>

            </ul>
            <div class="dx_box" data-t="4" style="display: none;"></div>
        </div>
        <%--多选--%>
        <div class="movie_box multiple" boxtype="1" style="border: 1px solid rgb(255, 255, 255);">
            <ul class="wjdc_list">
                <li>
                    <div class="tm_btitlt"><i class="nmb">4</i>. <i class="btwenzi">发撒打发阿迪斯发阿斯弗啊</i><span
                            class="tip_wz">【多选】</span></div>
                </li>
            </ul>
            <div class="dx_box" data-t="1" style="display: none;"></div>
        </div>

        <%--问答题，填空题，编程--%>
        <div class="movie_box answer" boxtype="6" style="border: 1px solid rgb(255, 255, 255);">
            <ul class="wjdc_list">
                <li>
                    <div class="tm_btitlt"><i class="nmb">3</i>. <i class="btwenzi"> 啊手动阀实打实发</i><span
                            class="tip_wz">【编程】</span></div>
                </li>
                <li><label> <textarea name="" cols="" rows=""
                                      class="input_wenbk btwen_text btwen_text_dx"></textarea></label></li>
            </ul>
            <div class="dx_box" data-t="6" style="display: none;"></div>
        </div>
    </div>
    <!-- Footer板块 -->
    <div class="container">
        <div class="small text-center text-muted">——footer——</div>
    </div>

</div>
<script src="static/js/jquery-1.8.0.min.js"></script>
<script src="static/js/doQuestion.js"></script>
</body>
</html>