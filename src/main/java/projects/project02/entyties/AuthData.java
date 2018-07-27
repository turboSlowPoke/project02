package projects.project02.entyties;

public class AuthData {
    private String name;
    private String email;
    private String phone;
    private String recapcha;

    @Override
    public String toString() {
        return "AuthData{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", recapcha='" + recapcha + '\'' +
                '}';
    }

    public String getRecapcha() {
        return recapcha;
    }

    public void setRecapcha(String recapcha) {
        this.recapcha = recapcha;
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
