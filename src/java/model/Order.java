/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author citih
 */
public class Order {
    private int order_id,customer_id,totalmoney;
    private String time_order;

    public Order() {
    }

    public Order(int order_id, int customer_id, int totalmoney, String time_order) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.totalmoney = totalmoney;
        this.time_order = time_order;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getTime_order() {
        return time_order;
    }

    public void setTime_order(String time_order) {
        this.time_order = time_order;
    }
    
}
