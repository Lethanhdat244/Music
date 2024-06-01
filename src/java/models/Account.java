package models;

import java.util.Date;

/**
 *
 * @author thanh
 */
public class Account {

    private int id;
    private String useName;
    private String password;
    private String fullName;
    private String email;
    private String img;
    private boolean gender;
    private Date dob;
    private int role;

    public Account() {
    }

    public Account(int id, String useName, String password, String fullName, String email, String img, boolean gender, Date dob, int role) {
        this.id = id;
        this.useName = useName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.img = img;
        this.gender = gender;
        this.dob = dob;
        this.role = role;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getUseName() {
        return useName;
    }

    public void setUseName(String useName) {
        this.useName = useName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
