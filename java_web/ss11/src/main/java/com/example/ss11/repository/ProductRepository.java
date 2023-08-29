package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT = "SELECT * FROM products";
    private static final String INSERT = "insert into products(name_product,price_product,description_product,brand_product)\n"
            + "values (?,?,?,?);";
    private static final String DELETE = "delete from products where id = ?";
    private static final String FIND_BY_ID = "select id_product,name_product,price_product,description_product," +
            "brand_product from products where id = ?";
    private static final String UPDATE = "update products set name_product = ?,price_product = ?,description_product = ?," +
            "brand_product = ?";

    @Override
    public List<Product> findAll() {
        Connection connection = BaseRepository.getConnection();
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_product");
                String name = resultSet.getString("name_product");
                int price = resultSet.getInt("price_product");
                String description = resultSet.getString("description_product");
                String brand = resultSet.getString("brand_product");
                list.add(new Product(id, name, price, description, brand));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void saveProduct(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getBrand());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product findById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name_product");
                int price = resultSet.getInt("price_product");
                String description = resultSet.getString("description_product");
                String brand = resultSet.getString("brand_product");
                product = new Product(name,price,description,brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    public boolean updateProduct(Product product){
        boolean rowUpdate= false;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setInt(2,product.getPrice());
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.setString(4,product.getBrand());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }
}
