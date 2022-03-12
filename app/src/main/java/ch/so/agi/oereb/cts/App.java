package ch.so.agi.oereb.cts;

public class App {

    public static void main(String[] args) throws Exception {
        
        System.out.println("Hallo Welt.");
        
        
        // TODO:
        // -source -> oereb ctl
        // - falls kein output, user.home verwenden.
        
        
        System.setProperty("TE_BASE", "/Users/stefan/tmp/");

        Test test = new Test();
        test.execute(args);
    }

}
