@echo off
echo ================================================
echo    Barotem Auto Pull-up - Setup
echo ================================================
echo.

:: Check Python
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [1/4] Python not found. Installing Python...
    curl -o python_installer.exe https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    del python_installer.exe
    echo Python installed!
    echo.
) else (
    echo [1/4] Python already installed. Skipping...
    echo.
)

echo [2/4] Installing packages...
pip install playwright websockets
echo.

echo [3/4] Installing Chromium browser...
playwright install chromium
echo.

echo [4/4] Setup complete!
echo.
echo ================================================
echo  Please run Barotem_AutoPullup.exe now!
echo ================================================
echo.
pause
