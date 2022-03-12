package ch.so.agi.oereb.cts;

public class App {

    public static void main(String[] args) throws Exception {
        
        System.out.println("Hallo Welt.");
        
        System.setProperty("TE_BASE", "/Users/stefan/tmp/");

        Test test = new Test();
        test.execute(args);
    }

}
