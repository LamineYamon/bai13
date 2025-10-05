# Dùng image Tomcat chính thức với JDK 17
FROM tomcat:9.0-jdk17

# Tác giả
LABEL maintainer="student@example.com"
LABEL description="Email List Application with JPA - Exercise 13-1"

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file đã build sẵn (build trước khi tạo Docker image)
COPY dist/ch13_ex1_email.war /usr/local/tomcat/webapps/ROOT.war

# Set quyền cho các file
RUN chmod -R 755 /usr/local/tomcat/webapps/ROOT/

# Cổng Tomcat mặc định (Render sẽ map tự động)
EXPOSE 8080

# Tùy chọn: Set JVM options cho production
ENV JAVA_OPTS="-Xmx512m -Xms256m -server"

# Tomcat sẽ tự động khởi động khi container chạy
CMD ["catalina.sh", "run"]