package com.telusko.JobApp.service;

import com.telusko.JobApp.model.JobPost;
import com.telusko.JobApp.model.User;
import com.telusko.JobApp.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    public UserRepo repo;
    private BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);


    public List<User> returnAllUser() {
        return repo.findAll();
    }

    public void addUser(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        repo.save(user);
    }

    public User getUserId(Integer user_id) {
        Long id = Long.valueOf(user_id);
        Optional<User> optionalUser = repo.findById(id);
        User user = optionalUser.orElse(null);
        System.out.println(user);
        return user;
    }


    public User updateUser(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        repo.save(user);

        return user;
//        if (Long.valueOf(user.getUser_id()) == null) {
//            throw new IllegalArgumentException("User ID must not be null for update");
//        }
//
//        User existingUser = repo.findById(Long.valueOf(user.getUser_id()))
//                .orElseThrow(() -> new IllegalArgumentException("User not found with id: " + user.getUser_id()));
//        existingUser.setUsername(user.getUsername());
//        existingUser.setName(user.getName());
//        existingUser.setPassword(encoder.encode(user.getPassword()));
//        return repo.save(existingUser);
    }

    public void deleteUser1(Integer userId) {
        repo.deleteById(Long.valueOf(userId));
    }

    public User getUserByUsername(String username) {
        System.out.println( repo.findByUsername(username));
        return repo.findByUsername(username);
    }
}
