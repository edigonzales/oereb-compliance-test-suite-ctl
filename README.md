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

## Examples

- https://github.com/opengeospatial/ets-wms13/blob/master/src/main/scripts/ctl/main.xml