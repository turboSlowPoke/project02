package projects.project02.web_controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.UserRepository;
import projects.project02.entyties.User;

@RestController
public class FormRestController {
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/add_user", method = RequestMethod.POST)
    public @ResponseBody User addUser(@RequestBody User user){
        System.out.println(user);
        User user1 = userRepository.save(user);
        return user1;
    }
}
