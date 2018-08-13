package projects.project02.web_controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.EventRepository;
import projects.project02.data_repository.UserRepository;
import projects.project02.dto.frontend.StatusResponseDTO;
import projects.project02.entyties.Event;
import projects.project02.entyties.EventStatus;
import projects.project02.entyties.User;

import java.util.List;
import java.util.Optional;

@RestController
public class AdminRestController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private EventRepository eventRepository;
    @Autowired
    private StatusResponseDTO responseDTO;
    private final Logger logger = LoggerFactory.getLogger(AdminRestController.class);
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/admin/create_event",method = RequestMethod.POST)
    public StatusResponseDTO createEvent(@RequestBody Event newEvent){
        Optional<Event> activeEvent = eventRepository.findEventByStatus(EventStatus.ACTIVE);
        activeEvent.ifPresentOrElse(
                event -> {
                    responseDTO.setStatus("error");
                    responseDTO.setMessage("Нельзя создать мероприятие, уже есть активное мероприятие");
                },
                () -> {
                    newEvent.setStatus(EventStatus.ACTIVE);
                    eventRepository.save(newEvent);
                    logger.info("Создано новое мероприятие",newEvent);
                    responseDTO.setStatus("ok");
                    responseDTO.setMessage("Мероприятие создано");
                });
        return responseDTO;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/admin/event_list",method = RequestMethod.GET)
    public Iterable<Event> getEventList(){
        return eventRepository.findAll();
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/admin/user_list",method = RequestMethod.GET)
    public Iterable<User> getUserList(){
        return userRepository.findAll();
    }
}
