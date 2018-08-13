package projects.project02.web_controllers;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import static java.time.temporal.ChronoUnit.DAYS;

public class TestTime {
    public static void main(String[] a){
        LocalDateTime fromDateTime = LocalDateTime.now();
        LocalDateTime toDateTime = LocalDateTime.of(2018, 10, 14, 12, 30);

        LocalDateTime tempDateTime = LocalDateTime.from( fromDateTime );

//        long years = tempDateTime.until( toDateTime, ChronoUnit.YEARS);
//        tempDateTime = tempDateTime.plusYears( years );
//
//        long months = tempDateTime.until( toDateTime, ChronoUnit.MONTHS);
//        tempDateTime = tempDateTime.plusMonths( months );

        long days = tempDateTime.until( toDateTime, ChronoUnit.DAYS);
        tempDateTime = tempDateTime.plusDays( days );


        long hours = tempDateTime.until( toDateTime, ChronoUnit.HOURS);
        tempDateTime = tempDateTime.plusHours( hours );

        long minutes = tempDateTime.until( toDateTime, ChronoUnit.MINUTES);
        tempDateTime = tempDateTime.plusMinutes( minutes );

        long seconds = tempDateTime.until( toDateTime, ChronoUnit.SECONDS);

        System.out.println(
                days + " days " +
                hours + " hours " +
                minutes + " minutes " +
                seconds + " seconds.");
    }
}
