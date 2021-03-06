package projects.project02.validators;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class AuthDataValidator {
    @Value("^[A-Za-zа-яА-ЯёЁ]{4,50}\\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}\\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}$")
    private String nameRegex;
    @Value("[9][0-9]{9}$")
    private String phoneRegex;
    @Value("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
    private String emailRegex;
    @Value("^[0-9]{6}$")
    private String smsCodeRegex;

    public boolean smsCodeIsInValid(String code){
        boolean check=true;
        if (code!=null
                &&!code.isEmpty()
                &&code.matches(smsCodeRegex)){
            check=false;
        }
        return check;
    }

    public boolean nameIsInvalid(String name) {
        boolean check= true;
        if (name!=null
                &&!name.isEmpty()
                &&name.matches(nameRegex)) {
            check = false;
        }
        return check;
    }

    public boolean phoneIsInvalid(String phone) {
        boolean check= true;
        if (phone!=null
                &&!phone.isEmpty()
                &&phone.matches(phoneRegex)) {
            check = false;
        }
        return check;
    }

    public boolean emailIsInvalid(String email) {
        boolean check= true;
        if (email!=null
                &&!email.isEmpty()
                &&email.matches(emailRegex)) {
            check = false;
        }
        return check;
    }
}
