package com.kevin.dto;

import java.util.List;

/**
 * 分页工具类
 */
public class Pager<T> {
    // 列表实体
    private List<T> data;
    // 当前页码
    private int pageNow;
    // 记录总数
    private long totalRecord;
    // 每页大小
    private int pageSize;
    // 总页码
    private long pageNum;


    public long getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(long totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public long getPageNum() {
        return pageNum;
    }

    public void setPageNum(long pageNum) {
        this.pageNum = pageNum;
    }


    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    @Override
    public String toString() {
        return "Pager{" +
                "data=" + data +
                ", pageNow=" + pageNow +
                ", totalRecord=" + totalRecord +
                ", pageSize=" + pageSize +
                ", pageNum=" + pageNum +
                '}';
    }
}
