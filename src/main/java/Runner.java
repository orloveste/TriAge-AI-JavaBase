import java.util.Random;
import java.util.Scanner;

public class Runner {
    public static void main(String[] args) {
        Hello();
        System.out.println("In/OutPut data:");
        ReadTemperature();
        HeightMeasurement();
        WeightMeasurement();
        ShoesDisinfection();

        /*Entry_Service entry_service = Entry_Service.getInstance();

        System.out.println("get id 10 = " + entry_service.getEntry(10)); //ok
        System.out.println("create new entry = ");
        entry_service.createEntry(true); //ToDo 1 = not transmitting  in Entry_Service data
        System.out.println("get new entry id 11" + entry_service.getEntry(11));

        HibernateUtil.shutdown();*/
    }

    private static void Hello() {
        System.out.print("\n" +
                "Hello, \nThe Triaj Medical Container is ready for you!\n " +
                "In order to benefit from the autonomous system, please express your agreement on the:\n processing, " +
                "use and transmission of data collected in accordance with GDPR.\n " +
                "Press \"Y\" or \"N\"\n>");
        Scanner reader = new Scanner(System.in);
        switch (reader.nextLine().toLowerCase()) {
            case "y" :
                System.out.println("Agreed GDPR \n" +
                        "Please stand with both feet on the marked support for the following activities:\n" +
                        "1. Reading body temperature;\n" +
                        "2. Height measurement;\n" +
                        "3. Weight measurement;\n" +
                        "4. Disinfection of shoes");
                break;
            case "n" :
                System.out.println("Not agreed GDPR - \n Please go to traditional Emergency Room for medical care.");
                break;
            default:
                System.out.println("Accepted choice: Y / N");
        }
    }

    private static void ShoesDisinfection() {

    }

    private static void WeightMeasurement() {
        int idWeight = 0;
        idWeight++;
        System.out.println("idWeight " + idWeight);

        Random r = new Random();

        int low = 30; //kg toDo check equipment specification
        int high = 250; //kg toDo check equipment specification

        int patientWeight = r.nextInt(high-low) + low;
        System.out.println("3. patientWeight: " + patientWeight + "kg");
    }

    private static void HeightMeasurement() {
    }

    private static void ReadTemperature() {
    }


}
