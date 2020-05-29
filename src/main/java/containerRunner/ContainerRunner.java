package containerRunner;

import container.AbstractContainer;
import container.AbstractPatient;
import container.ClinicContainer;
import container.PatientContainer;

public class ContainerRunner {
    public static void main(String[] args) {
        AbstractContainer container = new ClinicContainer(new PatientContainer[6]);

        AbstractPatient name1 = new PatientContainer("Pif one");
        AbstractPatient name2 = new PatientContainer("Puf Two");
        AbstractPatient name3 = new PatientContainer("Zorba Voinicul");
        AbstractPatient name4 = new PatientContainer("Nemaistiutul Viitor");


        container.takeInPatient(name1);
        container.takeInPatient(name2);
        container.takeInPatient(name3);
        container.takeInPatient(name4);

        container.listPatients();

        container.releasePatient(name2);
        System.out.println("- Puf Two");
        container.listPatients();

        AbstractPatient name5 = new PatientContainer("Bill Gates");
        System.out.println("+ Bill");
        container.takeInPatient(name5);
        System.out.println("list");
        container.listPatients();
        System.out.println("current");
        container.getCurrentPatients();

    }
}
