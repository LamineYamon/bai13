<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔧 Test Database Connection</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css"/>
</head>
<body>
    <div class="container fade-in">
        <h1>🔧 Kiểm tra kết nối cơ sở dữ liệu</h1>
        
        <%
        try {
            // Test database connection and EntityManagerFactory
            murach.data.DBUtil util = new murach.data.DBUtil();
            javax.persistence.EntityManagerFactory emf = murach.data.DBUtil.getEmFactory();
            
            if (emf != null && emf.isOpen()) {
                out.println("<div class='success-message'>");
                out.println("<strong>✅ Thành công!</strong> Kết nối cơ sở dữ liệu hoạt động bình thường.");
                out.println("</div>");
                
                // Test entity manager
                javax.persistence.EntityManager em = emf.createEntityManager();
                if (em != null) {
                    out.println("<div class='info-card'>");
                    out.println("<p>📊 EntityManager: OK</p>");
                    out.println("<p>🔗 EntityManagerFactory: OK</p>");
                    out.println("<p>📦 JPA Provider: EclipseLink</p>");
                    out.println("</div>");
                    em.close();
                }
            } else {
                out.println("<div class='message'>");
                out.println("<strong>❌ Lỗi!</strong> Không thể kết nối đến cơ sở dữ liệu.");
                out.println("</div>");
            }
        } catch (Exception e) {
            out.println("<div class='message'>");
            out.println("<strong>❌ Exception:</strong> " + e.getMessage());
            out.println("<br><strong>Nguyên nhân:</strong> " + (e.getCause() != null ? e.getCause().getMessage() : "Không xác định"));
            out.println("</div>");
        }
        %>
        
        <div style="margin-top: 30px; text-align: center;">
            <a href="index.jsp" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                                      color: white; padding: 15px 30px; text-decoration: none; 
                                      border-radius: 12px; font-weight: bold; 
                                      box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
                                      display: inline-block;">
                🏠 Về trang chính
            </a>
        </div>
        
        <div style="margin-top: 20px; padding: 15px; background: #f8f9fa; border-radius: 8px; font-family: monospace; font-size: 0.9rem;">
            <h3>📝 Thông tin hệ thống:</h3>
            <p><strong>Server:</strong> <%= request.getServerName() + ":" + request.getServerPort() %></p>
            <p><strong>Context Path:</strong> <%= request.getContextPath() %></p>
            <p><strong>Character Encoding:</strong> <%= request.getCharacterEncoding() %></p>
            <p><strong>Content Type:</strong> <%= response.getContentType() %></p>
        </div>
    </div>
</body>
</html>