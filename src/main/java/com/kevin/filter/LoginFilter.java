package com.kevin.filter;

import com.kevin.entity.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 16:40
 */
public class LoginFilter extends AbstractInterceptor {

    public String intercept(ActionInvocation arg0) throws Exception {
        // TODO Auto-generated method stub
        Map session = arg0.getInvocationContext().getSession();
        User user = (User) session.get("user");

        if (user == null) {
//            return "login";
            return Action.LOGIN;
        }
        return arg0.invoke();
//        return "success";
    }
}