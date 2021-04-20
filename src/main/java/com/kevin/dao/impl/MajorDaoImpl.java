package com.kevin.dao.impl;

import com.kevin.dao.MajorDao;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-13 0013 19:56
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("majorDao") //进行注入
public class MajorDaoImpl implements MajorDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;


    @Override
    public List findAll() {
        return sessionFactory.getCurrentSession().createQuery("FROM Major ").list();
    }
}
