package projects.project02.services;

import lombok.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import projects.project02.dto.grecaptcha_api.ReCaptchaResponseDTO;

@Component
public class ReCaptchaApiClient {
    private RestTemplate restTemplate = new RestTemplate();

    public ReCaptchaResponseDTO verify(@NonNull  String recapchaResponse) {
        String reCaptchaApiUrl="https://www.google.com/recaptcha/api/siteverify";
        String reCaptchaSecretKey="6Ldhk2YUAAAAADF_7hOatkM4pohDuF4nazIXB6WA";
        MultiValueMap<String,String> form = new LinkedMultiValueMap<>();
        form.add("secret", reCaptchaSecretKey);
        form.add("response",recapchaResponse);
        return restTemplate.postForObject(reCaptchaApiUrl,form,ReCaptchaResponseDTO.class);
    }
}
