package pl.javastart.library.app;

class LibraryApp {
    private static final String APP_NAME = "Biblioteka v2.3";

    public static void main(String[] args) {
        System.out.println(APP_NAME);
        LibraryControl libControl = new LibraryControl();
        libControl.controlLoop();
    }
}
