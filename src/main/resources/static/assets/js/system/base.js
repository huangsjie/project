/**
 * 请求构造器
 * @param url
 * @param type
 * @param data
 * @param fnSucc
 * @param fnFaild
 */
function request(url, method, data, fnSucc, fnFaild,cache) {
    if(fnFaild==="boolean"){
        cache=  fnFaild;
    }
    cache=typeof cache==="boolean"?cache:true;
    $.ajax({
        url: url,
        type: method,
        data: data,
        dataType: 'json',
        error: fnFaild ? fnFaild : '',
        timeout : 30000,
        cache:false,
        success: function (data, textStatus, jqXHR) {
            fnSucc(data, textStatus, jqXHR);
        },
        error : function (XMLHttpRequest, textStatus, errorThrown) {
            if (fnFaild) fnFaild();
        }
    });
}

/**
 * 获取基础URL
 * @returns {string}
 * @constructor
 */
function GetUrlRelativePath()
{
    var url = document.location.toString();
    var arrUrl = url.split("//");

    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

    if(relUrl.indexOf("?") != -1){
        relUrl = relUrl.split("?")[0];
    }
    return relUrl;
}

/**
 * left_aside css toggle
 *
 */
var LeftAside = function (url) {
    if(url != ''){
        var aside_left = $('#m_aside_left .m-menu__item a');
        aside_left.each(function(){
            if(url == $(this).attr("href")){
                if($(this).parents("div").parent("li")){
                    $(this).parents("div").parent("li").addClass("m-menu__item--submenu m-menu__item--open m-menu__item--expanded")
                }
                $("#m_aside_left").find("li").removeClass("m-menu__item--active");
                $(this).parent("li").addClass("m-menu__item--active")
            }
        })
    }
}


jQuery(document).ready(function() {
    var url = GetUrlRelativePath();
    LeftAside(url);
});