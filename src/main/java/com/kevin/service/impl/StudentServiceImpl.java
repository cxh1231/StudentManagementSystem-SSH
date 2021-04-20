package com.kevin.service.impl;

import com.kevin.dao.StudentDao;
import com.kevin.dto.Pager;
import com.kevin.entity.Student;
import com.kevin.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-13 0013 18:57
 */
//注入服务
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    //自动注入userDao，也可以使用@Autowired
    @Resource
    private StudentDao studentDao;

    @Override
    public List findAll() {
        return this.studentDao.findAll();
    }

    @Override
    public Pager<Student> findByPage(String hql, int page, int size) {
        return this.studentDao.findByPage(hql, page, size);
    }

    @Override
    public Student getLastStudent() {
        return studentDao.getLastStudent();
    }

    @Override
    public void add(Student student) {
        studentDao.add(student);
    }

    @Override
    public Student getStudentById(int id) {
        return studentDao.getStudentById(id);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Override
    public void deleteStudent(int id) {
        studentDao.deleteStudent(id);
    }
}
