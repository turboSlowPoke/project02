package projects.project02.web_controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import projects.project02.data_repository.EventRepository;
import projects.project02.entyties.Event;
import projects.project02.entyties.EventStatus;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class MainController {
    @Autowired
    private EventRepository eventRepository;

    @GetMapping("/")
    public ModelAndView getIndexPage(ModelAndView view){
        view.getModel().put("userName","Dfyz");
        view.setViewName("page01");
        return view;
    }

    @GetMapping("/page02")
    public ModelAndView getSecondPage(){
        Map<String,Object> model = new HashMap<>();
        Optional<Event> event = eventRepository.findEventByStatus(EventStatus.ACTIVE);
        event.ifPresent(e -> {
            calculateBetweenDate(e.getDatetime()).forEach((key,value) ->{
                model.put(key,value);
            });
            model.put("seatsCount",e.getCountSeats());
        });
        return new ModelAndView("page03",model);
    }

    @GetMapping("/admin")
    public ModelAndView getAdminPage(ModelAndView view){
        view.setViewName("admin_page");
        return view;
    }

    public Map<String,String>  calculateBetweenDate(LocalDateTime eventDateTime){
        LocalDateTime fromDateTime = LocalDateTime.now();
        LocalDateTime toDateTime = eventDateTime;

        LocalDateTime tempDateTime = LocalDateTime.from( fromDateTime );

        long days = tempDateTime.until( toDateTime, ChronoUnit.DAYS);
        tempDateTime = tempDateTime.plusDays( days );


        long hours = tempDateTime.until( toDateTime, ChronoUnit.HOURS);
        tempDateTime = tempDateTime.plusHours( hours );

        long minutes = tempDateTime.until( toDateTime, ChronoUnit.MINUTES);
        tempDateTime = tempDateTime.plusMinutes( minutes );

        long seconds = tempDateTime.until( toDateTime, ChronoUnit.SECONDS);
        Map<String,String> map = new HashMap<>();
        if (days<10) map.put("timerDays","0"+days); else map.put("timerDays",""+days);
        if (minutes<10) map.put("timerHours","0"+hours); else map.put("timerHours",""+hours);
        if (minutes<10) map.put("timerMinutes","0"+minutes); else map.put("timerMinutes",""+minutes);
        return map;
    }
}
