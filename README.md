# oereb-compliance-test-suite

## Install teamengine

```
git clone https://github.com/opengeospatial/teamengine.git
```

Use Java 8.

```
cd teamengine
mvn install -Dmaven.test.failure.ignore=true
```

Konsolenanwendung installieren:

```
export te_install=~/apps/te_install
```

```
unzip teamengine-console/target/teamengine-console-5.5-SNAPSHOT-bin.zip -d $te_install
```

Beispiel-Test-Suite installieren:

```
export TE_BASE=~/tmp/TE_BASE
```

```
unzip teamengine-console/target/teamengine-console-5.5-SNAPSHOT-base.zip -d $TE_BASE
```

## Run sample test suite

```
$te_install/bin/unix/test.sh -source=$TE_BASE/scripts/note/1.0/ctl/note.ctl
```

```
$te_install/bin/unix/test.sh -source=$TE_BASE/scripts/oereb/2.0/ctl/main.ctl
```


Show log files:
```
$te_install/bin/unix/viewlog.sh -logdir=$TE_BASE/users/stefan/ -session=s0004
```

## Examples

- https://github.com/opengeospatial/ets-wms13/blob/master/src/main/scripts/ctl/main.xml


## Links

- HTML-Report (nur mit Webserver?): https://github.com/opengeospatial/teamengine/issues/331
- Schemavalidierung: https://github.com/opengeospatial/teamengine/issues/64
- https://whatsmychaincert.com/

## TODO

- Schemaprüfung ohne Java-Code?
  * url funktioniert mit getegrid (ohne geometrie)
  * file scheint bei relativen Pfaden das Verzeichnis als Root zu verwenden, wo man den Befehl startet (nicht so praktisch)
  * -> resource: Schema muss im Classpaths sein.
- HTML-Report
- Paketierung 
- Organisation Code in Repo (-> siehe die Github-Repos der ets-XXXX)
- Was genau ist all-in-one? Alles ausser teamengine runtime? Wie startet man das aber?