package projects.project02.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import projects.project02.dto.SMSRequestDTO;
import projects.project02.dto.SMSResponseDTO;

@Component
public class SmsService {
    private final Logger logger = LoggerFactory.getLogger(SmsService.class);

    @Value("http://api.iqsms.ru/messages/v2/send.json")
    private String apiURL;
    @Autowired
    private SMSRequestDTO smsRequestDTO;

    public boolean sendSms(String code){
        boolean check=true;
        RestTemplate restTemplate = new RestTemplate();
        try {
            SMSResponseDTO smsResponse = restTemplate.postForObject(apiURL,smsRequestDTO,SMSResponseDTO.class);
        }catch (RestClientException e){
            logger.trace("Ошибка при отправке смс",e);
        }finally {
            return check;
        }
    }
}
