# Dùng image Tomcat chính thức với JDK 17
FROM tomcat:9.0-jdk17

# Tác giả
LABEL maintainer="student@example.com"
LABEL description="Email List Application with JPA - Exercise 13-1"

# Cài đặt các package cần thiết
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục tạm để download H2
RUN mkdir -p /tmp/libs

# Download H2 database JAR (in-memory database cho cloud)
RUN wget -O /tmp/libs/h2-2.2.224.jar \
    "https://repo1.maven.org/maven2/com/h2database/h2/2.2.224/h2-2.2.224.jar"

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy toàn bộ web application
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Copy compiled classes
COPY build/WEB-INF/ /usr/local/tomcat/webapps/ROOT/WEB-INF/

# Copy H2 JAR vào thư viện
RUN cp /tmp/libs/h2-2.2.224.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# Set quyền cho các file
RUN chmod -R 755 /usr/local/tomcat/webapps/ROOT/

# Cổng Tomcat mặc định (Render sẽ map tự động)
EXPOSE 8080

# Tùy chọn: Set JVM options cho production
ENV JAVA_OPTS="-Xmx512m -Xms256m -server"

# Tomcat sẽ tự động khởi động khi container chạy
CMD ["catalina.sh", "run"]