package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void saveProduct(Product product);
    void deleteProduct(int id);
}
