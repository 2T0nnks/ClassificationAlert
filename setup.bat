@echo off
setlocal

REM Function to check if a command exists
:command_exists
where %1 >nul 2>&1
exit /b %ERRORLEVEL%

REM 1. Check if Python 3.12 is installed
call :command_exists python
if %ERRORLEVEL% == 0 (
    for /f "tokens=2 delims==" %%i in ('python --version 2>&1') do (
        set python_version=%%i
    )
    echo Python is already installed: %python_version%
) else (
    echo Python not found. Installing Python 3.12...
    REM Install Python 3.12 (download the installer from the official site)
    powershell -Command "Start-Process 'https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe' -Wait"
    REM Add Python to PATH
    setx PATH "%PATH%;C:\Python312;C:\Python312\Scripts"
)

REM 2. Check if Docker Desktop is installed
call :command_exists docker
if %ERRORLEVEL% == 0 (
    echo Docker Desktop is already installed.
) else (
    echo Docker Desktop not found. Installing...
    REM Download and install Docker Desktop
    powershell -Command "Start-Process 'https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe' -Wait"
)

REM 3. Check if docker-compose is available
call :command_exists docker-compose
if %ERRORLEVEL% == 0 (
    echo docker-compose is already available.
) else (
    echo docker-compose not found. Make sure Docker Desktop was installed correctly.
)

REM 4. Install Python dependencies (pip install -r requirements.txt)
if exist "requirements.txt" (
    echo Installing Python dependencies...
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt
) else (
    echo requirements.txt not found. Make sure the file is in the correct directory.
    exit /b 1
)

REM 5. Start Docker with docker-compose up -d
echo Starting containers with docker-compose up -d...
docker-compose up -d

REM 6. Run the app with python app.py
if exist "app.py" (
    echo Running python app.py...
    python app.py
) else (
    echo app.py not found. Make sure the file is in the correct directory.
    exit /b 1
)

endlocal
