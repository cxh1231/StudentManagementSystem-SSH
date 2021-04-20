package com.kevin.action;

import com.kevin.entity.Course;
import com.kevin.service.CourseService;
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
 * @date: 2021-04-19 0019 09:36
 */
@Controller("courseAction")
@Scope("prototype")
public class CourseAction {

    private Course course;
    @Resource
    private CourseService courseService;

    /**
     * 显示课程列表
     *
     * @return
     */
    public String list() {
        //        List students = this.studentService.findAll();
//        List majors = this.majorService.findAll();
//        System.out.println(students);
//        System.out.println(majors);
//
//        Map request = (Map) ActionContext.getContext().get("request");
//        request.put("students", students);
//        request.put("majors", majors);
//        return "success";

        Map request = (Map) ActionContext.getContext().get("request");
        List courses = this.courseService.getAllCourse();
        request.put("courses", courses);
        return Action.SUCCESS;
    }

    public String toAdd() {
        return Action.SUCCESS;
    }
}
