@echo off
title Smart Learning Portal - Full Project Launcher
color 0A
echo ========================================================
echo   Smart Student Learning Portal - Project Launcher
echo ========================================================
echo.

set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.12.101-hotspot"
set "PATH=%JAVA_HOME%\bin;C:\Program Files\apache-maven-3.9.16\bin;%PATH%"

REM --- Check if backend is already running ---
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:8080/actuator/health' -TimeoutSec 2 -UseBasicParsing -ErrorAction Stop; if ($r.StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }" >nul 2>&1
if %errorlevel%==0 (
    echo [INFO] Backend server is already running on port 8080!
    echo [INFO] Opening frontend in browser...
    start "" "http://127.0.0.1:5500/SmartLearningPortal/frontend/"
    echo.
    echo ========================================================
    echo   Project is ready! Backend was already running.
    echo   Frontend: http://127.0.0.1:5500/SmartLearningPortal/frontend/
    echo   Backend:  http://localhost:8080
    echo ========================================================
    pause
    exit /b 0
)

REM --- Start backend in a new minimized window ---
echo [INFO] Starting Backend Server...
cd /d "%~dp0backend"

if exist "target\backend-0.0.1-SNAPSHOT.jar" (
    start "SmartLearning-Backend" /min cmd /c "title Smart Learning Portal - Backend && color 0B && echo Backend server starting... && java -jar target\backend-0.0.1-SNAPSHOT.jar"
) else (
    start "SmartLearning-Backend" /min cmd /c "title Smart Learning Portal - Backend && color 0B && echo Backend server starting via Maven... && mvn spring-boot:run"
)

cd /d "%~dp0"

REM --- Wait for backend to be ready ---
echo [INFO] Waiting for backend to start...
set /a count=0
set /a maxRetries=60

:waitLoop
if %count% geq %maxRetries% (
    echo.
    echo [ERROR] Backend did not start within 60 seconds!
    echo [ERROR] Check the backend window for errors.
    pause
    exit /b 1
)

powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:8080/actuator/health' -TimeoutSec 2 -UseBasicParsing -ErrorAction Stop; if ($r.StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }" >nul 2>&1
if %errorlevel%==0 (
    echo.
    echo [SUCCESS] Backend is running on http://localhost:8080
    goto :backendReady
)

set /a count+=1
<nul set /p "=."
timeout /t 1 /nobreak >nul
goto :waitLoop

:backendReady
echo.
echo [INFO] Opening frontend in browser...
start "" "http://127.0.0.1:5500/SmartLearningPortal/frontend/"

echo.
echo ========================================================
echo   Project is READY!
echo   Frontend: http://127.0.0.1:5500/SmartLearningPortal/frontend/
echo   Backend:  http://localhost:8080
echo.
echo   NOTE: Keep the Backend window open while using the app.
echo         Close the Backend window to stop the server.
echo ========================================================
echo.
pause
