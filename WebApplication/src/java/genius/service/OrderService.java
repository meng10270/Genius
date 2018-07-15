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
public class OrderService {
    public void submitOrder(String orderid,String total,String userid,String fullname,String phone,String address){
        String[] sqls = {"insert into `order` set orderid=?,total=?,userid=?,fullname=?,phone=?,address=?"};
        String[][] parameters = {{orderid,total,userid,fullname,phone,address}};
        DBUtils.updates(sqls, parameters);
    }
    public void updateOrderItem(String orderid,String itemname,String quantity,String singleprice){
        String[] sqls = {"insert into orderitem set orderid=?,itemname=?,quantity=?,singleprice=?"};
        String[][] parameters = {{orderid,itemname,quantity,singleprice}};
        DBUtils.updates(sqls, parameters);
    }
}
