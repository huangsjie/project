package com.panda.util;
/**
 * Created with IDEA Controller 返回的状态码
 * User: Alan
 * Date: 2017/11/14
 * Time: 17:28
 */
public class ResultStateUtil {
    /**
     * 常用异常
     */
    public static final String ERROR_PARAMETER_IS_EMPTY = "传递的内容为空, 操作存在异常 ！";//000
    public static final String ERROR_PARAMETER_NO_TCOMPATIBLE = "传递的内容不匹配,未获取到任何信息 ！";//001
    public static final String ERROR_DATABASE_OPERATION = "执行失败.";//002
    public static final String ERROR_OPERATION = "操作异常";//003
    public static final String ERROR_PARAMETER_IS_NOT_VALID = "参数不合法";//004
    public static final String ERROR_QUERY = "数据获取异常";//005
    public static final String ERROR_TAMPERING = "非法篡改秘钥";//006
    public static final String ERROR_TIME_UPDATE = "出现错误了,请刷新后再尝试..";//007

    /**
     * 常用失败
     */
    public static final String FAIL_UPDATE      = "由于未知原因, 导致修改失败 !";//100
    public static final String FAIL_ABNORMAL    = "数据操作异常,导致操作失败";//101
    public static final String FAIL_DELETE      = "删除失败";//102
    public static final String FAIL_QUERY       = "查询失败";//103
    public static final String FAIL_UPLOAD      = "上传失败";//104
    public static final String FAIL_IMAGES_SIZE = "附件上传失败,大小不能超过300KB";//106
    public static final String FAIL_ADD         = "由于未知原因, 导致新增失败";//105
    public static final String FAIL_BUSINESS    = "主营业务格式化失败";//107
    public static final String FALL_LONGITUDE   = "经纬度匹配城市失败,请重新获取正确的经纬度！";//108
    public static final String FAIL_BINDING     = "绑定失败";//109


    /**
     * 常用成功
     */
    public static final String SUCCESS_UPDATE           = "修改了一些东西, 并保存成功 !";//200
    public static final String SUCCESS_ABNORMAL         = "操作了一些数据, 并保存成功 !";//204
    public static final String SUCCESS_DELETE           = "成功删除了一条记录 ！";//201
    public static final String SUCCESS_QUERY            = "查询成功";//202
    public static final String SUCCESS_ADD              = "新增了一条记录, 并保存成功 !";//203
    public static final String SUCCESS_UPLOAD           = "上传成功";//205
    public static final String SUCCESS_OUTSIDE_MONEY    = "成功收款金额(￥)%s,剩余余款(￥)%s";//206
    public static final String COLLECTION_COMPLETION    = "本次成功收款金额%s,此订单已完成全部收款(￥)%s！";//207
    public static final String SUCCESS_BINDING          = "绑定成功";//209
    public static final String SUCCESS_ISEXIST          = "单号正确";//211
    public static final String SUCCESS_OUTSIDE_MONEY_ITEM = "本次成功收款金额(￥)%s,分配于%s个订单中";//210


    /**
     * 常用温馨提示
     */
    public static final String NO_MORE_DATA = "当前操作未获取到有效数据 !";//400
    public static final String CODE_OUT_TIME = "验证码超时";//401
    public static final String FALSE_ADD_ADDRESS = "请先添加收货地址";//402
    public static final String FREQUENTLY_MOBILE = "请勿频繁发送验证码";//403
    public static final String USER_LOGIN_TIMEOUT = "用户登录超时";//404
    public static final String INSUFFICIENT_AUTHORITY = "您对本次操作权限不足,无法操作";//405
    public static final String PRICE_SUM_MIN = "价格不能小于0";//406
    public static final String TIME_WAITING_FOR = "分钟后再尝试,您点的太频繁了!";//407
    public static final String TIME_WAITING_FOR_LOGIN = "频繁操作登陆,请稍后尝试..";//409
    public static final String UPDATE_PRICE_CHECK_PRICE = "商品价格已更新,请重新核对价格!";//410
    public static final String CLAIM_TYPE="批量发货需为同一个采购商并同一种取货方式";//408
    public static final String API_IS_EMERGENCY_MAINTENANCE = "接口正在升级,预计开放时间为:";//411
    public static final String ERROR_QUERY_SIZE = "开始页码不能大于结束页码";//412
    public static final String ERROR_TIME_OFTEN = "请求数据过于频繁,每次请求时间需间隔:";//413
    public static final String ERROR_MONEY_NOT_MIN = "金额不能小于(￥)%s";//414
    public static final String ERROR_MONEY_NOT_OUTSIDE_ORDER_MONEY = "收款金额不能超过订单可收总额(￥)%s";//415
    public static final String ERROR_MONEY_NOT = "此订单已无余款可收";//416
    public static final String ERROR_NOT_QUERY_MESSAGE = "订单收付款信息获取失败";//417
    public static final String ERROR_NOT_QUERY_JURISDICTION = "体验账户无此权限，请联系客服，开通正式账户！";//418
    public static final String ERROR_ISBINDIEXIST = "订单已被绑定";//419
    public static final String ERROR_NOTISEXIST = "订单不存在";//420

    /**
     * 无权限时提示消息
     */
    public static final String NO_PERMISSION_ADD    = "抱歉! 您的操作权限不能执行 <新增> 任务.";
    public static final String NO_PERMISSION_DEL    = "抱歉! 您的操作权限不能执行 <删除> 任务.";
    public static final String NO_PERMISSION_EDIT   = "抱歉! 您的操作权限不能执行 <编辑> 任务.";
    public static final String NO_PERMISSION_EXPORT = "抱歉! 您的操作权限不能执行 <导出> 任务.";
    public static final String NO_PERMISSION_SUBMIT = "抱歉! 您的操作权限不能执行 <提交> 任务.";
    public static final String NO_PERMISSION_UPLOAD = "抱歉! 您的操作权限不能执行 <上传> 任务.";
    public static final String NO_PERMISSION_VERIFY = "抱歉! 您的操作权限不能执行 <审核> 任务.";
    public static final String NO_PERMISSION_VIEW   = "抱歉! 您的操作权限不能执行 <查看> 任务.";
}
