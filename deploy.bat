@echo off
REM Build và Deploy script cho Email List Application

echo 🚀 Building Email List JPA Application...

REM Step 1: Build WAR file
echo 📦 Building WAR file...
ant clean war

REM Step 2: Test thông báo
echo 🧪 Testing application...
echo Please test at: http://localhost:8080/ch13_ex1_email/
echo Press any key when ready to continue...
pause

REM Step 3: Git commands
echo 📤 Ready to push to GitHub!
echo Run these commands:
echo.
echo git init
echo git add .
echo git commit -m "Email List JPA - Ready for Render deployment"
echo git remote add origin https://github.com/LamineYamon/bai13.git
echo git branch -M main
echo git push -u origin main
echo.
echo Then go to render.com to deploy! 🎉
pause