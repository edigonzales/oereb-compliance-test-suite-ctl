package ch.so.agi.oereb.cts;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;

import com.occamlab.te.RuntimeOptions;
import com.occamlab.te.SetupOptions;
import com.occamlab.te.Test;
import com.occamlab.te.util.LogUtils;

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
        
        // Das Property wird in SetupOptions ausgelesen. Aus diesem leitet
        // sich alles ab. Im teamengine Shellskript (+/- public API) wird
        // mit ENV-Variablen gearbeitet. SetupOptions behandelt sowohl
        // Property wie auch Env gleichwertig und versucht beide auszulesen.
        if (outputDirectory == null) {
            System.setProperty("TE_BASE", System.getProperty("user.home"));
            outputDirectory = System.getProperty("TE_BASE");
        } else {
            System.setProperty("TE_BASE", new File(outputDirectory).getAbsolutePath());            
        }
       
        // Momentan weiss ich es nicht besser. Ziel ist immer noch die Testsuite 
        // mitzuliefern.
        // Die CTL-Skripte muessen auf dem Filesystem vorhanden sein. Entpacken aus 
        // einer Jar-Datei ist muehsam, da es beliebig viele sein koennen. Beim 
        // Erstellen der Distribution werden die Dateien in ein bestimmtes Verzeichnis
        // kopiert, welches relativ zum "lib"-Verzeichnis in der entpackten Zip-Datei
        // liegt. Der Classpath duerfte in unserem Fall auch als korrekter Ankerpunkt
        // verwendet werden.
        if (pathToMainCtl == null) {
            String classpath = System.getProperty("java.class.path");
            String[] classpathEntries = classpath.split(File.pathSeparator);
            for (String entry : classpathEntries) {
                if (entry.endsWith("resources")) {
                    pathToMainCtl = Paths.get(new File(entry).getParentFile().getParentFile().getAbsolutePath(), "te_base", "scripts", "oereb", "2_0", "ctl", "main.ctl").toFile().getAbsolutePath(); 
                    break;
                }
            }            
        }
        
        
        
        System.out.println(pathToMainCtl);

        // Siehe SetupOptions.java

        try {
            SetupOptions setupOpts = new SetupOptions();
            RuntimeOptions runOpts = new RuntimeOptions();
            
            System.out.println("outputDirectory   " + outputDirectory);
            
            // Hier leitet sich saemtliche Logik ab:
            
//            File baseDir = SetupOptions.getBaseConfigDirectory();
//            File usersDir = new File(baseDir, "users");
//            File userDir = new File(usersDir, System.getProperty("user.name"));

            
            
            String[] testArgs = {"-source="+pathToMainCtl};
            ch.so.agi.oereb.cts.Test test = new ch.so.agi.oereb.cts.Test();
            test.execute(testArgs);
            // private: test.setRuntimeOptions(runOpts);
            
            
            // Man muss vorgaengig das xml (oder html) report log file loeschen, sonst
            // wird nicht transformiert.
            // xsl file kann man als Parameter uebergeben.
            
            
            testArgs[0] = "-mode=pplogs";
            //testArgs[1] = "-mode=pplogs";
            
            test.execute(testArgs);
            
//            
//            session = LogUtils.generateSessionId(logDir);
//            session = LogUtils.generateSessionId(logDir);
//            session = LogUtils.generateSessionId(logDir);
//            session = LogUtils.generateSessionId(logDir);
            
            
            
            
            System.exit(0);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            System.exit(3);
        }
    }
}
