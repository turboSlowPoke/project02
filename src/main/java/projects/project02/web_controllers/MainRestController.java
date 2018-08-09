package projects.project02.web_controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import projects.project02.data_repository.UserRepository;
import projects.project02.dto.frontend.AuthDataDTO;
import projects.project02.dto.frontend.StatusResponseDTO;
import projects.project02.dto.frontend.ConfirmSmsDTO;
import projects.project02.dto.grecaptcha_api.ReCaptchaResponseDTO;
import projects.project02.entyties.User;
import projects.project02.entyties.UserStatus;
import projects.project02.exceptions.BadAuthDataRuntimeException;
import projects.project02.exceptions.BadCaptchaRuntimeException;
import projects.project02.services.GenratorCodeForSms;
import projects.project02.services.ReCaptchaApiClient;
import projects.project02.services.SmsService;
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
    private StatusResponseDTO responseDTO;
    @Autowired
    private GenratorCodeForSms genratorCodeForSms;
    @Autowired
    private SmsService smsService;


    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/regisration", method = RequestMethod.POST)
    public StatusResponseDTO registration(AuthDataDTO authDataDTO, HttpServletRequest request){
//        ReCaptchaResponseDTO reCaptchaResponse = reCaptchaApiClient.verify(authDataDTO.getRecapchaResponse());
//        if (!reCaptchaResponse.isSuccess()) {
//            logger.warn("Некорректная капча с ip: "+request.getRemoteAddr());
//            throw new BadCaptchaRuntimeException();
//        }
        if (authDataValidator.nameIsInvalid(authDataDTO.getName())) {
            logger.warn("Некорректное имя в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
//        if (authDataValidator.emailIsInvalid(authDataDTO.getEmail())){
//            logger.warn("Некорректный email в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
//            throw new BadAuthDataRuntimeException();
//        }
        if (authDataValidator.phoneIsInvalid(authDataDTO.getPhone())){
            logger.warn("Некорректный телефон в запросе: " +authDataDTO.getName()+", пришло с ip: "+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        Optional<User> optionalUser = userRepository.findUserByPhoneOrEmail(authDataDTO.getPhone(),authDataDTO.getEmail());
        optionalUser.ifPresentOrElse(
                user -> {
                    if (user.getStatus()== UserStatus.CONFIRMED) {
                        logger.info("Предоставлены данные:"+authDataDTO+" уже существующего пользователя:" + user);
                        responseDTO.setStatus("error");
                        responseDTO.setMessage("Пользователь с таким телефоном и/или почтой уже зарегистрировался");
                    }else {
                        user.setSmsCode(""+genratorCodeForSms.getCodeFoSms());
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
                    user.setSmsCode(""+genratorCodeForSms.getCodeFoSms());
                    user.setStatus(UserStatus.CREATED);
                    user=userRepository.save(user);
                    logger.info("Сохранён новый пользователь " +user);
                    request.getSession().setAttribute("userId",user.getId());
                    smsService.sendSms(user.getSmsCode(),user.getId(),user.getPhone());
                    responseDTO.setStatus("ok");
                    responseDTO.setMessage("");
                });

        return responseDTO;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public StatusResponseDTO confirmSms(ConfirmSmsDTO confirmSmsDTO, HttpServletRequest request){
        if (authDataValidator.smsCodeIsInValid(confirmSmsDTO.getCode())){
            logger.warn("Невалидный код из sms:"+confirmSmsDTO.getCode()+", пришел с Ip:"+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        if (request.getSession().getAttribute("userId")==null){
            logger.warn("К сесси не прикреплен атрибут с userId, пришел с Ip:"+request.getRemoteAddr());
            throw new BadAuthDataRuntimeException();
        }
        logger.info("Пришел :"+confirmSmsDTO);
        Optional<User> optionalUser=userRepository.findById((Integer)request.getSession().getAttribute("userId"));
        optionalUser.ifPresentOrElse(
                user -> {
                    if(confirmSmsDTO.getCode().equals(user.getSmsCode())) {
                        responseDTO.setStatus("ok");
                        responseDTO.setMessage("Вы зарегистрированы!");
                        user.setStatus(UserStatus.CONFIRMED);
                        userRepository.save(user);
                        logger.info("Успешно зарегистрировался юзер: "+user);
                    }else {
                        responseDTO.setStatus("error");
                        responseDTO.setMessage("Вы ввели не правильный код,попробуйте еще раз");
                    }
                },
                ()->{
                    throw new BadAuthDataRuntimeException();
                });
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
