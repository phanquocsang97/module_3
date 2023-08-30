package com.example.exercise.service;

import com.example.exercise.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void addUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> showList();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;

    List<User> searchUser(String name);
}
