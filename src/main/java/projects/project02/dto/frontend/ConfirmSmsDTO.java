package projects.project02.dto.frontend;

public class ConfirmSmsDTO {
    private String code;

    @Override
    public String toString() {
        return "ConfirmSmsDTO{" +
                "code='" + code + '\'' +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
