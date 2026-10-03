@echo off
title Smart Student Learning Portal - Backend
color 0B
echo ========================================================
echo   Starting Smart Learning Portal - Backend Server
echo ========================================================
echo.
echo Server will run on: http://localhost:8080
echo Please DO NOT close this window while using the website.
echo.

set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.12.101-hotspot"
set "PATH=%JAVA_HOME%\bin;C:\Program Files\apache-maven-3.9.16\bin;%PATH%"

cd /d "%~dp0backend"

if exist "target\backend-0.0.1-SNAPSHOT.jar" (
    echo [INFO] Starting Spring Boot Server from executable JAR...
    java -jar target\backend-0.0.1-SNAPSHOT.jar
) else (
    echo [INFO] Running via Maven...
    mvn spring-boot:run
)

echo.
echo Server has stopped.
pause
