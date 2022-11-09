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
public class Account {

    private int customer_id;
    private String account;
    private String password;
    private int isSell;
    private int isAdmin;

    public Account() {
    }

    public Account(int customer_id, String account, String password, int isSell, int isAdmin) {
        this.customer_id = customer_id;
        this.account = account;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "customer_id=" + customer_id + ", account=" + account + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }
    
}
