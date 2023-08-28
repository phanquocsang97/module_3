package com.example.ss10_exercise_1.repository;

import com.example.ss10_exercise_1.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://static.thenounproject.com/png/600413-200.png"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://static.thenounproject.com/png/600413-200.png"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://static.thenounproject.com/png/600413-200.png"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://static.thenounproject.com/png/600413-200.png"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://static.thenounproject.com/png/600413-200.png"));
    }
    @Override
    public List<Customer> showList() {
        return customerList;
    }
}
