public abstract class AbstractPatient {
// Schema SQL = Patient
    protected int idPatient;
    protected int idAccept_DGPR;

    public AbstractPatient(int idPatient, int idAccept_DGPR) {
        this.idPatient = idPatient;
        this.idAccept_DGPR = idAccept_DGPR;
    }

    public int getIdPatient() {
        return idPatient;
    }

    public int getIdAccept_DGPR() {
        return idAccept_DGPR;
    }

    public void setIdPatient(int idPatient) {
        this.idPatient = idPatient;
    }
}
