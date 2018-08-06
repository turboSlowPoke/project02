package projects.project02.web_controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import projects.project02.entyties.Event;

@RestController
public class AdminRestController {
    private final Logger logger = LoggerFactory.getLogger(AdminRestController.class);
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/admin/create_event",method = RequestMethod.POST)
    public void createEvent(@RequestBody Event event){
        logger.info(event.toString());
    }
}
