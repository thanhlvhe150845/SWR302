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
public class Categories {
    private int categoy_id;
    private String category_name;

    public Categories() {
    }

    public Categories(int categoy_id, String category_name) {
        this.categoy_id = categoy_id;
        this.category_name = category_name;
    }

    public int getCategoy_id() {
        return categoy_id;
    }

    public void setCategoy_id(int categoy_id) {
        this.categoy_id = categoy_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    
    
}
