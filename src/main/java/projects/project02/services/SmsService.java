package projects.project02.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import projects.project02.dto.sms_api.MessageSmsDTO;
import projects.project02.dto.sms_api.RequestSmsApiDTO;
import projects.project02.dto.sms_api.ResponseSmsApiDTO;

import java.util.List;

@Component
public class SmsService {
    private final Logger logger = LoggerFactory.getLogger(SmsService.class);
    @Value("http://api.iqsms.ru/messages/v2/send.json")
    private String apiURL;
    @Autowired
    private RequestSmsApiDTO requestSmsApiDTO;
    @Autowired
    private MessageSmsDTO messageSmsDTO;

    public ResponseSmsApiDTO sendSms(String code, Integer userId, String phone){
        ResponseSmsApiDTO smsResponse=null;
        RestTemplate restTemplate = new RestTemplate();
        try {
            messageSmsDTO.setText("Код: "+code);
            messageSmsDTO.setClientId(userId);
            messageSmsDTO.setPhone("+7"+phone);
            requestSmsApiDTO.setMessages(List.of(messageSmsDTO));
            logger.info("Отправляем смс:"+requestSmsApiDTO);
            smsResponse = restTemplate.postForObject(apiURL, requestSmsApiDTO, ResponseSmsApiDTO.class);
            logger.info(smsResponse.toString());
        }catch (RestClientException e){
            logger.trace("Ошибка при отправке смс",e);
        }
        return smsResponse;
    }
}
