package projects.project02.services;

import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class GenratorCodeForSms {
   public Integer getCodeFoSms(){
       Random random = new Random();
       return random.ints(100000,999999).findFirst().getAsInt();
   }
}
