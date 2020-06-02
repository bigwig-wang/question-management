$(function () {
    $.ajax({
        type: "GET",
        url: "question/edit?id="+$("#questionId").val(),
        contentType: "application/json",
        dataType: "json",
        success: function(data){
            if(data){
                var items = data.questionItems;
                items.forEach(function (element) {
                    createItem(element);
                })
            }
        }
    });

    $('#answer').click(function () {
        var questionId = $("#questionId").val();
        var boxs = $('.movie_box');
        var questions = [];
        boxs.each(function () {
            var id = $(this).attr('data-id');
            var labels = $(this).find('label');
            var values = '';
            labels.each(function(){
                var textarea = $(this).find('textarea');
                var input = $(this).find('input');
                if(textarea){
                    values = values + $(textarea).text() + ',';
                }
                if(input){
                    values = values + $('input:checked').val() + ',';
                }
            })
            values.substring(0, values.length-2);
            var question = {};
            question.id = id;
            question.value = values;
            questions.push(question);
        });
        var requestData = {};
        requestData.id = questionId;
        requestData.questions = questions;
        $.ajax({
            type: "POST",
            url: "question/doQuestion",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(requestData),
            success: function(data){
               alert("答题完成");
            }
        });
    });

});

function createItem(question) {
    if(!question){
        return
    }

    var box = $('.yd_box')
    var count = $('.yd_box').find('.movie_box').length;
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
    $(radioHtml).attr('data-id', question.id);
    $(box).find(radioHtml).find('.wjdc_list').find('.nmb').html(count+1);
}
