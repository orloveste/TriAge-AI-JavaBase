package container;

public abstract class AbstractContainer {

    public AbstractContainer(AbstractPatient[] currentPatients) {
        this.currentPatients = currentPatients;
    }

    protected AbstractPatient[] currentPatients;

    public abstract void takeInPatient(AbstractPatient newPatient);

    public abstract void releasePatient(AbstractPatient newPatient);

    public abstract void listPatients();

    public AbstractPatient[] getCurrentPatients(){
        return currentPatients;
    }
}
