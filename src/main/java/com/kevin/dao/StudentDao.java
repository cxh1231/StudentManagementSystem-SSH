package com.kevin.dao;

import com.kevin.dto.Pager;
import com.kevin.entity.Student;

import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-13 0013 18:46
 */
public interface StudentDao {

    /**
     * 获取所有的学生
     *
     * @return list
     */
    public List findAll();

    /**
     * 分页查询
     *
     * @param hql  前端构造的SQL
     * @param page 当前页
     * @param size 每页数量
     * @return pager类
     */
    public Pager<Student> findByPage(String hql, int page, int size);

    /**
     * 获取最后一个学生
     *
     * @return Student实体
     */
    public Student getLastStudent();

    /**
     * 添加学生
     *
     * @param student Student实体
     */
    public void add(Student student);

    /**
     * 通过ID查询学生信息
     *
     * @param id 学生ID
     * @return Student实体
     */
    public Student getStudentById(int id);

    /**
     * 更新学生信息
     *
     * @param student Student实体
     */
    public void updateStudent(Student student);

    /**
     * 通过ID删除学生
     *
     * @param id 学生ID
     */
    public void deleteStudent(int id);
}
