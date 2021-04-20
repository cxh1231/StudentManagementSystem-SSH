package com.kevin.service.impl;

import com.kevin.dao.CourseDao;
import com.kevin.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 09:43
 */
//注入服务
@Service("courseService")
public class CourseServiceImpl implements CourseService {
    //自动注入userDao，也可以使用@Autowired
    @Resource
    private CourseDao courseDao;

    @Override
    public List getAllCourse() {
        return this.courseDao.getAllCourse();
    }
}
