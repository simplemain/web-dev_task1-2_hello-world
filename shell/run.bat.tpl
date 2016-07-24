@echo off
set JAVA_PATH=${{java.path}}
set JETTY_HOME=${{JETTY_HOME}}
echo JETTY_HOME=%JETTY_HOME%

set PROJ_PATH=${{project.dir}}
set PROJ_NAME=${{project.name}}
set CLASS_DIR=%PROJ_PATH%/web/WEB-INF/classes
set JAR_PATH=${{jar.path}}
set LIB_DIR=%PROJ_PATH%/lib/
set LIB_DIR=%JETTY_HOME%/lib/
set CP=%CLASS_DIR%;%JETTY_HOME%/start.jar
set MAIN=${{main-class}}
set LOG_DIR=%PROJ_PATH%/logs

set OPT=-Dfile.encoding=UTF-8
set OPT=%OPT% -Xmx128m
set OPT=%OPT% -Djetty.home=%JETTY_HOME%
set OPT=%OPT% -Dlog.dir=%LOG_DIR%
set OPT=%OPT% -Djetty.port=${{server.port}}
set OPT=%OPT% -DSTOP.PORT=${{stop.port}}
set OPT=%OPT% -DSTOP.KEY=${{stop.key}}
set OPT=%OPT% -Dcontext.path=${{context.path}}
set OPT=%OPT% -Dproject.version=${{project.version}}
set OPT=%OPT% -Dproject.dir=${{project.dir}}

setLocal EnableDelayedExpansion
set CLASSPATH="%CLASS_DIR%;%JETTY_HOME%/start.jar
for /R %JETTY_HOME%/lib %%a in (*.jar) do (
  set CLASSPATH=!CLASSPATH!;%%a
)
set CLASSPATH=!CLASSPATH!"

set PROGRAM_ARG="dir=%PROJ_PATH%"

cd %PROJ_PATH%

@echo on
"%JAVA_PATH%" %OPT% -cp %CLASSPATH% -jar %JETTY_HOME%/start.jar --ini=jetty/start.ini
