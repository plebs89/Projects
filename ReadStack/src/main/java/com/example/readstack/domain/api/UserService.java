package com.example.readstack.domain.api;

import com.example.readstack.domain.user.User;
import com.example.readstack.domain.user.UserDao;

import java.time.LocalDateTime;

public class UserService {
    private UserDao userDao = new UserDao();

    public void register(UserRegistration userRegistration) {
        User userToSave = UserMapper.map(userRegistration);
        userDao.save(userToSave);
    }

    private static class UserMapper {
        static User map(UserRegistration userRegistration) {
            return new User(
                    userRegistration.getUsername(),
                    userRegistration.getEmail(),
                    userRegistration.getPassword(),
                    LocalDateTime.now()
            );
        }
    }
}