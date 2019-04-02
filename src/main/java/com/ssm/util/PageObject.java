package com.ssm.util;

/**
 * create by Gordon on 2019/2/21
 * 分页对象，注意其中init()方法是为了校正前台分页传来的分页属性
 *  * totalRow 某次查询的总记录数  -1就表示这个分页查询是第一次使用
 *  * pageNo 当前查询页码
 *  * pageSize  每页记录条数   -1 代表查所有的数据
 *  * begRow 页起始记录行数
 *  * endRow 页的截止记录行数
 */
public class PageObject {
    private int totalRow = -1;
    private int pageNo;
    private int begRow;
    private int endRow;
    private int pageSize;

    private final int DEFAULT_PAGESIZE = 10;
    private final int MAX_PAGESIZE = 1000;

    public PageObject(int pageNo,int totalRow){
        this.totalRow = totalRow;
        this.pageNo = pageNo;
        init();
    }

    public PageObject(int pageNo, int pageSize, int totalRows){
        this.totalRow = totalRows;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        init();
    }

    /**
     * 根据构造数据初始页对象
     */
    private void init() {
        //校正totalRows && pageNo && pageSize
        if (pageNo <= 0) pageNo = 1;
        if (pageSize == 0) pageSize = DEFAULT_PAGESIZE;
        if (pageSize > MAX_PAGESIZE) pageSize = MAX_PAGESIZE;
        if (pageSize > 0){
            begRow = (pageNo - 1 ) * pageSize + 1;
            endRow = pageNo * pageSize;
        } else {
            begRow = 1;
            endRow = MAX_PAGESIZE;
        }
    }

    public int getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getBegRow() {
        return begRow;
    }

    public void setBegRow(int begRow) {
        this.begRow = begRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public int getDEFAULT_PAGESIZE() {
        return DEFAULT_PAGESIZE;
    }

    public int getMAX_PAGESIZE() {
        return MAX_PAGESIZE;
    }
}
