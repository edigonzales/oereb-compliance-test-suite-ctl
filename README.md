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