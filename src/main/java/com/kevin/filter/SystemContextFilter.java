package com.kevin.filter;

import com.kevin.dto.SystemContext;

import javax.servlet.*;
import java.io.IOException;

/**
 * 分页管理
 *
 */
public class SystemContextFilter implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {
        try {
            int pageOffset = 0;
            try {
                pageOffset = Integer.parseInt(req.getParameter("pager.offset"));
            } catch (NumberFormatException e) {
            }
            SystemContext.setPageOffset(pageOffset);
            chain.doFilter(req, resp);
        } finally {
            SystemContext.removePageOffset();
        }
    }

    @Override
    public void init(FilterConfig cfg) throws ServletException {
        try {
        } catch (NumberFormatException e) {
        }
    }
}
