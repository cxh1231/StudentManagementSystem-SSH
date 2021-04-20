package com.kevin.entity;

import javax.persistence.*;

/**
 * Info：
 *
 * @author: cxhit.com
 * @date: 2021-04-12 0012 19:08
 */
@Entity
@Table(name = "student")
public class Student {

    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "gender")
    private String gender;

    @Basic
    @Column(name = "birthday")
    private String birthday;

    @Basic
    @Column(name = "major_id")
    private int majorId;

    @Basic
    @Column(name = "credits")
    private int credits;

    @Basic
    @Column(name = "remark")
    private String remark;

    @Basic
    @Column(name = "photo")
    private String photo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setId(String id) {
        if (id.equals("")) {
            id = "0";
        }
        this.id = Integer.parseInt(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday='" + birthday + '\'' +
                ", majorId=" + majorId +
                ", credits=" + credits +
                ", remark='" + remark + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
