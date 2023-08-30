package com.example.exercise.service;

import com.example.exercise.model.User;
import com.example.exercise.repository.IUserRepository;
import com.example.exercise.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private final IUserRepository userRepository = new UserRepository();
    @Override
    public void addUser(User user) throws SQLException {
        userRepository.addUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchUser(String name) {
        return userRepository.searchUser("%"+name+"%");
    }
}
