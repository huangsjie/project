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