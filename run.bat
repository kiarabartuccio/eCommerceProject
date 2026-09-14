@echo off
where php >nul 2>nul
if errorlevel 1 (
    echo PHP 8.1 or newer is required.
    pause
    exit /b 1
)
where composer >nul 2>nul
if errorlevel 1 (
    echo Composer is required.
    pause
    exit /b 1
)
cd /d "%~dp0PetConnect"
if not exist vendor composer install
if not exist .env (
    copy .env.example .env >nul
    echo Created PetConnect\.env.
    echo Add your local MySQL settings and a SEED_TOKEN, then run this file again.
    pause
    exit /b 1
)
start "" http://localhost:8000
php -S localhost:8000 index.php
