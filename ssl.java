///usr/bin/env jbang "$0" "$@" ; exit $?
//REPOS mavenCentral,ehi=http://jars.interlis.ch/
//DEPS ch.interlis:ili2pg:4.3.1 org.postgresql:postgresql:42.1.4.jre6 

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.io.PushbackReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.net.URL;

import ch.ehi.ili2db.base.Ili2db;
import ch.ehi.ili2db.base.Ili2dbException;
import ch.ehi.ili2db.gui.Config;
import ch.ehi.ili2pg.PgMain;

import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;  

public class ssl {

    public static void main(String... args) throws Ili2dbException, IOException {

        InputStream in = new URL("https://prozessor-oereb.ur.ch/oereb/getegrid/xml/?EN=2688427,1166114").openStream();
        Files.copy(in, Paths.get("./fubar.xml"), StandardCopyOption.REPLACE_EXISTING);

    }
}
