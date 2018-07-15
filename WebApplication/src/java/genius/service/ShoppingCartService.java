/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genius.service;

import genius.util.DBUtils;

/**
 *
 * @author Meng
 */
public class ShoppingCartService {
    public void emptyCart(String userid)
    {
        String[] sqls = {"delete from cart where userid=?"};
        String[][] parameters = {{userid}};
        DBUtils.updates(sqls, parameters);
    }
    public void updateCart(String userid,String itemname,String quantity,String singleprice)
    {
        String[] sqls = {"insert into cart set userid=?,itemname=?,quantity=?,singleprice=?"};
        String[][] parameters = {{userid,itemname,quantity,singleprice}};
        DBUtils.updates(sqls, parameters);
    }
}
