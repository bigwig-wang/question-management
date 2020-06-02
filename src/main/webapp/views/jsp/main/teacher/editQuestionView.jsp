<!--<!DOCTYPE html>-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <link href="static/css/styles-new.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <jsp:include page="teacher-header.jsp"></jsp:include>
    <!-- 主要的内容模块 -->
    <input type="hidden" value="${id}" id="questionId">
    <div id="ss-cont" class="ss-cont clearfix">
        <div class="overflowBarStyle" style="height: 662px; visibility: visible;">
            <!-- 内容显示 -->
            <div class="overflowBarStyle clearfix" id="wj_header_tab">
                <!-- 副菜单栏 -->
                <div class="content">
                    <!-- 标题 -->

                    <div>
                        <h2 class="mb-2" style="padding-left: 40px;">TEST NAME</h2><!--获取per-teacher-test1里的test title-->
                    </div>
                    <!--内容主体-->
                    <div class="contex_body">
                        <!--菜单栏-->
                        <div class="menu" id="topnav">
                            <div id="all_question">
                            <ul class="tabQType" id="divKaoShiT" style>
                                <li class="open">
                                    <div class="classifyTitle" onclick="toggleNav(this)">
                                        <i class="iconfont down"></i>
                                        <i class="iconfont right"></i>
                                        <span>Personal Information</span>
                                    </div>
                                    <ul class="navlist">
                                        <li>
                                            <a href="javascript:void(0);"  onclick="createFreQ('name');return false;">
                                                <i class="iconfont"></i>
                                                <span>Name</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" onclick="createFreQ('basic-information');return false;">
                                                <i class="iconfont"></i>
                                                <span>Basic Information</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="open">
                                    <div class="classifyTitle" onclick="toggleNav(this)">
                                        <i class="iconfont down"></i>
                                        <i class="iconfont right"></i>
                                        <span>Type Of Question</span>
                                    </div>
                                    <ul class="navlist">
                                        <!--单选-->
                                        <li>
                                            <a href="javascript:void(0);" class="addquerstions" typeValue="0">
                                                <i class="iconfont"></i>
                                                <span>Single Choice</span>
                                            </a>
                                        </li>
                                        <!--判断-->
                                        <li>
                                            <a href="javascript:void(0);"  class="addquerstions" typeValue="4">
                                                <i class="iconfont"></i>
                                                <span>Judgment</span>
                                            </a>
                                        </li>
                                        <!--多选-->
                                        <li>
                                            <a href="javascript:void(0);" class="addquerstions" typeValue="1">
                                                <i class="iconfont"></i>
                                                <span>Multiple Choice</span>
                                            </a>
                                        </li>
                                        <!--填空-->
                                        <li>
                                            <a href="javascript:void(0);" class="addquerstions" typeValue="5">
                                                <i class="iconfont"></i>
                                                <span>Blanks</span>
                                            </a>
                                        </li>
                                        <!--简答-->
                                        <li>
                                            <a href="javascript:void(0);" class="addquerstions" typeValue="2">
                                                <i class="iconfont"></i>
                                                <span>Brief Answer</span>
                                            </a>
                                        </li>
                                        <!--程序-->
                                        <li>
                                            <a href="javascript:void(0);" class="addquerstions" typeValue="6">
                                                <i class="iconfont"></i>
                                                <span>Program</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="classifyTitle" onclick="toggleNav(this)">
                                        <i class="iconfont down"></i>
                                        <i class="iconfont right"></i>
                                        <span>Other Type of Question</span>
                                    </div>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" onclick="PDF_launch('addbatchq.aspx?ks=1',840,620);return false;" class="pladd">批量添加</a>
                                </li>
                            </ul>
                        </div>
                        </div>
                        <!--内容主体-->
                        <div class="content_question">
                            <div class="border_div">
                                <div class="personal_information_name border_div">
                                    <div class="title_top">
                                        <span class="title_top">title</span><!--读取第一题的题目填入-->
                                        <span class="req">*</span>
                                    </div>
                                    <input name="questionTile"/>
                                    <span class="operation">
                                        <li>
                                            <span class="design-icon design-edit"></span>
                                            <button class="delete_button">Delete</button>
                                        </li>
                                    </span>
                                </div>
                                <div class="personal_base_information border_div info_div">
                                    <div class="title_top">
                                        <span >Essential Information:</span><!--基本信息-->
                                        <span class="req">*</span>
                                    </div>
                                    <ul>
                                        <li class="border_div">
                                            <span class="tile_left">Name:</span><!--读取第一题的题目填入-->
                                            <span class="req">*</span>
                                            <input name="name"/>
                                        </li>
                                        <li class="border_div">
                                            <span class="tile_left">ID:</span><!--读取第一题的题目填入-->
                                            <span class="req">*</span>
                                            <input name="id"/>
                                        </li>
                                        <li class="border_div">
                                            <span class="tile_left">Class:</span><!--读取第一题的题目填入-->
                                            <span class="req">*</span>
                                            <input name="class"/>
                                        </li>
                                    </ul>
                                    <span class="operation">
                                        <li>
                                            <span class="design-icon design-edit"></span>
                                            <button class="delete_button">Delete</button>
                                        </li>
                                    </span>
                                </div>
                            </div>

							<!--选择题-->
                            <div class="yd_box border_div"></div>
                            <div style="margin-top: 20px; margin-bottom: 30px; width: 80px;">
                                <input class="btn btn-default btn-block btn-primary" style="margin-left: 450px;" id="update" type="button" value="修改"/>
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
            <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
            <div class="xxk_xzqh_box dxuan ">
                <textarea name="tile" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
                <div class="title_itram">
                    <div class="kzjxx_iteam">
                        <input name="" type="radio" value="" class="dxk">
                        <input name="options" type="text" class="input_wenbk" placeholder="选项">
                        <label>
                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span>
                        </label> <a href="javascript:void(0);" class="del_xm">删除</a>
                    </div>
                </div>
                <a href="javascript:void(0)" class="zjxx">增加选项</a>
                <!--完成编辑-->
                <div class="bjqxwc_box">
                    <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                    <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                </div>
            </div>
            <!--panduan----------------------------------------------------------------------------------------------------------------------------------------->
            <div class="xxk_xzqh_box panduan">
                <textarea name="title" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="判断题"></textarea>
                <div class="title_itram">
                    <div class="kzjxx_iteam">
                        <input name="" type="radio" value="0" class="dxk">
                        <input name="options" type="text" class="input_wenbk" placeholder="【判断题】">
                        <label>
                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span>
                        </label> <a href="javascript:void(0);" class="del_xm">删除</a>
                    </div>
                    <div class="kzjxx_iteam">
                        <input name="" type="radio" value="" class="dxk">
                        <input name="options" type="text" class="input_wenbk" placeholder="【判断题】">
                        <label>
                            <input name="" type="checkbox" value="1" class="fxk"> <span>可填空</span>
                        </label>
                    </div>
                </div>
                <!--完成编辑-->
                <div class="bjqxwc_box">
                    <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                    <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                </div>
            </div>
            <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
            <div class="xxk_xzqh_box duoxuan hide">
                <textarea name="tile" cols="" rows="" class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
                <div class="title_itram">
                    <div class="kzjxx_iteam">
                        <input name="" type="checkbox" value="" class="dxk">
                        <input name="options" type="text" class="input_wenbk" placeholder="选项">
                        <label>
                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label>
                        <a href="javascript:void(0);" class="del_xm">删除</a>
                    </div>
                </div>
                <a href="javascript:void(0)" class="zjxx">增加选项</a>
                <!--完成编辑-->
                <div class="bjqxwc_box">
                    <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                    <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                </div>
            </div>
            <!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
            <div class="xxk_xzqh_box tktm hide">
                <textarea name="tile" cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="答题区"></textarea>
                <!--完成编辑-->
                <div class="bjqxwc_box">
                    <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                    <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                </div>
            </div>
            <!-- 矩阵----------------------------------------------------------------------------------------------------------------------------------------->
            <div class="xxk_xzqh_box  hide">
                <div class="line_dl"></div>
                <div class="jztm">
                    <textarea name="tile" cols="" rows="" class="input_wenbk btwen_text" placeholder="题目"></textarea>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr valign="top">
                            <td width="135">
                                <h4 class="ritwenz_xx">左标题</h4>
                                <textarea name="tile" cols="" rows="" class="leftbtwen_text" placeholder="例子：CCTV1，CCTV2，CCTV3"></textarea>
                            </td>
                            <td>
                                <h4 class="ritwenz_xx  ">
                                    右侧选项文字 <input type="radio" name="xz" value="0"
                                                  checked="checked" class="xzqk">单选<input
                                        type="radio" value="1" name="xz" class="xzqk">多选
                                </h4>
                                <div class="title_itram">
                                    <div class="kzjxx_iteam">
                                        <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                        <label>
                                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                    </div>
                                    <div class="kzjxx_iteam">
                                        <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                        <label>
                                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                    </div>
                                    <div class="kzjxx_iteam">
                                        <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                        <label>
                                            <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                    </div>
                                </div> <a href="javascript:void(0)" class="zjxx" style="margin-left: 0;">增加选项</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Footer板块 -->
 <%--   <footer class="bg-light py-5">
        <div class="container"><div class="small text-center text-muted">——footer——</div></div>
    </footer>--%>

    <script src="static/js/jquery-1.8.0.min.js"></script>
    <script src="static/js/editQuestion.js"></script>
    </body>
</html>