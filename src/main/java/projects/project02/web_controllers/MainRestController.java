package projects.project02.web_controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.UserRepository;
import projects.project02.dto.AuthDataDTO;
import projects.project02.dto.AuthStatusResponseDTO;
import projects.project02.dto.ConfirmSmsDTO;
import projects.project02.dto.ReCaptchaResponseDTO;
import projects.project02.entyties.User;
import projects.project02.entyties.UserStatus;
import projects.project02.exceptions.BadAuthDataRuntimeException;
import projects.project02.exceptions.BadCaptchaRuntimeException;
import projects.project02.services.GenratorCodeForSms;
import projects.project02.services.ReCaptchaApiClient;
import projects.project02.validators.AuthDataValidator;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.Optional;

@RestController
public class MainRestController {
    private final Logger logger = LoggerFactory.getLogger(MainRestController.class);
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ReCaptchaApiClient reCaptchaApiClient;
    @Autowired
    private AuthDataValidator authDataValidator;
    @Autowired
    private AuthStatusResponseDTO responseDTO;
    @Autowired
    private GenratorCodeForSms genratorCodeForSms;


    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/regisration", method = RequestMethod.POST)
    public AuthStatusResponseDTO registration(AuthDataDTO authDataDTO, HttpServletRequest request){
        System.out.println(authDataDTO);
//        ReCaptchaResponseDTO reCaptchaResponse = reCaptchaApiClient.verify(authDataDTO.getRecapchaResponse());
//        if (reCaptchaResponse.isSuccess()) {
//            logger.warn("Некорректная капча с ip: "+request.getRemoteAddr());
//            throw new BadCaptchaRuntimeException();
//        }
        if (authDataValidator.nameIsInvalid(authDataDTO.getName())) {
            logger.warn("Некорректное имя в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        if (authDataValidator.emailIsInvalid(authDataDTO.getEmail())){
            logger.warn("Некорректный email в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        if (authDataValidator.phoneIsInvalid(authDataDTO.getPhone())){
            logger.warn("Некорректный телефон в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        Optional<User> optionalUser = userRepository.findUserByPhoneOrEmail(authDataDTO.getPhone(),authDataDTO.getEmail());
        optionalUser.ifPresentOrElse(
                user -> {
                    if (user.getStatus()== UserStatus.CONFIRMED) {
                        logger.info("Предоставлены данные уже существующего пользователя, " + user);
                        responseDTO.setStatus("error");
                        responseDTO.setMessage("Пользователь с таким телефоном и/или почтой уже зарегистрировался");
                    }else {
                        user.setSmsCode(genratorCodeForSms.getCodeFoSms());
                        userRepository.save(user);
                        responseDTO.setStatus("ok");
                        responseDTO.setMessage("code:"+user.getSmsCode());
                        logger.info("Повторно выслан код для "+user); }
                    },
                ()->{
                    User user = new User();
                    user.setName(authDataDTO.getName());
                    user.setEmail(authDataDTO.getEmail());
                    user.setPhone(authDataDTO.getPhone());
                    user.setRegistrationDate(LocalDateTime.now());
                    user.setSmsCode(genratorCodeForSms.getCodeFoSms());
                    user.setStatus(UserStatus.CREATED);
                    userRepository.save(user);
                    logger.info("Сохранён новый пользователь " +user);
                    responseDTO.setStatus("ok");
                    responseDTO.setMessage("code:"+user.getSmsCode());
                });

        return responseDTO;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public AuthStatusResponseDTO confirmSms(ConfirmSmsDTO confirmSmsDTO){
        System.out.println("confirmSms:"+confirmSmsDTO);
        responseDTO.setStatus("ok");
        responseDTO.setMessage("lalalala");
        logger.info(""+confirmSmsDTO);
        return responseDTO;
    }



    @ExceptionHandler(BadCaptchaRuntimeException.class)
    public ResponseEntity badCaptcha(){
        return new ResponseEntity(HttpStatus.FORBIDDEN);
    }
    @ExceptionHandler(BadAuthDataRuntimeException.class)
    public ResponseEntity badAuthData(){
        return new ResponseEntity(HttpStatus.FORBIDDEN);
    }
}
