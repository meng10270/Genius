/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genius.service;

import genius.util.DBUtils;
import genius.domain.User;

/**
 *
 * @author Meng
 */
public class ShoppingCartService {
    User user=new User();
    public void emptyCart()
    {
        String[] sqls = {"delete from cart where userid=?"};
        String[][] parameters = {{user.getUsername()}};
        DBUtils.updates(sqls, parameters);
    }
    public void updateCart()
    {}
}
