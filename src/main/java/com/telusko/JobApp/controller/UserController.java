package com.telusko.JobApp.controller;

import com.telusko.JobApp.model.User;
import com.telusko.JobApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService service;

    @RequestMapping("/addUser")
    public String addUser() {
        return "addUser";
    }

    @PostMapping("/saveUser")
    public String saveUser(User user, Model model) {
        model.addAttribute("users", user);
        service.addUser(user);
        //System.out.println(jobPost);
        return "redirect:/viewallusers";

    }

    @GetMapping("/viewallusers")
    public String viewAllUsers(Model model) {
        List<User> user = service.returnAllUser();
        model.addAttribute("users", user);
        return "view_all_users";
    }
    @GetMapping("/editUser")
    public String editUser(@RequestParam("user_id") Integer user_id, Model model) {
        User user = service.getUserId(user_id); // Retrieve the user by ID
        model.addAttribute("user", user);       // Add single user to the model
        return "editUser";
    }

    @PostMapping("/updateUser")
    public String updateUser(User user) {
        service.updateUser(user);
        return "redirect:/viewallusers";
    }

    @DeleteMapping("/deleteUser")
    public ResponseEntity<String> deleteUser(@RequestParam("user_id") Integer user_id){
        try {
            service.deleteUser1(user_id);
            return  ResponseEntity.ok("User deleted successfully");
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting job");
        }
    }


}
