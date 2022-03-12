package ch.so.agi.oereb.cts;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;

import com.occamlab.te.Test;

public class App {
    private static String outputDirectory;
    private static String pathToMainCtl;

    public static void main(String[] args) {
        
        System.out.println("Hallo Welt.");
        System.out.println(pathToMainCtl);
        System.out.println(System.getProperty("mainCtl"));
        
        int argi = 0;
        for(;argi<args.length;argi++) {
            String arg = args[argi];

            if (arg.equals("--out")) {
                argi++;
                outputDirectory = args[argi];
            } else if (arg.equals("--ctl")) {
                argi++;
                pathToMainCtl = args[argi];
            } else if (arg.equals("--help")) {
                System.err.println();
                System.err.println("--out       The output directory.");
                System.err.println("--ctl       The main ctl file.");
                System.err.println();
                return;
            }
        }
        
        if (outputDirectory == null) {
//            System.err.println("Output directory is required.");
//            System.exit(2);
            System.setProperty("TE_BASE", System.getProperty("user.home"));
        } else {
            System.setProperty("TE_BASE", new File(outputDirectory).getAbsolutePath());            
        }
       
        // Momentan weiss ich es nicht besser. Ziel ist immer noch die Testsuite 
        // mitzuliefern.
        if (pathToMainCtl == null) {
            String classpath = System.getProperty("java.class.path");
            String[] classpathEntries = classpath.split(File.pathSeparator);
            for (String entry : classpathEntries) {
                if (entry.endsWith("resources")) {
                    pathToMainCtl = Paths.get(new File(entry).getParentFile().getParentFile().getAbsolutePath(), "te_base", "scripts", "oereb", "2.0", "ctl", "main.ctl").toFile().getAbsolutePath(); 
                    break;
                }
            }            
        }
        
        
        
        System.out.println(pathToMainCtl);

        // Siehe SetupOptions.java

        try {
            String[] testArgs = {"-source="+pathToMainCtl};
            Test test = new Test();
            test.execute(testArgs);
            
            System.exit(0);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            System.exit(3);
        }
    }
}
