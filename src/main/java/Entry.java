import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Entry /*extends Abstract_Entry_Container*/{
    /*public Entry(int idAccept_DGPR, boolean accept_DGPR) {
        super(idAccept_DGPR, accept_DGPR);
        System.out.println("Potential patient 'accepted(true)/not(false)' " +
                "sharing of information by DGPR: "
                + accept_DGPR + " - In first step (begin all information are" +
                " confidential/just statistic.");
    }*/

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer idAccept_DGPR;
    Boolean accept_DGPR;

    @Override
    public String toString() {
        return "Entry{" +
                "idAccept_DGPR=" + idAccept_DGPR +
                ", accept_DGPR=" + accept_DGPR +
                '}';
    }
}
