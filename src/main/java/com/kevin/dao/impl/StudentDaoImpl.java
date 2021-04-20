package com.kevin.dao.impl;

import com.kevin.dao.StudentDao;
import com.kevin.dto.Pager;
import com.kevin.entity.Student;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-13 0013 18:47
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("studentDao") //进行注入
public class StudentDaoImpl implements StudentDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    /**
     * 查询所有学生
     *
     * @return
     */
    @Override
    public List findAll() {
        //查询字符串
//        String hsql = "FROM Student";
        return getSession().createQuery("FROM Student").list();
    }

    /**
     * 分页查询学生信息
     *
     * @param hql  前端构造的SQL
     * @param page 当前页
     * @param size 每页数量
     * @return 实体Pager
     */
    @Override
    public Pager<Student> findByPage(String hql, int page, int size) {
        // 定义返回数据
        Pager<Student> pages = new Pager<Student>();
        // 构造查询总数的SQL
        String getCountSQL = getCountHql(hql);
        System.out.println("========TotalCounts:" + getCountSQL);
        // 获取当前总记录数
        long totalRecord = (Long) getSession().createQuery(getCountSQL).uniqueResult();
        System.out.println("========totalRecord:" + totalRecord);
        // 计算总页数
        long pageNum = totalRecord / size;
        if (totalRecord % size > 0) {
            pageNum++;
        }
        // 如果当前页数超过了限制，则返回第1页
        if (page > totalRecord) {
            page = 1;
        }
        // 构造分页查询的SQL
        Query pageQuery = this.getSession().createQuery(hql).setFirstResult((page - 1) * size).setMaxResults(size);
        System.out.println("===========SQL ：" + pageQuery.toString());
        // 获取查询结果
        List data = pageQuery.list();
        // 保存结果至Page
        pages.setData(data);
        pages.setPageNum(pageNum);
        pages.setPageSize(size);
        pages.setTotalRecord(totalRecord);
        pages.setPageNow(page);
        return pages;

//        int pageOffset = SystemContext.getPageOffset();
//        int pageSize = 10;
//
//        // 构造查询语句
//        Query q = this.getSession().createQuery(hql);
//        Query cq = this.getSession().createQuery(getCountHql(hql));
//
////        // 参数组合
////        if (args != null) {
////            int index = 0;
////            for (Object arg : args) {
////                q.setParameter(index, arg);
////                cq.setParameter(index, arg);
////                index++;
////            }
////        }
////        long totalRecord = (Long) cq.uniqueResult();
//        q.setFirstResult(pageOffset == 1 ? 0 : pageOffset);
//        q.setMaxResults(pageSize);
//        List<Student> data = q.list();
//        pages.setData(data);
//        pages.setPageOffset(pageOffset);
//        pages.setPageSize(pageSize);
//        long pageNum = totalRecord / pageSize;
//        if (totalRecord % pageSize > 0) {
//            pageNum++;
//        }
//        pages.setPageNum(pageNum);
//        pages.setTotalRecord(totalRecord);

    }

    @Override
    public Student getLastStudent() {
        List<Student> list = (List<Student>) this.getSession().createQuery("from Student order by id desc").setFirstResult(0).setMaxResults(1).list();
        return list.get(0);
    }

    @Override
    public void add(Student student) {
        this.getSession().save(student);
    }

    @Override
    public Student getStudentById(int id) {
        return (Student) this.getSession().get(Student.class, id);
    }

    @Override
    public void updateStudent(Student student) {
        this.getSession().update(student);
    }

    @Override
    public void deleteStudent(int id) {
        this.getSession().delete(
                sessionFactory.getCurrentSession().get(Student.class, id)
        );
    }

    /**
     * 计算分页数字
     *
     * @param hql 查询字符串
     * @return 计算分页的字符串
     */
    private String getCountHql(String hql) {
        //1、获取from前面的字符串
        String f = hql.substring(0, hql.indexOf("from")).trim();
        //2、将from前面的字符串替换为select count(*)
        if ("".equals(f)) {
            hql = "select count(*) " + hql;
        } else {
            hql = hql.replace(f, "select count(*) ");
        }
        //3、将fetch替换为""，因为抓取查询不能使用count(*)
        hql = hql.replace("fetch", " ");
        return hql;
    }
}
