package com.panda.controller.system.index;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created with IDEA.
 *
 * @AUTH: Alan
 * Date: 2017/12/8
 * Time: 15:39
 */
@Controller
@RequestMapping(value = "/system/export")
public class ExportFileController {

    /**
     * 设置头的样式
     * @return
     * @throws WriteException
     */
    private WritableCellFormat getHeader() throws WriteException {
        WritableFont font = new WritableFont(WritableFont.TIMES, 24, WritableFont.BOLD); // 定义字体
        font.setColour(jxl.format.Colour.BLUE);// 蓝色字体
        WritableCellFormat format = new WritableCellFormat(font);
        format.setAlignment(jxl.format.Alignment.CENTRE);// 左右居中
        format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 上下居中
        format.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN, jxl.format.Colour.BLACK);// 黑色边框
        format.setBackground(jxl.format.Colour.YELLOW); // 黄色背景

        return format;
    }

    /**
     * 设置标题样式
     * @return
     * @throws WriteException
     */
    private WritableCellFormat getTitle() throws WriteException {
        WritableFont font = new WritableFont(WritableFont.TIMES, 14);
        font.setColour(jxl.format.Colour.BLUE);// 蓝色字体
        WritableCellFormat format = new WritableCellFormat(font);
        format.setAlignment(jxl.format.Alignment.CENTRE);
        format.setBackground(jxl.format.Colour.YELLOW);
        format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        format.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN, jxl.format.Colour.BLACK);

        return format;
    }

    /**
     * 设置其他单元格样式
     * @return
     * @throws WriteException
     */
    private WritableCellFormat getNormolCell() throws WriteException { // 12号字体,上下左右居中,带黑色边框
        WritableFont font = new WritableFont(WritableFont.TIMES, 12);
        WritableCellFormat format = new WritableCellFormat(font);
        format.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN, jxl.format.Colour.BLACK);// 黑色边框
        format.setAlignment(jxl.format.Alignment.CENTRE);
        format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        return format;
    }

    /**
     * 导出文件主方法入口
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "exportFileIndex")
    public void exportFileIndex(HttpServletRequest request, HttpServletResponse response,List<Map> exportDataList,String titleName,String fileType) throws Exception {
        if (!exportDataList.isEmpty() && exportDataList.size() > 0 && !titleName.isEmpty()) {
            response.reset();
            //电子表响应MIME类型
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            //客户端另存文件时提供一个建议的文件名
            //response.setHeader("Content-Disposition", "attachment; filename="+titleName+".xls");//  inline
            response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode(titleName+".xls", "UTF-8"));
            if (fileType.equals("excel")){
                exportExcelFile(response.getOutputStream(), exportDataList,titleName);
            }
        }
    }

    /**
     * 将数据写入EXCEL文件
     * @param os
     * @param diamondPrintList
     * @throws Exception
     */
    private void exportExcelFile(OutputStream os, List<Map> diamondPrintList, String fileName) throws Exception {
        WritableWorkbook wwb = Workbook.createWorkbook(os);
        // 创建Excel工作表
        WritableSheet ws = wwb.createSheet(fileName, 0);// 创建sheet
        ws.setColumnView(3,15);
        ws.setColumnView(12,15);
        ws.setColumnView(19,15);
        ws.setColumnView(20,15);
        ws.setColumnView(21,15);
        ws.setColumnView(23,15);
        ws.mergeCells(0, 0, 15, 1); // 合并单元格(左列，左行，右列，右行)从第1行第1列到第2行第3列
        Label header = new Label(0, 0, fileName, getHeader());
        ws.addCell(header); // 写入头
        Label l = new Label(0, 2, "批次号", getTitle()); // 第3行
        ws.mergeCells(0, 0, 15, 1);
        ws.addCell(l);
        l = new Label(1, 2, "前缀", getTitle());
        ws.addCell(l);
        l = new Label(2, 2, "溯源码", getTitle());
        ws.addCell(l);
        l = new Label(3, 2, "是否使用", getTitle());
        ws.addCell(l);
        l = new Label(4, 2, "创建时间", getTitle());
        ws.addCell(l);
//        int row = 0;
//        for (Map<String,Object> p : whiteOrderList) {
//            row++;
//            l = new Label(0, row, row+"", getNormolCell());
//            ws.addCell(l);
//            l = new Label(1, row, StringUtil.nullToEmpty(p.get("soid")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(2, row, StringUtil.nullToEmpty(p.get("create_time")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(3, row, StringUtil.nullToEmpty(p.get("dealerName")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(4, row, StringUtil.nullToEmpty(p.get("managerName")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(5, row, StringUtil.nullToEmpty(p.get("buyerName")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(6, row, StringUtil.nullToEmpty(p.get("location")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(7, row, StringUtil.nullToEmpty(p.get("certType")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(8, row, StringUtil.nullToEmpty(p.get("cert_no")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(9, row, StringUtil.nullToEmpty(p.get("shape")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(10, row, StringUtil.nullToEmpty(p.get("caratWeight")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(11, row, StringUtil.nullToEmpty(p.get("color")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(12, row, StringUtil.nullToEmpty(p.get("clarity")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(13, row, StringUtil.nullToEmpty(p.get("cut_code")), getNormolCell());
//
//            ws.addCell(l);
//            l = new Label(14, row, StringUtil.nullToEmpty(p.get("polish")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(15, row, StringUtil.nullToEmpty(p.get("symmetry")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(16, row, StringUtil.nullToEmpty(p.get("fluorescence_intensity")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(17, row, StringUtil.nullToEmpty(p.get("mile_color")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(18, row, StringUtil.nullToEmpty(p.get("partial_color"))+StringUtil.nullToEmpty(p.get("coffee"))+StringUtil.nullToEmpty(p.get("green")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(19, row, StringUtil.nullToEmpty(p.get("eye_clean")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(20, row, StringUtil.nullToEmpty(p.get("black_inc"))+StringUtil.nullToEmpty(p.get("center_inc"))+StringUtil.nullToEmpty(p.get("black_in_center"))+StringUtil.nullToEmpty(p.get("black_in_side"))+StringUtil.nullToEmpty(p.get("white_in_center")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(21, row, StringUtil.nullToEmpty(p.get("oPrice")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(22, row, StringUtil.nullToEmpty(p.get("order_price")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(23, row, StringUtil.nullToEmpty(p.get("payMoney")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(24, row, StringUtil.nullToEmpty(p.get("xxxx").toString()), getNormolCell());
//            ws.addCell(l);
//            l = new Label(25, row, StringUtil.nullToEmpty(p.get("statusT")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(26, row, StringUtil.nullToEmpty(p.get("claimType")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(27, row, StringUtil.nullToEmpty(p.get("purchaserName")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(28, row, StringUtil.nullToEmpty(p.get("purMobile")), getNormolCell());
//            ws.addCell(l);
//            l = new Label(29, row, StringUtil.nullToEmpty(p.get("Dtype")), getNormolCell());
//            ws.addCell(l);
//        }
        // 输出流
        wwb.write();
        // 关闭流
        wwb.close();
    }
}
