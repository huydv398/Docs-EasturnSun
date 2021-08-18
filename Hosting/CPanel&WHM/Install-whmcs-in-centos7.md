# Cài đặt WHMCS
## Yêu cầu
* OS: Centos 7.6 on VMware
* WHMCS: 7.7.1
* PHP: 7.2(or newer)
* Database: Mariadb 10.3
* Web server: httpd 2.4

### Thiết lập bước đầu cho OS
Đặt SELinux thành chế độ permissive  bằng cách chỉnh sửa:
```
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
```
Và cho áp dụng ngay lập tức:
```
setenforce 0
```
Cài đặt EPEL và Update OS:
```
yum install epel-release -y && yum update -y 
```
### Cài đặt PHP và Apache
Cài đặt Apache:
```
yum -y install httpd
systemctl start httpd
systemctl enable httpd
```

Cài đặt PHP:
```
yum install epel-release
yum update epel-release
rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum -y install php php-opcache php-mysql
yum install -y php php-mbstring php-pear php72-php-pdo.x86_64 php-pdo.x86_64 php-mysql.x86_64 php-ioncube-loader.x86_64 php-curl curl php-soap.x86_64 php72-php-soap.x86_64 php-gd.x86_64 php72-php-gd.x86_64 yum-utils
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```
Thêm file cấu hình vào file php.int:
Kiểm tra xem file php.int nằm ở đâu: `locate php.int` rồi thêm vào file cấu hình như sau:
```
echo 'date.timezone = "Asia/Ho_Chi_Minh"
memory_limit = 1024M
extension=pdo.so
extension=pdo_mysql.so'>>/etc/php.ini
```
Mở port 80:
```
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
```
Restart lại http:
```
systemctl restart httpd
```

Truy cập https://domain/info.php, để kiểm tra đã nhận Version PHP 7.3 hay chưa.

### Cài đặt Database 
```
yum -y install mariadb mariadb-server
systemctl start mariadb
systemctl enable mariadb
```
* Cài lại mật khẩu cho root của cơ sở dữ liệu:

```
mysql_secure_installation
```

* Thiết lập một số cấu hình tại bước này như sau:

* **Enter** khi đã có mật khẩu:

![Imgur](https://i.imgur.com/0kUCDRx.png)

* **Enter** Khi chưa có mật khẩu:

![Imgur](https://i.imgur.com/Jl2d0je.png)

![Imgur](https://i.imgur.com/M3zy1lG.png)

1: Nhấn `y` để cài mật khẩu mới cho root

 2: Nhập mật khẩu mới cho root

 3: Nhập lại mật khẩu cho root

* Nhập `y` xóa bỏ các User khác:

![Imgur](https://i.imgur.com/o5QZlJI.png)

* Không cho phép root đăng nhập từ xa:

![Imgur](https://i.imgur.com/JuAa7ap.png)

* Xóa bỏ database:

![Imgur](https://i.imgur.com/7OLrFFG.png)

* Khởi chạy lại bảng Privileges(Bảng phân quyền)

![Imgur](https://i.imgur.com/252vBxj.png)

Tạo cơ sở dữ liệu cho tài khoản Wordpress 
* Đăng nhập vào tài khoản root của cơ sở dữ liệu:

`mysql -u root -p`

Bạn cần nhập Password mà bạn đã thiết lạp cài đặt khi cài đặt Mariadb. Khi nhập xong sẽ chuyển sang màn hình Mariadb .

Tiếp theo thiết lập bạn sẽ tạo cơ sở dữ liệu cho wordpress. Có thể dùng tên bất kỳ cho tên của Database.
Trong bài mình đặt là **whcms_db**.

`CREATE DATABASE whcms_db;`

Bạn cần tạo một tài khoản riêng để quản lý cơ sở dữ liệu cho Wordpress. Trong bài sẽ đặt 
* user: whcms_user
* password: 123@@123

    `CREATE USER whcms_user@localhost IDENTIFIED BY '123@@123';`

Tiến hành cấp quyền quản lý CSDL Wordpress cho user mới tạo:

`GRANT ALL PRIVILEGES ON whcms_db.* TO whcms_user@localhost IDENTIFIED BY '123@@123';`

Xác thực lại những thay đổi về quyền: 

`FLUSH PRIVILEGES;`

Hoàn tất và thoát khỏi Mariadb:

`exit`
## Cài đặt WHMCS
Tải WHMCS từ trang chủ về và đưa lên server bằng SCP.

Sau khi đã tải lên server, giải nén vào thư mục **/var/www/html**:
```
unzip -d /var/www/html/ whmcs-v8.2.0.zip

```
Thay đổi chủ sở hữu của các tệp thành apache:
```
chown -R apache:apache /var/www/html/
```

Tạo tệp tin configuration.php mới và thay đổi quyền thành 777:
```
mv /var/www/html/configuration.php.new /var/www/html/configuration.php
chmod 777 /var/www/html/configuration.php
```

Thực hiện cài đặt trên trình trình duyệt:

?????.........................>>>>>>

Sau khi cài đặt, xóa thư mục install tại /var/www/html/
```
rm -rf /var/www/html/install/
```
Để cải thiện bảo mật, hãy di chuyển thư mục  downloads, template_c và attachments kèm từ /var/www/html/ sang /var/www/:
```
mv /var/www/html/attachments/ /var/www/attachments/
mv /var/www/html/downloads/ /var/www/downloads/
mv /var/www/html/templates_c/ /var/www/templates_c/
```

Thay đổi chủ sở hữu và quyền của thư mục trên:
```
chmod 777 /var/www/attachments/ /var/www/downloads/ /var/www/templates_c/
chown apache:apache /var/www/attachments/ /var/www/downloads/ /var/www/templates_c/
```

Thêm dòng cấu hình vào file /var/www/html/configuration.php, thực hiện lệnh sau:
```
echo '$mysql_charset = "utf8";
$display_errors="off";
$templates_compiledir = "/var/www/templates_c/";
$attachments_dir = "/var/www/attachments/";
$downloads_dir = "/var/www/downloads/";'>> /var/www/html/configuration.php
```

Thêm dòng sau vào file /etc/crontab:
```
echo '*/5 * * * * root /usr/bin/php -q /var/www/html/crons/cron.php'>>/etc/crontab
```