package com.kevin.dao;

import com.kevin.entity.Grade;

import java.util.List;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-19 0019 09:38
 */
public interface GradeDao {

    public List getAllGrade();

    public List getSelectGrade(String hsql);

    public List getGradeById(int id);

    public void setGradeById(int id, String score);

    public void updateGrade(Grade grade);
}
