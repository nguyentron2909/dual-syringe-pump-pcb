@echo off
title Git Auto-Commit Script
echo ========================================
echo   Git Add, Commit, Pull, and Push
echo ========================================
echo.

:: Show the files that have been changed
echo Changes to be committed:
git status -s
echo.

:: Grab the current system date
set current_date=%DATE%

:: Prompt the user for a commit message
set /p commit_msg="Enter your commit message (or press Enter for 'update - %current_date%'): "

:: If the user just presses Enter, use the default message with the date
if "%commit_msg%"=="" set commit_msg=update - %current_date%

:: Execute the Git commands
echo.
echo 1. Adding files...
git add .

echo.
echo 2. Committing locally...
git commit -m "%commit_msg%"

echo.
echo 3. Pulling remote changes (Rebasing to avoid Vim)...
git pull --rebase

echo.
echo 4. Pushing to GitHub...
git push

echo.
echo ========================================
echo   Process Complete!
echo ========================================
pause