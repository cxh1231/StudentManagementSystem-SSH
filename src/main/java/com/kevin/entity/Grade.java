package com.kevin.entity;

import javax.persistence.*;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 19:01
 */
@Entity
@Table(name = "grade")
public class Grade {

    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "sno", nullable = false)
    private int sno;

    @Basic
    @Column(name = "course_id")
    private String courseId;

    @Basic
    @Column(name = "score")
    private String score;

    @Basic
    @Column(name = "credit")
    private int credit;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", sno=" + sno +
                ", courseId=" + courseId +
                ", score=" + score +
                ", credit=" + credit +
                '}';
    }
}
