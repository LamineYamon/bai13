<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Email List - Đăng ký nhận tin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📧</text></svg>">
    <style>
        /* Fallback CSS nếu main.css không load */
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
        h1 { color: #4a5568; text-align: center; margin-bottom: 20px; }
        .subtitle { color: #718096; text-align: center; margin-bottom: 30px; }
        .form-group { margin-bottom: 25px; }
        label { display: block; margin-bottom: 8px; font-weight: 600; color: #4a5568; }
        input[type="text"], input[type="email"] { 
            width: 100%; padding: 15px; border: 2px solid #e2e8f0; 
            border-radius: 12px; font-size: 1rem; box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%; padding: 15px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white; border: none; border-radius: 12px; font-weight: 600; cursor: pointer;
        }
        .message { background: #fed7d7; color: #c53030; padding: 15px; border-radius: 12px; margin-bottom: 25px; }
    </style>
</head>
<body>
    <div class="container fade-in">
        <h1> Tham gia danh sách email</h1>
        <p class="subtitle">Đăng ký để nhận những tin tức và ưu đãi mới nhất từ chúng tôi!</p>
        
        <% if (request.getAttribute("message") != null && !request.getAttribute("message").toString().isEmpty()) { %>
            <div class="message">
                <strong> Thông báo:</strong> ${message}
            </div>
        <% } %>
        
        <div class="form-container">
            <form action="emailList" method="post">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group">
                    <label for="email"> Địa chỉ Email:</label>
                    <input type="email" 
                           id="email" 
                           name="email" 
                           value="${user.email}" 
                           placeholder="Nhập email của bạn (vd: user@example.com)"
                           required>
                </div>
                
                <div class="form-group">
                    <label for="firstName"> Họ và tên đệm:</label>
                    <input type="text" 
                           id="firstName" 
                           name="firstName" 
                           value="${user.firstName}" 
                           placeholder="Nhập họ và tên đệm"
                           required>
                </div>
                
                <div class="form-group">
                    <label for="lastName"> Tên:</label>
                    <input type="text" 
                           id="lastName" 
                           name="lastName" 
                           value="${user.lastName}" 
                           placeholder="Nhập tên của bạn"
                           required>
                </div>
                
                <input type="submit" value=" Đăng ký ngay">
            </form>
        </div>
        
        <div style="margin-top: 30px; font-size: 0.9rem; color: #718096;">
            <p> <strong>Lưu ý:</strong> Thông tin của bạn được bảo mật.</p>
        </div>
    </div>

    <script>
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input[type="text"], input[type="email"]');
            
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
            
            // Auto-focus first input
            if (inputs.length > 0) {
                inputs[0].focus();
            }
        });
    </script>
</body>
</html>