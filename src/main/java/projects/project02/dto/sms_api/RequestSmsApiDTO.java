package projects.project02.dto.sms_api;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Component
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RequestSmsApiDTO {
    private LocalDateTime scheduleTime;
    private List<MessageSmsDTO> messages;
    private String statusQueueName;
    private Boolean showBillingDetails;
    @Value("z1533044220273")
    private String login;
    @Value("508544")
    private String password;

    @Override
    public String toString() {
        return "SMSRequestDTO{" +
                "scheduleTime=" + scheduleTime +
                ", messages=" + messages.stream().map(message -> message.toString()).collect(Collectors.joining(",")) +
                ",login="+login+
                ",password="+password+
                '}';
    }



    public LocalDateTime getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(LocalDateTime scheduleTime) {
        this.scheduleTime = scheduleTime;
    }

    public List<MessageSmsDTO> getMessages() {
        return messages;
    }

    public void setMessages(List<MessageSmsDTO> messages) {
        this.messages = messages;
    }

    public String getStatusQueueName() {
        return statusQueueName;
    }

    public void setStatusQueueName(String statusQueueName) {
        this.statusQueueName = statusQueueName;
    }

    public Boolean getShowBillingDetails() {
        return showBillingDetails;
    }

    public void setShowBillingDetails(Boolean showBillingDetails) {
        this.showBillingDetails = showBillingDetails;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
