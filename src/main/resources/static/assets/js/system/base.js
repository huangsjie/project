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
 * BlockUi 加载消息提示框
 * @param elem
 * @param type
 * @param state
 * @param msg
 */
function blockUiOpen(elem, msg, color, type, state){
    mApp.block(elem, {
        overlayColor: color ? color : '#000000',
        type: type ? type :'loader',
        state: state ? state : 'primary',
        message: msg ? msg : '请稍后...'
    });
}

/**
 * 关闭 BlockUi 消息提示框
 * @param elem
 */
function blockUiClose(elem,closeParent,parentElem,time){
    setTimeout(function() {
        mApp.unblock(elem);
        if(closeParent == 1){
            $(parentElem).click();
        }
    }, time);
}

/**
 * alert 打开消息提示框
 * @param elem
 * @param type
 * @param msg
 */
function alertMsgShow(elem, type, msg){
    console.log("type--->"+type);
    var alert = $(elem);
    alert.find("#"+type+"_content").text(msg)
    alert.removeClass('m--hide').show();
    mApp.scrollTo(alert, -200);
}

/**
 * 管理后台左侧菜单样式切换
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
    // $(function() {
    //     $(".slimscroll").slimScroll({
    //         width: 'auto', //可滚动区域宽度
    //         height: '100%', //可滚动区域高度
    //         size: '6px', //组件宽度
    //         color: '#000', //滚动条颜色
    //         position: 'right', //组件位置：left/right
    //         distance: '0px', //组件与侧边之间的距离
    //         start: 'top', //默认滚动位置：top/bottom
    //         opacity: .2, //滚动条透明度
    //         alwaysVisible: true, //是否 始终显示组件
    //         disableFadeOut: false, //是否 鼠标经过可滚动区域时显示组件，离开时隐藏组件
    //         railVisible: true, //是否 显示轨道
    //         railColor: '#fff', //轨道颜色
    //         railOpacity: 0, //轨道透明度
    //         railDraggable: true, //是否 滚动条可拖动
    //         railClass: 'slimScrollRail', //轨道div类名
    //         barClass: 'slimScrollBar', //滚动条div类名
    //         wrapperClass: 'slimScrollDiv', //外包div类名
    //         allowPageScroll: true, //是否 使用滚轮到达顶端/底端时，滚动窗口
    //         wheelStep: 20, //滚轮滚动量
    //         touchScrollStep: 200, //滚动量当用户使用手势
    //         borderRadius: '7px', //滚动条圆角
    //         railBorderRadius: '7px' //轨道圆角
    //     });
    // });
});