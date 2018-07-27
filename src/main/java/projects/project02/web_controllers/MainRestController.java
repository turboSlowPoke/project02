package projects.project02.web_controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.UserRepository;
import projects.project02.dto.AuthDataDTO;
import projects.project02.dto.ReCaptchaResponseDTO;
import projects.project02.services.ReCaptchaApiClient;

@RestController
public class MainRestController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ReCaptchaApiClient reCaptchaApiClient;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/regisration", method = RequestMethod.POST)
    public void registration(@RequestBody AuthDataDTO authDataDTO){
        ReCaptchaResponseDTO reCaptchaResponse = reCaptchaApiClient.verify(authDataDTO.getRecapchaResponse());
        System.out.println(reCaptchaResponse);
        if (!reCaptchaResponse.isSuccess())
            throw new RuntimeException();
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity error(){
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
}
