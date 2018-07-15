package genius.domain;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Meng
 */

import java.util.ArrayList;
public class ShoppingCart {
    private final ArrayList<GoodsSingle> buyList = new ArrayList<>();
    public ArrayList<GoodsSingle> getBuys(){
        return this.buyList;
    }
    public GoodsSingle findGoods(int i) {
        return buyList.get(i);
    }
    public void addItem(GoodsSingle g) {
        if(buyList.isEmpty()) {
            buyList.add(g);
        }else {
            int i = 0;
            for(; i < buyList.size(); i++) {
                if(g.getName().equals(buyList.get(i).getName())) {
                    buyList.get(i).setNum(buyList.get(i).getNum()+1);
                    break;
                }
            }
            if(i >= buyList.size()) {
                buyList.add(g);
            }
        }
    }
    public void reduceItem(GoodsSingle g) {
        if(buyList.isEmpty()) {
            System.out.println("no item to reduce!");
        }else {
            int i = 0;
            for(; i < buyList.size(); i++) {
                if(g.getName().equals(buyList.get(i).getName())) {
                    if(buyList.get(i).getNum() > 1) {
                        buyList.get(i).setNum(buyList.get(i).getNum()-1);
                        break;
                    }else if(buyList.get(i).getNum() == 1) {
                        buyList.remove(buyList.get(i));
                        break;
                    }
                }
            }
        }
    }
    public void removeItem(GoodsSingle g) {
        if(buyList.isEmpty()) {
            System.out.println("没有可以删除的选项！");
        }else {
            buyList.remove(g);
        }
    }
    public void clearItem(String name) {
        if(buyList.isEmpty()) {
        }else {
            int i = 0;
            for(; i < buyList.size(); i++) {
               {
                    buyList.remove(i);
                }
            }
        }
    }
    public void clearCart() {
        buyList.clear();
    }
}
