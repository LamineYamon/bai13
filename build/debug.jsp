<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔧 Debug CSS Path</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f5f5f5;
        }
        .debug-box {
            background: white;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .status { padding: 10px; margin: 10px 0; border-radius: 4px; }
        .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .info { background: #d1ecf1; color: #0c5460; border: 1px solid #bee5eb; }
    </style>
</head>
<body>
    <h1>🔧 Debug CSS Path & Resources</h1>
    
    <div class="debug-box">
        <h2>📋 Thông tin Context</h2>
        <p><strong>Context Path:</strong> <%= request.getContextPath() %></p>
        <p><strong>Request URI:</strong> <%= request.getRequestURI() %></p>
        <p><strong>Server Name:</strong> <%= request.getServerName() %>:<%= request.getServerPort() %></p>
        <p><strong>Real Path:</strong> <%= application.getRealPath("/") %></p>
    </div>
    
    <div class="debug-box">
        <h2>🔗 CSS Links</h2>
        <p><strong>Relative Path:</strong> <code>styles/main.css</code></p>
        <p><strong>Context Path:</strong> <code>${pageContext.request.contextPath}/styles/main.css</code></p>
        <p><strong>Full URL:</strong> <code>http://localhost:8080${pageContext.request.contextPath}/styles/main.css</code></p>
    </div>
    
    <div class="debug-box">
        <h2>🧪 Test CSS Loading</h2>
        <p>Click để test CSS links:</p>
        <ul>
            <li><a href="styles/main.css" target="_blank">Test Relative Path</a></li>
            <li><a href="${pageContext.request.contextPath}/styles/main.css" target="_blank">Test Context Path</a></li>
            <li><a href="/ch13_ex1_email/styles/main.css" target="_blank">Test Absolute Path</a></li>
        </ul>
    </div>
    
    <div class="debug-box">
        <h2>🎨 Test CSS với Inline Style</h2>
        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                    color: white; padding: 20px; border-radius: 12px; text-align: center;">
            <h3>Gradient Test</h3>
            <p>Nếu bạn thấy gradient xanh tím này, nghĩa là CSS inline hoạt động!</p>
        </div>
    </div>
    
    <div class="debug-box">
        <h2>📂 File System Check</h2>
        <%
        String cssPath = application.getRealPath("/styles/main.css");
        java.io.File cssFile = new java.io.File(cssPath);
        %>
        <p><strong>CSS File Path:</strong> <%= cssPath %></p>
        <div class="status <%= cssFile.exists() ? "success" : "error" %>">
            <%= cssFile.exists() ? "✅ CSS file tồn tại!" : "❌ CSS file KHÔNG tồn tại!" %>
        </div>
        <% if (cssFile.exists()) { %>
        <p><strong>File Size:</strong> <%= cssFile.length() %> bytes</p>
        <p><strong>Last Modified:</strong> <%= new java.util.Date(cssFile.lastModified()) %></p>
        <% } %>
    </div>
    
    <div style="text-align: center; margin-top: 30px;">
        <a href="index.jsp" style="background: #007bff; color: white; padding: 10px 20px; 
                                 text-decoration: none; border-radius: 5px;">
            🏠 Về trang chính
        </a>
    </div>
    
    <script>
        console.log("Context Path: ${pageContext.request.contextPath}");
        console.log("CSS URL should be: " + window.location.origin + "${pageContext.request.contextPath}/styles/main.css");
        
        // Test CSS loading
        fetch("${pageContext.request.contextPath}/styles/main.css")
            .then(response => {
                if (response.ok) {
                    console.log("✅ CSS loaded successfully!");
                    document.body.insertAdjacentHTML('beforeend', 
                        '<div class="status success">✅ CSS fetch test: SUCCESS</div>');
                } else {
                    console.error("❌ CSS failed to load:", response.status);
                    document.body.insertAdjacentHTML('beforeend', 
                        '<div class="status error">❌ CSS fetch test: FAILED (' + response.status + ')</div>');
                }
            })
            .catch(error => {
                console.error("❌ CSS fetch error:", error);
                document.body.insertAdjacentHTML('beforeend', 
                    '<div class="status error">❌ CSS fetch error: ' + error.message + '</div>');
            });
    </script>
</body>
</html>