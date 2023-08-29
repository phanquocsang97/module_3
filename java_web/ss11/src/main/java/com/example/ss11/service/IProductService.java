package com.example.ss11.service;

import com.example.ss11.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void saveProduct(Product product);

    void deleteProduct(int id);
}
