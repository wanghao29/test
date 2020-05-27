package com.asiainfo.cmc.utils;

import java.util.List;

public class PageInfo<T> {
    /**
     * 当前页码
     */
    private int page;
    /**
     * 每页显示数据条数
     */
    private int pageSize;
    /**
     * 总记录数
     */
    private int totalCount;
    /**
     * 总页数
     */
    private int totalPages;

    private List<T> list;

    public PageInfo() {
    }

    public PageInfo(int page, int pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }

    public PageInfo(int page, int pageSize, int totalCount, int totalPages) {
        this.page = page;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPages = totalPages;
    }

    public void setPageInfo(int totalCount, int totalPages) {
        this.totalCount = totalCount;
        this.totalPages = totalPages;
    }

    public void setPageInfo(int page, int pageSize, int totalCount, int totalPages) {
        this.page = page;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPages = totalPages;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }
}
