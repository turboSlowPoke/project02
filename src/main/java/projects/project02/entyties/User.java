package projects.project02.entyties;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
public class User implements Serializable {
    @Id @GeneratedValue
    private Integer id;
    @Size(min = 4, max = 50)
    private String name;
    @Email
    private String email;
    @Size(min = 10,max = 20)
    private String phone;
    private LocalDateTime registrationDate;
}
