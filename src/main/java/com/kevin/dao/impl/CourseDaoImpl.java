package com.kevin.dao.impl;

import com.kevin.dao.CourseDao;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 09:37
 */
//出现Exception异常回滚
@Transactional(rollbackFor = Exception.class)
//进行注入
@Repository("courseDao")
public class CourseDaoImpl implements CourseDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 获取所有课程
     *
     * @return 课程列表
     */
    @Override
    public List getAllCourse() {
        return this.getSessionFactory().getCurrentSession().createQuery("FROM Course").list();
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
