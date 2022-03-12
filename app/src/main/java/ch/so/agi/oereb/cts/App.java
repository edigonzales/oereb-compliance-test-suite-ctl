package ch.so.agi.oereb.cts;

import com.occamlab.te.Test;

public class App {

    public static void main(String[] args) throws Exception {
        
        System.out.println("Hallo Welt.");
        
        
        // TODO:
        // -source -> oereb ctl. Falls keine -source gesetzt wird, wird "../te_base/" verwendet. Das ist das Verzeichnis, wo die CTL drinstecken in der Distribution.
        // gradle run überschreibt das. Ebenso kann das der Benutzer
        // - falls kein output, user.home verwenden.
        
        // Siehe SetupOptions.java
        System.setProperty("TE_BASE", "/Users/stefan/tmp/");

        Test test = new Test();
        test.execute(args);
    }

}
