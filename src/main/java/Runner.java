public class Runner {
    public static void main(String[] args) {
        Entry_Service entry_service = Entry_Service.getInstance();



        System.out.println("get id 10 = " + entry_service.getEntry(10)); //ok
        System.out.println("create new entry = ");
        entry_service.createEntry(true); //ToDo 1 = not transmitting  in Entry_Service data
        System.out.println("get new entry id 11" + entry_service.getEntry(11));


        HibernateUtil.shutdown();
    }
}
