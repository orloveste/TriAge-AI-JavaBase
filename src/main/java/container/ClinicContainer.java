package container;

public class ClinicContainer extends AbstractContainer {
    public ClinicContainer(AbstractPatient[] currentPatients) {
        super(currentPatients);
    }

    @Override
    public void takeInPatient(AbstractPatient newPatient) {
        for (int i = 0; i < currentPatients.length ; i++) {
            if (currentPatients[i] ==null) {
                currentPatients[i] = newPatient;
                break;
            }
        }
    }

    @Override
    public void releasePatient(AbstractPatient existingPatient) {
        for (int i = 0; i < currentPatients.length; i++) {
            if (currentPatients[i] == existingPatient){
                currentPatients[i] = null;
            }
        }
    }

    @Override
    public void listPatients() {
        for (int i = 0; i < currentPatients.length; i++) {
            if (currentPatients[i] != null){
                System.out.println(i + " " + currentPatients[i]);
            }
        }
    }
}
