package com.kevin.service.impl;

import com.kevin.dao.GradeDao;
import com.kevin.entity.Grade;
import com.kevin.service.GradeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 15:20
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {

    @Resource
    private GradeDao gradeDao;

    @Override
    public List getAllGrade() {
        return this.gradeDao.getAllGrade();
    }

    @Override
    public List getSelectGrade(String hsql) {
        return this.gradeDao.getSelectGrade(hsql);
    }

    @Override
    public List getGradeById(int id) {
        return gradeDao.getGradeById(id);
    }

    @Override
    public void setGradeById(int id, String score) {
        this.gradeDao.setGradeById(id, score);
    }

    @Override
    public void updateGrade(Grade grade) {
        this.gradeDao.updateGrade(grade);
    }


}
