package com.kevin.entity;

import javax.persistence.*;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 18:56
 */
@Entity
@Table(name = "course")
public class Course {

    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "term", nullable = true)
    private int term;

    @Basic
    @Column(name = "period", nullable = true)
    private int period;

    @Basic
    @Column(name = "credit", nullable = true)
    private int credit;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", term=" + term +
                ", period=" + period +
                ", credit=" + credit +
                '}';
    }
}
