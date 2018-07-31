package projects.project02.dto.sms_api;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;
import java.util.stream.Collectors;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ResponseSmsApiDTO {
    private String status;
    private List<String>balance;
    private List<StatusMessageSmsDTO> messages;

    @Override
    public String toString() {
        return "ResponseSmsApiDTO{" +
                "status='" + status + '\'' +
                ", messages=" + messages.stream().map(m -> m.toString()).collect(Collectors.joining(",")) +
                '}';
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<String> getBalance() {
        return balance;
    }

    public void setBalance(List<String> balance) {
        this.balance = balance;
    }

    public List<StatusMessageSmsDTO> getMessages() {
        return messages;
    }

    public void setMessages(List<StatusMessageSmsDTO> messages) {
        this.messages = messages;
    }
}
