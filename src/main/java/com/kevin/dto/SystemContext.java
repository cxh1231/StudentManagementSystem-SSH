package com.kevin.dto;

/**
 * 分页管理--页码
 */
public class SystemContext {

    private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();

    public static int getPageOffset() {
        int page = pageOffset.get();
        if (page == 0) {
            page++;
        }
        return page;
    }

    public static void setPageOffset(int _pageOffset) {
        pageOffset.set(_pageOffset);
    }

    public static void removePageOffset() {
        pageOffset.remove();
    }
}
