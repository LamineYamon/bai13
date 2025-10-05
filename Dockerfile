# Multi-stage build cho Render deployment
# Stage 1: Build application
FROM openjdk:17-jdk-slim AS builder

# Cài đặt Ant và wget
RUN apt-get update && apt-get install -y \
    ant \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source code
COPY src/ src/
COPY web/ web/
COPY build.xml .
COPY nbproject/ nbproject/

# Download servlet-api.jar cho build
RUN mkdir -p /tmp/tomcat-libs && \
    wget -O /tmp/tomcat-libs/servlet-api.jar \
    "https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar"

# Download H2 database JAR nếu chưa có
RUN if [ ! -f "web/WEB-INF/lib/h2-2.2.224.jar" ]; then \
        wget -O web/WEB-INF/lib/h2-2.2.224.jar \
        "https://repo1.maven.org/maven2/com/h2database/h2/2.2.224/h2-2.2.224.jar"; \
    fi

# Tạo build.properties cho Docker environment  
RUN echo "servlet.lib=/tmp/tomcat-libs/servlet-api.jar" > build.properties && \
    echo "deploy.dir=/tmp" >> build.properties

# Build application
RUN ant clean war

# Stage 2: Runtime với Tomcat
FROM tomcat:9.0-jdk17

# Tác giả
LABEL maintainer="student@example.com"
LABEL description="Email List Application with JPA - Exercise 13-1"

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file từ builder stage
COPY --from=builder /app/dist/ch13_ex1_email.war /usr/local/tomcat/webapps/ROOT.war

# Set quyền cho các file
RUN chmod -R 755 /usr/local/tomcat/webapps/ROOT/

# Cổng Tomcat mặc định (Render sẽ map tự động)
EXPOSE 8080

# Tùy chọn: Set JVM options cho production
ENV JAVA_OPTS="-Xmx512m -Xms256m -server"

# Tomcat sẽ tự động khởi động khi container chạy
CMD ["catalina.sh", "run"]