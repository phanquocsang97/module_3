package com.example.exercise.repository;

import com.example.exercise.model.User;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static com.example.exercise.repository.BaseRepository.getConnection;

public class UserRepository implements IUserRepository {
    private static final String SHOW_LIST = "select * from users where is_delete= 0";

    //    private static final String ADD_USER = "INSERT INTO users (name_user, email_user, country_user) VALUES (?, ?, ?) ";
    private static final String ADD_USER = "call add_user(?, ?, ?)";
    //    private static final String SELECT_USER = "select id_user,name_user,email_user,country_user from users where id_user =?";
    private static final String SELECT_USER = "call select_user(?)";
    //    private static final String DELETE_USERS = "update users set is_delete= 1 where id_user = ?";
    private static final String DELETE_USERS = "call delete_user(?)";
    //    private static final String UPDATE_USERS = "update users set name_user = ?,email_user= ?, country_user =? where id_user = ?;";
    private static final String UPDATE_USERS = "call update_user(?,?,?,?)";
    private static final String SEARCH_USERS = "select * from users where name_user like ? and is_delete = 0;";


    @Override
    public void addUser(User user) throws SQLException {
        Connection connection = getConnection();
        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER);
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.executeUpdate();
            CallableStatement callableStatement = connection.prepareCall(ADD_USER);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = getConnection();
        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER);
//            preparedStatement.setInt(1,id);
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER);
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email_user");
                String country = resultSet.getString("country_user");
                user = new User(id, name, email, country);
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> showList() {
        Connection connection = getConnection();
        List<User> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SHOW_LIST);

            while (resultSet.next()) {
                int id = resultSet.getInt("id_user");
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email_user");
                String country = resultSet.getString("country_user");
                list.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        Connection connection = getConnection();
//        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS);
//        preparedStatement.setInt(1, id);
//        rowDelete = preparedStatement.executeUpdate() > 0;
        CallableStatement callableStatement = connection.prepareCall(DELETE_USERS);
        callableStatement.setInt(1, id);
        rowDelete = callableStatement.executeUpdate() > 0;
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        Connection connection = getConnection();
//        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS);
//        preparedStatement.setString(1, user.getName());
//        preparedStatement.setString(2, user.getEmail());
//        preparedStatement.setString(3, user.getCountry());
//        preparedStatement.setInt(4, user.getId());
        CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS);
        callableStatement.setInt(1, user.getId());
        callableStatement.setString(2, user.getName());
        callableStatement.setString(3, user.getEmail());
        callableStatement.setString(4, user.getCountry());
        rowUpdate = callableStatement.executeUpdate() > 0;
        return rowUpdate;
    }

    @Override
    public List<User> searchUser(String name) {
        Connection connection = getConnection();
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_user");
                String nameSearch = resultSet.getString("name_user");
                String email = resultSet.getString("email_user");
                String country = resultSet.getString("country_user");
                list.add(new User(id, nameSearch, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    @Override
    public void addUserTransaction(User user) {
        String SQL_ADD_TRANSACTION = "insert into users(name_user,email_user, country_user) values (?,?,?);";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = BaseRepository.getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(SQL_ADD_TRANSACTION);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowEffected = preparedStatement.executeUpdate();

            if (rowEffected == 1) { //trong trường hợp lệnh insert thành công (số dòng ảnh hường = 1), tiến hành commit data
                connection.commit();
            } else { //nếu không thành công thì rollback
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
