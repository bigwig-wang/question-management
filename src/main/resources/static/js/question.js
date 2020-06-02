$(function () {

    $(".delete_button").live('click',function () {
        $(this).parents(".delete_div").remove();
    });

    /*提交*/
    $('#submit').click(function(){
        var boxs = $(".movie_box");
        var boxLength = $(".movie_box").length
        if(boxLength < 1 ){
            return;
        }
        var title = $('.head-information').find('information-title').value();
        var requestBody = [];
        boxs.each(function () {
            var data = {};
            var title = $(this).find('.btwenzi').text();
            var type = $(this).attr('boxType');
            var options = {};
            $(this).find('input').each(function (index) {
                var option = $(this).next().text();
                options[option] = index;

            });
            data.title = title;
            data.type = type;
            data.options = JSON.stringify(options);
            requestBody.push(data);
        });
        var requestData = {};
        requestData.title = title
        requestData.questionItems = requestBody;
        var requestString = JSON.stringify(requestData);

        $.ajax({
            type: "POST",
            url: "/question/save",
            contentType: "application/json",
            dataType: "json",
            data: requestString,
            success: function(data){
                window.location.href = 'question/list'
            }
        });

    });


    /*题库插件*/
    $('.addquerstions').click(function() {

        // debugger
        var index = $(this).attr('typeValue'); //选择添加问题的类型
        if (index == "-1") {
            return;
        }
        var movie_box = '<div class="movie_box" boxType="'+index+'" style="border: 1px solid rgb(255, 255, 255);"></div>';
        var Grade = $(".yd_box").find(".movie_box").length + 1;
        switch (index) {
            case "0": //单选
            case "4": //判断
            case "1": //多选
            case "6": //问答
            case "5": //问答
            case "2": //问答
                var wjdc_list = '<ul class="wjdc_list"></ul>'; //问答 单选 多选
                var danxuan = "";
                if (index == "0") {
                    danxuan = '【单选】';
                } else if (index == "1") {
                    danxuan = '【多选】';
                } else if (index == "2") {
                    danxuan = '【问答题】';
                }else if (index == "4"){
                    danxuan = "【判断题】";
                }else if(index == '5'){
                    danxuan = "【填空题】";
                }else if(index == '6'){
                    danxuan = "【编程】";
                }

                wjdc_list = $(wjdc_list).append(' <li><div class="tm_btitlt"><i class="nmb">' + Grade + '</i>. <i class="btwenzi">请编辑问题？</i><span class="tip_wz">' + danxuan + '</span></div></li>');
                if (index == "2" || index == "5" || index == "6") {
                    wjdc_list = $(wjdc_list).append('<li>  <label> <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" ></textarea></label> </li>');
                }
                movie_box = $(movie_box).append(wjdc_list);
                movie_box = $(movie_box).append('<div class="dx_box" data-t="' + index + '"></div>');

                break;
            case "3":
                var wjdc_list = ' <div class="wjdc_list"><h4 class="title_wjht"><i class="nmb">' + Grade + '</i>. 请编辑问题!<span class="tip_wz">【矩阵】</span></h4>'
                    +' <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tswjdc_table"><tbody></tbody></table></div>'; //问答 单选 多选
                movie_box = $(movie_box).append(wjdc_list);
                movie_box = $(movie_box).append('<div class="dx_box" data-t="' + index + '"></div>');
                break;

        }



        $(movie_box).hover(function() {
            var html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>"
            $(this).css({
                "border": "1px solid #0099ff"
            });
            $(this).children(".wjdc_list").after(html_cz);
        }, function() {
            $(this).css({
                "border": "1px solid #fff"
            });
            $(this).children(".kzqy_czbut").remove();
            //$(this).children(".dx_box").hide();
        });
        $(".yd_box").append(movie_box);

    });

    //鼠标移上去显示按钮
    $(".movie_box").hover(function() {
        var html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>"
        $(this).css({
            "border": "1px solid #0099ff"
        });
        $(this).children(".wjdc_list").after(html_cz);
    }, function() {
        $(this).css({
            "border": "1px solid #fff"
        });
        $(this).children(".kzqy_czbut").remove();
        //$(this).children(".dx_box").hide();
    });

    //下移
    $(".xy").live("click", function() {
        //文字的长度
        var leng = $(".yd_box").children(".movie_box").length;
        var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();

        if(dqgs < leng - 1) {
            var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
            var xyghtml = czxx.next().html();
            var syghtml = czxx.html();
            czxx.next().html(syghtml);
            czxx.html(xyghtml);
            //序号
            czxx.children(".wjdc_list").find(".nmb").text(dqgs + 1);
            czxx.next().children(".wjdc_list").find(".nmb").text(dqgs + 2);
        } else {
            alert("到底了");
        }
    });
    //上移
    $(".sy").live("click", function() {
        //文字的长度
        var leng = $(".yd_box").children(".movie_box").length;
        var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();
        if(dqgs > 0) {
            var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
            var xyghtml = czxx.prev().html();
            var syghtml = czxx.html();
            czxx.prev().html(syghtml);
            czxx.html(xyghtml);
            //序号
            czxx.children(".wjdc_list").find(".nmb").text(dqgs + 1);
            czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);

        } else {
            alert("到头了");
        }
    });
    //删除
    $(".del").live("click", function() {
        var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
        var zgtitle_gs = czxx.parent(".yd_box").find(".movie_box").length;
        var xh_num = 1;
        //重新编号
        czxx.parent(".yd_box").find(".movie_box").each(function() {
            $(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(xh_num);
            xh_num++;
            //alert(xh_num);
        });
        czxx.remove();
    });

    //编辑
    $(".bianji").live("click", function() {
        //编辑的时候禁止其他操作
        $(this).siblings().hide();
        //$(this).parent(".kzqy_czbut").parent(".movie_box").unbind("hover");
        var dxtm = $(".dxuan").html();
        var duoxtm = $(".duoxuan").html();
        var tktm = $(".tktm").html();
        var jztm = $(".jztm").html();
        var panduan = $(".panduan").html();
        //接受编辑内容的容器
        var dx_rq = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");
        var title = dx_rq.attr("data-t");
        //alert(title);
        //题目选项的个数
        var timlrxm = $(this).parent(".kzqy_czbut").parent(".movie_box").children(".wjdc_list").children("li").length;

        //单选题目
        if(title == 0) {
            dx_rq.show().html(dxtm);
            //模具题目选项的个数
            var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
            var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html();
            //添加选项题目
            for(var i_tmxx = bjxm_length; i_tmxx < timlrxm - 1; i_tmxx++) {
                dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>" + dxtxx_html + "</div>");
            }
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").attr('placeholder', texte_bt_val);
            //遍历题目项目的文字
            var bjjs = 0;
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
                //可选框框
                var ktksfcz = $(this).find("input").hasClass("wenb_input");
                if(ktksfcz) {
                    var jsxz_kk = $(this).index();
                    dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk - 1).find("label").remove();
                }
                //题目选项
                var texte_val = $(this).find("span").text();
                dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs - 1).find(".input_wenbk").attr('placeholder', texte_val);
                bjjs++

            });
        }
        //多选题目
        if(title == 1) {
            dx_rq.show().html(duoxtm);
            //模具题目选项的个数
            var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
            var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html();
            //添加选项题目
            for(var i_tmxx = bjxm_length; i_tmxx < timlrxm - 1; i_tmxx++) {
                dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>" + dxtxx_html + "</div>");
                //alert(i_tmxx);
            }
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").attr('placeholder', texte_bt_val);
            //遍历题目项目的文字
            var bjjs = 0;
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
                //可选框框
                var ktksfcz = $(this).find("input").hasClass("wenb_input");
                if(ktksfcz) {
                    var jsxz_kk = $(this).index();
                    dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk - 1).find("label").remove();
                }
                //题目选项
                var texte_val = $(this).find("span").text();
                dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs - 1).find(".input_wenbk").attr('placeholder', texte_val);
                bjjs++

            });
        }
        //填空题目
        if(title == 2 || title == 5 || title == 6) {
            dx_rq.show().html(tktm);
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").attr('placeholder', texte_val);
        }
        //矩阵题目
        if(title == 3) {
            dx_rq.show().html(jztm);
        }
        //判断题目
        if(title == 4) {
            dx_rq.show().html(panduan);
            //模具题目选项的个数
            var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
            var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html();
            //添加选项题目
            for(var i_tmxx = bjxm_length; i_tmxx < timlrxm - 1; i_tmxx++) {
                dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>" + dxtxx_html + "</div>");
            }
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").attr('placeholder', texte_bt_val);
            //遍历题目项目的文字
            var bjjs = 0;
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
                //可选框框
                var ktksfcz = $(this).find("input").hasClass("wenb_input");
                if(ktksfcz) {
                    var jsxz_kk = $(this).index();
                    dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk - 1).find("label").remove();
                }
                //题目选项
                var texte_val = $(this).find("span").text();
                dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs - 1).find(".input_wenbk").attr('placeholder', texte_val);
                bjjs++

            });
        }
    });

    //增加选项
    $(".zjxx").live("click", function() {
        var zjxx_html = $(this).prev(".title_itram").children(".kzjxx_iteam").html();
        $(this).prev(".title_itram").append("<div class='kzjxx_iteam'>" + zjxx_html + "</div>");
    });

    //删除一行
    $(".del_xm").live("click", function() {
        //获取编辑题目的个数
        var zuxxs_num = $(this).parent(".kzjxx_iteam").parent(".title_itram").children(".kzjxx_iteam").length;
        if(zuxxs_num > 1) {
            $(this).parent(".kzjxx_iteam").remove();
        } else {
            alert("手下留情");
        }
    });
    //取消编辑
    $(".dx_box .qxbj_but").live("click", function() {
        $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
        $(".movie_box").css({
            "border": "1px solid #fff"
        });
        $(".kzqy_czbut").remove();
        //
    });
    // body...
    //完成编辑（编辑）
    $(".swcbj_but").live("click", function() {

        var jcxxxx = $(this).parent(".bjqxwc_box").parent(".dx_box"); //编辑题目区
        var querstionType = jcxxxx.attr("data-t"); //获取题目类型

        switch(querstionType) {
            case "0": //单选
            case "4":  //判断题
            case "1": //多选
                //编辑题目选项的个数
                var bjtm_xm_length = jcxxxx.find(".title_itram").children(".kzjxx_iteam").length; //编辑选项的 选项个数
                var xmtit_length = jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").length - 1; //题目选择的个数

                //赋值文本框
                //题目标题
                var texte_bt_val_bj = jcxxxx.find(".btwen_text").val(); //获取问题题目
                jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(texte_bt_val_bj); //将修改过的问题题目展示

                //删除选项
                for(var toljs = xmtit_length; toljs > 0; toljs--) {
                    jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(toljs).remove();
                }
                //遍历题目项目的文字
                var bjjs_bj = 0;
                jcxxxx.children(".title_itram").children(".kzjxx_iteam").each(function() {
                    //题目选项
                    var texte_val_bj = $(this).find(".input_wenbk").val(); //获取填写信息
                    var inputType = 'radio';
                    //jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(bjjs_bj + 1).find("span").text(texte_val_bj);
                    if(querstionType == "1") {
                        inputType = 'checkbox';
                    }
                    var li = '<li><label><input name="a" type="' + inputType + '" value=""><span>' + texte_val_bj + '</span></label></li>';
                    jcxxxx.parent(".movie_box").children(".wjdc_list").append(li);

                    bjjs_bj++
                    //可填空
                    var kxtk_yf = $(this).find(".fxk").is(':checked');
                    if(kxtk_yf) {
                        //第几个被勾选
                        var jsxz = $(this).index();
                        //alert(jsxz);
                        jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(jsxz + 1).find("span").after("<input name='' type='text' class='wenb_input'>");
                    }
                });

                break;
            case "5":
            case "6":
            case "2":
                var texte_bt_val_bj = jcxxxx.find(".btwen_text").val(); //获取问题题目
                jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(texte_bt_val_bj); //将修改过的问题题目展示
                break;

            case "3": //矩阵
                jcxxxx.parent(".movie_box").children(".wjdc_list").children("table").children("tbody").empty();
                var querstionType = jcxxxx.find(".xzqk:checked").val();
                console.log(querstionType);
                var title = jcxxxx.find("textarea.input_wenbk.btwen_text").val(); //获取标题
                var x_iteam = new Array(); //获取 横向选项
                var y_iteam = " ," + jcxxxx.find(".leftbtwen_text").val(); //左标题
                jcxxxx.find(".title_itram").children("div.kzjxx_iteam").each(function() {
                    var texte_val_bj = $(this).find(".input_wenbk").val(); //获取填写信息
                    var checkbox = $(this).find("input.fxk").is(':checked'); //是否可填空
                    x_iteam.push({
                        name: texte_val_bj,
                        checkbox: checkbox
                    });

                });
                var y_iteams = y_iteam.split(",");
                for(var item in y_iteams) { //行
                    var tr = '<tr>',
                        td = '';
                    td += '<td>' + y_iteams[item] + '</td>';
                    for(var i = 0; i < x_iteam.length; i++) { //列
                        if(item != 0) {
                            if(x_iteam[i].checkbox) {
                                //可填空
                                td += '<td><input name="c1" type="text" value=""></td>';

                            } else {
                                var inputType = 'radio';
                                if(querstionType == "1") {
                                    inputType = 'checkbox';
                                }
                                td += '<td><input name="c1" type="' + inputType + '" value=""> </td>';
                            }
                        } else {
                            td += '<td>' + x_iteam[i].name + '</td>';
                        }
                    }
                    jcxxxx.parent(".movie_box").children(".wjdc_list").children("table").children("tbody").append(tr + td);
                }
                break;
        }
        //清除
        $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
    });


});

function createItem(question) {
    if(!question){
        return
    }
    var box = $('.yd_box')
    var type =  question.type;
    var mov_blank = $('.xxk_box').children('.xxk_conn');
    //单选和判断
    if(type == 0 || type ==4){
        var radioHtml = $(mov_blank).children('.radio');
        $(radioHtml).find('.btwenzi').text(question.title);
        if(type == 0){
            $(radioHtml).find('.tip_wz').text('【单选题】');
        }else{
            $(radioHtml).find('.tip_wz').text('【判断题】');
        }
        $(box).append($(radioHtml));
        var items = JSON.parse(question.options);
        for(var key in items){
            var itemHtml = '<li><label><input name="a" type="radio" value="'+items[key]+'"><span>'+key+'</span></label></li>'
            $(box).find(radioHtml).find('.wjdc_list').append(itemHtml);
        }
    }else if (type == 1){
        var radioHtml = $(mov_blank).children('.multiple');
        $(radioHtml).find('.btwenzi').text(question.title);
        $(radioHtml).find('.tip_wz').text('【多选题】');
        $(box).append($(radioHtml));
        var items = JSON.parse(question.options);
        for(var key in items){
            var itemHtml = '<li><label><input name="a" type="radio" value="'+items[key]+'"><span>'+key+'</span></label></li>'
            $(box).find(radioHtml).find('.wjdc_list').append(itemHtml);
        }
    }else if (type == 2 || type == 5 || type ==6){
        var radioHtml = $(mov_blank).children('.answer');
        $(radioHtml).find('.btwenzi').text(question.title);
        if(type == 2){
            $(radioHtml).find('.tip_wz').text('【问答题】');
        }else if(type == 5){
            $(radioHtml).find('.tip_wz').text('【填空题】');
        }else{
            $(radioHtml).find('.tip_wz').text('【编程题】');
        }
        $(box).append($(radioHtml).html())


    }
}

function createFreQ(informationType){
    var informationParent = $('.title-information');
    var headInformation = $('.head-information');
    if(informationType === 'name'){
        if($(headInformation).find('.personal_information_name').length < 1){
            $(headInformation).prepend($(informationParent).find('.personal_information_name').clone());
        }

    }else if(informationType === 'basic-information'){
        if($(headInformation).find('.personal_base_information').length < 1){
            $(headInformation).append($(informationParent).find('.personal_base_information').clone());
        }
    }
}