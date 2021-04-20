package com.kevin.action;

import com.kevin.dto.Pager;
import com.kevin.entity.Student;
import com.kevin.service.MajorService;
import com.kevin.service.StudentService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 19:40
 */
@Controller("studentAction")
@Scope("prototype")
public class StudentAction extends ActionSupport {

    private Student student;

    // 当前页面
    private int page = 1;

    // 每页显示个数
    private int size = 10;

    // 头像
    private File photo;
    //文件名    **FileName固定写法
    private String photoFileName;

//    @Resource
//    private BaseService<Student> baseService;

    @Resource
    private StudentService studentService;

    @Resource
    private MajorService majorService;


    /**
     * 分页查询
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

        // 返回请求
        Map request = (Map) ActionContext.getContext().get("request");

        // 获取专业
        List majors = this.majorService.findAll();
        System.out.println(majors);

        // 分页获取数据
        String hql = "from Student where 1=1";
        // 构造查询语句
        if (student != null) {
            // 数据打印测试
            System.out.println("=======" + this.getStudent().toString());
            if (this.getStudent().getId() != 0) {
                hql += " and id like '%" + this.getStudent().getId() + "%'";
            }
            if (!StringUtils.isEmpty(this.getStudent().getName())) {
                hql += " and name like '%" + this.getStudent().getName() + "%'";
            }
            if (!StringUtils.isEmpty(this.getStudent().getGender()) && !this.getStudent().getGender().equals("0")) {
//                String gender = (this.getStudent().getGender().equals("1") ? "男" : "女");
                hql += " and gender like '" + this.getStudent().getGender() + "'";
            }
            if (this.getStudent().getMajorId() != 0) {
                hql += " and majorId='" + this.getStudent().getMajorId() + "'";
            }
        }

        // 打印查询语句
        System.out.println("=========" + hql);

        Pager pager = studentService.findByPage(hql, page, size);
        System.out.println(pager);

        request.put("majors", majors);
        request.put("pager", pager);
        request.put("student", student);

        return "success";

//        if (student != null) {
//            int major_id = student.getMajorId();
//            if (major_id > 0) {
//                hql += " and major_id =" + major_id;
//            }
//            String name = student.getName();
//            if (!StringUtils.isEmpty(name)) {
//                hql += " and name like '%" + name + "%'";
//            }
//            int id = student.getId();
//            if (!StringUtils.isEmpty(id + "")) {
//                hql += " and id like '%" + id + "%'";
//            }
//            String gender = student.getGender();
//            if (!StringUtils.isEmpty(gender)) {
//                hql += " and gender =" + gender;
//            }
//        } else {
//            student = new Student();
//        }
//        ActionContext.getContext().put("entity", student);
//        System.out.println(student.toString());
//        System.out.println(hql);
//        ActionContext.getContext().put("pager", baseService.find(hql));
//        System.out.println(baseService.find(hql));
//        ActionContext.getContext().put("url", "pages/student/list.jsp");
//        return "url";
//        return "success";
    }

    /**
     * 跳转至添加学生页面
     *
     * @return 页面
     */
    public String toAdd() throws IOException {
        // 返回请求
        Map request = (Map) ActionContext.getContext().get("request");


        if (this.student != null) {
            // 上传照片
            if (this.getPhoto() != null) {
                System.out.println("upload photo------------------");
                // 上传文件
                String newFileName = upLoadFile(this.photo, this.photoFileName);
//                // 获取文件的后缀名
//                String suffixName = photoFileName.substring(photoFileName.lastIndexOf("."));
//                System.out.println("suffix :" + suffixName);
//                // 文件上传后的路径
//                String path = ServletActionContext.getServletContext().getRealPath("/upload");
//                System.out.println(path);
//                // 生成随机文件名
//                String newFileName = UUID.randomUUID().toString() + suffixName;
//                // 创建文件类型对象
//                File diskFile = new File(path + "//" + newFileName);
//                // 文件上传
//                FileUtils.copyFile(this.photo, diskFile);
                // 保存新的文件名
                this.student.setPhoto(newFileName);
            }
            // 执行插入
            studentService.add(this.student);

            System.out.println(this.getStudent().toString());
            request.put("msg", "添加成功");
        }

        // 获取最后一个用户
        Student lastStudent = this.studentService.getLastStudent();
        System.out.println(lastStudent);
        // 获取专业列表
        List majors = majorService.findAll();


        // 返回参数
        request.put("id", lastStudent.getId() + 1);
        request.put("majors", majors);
//        return "success";
        return Action.SUCCESS;
    }

    /**
     * 进行修改
     *
     * @return 页面
     */
    public String toUpdate() throws IOException {
        // 返回请求
        Map request = (Map) ActionContext.getContext().get("request");
        // 如果请求的数据不为空
        if (this.student != null) {
            // 打印请求数据
            System.out.println(this.student.toString());
            // 如果姓名为空，表示点开了编辑页面
            if (this.student.getName() == null) {
                // 获取需要编辑信息的学生的全部信息
                Student student1 = studentService.getStudentById(this.student.getId());
                // 返回前端
                request.put("student", student1);

            }
            // 否则，表示提交了修改信息
            else {
                // 判断是否更换了头像
                // 上传照片
                if (this.photo != null) {
                    // 上传文件
                    String newFileName = upLoadFile(this.photo, this.photoFileName);
                    this.student.setPhoto(newFileName);
                }
                // 进行修改
                studentService.updateStudent(this.student);
                // 返回前端
                request.put("student", this.student);
                request.put("msg", "修改成功");
            }
            // 获取专业列表
            List majors = majorService.findAll();
            request.put("majors", majors);
        }
//        return "success";
        return Action.SUCCESS;
    }

    /**
     * 查看学生信息
     *
     * @return
     */
    public String toShow() {
        // 返回请求
        Map request = (Map) ActionContext.getContext().get("request");
        // 获取学生信息
        Student student1 = studentService.getStudentById(this.student.getId());
        request.put("student", student1);
        // 获取专业列表
        List majors = majorService.findAll();
        request.put("majors", majors);
//        return "success";
        return Action.SUCCESS;
    }

    /**
     * 进行删除
     *
     * @return
     */
    public String toDelete() {
        // 返回请求
        Map request = (Map) ActionContext.getContext().get("request");
        studentService.deleteStudent(this.student.getId());
        request.put("msg", "删除成功");
//        return "success";
        return Action.SUCCESS;
    }


    private String upLoadFile(File file, String oldFileName) throws IOException {
        System.out.println("---------------upload file------------------");
        // 获取文件的后缀名
        String suffixName = oldFileName.substring(oldFileName.lastIndexOf("."));
        System.out.println("suffix :" + suffixName);
        // 文件上传后的路径
        // 上传两份不就完了嘛
        String path = ServletActionContext.getServletContext().getRealPath("/upload");
        String path2 = "D://IdeaProjects//202104-JEE//SSHLearning_pure_version//sshLearningLogin//src//main//webapp//upload";
        System.out.println(path);
        // 生成随机文件名
        String newFileName = UUID.randomUUID().toString() + suffixName;
        // 创建文件类型对象
        File diskFile = new File(path + "//" + newFileName);
        File diskFile2 = new File(path2 + "//" + newFileName);
        // 文件上传
        FileUtils.copyFile(file, diskFile);
        // 这里之所以上传两份，是防止编译后，编译目录下上传的图片丢失
        FileUtils.copyFile(file, diskFile2);
        return newFileName;
    }


//    /**
//     * list
//     *
//     * @return
//     */
////    public String list() {
////        List students = this.studentService.findAll();
////        List majors = this.majorService.findAll();
////        System.out.println(students);
////        System.out.println(majors);
////
////        Map request = (Map) ActionContext.getContext().get("request");
////        request.put("students", students);
////        request.put("majors", majors);
////        return "success";
////    }


    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public File getPhoto() {
        return photo;
    }

    public void setPhoto(File photo) {
        this.photo = photo;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }
}
