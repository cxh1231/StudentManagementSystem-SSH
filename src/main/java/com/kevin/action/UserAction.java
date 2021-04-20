package com.kevin.action;

import com.kevin.entity.User;
import com.kevin.service.UserService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Map;


@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {

    @Resource
    private UserService userService;

    private User user;

    /**
     * 进行登录
     *
     * @return
     */
    public String login() {
        Map session = ActionContext.getContext().getSession();
        Map request = (Map) ActionContext.getContext().get("request");
        if (userService.login(user)) {
//            Map session = ActionContext.getContext().getSession();
            session.put("user", user);
            return Action.SUCCESS;
        } else {
            request.put("msg", "用户名或密码错误，请重试");
            return Action.ERROR;
        }
    }

    public String toMain() {
        return Action.SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}

