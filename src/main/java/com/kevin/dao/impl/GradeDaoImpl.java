package com.kevin.dao.impl;

import com.kevin.dao.GradeDao;
import com.kevin.entity.Grade;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import javax.annotation.Resource;
import java.util.List;


/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 09:39
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("gradeDao") //进行注入
public class GradeDaoImpl implements GradeDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public List getAllGrade() {
        System.out.println("Here Done");
        Query query = this.getSessionFactory().getCurrentSession().createSQLQuery("SELECT " +
                "grade.id AS id," + // 成绩的ID
                "grade.sno AS studentId," + // 学号
                "student.name AS studentName," + // 姓名
                "grade.course_id AS courseId, " + // 课程号
                "course.name AS courseName, " + // 课程名
                "grade.score AS score, " + // 成绩
                "course.credit AS credit " + // 学分
                "FROM grade,student,course " +
                "WHERE 1=1 " +
                "AND grade.sno = student.id " +
                "AND grade.course_id = course.id ");
        System.out.println(query.toString());
        return query.list();
    }

    @Override
    public List getSelectGrade(String hsql) {
        Query query = this.getSessionFactory().getCurrentSession().createSQLQuery("SELECT " +
                "grade.id AS id," + // 成绩的ID
                "grade.sno AS studentId," + // 学号
                "student.name AS studentName," + // 姓名
                "grade.course_id AS courseId, " + // 课程号
                "course.name AS courseName, " + // 课程名
                "grade.score AS score, " + // 成绩
                "course.credit AS credit " + // 学分
                "FROM grade,student,course " +
                "WHERE 1=1 " +
                "AND grade.sno = student.id " +
                "AND grade.course_id = course.id " + hsql
        );
        System.out.println(query.toString());
        return query.list();
    }

    @Override
    public List getGradeById(int id) {
        return null;
    }

    @Override
    public void setGradeById(int id, String score) {
        Query query = this.getSessionFactory().getCurrentSession().createQuery("update Grade set score = '"+score+"' WHERE id = "+id);
//        Query query = this.getSessionFactory().getCurrentSession().createSQLQuery("UPDATE grade " +
//                "SET score = '" + score + "' " +
//                "WHERE id = '" + id + "'"
//        );
        query.executeUpdate();
    }

    @Override
    public void updateGrade(Grade grade) {
        this.getSessionFactory().getCurrentSession().update(grade);
    }


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
