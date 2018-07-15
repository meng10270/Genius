package genius.service;

import java.util.List;

import genius.domain.User;
import genius.util.DBUtils;

/**
 * 用户服务类
 * @author 
 *
 */
public class UserService {
    /**
     * 通过用户名获取用户
     * @param username 用户名
     * @return 用户
     */
    public User getUserByUsername(String username) {
        String sql = "select userid, pwd, fullname, gender, phone, address from userinfo where userid = ?";
        String[] parameters = {username};
        List<Object[]> users = DBUtils.query(sql, parameters);
        if (users.size() == 0) {
            return null;
        } else {
            Object[] objects = users.get(0);
            return objects == null ? null : new User(objects[0].toString(), objects[1].toString(),objects[2].toString(), objects[3].toString(),objects[4].toString(), objects[5].toString());
        }
    }

    /**
     * 添加用户
     * @param user 用户
     */
    public void addUser(User user) {
        String[] sqls = {"insert into userinfo(userid, pwd) values(?, ?)"};
        String[][] parameters = {{user.getUsername(), user.getPassword()}};
        DBUtils.updates(sqls, parameters);
    }
    
    public void updateUser(User user) {
        String[] sqls = {"update userinfo set pwd=?,fullname=?,gender=?,phone=?,address=? where userid='"+user.getUsername()+"'"};
        String[][] parameters = {{user.getPassword(), user.getFullname(), user.getGender(),user.getPhone(), user.getAddress()}};
        DBUtils.updates(sqls, parameters);     
    }
}