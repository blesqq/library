#!/bin/sh
# ----------------------------------------------------------------------------
# Maven Wrapper startup script for Unix
# ----------------------------------------------------------------------------

BASEDIR=$(dirname "$0")
MAVEN_PROJECTBASEDIR=$(cd "$BASEDIR" && pwd)
WRAPPER_DIR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper"
WRAPPER_JAR="$WRAPPER_DIR/maven-wrapper.jar"
WRAPPER_PROPERTIES="$WRAPPER_DIR/maven-wrapper.properties"

if [ ! -f "$WRAPPER_PROPERTIES" ]; then
  echo "Maven Wrapper properties file not found: $WRAPPER_PROPERTIES" >&2
  exit 1
fi

WRAPPER_URL=$(grep '^wrapperUrl=' "$WRAPPER_PROPERTIES" | cut -d= -f2-)
if [ -z "$WRAPPER_URL" ]; then
  WRAPPER_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.3.2/maven-wrapper-3.3.2.jar"
fi

if [ -n "$JAVA_HOME" ]; then
  JAVA_EXE="$JAVA_HOME/bin/java"
else
  JAVA_EXE="java"
fi

if ! "$JAVA_EXE" -version >/dev/null 2>&1; then
  echo "Java is required to run Maven Wrapper. Install JDK 25 and add it to PATH, or set JAVA_HOME." >&2
  exit 1
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Downloading Maven Wrapper from $WRAPPER_URL" >&2
  mkdir -p "$WRAPPER_DIR"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR"
  else
    echo "curl or wget is required to download Maven Wrapper. Install Maven manually or add maven-wrapper.jar." >&2
    exit 1
  fi
fi

exec "$JAVA_EXE" $MAVEN_OPTS $MAVEN_DEBUG_OPTS \
  -classpath "$WRAPPER_JAR" \
  "-Dmaven.multiModuleProjectDirectory=$MAVEN_PROJECTBASEDIR" \
  org.apache.maven.wrapper.MavenWrapperMain "$@"
