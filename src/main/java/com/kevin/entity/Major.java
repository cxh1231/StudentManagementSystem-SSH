package com.kevin.entity;

import javax.persistence.*;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 19:05
 */
@Entity
@Table(name = "major")
public class Major {

    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "snum", nullable = false)
    private int snum;

    @Basic
    @Column(name = "instructor", nullable = false)
    private String instructor;

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

    public int getSnum() {
        return snum;
    }

    public void setSnum(int snum) {
        this.snum = snum;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    @Override
    public String toString() {
        return "Major{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", snum=" + snum +
                ", instructor='" + instructor + '\'' +
                '}';
    }
}
