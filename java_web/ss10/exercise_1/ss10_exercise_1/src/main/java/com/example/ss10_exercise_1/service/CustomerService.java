package com.example.ss10_exercise_1.service;

import com.example.ss10_exercise_1.model.Customer;
import com.example.ss10_exercise_1.repository.CustomerRepository;
import com.example.ss10_exercise_1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private final ICustomerRepository customerRepository = new CustomerRepository();


    @Override
    public List<Customer> showList() {
        return customerRepository.showList();
    }
}
