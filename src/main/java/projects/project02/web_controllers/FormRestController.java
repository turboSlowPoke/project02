package projects.project02.web_controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.UserRepository;
import projects.project02.entyties.AuthData;

@RestController
public class FormRestController {
    @Autowired
    private UserRepository userRepository;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/regisration", method = RequestMethod.POST)
    public void addUser(@RequestBody AuthData authData){
        System.out.println(authData);
    }
}
