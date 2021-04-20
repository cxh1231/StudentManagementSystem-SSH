package com.kevin.action;

import com.kevin.entity.Major;
import com.kevin.service.CourseService;
import com.kevin.service.MajorService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 10:34
 */
@Controller("majorAction")
@Scope("prototype")
public class MajorAction {

    private Major major;
    @Resource
    private MajorService majorService;

    /**
     * 显示课程列表
     *
     * @return
     */
    public String list() {


        Map request = (Map) ActionContext.getContext().get("request");
        List majors = this.majorService.findAll();
        request.put("majors", majors);
        return Action.SUCCESS;
    }

    public String toAdd() {
        return Action.SUCCESS;
    }
}
