<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>✅ Đăng ký thành công - Email List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>✅</text></svg>">
</head>

<body>
    <div class="container fade-in">
        <h1>🎉 Cảm ơn bạn đã đăng ký!</h1>
        <p class="subtitle">Chúc mừng! Bạn đã được thêm vào danh sách email của chúng tôi thành công.</p>
        
        <div class="info-card">
            <h2 style="margin-bottom: 20px; text-align: center;">📋 Thông tin đăng ký</h2>
            
            <div class="info-row">
                <span class="info-label">📧 Email:</span>
                <span class="info-value">${user.email}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">👤 Họ và tên đệm:</span>
                <span class="info-value">${user.firstName}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">🏷️ Tên:</span>
                <span class="info-value">${user.lastName}</span>
            </div>
        </div>

        <div class="success-message">
            <strong>✅ Thành công!</strong> Bạn sẽ nhận được email xác nhận trong vài phút tới.
        </div>

        <div class="return-section">
            <p class="subtitle">Bạn muốn đăng ký thêm địa chỉ email khác?</p>
            
            <form action="" method="post" style="display: inline-block; margin-right: 15px;">
                <input type="hidden" name="action" value="join">
                <input type="submit" value="🔄 Đăng ký thêm" style="margin: 0;">
            </form>
            
            <button onclick="window.history.back()" 
                    style="background: #718096; color: white; border: none; padding: 15px 20px; 
                           border-radius: 12px; cursor: pointer; font-size: 1rem; font-weight: 600;">
                ⬅️ Quay lại
            </button>
        </div>
        
        <div style="margin-top: 30px; padding: 20px; background: #f0f9ff; border-radius: 12px; border-left: 4px solid #0284c7;">
            <h3 style="color: #0369a1; margin-bottom: 10px;">🎯 Tiếp theo sẽ như thế nào?</h3>
            <ul style="color: #075985; text-align: left; line-height: 1.6;">
                <li>📬 Bạn sẽ nhận email chào mừng trong 5-10 phút</li>
                <li>🎁 Các ưu đãi đặc biệt sẽ được gửi hàng tuần</li>
                <li>📰 Tin tức và cập nhật mới nhất từ chúng tôi</li>
                <li>🔒 Thông tin của bạn được bảo mật tuyệt đối</li>
            </ul>
        </div>
    </div>

    <script>
        // Add celebration animation
        document.addEventListener('DOMContentLoaded', function() {
            // Create confetti effect (simple version)
            function createConfetti() {
                const colors = ['#667eea', '#764ba2', '#f093fb', '#f5576c'];
                const confettiCount = 50;
                
                for (let i = 0; i < confettiCount; i++) {
                    const confetti = document.createElement('div');
                    confetti.style.position = 'absolute';
                    confetti.style.left = Math.random() * 100 + 'vw';
                    confetti.style.top = '-10px';
                    confetti.style.width = '10px';
                    confetti.style.height = '10px';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.borderRadius = '50%';
                    confetti.style.pointerEvents = 'none';
                    confetti.style.zIndex = '1000';
                    confetti.style.animation = `fall ${Math.random() * 2 + 1}s linear infinite`;
                    
                    document.body.appendChild(confetti);
                    
                    setTimeout(() => {
                        confetti.remove();
                    }, 3000);
                }
            }
            
            // Add CSS animation for falling effect
            const style = document.createElement('style');
            style.textContent = `
                @keyframes fall {
                    from { transform: translateY(-100vh) rotate(0deg); }
                    to { transform: translateY(100vh) rotate(360deg); }
                }
            `;
            document.head.appendChild(style);
            
            // Trigger confetti after a short delay
            setTimeout(createConfetti, 500);
        });
    </script>
</body>
</html>