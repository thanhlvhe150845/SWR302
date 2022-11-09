/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Cart;
import model.Categories;

import model.Item;
import model.Product;

/**
 *
 * @author citih
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop8Product() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 8 *  from Products order by product_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Categories> getAllCategories() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt(1),
                        rs.getString(2));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductBycid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product c = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductBypid(String pid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByName(String txt) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where product_name like  ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product c = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account login(String user, String pass) {
        String sql = "select * from Customer_Account where account = ? and [password] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "select * from Customer_Account where account = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void sigup(String user, String pass) {
        String sql = "insert into Customer_Account values(?,?,0,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }

    public void deleteProduct(String id) {
        String sql = "delete from Products where product_id =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }

    public void insertProduct(String name, String price, String quantity, String categoryid, String image, String descibe) {
        String sql = "insert Products values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, price);
            st.setString(3, quantity);
            st.setString(4, categoryid);
            st.setString(5, image);
            st.setString(6, descibe);
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }

    public void editProduct(String name, String price, String quantity, String categoryid, String image, String descibe, String id) {
        String sql = "update Products set \n"
                + "product_name =? ,\n"
                + "price = ?,\n"
                + "quantity =?,\n"
                + "category_id = ?,\n"
                + "[image] = ?,\n"
                + "[description]=? where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, price);
            st.setString(3, quantity);
            st.setString(4, categoryid);
            st.setString(5, image);
            st.setString(6, descibe);
            st.setString(7, id);
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }

    public List<Product> getProductByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> check(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where 1=1 ";
        if (cid != null) {
            sql += " and category_id in (";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += ")";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product c = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account getAcount(String user, String pass) {
        String sql = "select * from Customer_Account where account = ? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account c = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));

            }
        } catch (SQLException e) {

        }
        return null;

    }

    public void addOder(Account c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "insert into [Order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getCustomer_id());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();

            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if(rs.next()){
                int oid = rs.getInt(1);
                for(Item i :cart.getItems()){
                    String sql2 ="insert into Order_Details values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getProduct_id());
                    st2.setDouble(3, i.getPrice());
                    st2.setInt(4, i.getQuantity());
                    st2.executeUpdate();
                }
            }
            String sql3="update Products set quantity=quantity-? where product_id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for(Item i :cart.getItems()){
                st3.setInt(1, i.getQuantity());
                st3.setInt(3, i.getProduct().getProduct_id());
                st3.executeUpdate();
            }
        } catch (SQLException e) {

        }
    }
     public void changePass(String pass,String user) {
        String sql = "update Customer_Account set [password] = ? where account = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
           
            st.executeUpdate();

        } catch (SQLException e) {

        }

    }
      public Account getAcountById(String id) {
        String sql = "select * from Customer_Account where customer_id= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account c = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));

            }
        } catch (SQLException e) {

        }
        return null;

    }
   public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Customer_Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account c = new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5));

                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Product> list = d.getAllProduct();
        System.out.println(list.get(1).getProduct_id());

    }
}
