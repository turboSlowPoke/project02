package projects.project02.dto.sms_api;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class StatusMessageSmsDTO {
    private String status;
    private String smscId;
    private String clientId;

    @Override
    public String toString() {
        return "StatusMessageSmsDTO{" +
                "status='" + status + '\'' +
                ", smscId='" + smscId + '\'' +
                ", clientId='" + clientId + '\'' +
                '}';
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSmscId() {
        return smscId;
    }

    public void setSmscId(String smscId) {
        this.smscId = smscId;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
}
