import org.hibernate.Session;
import org.hibernate.Transaction;

public class Entry_Service {
    private static Entry_Service instance;
    private Entry_Service(){
    }
    public static Entry_Service getInstance(){
        if (instance == null) {
            instance = new Entry_Service();
        } return instance;
    }
    public Entry getEntry(Integer idAccept_DGPR) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.find(Entry.class, idAccept_DGPR);
        } catch (Exception exceptionService) {
            exceptionService.printStackTrace();
            return null;
        }
    }
    public void createEntry(boolean newEntry) {
        Transaction transaction = null;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction = session.beginTransaction();
            session.save(newEntry); // ToDo 1 = not take in new boolean in db from runner
            transaction.commit();
            session.close();
        } catch (Exception exceptionService) {
            if (transaction != null) {
                transaction.rollback();
            }
            exceptionService.printStackTrace();
        }
    }
}
