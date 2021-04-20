package com.kevin.action;

import com.kevin.entity.Grade;
import com.kevin.service.CourseService;
import com.kevin.service.GradeService;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Action;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 09:37
 */
@Controller("gradeAction")
@Scope("prototype")
public class GradeAction {

    private Grade grade;

    private String studentId;
    private String studentName;
    private Integer courseId;
    private String courseName;
    private Integer gradeId;

    @Resource
    private GradeService gradeService;

    @Resource
    private CourseService courseService;

    public String list() {
        Map request = (Map) ActionContext.getContext().get("request");
        String hsql = "";
        if (this.studentName != null) {
//            System.out.println(this.studentName);
            request.put("studentName", studentName);
            hsql += "AND student.name like '%" + this.studentName + "%' ";
        }
        if (this.studentId != null) {
//            System.out.println(this.courseId);
            request.put("studentId", studentId);
            hsql += "AND grade.sno like '%" + this.studentId + "%' ";
        }
        if (this.courseId != null && this.courseId != 0) {
//            System.out.println(this.studentId);
            request.put("courseId", courseId);
            hsql += "AND grade.course_id like '%" + this.courseId + "%' ";
        }

        List grades = this.gradeService.getSelectGrade(hsql);

        List courses = this.courseService.getAllCourse();

        request.put("grades", grades);
        request.put("courses", courses);
        return Action.SUCCESS;
    }


    /**
     * 更新成绩
     *
     * @return
     */
    public String toUpdate() {
        Map request = (Map) ActionContext.getContext().get("request");
        String hsql = "";

        // 修改
        if (this.grade != null) {
            System.out.println(this.grade.toString());
            gradeService.setGradeById(grade.getId(), grade.getScore());
            request.put("msg", "成绩添加成功");
        }
        // 查询返回
        if(this.gradeId != null ){
            hsql += "AND grade.id='" + this.gradeId + "'";
        }
        else{
            hsql += "AND grade.id='" + this.grade.getId() + "'";
        }

        List grade = this.gradeService.getSelectGrade(hsql);
        // 返回数据
        System.out.println(grade.get(0).toString());
        request.put("grade", grade.get(0));
        // 修改返回
        return Action.SUCCESS;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
