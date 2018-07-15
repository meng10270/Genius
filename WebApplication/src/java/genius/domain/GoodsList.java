/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genius.domain;

import java.util.ArrayList;

/**
 *
 * @author Meng
 */
public class GoodsList {
    private final ArrayList<GoodsSingle> goodsList = new ArrayList<>();
    public ArrayList<GoodsSingle> getGoodList(){
        return this.goodsList;
    }
    public GoodsSingle findGoods(int i) {
        return goodsList.get(i);
    }
    public void addGoods(GoodsSingle g) {
        this.goodsList.add(g);
    }
    public void removeGoods(GoodsSingle g) {
        int index = goodsList.indexOf(g);
        this.goodsList.remove(index);
    }
    public void clearGoods() {
        this.goodsList.clear();
    }
}
