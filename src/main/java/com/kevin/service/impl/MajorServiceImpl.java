package com.kevin.service.impl;

import com.kevin.dao.MajorDao;
import com.kevin.service.MajorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-13 0013 19:59
 */
//注入服务
@Service("majorService")
public class MajorServiceImpl implements MajorService {

    @Resource
    private MajorDao majorDao;

    @Override
    public List findAll() {
        return this.majorDao.findAll();
    }
}
