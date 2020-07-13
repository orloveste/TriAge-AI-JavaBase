import java.util.Scanner;

public class Runner {
    public static void main(String[] args) {
        Hello();
        System.out.println("Test");

        Entry_Service entry_service = Entry_Service.getInstance();

        System.out.println("get id 10 = " + entry_service.getEntry(10)); //ok
        System.out.println("create new entry = ");
        entry_service.createEntry(true); //ToDo 1 = not transmitting  in Entry_Service data
        System.out.println("get new entry id 11" + entry_service.getEntry(11));

        HibernateUtil.shutdown();
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
}
