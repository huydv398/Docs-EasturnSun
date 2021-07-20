# SMTP- Simple Mail Transfer Protocol
* SMTP cho phép doanh nghiệp và các tổ chức gửi và nhận mail một cách đơn giản và hiệu quả, ưu việt hẳn các loại mail miễn phí khác.
* Giao thức truyền tải thư đơn giản. Và giao thức này thực hiện nhiệm vụ chính là gửi mail còn việc nhận mail hay truy xuất dữ liệu maill server sẽ có giao thức IMAP hay POP3 đảm nhiệm.
* SMTP server : Là dịch vụ cho phép gửi mail với số lượng lớn, tốc độ nhanh mà không bị giới hạn như các hộp mail miễn phí của Gmail hoặc mail đi kèm hosting.
## Cài đặt và cấu hình SSMTP trên Linux gửi mail
SSMTP- Secure Simple Mail Tranfer Protocol: Là một sự lựa chọn cho sendmail để gửi thư trên Linux.
### Lấy thông tin thiết lập
Người dùng có thể lấy thông tin đầy đủ về thiết lập SMTP
* SMTP server: SMTP.gmail.com
* SMTP Username: Tên đầy đủ của tài khoản Gmail(Email address)
* SMTP Password: Mật khẩu của gmail
* SMTP port: 587(port default gg)
* TLS/SSL: required.

## Cài đặt
* Trên CentOS:
```
yum update
yum -y install ssmtp
```
* Trên Ubuntu:
```
apt-get update
apt-get -y install ssmtp mailutils
```

### Cấu hình 
File cấu hình SSMTP: /etc/ssmtp/ssmtp.conf:
```
#
# Config file for sSMTP sendmail
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
# root=postmaster
root=Yourmail@gmail.com

# The place where the mail goes. The actual machine name is required no
# MX records are consulted. Commonly mailhosts are named mail.domain.com
# mailhub=mail
mailhub=smtp.gmail.com:587

AuthUser=youremail@gmail.com
AuthPass=youremailpassword
UseTLS=YES
UseSTARTTLS=YES

# Where will the mail seem to come from?
#rewriteDomain=
rewriteDomain=gmail.com

# The full hostname
hostname=ssmtpServer

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
FromLineOverride=YES
---
Tại đây sử dụng Gmail.
```
### Tạo alias cho user local.

echo "
root:youremail@gmail.com:smtp.gmail.com:587
" >> /etc/ssmtp/revaliases

## Gửi mail
Cách 1 sử dụng lệnh:
```
ssmtp -v [Mail người nhận]
```
rồi nhập nội dung mail. kết thúc bằng crl+D
Cách 2: Sử dụng Echo
```
echo "Nội dung email" | ssmtp -v [Địa chỉ mail người nhận]
```
Thêm chủ đề:
```
{
    echo Subject: subject_email
    echo Nội dung email
} | ssmtp [Địa chỉ mail người nhận]
```
Cách 3: gửi nội dung từ file

Tạo file nội dung có dạng:
```
Subject: Subject email
Nội dung email
```

THực hiện lệnh để gửi mail:
```
ssmtp [Địa chỉ mail người nhận] < file
```