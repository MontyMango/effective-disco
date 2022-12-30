import java.time.*;

public class TimeZone {
    public static void main(String[] args) {
        brackets();
        System.out.println("Current Total Time: " + java.time.Instant.now());
        System.out.println("Current Year: " + java.time.Year.now()); 
        System.out.println("Current day of the week of 7 (1 - 7): " + java.time.DayOfWeek.of(7));
        brackets();
    }

    private static void brackets() {
        for(int i = 0; i < 16; i++) {
            System.out.print("-");
        }
        System.out.println();
    }
}
