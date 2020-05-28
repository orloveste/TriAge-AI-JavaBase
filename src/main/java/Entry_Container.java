public abstract class Entry_Container {
    //Schema SQL  = Entry
    protected int idAccept_DGPR;
    protected boolean accept_DGPR;

    public Entry_Container(int idAccept_DGPR, boolean accept_DGPR) {
        this.idAccept_DGPR = idAccept_DGPR;
        this.accept_DGPR = accept_DGPR;
    }

    public int getIdAccept_DGPR() {
        return idAccept_DGPR;
    }

    public void setIdAccept_DGPR(int idAccept_DGPR) {
        this.idAccept_DGPR = idAccept_DGPR;
    }

    public boolean isAccept_DGPR() {
        return accept_DGPR;
    }
}
