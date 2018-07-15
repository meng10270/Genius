package genius.domain;

import java.io.Serializable;

/**
 * 用户类
 * @author 
 *
 */
@SuppressWarnings("serial")
public class User implements Serializable {
    private String username;    //用户名
    private String password;    //密码
    private String fullname;
    private String gender;
    private String phone;
    private String address;
    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public User(String username, String password, String fullname, String gender,String phone, String address) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getFullname() {
        return fullname;
    }
    
    public String getGender() {
        return gender;
    }

    public String getPhone() {
        return phone;
    }
    
    public String getAddress() {
        return address;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public void userLogout(){
        this.setUsername(null);
    }
}