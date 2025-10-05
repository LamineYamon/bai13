#!/bin/bash
# Build và Deploy script cho Email List Application

echo "🚀 Building Email List JPA Application..."

# Step 1: Build WAR file
echo "📦 Building WAR file..."
ant clean war

# Step 2: Test local trước khi push
echo "🧪 Testing application..."
echo "Please test at: http://localhost:8080/ch13_ex1_email/"
echo "Press Enter when ready to continue with Docker build..."
read

# Step 3: Build Docker image (optional - for local test)
echo "🐳 Building Docker image..."
docker build -t email-list-jpa .

# Step 4: Git commands
echo "📤 Preparing Git..."
echo "Run these commands to push to GitHub:"
echo ""
echo "git init"
echo "git add ."
echo 'git commit -m "Email List JPA - Ready for Render deployment"'
echo "git remote add origin https://github.com/LamineYamon/bai13.git"
echo "git branch -M main"  
echo "git push -u origin main"
echo ""
echo "Then go to render.com to deploy! 🎉"