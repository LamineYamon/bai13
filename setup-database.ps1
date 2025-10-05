# PowerShell script để kiểm tra và tạo MySQL database
Write-Host "🔍 Kiểm tra MySQL database..." -ForegroundColor Yellow

# Thông tin kết nối
$mysqlPath = "mysql"
$host = "localhost"
$username = "root"
$password = "sesame"
$database = "murach_jpa"

try {
    # Kiểm tra MySQL service
    Write-Host "📊 Kiểm tra MySQL service..." -ForegroundColor Cyan
    
    # Tạo database nếu chưa tồn tại
    $createDbQuery = @"
CREATE DATABASE IF NOT EXISTS $database 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
"@
    
    Write-Host "🔨 Tạo database '$database' nếu chưa tồn tại..." -ForegroundColor Green
    
    # Chạy MySQL command
    $createDbQuery | & $mysqlPath -h $host -u $username -p$password
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Database '$database' đã sẵn sàng!" -ForegroundColor Green
        
        # Hiển thị thông tin database
        Write-Host "`n📋 Thông tin database:" -ForegroundColor Yellow
        Write-Host "  - Host: $host" -ForegroundColor White
        Write-Host "  - Database: $database" -ForegroundColor White  
        Write-Host "  - Username: $username" -ForegroundColor White
        Write-Host "  - Character Set: utf8mb4" -ForegroundColor White
        Write-Host "  - Collation: utf8mb4_unicode_ci" -ForegroundColor White
        
        Write-Host "`n🚀 Bây giờ bạn có thể:" -ForegroundColor Cyan
        Write-Host "  1. Khởi động Tomcat server" -ForegroundColor White
        Write-Host "  2. Truy cập: http://localhost:8080/ch13_ex1_email/" -ForegroundColor White
        Write-Host "  3. Kiểm tra test: http://localhost:8080/ch13_ex1_email/test.jsp" -ForegroundColor White
        
    } else {
        Write-Host "❌ Không thể tạo database. Vui lòng kiểm tra:" -ForegroundColor Red
        Write-Host "  - MySQL server đã được khởi động chưa?" -ForegroundColor White
        Write-Host "  - Username/password đúng chưa?" -ForegroundColor White
        Write-Host "  - MySQL có trong PATH chưa?" -ForegroundColor White
    }
    
} catch {
    Write-Host "❌ Lỗi: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "`n💡 Hướng dẫn khắc phục:" -ForegroundColor Yellow
    Write-Host "  1. Đảm bảo MySQL server đang chạy" -ForegroundColor White
    Write-Host "  2. Kiểm tra username/password trong persistence.xml" -ForegroundColor White
    Write-Host "  3. Thêm MySQL vào PATH environment variable" -ForegroundColor White
}