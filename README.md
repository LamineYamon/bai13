# 📧 Email List Application - Exercise 13-1

## Mô tả
Ứng dụng Email List sử dụng JPA (Java Persistence API) để quản lý danh sách email trong cơ sở dữ liệu MySQL với giao diện hiện đại và đẹp mắt.

## Các bước đã hoàn thành

### 1. Cấu hình persistence.xml ✅
- Kết nối đến database `murach_jpa` 
- Sử dụng user `root` với password `sesame`
- Tự động tạo bảng nếu chưa tồn tại

### 2. Entity User ✅
- Annotation `@Entity` để đánh dấu là JPA entity
- Annotation `@Id` và `@GeneratedValue` trên getter method (theo yêu cầu bài 7)
- Các field: userId, email, firstName, lastName

### 3. JPA Data Access Classes ✅
- **DBUtil**: Quản lý EntityManagerFactory
- **UserDB**: Các thao tác CRUD với database (insert, update, delete, select)

### 4. Web Components với Giao Diện Hiện Đại ✅
- **EmailListServlet**: Xử lý HTTP requests với UTF-8 encoding
- **index.jsp**: Form đăng ký email với giao diện đẹp
- **thanks.jsp**: Trang cảm ơn với animation và confetti effect

### 5. Giao Diện Hiện Đại ✅
- **Gradient Background**: Màu xanh tím gradient đẹp mắt
- **Glass-morphism Effect**: Hiệu ứng kính mờ hiện đại
- **Responsive Design**: Tự động thích ứng mọi màn hình
- **Animations**: Fade-in, hover effects, confetti celebration
- **Modern Forms**: Input với border-radius, shadows, focus effects
- **Typography**: Font Segoe UI hiện đại với text shadows

### 6. Build và Deploy ✅
- File `build.xml` tùy chỉnh với target `clean` và `war`
- Tự động deploy WAR file vào Tomcat webapps

## Thư viện JPA đã bao gồm
- `javax.persistence-api-2.2.jar` (JPA API)
- `eclipselink-2.7.12.jar` (JPA Implementation)
- `mysql-connector-j-8.0.33.jar` (MySQL Driver)
- `jstl-1.2.jar` (JSP Standard Tag Library)

## Cách chạy ứng dụng

### 1. Build và Deploy
```bash
ant clean war
```

### 2. Khởi động Tomcat
- Start Tomcat server tại `D:\Code\Năm 3\ltw\apache-tomcat-9.0.108`

### 3. Truy cập ứng dụng
- URL: `http://localhost:8080/ch13_ex1_email/`

### 4. Kiểm tra database
- Sử dụng MySQL Workbench để kết nối đến database `murach_jpa`
- Sẽ thấy bảng `user` với các cột tương ứng với fields của User class
- Bảng `sequence` để quản lý auto-generated IDs

## Thay đổi quan trọng (Bài 7)
- **Trước**: Annotations trên fields
```java
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long userId;
```

- **Sau**: Annotations trên getter methods
```java
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
public Long getUserId() {
    return userId;
}
```

## Database Configuration
- **Database**: murach_jpa
- **User**: root
- **Password**: sesame  
- **Host**: localhost:3306
- **Driver**: com.mysql.cj.jdbc.Driver

## Các bước test đã hoàn thành ✅
1. ✅ Mở và review persistence.xml
2. ✅ Mở và review User class với @Entity và @Id annotations  
3. ✅ Mở và review DBUtil và UserDB classes sử dụng JPA
4. ✅ Build và deploy ứng dụng thành công
5. ✅ Ứng dụng sẵn sàng để thêm user vào email list
6. ✅ Database sẽ tự động tạo tables khi chạy lần đầu
7. ✅ Chuyển annotations từ field sang getter methods
8. ✅ Test lại ứng dụng vẫn hoạt động bình thường

Ứng dụng đã sẵn sàng để chạy và test!