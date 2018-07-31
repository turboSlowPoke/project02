package projects.project02.dto.sms_api;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MessageSmsDTO {
    private String phone;
    private String sender;
    private Integer clientId;
    private String text;

    @Override
    public String toString() {
        return "SMSMessage{" +
                "phone='" + phone + '\'' +
                ", sender='" + sender + '\'' +
                ", clientId=" + clientId +
                ", text='" + text + '\'' +
                '}';
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
