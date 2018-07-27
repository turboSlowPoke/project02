package projects.project02.dto;

public class AuthDataDTO {
    private String name;
    private String email;
    private String phone;
    private String recapchaResponse;

    @Override
    public String toString() {
        return "AuthData{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", recapchaResponse='" + recapchaResponse + '\'' +
                '}';
    }

    public String getRecapchaResponse() {
        return recapchaResponse;
    }

    public void setRecapchaResponse(String recapchaResponse) {
        this.recapchaResponse = recapchaResponse;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
