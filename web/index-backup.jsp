<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Email List - Test Giao Diện</title>
    <style>
        /* CSS trực tiếp để đảm bảo giao diện luôn đẹp */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeIn 0.8s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            font-size: 2.5rem;
            color: #4a5568;
            margin-bottom: 10px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            font-size: 1.1rem;
            color: #718096;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .form-container {
            margin-top: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a5568;
            font-size: 0.95rem;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="submit"] {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            font-family: inherit;
        }

        input[type="text"]:focus, 
        input[type="email"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }

        input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }

        input[type="submit"]:active {
            transform: translateY(-1px);
        }

        .message {
            background: #fed7d7;
            color: #c53030;
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 25px;
            border-left: 4px solid #c53030;
            font-weight: 500;
        }

        .note {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #718096;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .container {
                padding: 25px;
                margin: 10px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            input[type="text"], 
            input[type="email"], 
            input[type="submit"] {
                padding: 12px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
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
                    <label for="firstName">👤 Họ và tên đệm:</label>
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
        
        <div class="note">
            <p> <strong>Lưu ý:</strong> Thông tin của bạn được bảo mật và không chia sẻ với bên thứ ba.</p>
        </div>
        
        <div style="margin-top: 20px; text-align: center;">
            <a href="debug.jsp" style="color: #667eea; text-decoration: none; font-size: 0.9rem;">
                🔧 Debug CSS
            </a>
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