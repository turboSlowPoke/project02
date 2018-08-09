package projects.project02.web_controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class MainController {

    @GetMapping("/")
    public ModelAndView getIndexPage(ModelAndView view){
        view.getModel().put("userName","Dfyz");
        view.setViewName("page01");
        return view;
    }

    @GetMapping("/page02")
    public ModelAndView getSecondPage(ModelAndView view){
        view.setViewName("page03");
        return view;
    }

    @GetMapping("/admin")
    public ModelAndView getAdminPage(ModelAndView view){
        view.setViewName("admin_page");
        return view;
    }
}
